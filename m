Return-Path: <linux-arm-msm+bounces-97536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLpuNEMktGl7hwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 15:50:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D74262854D5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 15:50:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3C78A3050549
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 14:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F28FD39EF2B;
	Fri, 13 Mar 2026 14:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PILkyhPS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H/ybNQNm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC39B3603EB
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 14:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773412658; cv=none; b=H7zXjimfIQ5SjoTx/CLqALBD8d3Y57PZfXOgNvW42KSRSf3x5ZnWjyb49Jfkk4nRxMLCkr/ED7hDBrUxyOOR9ulthXU958rc4CYlHPESnCQXyCxlGlbL4b4Iwicmwmm1JY/n7v+SK9aahwpTvQG2hwFDxFZg6VADNdHvhsaczHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773412658; c=relaxed/simple;
	bh=F7xySl74zn0cQsQjuTTHODAbEgPoBokf3X3L9RU7h9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jPeq5YAdgfxxqCDQaQowL7YQpvYlrl+iD3tgANGUcaWrkint2zvzXcerndcwTqeWaEsTM5TrV2Mj/3X+J35aJ1RaEjtMI32WXf7/kVPXZoMWyIJtp1arndWqg246wGNeKdE6fZycxYW6J6au9qYYdtrA0CAqzSsrRr5oke1ZbdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PILkyhPS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H/ybNQNm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DA7pXu1749162
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 14:37:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9J2Anj2meT6LEyEYAerJqdEt
	YwZ9k+r7L/d7Xc0Epjo=; b=PILkyhPSjcwO0/Ki2QrJFqA+LrvmthW4WZqnBMCC
	YYshjk7eyGWdSaa8T8V98omjj5djhW7FvIx65HgpB+2FjhxPdqR20UQfbbubr62E
	9PvVSKxW4wwjSvgXyfTXvrh97S/cxct57UL1QSad7azhCeXFXrJnWxbwjxD0wwAD
	wRrU9m5HR2hC54QFG2mF47s5qfOXR80NsuGkC5bzQZS7bAOQSQMWb3uwzej1eZPq
	4XIjInTSPS3OCsrGY8h6Qn+SgqaHBxQCtDFInAUSEhSrPBAHOdgbg/4GfTofGukt
	eF6p6DepLsmwUEiqriIDnzsEnM29SUJzFZkOBDg91hARbA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvgj6gvm7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 14:37:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd781c0d90so1800347785a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 07:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773412656; x=1774017456; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9J2Anj2meT6LEyEYAerJqdEtYwZ9k+r7L/d7Xc0Epjo=;
        b=H/ybNQNmoWeRP9P+VeNgt0ecclmKwjAYMwtQHfTXhmsJ1lkTBfNMWvK4Ipm9ab/kDM
         sItGQqHeMDPeuAFlAIEvZ642aD4wY5yCEDmWBEBpPAOAnzSwgkhhY+tU2JrX5vOUQFHe
         mQYzDR8grYtgTtVlea90r3S9Bn9V5mRJfbD/08XDNTIRMUKY6wrHJyH2jDn00sp7NEFQ
         z9jCV/G8QyAgUrR4YdSHcUZR/VrNUenqLMg9cX9Z2UappCb+oeTsfQq7i5USGbgp2mZA
         1Moj+vW1D/l+3vdZcmzsdqEvwx0GzgAlFLVKb4Pg2yT6SaebNh638V+ONJJOAaoe4C3w
         EtXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773412656; x=1774017456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9J2Anj2meT6LEyEYAerJqdEtYwZ9k+r7L/d7Xc0Epjo=;
        b=hrUth1uXyrGQRvfTKLArQr0KwWMQ806EL4AYSojpdadlg40EziOecphPuWlwJ6q+T3
         MknfyOLsoP82xvNSxQgs1S38zjfTLrVWov9vkeyK7Fh2b/cK30KE8X7j5BsBJSElfmVy
         4tRRADtvLe4n10yKii+G97FFr42f6aSZ7/atFpDaj1KTc7ul9B1bWLyADTMoBfKj8N2x
         hOCOK2Cxgz3TuLZmM3gfKNfiQFypG+Igf437NyRth/ggGIBi9s/D5iG2PwX2X387Xc02
         w4kjsa6fUEztNEdDQ3dZ0dGxqHtgM3lT8jdxUiBGU/ZZNjgfiIyoUnv5hPNKnu04aZXm
         AXQA==
X-Forwarded-Encrypted: i=1; AJvYcCXOi8HUJvRDOWdNCyIOleNWlSitabcp+UkBrCoi5wJ7cT0TQBtjezkctFNv/x+wGfuVm2YKLuf54leECWR6@vger.kernel.org
X-Gm-Message-State: AOJu0YwPSApDXbw6x2HVQvVaMY5btOg9/Zie1t01u42Y/fJoIj7YgT+X
	+IT2kw/3FmyPh/dlwpk8Gy8bEvdr/GUdppwYatw+eW6Jzxpjv4zWUc6ym3u0itTjt1V2ZRhZqKQ
	604qcyg6aXUSILCgDQPlqPt5sqgp0++MuREa9dk/f23WAyMnFR8eZsLNvrVAY28SnzzSf
X-Gm-Gg: ATEYQzza+OTIgTe35qJQwAPZNAwj1pO6Qzno8apYpgMEFC7WzO61BJEySs1vy+r7oL+
	oPwKqwUikY3LXVwc3vIloHMT8rPUEKLrIUnvKO0DenhjDk/aTD9r8YpMVy3Kh9szHsZd1p8Qje+
	vcCZFBTqBM6xA3frL0IApHGMW1Q1rgCpKcaf2ANLRd9+vpoRrVd9PlyOt3fZTHiAXU/L22Cd1rr
	6Wr9VESx5i3yNv1KCHmFSGoS8x4ejHR6UIk/VXhulZHnNhqpyO7ws58YfRtEvUKt4xxVDhRIeMJ
	8KXvZ0zblh2SEZEdF1gSRy530gqFM4WzSLfFYK01Ky+Ot5R5n2TXnevfvu1znibz1JC+1B+jDGI
	KFqza6EXZw445QabQBxklnYYD2tO4QvQGNpAlwBWi27fD7UmaTnLyLEqRsV81pEWlHzz9QH8dSZ
	CdryLb1+fbAFACgjjDFn5Y7avThFrt4QC9BPM=
X-Received: by 2002:a05:620a:700b:b0:891:7008:f2e0 with SMTP id af79cd13be357-8cdaa779799mr1076811185a.8.1773412656171;
        Fri, 13 Mar 2026 07:37:36 -0700 (PDT)
X-Received: by 2002:a05:620a:700b:b0:891:7008:f2e0 with SMTP id af79cd13be357-8cdaa779799mr1076807385a.8.1773412655691;
        Fri, 13 Mar 2026 07:37:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15636a95asm1578277e87.80.2026.03.13.07.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 07:37:34 -0700 (PDT)
Date: Fri, 13 Mar 2026 16:37:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Enable USB OTG on functional
 Type-C ports
Message-ID: <y7sxgdmxdn6fthnxkmhs2ja5hfw2mtbdl2zfqkfocn6pwnwxq2@cuoldngtvuht>
References: <20260313-topic-x13s_otg-v1-1-cb2e4a08e25d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-topic-x13s_otg-v1-1-cb2e4a08e25d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDExNiBTYWx0ZWRfXxSRE6XjWdHP8
 ZayHDuS3Atlmrn6vi1umMHzWYPyxTbh2z/McQOmf2zemKThIGWXykr3ReQc5z/lW7Rer7uUiWki
 bMFI1npGS5VnnL46DbngEdSbau10wN/wC3mlhdULNMeu1lxOJsLK9OOKCpI3pMFX6GKKuk2Lgsq
 MV4Y/oC98OS9Zz7O5RhASVhWuO1trz5v/yRcXsvUcdaWDdKbRwv9nqU5R/ON+j9hv/LN7npPoQ4
 ZW7TndVF/K2F6+6bGGEQbiRjpiVo9LFq1SXYinBUG6UVDdfuu3nipFq/q45iyyDpFefYF1AVlZ7
 cbyctgo8xO8npStXTqRgUqBXy0MRUrfJMBrXocvTnbL6f+Xf0B4w93xPy9uqy30nR4B565Dto6W
 Zz7vn0MY23wVBAtYvUleBRnZtarQw9Y572Qb+0A3qR2zPuk1imcaOlhiiz4PfKIpucUl+do/FtO
 y/z0xpe2JLWnm7WKbzw==
X-Proofpoint-GUID: ZDck-YHx13Vw023w-0QzaS53_VJu_p1h
X-Proofpoint-ORIG-GUID: ZDck-YHx13Vw023w-0QzaS53_VJu_p1h
X-Authority-Analysis: v=2.4 cv=H+vWAuYi c=1 sm=1 tr=0 ts=69b42131 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=VaWUvndo8j8N3dpmlaIA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130116
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97536-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D74262854D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 03:08:03PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The two non-multiport USB controllers present on the platform are
> role-switch capable, so mark them as such. They need no additional
> plumbing, as tested on the X13s.
> 
> Enable OTG for all devices featuring a data-role provider in one fell
> swoop to prevent hitting the edge case where UCSI code would time out
> trying to get a reference to a struct usb_role_switch, which wouldn't
> be registered if dr_mode was set to anything other than (the default)
> OTG.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts                  | 8 --------
>  arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts       | 8 --------
>  arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 8 --------
>  arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts     | 8 --------
>  arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts  | 8 --------
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi                     | 4 ++++
>  6 files changed, 4 insertions(+), 40 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

