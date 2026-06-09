Return-Path: <linux-arm-msm+bounces-112221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6r4KOysxKGp2/wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 17:28:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CDE661BD1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 17:28:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=H23X7bpW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IlBxWrI5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112221-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112221-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F15463261A7D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 15:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8072D47DD43;
	Tue,  9 Jun 2026 15:10:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0124347D930
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 15:10:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781017830; cv=none; b=Gq4Xo7nd/hzO9GVrE2aQ8Z5AanSXIN/bWwkUt5lsWEIVlEnKFf02oNoxyECZXyzocwiwChb3fSUtnYbsoMhiOstygwL1Mk4ZFLhx9w0JexnljGmqZEAi6TBqBlvZQrCTNsI0kgllR+wXidMst5l7kvjxErXlEKAnOi+xKI5FeR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781017830; c=relaxed/simple;
	bh=m5J1kszIsOBTqcwOY7gOseR/EqSsLrNfU8u1VkE8DRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UOsGiVddvJwrNWdVJReSD+8a3WnCiHh4zDfw9xOTkhb3IfaRwcO8X3LbjQbKIcanln7TehnXkbK13yplP6GtJ2DK2gurA3lMjc4mI+s9yNP3e9TEKdxEjYJJVg4YvqpjxaqdoTBeFquz0bGQAUQI3CqFYX8pGF0zB3ze9OMJk40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H23X7bpW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IlBxWrI5; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659CmoLf2701315
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 15:10:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xQyVtCRbgU15t9+s0ZeYcjOFhPrl3LEjlOdESwOBCd8=; b=H23X7bpWp6YCJ5Um
	KybFwESRnGku0iCmHTejCZWkg/0vMOmfcZ11GW1hRVwZ7uZptH9hscQSNr196Y0q
	kMUp/peL45li8hflmANf4tf2z04yfuzPoozDAAQVP6CxgJOgcYCgobqQelaJq4DZ
	zBN9j/md+7jUA2qCTSZfYHwCgpX+MIfHk1vz/YEx8d8LSt0TNOMnGCaUkDY2wViK
	dGauAO0dTKhTC2uDQuKVAjXBRWf0VVkLZ8IOJWauLiPJ8DC3zxvA5TYrf3olthCs
	fQWBp7ZzGv893LLAeyajiAq8WZI0PhuNcSg8PeSeQnKdT+nEFtUL1239mZiFPwJt
	Yhtl0g==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeeat497-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 15:10:26 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6c7bdde6912so324346137.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 08:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781017826; x=1781622626; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xQyVtCRbgU15t9+s0ZeYcjOFhPrl3LEjlOdESwOBCd8=;
        b=IlBxWrI589tmZfnufFNSVvok1j/IyAA7k7okVe5nFrFXZecUbEar4jx2SKj1108h1M
         Sp9QhxCJ33jScWImIVvNJXoy2SzYIfNnNcBsjNoEkTjv05B7XapaYAndbKDOnifou4nf
         60RuWN909Jggw6p1wiXv2xjLc0jYdH1x7ynpwb4jbsnKZP7M2GvBJTQQP7o6Qy4XPxeq
         4skgcdyGZcnkdjEU2Vd0rGpTHbFlcXsrhtDmYvFMPwJcQHxPnPOdPCge4sOVH1+js0Kd
         Xps7+zEIFyvOxiwkSNdI8sF/TtyYPcAmrOYFxtqSlKFj2gdc3Y2mcyY2OGJdRkG6oM96
         2/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781017826; x=1781622626;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xQyVtCRbgU15t9+s0ZeYcjOFhPrl3LEjlOdESwOBCd8=;
        b=SYJRHbshzS99teigtMQdFsKE8k3uubVAJQotvn43P2qOTnB6M+vXtIspgZ293yCt2t
         8/k0Q8vUUpew/vKuIKpzlSWM+qHZAeLYhxgNyH6XfJk+GXwUsGSvZIDtEuxMzSvOlevC
         1GrjxL5I7GfmnbGek7Ys23W5O0LqA4vfFR0E9ZlmPNRmoee3F8naudAXp9/WJxvkQ/ps
         IdBFYOtaDqOsIf2+O+r88BY8AwQ0thxOYKDGe8U21XQpRGvPCOw425teko/jYGdSclhv
         i/J5Hxih1cuVLz/z6ZWDD5pSIJdaxOa6OU73VYL9debMpCeheDG5VfWsXYCYMmk6X9Cs
         4Puw==
X-Gm-Message-State: AOJu0Yw+NWyJyFrIwuZ0L1VAsgTZ/xmqIrsbLYk/nMuKhLQzY6yOL0ji
	f9pw4LE59SnR8+1cKZWT/ivc1FjhCu4iAZWgc11QZgsqNAhtSnf2VYiceQ/856Omb78cYseXoPD
	D5O7iINyiYr96yEIXvBn/TxmffFLn560hO4DttNOTVv0TFa3gZL0W7SbLkqhJUG2oY0Z3suwLYr
	CX
X-Gm-Gg: Acq92OEKrJsHLYkqjg1e88VtRs1S6qtfwokgdX831hzr9O+4pXsJCZheIs2RK+UFayr
	5xoFrWPUkhkko+J1aoLEBRoEOlsZDS0VmT3x2WgtzZIwma90rsB5oMWXej2LQGEO6FL+KgjxyBm
	Adk2NWL9zCNo0gRIww61z3fYCIqFVIVn10CGMimqBfehxSVAv6C7VQMhnrpxsBkUssn9EmjEuZk
	4UxF5VvHYgFymgAj/659KF6ITkmbKrqAEueUfDhaL8eupLsSwA2FMYneRHmb+N6kn8+h8DAfktx
	agcQsBvBu7KI9LhBttCXGic6uI0wAxXUiCuo0x67ruKUhsJ/UGfTQdJ2ODSbf77Ri/9POWTs41l
	jb3i+iE6uA0xMyYb573VVN3+UQtT7YLiZgFigOyXIj/Xm9vmBY1DQeeR/
X-Received: by 2002:a05:6102:161f:b0:631:2a09:94c0 with SMTP id ada2fe7eead31-6fef3c04adbmr2933801137.2.1781017826187;
        Tue, 09 Jun 2026 08:10:26 -0700 (PDT)
X-Received: by 2002:a05:6102:161f:b0:631:2a09:94c0 with SMTP id ada2fe7eead31-6fef3c04adbmr2933765137.2.1781017825704;
        Tue, 09 Jun 2026 08:10:25 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65c542c7sm9184834a12.31.2026.06.09.08.10.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 08:10:24 -0700 (PDT)
Message-ID: <09fb9e91-2585-4cb5-8bfb-92df304e9d6c@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 17:10:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] soc: qcom: geni-se: Increase MAX_GENI_CFG_RAMn_CNT to
 1020
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260522-qup-se-increase-ram-cnt-v1-1-71854d0b2ef0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522-qup-se-increase-ram-cnt-v1-1-71854d0b2ef0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZuluRzStt6yJG94HDMxT1opTDpfAuqyn
X-Authority-Analysis: v=2.4 cv=Iey3n2qa c=1 sm=1 tr=0 ts=6a282ce2 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=WMVdaVg5Cgq1ElYdIVQA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0NCBTYWx0ZWRfX6/zHBbXTKLOl
 1qzzB4naz2VrSO/VvtdloTXO7HZAydMmivKa8IsE82Dx3EAL9zvGkpuOohW+OUSRO1QWNdwZ0YE
 2lbWwbVpWOVKX0dnVqX59xaV27+w7N0O4O6rj4s46iG2ikqn2JhiJ2oOHH8eMR7FM/1qQm/D3f3
 QAEed1o0ycjWlZE1OQj6IBwMUqwpun/kLwEp8yoi1uoMQAZU5auM1+K4tGFDFbUoPIUwgUiS1MR
 rOIbe5HD3XiQvFmwuCogkZtvJfepugsFRR8kJfj2qWXL0dr7OwAuBmqkaJxlHMHh9Lhv8+VIYyY
 NWvpe44X7FovZ6KdXtnW4idqz/ErwEA9JBMQiNTHtjRnlAlq6eBFlbs3isJD1R/xh3pyH375Uin
 yoIIlMUkcn3MrM+iPZhuhsnvK27eQ9KohgmO7DAzCughF5MvHJn3Y1WcKx7EOqZOSS4iqQIgb26
 h14Q791uwk2XfjC+Ivw==
X-Proofpoint-GUID: ZuluRzStt6yJG94HDMxT1opTDpfAuqyn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090144
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112221-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:viken.dadhaniya@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 69CDE661BD1

On 5/22/26 9:21 AM, Viken Dadhaniya wrote:
> The current MAX_GENI_CFG_RAMn_CNT value of 455 is insufficient for
> certain Qualcomm SoCs whose GENI firmware requires up to 1020 RAM
> entries, causing incorrect bounds checking and preventing firmware
> loading on those targets.
> 
> Increase MAX_GENI_CFG_RAMn_CNT to 1020 to match the hardware-supported
> limit and ensure correct handling of configuration RAM regions across
> GENI-based SE blocks.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/qcom-geni-se.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> index cd1779b6a91a..d0810960f3da 100644
> --- a/drivers/soc/qcom/qcom-geni-se.c
> +++ b/drivers/soc/qcom/qcom-geni-se.c
> @@ -152,7 +152,7 @@ struct se_fw_hdr {
>  /*Magic numbers*/
>  #define SE_MAGIC_NUM			0x57464553
>  
> -#define MAX_GENI_CFG_RAMn_CNT		455
> +#define MAX_GENI_CFG_RAMn_CNT		1020

Is there any SoC where this could overflow the register space
(you say "certain Qualcomm SoCs")?

Konrad

