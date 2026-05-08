Return-Path: <linux-arm-msm+bounces-106690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OABNEdbp/WkPkgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 15:49:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A934F752B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 15:49:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B5B530A2B5B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 13:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A35F5377556;
	Fri,  8 May 2026 13:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="op5jTyhE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="amnqz/6D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09043382DA
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 13:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778247664; cv=none; b=MxO82TzVR4rx+F50rdYBb6EsEKFjs+onvOHAttzVMoCpgNBSy/V5pIEBppX5wX4vNeNTRTqaQVzlx2f/Mf02pnjHB5UgQaqTppYM6DG1UdcdmTaAXqK0MCIzwNqs2r4KUSVKD4P30BYLMaObMCZ2D1nWhqZQ1cFe+kGZYdBk8No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778247664; c=relaxed/simple;
	bh=GsrsjJfrmd1hi8mZlxFpPo0t8Qi+/KDd3IEbRtHDkF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WesNzAcM9bMjQVgxFjF0Alva/3ZNA9PPV/ACgEsI+gc1Yrp46U6gn7MpBDBixp6SOl3qTN98xRgeznITRouim2m3qIFabhZZidgWEhqjdCwOiTm0eHAS0Iv0o7FTFaRPMq1fLSOhkOLJIf1DnsyMS51zBS6H/y7igMqE28/3A+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=op5jTyhE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=amnqz/6D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648D9u2W3891021
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 13:41:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ew1QykUYMfqGkPhQAGD7yJTCSOwC3LlUxyKWVUGR5Q4=; b=op5jTyhE13GTQYNh
	1MOtVe3Un2yeycXmJ/2DQEIdlc/8mC4UYJ2cBDPBuwpfZ8lHTqLkIIQB66p/qzBA
	sFTfKqkRXDec8uOTdilorJMQXQcyuHTHWae14oC1I5vnqjcuGAzeq3xOpmO+OduX
	GNcIdBeuauOve18aaCjSJ9wiOsOWDRqWjg14VuRmYMxgiCBAjb+A5/TAx3DGRnsY
	0d0+02oy+cvZudRYRtq1Pe2zuSwAxAHZrNj/wrI/PSQA3oUdb72x9rdnlKWkcY31
	qFC+w7N0YJ6KXXm0zFe87AgOuHihon0JuOu0SG8EBQjGbAQ5PCDUTiLdQrtBuBNM
	h2WIXw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1gfqr5gf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 13:41:01 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95192ee0b2bso118931241.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 06:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778247660; x=1778852460; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ew1QykUYMfqGkPhQAGD7yJTCSOwC3LlUxyKWVUGR5Q4=;
        b=amnqz/6DEKcw5uRNryOKIZWOUHMLsrIHky3/kxEnxjRV/sZ6JfwoRVNqPq/nmTV+hn
         k7dPXwSNmROHwmNMDWKX2iu3r3tPdiG6GnWlwSnXeaKMLiCBs1mxK2B4nIQQmDWHA9Yn
         /KtpQbeQ3o3x/DK7spDTJQFyTElzU0oc6imbRx3tFHZnCG/gdbwCF96faS+Pn9ZHjiDc
         Gx7dx9z6Db9pbQLKCN8ajg94IobK0u724DoZMljBlYI48s7NDCFJ7BInSyoETmifc3CC
         Y3kXJTPYLUo5gm4DKd9xEtFhntX5fgfHc2l9Glas4/JahsSuezjujLL5NC1ZZ+jYULPM
         n+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778247660; x=1778852460;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ew1QykUYMfqGkPhQAGD7yJTCSOwC3LlUxyKWVUGR5Q4=;
        b=Vbvv5srS26PlweAAtmecly6HA6ahrFqOt3SOGf7iegIVkXG5kF7lB04DqYJWA+j5CC
         p2qKnL54e9dtrmNMS3LFSRKkh3DYmiONkkwKEEtBDn85QWpvj6ulGu16ko0yN1y0FvVt
         u6+nMDT7moF1YqMUxkKFVpTIid6qeUjWp4LK5L36ceLaz+XCIVKucmKVR1G1+PEtxzwz
         X3LqxtB7EEKBWemdvpyivzHvapL98zN6nvZQ/jEh5uR7DHUQmdg+s6Tf9HOlw6y0DHXL
         3KvyKtKk4Zr2kP6XFsFNYET7jcPghmZAab/iTymgfD1sEfnCRlY5v2XKbpehQkAiE413
         yv1A==
X-Gm-Message-State: AOJu0YwwrXD9bkjKgGby80Zu3TjzzxO2RoEo9/kwsaXCpRIQJITuxuAH
	opmu+Vc+W9/dfMwti4u0unwPFTerm/qko14xBACtVDYyAYTau34HLr8Y3VwQwFOgvg6jUz1U/tg
	fHp03TMWIujekZnAwOMuebyHguOb2BLxj6BXsIuwSJn64TzfH52btWTw1TD6li56GMHc2xiV+67
	sf
X-Gm-Gg: Acq92OFc4GW7B6N2bGBcmZxuqUGx+oZvif8XWIrI0IRNMwb4J6OsPcl/CXrOw7elRc2
	IRn4oekQDB7oeW21eglGw/PUvVQfy6VVEYBiX4Vg6HYLQhAZ6tZziMOSbqcursk5FbvRLZuYlpl
	p2o1y40jMv6P3SsJyW6IWvWjhqEjwUs9VbJGZH7jqPQWc+LOkQfOFs4N3ddsA8wfnEzkliLYcm9
	GEu+mW1VcwBs7KkHIMwHFE+Qa8B1fxNUW5w8ZOvlEGPrT6a38sXIK7hrKpeM42VL93dYZk5HrbM
	3yWVrVIG5RzMzeHzUM8D6jW0bWzi4gQPLEyjt/LotUTGV18fcmgXFHbd1rewvKDsWkwzDnTkQOq
	FEYNaAL0XSlVJQySNrCi0C78kTWeHbdKKYXV0K7iHp5ttcNB3e+Ugilm3MzRGgUGf8YBdAA9QZI
	3B2dk=
X-Received: by 2002:a05:6102:4425:b0:62f:fed:d334 with SMTP id ada2fe7eead31-630f8fc748amr2947897137.4.1778247660059;
        Fri, 08 May 2026 06:41:00 -0700 (PDT)
X-Received: by 2002:a05:6102:4425:b0:62f:fed:d334 with SMTP id ada2fe7eead31-630f8fc748amr2947891137.4.1778247659555;
        Fri, 08 May 2026 06:40:59 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac3a7f89fsm80509266b.29.2026.05.08.06.40.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 06:40:58 -0700 (PDT)
Message-ID: <b2e69a76-e484-4b48-a0a6-89279e597da1@oss.qualcomm.com>
Date: Fri, 8 May 2026 15:40:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] pinctrl: qcom: lpass-lpi: Switch to PM clock
 framework for runtime PM
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260508113636.3561383-1-ajay.nandam@oss.qualcomm.com>
 <20260508113636.3561383-3-ajay.nandam@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260508113636.3561383-3-ajay.nandam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE0MSBTYWx0ZWRfX9m1Solb4EQHe
 4yu1OLQYzNrVRCVb54NH63xL0f+/l2Wqmb+Umffnln+ix3dmAFJ2x2RqUw521l9P0fKxMABENDv
 RSWYZfdxa3gtL7WmhfR4Kmxyl793s1PzD87Jj+mIHlemp0HKg/xRKA5mKlBgzsjln+8ua6mWvHU
 Es3KHwFbspJ3VLz2g5znsrgL5h1S+7h0pdMfRRYUBln7SK7uf6siMptQWoAa7nejAXuB2FxfGuQ
 5zvzi6I9uZRk1G/Df9t3xz8yl1wPoJ4cidJmtgPTLpxDGGOZST5ok5/mGYyWYmsreIvHQXbBaKG
 uMguZG1ZTtouNlBJGI2ez3EVTeEi5mOJrj4KqWRyRdLpF4vRC/O+qlSWmunmKlxxksHvQ9rRZqA
 fAKtPe+59GTbTMDQ3mzgh2wyzmtRq48Tr2X/mn0jDSJMj3PyXm8cXEOltqg8pX5YL/ZHAAnAMk8
 gpGNHT9SdS68+AFFzgA==
X-Authority-Analysis: v=2.4 cv=W80IkxWk c=1 sm=1 tr=0 ts=69fde7ed cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=taKbEZwsV8UQGDR8iwEA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: 2Yu38mtw0wA1nKFpwTeB9mGvZKc4KPgV
X-Proofpoint-GUID: 2Yu38mtw0wA1nKFpwTeB9mGvZKc4KPgV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080141
X-Rspamd-Queue-Id: A2A934F752B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106690-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/8/26 1:36 PM, Ajay Kumar Nandam wrote:
> Convert the LPASS LPI pinctrl driver to use the PM clock framework for
> runtime power management.
> 
> This allows the LPASS LPI pinctrl driver to drop clock votes when idle,
> improves power efficiency on platforms using LPASS LPI island mode, and
> aligns the driver with common runtime PM patterns used across Qualcomm
> LPASS subsystems.
> 
> Guard GPIO register read/write helpers and slew-rate register programming
> with synchronous runtime PM calls so the device is active during MMIO
> operations whenever autosuspend is enabled.
> 
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---

[...]

>  	for (i = 0; i < g->nfuncs; i++) {
>  		if (g->funcs[i] == function)
> @@ -119,7 +133,9 @@ static int lpi_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
>  		return -EINVAL;
>  
>  	mutex_lock(&pctrl->lock);
> -	val = lpi_gpio_read(pctrl, pin, LPI_GPIO_CFG_REG);
> +	ret = lpi_gpio_read(pctrl, pin, LPI_GPIO_CFG_REG, &val);
> +	if (ret)
> +		goto unlock;

Please remove the mutex_unlock/goto calls and replace the
mutex_lock with guard(mutex)(&pctrl->lock) instead. This will use
the scoped cleanup mechanism and let you simply return directly,
shrinking the diff

[...]

> +	pm_runtime_set_autosuspend_delay(dev, 100);
> +	pm_runtime_use_autosuspend(dev);
> +	devm_pm_runtime_enable(dev);

devm_pm_runtime_enable() can fail, please check its return code

nota bene pm_runtime_put_autosuspend() also can, but it's much less of
a problem

I gave this patchset a spin on 8280 CRD and seems to work fine, nice!

Konrad

