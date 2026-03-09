Return-Path: <linux-arm-msm+bounces-96343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBx4CzUir2n6OQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 20:40:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D682403B4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 20:40:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 175E9300BE29
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 19:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1348640FDAC;
	Mon,  9 Mar 2026 19:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GfewEV7Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WRPyr20E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CFD33F8BC
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 19:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773085227; cv=none; b=o4zY//lYM51yzc/XsZ1kPP8ExG11a+ZETi/9lZ8+LNNO6b1MGRDlKZO1pdWBIm4YQtTyUBBMWrGxQQB/fR8M0Z65eCo+iO7+xZPBKtVLJKJPlBvQQBJ2JwWL4jn0fF/ZVmlumHNQgKQScR/Y46Qt+vkFmjEZHvFGQgpswFaiT6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773085227; c=relaxed/simple;
	bh=gGElRAb+Ho4lH3vbTCvZTt21pg2iKNB5JUgCrpu40As=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Al0NsLENsGFvdNpguWAw/E+DNaLBoCX57nrkKH207lVGViD8qZFYh0bGbQ+7pohUmXzyiHobwGJ7elIAZJlpQ1UixCSjq8O1RQudvVhfkh7K75EZrTofTJ3XqBj7J7OFRHlP6gLwrGzxa8nY4Iu9gdNIZq2Yfq1oW1DtXZJWraU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GfewEV7Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WRPyr20E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBlIv1297345
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 19:40:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=piv/iC5mZlqTCM4BXe8lzoUr
	PF1ixR/tg/jQuWfPUec=; b=GfewEV7Z9HuJfK35W24qU/4xSfiL7kbNtq8HnoPt
	EFT2G2+ynflAAGSGcYjMJiCeBRoNa7sNuqWqZRtFzbOhRl2aVEeVMJouEBlyzumO
	iQX5PybOcRGm972r8g7OKAnPNEokhwpV2NZgSkx+XTcGM4jaHDyfqK7cWl05Qz+z
	lgVC9lESrMDLTFgayCtLahJe90fCYljRsMhk07sEZO5mezf/s7+9eKAOAwvVHM68
	3pqYMJ1QvylkaC8FLNw3Rxq2j6q8OlfBSxxDy+7hGyMJRO9qwCsLmDy4fZDmyZj3
	jCl4rSJZbyCwKmvuhwYY18tDQjjtoq5OdIoiKyLFn1XXsA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyv195x6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 19:40:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5090cc6a7d2so135442311cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 12:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773085223; x=1773690023; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=piv/iC5mZlqTCM4BXe8lzoUrPF1ixR/tg/jQuWfPUec=;
        b=WRPyr20EQ88fWGf+KgFlXNtzIGFX254R0TOmQs4Ga7rQtqI9moe1NKO6OHVQQ+pbsN
         GE2//lvAPWmvDdN1NGNqqfjmJbyGFLJm+P2Q71s8My2hckrGB582G2pJvsdoIjofhCDM
         lE2p3ZtV5adB9h+a1Uk3TjLTl04syX8nbRoKw7XejcPN4OLahnMWUXPybmiymd91eP6H
         YhoH9kUhyEdHDqBHO+iVM4R/mCGDX8Y68R3fDyJa2Up7dQY4XzLXr+kme1w4ET1b1fAM
         iByOhiPhgB5l4Bho7FisXNxXTJRcqTcs3F2bVp+sHzVC/W5alNDUI9+VC4jnG2+gbomY
         b5FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773085223; x=1773690023;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=piv/iC5mZlqTCM4BXe8lzoUrPF1ixR/tg/jQuWfPUec=;
        b=aI8E8RtjrfhVD0ha19voYhHMQoSBhMvHDI+svFHPAmchDTRiss3g4sZZi4AnhYQwbU
         yyF9Cki5YaO0zJ5hkOo2lFhQkdyoC8+CwuYTSyfKHHviYv/A5cmviDqlbQjqNpCP6NZ9
         c2lpqVOVoB8F965+ySgBICcRipBtS1yuAUOEDRA/c3AZBp1CJHK4dqve61fjcX/oEaPe
         +V5xoSZYMGk3vOJPB0CwMRgE1n0EsCpS/UcD8BtxT0pXk9nNyO/tFq6zNWcLEy0NWvmn
         057WN8SnwmueFdSSCwYzB28lNnx8xcrm6LOE5WAiUwTlkZ2fLm+zF1PHQDjZvW4L4ewt
         ugnw==
X-Forwarded-Encrypted: i=1; AJvYcCV1l3Bm/wBTgwvGRA3uHEV6G7jldxVEbSJkCL+1yt7d0/zum6fiQ3U+goYO1OZNWxQg0eSeZJa7e8CV1ZNm@vger.kernel.org
X-Gm-Message-State: AOJu0YzhV/eFTmHFrymIMjaabyobxK+cqAD+2ktUCzCPkHdjP9M5F99y
	Qd+0OBXPz4jM0A/F+PRXrI0TuknArySIO6+gyPEd/mkPscxT3Byt8JH3yL4IKrSimgJYTIQu+Ut
	R5sBwPXpFDPbUw1kUEb5EU4nyXO8vHszOkhuzsK3KPZ+Xfe+K2/H/0MfkBajZbY+gAOJG
X-Gm-Gg: ATEYQzzCaDMc7X2ymCJCyAE0WAzCAtAedKuAtxbVqU3WL75QqjC0ETF7EHNYLUdX/yj
	Jo292G+0KlyA/YyyjofJyAd1CcVUzSvEzrCeFCxJZHZS0Cc1xGk+JQyw9tCWwusHlKzs3Ul/pYs
	x0ji7tWouKWLqAplnljkbXWJzWey4j/bN9PG3krTjAmdX85fjAsL/AMsGPQeummdJZX9WsIw+KC
	KSl7pcvFrjIeoyhnn0oOli2UGifSyfWhguwhQTeg8xywXZqEkJlSjQXEWUHp1cTUNYS/mo7WGXw
	f+/ftiZSYb7a5unDAPI8cM7Dq5dhyCKJQYsISTO98dyRoNd5JlJxBn7vVpg1QAqKfA6OUwSFgVq
	7wjeiPo6dgzAopvj0zwEMaXGRoVYLkC5n+GZWj9dsbWoT0dIi1mjEdzahY/WSYN5F1Q1hs9poXc
	dZxwrXSdcUWXLq0gdYqStxN9v8rSFFv3Z95iI=
X-Received: by 2002:a05:622a:450:b0:507:3d1:e4fe with SMTP id d75a77b69052e-508f4705779mr165327771cf.9.1773085223401;
        Mon, 09 Mar 2026 12:40:23 -0700 (PDT)
X-Received: by 2002:a05:622a:450:b0:507:3d1:e4fe with SMTP id d75a77b69052e-508f4705779mr165327381cf.9.1773085222946;
        Mon, 09 Mar 2026 12:40:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d07e015sm2385123e87.46.2026.03.09.12.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 12:40:21 -0700 (PDT)
Date: Mon, 9 Mar 2026 21:40:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Zijun Hu <zijun.hu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur-crd: Enable WLAN and Bluetooth
Message-ID: <6cxuqytvlfdvtgns5v2dsc67dzmdtizbw2b7bzkd6p2mpxkqvx@uxjijpdjukom>
References: <20260309-glymur-dts-crd-enable-bt-wlan-v1-1-3badbddd5439@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-glymur-dts-crd-enable-bt-wlan-v1-1-3badbddd5439@oss.qualcomm.com>
X-Proofpoint-GUID: JXX0jDFYiH5toSOhGo7KFZy4pOKwic6l
X-Proofpoint-ORIG-GUID: JXX0jDFYiH5toSOhGo7KFZy4pOKwic6l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE3NSBTYWx0ZWRfX+Se1pz7Ov4OM
 eKpq9hHe9hVzQXuBHgFYIP1SsXksMALrf/7miGI0nRN5oqeRrH3rViN57WxxigmtAoo3JT2vZ0v
 SbgWBOWfIA+w7b9uSiOyC6XFmgt8hIIzVAB8zw3MuEVw7qWRnoiqJQdTbNRGt6/+cpS85KYONqi
 Uppr80tBoK++iovigTlEUfRZDM844ZCiWi980dQ30Vc9SEaH5OQBYUaLuK34ZNi65WZ61xE0PEk
 EMtGc3SpU3Bdoq0dzE0dk1Jc/fEPiDN+xCbc9L+TweB/tXyZXvrGKJkDv64cZNih1XTJKuvE/+a
 wdcnlsikSfOTvq4eKqmWsXXsv9qdxJ7M+LJavGGI4+YLreSbtEnCxUNgz/go18ynatWO7jOjb+X
 SE0A6d+xswv63e5ylEq32YNmW3OWq0l3+rT17guL3DsBAH+D/FiD786i3NumDoWO79BXGWqb4kE
 jkg6cY9qaAREE15clUg==
X-Authority-Analysis: v=2.4 cv=Cuays34D c=1 sm=1 tr=0 ts=69af2228 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=pobEPZGGObRtYzZmInIA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090175
X-Rspamd-Queue-Id: 73D682403B4
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-96343-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 07:33:25PM +0200, Abel Vesa wrote:
> The Glymur CRD features a WCN7850 WLAN and Bluetooth combo chip.
> 
> So describe both the 0.9V and the 3.3V regulators, then WCN7850 PMU and
> the PCIe WLAN and the UART Bluetooth nodes.
> 
> This enables WLAN and Bluetooth functionality on the CRD.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 119 ++++++++++++++++++++++++++++++--
>  1 file changed, 113 insertions(+), 6 deletions(-)
> 

Is it directly wired to the board or is it connected via the M.2 slot?

-- 
With best wishes
Dmitry

