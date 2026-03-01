Return-Path: <linux-arm-msm+bounces-94748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPaSFsFmpGlcfgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 17:18:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D32FD1D092B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 17:18:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 31AAA3006473
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 16:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC31311957;
	Sun,  1 Mar 2026 16:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jtsr/JAs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AlulHe6C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044EA1E7C12
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Mar 2026 16:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772381887; cv=none; b=I8EkKyTGR96CMjmWt6hUWPF3CCtgG/iy4o6/OrWESWPQSvD4AtWcTV+MB3Rf8GF0Od8KfLDBsDTb695YmnmbkA+Hqx8tOodl/yIJlqGzWVfomePL46wgScI4grTJ9a8LTI9IOyzrLNWhZIBmdrnE+brKDOUFbcvEv+yMe6yBASI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772381887; c=relaxed/simple;
	bh=2BkZy6OPIturbl41ax25L1O6eiPq7BVflJbgK9qABZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bv2VDNcLERoucOlunQLqbHUR4jwWb5rxGgnZg8FF3X1PnUKvFrUC/VqVqC/zVuSw2VhwWvgi4T7g0c3+guF3/rVStv+ptIKRTq+ZHcyYwJvyKMn3WYiRJ/NWen/90l/7hwOxXMbhlVwBWF3UH6iu1F93gn7JZ+kwtlwB+Xxv4GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jtsr/JAs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AlulHe6C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61SH01bI3052043
	for <linux-arm-msm@vger.kernel.org>; Sun, 1 Mar 2026 16:18:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=F5QfJCxHka7DJDYnQYwLZ0aF
	rY/E/QitDZUCV/3u/ig=; b=Jtsr/JAsxuxd3NVVbg6koEB/mqYAtD4W+q1LDMbU
	kgdrGus+Q535f/D63YRah3EUX1o/sE7/0rb/Ao219SgB3loCuEXLnXENF8S4g71Q
	FJIAkyAGeCmKhW9zCX87eM8sfPEJCJKMRs06YyQuJ2XYUu4goa5CZ5qhsFngMZD3
	bLRp+zl15OtT3my/EFWA8TacezRoatOqj+agcExBBTIexff01RKHd97V205+ZfS8
	HKy4qEkKkxfjbj+qZE87JnFYIHKDUm7ljT/g1BfQUxemnQXz5H+m01UGWnT2LCex
	t4wao2zHIUt7FSIdndW2rAI1x21CaYLEMreChnch4N43LA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksgrtyxj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 01 Mar 2026 16:18:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3a2eb984so2721131485a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Mar 2026 08:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772381884; x=1772986684; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F5QfJCxHka7DJDYnQYwLZ0aFrY/E/QitDZUCV/3u/ig=;
        b=AlulHe6CmxuYU0sxhx752d7r7+OWAoB3NWJm2C/s661AipRvNPWL+FHddFBxRmlXf+
         sK55GFAWLdoB4x2CUYlbD46BHc6k2i2rUwdOtBZ3rw6TQJkHbBiSQNcBjMm/u9o4r4bv
         41rYHDLMjR3t/UYO+0OgYTOWwr6kOgJ0qBvyNzxBNBZfpAp7UMBw6C/LRvtlzD9eL9/g
         qfbP2ZbozLfpy84Pcwi5ZBtyFynZC1bR0rduRVGOoPbBc+9ik4+Q3GHzPEYVkmT5nYzi
         Al6rMukOwNDUzvcTtaRaSp4763Js2cQlpHt5ei7FJ8Xmzs4zFbvNRtCsoq3Z7+ejwa8c
         u6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772381884; x=1772986684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F5QfJCxHka7DJDYnQYwLZ0aFrY/E/QitDZUCV/3u/ig=;
        b=GkTeKaVJKSre3S8EK4fYFK+Nn+NkPAmbxzC+sZGCURNIytAT73Bv+VziiKc8MuCR2S
         XBRSIxn0AzMBr9OLV2BlAtj5WUGI+bVbxQYhE+S+JEImBo0qcfIF5GLQi3ZdNRlS9nNY
         Pmm/LWfidPTYvXhmgbXNR24Onj+DISyoqeqE34z8DBE6FH4p/K7RXSQ6pFb8f7cEWQIp
         UPhBSJTK22C2//sATAzfEoCAeyvcxjFVJ16wUDBQsFV2Xu0IyMX5WzyCKBYobuCSUNFl
         RTrzGPaCbJl+noumTxO8pEm1fLGr91Ol2IXz/pC8jgMCvguL2guqfFU5qCpB86ig8V0E
         /8+A==
X-Forwarded-Encrypted: i=1; AJvYcCVYT8CmYa4agyE5WXvIGUkd9rnR5Qv/o614+lpMceG47b5bQ3Q1IHn3G2wW8vhL2gKodoFbUTMhw20v76IA@vger.kernel.org
X-Gm-Message-State: AOJu0YwkDDCf5h3q+xTrwJAwuW4820l2iATfSp4Wz6tFJfq+IDfQK5nF
	vRzr/kWwte7pCIhhd2qOMZ1o1+d9nGIykaGda7sgxBnENXd0VcRe+Bg4odFECyVD+kASytTWHjD
	sX5RCh8CtMj9dCTDIIyYWfsIUByuwXgmCM2z7AZh43UEgV+w9020j7sSzh+uAEPdnPwF+
X-Gm-Gg: ATEYQzx5WJ5/eqlXpZ4cbnZyQMB7Wmu2QDWvu4nzLYPeQUP8e5oVtgpxF+70l6dOVVt
	b5b3JURlF1qmPCLv0sdDOG4+xWXpXBQNjWg5iC0W/MRlAARaAZWROT0cFo11z5GLEH/cJ4dg6X3
	aF8Xy0lM14tpFdj5zLN0yf6UolwFYdpwVX2Z+IVzfNGvkXmtzl6kFwQSpRYBEX3SgHHnANocj0w
	5AgPLDdxejg90Ta7Oj87QgoA8udInXrr/FcJmkeXMpnzPsTUJgaP1Bmg6/0vK836b6pqA+iyPEL
	hVdKz7P5rGf6nz9nHoeqmmWgFJTg5Snpdix4nWlLoVsOeozXsgxNn4TRt7Vs/nnvnYsRkynCMeH
	uMIdqhnEtUdBYEytdVw028xKtz1FdvgmX/Sq74M7yt4WwF4EFxIT/sQOnLAMiWAqDUW5Fm3L0AF
	7GttkEG5Hq/7uaA3DTFclPLj9gouMqB3O90pc=
X-Received: by 2002:a05:620a:190a:b0:8b0:f04c:9f0f with SMTP id af79cd13be357-8cbc8e176e6mr1177099785a.63.1772381884173;
        Sun, 01 Mar 2026 08:18:04 -0800 (PST)
X-Received: by 2002:a05:620a:190a:b0:8b0:f04c:9f0f with SMTP id af79cd13be357-8cbc8e176e6mr1177096285a.63.1772381883685;
        Sun, 01 Mar 2026 08:18:03 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115bd5a5bsm1103957e87.38.2026.03.01.08.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 08:18:02 -0800 (PST)
Date: Sun, 1 Mar 2026 18:18:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: display/msm/gpu: Drop redundant
 reg-names in one if:then:
Message-ID: <xilwtm23vanzhpnq7s2ij7uviceoxq7g5pp3o5m2uebruhywzz@vjw6w6dxyctb>
References: <20260301142033.88851-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301142033.88851-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDE0OCBTYWx0ZWRfX4EYmS24dG1n7
 iRdGgjeS1BRjIzBwTfykwtGBVhAPg2pjIYdDPnZk37plckJmvUlX6s7kzVQDd0hR8ly7FaQTdW1
 3V6RgEdjzlZWOZaIFZrW322vlcfm1GWd+zv8zBvKB0lq0HfoSXZ8w4VyMpgs0dZBvubQ9rRGiAM
 7zTvKmEv8PmC004QOJ9XN1HK9K1xkluXJmHBVbXjBIjGh92ypEf9AXh6GRGks/BMVy1WzyNzwBZ
 tkTsp4z6Kx/4kRSBYsYDMmSjpsHWHTybyJkQjxAuyKyb13+W+uvijFzSKdW29P0zGy8LVb6GBNE
 YjD5MJr+W6ubZFIRItpATKL+f3O325mrl9IUEb+QZ+KWQqo8kdV2a2OqhrqCsMCrz7Nzc73de/x
 DRAWa9b5npp1NsDc/smCsfN/FKFwEfp8S/d5rueiMRjacYYW24Fd8qDUbOYrcwQqged95PzEKkH
 EuEeyvCpnUwXbcuhc+w==
X-Proofpoint-GUID: qXIn75N0afCJ4hTAsewV4YDiStHV2yl5
X-Proofpoint-ORIG-GUID: qXIn75N0afCJ4hTAsewV4YDiStHV2yl5
X-Authority-Analysis: v=2.4 cv=Zqzg6t7G c=1 sm=1 tr=0 ts=69a466bd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=ijTtCazmwCW-ujkA-zMA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603010148
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94748-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D32FD1D092B
X-Rspamd-Action: no action

On Sun, Mar 01, 2026 at 03:20:34PM +0100, Krzysztof Kozlowski wrote:
> Top-level reg-names defines already proper order for "reg-names" with
> minItems: 1, so no need to repeat it again in one of "if:then:" cases.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

