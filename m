Return-Path: <linux-arm-msm+bounces-42240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 406979F2133
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 23:21:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E4227A085E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 22:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20E6919007D;
	Sat, 14 Dec 2024 22:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dVIqkSuo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD6E29CEF
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Dec 2024 22:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734214886; cv=none; b=RvNXJ/f3+KBeOZxIHatJ1P3H2kTnC0ZbHchvFNNFfRRP83YY/VawC+BhJjttqDE60WI5WVNhjn2lg/au6D0fmcBnTaYcosWSUa6Jr0dKP9fWuSpyvnM/Dk9ptexf+/3B8sckrMyi+YR39tt8ccWkrEQIGgmqIGOwQCS7TGQnAwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734214886; c=relaxed/simple;
	bh=zBR29A2+17C1XYhR/tvnJ2/oGkrDimwPMnWUGk3vCH8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H7zE+ARQZ+cPDVjaJWadC73pWG0tSgMIlBG183gt9CtR/Zr2oiUL5hWrDLrcOfIn7Tg/Boh7ozzoGFa4tae7q1XVi9NG3VX9c2TdW5qJrW+tD2WDJT9gBxP00bgF94/iL/HROlTr6Y/nLFilVGTZFY47wQaZgsR9WY4fKCWk5/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dVIqkSuo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BEMGsnd005605
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Dec 2024 22:21:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XFgyAxvNra4DPanTeeFOl2uaHZeaHsP5CLLrDFBo6ho=; b=dVIqkSuoN1p8Gj6V
	Htso3DGgxvvZTckg+iGOn8Te8TmY8zi0Ul8RuMhXD5aayWi1InUIpBvgskv0+iU6
	N7v6KmYXwUHVnUMepOG8u/jj+ZwbpQFm4JgAGp6uqdF5OhxD5doGg21U3qg6lcYF
	eaw8M8kNAsnzGEJ6KinPnLkGgAJ+FyfwnGyNdWuOTlV8oTz6DOVMFpohEa2qbVP2
	3HsrvY85BxRJBrgpSfAYD5DJ2qlMA4d9Ef4pdc9d10D3hDLzl7912ODkEXIthCAB
	x3pU84P+05WHH4SjMujXU8E2u91BpIHNKGIc8vqN03LuxdfZYaDVEgH9X9YEilbL
	PGNbTA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43h30x13dd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Dec 2024 22:21:22 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d887d2f283so7669176d6.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Dec 2024 14:21:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734214879; x=1734819679;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XFgyAxvNra4DPanTeeFOl2uaHZeaHsP5CLLrDFBo6ho=;
        b=YS1Zq+ptklgMBm2qZ9UO4Krz0MZ6p7Pp6jCBi+fehuyFpPTqDtnH1oCmqVNm3ldiKR
         oEDQs1Nrr1MgX6XqFSasDJT+lSLzoDzcuTcb3kEaemxLIdimWRnNfc9FPZQ2EF40Ohlw
         6e6KtrIxHFd3hv9UNYDDDeRHSGzjQ0o+Xy3fT/ihvceJU/3mWR9QX8Rhr6aynaBR9KqY
         0LQ4UkKqEA0becpjm5zAQK72ePw+lvFLHHz/SOIifeLnlApUuO3jTgkKk9Fnl4X8pluE
         ua3RGyaTAbsWE0Ca+/8kQX+D2pQ7XEkN8xi1B84LxyLYBE/7aaBuObv29KGrXUkGexMB
         71Tg==
X-Forwarded-Encrypted: i=1; AJvYcCXsKkIWDmilUs9xzBkkw02Jwbz7QzGTMlK8cLo5X4TsJLrnHEJf57X60Vz81EVVv9pfzc2S0XIVaIWPyPR9@vger.kernel.org
X-Gm-Message-State: AOJu0Ywauw32SjBUZKtVOQXnDU/6kYVv0/W+NoW7JvfgHx0Umn5tZplb
	tys6yvMDDlFLOiwsjMjH2Mz+iyjRiZKCB43+PEFiEDXwKDa2lL4iMcGTrxBKsIuaWBe92m2p/CI
	g/WLSCwHCwsZUfu1SzOwJEaRXXJ4ssPe9+i6pWixltZarcEUWjHN2ZwmnVbH05W7o
X-Gm-Gg: ASbGncvMgV98i6mByuz3TFOACkinammO7iW7X+xUIxBEsdePk5XoTjt9HOaQzIo/XQA
	xLzXYcJ9AuQVHj2llredhDA6+JXLJMHBJJG6ssD0hcQa6dQr9FKbrNMxGJ4Nbmnj24F24RvSGtv
	31LyZM+tpFQ5x8DPBUFCg8SYLoqj7qIFGnvR6qF3Rac6CJ3VI/SRMXWclh/Ot8G0k9j/PL04joC
	+TYHOpSC6Ue1A0Yp0pRyzRAq109bi+riul3GyeteDyP5h7XOORttIfrR7ScK3DE/OCK3RaIYNvE
	DbshX6rC9e9x34g0Hvp/009ktM6Fog7PpG4=
X-Received: by 2002:a05:622a:190f:b0:467:5eaf:7d22 with SMTP id d75a77b69052e-467a57f6742mr48219481cf.10.1734214879308;
        Sat, 14 Dec 2024 14:21:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGbbI0TFGIG9MLv/VjODWxI/PrwN18PfiNaH3L6SpMQngv2rPDHw6DYFqdLdXrWXvc+AGYizA==
X-Received: by 2002:a05:622a:190f:b0:467:5eaf:7d22 with SMTP id d75a77b69052e-467a57f6742mr48219191cf.10.1734214878829;
        Sat, 14 Dec 2024 14:21:18 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d652ae124asm1383487a12.40.2024.12.14.14.21.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Dec 2024 14:21:17 -0800 (PST)
Message-ID: <d09097da-a07a-4dfa-9c0d-567b329b64ac@oss.qualcomm.com>
Date: Sat, 14 Dec 2024 23:21:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/5] Coresight: Add Coresight TMC Control Unit driver
To: Jie Gan <quic_jiegan@quicinc.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Tingwei Zhang <quic_tingweiz@quicinc.com>,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20241210031545.3468561-1-quic_jiegan@quicinc.com>
 <20241210031545.3468561-5-quic_jiegan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241210031545.3468561-5-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ltgKZf3LFYt4aYyNfcPjHYS-jQhQOfPG
X-Proofpoint-GUID: ltgKZf3LFYt4aYyNfcPjHYS-jQhQOfPG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 mlxlogscore=996 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412140185

On 10.12.2024 4:15 AM, Jie Gan wrote:
> The Coresight TMC Control Unit hosts miscellaneous configuration registers
> which control various features related to TMC ETR sink.
> 
> Based on the trace ID, which is programmed in the related CTCU ATID
> register of a specific ETR, trace data with that trace ID gets into
> the ETR buffer, while other trace data gets dropped.
> 
> Enabling source device sets one bit of the ATID register based on
> source device's trace ID.
> Disabling source device resets the bit according to the source
> device's trace ID.
> 
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---

[...]

> +static int __ctcu_set_etr_traceid(struct coresight_device *csdev,
> +				  u8 traceid,
> +				  int port_num,
> +				  bool enable)
> +{
> +	uint32_t atid_offset;
> +	struct ctcu_drvdata *drvdata;
> +	unsigned long flags;
> +	uint32_t reg_offset;
> +	int bit;
> +	uint32_t val;
> +
> +	if (!IS_VALID_CS_TRACE_ID(traceid) || port_num < 0)
> +		return -EINVAL;
> +
> +	drvdata = dev_get_drvdata(csdev->dev.parent);
> +	if (IS_ERR_OR_NULL(drvdata))
> +		return -EINVAL;
> +
> +	atid_offset = drvdata->atid_offset[port_num];
> +	if (atid_offset == 0)
> +		return -EINVAL;
> +
> +	spin_lock_irqsave(&drvdata->spin_lock, flags);

guard(raw_spinlock_irqsave)(&drvdata->spin_lock);

and drop the unlocks

> +	CS_UNLOCK(drvdata->base);
> +
> +	reg_offset = CTCU_ATID_REG_OFFSET(traceid, atid_offset);
> +	bit = CTCU_ATID_REG_BIT(traceid);
> +	if (reg_offset - atid_offset >= CTCU_ATID_REG_SIZE ||
> +	    bit >= CORESIGHT_TRACE_IDS_MAX) {
> +		CS_LOCK(drvdata);
> +		spin_unlock_irqrestore(&drvdata->spin_lock, flags);
> +		return -EINVAL;
> +	}
> +
> +	val = ctcu_readl(drvdata, reg_offset);
> +	if (enable)
> +		val = val | BIT(bit);
> +	else
> +		val = val & ~BIT(bit);
> +	ctcu_writel(drvdata, val, reg_offset);
> +
> +	CS_LOCK(drvdata->base);
> +	spin_unlock_irqrestore(&drvdata->spin_lock, flags);
> +
> +	return 0;
> +}
> +
> +static int ctcu_get_active_port(struct coresight_device *sink, struct coresight_device *helper)
> +{
> +	int port, i;
> +
> +	for (i = 0; i < sink->pdata->nr_outconns; ++i) {
> +		if (sink->pdata->out_conns[i]->dest_dev) {
> +			port = sink->pdata->out_conns[i]->dest_port;
> +			return port;

Return sink->....

> +		}
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +/*
> + * ctcu_set_etr_traceid: Retrieve the ATID offset and trace ID.
> + *
> + * Returns 0 indicates success. None-zero result means failure.
> + */
> +static int ctcu_set_etr_traceid(struct coresight_device *csdev,
> +				struct cs_sink_data *sink_data,
> +				bool enable)
> +{
> +	int port_num;
> +
> +	if (!IS_VALID_CS_TRACE_ID(sink_data->traceid) ||
> +	    (csdev == NULL) ||

I'm not sure this can be null by the time it reaches this function

> +	    (sink_data->sink == NULL)) {
> +		dev_dbg(&csdev->dev, "Invalid parameters\n");

dev_err?

> +		return -EINVAL;
> +	}
> +
> +	port_num = ctcu_get_active_port(sink_data->sink, csdev);
> +	if (port_num < 0)
> +		return -EINVAL;
> +
> +	dev_dbg(&csdev->dev, "traceid is %d\n", sink_data->traceid);
> +
> +	return __ctcu_set_etr_traceid(csdev, sink_data->traceid, port_num, enable);
> +}
> +
> +static int ctcu_enable(struct coresight_device *csdev, enum cs_mode mode,
> +		       void *data)
> +{
> +	int ret = 0;

Unnecessary initialization (you instantly overwrite it), also below

> +	struct cs_sink_data *sink_data = (struct cs_sink_data *)data;
> +
> +	ret = ctcu_set_etr_traceid(csdev, sink_data, true);
> +	if (ret)
> +		dev_dbg(&csdev->dev, "enable data filter failed\n");

Since the this function returns an int, maybe return ctcu_set_etr_traceid()
and let the upper layer throw an error (also for some other functions in this
file)

> +
> +	return 0;
> +}
> +
> +static int ctcu_disable(struct coresight_device *csdev, void *data)
> +{> +	int ret = 0;
> +	struct cs_sink_data *sink_data = (struct cs_sink_data *)data;
> +
> +	ret = ctcu_set_etr_traceid(csdev, sink_data, false);
> +	if (ret)
> +		dev_dbg(&csdev->dev, "disable data filter failed\n");
> +
> +	return 0;
> +}

[...]

>  enum coresight_dev_subtype_helper {
>  	CORESIGHT_DEV_SUBTYPE_HELPER_CATU,
> -	CORESIGHT_DEV_SUBTYPE_HELPER_ECT_CTI
> +	CORESIGHT_DEV_SUBTYPE_HELPER_ECT_CTI,
> +	CORESIGHT_DEV_SUBTYPE_HELPER_CTCU

Please add a comma here too, so that future additions will be
less noisy

