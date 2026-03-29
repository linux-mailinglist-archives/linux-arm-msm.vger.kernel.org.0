Return-Path: <linux-arm-msm+bounces-100609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHtIMgkIyWk3tgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 13:07:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17ECC351B84
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 13:07:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 189F73012E8A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 11:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6064926D4CA;
	Sun, 29 Mar 2026 11:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MZ+FZg/U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TU2zXGdL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC8A2D4B40
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 11:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774782331; cv=none; b=RjTsVY3usoCc3qILoxMKbKvZSrVhapuJ/CE4NPXNUkHzHaZmTfUbLxXQ9L0ZwBgRTSUGPUOYbTfes4pmu7/SSFiEh8/2az2J0eThNiS8WD6Ab4I/8OknJb0Ybb+m1lSKRyALTtthubMhdNObp5I1IiBgyqh5PZjul9CvZTRlIuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774782331; c=relaxed/simple;
	bh=OgQFmR7d0QTg2q/pOcWRKLoBjwr4jnSdQ/zmViXrg9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DynNMFwqLbCBTHP0wCVdNx85YcssGI2pmnADcu/qiEgK3o8MIa26Ym0AlwhdTXmC4YuBIunyx1I3J9hBzTYmPLCwcazzuPrkmuBrWMR268AJ4Yy3t/fblZ4aRF1Oq7z8Y94GEjhCjFp/9cEG3scnH75GGDutkCm1B4J6SRxZ56g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MZ+FZg/U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TU2zXGdL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TB1Jkh2229496
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 11:05:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U7sDMrLma/KSN1eduAy4SE+M
	hRTl3Z/KMo+PH3oKTRU=; b=MZ+FZg/UcZWPd+xzE987SHcrT2b3S68o+Mt68P16
	jaAABv1MAadxyLUwIiGbc1tLnjN/VwLMjGx2UBT4tiZS4qW6DDtgDYuvE0Vwc3VG
	AZy5U1WoJdFyAGbSmiqwXeiHw4y9Im25XkIH+5b+FWfJLZt7cyNLBwKcAYiaia6u
	KGz0kwMhsx9GjpvJwB5Le5oT/o95Gzxq0qn0OsklahmF8x3s6HiTOCkeLSxBZT4O
	rry2WFiHcbb61B4sBKrCJrtbOLoxWBdGfPAjjXJCykdOIIe4Lon5nXd/KaBO2oIr
	1H5YasZk8puuj1a1vmlQa8Um0Kq2MU3+XvrhQi4Z0k2Q1w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6v9c0jvp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 11:05:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b34223670so35324511cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 04:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774782328; x=1775387128; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U7sDMrLma/KSN1eduAy4SE+MhRTl3Z/KMo+PH3oKTRU=;
        b=TU2zXGdL9DYyNSeC9dT0Hayf+Ccma0QxG77Kqb0oQisVK3VdeKmg5E7ZiqG+VFvazQ
         2h8XMT18yqovpSNspTVT4orQRb0qFIrpbcUuRK2QmirF6dq0nGu8y6w8E5Q6QJFcH/x/
         JMOA2bUxcWEE6ODn9as7YdNuv/foXHuBe52Pw5Cd8KGtxb57HCYWGqAZTl/fSfnDlwfU
         T8mDnzFe2PVgqRBf+XSx6iWirm/eSl9yDWnyYMqoItKqzip7cv/NZpdRhiy8IuR7gFgD
         xJyffkVi41KjHJvqvW93r6qhRfvomQCk1k37hI7/XyXU1CvC645A19u7Zn7gnJ65q2TE
         Waxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774782328; x=1775387128;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U7sDMrLma/KSN1eduAy4SE+MhRTl3Z/KMo+PH3oKTRU=;
        b=H/fYfx6G2wa4mhtc6NiwztoaRmAfJMe0gkr4uWZ3h3gF0ZMZcNE8KvBG85b4KDBujk
         a91jj4UxAO8jy3EqiVqdRUg8g3R7DOa+/fOBKCJ+tACsMO86cDZLgMn3aN5/6CHOaugb
         QwpGbqZXc9tq75S1Ei1JNyhARO66dYNHVCWV4IBT4qsTc332pBSvYW+g7+YFR70oH+Jv
         w473gyjwmjbHEjvZPFwUS6dt7kC1Yzrdo7phG7bGfFxrJLEC4RNj6H0QeqnTMGQ6fMtX
         RG2MuBlGFiuTXjHQBQKrRqprNGx4dRKDjvfcmUsjaFxnDHzBtSJP2DLplCJ6JhjLC5Lj
         YH3g==
X-Forwarded-Encrypted: i=1; AJvYcCVyGOjCagdD8fyJ9OsltCQ0f9Jccfm8mAZDjlrX/LCV8lMKMJIErV+KzRGzeFw9KhVKwpJrQk1mI77Ua05Y@vger.kernel.org
X-Gm-Message-State: AOJu0YzfDcVWxyEAh2nBQxk38LugtJoScwI1qT47vUzZCuDtxboxGwUj
	BL8gXTDRWQYS4i69rTSYvRCu2qDGfBzMMUwigIxOe7wmLQSB5HZ7838ncO14AdDK7vSobhwzm/W
	a7OMV8aW5QLyNH9Zoy26KAjj2PYe5Bgc/LSGrSLTxqKKt1sUSa5mwffgQDKyMEqt0uNrnOJ5j5S
	aO
X-Gm-Gg: ATEYQzyq8wU2R7i67PGx6h4CJZy/wzzklGHC59Jl5ax+INnIkmPl5iG+BtR+cMjhB3X
	kDH/9LInhMzUi/mWB/KdklzAMJF/BVQI+LnsYb2RZrrVWaqKJ5SdbDcuVIdi3QXWavJywjQEfwq
	NoyoCEgrwpYWvb1s0vMOCB4nVf5gFumwn2EMQBUfjTawpqtp+DU/59qAZdOrznCg6reb+c7BE8V
	DKa0LZXorGIEfepBThTuTerqBdALQe+Jp0FuxFwoKZ13iLWt9UlWzg2wXeqsthJED5w7DyyTKkl
	2zeg5DyL8GFob51RuA1R9gK0ncZveb8KVwWDDHF8If52lmxfY6qxKELOb8JF9pI6JlbyV/YfFas
	RvCXHsvt8iUbIsoswB6e+6qKaVb16HYaoFJ9WUv8mav/0TqhMpTaW+0soawOJvIf0e3FqDSpB2X
	DKUedRoOuq5fcGw+wt5f6A95uYRxHETC+6qzU=
X-Received: by 2002:a05:622a:4cb:b0:50b:6cc1:38c6 with SMTP id d75a77b69052e-50ba394dademr109569191cf.55.1774782327932;
        Sun, 29 Mar 2026 04:05:27 -0700 (PDT)
X-Received: by 2002:a05:622a:4cb:b0:50b:6cc1:38c6 with SMTP id d75a77b69052e-50ba394dademr109568911cf.55.1774782327547;
        Sun, 29 Mar 2026 04:05:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c8391fe90sm9075951fa.42.2026.03.29.04.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 04:05:25 -0700 (PDT)
Date: Sun, 29 Mar 2026 14:05:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: sram: document glymur as compatible
Message-ID: <t5vbe36b3i2lx4ktrw5bosjtldgpmep4ueqkx5b5saoc7a3dm4@ywsv5rrcefew>
References: <20260327-glymur-imem-v4-0-8fe0f20ad9fd@oss.qualcomm.com>
 <20260327-glymur-imem-v4-1-8fe0f20ad9fd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-glymur-imem-v4-1-8fe0f20ad9fd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDA4NCBTYWx0ZWRfX53fSa9zT8+17
 LFO3/1vSz4zmlRnh8t7EOagxdVARkqUk9BpWP2oixINayHK6AlzsNMGy72rScsebfqYfKMv/iHD
 sVqqc+IRS48QpM2nGwU9CacjGLp5Dj64VGxWfPitQZUu5otkkPRm5N51czshoRZdDvi04ZIN6pV
 IOaMrJ8slNUW6x1cnoPFvIb3l4FHzF395Mc4POlcJRjOPAe8+4cidBXB+YoD1zHiLWd069AJQ6C
 +oloFWnPtplryjKAyeLcdHy0Nr2vyGX4AAFkK5lVd7koB39BcxdaRfl2k6n8GICFUV/+QSo+YhT
 xhwd1av8PVCLtlbUyXiQ6vapTn5r+4E2EZ1p/eCUXAAz1MQZOjLKd9j9gg+8XRuiAwfRqQ+ZQhx
 P9aIVITJUOZEjJjklqFyyNMNSC+paiI8UkuVZhewDzvJXCWbTJQuCrInHSr7AUsh9VN6bHTQEjr
 dzL2rXiaKRlUw3/c1gQ==
X-Authority-Analysis: v=2.4 cv=EIQLElZC c=1 sm=1 tr=0 ts=69c90778 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=t_NDYdS1q9VfzykaoWoA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: Be6UlghksPoZ7yBHJqFg6Gdc1zWhU5b-
X-Proofpoint-ORIG-GUID: Be6UlghksPoZ7yBHJqFg6Gdc1zWhU5b-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_03,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290084
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100609-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 17ECC351B84
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 03:24:35AM -0700, Ananthu C V wrote:
> Add compatible for Qualcomm's glymur IMEM, a block of sram which
> can fall back to mmio-sram.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/sram/sram.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
> index c451140962c8..bd62711dc630 100644
> --- a/Documentation/devicetree/bindings/sram/sram.yaml
> +++ b/Documentation/devicetree/bindings/sram/sram.yaml
> @@ -34,6 +34,7 @@ properties:
>          - nvidia,tegra186-sysram
>          - nvidia,tegra194-sysram
>          - nvidia,tegra234-sysram
> +        - qcom,glymur-imem

Is it different from the Kaanapali one?

>          - qcom,kaanapali-imem
>          - qcom,rpm-msg-ram
>          - rockchip,rk3288-pmu-sram
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

