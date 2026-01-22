Return-Path: <linux-arm-msm+bounces-90096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iRJdNHx9cWk1IAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 02:29:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D27960534
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 02:29:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2C960389BAC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 01:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B51A359F87;
	Thu, 22 Jan 2026 01:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cs2UY99w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hCI4L2qz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1938632B
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 01:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769045150; cv=none; b=QRdV4cR5ZnuUxxnFGfNx6spPkBeVbIyMmwqXDOhakOL3XDt5UuMCw/E6IPI/pDpDWY0YcVfMJrXfYGw5jLoulcEkCX2mTlxHCZKFq9Fbz+4YcIwwUZnE6MQ7WzByrCFrJxpG91+5AGqEh6YOlAeVHcKrdyo5ng2t73xVhv0NvF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769045150; c=relaxed/simple;
	bh=+H7cv+ofy5HCd0ylXdnkPGSNu/ZiNUCQ/LKI/BhC3vA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SWDySYbqD0qcO2A57cVy25zHQSylooGp22tG/16FGXErKl6bO1MA5fvYH/WqYGDUUB/4FDmJ75zBSr0o4rdvif2ErMmaMbmcLBRTw+21Imktead3V+IYCCoxytYEMLsxdggHv7rXpC/CRsNi5yX66ao6yA41QkxAB+pjKE7/Ugc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cs2UY99w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hCI4L2qz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LMlFAZ2727031
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 01:25:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nTDOIcglAyeaV3ZEuS/tgzsB
	4te1U5wxfUmhA9VBRio=; b=Cs2UY99wmNX7qH8t/z+XqKX4/jbFTsyEPKVXQ/Xa
	P6HHPW5MdNK4ATUf9C83y4hJYa/E52C9NGmEIhSY2rVeGIdcgupSXMzrwO2/8FzO
	cfAzNQ7Y/914ilwesmnZ6QUNMbA27//XTXPWvF2vKGFeruKQ8gD/hwkcIGPJpCOF
	0h0hCFJA/3l25DVb/JlMUJX/6ydBUbjsvKYfRTrj3UerJaIuknv0ILb3c3fiqrL0
	M2sTanjQiWS7QMnKOKzApog6eBVDl4KmMzbe85OqpacVUJbMm9QOlqCf1XoL0ue0
	CDkrPr11AY6UJhAW6oq89h3Bd2tsycdJSy6b6hAMEbdE2w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btysft3nr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 01:25:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c5296c7e57so161795185a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 17:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769045138; x=1769649938; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nTDOIcglAyeaV3ZEuS/tgzsB4te1U5wxfUmhA9VBRio=;
        b=hCI4L2qzNdhpuaXR3lfVOHd7sHRTlMqr2J4ZcAxz3tfWqj2Gqv4xvGDzjjuOHRL3ih
         D6vejTY0BUTZo7dacHN47JF2vCamXHsCiZzqmQZiuonY1t7y7eJ+X70/6ZrjBEK8RUvt
         zfYxjgtGJgkVNKcz04414SfbH3PznHmVszDWm5YzDRwcn9wxPHPeiUMBdJlM6K40Sb+A
         6TW7oAzICE846ejzv8OxQX7qo3YRV4IN3uZY4XORldd+osRewdnSG0e2iCVI8anRSTZX
         lcR7TUob3EYqa7eaTwJyxXtc1OoEnu7v9+leKzhmz3wKJ/kf3aqDH3Safn5mAHoBsaHw
         cBFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769045138; x=1769649938;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nTDOIcglAyeaV3ZEuS/tgzsB4te1U5wxfUmhA9VBRio=;
        b=imUYdbdI0BJurYc80y+Dy65pxXiMsaIpC1FFavGL96K0sp5HuQ3OgLtiuEzF6nEHi/
         hVvxqwxDiZa96ggor28QRGRHeNjjdG7sKY0N0Rz0icmeNyIBbAJn6NjyKkYDIYyGfKEz
         VYBPG92d6Ph7WAxSP9K1eA57FXQiZkp1K8wi5vgKLbaORDIruxudTMWJLdTj+VI+LV75
         DroVcBdu8+WJGsNMom9a+b5cz3rp89IN1XJRKpL59nn35/aI8/ydJYcnzwrfzobjDUth
         z//ydc95zWfDWZbYmq9NGFwVXQXJa2Y2u9LcPTtCl0Lso78lcTTzwJqIHCca8On/fVUK
         +VOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlYaXQPgKNUU9xQaVl/QIptperiYg66uKgiRtbdTYedFIQZiF486/6yMvu2yFTy9ZQsAMvx2yADWJxtvcM@vger.kernel.org
X-Gm-Message-State: AOJu0YwWPbbAVm4kNvAcrCcANEk+OajF/lSWRf4wc5nxg+YbFdnC2PUJ
	3jatECy3WXv2azBa0HOPEiIjKabGSZzYk8hxYIRcowgWcm5u1N1uZQMDpBTpoZcRbqzpjrOlyTq
	zyKmNGsqyGkTMmpxZHaDrfTwVIio8mBQh92kSbmZmdDpwacZnmHeNCJ5vp8gN8HY8GGa/
X-Gm-Gg: AZuq6aINXxYa0g+nJ387tgIPldBMGz+E1u+2f3cGuzeLbk+79uL8xKxF+/zcbY6UtE1
	ZEdqRY6tCWZAlcFRSWtekUtAqkVaDnj2UQbdSMTTWVpIa8wVBmFmwVuR+fg27YjD4QEzWcBWVG6
	Wtgv9OtqMVS82CqdjRwZ7MpNnA3+mqrOp6dQoFrZz9mmDtX56EolIocvXMMXm+c+oec/dfixSl5
	wttb97slvJ/bA1Xt9AM8FnsRUWFonvR5hkdLcJ7p5GnvwO4gwq7iJp3Yj2a6HQ2TRfDAXdjr1j9
	4JD2VNFLAY1s+Q1C63Sd/b0a09s/FSeAPk4kSMhn//QLd8XL2jFd9xZCGlZchcNzglgjMcMGjbW
	F+1PWO1h5y47txoL97KJGc3F8XmmE12/Wz/25dd/ovHmmMcC0fP5eQk9tgxOOtJLFIHNTeYT+wh
	itYBTeT39tcBEBb52gEcK2Dfg=
X-Received: by 2002:a05:620a:1991:b0:8b2:e70c:427a with SMTP id af79cd13be357-8c6a695659emr2710436485a.44.1769045138419;
        Wed, 21 Jan 2026 17:25:38 -0800 (PST)
X-Received: by 2002:a05:620a:1991:b0:8b2:e70c:427a with SMTP id af79cd13be357-8c6a695659emr2710433285a.44.1769045138026;
        Wed, 21 Jan 2026 17:25:38 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385c933b014sm557071fa.11.2026.01.21.17.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 17:25:36 -0800 (PST)
Date: Thu, 22 Jan 2026 03:25:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH 2/3] dt-bindings: arm: qcom: document the Ayaneo Pocket S2
Message-ID: <ith2qszksbrxnbnt66ytnzuje5id2iexzueuyjbftb7t6ijmnt@rgejkddzzqea>
References: <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-0-bb3f95f1c085@linaro.org>
 <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-2-bb3f95f1c085@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-2-bb3f95f1c085@linaro.org>
X-Authority-Analysis: v=2.4 cv=N8Ik1m9B c=1 sm=1 tr=0 ts=69717c92 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=CiRNHZe3ZleBFWjHar4A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: zYaot4rSdF8Jh20QzdvPz-C0vq2ZjM-z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDAwOSBTYWx0ZWRfX4v8qehzm7TVx
 gvWt79Qh1eYf4a37/JYBDouum+1MxZD3xfCl956lbHduAJjJpxNdK0wtufeymfeOL0YOVISS1RM
 nPXDSZh6Hurs1xXM8G+0bGGLHZlsrWazIoH4KDL3IxyuIR00Bo+Rsex0ZlaPTtMuquKrf5aFUiw
 Kln2FrSnWK5t8T0ode4nyicGaEZVUqLGvw8+//lOssNO2sWm0yXZ+CAlppzFZKHXchwRYvIMBLw
 9M7NUR3oVHXGYc8tI3WJ3erBp7wFd/359lw5TynyWh7WttTAdaZGh7ZUfvvZc5ylj4C/R403Tuy
 PmfL8SuDvXVs/vQQ7WcBuaEzegWGcIuW4uwHKns6ql07eDwPZwvgxbCCRoZH1/Ph0yBpKSD47Ui
 3kIF7nFkLCM1PKqa+nkphT2xy8qD0Dhz2vvkGwV4hTlp8dQIpqzPuZiQ/YHDM3XEgxp/m0hFFXR
 8RyxBMzLqMKICYXoaWw==
X-Proofpoint-ORIG-GUID: zYaot4rSdF8Jh20QzdvPz-C0vq2ZjM-z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220009
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90096-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8D27960534
X-Rspamd-Action: no action

On Wed, Jan 21, 2026 at 05:40:27PM +0100, Neil Armstrong wrote:
> Document the Qualcomm SM8650 based Ayaneo Pocket S2 gaming console.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index d84bd3bca201..c6786dac5b59 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -1045,6 +1045,7 @@ properties:
>                - qcom,sm8650-hdk
>                - qcom,sm8650-mtp
>                - qcom,sm8650-qrd
> +              - ayaneo,pocket-s2

Shouldn't the list be sorted?

>            - const: qcom,sm8650
>  
>        - items:
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

