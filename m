Return-Path: <linux-arm-msm+bounces-89593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A772AD3A396
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 10:46:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 29B5830000AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 09:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2A313019BA;
	Mon, 19 Jan 2026 09:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pf26n0cO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ip7PbdQd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B8C239E60
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 09:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768815979; cv=none; b=WN8deGdvaBd6paF7uKds8yqUwNV1vuasOeMbl9eKMxtScz3s6IrJAbiGs9XE3CSuci65l/dr8C9TiLQHe/dsss9yHpz+8g0hQQT5gmFfpq+f+JiiMsFvuSixw7cg/XYlKCN3xKdPT/Tttq2URvtjCQw/KtrHiTgKDSTQEkO1vNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768815979; c=relaxed/simple;
	bh=54kDo+yYKx5SL/Ug0CubxehHXAXSGrGwpLPPxMWX+JA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UenSR6dL3x+IuLYFMKH3qscC0iNMV6p6BphnHdLlNdDEakDJQYp03LgHD5zsTjRrdLs+XDJXIOUOua6qwRB8wkU2UvGf2BEUdXF3OquKvzGPQhyls/3ZY2szCTQSz0lkUgzGDzZCaGEoWHk0ib760XCsGVgXidUmu5JDFRy571w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pf26n0cO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ip7PbdQd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J91KBl1354136
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 09:46:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1X5Z53aSxVVYpihmsGQENI6N/z7wN5MrP5u9+v5LKw0=; b=Pf26n0cOC6uacnn3
	VAQlkZkXEuCVpg59jH63P7qxcPxH1skX4u6dRi43EGf2O+AvND1IxVOA3GFYsMWv
	fOzaQACqxdEmvT5Yheokhuimn0YJ7iuyexcnmr7laDTeAtj9jz6n4PZKyGkfVtqj
	JtoZeB764L/CxgOsXDlLoumCZfpEEh2HrnY7GQDoRx7av7e1XikA1BxVG7pBZipd
	fw5Nbxqh8r5RGwyRHwxqzidWi3dg4DEQegJ3BeeXM5nC8IX1FLGpOJHIpNZwajW2
	DGgzcj19VBWPKjVeo072QMAusfbcwW81JYuv0Yy+fne8a3ePktNAkiZr7M2w8D3V
	HB5WTg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br1cqcs75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 09:46:17 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a366fa140so156855316d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 01:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768815977; x=1769420777; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1X5Z53aSxVVYpihmsGQENI6N/z7wN5MrP5u9+v5LKw0=;
        b=ip7PbdQdyI/ctHuWYvtxdSIy4gxm9JP3QoaR3G0+cfidHR9n+zybQI7HIUsHa3cvRk
         SXTU5r1AtoJOJt998k1gfvdbkQxbZJpIWQgYOtTqgchpc6NUPgA2h9CP5AYHxloE0gen
         L0BYd51uYstrZOBELB9gYT4o0oDjYqPw5wJhsMgU/nnRadz0LTmNKcUC70SAFJ+Oz05n
         i6gd7gnKQ2zb6k5MHE/8Ru1W5y7QdAJUGAmSCYnut5Zxedm4LVTz76N87FHnnrvw3qdc
         Zj9IRBmyLZ0gocjjZa27htz3sVKVQ51ibI/yOI6aJ/H+Alvo9PTEyPkfzkw8KJHAbOb1
         VTCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768815977; x=1769420777;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1X5Z53aSxVVYpihmsGQENI6N/z7wN5MrP5u9+v5LKw0=;
        b=RdCf7c6CF1m8uqYTk42M/tGajKoF7dCB3/K+rjirx6ALMhahM1SIPjGvG5Z4zhooXa
         bcFrt2bLr4zZS8eJgpI87QCfcjZfNW1FH4RYCkpAhPMf7ynuJ8NFKpJgojz1M4I926Xa
         u4ttrlazipoyk6b7eFXoyt8470luAWpe16DVGN50VqyeJ1sglThKB9cItGZN2VQ9MyFS
         pX0WiS32Aei5gk2ZSy/jPMMN0eb4E1Yu39vUkX8Qi3PgrKk/z4Gfm6q23QvDGRyAhjsJ
         ax/txmaLEeClaxOA2DmcQJDLOs4qUMK/V54+4ep98VhjdS2ug688L29+xRVmao/AuQQu
         FUZw==
X-Forwarded-Encrypted: i=1; AJvYcCWV68h7mR+ljGlEjFchUgrkbQa/lpg0W2zArBqRppWN6TC/zIfpghLlTxJig4VLOf21qOAllgCVbH76dFYy@vger.kernel.org
X-Gm-Message-State: AOJu0Yw05zVv61d0my7DSARdWFdONaR0WtFd1BRrMS8mwpXqgeJUBQV+
	SsSvCP6J6XJU93tsjcKfmRTgFWETb92CA+xudRc8vipmTbTLaX10I9dH8mIZGDQLH09czrAXMkj
	LttZjDKIcj7g8LV7hliXXzUzaydlAIPUgshtyNKKZbYKyV8BIJ0BKZZ5IqvVwhKxtYGAJ
X-Gm-Gg: AY/fxX70nomEcUIsWT3pF9H+0P7sk/SuJxzlj7wv8rQeIHqzpuALqQC/wblezTXlI3C
	ANp3PIM6iQXmxSfWPft8bRYlI5HtXwqLw/1tGlmSgp8ziN3Gxe8MDC9RF4qz4E8/9XpJLs/cf7d
	B2RR/xw27T1lNQ0Beyd87ht2/TGpLAJopj+cXTIunG7XuKd1XYdSSrccIj3iJwuxCBFh0qgNbkX
	w/7+tRKxJDaXuTTCJdlqQXAZcpfqpFriAhgiFqLAlWgUHkNao8vWGlRJp7pW0LiBNe+vXtao/Nl
	+CpJSzvDOFeq7x+c0K8yIQSDSjAaazr+EKPA+kKxs2e3rdbdaYNRsX7whx+08VlquJ9sbhoBkpa
	yKqIQ88MXX2aI1l3q+sGC6njYXzUZTEErwctvcqIqL6E+p8gbrZ55EPzVt+cBXsWKotkl8Ymwg/
	XuuaAG5DIwKyc5DUiM5+ZMjiQ=
X-Received: by 2002:ad4:5f0b:0:b0:721:a9d7:297a with SMTP id 6a1803df08f44-8942e2d3d7emr166222346d6.7.1768815976790;
        Mon, 19 Jan 2026 01:46:16 -0800 (PST)
X-Received: by 2002:ad4:5f0b:0:b0:721:a9d7:297a with SMTP id 6a1803df08f44-8942e2d3d7emr166222106d6.7.1768815976342;
        Mon, 19 Jan 2026 01:46:16 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf39bc5csm3222115e87.67.2026.01.19.01.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 01:46:15 -0800 (PST)
Date: Mon, 19 Jan 2026 11:46:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: Add base PURWA-IOT-EVK board
Message-ID: <7sbof5mgm7mqtm4gh45f4w7264akplqtkfyplrerek4w6seipl@ith7sc3wmgih>
References: <20260116-purwa-v4-0-89b2adae9f09@oss.qualcomm.com>
 <20260116104136.2922032-4-yijie.yang@oss.qualcomm.com>
 <d15bbe2a-a88a-4a88-a685-ecd4f058c3af@kernel.org>
 <3404f2f4-7edb-4bff-925b-0a6a7a450f5c@oss.qualcomm.com>
 <eawxuhblnho4pyeyskvk5s4ouqser7o5jh267ttinzeeowxfxs@y6nl2qbdydb2>
 <e1c00e57-cac9-495a-9d27-f77ceac5c5ce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e1c00e57-cac9-495a-9d27-f77ceac5c5ce@oss.qualcomm.com>
X-Proofpoint-GUID: JUGI_Gd1oQ9MaNa27CV0gQPdV1Ywuo-V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA3OSBTYWx0ZWRfX5+TO6FJRDDOZ
 M9qpDJgDNHDbUuIOn+synnMkEj6jwRvmRRNSKs/JZeUNojrVO7Atl13/8WS4/6WLm3YOYdZg0f4
 VrJcauPLiUFL4z4v0Zai6jTaZUHXA8/+y9+kVuSz+Cbh0rIdyIj5Cva2PS0lzY4tb/RBlyRhaU3
 1BarA57L0pxXFcTvflZuCzeSdr27QZGzQkSI2xJvqPEzwF0AP/HKpFbcAObi9SBFzni96aKEIIg
 Xy1D6GwoMBWDyb/Yy+gLy/Q+oOOOIeW27INkXatUiBDNw5rwGoxLg0gJh0UFLzAVTHlt4GI9dn1
 TnBrywds4NHRDtzHvFWeJR4UdtHr9AclB/j5rBqM3xrt8s+WzUiN+RY0dbw1tfibrWiqO+fjAX0
 ouAnTW/BbdUDYAmQjCalheHyERqIztxvLaHnU1l1hMgDHbwtSDSo3opqMW4oUFJndn027d5wfh2
 Qx532kwCWLxf6hBwEoQ==
X-Proofpoint-ORIG-GUID: JUGI_Gd1oQ9MaNa27CV0gQPdV1Ywuo-V
X-Authority-Analysis: v=2.4 cv=NfbrFmD4 c=1 sm=1 tr=0 ts=696dfd69 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=CTI4GSw63VgQimMWXrcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190079

On Mon, Jan 19, 2026 at 04:48:20PM +0800, Yijie Yang wrote:
> 
> 
> On 1/19/2026 2:33 PM, Dmitry Baryshkov wrote:
> > On Mon, Jan 19, 2026 at 11:13:29AM +0800, Yijie Yang wrote:
> > > 
> > > 
> > > On 1/17/2026 12:19 AM, Krzysztof Kozlowski wrote:
> > > > On 16/01/2026 11:41, YijieYang wrote:
> > > > > From: Yijie Yang <yijie.yang@oss.qualcomm.com>
> > > > > 
> > > > > The PURWA-IOT-EVK is an evaluation platform for IoT products, composed of
> > > > > the Purwa IoT SoM and a carrier board. Together, they form a complete
> > > > > embedded system capable of booting to UART.
> > > > > 
> > > > > PURWA-IOT-EVK uses the PS8833 as a retimer for USB0, unlike HAMOA-IOT-EVK.
> > > > > Meanwhile, USB0 bypasses the SBU selector FSUSB42.
> > > > > 
> > > > 
> > > > NAK.
> > > > 
> > > > Warnings were reported at v3. Did you address them? No, you completely
> > > > ignored them, so warnings are reported again at v4.
> > > > 
> > > > What do you think these emails are for?
> > > 
> > > This warning is caused by the pcie3_phy node in purwa.dtsi, which is not
> > > introduced by this patch set. Since it does not impact functionality, would
> > > it be appropriate to fix it in a separate patch?
> > 
> > Why can't it be fixed as a part of this patchset?
> 
> 'qcom,4ln-config-sel' is a property related to bifurcated PHY support, which
> Purwa’s PCIe3 does not provide. Therefore, introducing a new compatible with
> a corresponding binding would be more appropriate than simply adding this
> property. Is it acceptable to address this within the current patch set?

Within this or in the separate patchset, but it needs to be fixed before
this patch can go in. Otherwise we are enabling broken PCIe3.

> 
> > 
> > > 
> > > > 
> > > > Best regards,
> > > > Krzysztof
> > > 
> > > -- 
> > > Best Regards,
> > > Yijie
> > > 
> > 
> 
> -- 
> Best Regards,
> Yijie
> 

-- 
With best wishes
Dmitry

