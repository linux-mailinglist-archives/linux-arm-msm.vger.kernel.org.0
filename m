Return-Path: <linux-arm-msm+bounces-118989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +zAQJV30VWpOwwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 10:33:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 282BD7526F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 10:33:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CcYr6G0Y;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Xt9OcHB9;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118989-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118989-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 95E0B30059AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 08:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CEFE40B371;
	Tue, 14 Jul 2026 08:33:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E8F3FAE0C
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 08:33:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784018009; cv=none; b=Po8rg6QJgqv81i6wtzTIdivM+JgKjHMaTvy0ptqifuyhv0/6k+C1JC8MmzF/RwZrHPxIStUXeJETpx2+E7gaps2KkLEVYVDWBF+IfyZARRy/n3BXL2r3inXBHy6KRMaZBnF45DbqL7fu716PZvL8iMxTu0otdeSOekEbbPfoROs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784018009; c=relaxed/simple;
	bh=h7/87QKXD/fbJfpAhjv8FHvRLmrxNr5rG4NhU+XedPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hu/2AVpicP8eKlxB72hlnlW2wvEaTRZLzS1MT344Shg/A1DtqDzlKt28PHhlgCnexEGrnJBjZpzlpHAruXhmry4tMUM8iuI60Q1GkS8F/Q8jYAcLVOXO8HMdgtVskQMYKCkSQIhKJC+ifZkBmehLVCdmxYpnhaRUKxpatbuGCI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CcYr6G0Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xt9OcHB9; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SSjY3743628
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 08:33:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qf5HpFHipPuzqMdwymBhE6vQiUD3/G9Ju7yaYuAtlzk=; b=CcYr6G0YoO+C5YFF
	hmZ4O2erC9bI9fEUs4EzXYdW+svtpIgYUIaJ+QemCDNQVaUwA2itV09F2juYI/PB
	HuJqh3KrXV+DQaJR3PNlC9W/e7N/PpevMznb1gY4MIkxSF8x1vE5kGxcm+n4Y3MT
	NJMJoLzKT6NCWhpxVoz0s47/wuMrhY7ZLzF5OGuPrut2GK72Ho/zIOIGXerK/Cvy
	bw6rf+iTIwLr89BWhcdh2MaHV5kstLSuYW0Tyi7qGqiRGhbN+g9dtGjhL9oX6ZHu
	Sk/mTojj3s87VlEZputg7bhRcdwHZgxuaw4RblHLjRbKraGgAssXE99qkohzkKxM
	p9jKmA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44p2sqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 08:33:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e695a3b28so69536085a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 01:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784017998; x=1784622798; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qf5HpFHipPuzqMdwymBhE6vQiUD3/G9Ju7yaYuAtlzk=;
        b=Xt9OcHB90JrlOFvfURLHBBF9+MjoMWWOzlSzeIsblo2MzVqjb5i4eDzgD8TZkiFQd4
         qb2aiPc+ZioGZ6p1tKvjOQ67h68D7jqa0GSblxCnfyeCCj9rXoaSZmUWyjrRi0qyTRCa
         n1p0o8WKSU1pOBEdpbidp59Da1RHm6xtNu7VfBEqbmi97uHt50eJ3t/IxYlgvjzwS+WK
         xDucrthHL8x2tQjR+p/INCdWhKqBDVCTUDuIf4frHatZyDKxa9gpfVn+FJC4mVVZ1RQ5
         JiUkfjfQpsUxyESCLD8OHqjmQTpVdH+cZCOCHGHPNikZ7CF594LGe7VuJzPaQF7mlGFE
         WHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784017998; x=1784622798;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qf5HpFHipPuzqMdwymBhE6vQiUD3/G9Ju7yaYuAtlzk=;
        b=gLyVSW3H8OrzHqV+rnCffxLnwk+esYNCu6kaEYxF+rz0IsCBNN/dfNRakIGhqlMu9N
         wgzPmjrBtKJZmBy4VCJPL/UvjTXUfxr4DcQ0B/YH/BW8bnGZunfD9w69vc3HmvnzVz6f
         3uMh6oPL2wRe6E1fOWbt6mSi10ukZ0G2lc17KZJHi68iojOPNflTQl857nvnTesrEfOz
         G77n1ra8hQ9b3k1LHcE5D/kF0K/RSeAxrviitdCqURxHxZGgHDZOljNLRuZ/nBd54d75
         5hchEqrOu6GHBm0IHOmkK2SWmC5QIwqwC0rf3uRXun4+H8amyXLMPZ6di99sqav4YTlv
         Jq1A==
X-Forwarded-Encrypted: i=1; AHgh+Rr1d9TFNj8V9jDZ++TzMYYUvFIkl2lHZcbhu95qbVRRmrAzHxXGq+v45Rt8Fsau1fvVkoEBQ1WEKwxMLi3m@vger.kernel.org
X-Gm-Message-State: AOJu0YxSTaSWRuHa0F5OPRV0D+pb/miqLerLARR9yonAzU515KKiwQI8
	/bZGm1LHKdvy2kTIYFB+4fEmcMMtp273JwfqbndmX8ALpXLqcqlJjTpteEPD7PZ73M9tAXOi9dF
	rddv4DJ9ugKV2f3v5SeoErlIMXGWqRRJx92iHwsCryU1SiSBlLwNm0Z9065iJhR+2Qb74
X-Gm-Gg: AfdE7ckhnDTUZlkNTWDRgLyiX7J+JwiDFGahC1LBDdb4RhQwDPw8sDuOby4LaovyMCq
	3UxzFpiKEWnLtmRTQaWHGFzMLfLtYlAZYORadUQONoP6L0eiVLIQHzcuVg5V0LeZqsoc5F+ClDC
	Ep5tUpagmM3M3X16AHSfa6Mo6Vx7nRMO3cbGXDZ4FXBu8AKysDEdiguv1oJrNIEJpOPC7pRRxmq
	IUFBL+0ab6dIaAGsoc8/N44epdyWJENedVLZHMPc3Htw1pCmU9lptm2tQjk8eBdFOZzEu2w5b5a
	hwjoGBoaAg+DqXDkUwDR+W33RJUjU/pzimsjuM+39uu4720jfwoHFvH6La1qUBHcET+QH4as3t/
	V0+tOYO5vaavceSCcugOBHQx1JM09BPl+jMKZMg==
X-Received: by 2002:a05:622a:588:b0:516:d83d:b28 with SMTP id d75a77b69052e-51caa08a385mr165942011cf.17.1784017997824;
        Tue, 14 Jul 2026 01:33:17 -0700 (PDT)
X-Received: by 2002:a05:622a:588:b0:516:d83d:b28 with SMTP id d75a77b69052e-51caa08a385mr165941831cf.17.1784017997425;
        Tue, 14 Jul 2026 01:33:17 -0700 (PDT)
Received: from [192.168.68.109] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c15e6286a5csm736326066b.11.2026.07.14.01.33.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 01:33:16 -0700 (PDT)
Message-ID: <ac5e64b9-21e9-4a88-a14c-2aadc8eda73a@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 09:33:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] ASoC: dt-bindings: qcom,q6dsp-lpass-ports: add
 Audio IF clocks
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260712134110.3306763-1-prasad.kumpatla@oss.qualcomm.com>
 <20260712134110.3306763-4-prasad.kumpatla@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260712134110.3306763-4-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA4OSBTYWx0ZWRfXxvlkXMzaBZz4
 yG6oXfd0P0n8wFGIIusdKUuTzkock3Mys1UYk7V5H7zXMxhWDlwu7Af/W8mNpT7KEL6U5p57GBO
 5VgVCcDo1GjYr+Il1L/3fy+Y6Tg7cok=
X-Proofpoint-GUID: lNMXzCJdICaimmjj-tBVYK-FclkPEX49
X-Proofpoint-ORIG-GUID: lNMXzCJdICaimmjj-tBVYK-FclkPEX49
X-Authority-Analysis: v=2.4 cv=BZroFLt2 c=1 sm=1 tr=0 ts=6a55f44e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=S0i2IUftuXgoZizot94A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA4OSBTYWx0ZWRfX/v6X9pO27Ozp
 OJEBsyMXgAIA9OXcHT1cNEx9qPmhhLqN59XPMFu9jgFogmkAdqMmrT4puEOzQc/+foPWorQ7QCQ
 mW8gBSqMBKExOxr1iQiYzru7cB/7QUwMC97JIPbfX2/2ODNxTmUse4p57pFYO0eSiI2Mpe1nu0h
 lXlq8Vn/vLES2IUkxHZfRQWOMKeo83Y5loPLcXZSbx50Yun4RvUVl74v/PBMLivyrua3QxkCsCa
 gLnj/K7s2Xe20W5jOGVA+IWfM5h4T+tZdMACjF7wyMaHvMQ73Imq0Ho/EvKSqflgh4aArJgzCOR
 +EcHaXEf9M4AJg3wv/ppzPKg0BIxgfzBnuuuSEfzVJVdCA8QKYNLS0HB7fIsoTGT15uUc4o3Mhy
 oFEPxAawfjbEsTlQX3+bBz1LHoQOQhiuerDyfx9iJLbHGA5BylwzElA+qRv5SM8NASKOw2Npfg4
 25v93m6xzzKlM1FZXmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140089
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118989-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_RECIPIENTS(0.00)[m:prasad.kumpatla@oss.qualcomm.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 282BD7526F3



On 7/12/26 2:41 PM, Prasad Kumpatla wrote:
> Add the LPASS Audio IF clock IDs used by newer backend interfaces.
> 
> Platforms using Audio IF module backends request the interface bit
> clocks through q6prm. Add the Audio IF IBIT and EBIT IDs to the binding
> header so these clocks can be referenced from device trees.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---

lgtm,
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
>  .../sound/qcom,q6dsp-lpass-ports.h            | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> index 45850f2d4..a3aea029c 100644
> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> @@ -233,6 +233,35 @@
>  /* Clock ID for RX CORE MCLK2 2X  MCLK */
>  #define LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK	70
>  
> +#define LPASS_CLK_ID_INTF0_IBIT		71
> +#define LPASS_CLK_ID_INTF0_EBIT		72
> +#define LPASS_CLK_ID_INTF1_IBIT		73
> +#define LPASS_CLK_ID_INTF1_EBIT		74
> +#define LPASS_CLK_ID_INTF2_IBIT		75
> +#define LPASS_CLK_ID_INTF2_EBIT		76
> +#define LPASS_CLK_ID_INTF3_IBIT		77
> +#define LPASS_CLK_ID_INTF3_EBIT		78
> +#define LPASS_CLK_ID_INTF4_IBIT		79
> +#define LPASS_CLK_ID_INTF4_EBIT		80
> +#define LPASS_CLK_ID_INTF5_IBIT		81
> +#define LPASS_CLK_ID_INTF5_EBIT		82
> +#define LPASS_CLK_ID_INTF6_IBIT		83
> +#define LPASS_CLK_ID_INTF6_EBIT		84
> +#define LPASS_CLK_ID_INTF7_IBIT		85
> +#define LPASS_CLK_ID_INTF7_EBIT		86
> +#define LPASS_CLK_ID_INTF8_IBIT		87
> +#define LPASS_CLK_ID_INTF8_EBIT		88
> +#define LPASS_CLK_ID_INTF9_IBIT		89
> +#define LPASS_CLK_ID_INTF9_EBIT		90
> +#define LPASS_CLK_ID_INTF10_IBIT	91
> +#define LPASS_CLK_ID_INTF10_EBIT	92
> +#define LPASS_CLK_ID_INTF11_IBIT	93
> +#define LPASS_CLK_ID_INTF11_EBIT	94
> +#define LPASS_CLK_ID_INTF12_IBIT	95
> +#define LPASS_CLK_ID_INTF12_EBIT	96
> +#define LPASS_CLK_ID_VA_INTF0_IBIT	97
> +#define LPASS_CLK_ID_VA_INTF0_EBIT	98
> +
>  #define LPASS_HW_AVTIMER_VOTE		101
>  #define LPASS_HW_MACRO_VOTE		102
>  #define LPASS_HW_DCODEC_VOTE		103


