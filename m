Return-Path: <linux-arm-msm+bounces-116561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Db8+GViYSmrDEwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 19:46:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EA570ABAB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 19:45:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Rz7SGFtZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CAYAIrfR;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116561-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116561-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 25606300D1EB
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 17:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9A852FE582;
	Sun,  5 Jul 2026 17:45:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4308A279DB6
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 17:45:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783273557; cv=none; b=et+v4ebQh2fGBPKaWkDABaqRr363TzfvJ5ZloV+nhHJd9tJZp+W8clXMvHxE0uUSS6m3TE9x46vWpgAUexQqPZZK1n6ZUZ6JuesR0c9x/XzhQStWV/DaqgP/FEGZp67ucG6Kpc3k5178shqNaJDn/aKng7qBtd7Y7fTmWcUaDmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783273557; c=relaxed/simple;
	bh=AqeS2WQenKoV+dzXfsfoXUVRdKIljUEkzTivQu8QwVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gmZ4YV/cFdulcS/WxkQoXLwgnerwPeODQj37YwfOXNTYNYIyCsxr0PsI0ckEo8ySHM5ZuXsP3bfk4ZIu2tC54VcIBnqRO8Zsp760OSdJ7KokFptnL820c+uNThizqSZB5r3nExRvj7KBvA3HtK9EgyzSeYd2/75KFO22KIdmx5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rz7SGFtZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CAYAIrfR; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665Hi52M2168816
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Jul 2026 17:45:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lm3jFZCfu7y4SHb5dEMYbHPrvclZNhMmF1bK6UjstW0=; b=Rz7SGFtZT3B9OxYc
	GmY2nfgr44tXPro9jct3cZLSPlEU1qt4Nzn2+NYAsmyegIu5hwQ9ondlNKDQpg6T
	FIU0LxAYX1N8O0tArVHwmb72Oh/hyVGed/9BzTc+okyjBrytxuYih8fnP8spJche
	/stSt4SMnoNv2O5AniVIuyR29UAvCHotUGXpre5Dl9tc/TehUvGzL1TIJ2hbS9Oh
	usjDts3mnkHekbuzIioNVz5hpAYAoWehULU427U90bDH/IPkR7JMZB3oLjRhc9o+
	WxnKlawVt9GlUOhg74eYG5He+CNWUCnBRbedgZEV9LhrNbw7VBaixx0K10vWWzCU
	Vw+lYg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6tj8k2s7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 17:45:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cae134ab3aso39139335ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 10:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783273554; x=1783878354; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lm3jFZCfu7y4SHb5dEMYbHPrvclZNhMmF1bK6UjstW0=;
        b=CAYAIrfREostOCWU0T9RTFvBtYcl0q/tl3/RuHHdeofzTa1XoN0dk7K7BF50bw65Y1
         mC1Hccrva9Ixt2PbZaAqvsaLAElYdvtCzXSYew1jF0jBp0H/GVyGZr7h7nJrYW67s9+S
         kdsRG9c6sahLP2f5fc38RZKfBfOok0Ise/JHm0LyB2rzYnNF8wfvxEajfpcKnHEETLl9
         r0u42lCADSjDNvJpFMPswQ9fqPTCVjgJjdZZZi36qb6JlfSIzJW3vBWzg11Sr3EL5gdP
         pJnF76JzTD2+qRjz8/kUfsmM8tJGNdXhDm2Oir60Ch3zZxBE+bwL/QyrPGZYvaW8ieBr
         gFrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783273554; x=1783878354;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lm3jFZCfu7y4SHb5dEMYbHPrvclZNhMmF1bK6UjstW0=;
        b=KcFYXJBA08aK5vzRseiz0/m7kDjjqfZTmslf5cTlzCtkyJKDz7+mh/ht++uXQj48KH
         NCF9jY/6i+CaIjWZNCGO6qqho7fG3O6qADHMj3fr0BnLzxUGvlmLsKUdRNKCzQqXoAyW
         6IY8iMUg0bv88QnFaaEQYBpJnsOHc2X7M8ThrypeUzw/07CKla7EEy3dW2dY2sETlv2h
         TWkFaZCKhxNJ2gCnNajWPVvybzozOZDz2a0tIYEIX0Yilwneutsmssq2nYqGM9UuwbSs
         1ssyWwDSvGWK4KipBWl29uDBWzJnVavs7F4bwdj+eUUcjxtaBEl1ZVuGR9F560nWBt5N
         hyzA==
X-Forwarded-Encrypted: i=1; AHgh+Rq/XHOlfDTrWLdG7LhbSrrGKAoDWgu0vGV7Ne2EzlIGC98EIeZSMUGV6LIRg3bFF5EdSyjJQvoReiBWRpbe@vger.kernel.org
X-Gm-Message-State: AOJu0YyOWE0KifwqBE6TLCfLrRczhMJbqQtqEJaCryjMA0ZYMJh7zyfQ
	hhFd0O6czNI7FluzbEPC3LG0+jY1aJiIL4th54PufgGDyhQpilvO2JkSVSq0FXFnnNVbf7weAKS
	mOYdYKL1kzt6t3jGkz1gaZTxntIgKJU2XYmOLuUMq8TFbewn7h8uyBItUoNw3tA+I8+hu
X-Gm-Gg: AfdE7cmMYnLGVq44vmF9Y/bzJHRZttGhtlE2FuMPuMkpqK8ioADGc7VqjozWgvBkQkD
	VxCLKPdWkrYQV4t/4ZxRUO01wjGvkh48VuUvkCYab/3VOATlnacOiqWHJK07qE2NZMCEK35xMAE
	SuL3scwJMJCa2d7222dZio5SuFEni9hNJsYxbmdyCEG38epWuO4q7AO7xr5cbiEo45U/ilLauoz
	z5gNJiYScbm+Fbfk07M4dsaI0zYNGrjhCCmhL5/w6JPk/uX8RY3H98t9gYeq704poJ6lFZLvax9
	LDjuHOvb0+IIRLrcFlMwgBfNlX7mZWjujkCHS3cg/IQM1mQ4E6OGMzooUqkvZJWoKFlDNjZpGYz
	Z0crSsSY1EqB8pntTl4qvGthyyHPfmVI2VURcrJp2bj0=
X-Received: by 2002:a17:902:f544:b0:2c9:9a2e:dab0 with SMTP id d9443c01a7336-2cbb808af01mr71570755ad.3.1783273554148;
        Sun, 05 Jul 2026 10:45:54 -0700 (PDT)
X-Received: by 2002:a17:902:f544:b0:2c9:9a2e:dab0 with SMTP id d9443c01a7336-2cbb808af01mr71570465ad.3.1783273553564;
        Sun, 05 Jul 2026 10:45:53 -0700 (PDT)
Received: from [192.168.1.10] ([182.65.247.208])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad7870ff3sm35571975ad.58.2026.07.05.10.45.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 10:45:52 -0700 (PDT)
Message-ID: <b693a9d2-4f1d-4c17-8a63-99c7ac79ed41@oss.qualcomm.com>
Date: Sun, 5 Jul 2026 23:15:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] dt-bindings: crypto: qcom,inline-crypto-engine:
 Document Nord ICE
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
References: <20260704004408.2303468-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260704004408.2303468-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDE5MSBTYWx0ZWRfX5KJ0TCLQxGMb
 M0ECDsSIY4DPjBCh9jSBe/YRXGIVkKKwtJedtnueoi8d0BWpt9RNGjwIr2zeeXHdr+R0Tv1Sg3+
 4ZFfbxpPGk6YbXwXH98IBdPTo4HPjU2YNZfpkTLaqo9TWj9Q301QZ0O4Oa/aTV1DcC9FILlDm0K
 Dyx9KDtrwBYodHdiiUfRqgpDQMgX59uHVGxitK78GNsl3Us45Mf2i6jH1RwoiwoC7uygY1YzEYD
 JL4Zxl6AA3jXDJB5UAxey0mwbgJGaa6+dIr97FaCjhNtXNDG2CR8TOFKA7P5PgvkKCW3seWCUwO
 R5s59VFJ9uY1r03m+m9OqbbTRzOVbnKZlVyPtoiwM4C7/FaQOVhKx1dg+qk6fppVtLV5Ot7W5iC
 LdKg1zfjGEeDo2j9mimclJEq7gGxZa/4iK1AUBNja3pJEhhICOuV3tdsB94aV6FqfzthPZGtuYz
 Zo4IQmwwv3HD2r8u6Ag==
X-Proofpoint-ORIG-GUID: KH9n8BPfKSaJkNmbKyj_l5-9yyE62-Y_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDE5MSBTYWx0ZWRfX9HJpNle6zfqD
 ReuqG++1N3uu1SPu6CAsbcUBliGIahiFgAmQJRPdDe0MHQLaNXpe7fgGM5Pm5toxiD8R3h94dw5
 uX+V6G5A6ixgUpsbM/YRUfEQzXOIRAg=
X-Proofpoint-GUID: KH9n8BPfKSaJkNmbKyj_l5-9yyE62-Y_
X-Authority-Analysis: v=2.4 cv=H6TrBeYi c=1 sm=1 tr=0 ts=6a4a9853 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=PVj2vuZyEA0yLiFZlqDmwA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-O3zn3E73KuLMlEsYjUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607050191
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
	TAGGED_FROM(0.00)[bounces-116561-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:shengchao.guo@oss.qualcomm.com,m:herbert@gondor.apana.org.au,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:lumag@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:deepti.jaggi@oss.qualcomm.com,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E9EA570ABAB

On 04-07-2026 06:14, Shawn Guo wrote:
> Document Inline Crypto Engine (ICE) on Qualcomm Nord SoC.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
> It was included in the Nord SA8797P DTS series [1] due to that
> the prerequisite changes were picked up by Bjorn for 7.2. Resend it to
> Herbert as the dependency is gone now with 7.2-rc1.
> 
> [1] https://lore.kernel.org/all/20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com/
> 
>  .../devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml   | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> index db895c50e2d2..d690eff2e86d 100644
> --- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> +++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> @@ -17,6 +17,7 @@ properties:
>            - qcom,hawi-inline-crypto-engine
>            - qcom,kaanapali-inline-crypto-engine
>            - qcom,milos-inline-crypto-engine
> +          - qcom,nord-inline-crypto-engine
>            - qcom,qcs8300-inline-crypto-engine
>            - qcom,sa8775p-inline-crypto-engine
>            - qcom,sc7180-inline-crypto-engine
> @@ -63,6 +64,7 @@ allOf:
>              enum:
>                - qcom,eliza-inline-crypto-engine
>                - qcom,milos-inline-crypto-engine
> +              - qcom,nord-inline-crypto-engine

With below patch, we don't need nord entry here.
https://lore.kernel.org/lkml/20260702-b4-shikra_crypto_changse-v2-1-66173f2f28b3@qti.qualcomm.com/

-- 
Regards
Kuldeep


