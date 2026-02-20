Return-Path: <linux-arm-msm+bounces-93478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YH8eOWYvmGkzCQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 10:54:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4EF1667DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 10:54:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA4B7308DBAF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 09:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F06D432D7F1;
	Fri, 20 Feb 2026 09:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IFhAzCvg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ae1VPCc0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CC232E13A
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 09:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771581130; cv=none; b=C362TKnF771lkGGDOLr+rfsEsU/iDF+KHe4J0PQjXZyoSOrLY7BnWJOt3cFrQeo6lZ/mXyMcUH6Thp8Bpj/g9PMF6bGfQu372v/y0ybmRwOU9oBnmOC1XZ4RPcKws0w68tPs8wimqkFPJTYYrd9najon6Jwv8V+5NFLSOXsJWrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771581130; c=relaxed/simple;
	bh=FowdKhKXbyjVfW9AkAYjblRRaJ2Zozif1PAqo+RUePM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EQug3tJSIkG7O1YRgr8P9lx+pjQCTnnqlEFpT97W7TYWgDy9mAyt3IDwnYGf+BM30dz03S335452ICWf5lVAvIlm9nMwejLd6QQ/EDau+Zz5h8fb70c0YUTe3fONwZ5fDOWDOyNDXSk/ZsRB6S48DOH8Lc49dbvceVuLZO/jtl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IFhAzCvg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ae1VPCc0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K5Rral1851333
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 09:52:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G8NbSIkdAuG83lqu5TIDUnU4FuLiZ05N8tMIJQiF8/I=; b=IFhAzCvgdOlLliUH
	H/zprfA17VAM+fV9geWgjAGRtSRRFv0QgeusOKKLHkDY6h9Fs74tWqOrgb+YwS8W
	m2sXQX5iRxCPgYfCK3ar+/1TcFKrL9J9BHJmfH4N8wfpdKNVfVaXfCESj98erSdE
	6MbZcyktjT5poRPUqSR4e6tKqWo5l6p1mOSBqDIhoQpVIDsp9gyrpU9VbkF1uIXx
	yMqlp7sIGo7N95IhH16Ytd9/o7BS4fymmyGYY2d/e54Po6mn68uZTitU4A/oUeeA
	KpvWwG/JP8r/rhhrT3AQRiqXIIt/CTAnCVCaf5giFnM2VW79eFjUc54zjOiZ2NOe
	/X/myg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ce9ng9rkq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 09:52:08 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8954a05270eso15437946d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 01:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771581128; x=1772185928; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G8NbSIkdAuG83lqu5TIDUnU4FuLiZ05N8tMIJQiF8/I=;
        b=ae1VPCc0LjuKi0TQETXCmRRyZWfTgG26SHF+zMYnIvJnlcVXSOCdCqsM74RDC0y98k
         013Q0C03dXoON9g/cdBRhCCh3rZDBOuZ+KfhKQ89VW+m0BW4k+/6TGkx3W+wk8/jAfbX
         Uz2Y/IzE8FUNw1NpdTBEyNPQfJZdIvKSdH8mnvHt0v+pqwORcVQBoOBulWeRUzD4pN/l
         78W1zj8gQws9XyWT9dYtaogEfLBTYGepCfeZDdQUx13aymPzg5quwOeYD6TgrA3lZz4S
         2g4o45jKW7kAZr1Pv2N3khc8Ag+H4j5uSIFmd6+ZjUJ1ZVE4hBNmW9cgvxQMm0MHDYnB
         km+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771581128; x=1772185928;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G8NbSIkdAuG83lqu5TIDUnU4FuLiZ05N8tMIJQiF8/I=;
        b=OkNAxQBzH7WLV0sU9PDJb2hNsB6sTvpCBcyMAw7Fcv0R/w1l4LpiIr3+Dcg6E4ylZd
         fBR+em3/5B0uWUug9RneKod6ZnDin448+j+MUIv8M8A01scEVXuD0hqK5CoISKHgAX1M
         AK5mAa4tE4iazHBlfFCGGVBGU2PNctHO2vARpnav8TQw2vg4y9jFm3MNFvTPqQ7LKx/I
         dpSjhbiTKdFy+2HkbSu/cNOvDymgp/Ozd6zaXrwF01mzhUPaVrUhwekv3s2K/fjgWkcY
         apnLGr6ch5pflIdcwsuMf6yAa7M9CDo4Gfxk4ByskkXquc5C4/95wME8EADM6SJiz3EJ
         HDkA==
X-Forwarded-Encrypted: i=1; AJvYcCUpsZGDt9sYK+19yFBt9dq1P/v6KZjcSTe2F+BxMebdSCwsOz9ta+z2dRqkVAy12hWg+OIbGpVDfhwUaCUe@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy2l52xbVmofk+tJwaRjBoecZh28I0KcWyOE8CKTIutt/EMa0t
	eYvuJWsVS+0lb/+omvk4E/Ev0EhH7XUZFqvNlT64+cGX81ezycOI9oScmiJq9FG3N2b9NdBvUOq
	bowM8CE8WFksx1szMy3T7jQYJlR9mnnPQ6eo9GSKc1YpT+PYVkkkSPho21EuinQXTkkjS
X-Gm-Gg: AZuq6aJ900xw6XIDEU6rKDl4dSfsWzEMaTmWujz33MWKw2LQvh4OmT5wofcqN7nXGNI
	UxVaAq1Ihmlr7Td2vo8UbLcE14Q4t01xxykh5hJwpvebwLOoQj02Mnj8/bYOg3ZojCb0TXTciCZ
	y0YDpu4iYjU4j4w0SdvKuTKKS8OlCJdZd9HqhiML/NO1S+AosvQRlSldcMd4PiNfr4j2p99c5Uv
	vHFHhGFItsqaZ/rZ0jjGalI0s/UWjc/pSLBXHnpFzE8RMLxssFTrDNiVy8pW91banvWxcU9CkkF
	aexZWp1grWlqwYZ7xoP6A2ZR9RFSUV0rg5PTQmpemMyBdhkX7SuFh0WKVE4lnwB++MM+yVsotT9
	66OTmfCmBgxabSmdb3lBT9CtZweVaj7Gkrm6ptkNrSYx6QdjCrP7tr8TYquAmmHXfPlxgXf3j4i
	DgPSM=
X-Received: by 2002:a05:6214:6014:b0:894:9d67:7329 with SMTP id 6a1803df08f44-897346fe806mr239456726d6.2.1771581127803;
        Fri, 20 Feb 2026 01:52:07 -0800 (PST)
X-Received: by 2002:a05:6214:6014:b0:894:9d67:7329 with SMTP id 6a1803df08f44-897346fe806mr239456636d6.2.1771581127452;
        Fri, 20 Feb 2026 01:52:07 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc73f7b8asm658082366b.27.2026.02.20.01.52.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 01:52:06 -0800 (PST)
Message-ID: <ab5725df-8454-4e3d-8806-a711ef0e6a42@oss.qualcomm.com>
Date: Fri, 20 Feb 2026 10:52:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] crypto: qce - Add runtime PM and interconnect
 bandwidth scaling support
To: quic_utiwari@quicinc.com, herbert@gondor.apana.org.au,
        thara.gopinath@gmail.com, davem@davemloft.net
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_neersoni@quicinc.com
References: <20260220072818.2921517-1-quic_utiwari@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260220072818.2921517-1-quic_utiwari@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA4NiBTYWx0ZWRfX9CuVPhQfiROq
 riZpQweZDy7arC/9VM0Ib0csSNEtRS8VRpK8kIX7Ui3lr0tBH/kaua/3a4aWvrbL3HlW7ovWljp
 Im6Wcxdz0iuQUQtvPJ+tHL1Tu1Ycs75BdBLmnzyiJyP1KzHiTU2Yaq8AJwOEYPP8RnWGZyAOCi+
 q2lq/+CeJtl3+5YydmDNowjffhMcLuyQJffHApz4/enFFCOz/hjWur7oe3i18jZvpKsmngfnmSV
 pZLTwYqNG+z53kEv46KUbo1S8PvcA2cZGqxIw3JDcXWmqgK6vtfFvNv47dGmbvvFl1vd9FJ+3nC
 wVzOdVaFY3fE1ONf/yG4hiIeIXDskJ203/jgeLPNeddXv+MmHjuZWdUDDqIn98GMDgFU7Ysi1ZP
 wh99t11cSJUDBJf+j0kw7lgqEt3LEBGYkhgYg0k4G1Ah0L5yUJ1OSIwbg4mL3ZL3qlCPoPrVVnM
 CTqOcCgObIKm8LFDfeQ==
X-Proofpoint-ORIG-GUID: kXvG-YKqKVV2z3j4v_FNQ09xeArwHpWI
X-Authority-Analysis: v=2.4 cv=Sbj6t/Ru c=1 sm=1 tr=0 ts=69982ec8 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=COk6AnOGAAAA:8 a=KIb8oVNHrCvuKONrHFUA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: kXvG-YKqKVV2z3j4v_FNQ09xeArwHpWI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-20_01,2026-02-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602200086
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93478-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[quicinc.com,gondor.apana.org.au,gmail.com,davemloft.net];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4D4EF1667DC
X-Rspamd-Action: no action

On 2/20/26 8:28 AM, quic_utiwari@quicinc.com wrote:
> From: Udit Tiwari <quic_utiwari@quicinc.com>
> 
> The Qualcomm Crypto Engine (QCE) driver currently lacks support for
> runtime power management (PM) and interconnect bandwidth control.
> As a result, the hardware remains fully powered and clocks stay
> enabled even when the device is idle. Additionally, static
> interconnect bandwidth votes are held indefinitely, preventing the
> system from reclaiming unused bandwidth.
> 
> Address this by enabling runtime PM and dynamic interconnect
> bandwidth scaling to allow the system to suspend the device when idle
> and scale interconnect usage based on actual demand. Improve overall
> system efficiency by reducing power usage and optimizing interconnect
> resource allocation.

[...]


> +static int __maybe_unused qce_runtime_suspend(struct device *dev)

I think you should be able to drop __maybe_unused if you drop the
SET_ prefix in pm_ops and add a pm_ptr() around &qce_crypto_pm_ops in
the assignment at the end

> +{
> +	struct qce_device *qce = dev_get_drvdata(dev);
> +
> +	icc_disable(qce->mem_path);

icc_disable() can also fail, since under the hood it's an icc_set(path, 0, 0),
please check its retval

> +
> +	return pm_clk_suspend(dev);
> +}
> +
> +static int __maybe_unused qce_runtime_resume(struct device *dev)
> +{
> +	struct qce_device *qce = dev_get_drvdata(dev);
> +	int ret = 0;

No need to initialize it here, as you overwrite this zero immediately
a line below anyway

> +
> +	ret = pm_clk_resume(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = icc_set_bw(qce->mem_path, QCE_DEFAULT_MEM_BANDWIDTH, QCE_DEFAULT_MEM_BANDWIDTH);
> +	if (ret)
> +		goto err_icc;

Normally I think bus votes are cast before clock re-enables to make sure
the hw doesn't try to access a disabled bus path

Konrad

> +
> +	return 0;
> +
> +err_icc:
> +	pm_clk_suspend(dev);
> +	return ret;
> +}
> +
> +static const struct dev_pm_ops qce_crypto_pm_ops = {
> +	SET_RUNTIME_PM_OPS(qce_runtime_suspend, qce_runtime_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
> +};
> +
>  static const struct of_device_id qce_crypto_of_match[] = {
>  	{ .compatible = "qcom,crypto-v5.1", },
>  	{ .compatible = "qcom,crypto-v5.4", },
> @@ -261,6 +323,7 @@ static struct platform_driver qce_crypto_driver = {
>  	.driver = {
>  		.name = KBUILD_MODNAME,
>  		.of_match_table = qce_crypto_of_match,
> +		.pm = &qce_crypto_pm_ops,
>  	},
>  };
>  module_platform_driver(qce_crypto_driver);

