Return-Path: <linux-arm-msm+bounces-80071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D278C2AD5A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 10:47:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4EBD44EB003
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 09:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C2EA2F83D2;
	Mon,  3 Nov 2025 09:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XELXC3Xn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WGZhDLV6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E38E2F3C11
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 09:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762163243; cv=none; b=GqzeCnLcHGN/LZcMDNwYjy4WNy1NnYUOMU1lTsddNscwOsd5Uyc/yJVRI82N3tiLfMnJECTIYM0pluIzDYA8OagnXXXgf9t+cdYJerGZ0Z7Xt684V8mV7tBBggMzy9DoZ+a8uCOYau3vIbnbzY+EhZ9x9B5/eS+okOVvQeCyPmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762163243; c=relaxed/simple;
	bh=6ZUpgtOH5YH/KbSmlniCxlddkflCkVLwHtZiLFhzwmM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BztRLjKBUTNMz0HbmLiFBpot6xB8wRsv3OZe2vJvAwpSC+UfmSX1nhMJHQr2+SNTDpooo4N0lCsFF0afumMA9jy7RHQZXSUclvG0LgwHtZGtVvoyLS/fv+SmcLb1+iPW7icbd6RmkrgnAZrlWb2dddJEkOznwu5jwcVSMG9OEQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XELXC3Xn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WGZhDLV6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A33DgIl1941400
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Nov 2025 09:47:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C6WkG3y8CxEMz4mNCVgHig9ILT00YvV3F7wuV3vWlIQ=; b=XELXC3Xno15ggkCz
	zUf7rxqQhD228HH7OkQrLcw0/zp8kXnaqY0nEDjAosqp6QZXzh6rgIgMimoJDHks
	E0+rERb8lpalH6A8KcwTBnBw5SQvJt2mNinrhNLuD0/T4JZy1qGbtZecetrvlIOA
	4Fw6FWSzgmkDzAzP54wVPX2NMtRIk0W+lUlWV0GXv8jNHdQQ13+KJhPKV2HnkjZS
	7YuBpLGUVjUZq63NPULolIrcQ/GDKu8km1BRVTCEwCOiqTDjzG/HjynPmqP6zOco
	IyTqNCpsLtE7T4YgqSQFBDPE6y2YEq7Jy3Xsxg2yFzdogwdRidpOB5mgV44eNUfO
	y9tWAg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6m9w917q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 09:47:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8a4f7e885c9so149217785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 01:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762163238; x=1762768038; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C6WkG3y8CxEMz4mNCVgHig9ILT00YvV3F7wuV3vWlIQ=;
        b=WGZhDLV6dWht8Y+yGyyn8fWFI/4bBRJDpueREtf4Y+m5je9x6nEGg+fKEMpImKq+UZ
         yLnY/lmir7W1kvPmIRosiBW04uOnSDCpqxBVHD7945BQ2j77gJerHS9m966MoVeDr9uo
         ZiTWjDP/Imn8CpiNQsXg/ZBoIc1uvPgxERrem8fbPIuBzUzmz75PluVwta9DsXWkdnuI
         8sBVCfE41cHjfiYZ6RDqxCRfg3K42uWUKRb6FCra6oW1T6MmmQ7z41BtBl1kBK53NgiT
         D+eE0lgu5c0UJs6C24DZfhm1E9IGVlQaA/S+fJQh4Y6iQgFTLgVTINnqULdG68u9O711
         c4dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762163238; x=1762768038;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C6WkG3y8CxEMz4mNCVgHig9ILT00YvV3F7wuV3vWlIQ=;
        b=bxVwXFJUqCEoFDw5bhztzMW5BlaY/CeLtJlqj4x0vZEuYaHuamPyBFNpV2/GRcVQTo
         E2hK6tt2subFUcIpXRmEghFrxCJbCE0/8Q7CjL4Ng8CF4fakqILmw62w8rGaTmoH4otO
         0EqH8v9+L2VlfpbLo1PnFxz6Xghz2aIv2c8OQfR4n/7D+teg/nI3AH9ya/gs6ZwUXUtf
         3KUcVie2zaS6LpRW1x+M7LJsCkdv/C1hnFapn2Bavhl+ctm1uMuCKRpQ+ZFLiS6Sl9r0
         FzhnBC5HhUyrxkXl/cmDwuNHuKCbIqBSLTQ5xmlYmah4aOp9y5R6BXJY+Dfd8JI7DCnT
         DjkQ==
X-Gm-Message-State: AOJu0Ywh9E/muzSwfpIav25iNU3rsxtfT70cfk4Ia3uDIYLFOelop8C6
	rEuF1Tg34R0PemfLR22OxmuXOp+4zqRtMuMnmxRIw4LhCgcR8BApCIhSZT7qhP3J1uHpw0AkLCT
	s6jHWRTj3wyi4Cyy76r6O9HEBK1O2Vvx5Hk099kdKMJ8SLMzZn/sOmE5oX4Nnq1CCutknI5OLwP
	Sv
X-Gm-Gg: ASbGncv9XuDYcOz9T9tuTVA3OGpQSCj2AH4RLFnla96uJ3TmfNrOaX/Epwf4TiwhruZ
	78swWa7f8TAsPArxnfygVow1gHlFC9KTimBu+XLGGvS+MpFOzArrJMdZUbH4R8wXGivLYnqNCFt
	DN3UfIasSTbpvtyMYlV0DtmYLq9LvKVnptyDyxrYhT1faFKChGUcWvAY1bLFBpvEyQzyk6klw/V
	Yi8nI9zc1iRfNzn3rTyYPFFRA4FSy/P2Po6VJr59gX29SthUfGyW+u1aUjQJRZ+Y/5tNPK84Mk0
	kHp6il5uN0dfIgetHJTVmAH3oMSA+irM2xFGDAvkSgbP20UHzMi5UES5TQhkqtULKc9I4nL2Vjv
	XiVck1LoiGHOMTh+5G63pOsK9UvWWiKC/FwX8zJNLX4abeUCwZYi+Wy6Z
X-Received: by 2002:a05:6214:1bcc:b0:830:4f29:a648 with SMTP id 6a1803df08f44-8802f42fe68mr99288326d6.6.1762163237791;
        Mon, 03 Nov 2025 01:47:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8Me7GCcBS/O6WoNVVBQDLilh4+4Stvq8TsTyYlEkYaH4vMagiwC6s37Agz079dnrf0GO1cQ==
X-Received: by 2002:a05:6214:1bcc:b0:830:4f29:a648 with SMTP id 6a1803df08f44-8802f42fe68mr99288166d6.6.1762163237019;
        Mon, 03 Nov 2025 01:47:17 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6407b392d5dsm9361015a12.15.2025.11.03.01.47.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 01:47:16 -0800 (PST)
Message-ID: <02cc6e0c-5145-49d2-abea-fe4a951ff518@oss.qualcomm.com>
Date: Mon, 3 Nov 2025 10:47:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/25] interconnect: qcom: icc-rpmh: convert link_nodes
 to dynamic array
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251031-rework-icc-v3-0-0575304c9624@oss.qualcomm.com>
 <20251031-rework-icc-v3-1-0575304c9624@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251031-rework-icc-v3-1-0575304c9624@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P7Q3RyAu c=1 sm=1 tr=0 ts=69087a26 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pb1RGRiFvkXHE0IyWJsA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: PPgqQRC7bcyAnQ-kIq_rT3wOWGnbukOW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDA4OCBTYWx0ZWRfX1jkXt93Eqd7n
 LGicT15aQ9DNY3geff8mNWGmpymOxlvehIl1ZZh/TKEBkLpiWYJi1XeFWDSZPIA0GJ6CezMXwhJ
 IJTRd4L8uCZbpjyUe0ULtxFkxKwu6AHpENitWpdl14mjCbJMisxTb+MP94Gz4GB3gY7z5X+aWFZ
 ElogVV92+Q773F4M9kWecaV0tyh986G4icwJX9yXQbq/tF4vOWYd21Yx4qTVtkL+qXXcLmoS3Kt
 /xo4ppBkpSQWvD8BzBMufYyP+YfOrl9LfHuXfB99eaxcs9axREgLA3jzAWqhYIHu+IvpWnRFg6m
 s3IcLTzsBKcgeWJgT6IuGMuKejU101yNPBXhspOPTcPLscLtcdoi6hKT5OxTZjvXVJ1P6/IEPoA
 NHdeu+b5ITd34FFeOA/zHsmEEs7AoQ==
X-Proofpoint-ORIG-GUID: PPgqQRC7bcyAnQ-kIq_rT3wOWGnbukOW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030088

On 10/31/25 3:45 PM, Dmitry Baryshkov wrote:
> Declaring link_nodes as a double-pointer results in a syntax sugar in
> the interconnect driver to typecast the array. Change the type of
> link_nodes field to the array to remove the need for the extra typecast.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

>  static struct qcom_icc_bcm bcm_acv = {
> diff --git a/drivers/interconnect/qcom/icc-rpmh.h b/drivers/interconnect/qcom/icc-rpmh.h
> index 307f48412563690049e944907bd80500f263f738..b72939cceba38e92154f6af5a93149337fa13479 100644
> --- a/drivers/interconnect/qcom/icc-rpmh.h
> +++ b/drivers/interconnect/qcom/icc-rpmh.h
> @@ -98,7 +98,6 @@ struct qcom_icc_node {
>  	const char *name;
>  	u16 links[MAX_LINKS];
>  	u16 id;
> -	struct qcom_icc_node **link_nodes;
>  	struct icc_node *node;
>  	u16 num_links;
>  	u16 channels;
> @@ -108,6 +107,7 @@ struct qcom_icc_node {
>  	struct qcom_icc_bcm *bcms[MAX_BCM_PER_NODE];
>  	size_t num_bcms;
>  	const struct qcom_icc_qosbox *qosbox;
> +	struct qcom_icc_node *link_nodes[];

__counted_by(num_links);

Konrad

