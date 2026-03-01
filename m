Return-Path: <linux-arm-msm+bounces-94769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHrBCl3ApGm2qgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 23:40:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3CA1D1E3D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 23:40:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 170D3300A32E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 22:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AADB375ABA;
	Sun,  1 Mar 2026 22:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FmVl9CSH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CcfRFH21"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF38731B10B
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Mar 2026 22:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772404826; cv=none; b=DXZXNgPb+xG8ij65wvhq5Yc0lO4s6szoarFUjWTB5qdE6hsmS+0jtS2w3Ozrzne92PtKfowQXAPRm/SSYUQUcdwhHK6o2Ce4lzu+KEN3xxBu4c4MudrRi6E2TwK9v/+VpFW+ajU4WjLKN3vXnARDTlLDePbBAECalSUhwwT/V5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772404826; c=relaxed/simple;
	bh=RoF4CYBqOCcTIp8+OeNsYC8UEsKn2n9wht7SnNtDGfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=esPDQlUXtOgD+t3V4cBQbiKfOge2fmyGPED9HXyoolpGEQ9S4W7KFBwhgX1t2xRx0i79FynDhsg6xi6fcoKs6VRr9zfAcLojwOyrIQCydt+DEHyLewAiCCLopTZEryBxhhlF2XT1sDC/+2ie1lOHeBDhwlmGOKPd8OzJuwyTyEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FmVl9CSH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CcfRFH21; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 621KXuDa2028772
	for <linux-arm-msm@vger.kernel.org>; Sun, 1 Mar 2026 22:40:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=liHMhkUZwLObZQKcaR0dCOsp
	FbGoGsXIqL6LcZpPJfA=; b=FmVl9CSH3WuzakbWRWrtDYLnsJ1shhPHQUPlDcIe
	+9lv7bblF8fP0J2Pw0MmfcBT7vGoLQmrPCXiIyWaJu0Jpx38Gh8RfROnel/TuF4+
	FK8jVR4/TdHq9zqhye2kFv4nJoZqwxlJcfl5J8qRo40FtvI5l9KnemiwpioGxqWy
	2BKC+M5JSMqOQ8tsfh8ybY2Ho+JnCHu63zxiQh4uw/2OG1SYzfPgHMYDB2q3qeWx
	gGAk5611x3LjEVhtnZ1p8DG90CP30UrenFVjdemKCH2eU1rbTYOYVyRxM42JCdM5
	pOKXaUr+dFIY4po0vGSiOZXqlE3IeQ0GEjUxAoNgI3xOhw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksg739q1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 01 Mar 2026 22:40:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70cff1da5so2962773285a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Mar 2026 14:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772404823; x=1773009623; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=liHMhkUZwLObZQKcaR0dCOspFbGoGsXIqL6LcZpPJfA=;
        b=CcfRFH21mWxzdpaRfR3TO++Ob/4XgvqrAImJXhAnH3OLnF+QsearLgsFj0fN8kNXie
         YHyZa4s726kRibxG/C0XPG+K3h1NmegA5pXO/03G6iigQB2dDGVRk6qJn5gdElYmnByH
         7ALcm8YlQ66vF7P0tzCJLLngGfCnNhQstvCFsBzuoisUK6IUfSWSpp0iY8Xrw1avInOF
         RIUAOwibinClXgJdIrlc+aHGNk7J6yYq/o0uHdNfOK4cQjwES/sihif9bYnD+bbspAHu
         OINq3TmDqpJDXZYkA1hjEdxt3HfmZt9xhQx8wDMCHTLMdOjLCqf9RfkYbuYo7LoqH1SE
         B87Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772404823; x=1773009623;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=liHMhkUZwLObZQKcaR0dCOspFbGoGsXIqL6LcZpPJfA=;
        b=lp0jb/ypOxtDg77Pm9PQFq9F4jxuea1vQ4gV4jXxoze8Ax+hsrZRhsEm3H07VNtORa
         5XaJUIcKlclNgK799oY4H3WE4wnN/N3XwE8gxYyfSDNjVqpEwJ4pWmdgvuS1LjcI5RS/
         FLORbm65y+ta8U5mS1GO/ZHUXdZHA8imariJIgltTprqFK05NPGjKyAMxes/o0iqWNs0
         x/LG+myEdJo1J4SxVdMjVgratjhdT/HzzVXE/pOtmojP4j4P/6UWTD5jYzlWVzF+5ZXF
         jBKWbXdk3aHYMs9rnFL3obQLKQERZve+uW2cq2hi/7ekVaHi33o18GYMMe0lsKMfQnjx
         083Q==
X-Forwarded-Encrypted: i=1; AJvYcCWKsy8Waru6GIHxSiWdwKe+F1jqlm7EPEWs5fS1ammq37lNZ3TklJkhshm2RnlEDEMUngeXmIXav6B7HNAx@vger.kernel.org
X-Gm-Message-State: AOJu0YysMxL2O0BtfG54r7L75feqcA5jlACJ5DdHHyRmJsNEwGlD39E2
	1YzQg8Wl/N/HQvwU3IQq7PGttEY1l8mpoZwR7zgYlf253V3GHLKtUSFGoVQAe6j2JJXcR3bp0PN
	FmHt+iup+A4zNV2Hn1R4/LpBD77QAEVN2q2P2HyD0oSc+K8d8GGH/GBoPDeiySSf8NQXa
X-Gm-Gg: ATEYQzx05gOl0mL1V+FvgSPyS0WGrs+pLd0JuiDdE+c37DsLsEO4U67IWLdmxFsHqs+
	Ya9OYkiFxbpVvgj1mipyzgHHF3vR4BQsZ2X2MaUrf9lvQh2fTyR3pSDqYGbi41iv68BtdwVmSdh
	dkmoAaOipQXzgjw06NfcxE3tm5elWuzKVFj849r3oPnua/T6M0JRSLb8NdKFf8zNifi6XW/m6QN
	lHVMEUjR4wJJel6Rf87aExtoHnREFdINvKzVSSivFY1j9+MXO1Ib1d/cvIA2RorFLngyp0j+I0n
	WbEzz3vxc6L6+c2iXBtwKFK7HpffkWxP4138XAX+32r7VKlhEavzj733wcEzpAyci5jJ9SE6OiP
	26By2ndD/atDyXwR/LB+h7gWRtZpabwlpLHXgfL3GNnZ0jU3drlh6x9XzDgEUUOb+HTvoBLxwQ9
	Zfy6NHNjYVFwg557MyRONRWvbEoimDFnk+PPg=
X-Received: by 2002:a05:620a:4413:b0:8cb:4a64:f482 with SMTP id af79cd13be357-8cbc8d83cc4mr1468464285a.18.1772404823132;
        Sun, 01 Mar 2026 14:40:23 -0800 (PST)
X-Received: by 2002:a05:620a:4413:b0:8cb:4a64:f482 with SMTP id af79cd13be357-8cbc8d83cc4mr1468460285a.18.1772404822548;
        Sun, 01 Mar 2026 14:40:22 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f3016bf6sm24553701fa.32.2026.03.01.14.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 14:40:21 -0800 (PST)
Date: Mon, 2 Mar 2026 00:40:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 08/10] dt-bindings: input: touchscreen: st,stmfts:
 Introduce STM FTS5
Message-ID: <qibmsgfttxo6kiaqyjljj6otamqp7okfr4abwpmuo7daanl6qu@ka33zvoz7lte>
References: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
 <20260301-stmfts5-v1-8-22c458b9ac68@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301-stmfts5-v1-8-22c458b9ac68@ixit.cz>
X-Proofpoint-ORIG-GUID: 4TfAJ2Acj1agEz-i_S60Z88h8ewhSQFL
X-Proofpoint-GUID: 4TfAJ2Acj1agEz-i_S60Z88h8ewhSQFL
X-Authority-Analysis: v=2.4 cv=FaA6BZ+6 c=1 sm=1 tr=0 ts=69a4c057 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=tZRLSl_A3aL-_mRAmj8A:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDIwOCBTYWx0ZWRfX7GnkdNuxDbsg
 pL8etOhxg4AS74J8rARB2NA3ZFZ1iF63/b/0ug4PcS86mzaJBzWhLxc01eN0m/T4gKKIFd1DIZK
 LXCyLV5Qtngjq8G3gCzKmv5oRQGc3PAVjAu0wMGYzgq9gxCTSHdnDDhi6VMwWaYi3h6CmB9CZyt
 IlJhY5NvkTLaDiXORE3ITWyZ8QsiYq2Gi51J4WEo7G2iyaistRqo6S2EDPCk4Mjza+ao3Vofm9q
 AVOz5SoE0JsPa70mO3WsqoJypRo1LcfDEBGmLCOmiNm5fAuacgUSpOb7gAs76uXy6LYjcpUQzhf
 7mApNfkboEss3b9L5VD4kN6vsfH9nCkRpamjoM9pkFXaaB26QqE/rMo/rdg8Vk+38EtE4nUoBQ/
 I7z4Czq7IQD+odvottdb1hZftdt5A4ORbRwRqhFkS7Z+o/qmmirNAlexS2vUgUN6xspywvqxkAj
 Rz4dwRg46O3LwJ+cmcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_05,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603010208
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94769-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,foss.st.com,kernel.org,bitmath.org,protonmail.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,ixit.cz:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BE3CA1D1E3D
X-Rspamd-Action: no action

On Sun, Mar 01, 2026 at 06:51:22PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Introduce more recent STM FTS5 touchscreen support.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../bindings/input/touchscreen/st,stmfts.yaml           | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml b/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
> index 64c4f24ea3dd0..329d89977bdbc 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
> +++ b/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
> @@ -19,7 +19,9 @@ allOf:
>  
>  properties:
>    compatible:
> -    const: st,stmfts
> +    enum:
> +      - st,stmfts
> +      - st,stmfts5
>  
>    reg:
>      maxItems: 1
> @@ -53,6 +55,19 @@ required:
>  
>  unevaluatedProperties: false
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          const: st,stmfts5
> +    then:
> +      properties:
> +        switch-gpio:
> +          description: Switch between SLPI and AP mode.

This doesn't sounds like the GPIO on the touchscreen, more like the
external schematic component. If it need sto be turned to one position,
it might be better to use GPIO hog for that.

> +
> +      required:
> +        - switch-gpio
> +
>  examples:
>    - |
>      #include <dt-bindings/interrupt-controller/irq.h>
> 
> -- 
> 2.51.0
> 
> 

-- 
With best wishes
Dmitry

