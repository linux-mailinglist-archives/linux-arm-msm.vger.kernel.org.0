Return-Path: <linux-arm-msm+bounces-95146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCE/H07opmlWZgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 14:55:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8362A1F0D19
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 14:55:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3ABC13199DC8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 13:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 197912F5A06;
	Tue,  3 Mar 2026 13:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZtoxKDAP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AxFjhhd/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E05200110
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 13:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772545632; cv=none; b=lH6nty2J5aFOJZWNMgAemhjx1Zs4FhtUqWnx/mSHCZq0e26LuhXciRPQY7OiQ1cqP5L71stGHIRSc/EYSikNOvzuYZiAhEkBuctOTnJI9ORs9uL4c8xyAhZ7FmOKuXhMrwx7Li7jATqag8uA7Fbm14VfXodiI2Mnh6Dt8Hn5Xqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772545632; c=relaxed/simple;
	bh=ILn3pYF+j3KNOCDvMSSMtmla6/1hCaukLbxk6UdjnVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kn71pvsXuEMP1zYPOCP+1X1vd0XUlqw01jxAkrREiN6no5yRKEj0qkZU/uK/TaIkTfhq2x80dTsSjQMdxqa8tN1W8BpCcnJdyJgIHTwhCwT19NTJDUQRAIVekIrKy7TAf6qugyL1AQj+wkfP2m/Fra4gzi8lJ/sle+vTyl7YHW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZtoxKDAP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AxFjhhd/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239mqS22307649
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 13:47:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oKgmqL1YCMPv2o6NC8rarGbo
	mPdgxNVvsx/kVplRDBk=; b=ZtoxKDAPjQYaJkMtZodUOrx4EtRFn1y9eFTgplZp
	fcV2xPKmJzWL5QPt4VxvtzIHdIEd65EzM7q4Siv7m5vAfzV82qEpPJq9epyF17ms
	5e8oz2M7sXzpN17CU+bd88Y+4te/SQMRNXZc9+aXAWWAcfa0vwF34IAtJTcsHgzU
	AZBshHqu3MkMneDgKiTCNC1fWkjXYXDWylb1smKU4TtchvrFhBRxCW8f7D19nM3y
	l1dVGeer32Ggkx1fQxTzIOHhMqCDxBsXVRoZ4kZoNieUpi5S9jAdiIExPtEYQ0yf
	b1n01/Xob1cuNL9bfgjZX//cSv7eT8vA603/XH260AyYcg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvtu8shp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 13:47:09 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-899f1c1e4d6so110590796d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 05:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772545629; x=1773150429; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oKgmqL1YCMPv2o6NC8rarGbomPdgxNVvsx/kVplRDBk=;
        b=AxFjhhd/vwrWvphKc53vLWsW7GrA+6lFT8tc4cW1lIEaxlqZyfRYtoUgKXaZTeu/Wd
         d4OD6337LoU56H8xMIqixJLNPGjMotyV3t3IBJbSJ0iHMNy81JqnUzme7Iz1g32aMdB3
         SPMlEg7quL3pxXlPu8haNpt+BrOzZnN+d777ek7dnLhSr5PbYXONrW7QeAjWJi2hOM7A
         LLY6UQjLuX0+r2C+PFNwug6G1JmnxpbeKdo2dKghH6/vYuA8psSRiyVfuPqSmL3jBbyg
         W6eCmaB6lOWVji4pxmMVnS8YEPLJzvnQmXMGI0gWfNU8i3xLBQ5Yg2rxxFRNsa84C4Y6
         HTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772545629; x=1773150429;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oKgmqL1YCMPv2o6NC8rarGbomPdgxNVvsx/kVplRDBk=;
        b=tGH5DYwL0spVki9R5qRC/qkOhrVNW8wfacUvxqFcY4ffeUjHcfeZOtlZnOwaMB7+SX
         T9uaEgZs+UlSg64f+2ejKizWkSIcrPhoPFvpkgduGbWRV3GLdYmSIgZCDB0zhVhkxj8G
         gA1HTnTWTtINE583elnFgsY1SlvK3iYZKuC83igkvO+W2j68k2XvxrKjAJDla55hP3iw
         begfErEKLlA8OGS97Dc7phLheI5vSjZPGpvhRzPAr+H+51Mt9+zEHL6pZdzTRYLbrWW3
         O61oOVGVFOHpb2kSPtpgDEeHS7zDf3B6b55K2aOS1u7PoPNwNVP41AbJ7SyvMpjlrrbH
         Z93g==
X-Forwarded-Encrypted: i=1; AJvYcCW3ClOAWfFUJ5NgG830obBhMHNc8jJl3XZqQXqIPYFyvh6sNXgoBuLGy3IFig3KEdVhRF/n/8KVPXx9auNF@vger.kernel.org
X-Gm-Message-State: AOJu0YxzenXBZEdCw9u3HEpxTjsMhy9UpNDzJI0LKzH9PxIIGhzy5gZH
	rhGjB7n+9L5yPTJzNQALymDkPKdanVfynZKfygKnVsWJMS2ulgNF1/y4ITJS904S0L4+EiSAOQf
	wQYrArnZZYIBI53uqwCxQ2FL6pA6ba82BWDBRRUF0wcSfe3IRCqjPYoHTGzGe71hiViIz
X-Gm-Gg: ATEYQzzNMkv4fuLMii8N5N5HBWGYNvbU+K8Z4VAANoPlLIv9zxw4bzeoPUSvl8E+jcU
	J4pV8t45iC9CWJf+IOK1jFq6Far9G++fB00yz2wEYw9CG/7w2ki4yxnSA+YnH1Z9HANXH04o6WN
	Cf3j/ADcl1XBlNvZjZ61KNfbVblSOnx4tB96KEOTujSienqCJQMPvFDwNhzpLP0AU8nhJsyTl3v
	595WDHr/ZYer7dTYndzmM8Dw/rUQrL3qjnhwkEmIR8zspW4xPWk9KdM/h3Tm+HpjPgELK6YZeFo
	1vQ0MMZqzv5/B5J+bxHeLOa4OZxwNRgspS6tkmfkpNJskH1OdbI+3lAXn7YZI5HwkLaAgck0z3v
	1D46OTkLTO69RsDwORbJ/JYfAkYz0QE+i1E25XjSbY5sIDxlQB6HSpqkGryhw1/rXpkSV9sOSlg
	xWIdg5BBqlk9aWob6G+Hbnj6+8XXzSLmy7LnQ=
X-Received: by 2002:a05:620a:28c6:b0:8c6:afa6:2700 with SMTP id af79cd13be357-8cbc8df09d0mr1830334585a.47.1772545629089;
        Tue, 03 Mar 2026 05:47:09 -0800 (PST)
X-Received: by 2002:a05:620a:28c6:b0:8c6:afa6:2700 with SMTP id af79cd13be357-8cbc8df09d0mr1830329385a.47.1772545628539;
        Tue, 03 Mar 2026 05:47:08 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a123578897sm597948e87.63.2026.03.03.05.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 05:47:07 -0800 (PST)
Date: Tue, 3 Mar 2026 15:47:05 +0200
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
        Jonathan Marek <jonathan@marek.ca>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/8] dt-bindings: display/msm: dp-controller: Add Eliza
 SoC
Message-ID: <s27pxj2gcjqbw27xslxzrhwl5nx4vez3z2bw423b63ddks6bag@hy55hk3hvefy>
References: <20260303-drm-display-eliza-v1-0-814121dbb2bf@oss.qualcomm.com>
 <20260303-drm-display-eliza-v1-1-814121dbb2bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303-drm-display-eliza-v1-1-814121dbb2bf@oss.qualcomm.com>
X-Proofpoint-GUID: TN8HwlZpACFy_FI9LtOC4yyu8e3pFvg4
X-Proofpoint-ORIG-GUID: TN8HwlZpACFy_FI9LtOC4yyu8e3pFvg4
X-Authority-Analysis: v=2.4 cv=A75h/qWG c=1 sm=1 tr=0 ts=69a6e65d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=28-unnAo_Gxf_zrB-rwA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEwOSBTYWx0ZWRfXy9MScK47BYGO
 Pi5eaMC56egIOpRN7jwmR2UvVkF+F2u76jqtxXPSh6Eb/Rvuxrkda4iwNmd4+6QASvqLAYRfqed
 awI0/OUq950ASZBue33uuND1LWVi6ljEh8aVDTquKffMvQ/WA92NE7Ib5JeMGvCjtfGPmVJ2mL8
 ydj0KgUyZYXJPmi845Ke37GgwjnLw/LFXh8kuGiZC/WFfJd7dbBNSBH0WZUh8IHVXzBkXBHeqi+
 JnpNB26ptQyG2To0+ec9za5tyGrWywisrHzIyWzx849q3j1J4TIygnWqhz9iCSDI3vIdr9eu0ZT
 kNJmdfAu39BjhYAEt/y/fj6FMrgO+aiOBgoiBUqcE4D41rXiGyElWkp/UJ4J08tNwotnuHW7n+l
 rKv6WicVejZTTomjFMHKWOnVVze0bskDCdzejubH+/95ygfd9jR94ZHuIXbUzJGWb5/KhR15MQW
 r+wehhJOgKhAMoHzEtw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030109
X-Rspamd-Queue-Id: 8362A1F0D19
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95146-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 02:07:51PM +0100, Krzysztof Kozlowski wrote:
> Add DisplayPort controller for Qualcomm Eliza SoC fully compatible with
> SM8650.  The device looks very similar to SM8750 (same DP TX block
> v1.5.1) but with few differences:
>  - Eliza and SM8650 use DP PHY 4nm v7.0, SM8750 uses 3nm v8.0,
>  - No MST (according to downstream sources).

Don't trust downstream sources. HPG shows MST from INTF3.

> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index ebda78db87a6..d06d396df4c0 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -67,6 +67,7 @@ properties:
>  
>        - items:
>            - enum:
> +              - qcom,eliza-dp
>                - qcom,sm8750-dp
>            - const: qcom,sm8650-dp
>  
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry

