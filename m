Return-Path: <linux-arm-msm+bounces-75172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B31ABBA1126
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 20:50:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB44E1B25C9A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 18:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C591431A56B;
	Thu, 25 Sep 2025 18:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oKD3gwLx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE073191C8
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 18:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758826201; cv=none; b=V+FLvXcb4B3JMG3j+RYDrDZeaMhoEPJ5Sq2Y3YqWZFzMSe+akCFjj+wgI4FGvguOUFEVpSUXuP+39FX+2Emf1XAAizOumJJeT5XQGUpvzDgGBXbdFkJ6yC1gvMYAMe85RtBD5s8/jZ2Q4X+SfaYkCMV1Q/y2DIDEENvXHXCn/q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758826201; c=relaxed/simple;
	bh=mqolVhntoFxEPudKr49V+H+Z6M2mfKe/9ZpqBvaxDpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q+0T69byfbU+dNxyP5Ga1dK3lx5tGCIa7o3/IcsjdZMg68Em7j0jVvSi2RvNAhOQo9IaXDYcX+mOIQ1tMHAI1hZMDqgRQxjSxe30AjrEEtd/zCIqXSsXkXykKBGu6YUfUhmZO4uUbP17XGFomDxGIwJ3ukDij2GAe+vHGbaFts8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oKD3gwLx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIQUIp008143
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 18:49:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qDehYVnb51D9IEzbSiYb6YP5
	OSGmygiK0FzKBi/Waqk=; b=oKD3gwLxxU299xI/0JM/okrbMCE46MaFNrIUYG2i
	AVgegvRmcVpKdTSFL0WuCyeK1SX+0U6BAULB+bUFs2eYFr/ooB2u8K9OysqGz8Wh
	hYMbvqkoeehQow+GP+InSQTNPh9dmjKUAX2tUJNWdrc2a75PvPI6X5XPih9rlYYS
	M5iWVw1oRMwFrghdbxyQ5qnIeCmSmRpI3cRDlSDt+WEDfau3LaAd/o19z5+gn84i
	E8Lj6IXuoQSsZ6QzR/bG5UwdKYP5i3mcWP4TEavPjS8Ibh/ZsXw3/83OjeCAZVKS
	gzHdZJdnj8xY5nVKbShns3/UaOwzjgz3kxijZ+eYSBz1AA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0vr1sr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 18:49:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4db75c7fa8dso22385701cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 11:49:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758826198; x=1759430998;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qDehYVnb51D9IEzbSiYb6YP5OSGmygiK0FzKBi/Waqk=;
        b=P4ebFpWLmX7hxZwIkdl1Ftc6POS6D/2B6pS9EeFW7QaKqIm8h1tlzg5CGO5g+6K6Zy
         YJxtKFxThBk6PDkvxzJQkJjerYGGPI0VYIBOxsiuFsfSuU3P5wzCBmo9ZUmy212Lc/w3
         W+1n9Tl/7nPowcZtJoC6sNPH/eczG72/Wm5FG6WOkTb+egd/EgTH92UZg+pYIidw38lU
         r87qrwUL5zY1lBSmxfxkR99/njzPzqB61F41e9DmcwEowA7XQQ1J23SBpExBg+r8TOnK
         1K0di7ULgD5tdc5qHfEAQKbtihyVBze9gzbAWW2dIQE8741867Jx/sZuje+cprUDI/jt
         E05A==
X-Forwarded-Encrypted: i=1; AJvYcCXiG1b0P8v5XS59pqrADYVfG2QM6K9Bs6jyT8m9sln/MPChUN2sAKJjiewR/4PSCGtbFTTynBxGEjRqYLBh@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq2Oo4/IKwFrHajtWBPK5/6wGfNi3/5BSs9H3dKQMhJygIWcpi
	cXN5LH8ec9W8Fw8eWE1GU7v+Y5q8xsbYqkD8QQ+52IlGr+UAIjtYycUgoSDfbm3mYG6pG19J+tQ
	cHeHQd0gMclA/+REnkl2Hb8nDvHQAcBhwrdVEOCr2smhOOvjHWwtlUq+9KOXV+hNIFHNS
X-Gm-Gg: ASbGnctVbLJy9kJJ7XheXvUSQVrnae88ODBEKDfNGNxpmOZ0UANljmbaocIqK6728dw
	EKJyqO90gz+JFaSeN21VyQqICd4MPh+EP4ulMf1iULMSNWtdnQmsVLoxYpyUa1SwH8LYC4Cv7gA
	K+bePar07FMwH9Y72VkdiWquBU/jHBQs2ViaqoU4rrqHEVaOz+HaHJOzpJjzbaTAOwDGpHf8Bp8
	GcLIvXOcYppNX9DhHJIoW6BB8lv86cVG1RuM377L2iQ63ZWtWXGs9S+al7vZK6hHV4pBHDcijIm
	sL1wWafJWt3ODGkEYi0cv2bRgSEnhfZy8PLUap44+C0Ki1YIKyWnATJRFz5YL1xRJFTr4Y3PpWi
	Ot8FAOJsxj41z0AkNVoSfA6HSOuPevyLltoL0SKgZxEr8hQOnvn2W
X-Received: by 2002:ac8:7d8e:0:b0:4ca:bde6:cc8c with SMTP id d75a77b69052e-4da49348df8mr58188811cf.30.1758826197869;
        Thu, 25 Sep 2025 11:49:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1j2v2beSwvHVR13GPB3jhEnCzCgYW50DxdectNMsPW6vbCCP41hZSTalxdH5S/krlOL7I/w==
X-Received: by 2002:ac8:7d8e:0:b0:4ca:bde6:cc8c with SMTP id d75a77b69052e-4da49348df8mr58188221cf.30.1758826197216;
        Thu, 25 Sep 2025 11:49:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5831665640bsm1022711e87.83.2025.09.25.11.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 11:49:56 -0700 (PDT)
Date: Thu, 25 Sep 2025 21:49:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: [PATCH 06/24] arm64: dts: qcom: glymur: Enable pdp0 mailbox
Message-ID: <ig4z72wwufcyiktiqebovfq3dymtlcmy5v5iihvknbggrjyqet@tylhjfvv6syx>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-6-24b601bbecc0@oss.qualcomm.com>
 <CAJKOXPc8NYrwSLbaFZ_tRVpgkYPUYhaMde77p1VBhqm9PLsGjA@mail.gmail.com>
 <bugtpjwk77lcpa4jjox62ulmy56nf6yykzpr2ryifqqpeig6gp@45lzpngcpo2z>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bugtpjwk77lcpa4jjox62ulmy56nf6yykzpr2ryifqqpeig6gp@45lzpngcpo2z>
X-Proofpoint-ORIG-GUID: w7UUM6QRD5Mto74-NXbTjFts49kbYq3H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfXycJ47HNgAbdX
 wHhVVAFEuFDVumd4Ytk/ozkr53rCHUZ9oVIdX80hCzQuLsUW8j2qnNsvl7mNpzCjbZXOcCn+H2P
 KhVU15FmkT8fi4eSXFXFc8R+21LalxAMJebyj4SbrYHmSKgnUTnudRZyaKIRFnwZyINIFepiTYE
 4gzk542uNXD63G7fyyj9ojXtbZqxOe+PQmTnU2byFO5qUJ0oLXZMFiqNAbzwhTYePQT7dwVjbN3
 EMjGzvWNPo+sDJK74BnSbdSRDl1fxjUhI/fpO6752bZebJOY6uFctEEDqWlQXMQUPI1QzVMeLK6
 WCSIrP+Ou6u6w7ErKAVEaQUnSxLC0zHOMOPfX9zlPAUiKuj8H1rGwdjcOVtllwX+lZo3ICbWNsM
 4N8/OsUnUpE1uAfvoh1YXt9WYRn2bQ==
X-Authority-Analysis: v=2.4 cv=OstCCi/t c=1 sm=1 tr=0 ts=68d58ed6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=WwjLFScS3zh8zo_N1MkA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: w7UUM6QRD5Mto74-NXbTjFts49kbYq3H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509250171

On Thu, Sep 25, 2025 at 12:06:40PM -0500, Bjorn Andersson wrote:
> On Thu, Sep 25, 2025 at 05:23:07PM +0900, Krzysztof Kozlowski wrote:
> > On Thu, 25 Sept 2025 at 15:33, Pankaj Patil
> > <pankaj.patil@oss.qualcomm.com> wrote:
> > >
> > > From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > >
> > > Enable pdp0 mailbox node on Glymur SoCs.
> > >
> > > Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > > Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/glymur.dtsi | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > > index 66a548400c720474cde8a8b82ee686be507a795f..ae013c64e096b7c90c0aa4cfc50f078a85518acb 100644
> > > --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > > @@ -4065,6 +4065,14 @@ watchdog@17600000 {
> > >                         interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
> > >                 };
> > >
> > > +               pdp0_mbox: mailbox@17610000 {
> > > +                       compatible = "qcom,glymur-cpucp-mbox", "qcom,x1e80100-cpucp-mbox";
> > > +                       reg = <0 0x17610000 0 0x8000>, <0 0x19980000 0 0x8000>;
> > > +                       interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
> > > +                       #mbox-cells = <1>;
> > > +                       qcom,rx-chans = <0x7>;
> > > +               };
> > 
> > Again one node per patch. this is really pointless, please read
> > submitting patches before posting.
> > 
> 
> In this series I certainly agree with you.
> 
> This is most definitely part of the next patch, which is core support
> that should have been part of the introduction of the CPU nodes in the
> initial patch.

I'd say, all CPU-related patches should be squashed. There is no reqason
to have CPU, CPU idles and CPUfreq in 3 different patches.

> 
> Regards,
> Bjorn
> 
> > New Soc is one logical change. One.

-- 
With best wishes
Dmitry

