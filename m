Return-Path: <linux-arm-msm+bounces-89563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5E8D39E8C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 07:33:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25EBA30389BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 06:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03437234966;
	Mon, 19 Jan 2026 06:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lyZv8y49";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PdXFbHNo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79D726ED28
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 06:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768804426; cv=none; b=eo0dtmwJ7rzSqYT7/aAa2zUVPZ1LklIMRhXiIux5555Gwud8BtEIbYldW263K45IbtYqVJoRYaO+YBGNPaEZBmI/1hJl61ra/USd2mZbqiVBS/n0gg4JB9Q8+nR/9tOgcP6MxFOdPiUAPO1QsedSCtSpvyZwZuouPSQHqz6PrFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768804426; c=relaxed/simple;
	bh=VMyPPKv1J0fVPpM7Cv/Gjc82tc2/2IPQbdRxeb62a4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wuv4klIBbTESgMs2asGmSJFqk9OVcE2VZy4otLz94ZWOJvIcawiMf2dsfvFNIiRnyeZ+f7oGDXbYrJaJp7W87zbyLHYtX2tPURDaPnLRtFRNxwjfl3xXF09Z05vPlp9cJAr7QyAdPmd5NRJchUYtR3SP8XJEpuwHpz6PHhoTiu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lyZv8y49; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PdXFbHNo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60ILo2lr3003473
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 06:33:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MhU0aZqvrIrSdSRBpUgm7iOn
	4NaqegaCjfon30LZwSQ=; b=lyZv8y49F7MBp06+LC08DKsiILWURVh7npDTN9et
	QpcdGTo2o1G7zwdWFfoNLqJtXs/0jzz3mBWfHTGWgmdv5aH3gECuQi14ym4HyU0a
	vN1rkZ0uyhcUCWEkt2NORhQoKq4gAKNBYjLgWCooz36ArkBK68IbExtFMP7WHmvj
	vxqkdMRZWEIGs6OhKJbSqXQLjdjJPgLkt6Asa64sR3AVeoQwra6wfH65iJGBaSFc
	IrSQ3Q08pO/nD/DEO7Y5vnlUwPhuM5rseDoQIJ+Pbu7WTTaF4qe/bNGVXTRcCIjk
	tE1uNcHd1HDlD1G0/zk6UMXlp/L8bUFLyrXJBs7YNbgEfQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br20x41wf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 06:33:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8bb9f029f31so1219592285a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Jan 2026 22:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768804424; x=1769409224; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MhU0aZqvrIrSdSRBpUgm7iOn4NaqegaCjfon30LZwSQ=;
        b=PdXFbHNoNB8/Y+Eq6fj1kEkg29U+Tt3bkjtmxm8G4xwp4tL7IlEBTkBWKDIo45EFB9
         zhK0I3ejHYXnue/GhK8YjH6FWGUZkJ1tfbnuWOjSfwqvhws4uyO1RxlJF8+xk2fIplQd
         l/OuCQKFRdgsIbR6sbEli/FC3r4P7qAnHnADbsCSAAiqHxUzS32n5ws+G/9oCv6hT1oG
         Y3fw4KHB/k6L9sYWaWmi1rNgguF883PpnauUpE8u6Ep9hBG1tEJCVciCYkqvn4TQdBdc
         R8XVRDKEyE5zORrz+6Ph15nIzqSJP3Q+pqkJZ6oejuGOzQyfYnYOwNTDJOmTwN8qGxhg
         4OjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768804424; x=1769409224;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MhU0aZqvrIrSdSRBpUgm7iOn4NaqegaCjfon30LZwSQ=;
        b=UqiauIwHsBdIWVhhfmz7V2947QDO8w94VGCiuXSsedRDky2+qwDxrDB9kYR9ER7fh3
         eMxkhqSN1CQdHJURc1me0N34GRFYpxNmbTWQTY2/c0j6tiC1T5fpUIN38I2K+FUi1Hpc
         bFmgGvJP/cwlW5xKrCa2xMys4yD+o9zXroqVc0LU4W7Px3Sv11FrXE67GVNuwtDQFKk9
         7y451apkKP5jn5QYQj17umk1iaJPBJy1GkUkks47PvXlC4qEtSn/+VxkEyGMxDHBYsx1
         plOHJIwMbaohhPEQr0h8G1uRc0CHHjubqhuDaaxfdVN1oRVgvNktI4Fcg1Df3xuhBfcj
         n/QA==
X-Forwarded-Encrypted: i=1; AJvYcCU34XjHOhQjsgA6JwkSDkdEPyikeUh5Zl6Pjn5VOgnDxasADvmMQR/LWGUivr84KTgwAb820xx+uGdy3xFz@vger.kernel.org
X-Gm-Message-State: AOJu0YzNc0YksyBEusqufJNjZw7Vk3uHjuxlTLdi56bkDEjtmzWQOBgV
	iY/8NWMq7P6WydDI34/r+XfFezM2Viu04ugU7IfAahBzB515YbwUMNxbXtcXcukFVTaH3jmjPKY
	s2bVY3aQ1dxVUEsp4+lZe9aYmrhPy+yrj97s1c2GnsA1Z/Va55jqbQfbmfTZ4k205SoJ5
X-Gm-Gg: AY/fxX6l+T5VslVqi+MxtTMymjBGnMvHlL3FT0EnWVI6CtIktUSmsnczl1IJrs8y97P
	j+WPNysh1oGmjJjy8AAeWqHG3d59ycpBPEfOplZspIsEgrMC9SpzZ+fRk5v3zJT2SMnNkUIAqNX
	zzPu7cD1maNFSGQYbeMC5im2O3Qo1lfgIZgTfh6yCE82su9elZvAzmqG2GBi7RJxQXGFq9LNapP
	8il7vU//Cd2AmkAtecicUkRfooseEzNGceCX8fSWyLpV9G9JYJdPlkWhVBNaLiNJXJMMgNahfl/
	jxPbg5OdAfMvP0x+RvCEiKcE9ZM/1EjXwPEQnrdmzSKXxY9waraSAICSnQy6J5hzzszb/RS90cl
	oImnSLf357nw6crXml6pP4KyC1sN7i9z+wb/BzCPPypQisjIwfidx4m5OgUmtITN6+/oAuDLk6w
	StkE8lxVcd8RqduqZpo3mOlwk=
X-Received: by 2002:a05:620a:2893:b0:8c3:650d:5785 with SMTP id af79cd13be357-8c6a66e90a2mr1496957085a.16.1768804423894;
        Sun, 18 Jan 2026 22:33:43 -0800 (PST)
X-Received: by 2002:a05:620a:2893:b0:8c3:650d:5785 with SMTP id af79cd13be357-8c6a66e90a2mr1496955585a.16.1768804423494;
        Sun, 18 Jan 2026 22:33:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf39c051sm3021350e87.79.2026.01.18.22.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 22:33:42 -0800 (PST)
Date: Mon, 19 Jan 2026 08:33:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: Add base PURWA-IOT-EVK board
Message-ID: <eawxuhblnho4pyeyskvk5s4ouqser7o5jh267ttinzeeowxfxs@y6nl2qbdydb2>
References: <20260116-purwa-v4-0-89b2adae9f09@oss.qualcomm.com>
 <20260116104136.2922032-4-yijie.yang@oss.qualcomm.com>
 <d15bbe2a-a88a-4a88-a685-ecd4f058c3af@kernel.org>
 <3404f2f4-7edb-4bff-925b-0a6a7a450f5c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3404f2f4-7edb-4bff-925b-0a6a7a450f5c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA1MSBTYWx0ZWRfX3FHL5t48xG3D
 1cRRIAX3w6M4FCbOA0pYBObLSshT+f9TyCZhVermombmF9wupaNtQnAJbrNg1eXP2ZUyT2eBu8H
 mvTkX7KWpyFO3LXp9z1oDZEBOaSf2nsEDDNCp7nZtgX70gvH7vXCPsXevaSaqa40muIa+LGSf/S
 7NPaTyOT//JVFZ8G/HJy1nSCRcG2axzxmu+hi5mc9PGk3NrKVfhN+ep4ie9M6d1Vtba2KyQH/8g
 zj1g4M4PPTcqDoD/dEiRigZcK0qM22uH3CojtTdEkZeKkUbrsx128QhvwxLL8JD16cPotc8QGf1
 Q74ABNWZ672LF2CFiZoCrYI9xVLxvctfEV3O+wOzplYSqAtFMQJ2njvnUUOwQUhOJG6JRCChmxw
 x7ud0PxbsAMX3cW11RtgQ/7GlJoNTT7uii5pYdJsdDQA0Gb4r0p7DLuAeNaY0NtUfHGuAQa9htl
 L1jY36dsf2ZG/C0vV/g==
X-Proofpoint-ORIG-GUID: NXJTeLy3LJwGb2X6x3RV5mBc7wy6ndoi
X-Proofpoint-GUID: NXJTeLy3LJwGb2X6x3RV5mBc7wy6ndoi
X-Authority-Analysis: v=2.4 cv=abRsXBot c=1 sm=1 tr=0 ts=696dd048 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=RSLIvqAEGxZyComq2RAA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190051

On Mon, Jan 19, 2026 at 11:13:29AM +0800, Yijie Yang wrote:
> 
> 
> On 1/17/2026 12:19 AM, Krzysztof Kozlowski wrote:
> > On 16/01/2026 11:41, YijieYang wrote:
> > > From: Yijie Yang <yijie.yang@oss.qualcomm.com>
> > > 
> > > The PURWA-IOT-EVK is an evaluation platform for IoT products, composed of
> > > the Purwa IoT SoM and a carrier board. Together, they form a complete
> > > embedded system capable of booting to UART.
> > > 
> > > PURWA-IOT-EVK uses the PS8833 as a retimer for USB0, unlike HAMOA-IOT-EVK.
> > > Meanwhile, USB0 bypasses the SBU selector FSUSB42.
> > > 
> > 
> > NAK.
> > 
> > Warnings were reported at v3. Did you address them? No, you completely
> > ignored them, so warnings are reported again at v4.
> > 
> > What do you think these emails are for?
> 
> This warning is caused by the pcie3_phy node in purwa.dtsi, which is not
> introduced by this patch set. Since it does not impact functionality, would
> it be appropriate to fix it in a separate patch?

Why can't it be fixed as a part of this patchset?

> 
> > 
> > Best regards,
> > Krzysztof
> 
> -- 
> Best Regards,
> Yijie
> 

-- 
With best wishes
Dmitry

