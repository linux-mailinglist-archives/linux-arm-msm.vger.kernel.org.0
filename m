Return-Path: <linux-arm-msm+bounces-95147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMfoEWDopmlWZgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 14:55:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF361F0D32
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 14:55:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5417230965B5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 13:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C7493358C2;
	Tue,  3 Mar 2026 13:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eXghRw4D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="csWLo+D+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F6F31F983
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 13:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772545663; cv=none; b=bPTJv9rRL090smMu3MmFytP0TaiepkQMXgTNDC/2HOOKXFEgFGu3Z/N3IfR1n5/AWi1I8joJaO7r6kYMeRC8fM3fyvsx7Yba3+I4EUoGJMlOUvuP5dG8yp2Cs1mu6Wmd5144EFzOrW+4CHBhm8TrK9A1cGgJRNTnEYqv1tmwJ2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772545663; c=relaxed/simple;
	bh=/aL4bw53YyG5SLFzWcIWYqokXFmcXf+OvAaQYkyn3ms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K1nk6vxvBT+jwvQC+GgVn3PWdcsEweNBDcRdtmEmUdiIUyU4JKL4gZ2s3X2o77MU8UAsUzZuU6mKL+9H9ha/Deo6N8xi2+kEa8C2bsBgo6alauY/dk4B0dVnV3NaSryeTh/WYlfUWqqS6uiQ6mynDS71oG/U4PIWfr1KGumGQbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eXghRw4D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=csWLo+D+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239moWL2307603
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 13:47:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=idB39/nW/QhmcKfOGj0Rxpu2
	b1UnI9mrQh1XvR9bGp8=; b=eXghRw4DzPDoGGV5ypOhZGjCv9ygZv2FFxbr3B/c
	KSaIPFeudF/6b7fmGYhuEIzvKWmJJWl2GLJnPG0+ga//Yhtib8DbxDKih2V3GNV7
	4+OJt3RDYlxmXFMKoBM39X/yZe4yWzBlR398QdEMRbduOT7N844NUjEd6zaRVw8e
	+yE6833LC9VzABZXLORmWNat/WMYN1lEBoZyrfZMwQSTTCB51SyQi8t3KZmOVQBg
	b5jOMcYXgKTdEZm8Il400SUoqK3eUt/diH5pHpTQLHaPgFewr1yJr+cd10kZxI9o
	tLd7Sz2nOUUYtH3AoNDDb1yzVzNueFJEtrl4rFBGeZBQ3A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvtu8sjx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 13:47:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb6291d95aso5814766885a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 05:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772545659; x=1773150459; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=idB39/nW/QhmcKfOGj0Rxpu2b1UnI9mrQh1XvR9bGp8=;
        b=csWLo+D+JFZSsKDl8weod/ztSNTqM0+9pExthXJor4dN2jK/edj1anT/Ys5ysdgNBU
         No8NZNvY8e5PWOy3rUeSU5boFc0Beg7bh9qJYDi5nev1M5T6+xe+cbBITbjTqdF9jjEL
         UKn1M5Ps+kx1MzRglSHXSmO3MfiuiSYGkOQjj9OWT7X5Ky8cRWjLDDR9/XXM1f/RNeSJ
         7XFiqJ/zQwWAVstmb7gDEpW/50fULnnx25gzd+NeSyxPfvb+S/nE/2biuOenPGXfBuVD
         vQw8XUP+57CTidgx4pD3mBuhT7Gi2dDYl1tSQGiF0NtPGeet5HpT2X/3NVke4y2OQJ82
         c2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772545659; x=1773150459;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=idB39/nW/QhmcKfOGj0Rxpu2b1UnI9mrQh1XvR9bGp8=;
        b=foN40zC4xYEUp6mFkorvFlVNbpLfYCcciBl3/ndkEaFkwsw/RSV0nOUJfLgg8kx7fL
         0YI7DmBYwO8hi7Dd7X685d+TJTash6fZbMVLRDBZJBNBVl+qodyYykp3STUnqCTiCAgP
         vxcGoKB7eEvqgqDs4nordbJ+DEcUOJJla6WkpojzbDI5WrYPzdezQHk7TCXEd+CJBGkd
         2jdTulXpL140ZjY8L+V3GzVzbDkBoPSy6rroLFdV7o3cwMerE33bPtQCPMLUEjB4+K3h
         9iqNiz3AXu8EDthEp5a3EgXDRDEIcvJAlk58KYp21LoW1R8kaFA+QhqEV/mVX32NrY6F
         IbvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLIZEG9P7EsxS4fitbQdrAcYBF+1GNpbEvj8ghuJkhuFkwBDc+68orlXBAl5Br0EWMkLAX6NSIVwUOiS00@vger.kernel.org
X-Gm-Message-State: AOJu0YzynDZyYfE1LlrsDQADtU7KgqCDOmFnBWoTn3L+iysGMs59ywxO
	D+qPv0sc0wjekgh55S98GOqqee+M0IKJ2fIQjGJGMepYc9qbLQPfMepyyKNlw2L/2f7iNU2cVXl
	3C1I7Dn8TDW3pLWmA5ELBCcZ3OjNkrEN10vkDu/kFYGVNppR/jyF+PXOQNG4HMzal7WE2
X-Gm-Gg: ATEYQzzpHgeoPwVGFEeavsUi2XvuBeLNizA7DRZ81UN9vKXldc8G8KkCF5Usoa8irEo
	MtSRI+WYtz5hFkEkn1kXB3N8QcaR+tJsBGqeb1BHiAHoPOhX9uOCmcxM2svKdtem3ykL/1f8CSf
	k7H29Ic2omZSrGT/xLwFtW0zxFRf2A2ICAV8zp/3STef8x8C1cIgPuklBPaQ/8rM1kV3nQs2SzI
	9me6moVKqC8gN13sFe15TtPkgu5cXNGhLZ4rQcwcy1p76KR/W1DjnjPXe8/5bA7qB/rwCzsrwA1
	92my/bKoWYlLKQfESIX3KetHvI1j0NW6e9BnidoHrwRiY5RKgJFrq6stW/MQWolKY+rDtS1VJx7
	HtyqtU9FIsYOtQluJPIDe6qclEV57+5FgVqBXRqRJpdNfNBjp/Crd1tU+De+qQV9PbtkAlS/hEK
	XdaxLiSltJtbqJoENeNzzXv1JFFFvSJghqjXY=
X-Received: by 2002:a05:620a:d89:b0:8cb:b062:c2f1 with SMTP id af79cd13be357-8cbc8dee51emr1996042985a.29.1772545658960;
        Tue, 03 Mar 2026 05:47:38 -0800 (PST)
X-Received: by 2002:a05:620a:d89:b0:8cb:b062:c2f1 with SMTP id af79cd13be357-8cbc8dee51emr1996038085a.29.1772545658449;
        Tue, 03 Mar 2026 05:47:38 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a1235845a8sm578691e87.13.2026.03.03.05.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 05:47:37 -0800 (PST)
Date: Tue, 3 Mar 2026 15:47:36 +0200
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
Subject: Re: [PATCH 2/8] dt-bindings: display/msm: dsi-phy-7nm: Add Eliza SoC
Message-ID: <i5hiqu26ljplmajinfmf6spccydtfwgw3ak3ey6fuzykvrnusm@izbedyarqdow>
References: <20260303-drm-display-eliza-v1-0-814121dbb2bf@oss.qualcomm.com>
 <20260303-drm-display-eliza-v1-2-814121dbb2bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303-drm-display-eliza-v1-2-814121dbb2bf@oss.qualcomm.com>
X-Proofpoint-GUID: 6XNRUmYjQeUwf2V4f2PJl93damwbOQDa
X-Proofpoint-ORIG-GUID: 6XNRUmYjQeUwf2V4f2PJl93damwbOQDa
X-Authority-Analysis: v=2.4 cv=A75h/qWG c=1 sm=1 tr=0 ts=69a6e67b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=fTnWfZjI5X7wAvt4R4YA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEwOSBTYWx0ZWRfX/ZF0BSqukmQj
 k1uSw/7eVCnpu7hxhHfGeDe1pW+jBP56GoTXYY38ckX9eadx+xOr9PF5476RvdhhQT63h+9E7pq
 lE+8D1dcuwpQVrMibLNdHL757StS23R2AQenXTlJDrPIbyo8btUpJv+Bm67EzuUbklg2fmNabHW
 ze1eMSuCtI9RG9Sdy7aAZVZv2z/+NUflm42PpZBMW2dDdkanlnUyh3ksXQgZh7bFSoGPSVDZNjw
 6SjViXKD8zgeS7sOuFCNSxsV2Hatwj+5AExWRVcN9VCYkAe99MO8kS4iTRS5ZUwFSOVLT3YjuY8
 DazzNKE9AuaQwovnr6VOVrD1nx7AZo4L19tA9/qP+I9c/PS9DQlWHpkQTfvKaQkvrthNkTrW+SB
 hdAn80AuM5iSD4JKTQZsDsaWGWudTCuvtbKfcWTofW2twZ+RFmZ7XuIndoE4nzhsVgBwCCrn/LO
 kzDsBLKzhGd1IlhXg/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030109
X-Rspamd-Queue-Id: 9BF361F0D32
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95147-lists,linux-arm-msm=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 02:07:52PM +0100, Krzysztof Kozlowski wrote:
> Add DSI PHY 4nm v5.2.4 for the Qualcomm Eliza SoC, fully compatible with
> SM8650.  Note that this DSI PHY, unlike the Eliza MDSS DSI, is not
> compatible with SM8750.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

