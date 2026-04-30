Return-Path: <linux-arm-msm+bounces-105385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YM0fDYt682mt4AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 17:51:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A263F4A524D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 17:51:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 29581302961F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 15:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A5FA44CF34;
	Thu, 30 Apr 2026 15:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZILPw7ZS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QuX8stYg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25B330C345
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 15:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777564276; cv=none; b=cQxA0/1rAVkq+57Jb9CSuGDRZE7Cha9vEWByKBi8wqo3ztKynZ+2+UIZDhW5gtb1GRH6UxUIbURoUvZBAOFajgSwRIvYNlhgPrW9d+fZCGm49dN8k/pYgOvkMkmP0+NbiJgF/12u14lurK/1NYdkt/YOQzxNPzfXNOFspBMZ7+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777564276; c=relaxed/simple;
	bh=3hQgKR0g5jfMrI+q77PgcAXwQDpxg6YjEW9egm9jAd8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NPk54VD7cAfO4czsQI18dOFv17NDwpEHDmQm/lONwIzKQ6gQRTs6pVg+fKgx1iopqy9CdWKYTohbw4th5YHJZtfaE55/6+vloq+u5KrzFGAwedZkOJmk8DKqv0wufOLtbhQTaq+RCR6fUhDyRCQUElxPfGkUttwHlaGije9gxJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZILPw7ZS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QuX8stYg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UElJdP007763
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 15:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PMY7fcF21Ezzzra23e7CLhxBaPs0P38IfMIcVh77jDI=; b=ZILPw7ZSkEal2Lau
	PG3ItfOQ6FrZe6KI4aoAyJKHDctxT8wrythccjAenJ/r0qDWpK+uI6v8iI79jQlC
	NzgQhK9k0KSIzOc++fIS2+MG3szrQbjeUucTtUHt00k84NLj+2d2HAf1RkXi6xzI
	JGpG9MmH9nGcLqCu0/4Lob0pJxNcFrNib00GXvMFK1wP3oIyfg9lFaa+sJxkqQJ1
	uMuu7xAkmJUK7XlkKnI8+c7HeafafrW3bxKJwPccd+5M98GiP92tquiksXFXQY+i
	8fP33S8uUPRT84dCPT6VDy+wBiJiKuVmBuvP8ulcsu8fgLCqAq7mHgQ0u5h8reEK
	m+x7sQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv54w9k7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 15:51:13 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-95a76c24859so74924241.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 08:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777564273; x=1778169073; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PMY7fcF21Ezzzra23e7CLhxBaPs0P38IfMIcVh77jDI=;
        b=QuX8stYg/SO6qFdiZVNGIMgPh/ua+OmBAIXUvHGRsGGyHzTwaonS5Ea1SV2nrVN8D9
         vOEkjUSggUFpwPIkkfTUQO6wXMotL3JVx0UOZNgGKZHxlq00tgwp5G5vsNZZu8UrI28j
         KPwSqXTVz4GJnFHdjhK7HvKU3OIvFCaN4CsMwS4tWbUaUwocEND84VUK1xg9y2tNe+iu
         lCfw7oLQZ6XrhMfHkBnCgf3eH3aMScRQ9mS1kXenK57V144r7jki3ksbiJOUb4i+pVRk
         UPN900u50WFoWHBIvWw5Z11PQHrdbc+LCqbHAor9tI40fRTxZeGRIAf781svyaeJTv7K
         ca0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777564273; x=1778169073;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PMY7fcF21Ezzzra23e7CLhxBaPs0P38IfMIcVh77jDI=;
        b=GlJdw6uJpWlnQa7dAOWPbnaKsnonbFmA6ekF9xMe8Frnwf95pdD7ot2TmEJLONtJ8d
         rCsHlAlOe93onaIqH3t5iJTmqDJopkVpzcMEJwHyW7KazXuGYic786+jptyjtYCsKhMj
         QIiZDnufkEV9CY8vOtECbpcRjtjYteLgr9b4yFxYQ5gk+ZjFC53yprR85gkQS61KxXI8
         H52zldBTIHty3bTYv9/ZBrdAd9ZgjqN0IyZ260gkDTmUYRRMnl2Z9ufLwPRBISzuz/Ye
         be/HcgmteYw8YpR0teID84g4FP7VfnVxSmyGDNUbYk0/7bQSVKTCUXNuDRuwljHtuq1q
         YaVg==
X-Forwarded-Encrypted: i=1; AFNElJ8vfgZvvHkznaN3NyA7vAeI2P/LCks4j9GEmsA+D59Q7kW6GGJ+lCPbRPYTRdvc5nqB27MNDAStMcV3GOuO@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx6Np3pvHhgGhXFtaizSwnGpZyOx5Gcr9k+49u2icUWEFQzbKT
	ESASe+WXmGrkwVNsVnwbQv1iEnI+1MhyjvV8TrfBRsPdtG5t6WiqFPw6/N1LU0wsP3gzs0OUvQH
	L/Pw1oyp7FA0xPWKf375WPF/FWWguhvkbuCjuc1x7i0bYkqu5q8l6cfNBV4A6fV5+sxbT
X-Gm-Gg: AeBDietm3XsNWn9Rc4oYt6AYsE/lcbO1yq7CodrPJajg7mjP+EENgjGfxprNVVrj+d1
	SZ/zzsqHbbiI0ePFsSWSqDznnLer4tTRzYNH9X9IkrGPHHsTMARShI/TDafWsQK4jTFgYAIl0ZI
	Vd4536tCcLRyjQ3/Os1w4nqM+um4Wt6ZMS1fu4BP9y1PqTZvTROiblBG42oBfd18RXebpdRXcFB
	27z4wFAR9wVs3pVgNMmEIzeZATtc8mkDMoTUzZN8HgpIgfZg8y4Xz/LCHtnCTPSjKBfqqgRqamt
	qwuJBXc7SjIHnyQCgj5M/tom/g134LErX9+fBDltHPfwxXTXlI1QrpUluSn9KSByVvpvrpK5+tt
	g+hyei6xiBF4CrNT/BeHQDYgl0lohRqS1OllDC2JU4F5DPi4KpyJNtfxURMdBr5Pq4UMJ/owJ2U
	/9oIgb/1IanGERIQ==
X-Received: by 2002:a05:6102:4a17:b0:606:2f5:7b49 with SMTP id ada2fe7eead31-62ad6327779mr749680137.7.1777564272674;
        Thu, 30 Apr 2026 08:51:12 -0700 (PDT)
X-Received: by 2002:a05:6102:4a17:b0:606:2f5:7b49 with SMTP id ada2fe7eead31-62ad6327779mr749669137.7.1777564272198;
        Thu, 30 Apr 2026 08:51:12 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6d977b7esm12941866b.48.2026.04.30.08.51.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 08:51:11 -0700 (PDT)
Message-ID: <c369dcd6-eca0-4d01-89f5-d19a41fd1477@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 17:51:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] thermal: qcom: tsens: atomic temperature read with
 hardware-guided retries
To: Priyansh Jain <priyansh.jain@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com
References: <20260430054422.2461150-1-priyansh.jain@oss.qualcomm.com>
 <20260430054422.2461150-2-priyansh.jain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260430054422.2461150-2-priyansh.jain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rnyUYVxWlvAurM3y2E_HeTDEoFcYNVxk
X-Authority-Analysis: v=2.4 cv=Rrf16imK c=1 sm=1 tr=0 ts=69f37a71 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=CBS10BAP3JayAQFiZAsA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: rnyUYVxWlvAurM3y2E_HeTDEoFcYNVxk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE2NCBTYWx0ZWRfX+11mvGgKYYmN
 w2BYSHbtKT5s+ceVoqS4joBFvLlMyFuTWYELweLyFMDrO9z+uM6RM+V9Hc/IK1Maji4LyOE711W
 QZdJlRrJL1AJoozOxY29Ny+WKvEkZcMY0AdtJ/sjbk1SbJ0YZEJ3z+2HdA9mOssX5Y2SMfkTzVh
 Zw7fAy/CyPX17dJXNYba/dJeIHu+ZcQi9p3ueypU/SqMnCoGGA+auxcDpUlItmTyOS6aJh+Bqsi
 G6quZkzKoI5UqBURYcKLlwTa2RdgP6MuUvEBcenSBBP3i4zzZEcxbnnRlCUmX2O1wXDsFD3YQiT
 TKXTZxF0AA1en5Nt3mfLmfimwpb3/D1BQSK5VVK17sRS1Zo4xUtDa+ZIq8t/ydHc+evi8Pf4j8U
 mkPbn9+7kAgwlkSljzz6NwQypnXKO/qGasLFPUoNhIDwp/K3MSxz3VqmcGilsTVWmi0Zjl8q/nx
 gt7G/htxCuubG4WbJ4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300164
X-Rspamd-Queue-Id: A263F4A524D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,intel.com,arm.com];
	TAGGED_FROM(0.00)[bounces-105385-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/30/26 7:44 AM, Priyansh Jain wrote:
> The existing TSENS temperature read logic polls the valid bit and then
> reads the temperature register. When temperature reads are triggered
> at very short intervals, this can race with hardware updates and allow
> the temperature field to be read while it is still being updated.
> 
> In this case, the valid bit may already be asserted even though the
> temperature value is transitioning, resulting in an incorrect reading.
> 
> Hardware programming guidelines require the temperature value and the
> valid bit to be sampled atomically in the same read transaction. A
> reading is considered valid only if the valid bit is observed set in
> that same sample.
> 
> The guidelines further specify that software should attempt the
> temperature read up to three times to account for transient update
> windows. If none of the attempts observe a valid sample, a stable
> fallback value must be returned: if the first and second samples match,
> the second value is returned; otherwise, if the second and third
> samples match, the third value is returned.
> 
> Update the TSENS sensor read logic to implement atomic sampling along
> with the recommended retry-and-compare fallback behavior. This removes
> the race window and ensures deterministic temperature values in
> accordance with hardware requirements.
> 
> Signed-off-by: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
> ---

[...]

>  static struct tsens_features tsens_v1_no_rpm_feat = {

This struct also needs the same adjustment

[...]

>  static struct tsens_features ipq8074_feat = {

And other structs in tsens-v2.c, but..

> @@ -125,8 +128,7 @@ static const struct reg_field tsens_v2_regfields[MAX_REGFIELDS] = {
>  	[WDOG_BARK_COUNT]  = REG_FIELD(TM_WDOG_LOG_OFF,             0,  7),
>  
>  	/* Sn_STATUS */
> -	REG_FIELD_FOR_EACH_SENSOR16(LAST_TEMP,       TM_Sn_STATUS_OFF,  0,  11),
> -	REG_FIELD_FOR_EACH_SENSOR16(VALID,           TM_Sn_STATUS_OFF, 21,  21),
> +	REG_FIELD_FOR_EACH_SENSOR16(LAST_TEMP,       TM_Sn_STATUS_OFF,  0,  21),

..this change feels rather odd - the existing regfields seem like a good
place to handle this register map difference

[...]

> +static int tsens_read_temp(const struct tsens_sensor *s, int field, int *temp)
> +{
> +	struct tsens_priv *priv = s->priv;
> +	int temp_val[3] = {0};
> +	unsigned int status = 0;
> +	int ret = 0, i;
> +	int max_retry = 3;
> +
> +	ret = regmap_field_read(priv->rf[field], &status);
> +	if (ret)
> +		return ret;
> +
> +	/* VER_0 doesn't have VALID bit */
> +	if (tsens_version(priv) == VER_0) {

Then, we can check for if (!priv->rf[field]) instead of checking the ver
explicitly

Konrad

