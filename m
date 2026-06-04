Return-Path: <linux-arm-msm+bounces-111209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AacJBsh2IWqsGwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 14:59:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC67640200
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 14:59:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cv7szaif;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BjfG7355;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111209-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111209-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BDC36306CC6D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 12:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4607843C077;
	Thu,  4 Jun 2026 12:52:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6971146AEFB
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 12:52:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780577527; cv=none; b=VPfGxEdpRxAJ8iyz/yabz4PsAxN+yvTmg5SEXYKW2zUkmvBB34Jo7KxQ/p7xZ+8Hb1LGYn0goGjsqgiw9ocQskyHrWVeJSZzFTnWxfDf0XBIEPSmMUUb4yj2FGhbW8Hq4JKwcBCc74XGM8gZQL3Zr+IqzW7s0r58vbGCVyyaHW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780577527; c=relaxed/simple;
	bh=77v9Al1lhh7IeOYvE+UjGRjE+iVb2hZ3YgJY6y3laQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BSUYv0L2D1u/0YmLgkeQ3MQG4ylEX/lG4N7JgumzMLGjzjBXm/JvcLh8xlUtswIsPuLwTQdf0DTk1do6BYCIZJZM6ROTbQ8DlZWVIgVU8iAeYsyWtIYYm4V82tCYj+wqY1+cR97z23/fB0uCooSdbF790LAJJXSclzlZS6Z9fu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cv7szaif; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BjfG7355; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654BKJm2011658
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 12:52:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XgEAN0/+gM+54F4VHBCxD3vD
	G/6RjDY/mUjZmgXTXkY=; b=cv7szaifabc9i/rBVu+6yJCIPhf9YS5ZWrXb0Cn2
	WIZxxHuFffeW3CqWnz6oVEgffx9RksYyxCgYtl1wi83p+8KZqsl2ajf+MGJDds6t
	Y9vH6qhtIuAauLC+PVKPktU7jFgIfO1H6tI1BBhbjy7L2mjiPbFYIrK0yR9NQ+lL
	xUZ6EnwHKMKrg/HcpMv4ENmcCc5ahfI2kXTgKTVt0a2Cvx+uFXJit3AQ2PZ0ak6O
	LPpjneRJQv4MqX7nz0nGvwQJxx2ETr/WXfaQhyThKwLufFQ6oFdYiUH155WezWZM
	8tEW0AIKTlAxcymhWO9hn6lmlcJS61WxmaVvRybeHHeL+A==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek8dc0bkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 12:52:04 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6a2b2eedc3eso79170137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 05:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780577523; x=1781182323; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XgEAN0/+gM+54F4VHBCxD3vDG/6RjDY/mUjZmgXTXkY=;
        b=BjfG7355UCmDGUXrfPKAX4LQp3xDG8N9BTs6il4n4TdHTA4cdiXJM7OwicFHSj1nFW
         3ElqTE5UVwQJFI0M8CaozbawzecacIcmV6Re2oNcBFjFqI/q2gpKs2TuwtqxGJ8nlLdj
         l+ADRwUj0NsnHs5oUoKTk+KyzdqvpJKlPnMskh8js11rD9qPC9FB79UYrxZqxcKboGF+
         r7SrQ9VAkOF5B2jFV8D8DYz2CWy52BR+J84lpGCbe+SVCdsCz6CHnD5vB0J0Jbb6Cp3q
         SV2KrFpC2oAOU9QNJmmuZ6UGX08CVRKA5C7Ep+N3z1uT5yt+woBqO7dSFnvP9mBhEoBF
         p8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780577523; x=1781182323;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XgEAN0/+gM+54F4VHBCxD3vDG/6RjDY/mUjZmgXTXkY=;
        b=VwWpYb0uLTR6WjX9tLZ+GhsQVgFT3288rsnv+jz6SW9+CmqMLuYm1t9WHciMvCBh7Y
         javcLWUq9uV1t505YzWgUf7UaqEjGhCUV0ahae/C/Tm8c58uR8nbpDvEsy4978f5Kija
         klvljWjV5oeZ6NTJd4GJc8PwauqUXBzJnLKzXAsq2wx4kyTKi/jMoY3CPRfAYIQ0u8AO
         5QCH46uEck4JCfgGkhhDz6P1W+9gMy+etP4Q4Q5/AFozFrRDVxAlacvS5IAVtSvN2fF4
         N4d5cSSy4+WVAhKQopVN/2GEMhqndlRBNbybn1vkwSqql34hI5R1GX/bNOH0DuufAN3g
         wuMw==
X-Forwarded-Encrypted: i=1; AFNElJ+S/nFPlv6az7J8N7mWB7BJ8x952fv0JzkVH9r19wtIKvfuqVbEdcEKQGGWOVyFhz5qXJtL8eYEcDdbe98a@vger.kernel.org
X-Gm-Message-State: AOJu0Yw45AS5bDDj1OTXd0uc3IuR1T6lT/a3YbYY+OrN7ODbUvVT7dz4
	r/61GvhlX/7OwqLirTR9qjfMtbuAJCSKIU8uXwTqX7nLCfAeMiaWzaUlm7nfk9xcc70XTqpHk+l
	wyGnygINaYfvngj0mpA9UpuBaxdLgHIidvFMp5VZlk2mmUbHbXBkj4XmVft5gveM96roM
X-Gm-Gg: Acq92OE6tdA3xJ13O+pdRKpocacUN/+nzl0Es3uZuFJN8mMSI5EPF8qe70g12dR7rN2
	A8vktd1sx92CxAxQhzg7WdMr2QNGNOD8URYjLIJIlP2q1oO6QUD2aGQLp0yw8K85ZOfNAlyOz0V
	rbicKkVGX9YVkXZgfAzN1IGUsowYWKWyiQysqEDtuMI1B7/Fv3cY30cf5yGnBy0CRqreUQM6LZy
	wZ1oRTVF/WRp3KmsXrC6QjDwMXe2uB6Blk9dLHP3PeZRRVhenXQR/nHOo1QEgsTBwS3o9Vjmccj
	vZnPoCdCycUzGWSI3pWIOi8apYgTZRB0ebbkJ0PSMZdonNjuZvTD9bwSmT9v+WqCM9QWB8zzXga
	86BMfP37j5jzYJ4hp2V8ovmv9zGHNPwlCnJPaK6HHO11HUf6XrnfYiHNZFzOAr2WBHuXpa0GNNW
	aQma2PfV5npjLF8Q4tXAEcV/lxyvN7Py/7IB+1d19bMgzdbQ==
X-Received: by 2002:a05:6102:8027:b0:6a2:cfe7:20b3 with SMTP id ada2fe7eead31-6ec278d65d9mr4057239137.2.1780577523414;
        Thu, 04 Jun 2026 05:52:03 -0700 (PDT)
X-Received: by 2002:a05:6102:8027:b0:6a2:cfe7:20b3 with SMTP id ada2fe7eead31-6ec278d65d9mr4057200137.2.1780577522595;
        Thu, 04 Jun 2026 05:52:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b99c74esm1188940e87.81.2026.06.04.05.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 05:52:01 -0700 (PDT)
Date: Thu, 4 Jun 2026 15:51:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
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
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: display: msm: qcm2290: Add Shikra
 MDSS
Message-ID: <elb6gc36lkxdbvukretqx5widqozg4tw3wbg3o7ma3fsckjueu@sruvhflcy2sm>
References: <20260604-shikra-display-v2-0-b3c1b2b67edc@oss.qualcomm.com>
 <20260604-shikra-display-v2-1-b3c1b2b67edc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-shikra-display-v2-1-b3c1b2b67edc@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 6igb5fphotvZQxw9bykQX3KPZjwjTU37
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDEyNCBTYWx0ZWRfXyyiYC4j2sqDa
 cf+LYqd0OEYgGlTbrqKyV80cZWBoEQ5lKlmrM8CxuRR4I1qr3xD5+/qmc2g1DeIShuYyQlr0j7Y
 4snQaubMLY11pX5AVoYTNMkhKdZ2hrg3tfHRPpVFzRjWdr/bojF5elatwayRH0KNJmKlS7D4FVG
 z9f8I0gz/XmqJm3VJs5UmY2wEm1Hx3U7hBr5oXISmiFZR/Cs8ls3DrkIvy/TE5NFkWbRUQOdxeV
 TQgiUQNbiuAaTJYLwQZYbGNJtExxU1dLKjykk2cet5n/08atkNiqvT5kcheCLg2J3CuyrrWg6mV
 ArT8uj3Rt6qSUsXGkh08yRaAX59z1FOXn1RXtHoU0vdMU3N+1CJF0+r7Shyo2pMqeHqjtiP7gBf
 Kg1KNXwG31OgiRp7bq8fAxdFLpg9DpXPLPjJcezXTGre9WL5nXsZ73O2yB/NJKvI2/ZqbxYPK1p
 x8K2TZQaJbF7m4zGlhA==
X-Authority-Analysis: v=2.4 cv=eJwjSnp1 c=1 sm=1 tr=0 ts=6a2174f4 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=VFkWRHED51hAbpIxpgQA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 6igb5fphotvZQxw9bykQX3KPZjwjTU37
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040124
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111209-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nabige.aala@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkrishn@quicinc.com,m:loic.poulain@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,arm.com,8bytes.org,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sruvhflcy2sm:mid,devicetree.org:url,vger.kernel.org:from_smtp,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5AC67640200

On Thu, Jun 04, 2026 at 06:00:47PM +0530, Nabige Aala wrote:
> Shikra SoC uses the same MDSS/DPU/DSI hardware as QCM2290 (DPU 6.5),
> sharing the same register layout, DSI controller and 14nm DSI PHY.
> Add qcom,shikra-mdss to the qcm2290-mdss binding compatible enum
> rather than introducing a separate binding file.
> 
> Register qcom,shikra-dsi-ctrl in dsi-controller-main.yaml alongside
> qcom,qcm2290-dsi-ctrl, and update the qcm2290-mdss patternProperties
> to accept both SoC-specific DPU and DSI controller compatibles.
> 
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/dsi-controller-main.yaml  |  1 +
>  .../bindings/display/msm/qcom,qcm2290-dpu.yaml     |  7 ++--
>  .../bindings/display/msm/qcom,qcm2290-mdss.yaml    | 38 ++++++++++++++++++----
>  3 files changed, 37 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index dbc0613e427e..a2f3e91104af 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -33,6 +33,7 @@ properties:
>                - qcom,sdm660-dsi-ctrl
>                - qcom,sdm670-dsi-ctrl
>                - qcom,sdm845-dsi-ctrl
> +              - qcom,shikra-dsi-ctrl

It is the same as QCM2290. Why didn't you follow the pattern and add it
using qcm2290 one as a fallback?

>                - qcom,sm6115-dsi-ctrl
>                - qcom,sm6125-dsi-ctrl
>                - qcom,sm6150-dsi-ctrl
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
> index be6cd8adb3b6..e166a73651df 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
> @@ -13,8 +13,11 @@ $ref: /schemas/display/msm/dpu-common.yaml#
>  
>  properties:
>    compatible:
> -    const: qcom,qcm2290-dpu
> -
> +    oneOf:
> +      - const: qcom,qcm2290-dpu
> +      - items:
> +          - const: qcom,shikra-dpu
> +          - const: qcom,qcm2290-dpu
>    reg:
>      items:
>        - description: Address offset and size for mdp register set
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
> index bb09ecd1a5b4..7184b09a8774 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
> @@ -4,21 +4,36 @@
>  $id: http://devicetree.org/schemas/display/msm/qcom,qcm2290-mdss.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Qualcomm QCM220 Display MDSS
> +title: Qualcomm QCM2290 and Shikra Display MDSS
>  
>  maintainers:
>    - Loic Poulain <loic.poulain@linaro.org>
> +  - Nabige Aala <nabige.aala@oss.qualcomm.com>

Nope.

>  
>  description:
>    Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
>    sub-blocks like DPU display controller and DSI. Device tree bindings of MDSS
> -  are mentioned for QCM2290 target.
> +  are mentioned for QCM2290 and Shikra targets. Shikra uses the same MDSS/DPU/DSI
> +  hardware as QCM2290 (DPU 6.5) and shares the same register layout.
>  
>  $ref: /schemas/display/msm/mdss-common.yaml#
>  
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - qcom,qcm2290-mdss
> +  required:
> +    - compatible

Why do you need this?

> +
>  properties:
>    compatible:
> -    const: qcom,qcm2290-mdss
> +    oneOf:
> +      - const: qcom,qcm2290-mdss
> +      - items:
> +          - const: qcom,shikra-mdss
> +          - const: qcom,qcm2290-mdss
>  
>    clocks:
>      items:
> @@ -52,7 +67,11 @@ patternProperties:
>  
>      properties:
>        compatible:
> -        const: qcom,qcm2290-dpu
> +        oneOf:
> +          - const: qcom,qcm2290-dpu
> +          - items:
> +              - const: qcom,shikra-dpu
> +              - const: qcom,qcm2290-dpu
>  
>    "^dsi@[0-9a-f]+$":
>      type: object
> @@ -60,9 +79,14 @@ patternProperties:
>  
>      properties:
>        compatible:
> -        items:
> -          - const: qcom,qcm2290-dsi-ctrl
> -          - const: qcom,mdss-dsi-ctrl
> +        oneOf:
> +          - items:
> +              - const: qcom,qcm2290-dsi-ctrl
> +              - const: qcom,mdss-dsi-ctrl
> +          - items:
> +              - const: qcom,shikra-dsi-ctrl
> +              - const: qcom,qcm2290-dsi-ctrl
> +              - const: qcom,mdss-dsi-ctrl

Change this to contains:qcom,qcm2290-dsi-ctrl

>  
>    "^phy@[0-9a-f]+$":
>      type: object
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

