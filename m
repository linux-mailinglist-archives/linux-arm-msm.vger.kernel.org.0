Return-Path: <linux-arm-msm+bounces-89269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 34537D28781
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 21:42:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 32049300E816
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 20:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2049324B34;
	Thu, 15 Jan 2026 20:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aNvyqj7s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WrpfkZvj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F61F31AF15
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 20:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768509756; cv=none; b=qDivFsg+ptCmOZ0KhlIjWuHBqBmj4H4Lbxw3BBKS5/JwlUmwwSOjgHjEvN51dpvdc81U63DaxM50QVT39AcSw9MNc0Ev4G6jEarl9glbECq0OFytYxLOIF1vUEPTBWB1o9Jp961x4kzappqyBD6Fx6AF9xZofSdO66E8QA7NuYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768509756; c=relaxed/simple;
	bh=/QXbmoxrKHcwhwSMMmzqdaKLWqoUg+vw5fLnNTTyduw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FordqfHLbGbHUry3sZ9ovjGiBjjrlFrTt3bt2dCtzkOIg1BIY0G4vlc2dqWY3wGLntl/PPHooZ/Dno9TiD/76kG0djYuC16jBGpZMJ3sL0DJCOnpHbS+FZ3v7UDGo5p/yM1JVqmAziC3dFGBMbM+cPyYzjk8VtoWpD43ZjYkmDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aNvyqj7s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WrpfkZvj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFYD4K2174490
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 20:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CN9KFL6/el4qGCt2ZWh84syvyczP7Vcktf1ONlUr/yQ=; b=aNvyqj7sn3g+pC1V
	sppHr5oxCpWuOVwbi04c4nuf6dBHDCLensJb+am/ys6KG2ny9WT5mRxBNJ66HQ6e
	q1Z+oSTHkd9D9Z5Vr+uqtkYZCzKQXMgObwo3Dpa5qLlm0cS7I1Uug/HTsO8ROJ5p
	nqJT6nkII4u9wZkxMZllOzAO7H7XlzaBR+vpPXeJlVg+jbYQE+TWGiJBCS3HU1pN
	tgwSWeqoSsVIA4nFNhnc06N8l+/VI+Ng2KdGZjs3N+vQd60zlOalObZYcsDyzsOx
	h0E9OuseE9n1AyIcTLUHhXWV5l2BZLu55e6LM8kIA8EmTm63Zf0skbWzppVzADoJ
	YUvYaw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq1xh95ta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 20:42:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c2a3a614b5so337551785a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 12:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768509753; x=1769114553; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CN9KFL6/el4qGCt2ZWh84syvyczP7Vcktf1ONlUr/yQ=;
        b=WrpfkZvjYMYWfJbMgSjtSaaa14t+rIN0z+XNpgDL/w1uZYlTsQ9mK2UwrX5oHRwkDn
         d9j5i0Qyv8WurQgxJhsgLA8b/PFHVBSLz8Ssh7AXGAEXFc5k2Z+7bGWZBCEN54Bo0HFd
         wUcjE/mGErcqCIzpsLniOYJa/Ph0R3DLSVHH99LaJjwK+Jj6D2LkJiJkLe+6TFPoMPiv
         d4r6WXb0fJW1iNVXk/Dq2xKdBE2wLlTdZW1Pf1Tv/sQJVGQOQAiOY01XpdhrFzMDsmAc
         rsud38Io8Ut3ehgcTdR1/PRit+xCHoid1sKRgUJADXOtqrFu8CK97fjmvFH8weBJRGuY
         cV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768509753; x=1769114553;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CN9KFL6/el4qGCt2ZWh84syvyczP7Vcktf1ONlUr/yQ=;
        b=vZZiHNNnQo1NRdVdXWwLdqEwEwWTAJ7xzrTb3zsrh9nV6gcIhj11PRk9yLI0G9hTH7
         ZfwfsFztbxW6BbB8hqGtEtoMop0hZdGAnOkiOp/kG/zYXt5IhbQlODrriRXocidyiZ1c
         ZHhcq3PhPFeA7vHcdRIaSqnN3cIzGNJBYF4IYFAEzMHn+Kk2z6ab3Vd4PD/FYRBP29Lb
         OvIqPTB67M5YtL5h9vAYZUVjf1nlC360iDunY9TjtDf784l2KdZp77ibypSXJ7eItlcW
         7gKcChp21njksERSXjngTD/46B5MGDrLOQpEmB6s4rpfkgMA9ioxoQ3V5skkJLcaSLTN
         krSw==
X-Forwarded-Encrypted: i=1; AJvYcCUGDA/wMH4k6RO5YZvW7lqHrEtoFgqnyprPBh+MgpRsSJU+v1/MDOU/Y7RE3Oxlr3ZfAHpmTvar/26u6GA5@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+V2uw3aANmuNyN4xc0oC4QQAZLOuRhW5XPw1GWVEcPX7rv8Nt
	KMoEElK3v0IOhWcMeQw7g0O0YjzLkTW444RrWQXiawAbM14Of6CRoquPHRviONsGTSK/S1A4ld/
	EGQ+/g8Ky2Vg7+tsFMNzS6sHFo0xZoErrLJWo1LJBBdCrGfse+P54DGmUEKGXBvq1d0q9
X-Gm-Gg: AY/fxX7O0wJs9LWhki714EM5PqvfUF8DO4fGLO0xYl3KiKxZeLi4j20RFN++N+fwwql
	9JeRw/XBMB8dtc87P3NomUZ47EJfdgeUarGkmBd1y4CuLQyBNO1xBqmaLzqMcCccAGe391gp6ks
	dkjO2C7eft2PyDvZH0Oqx9NMBR+MRXwRLc8Uxt49wmyPiIHJSPKequC/k8oA/kTMEoWqDO6bTMG
	phizyyuUKv3OugMh0kJNw9rASfVQl65GwtT5EishAMfzt1NwIy8+u7wBy84c4WPMetwZRidaywR
	6TSnacgkql9aSsFZQgw1c1pGgptFg311Ul/fIU5UDkua3riKgW3Rdy48KsdKj0vW+itQ7ZUjM/4
	CW3UECG6Oe8yIueciAyJX5+G34KmxmsgZcCII6/ai7RCRjN200WJf7ZsekCgfcA26R7VCBQ9x5B
	GdxdZI12tE118DXCYZ989QIPc=
X-Received: by 2002:a05:620a:4591:b0:811:8bbe:7a3c with SMTP id af79cd13be357-8c5919e2c16mr586136085a.23.1768509752815;
        Thu, 15 Jan 2026 12:42:32 -0800 (PST)
X-Received: by 2002:a05:620a:4591:b0:811:8bbe:7a3c with SMTP id af79cd13be357-8c5919e2c16mr586131785a.23.1768509752277;
        Thu, 15 Jan 2026 12:42:32 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384d3fe0fsm1589771fa.3.2026.01.15.12.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 12:42:30 -0800 (PST)
Date: Thu, 15 Jan 2026 22:42:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: Re: [PATCH v3 03/10] arm64: dts: qcom: kaanapali: Add TSENS and
 thermal zones
Message-ID: <vjx3bd75zdgdh6hzhrmlv5tlarnf6ea3yklwhg7jx6momknase@kstxwngyicd3>
References: <20260114-knp-dts-misc-v3-0-a6cc9e45de93@oss.qualcomm.com>
 <20260114-knp-dts-misc-v3-3-a6cc9e45de93@oss.qualcomm.com>
 <4c44mmkpsnj4cn2eh2xzraiw73xmhtx4qm3xiyhecm4vyou7os@skyj646r63d2>
 <3cbdae12-af7f-47ee-89dd-6c00660fa6da@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3cbdae12-af7f-47ee-89dd-6c00660fa6da@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: XTuTz7QdZZX2LnMm3IAEOOpdSRTi36KF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2MiBTYWx0ZWRfXxe09AFAwEEhD
 8PepY2wq/nOJhHEEmzeVhugVZBrbdaQOCAwA5hKc5jby0tssS0Vo4Ee+4BVH+heqQ5/Uv35XA+T
 D0IWVm7WSDFccRv8CuBghKHGACW/r/X0ctLpvZvLQzhYCn5PqsDy71uyJEzUyxbr/U+CWTFc6mA
 Jfflzavi4Iq/fV6Q5nHhbM1DJu1djQNXbvfamQJu+UIUz9CGJolt8VyQ4vCQUTlk9tA9kriB1JI
 Az166egmrxBoiF6eVsccBfgM/HVgWC1cxhAhzc2cVjnkCsxDgaNKWmg0Jy4vDw2GcSNWFP5zIj4
 LNkRmzBF5p6RvAfVhPFdWuxlBBaVq1hYW2gAUpXlw1D6CcGIYGIrFOhBAc0cZ6SOBx9f9jkCvTv
 B4Tw/hv12nVanILVNSAXSyIY4SA6UJPUVx3nTaqOZC5oA9X/qFrVzE3vaiLrdD+yVN1Xz8sPy1d
 MpoSRRvSj8IJFVdK6cQ==
X-Authority-Analysis: v=2.4 cv=TdWbdBQh c=1 sm=1 tr=0 ts=69695139 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=_Yo9kbbprxnaU08VRSgA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: XTuTz7QdZZX2LnMm3IAEOOpdSRTi36KF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150162

On Thu, Jan 15, 2026 at 11:22:57AM +0100, Konrad Dybcio wrote:
> On 1/15/26 8:09 AM, Dmitry Baryshkov wrote:
> > On Wed, Jan 14, 2026 at 10:49:05PM -0800, Jingyi Wang wrote:
> >> From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> >>
> >> The Kaanapali includes seven TSENS instances, with a total of 55 thermal
> >> sensors distributed across various locations on the SoC.
> >>
> >> The TSENS max/reset threshold is configured to 130°C in the hardware.
> >> Enable all TSENS instances, and define the thermal zones with a critical
> >> trip at 125°C
> >>
> >> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> >> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 745 ++++++++++++++++++++++++++++++++
> >>  1 file changed, 745 insertions(+)
> >>
> >> @@ -4795,6 +4879,667 @@ pdp_tx: scp-sram-section@100 {
> >>  		};
> >>  	};
> >>  
> >> +	thermal-zones {
> >> +		cpullc-0-0-thermal {
> >> +			thermal-sensors = <&tsens0 0>;
> >> +
> >> +			trips {
> >> +				cpullc-0-0-critical {
> >> +					temperature = <125000>;
> >> +					hysteresis = <0>;
> >> +					type = "critical";
> > 
> > I'd really suggest having several "hot" trip points at a temp less than
> > 125°C. (And 125°C for critical looks way too critical for me).
> 
> LMH and the firmware make sure this never happens, the critical trip
> point is a last resort safety mechanism

Looking at e.g. SM8650, I can't stop but notice "hot" trip points at
110°C and "critical" at 115°C. I think, LMH is a replacement for
"passive" trip points. But for the thermal shutdown we should give users
more warnings.

-- 
With best wishes
Dmitry

