Return-Path: <linux-arm-msm+bounces-101821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id hpGzD+CK0WmFLAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 00:04:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A0D39CB31
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 00:04:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C38DC3008746
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 22:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 078F2366045;
	Sat,  4 Apr 2026 22:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fQc6ojR0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iLdnXEgD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4FA2EF67A
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Apr 2026 22:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775340251; cv=none; b=me4ygI9NEM1O5JC4II36sTYXclq8FP8N8SBJChxLK/2stnvT6b9XbedXh+WAFi12VvDWbf+PJav7oCCL6fwaeHnAja43VuPTAAqFBfIops7kw2HpMqp85poVVCw+B+rI/IpRVzjFk+VHTe83cGpCnxB4n88N/2SSrjxfC4IU/Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775340251; c=relaxed/simple;
	bh=sBJQy8FSigpIKdJUl4vZ6PzVWafy99zw2Vw7aZeTlSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=egywQ5wISO98TZMltRUdxZ01z2iyz+zZEtkS3cF5tLKPN5Q3XmCWtHX8Ga+MeXNOpap0Iad7Y0ll8B9FvUcgAxauAe4Z3aLg/g4ygW5l6KJJLdMW9hcGUmEBZMOPlLxFD4U2COXSfQyL/CGTZ4ENtGcXRkqsWTzmBVrAzSaUaNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fQc6ojR0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iLdnXEgD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 634LI81V789250
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Apr 2026 22:04:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fMtC8gnkL45PHMz0CqL4xQiV
	V4b9ZWUXoORtR6sfzss=; b=fQc6ojR05j7kLyT6jQFtg3gnsfHZ+OVDYLfC41gi
	ssCRtdAN2E1lIAL/tmjxFgu7qT+7npY3OQouTMOwGEhFvdZPOKqg0Qvw7HPtPZy6
	g0sX9LG15RxbB7bMLr7K2HnfmJPoDcaGWPuc1AwnoGvJWEAHlM3OjPEyI7CKKlxM
	GsnH7zI7hvz6stn9W0utDfRbUDpY/2VN3ffeiKpbqftcS9Nkv0rt0PQmTiEf2hq4
	J6J1iDe9xHqRImb5Ikm7vtPHq55Zs/HkOMoMx5MgMu4GvNxDw+VwnyzFel6S+EJj
	tm4uVzv7HyacCNlj5VcKytFq+FW6Tij2iUy7KkSoTODxYA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dauth9fc0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 22:04:10 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89ffce20deaso138161616d6.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 15:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775340249; x=1775945049; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fMtC8gnkL45PHMz0CqL4xQiVV4b9ZWUXoORtR6sfzss=;
        b=iLdnXEgDyPBUhz5D8iGsxHZLKdkaAT2TXrHyzCX8t4JTUVNDrVQZMgzHDHW/BN47MR
         goExKv41aVHT+O75DAKdQ9ebY9gjLrmOlImjske5q851ZFnIkg/BRPsPZT0zxjvp0ZRT
         LdeBII2uy7l6pBJNIqfMEuW42QTJTYaLmo+ZFThJBW1YildOwB460lp7jZOgfu/vZPr9
         Vke/6bHyDbd9ND29CSy1TFvhh6Fb5+rFmR8pVl5mkPGJW8zgR/3zSfIeFOsNJGyBJJM+
         64r0p9kGHF+O2CJThBvRiyrg0oWnIM37h3Vm5vVnTdEYXURbEDqWblp41cxpb6bwKHCH
         GGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775340249; x=1775945049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fMtC8gnkL45PHMz0CqL4xQiVV4b9ZWUXoORtR6sfzss=;
        b=LtRxOORwGLlOlqy/IOI5taQkBf7ZhMQow1KZt68haF0+a65Rs5cLZNjzoYMs04i3NE
         pF/apOD8K34YWmQgvRfTZCWUrF5kS7iuj5bsB8SP+xG7/ZrJtzUxFJamGPTmOqv2Aj3R
         vQ8kQcP+GrSWhr9JMXaBOEtqu8U+dC18eK1gkVMwWGMJjTsMgOvmow3X7ocfo8ZIK8vi
         Fg0XsvfKlhvHA1FWy0n/064d4BR7xvs/GvEjnsXdl88SMvnSlWkX0qSfVkwzSAftCq0E
         Gz1rBg2btRU5QAVURItNUDB+kbm95MOtmqCnhOuJ2JWpEG7Zjpic9jzLQ2o9lLmLWNZW
         Wstg==
X-Forwarded-Encrypted: i=1; AJvYcCWplnOepURV38ePNM+XG0cY7ygT7KR3NV6v3FSJCxOwE/ArSl81tTSz7tmDuTh59EuF0+Io+IgEU9mCX15t@vger.kernel.org
X-Gm-Message-State: AOJu0Yxri2ZKmKQyHNJDghB3g/puzLS0T4p/pJSEu/2Dt3HzOp8MCiaC
	2iXxWfD+7DjCCzMJVg+U2cczn3iYNAavUzj6DdOkwEpOaFgEBMflTZaCH++JrjEM3K1R1Ic1SM7
	B3dHZh7i7sGHtAO4pfeAqEhmrN+7L7Ot/FlkeGL/VNd26roDTd5pyWXj5oKyFb8pcsN29
X-Gm-Gg: AeBDietGwJRwJCSrfIfkrGDVtAY7jhBR0Cv3RDO2i/tApQX2qZCSeou0VXTucxlvA0X
	w8Nr0lkrp/jwRlv5GRsedxPiHLnMcXaTifRfa6/xzOapee2uhMhKvXtalzRcnxktY4pJ2Hm8Xtx
	84mInlkdUHkgmtVVHGZ6Vu1FU5R3XlsV7EF0OLRwBwIdn3NV2k/OGtBbKZjjDuzb26LoX76OVAN
	e81bm8RbA7QKxaZE0mLtUlr7WF6Nv/7jJNDJnKYXHoORiLveyReZHgEuCJio6PaxDnKvwt3eQoc
	Rw7vhQ4b7I+pKGLs81uYLMstU2xNSI5/VK1m581yroyMBWtOk1laLBkNIAkii8qEVdX8NQEsP0+
	+B93mujz4PjmYWaaL6SiLFAk9XkhDm4qzrYn4lADOnOw/5b3BkWfXcVEiXITMLhSje54SRQJedc
	bgKQLLGaJr/alfIzFwCuffE2VwSWFhbYIYFOY=
X-Received: by 2002:a05:6214:f2f:b0:899:fab4:730f with SMTP id 6a1803df08f44-8a704bb7389mr131488996d6.49.1775340249026;
        Sat, 04 Apr 2026 15:04:09 -0700 (PDT)
X-Received: by 2002:a05:6214:f2f:b0:899:fab4:730f with SMTP id 6a1803df08f44-8a704bb7389mr131488686d6.49.1775340248618;
        Sat, 04 Apr 2026 15:04:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd1fdd208sm23015631fa.12.2026.04.04.15.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 15:04:06 -0700 (PDT)
Date: Sun, 5 Apr 2026 01:04:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/7] dt-bindings: display/msm: dp-controller: Allow DAI
 on SM8650
Message-ID: <ozofiq5dwk7luisfa6a4e4wbqw4vuvcs2h463hqxt7uee4aod3@j7aslgp4hkn3>
References: <20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com>
 <20260402-dts-qcom-display-regs-v1-2-daa54ab448a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402-dts-qcom-display-regs-v1-2-daa54ab448a3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIxMCBTYWx0ZWRfXybNTKfn+DoxR
 M68oJv/9otnRP/hIEVVgz6h8v3b2PSBW9a7R+Mjg3vAci+AYGaf9G0aSU0IZeFHYdfU4e7Et+bg
 TPTGHo4cu/v/8bxEJ09mam6AziVRoTF0v7DkkjxcnFUvQH++Ort3Kxq8P0ZDR/XMOzMNvoNGVk4
 4ku67Y0516S/FTJoZMGti80LoNjgZXjsobLQ6r3YuIVvtKlaGmmOMwfuyvqJ02M+eBP8OomUM/K
 eVc2Mvxb/HpP9QsxpaxrEgG8py7y8jLvMcNarLH/jQDL7L78NTJ43jiGJ3nqw+z1N3gu9Uk7wxs
 Xw1ndUBgUQincc7edxcpvdO9mrgt+ln8i85ADTO/Une6trq0KLcQ3Sa65NM3RAL0Y+Fl6z9J45l
 6sWU4Ziu6hZDNaTlOIJXshgVNmmm+6uHbOQcI4X3kYc2LBI3L2ffVvHsSma0FoF3YWK3Un+mvLa
 5InYrZmCKxa1nuh2SkA==
X-Proofpoint-GUID: Jub732ozqaGIGzXZVur_p8Uo64x-rzA8
X-Authority-Analysis: v=2.4 cv=MIptWcZl c=1 sm=1 tr=0 ts=69d18ada cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=RWX2ZFlerEUOqWKuYikA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: Jub732ozqaGIGzXZVur_p8Uo64x-rzA8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604040210
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101821-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 80A0D39CB31
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 01:45:13PM +0200, Krzysztof Kozlowski wrote:
> DisplayPort on Qualcomm SM8650 (and compatible SM8750) supports audio
> and there is DTS already having cells and sound-name-prefix.  Add SM8650
> to the list of SoCs referencing the dai-common.yaml schema to solve
> dtbs_check warnings like:
> 
>   sm8650-hdk-display-card-rear-camera-card.dtb:
>     displayport-controller@af54000 (qcom,sm8650-dp): Unevaluated properties are not allowed ('sound-name-prefix' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index e4f17d29343b..f8daaee8d065 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -210,6 +210,7 @@ allOf:
>                enum:
>                  - qcom,glymur-dp
>                  - qcom,sa8775p-dp
> +                - qcom,sm8650-dp
>                  - qcom,x1e80100-dp
>        then:
>          $ref: /schemas/sound/dai-common.yaml#

This clause is for the platforms which can work either with the eDP
(aux-bus) or DP (sound-dai-cells) setup. Instead please extend the else
clause to $ref dai-common.yaml.

> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry

