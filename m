Return-Path: <linux-arm-msm+bounces-69415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 944BEB2882C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Aug 2025 00:09:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAF1B189817C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 22:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE6AF225A4F;
	Fri, 15 Aug 2025 22:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aZ8Ww0UH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5045728399
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 22:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755295787; cv=none; b=oz3tCu/scfmi6X4UCFTV+y/fRr1HQ97H7Nz78NwL/5i6oA6K9EKxkQ5Xta4D8fwiaR1GZxDj0zcn5QlAHm0Yo7sQN5xRoMV37II9AtOw9MyP2kIJpkt74pItTeTb6DkYxZfN129Kdp0OaBDRPZLNzl/mxWg7Wt6074p/ttdyjLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755295787; c=relaxed/simple;
	bh=nQkHdDW9KfDS3+GPCTkk9jnGBJIoRWBUyMce7zVrsKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F8u/dTMH+mEKc7oPAeKoe0MJimTAWZlMxdWasDGya3guJzpvhD2jfRo7VRlXRETLCHY+WK1yBBUc5mcBvH3VEaMR2dwLI7f3d6E39MsuIY72fUQtlzV6i1GcB1kenzjTc7E7Y3Vwrm50W/0ERssMjRNMmOJ/gxx06P5/AMm2O7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aZ8Ww0UH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FELVaQ032156
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 22:09:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JNM2ahG1ABS4L192+NMT+YV+CWUqiXZwpX5AXo7uFao=; b=aZ8Ww0UHeoHWKCza
	rfzcK/SdIaB+coyxqBItNSKHt+BIYXKsNsZEti4KW0wk6GHqUutX6KM6rFtkh/P3
	A8/esj3yZdnhvC6G+WdxVLZNbnElAlrISeCFTk52PthIpn2FUS23nfkUTDXyTmPx
	9VWN9sybVjEC+9njFMieO6OZS/DOTkgFfRei+VgML9TmzMg1T429Atay0Xcbf15H
	PrO+N9hl9dGIJn/kIDfdwQsGxqVT64soYMs9pdwrLgeixjOYp0qRvvAgpQzAt9wk
	UGC827IJkANRcLmTt25Ccpzc5uMLDqSbDgudHCXmf3xSNSfWPYA6I3Z+lht60vsi
	OyxT5A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhk04fs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 22:09:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b109affec8so60825421cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 15:09:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755295784; x=1755900584;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JNM2ahG1ABS4L192+NMT+YV+CWUqiXZwpX5AXo7uFao=;
        b=JZswDQnodAa+6cBqk6iBKin1HB/r9Gd2VUB4kZQa5m6/DTCDfex1nYZZQgFkKUEE9+
         9xcU6R+eamh+UDfmoaylGdty7ehUuR5NEuUhlseqb7keNsfdPiCA2SdjULw7cTzMBPq2
         tThFmeiy43pFRIrChE6KWCj+ddYHnnaforY4VvaQ4UxkOjEBRSr8OaxnMk81vSesOnr0
         Cwlm/tkenL/fViBtBsM7hPDBtJ6vxDzoTmTGc2chz1nGcuySrdmuILW3XxG6GTof5K5z
         xbV/9uDAEurvYF1C+8H3wYZxM3t58vmcGb+oZ83igNGV0BmQ/y3eBihnJHq2+impgq6i
         Y84Q==
X-Forwarded-Encrypted: i=1; AJvYcCVowQ+iddbR2HJYFytdASWzrjlbivIpwxIncr72jPixzL8DV19AcKjo4rFwodSIPADta3KGqMso8xKalLaZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxOHVLz7yXZ/rZ/LoKMBJHfLX+UaF76VCQR5b7GUPcKMUXC+y+K
	22dW2NGhj41a1o2J07galFQw+58bPbBn/oRjkJNl/jy54MEJd5sCDETz8PiJMM8PX2rmwWfT5EX
	gVdVuRMPWIjWzox16FJyMJ3zAWv3c5cbHrNSnk24DpGeHJSDMspgR+FMAsFe6mPRiKSuD
X-Gm-Gg: ASbGncuwYoBp9MGf80F4WGieovFWU2BPNXjRiCS/N89vX9koc1icjVVPZbJwtaawz2L
	gbuEn7k5rIWlNUZxUY47Eykmg/syjOpwSxnNKmTLfGH6uWqFy1qZ4QsRTSWi9MBl+bkyzUWrBc1
	5UCW5zKvrYsj1gLR0Fo4qWAsjTczgMbSYTZ7HNOdP3pLH9OvIF0mTqYsVUU4ApV9S4/FzhRa/Yc
	Gxuim7dQMnlalJLdqMRavleanFKIjCSyAY3makk6oyLUhcPNas6y9KkMggTbWxZU8hl2CalFi1S
	e9dLDGEzaN/L4833fNj60n8xUGBkWYrUATrrPNZH/DOcomRxyyRYzMmkan+gtGnwh+NtwMLdRaA
	IKOxSZis+jIi4KDyzRmiS4kvedU51PGmoI9fchYE+z1Y8xkXBlHQi
X-Received: by 2002:a05:6102:5114:b0:4e7:7146:a9e with SMTP id ada2fe7eead31-5126ab2ee2fmr1537411137.6.1755295403706;
        Fri, 15 Aug 2025 15:03:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPgdle96VSE3B52v51lbV5p87cOgzaz0zms6MwnH/nHTPEsUDfOL5fTX136xoJjksYefpN9g==
X-Received: by 2002:a05:6102:5114:b0:4e7:7146:a9e with SMTP id ada2fe7eead31-5126ab2ee2fmr1537378137.6.1755295403274;
        Fri, 15 Aug 2025 15:03:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef367728sm507900e87.56.2025.08.15.15.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 15:03:22 -0700 (PDT)
Date: Sat, 16 Aug 2025 01:03:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Eric =?utf-8?Q?Gon=C3=A7alves?= <ghatto404@gmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: add initial support for Samsung
 Galaxy S20 FE
Message-ID: <xmxo5uogkexiwq5zh2eza53pnl5jrqidd7an7bftjtq4wpaup5@mlekuufdbg5v>
References: <20250815151426.32023-1-ghatto404@gmail.com>
 <20250815151426.32023-3-ghatto404@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250815151426.32023-3-ghatto404@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfX/KO7MPKEmOSd
 yhsuc1qZlHL87tGCOjRPfsaqAMQR9rlZhHAJXfokFZ/MA7ORULNukDTLbMWiYuTpCAonwJZjncO
 ev52kryMUBlfmhbd2v3grJhIl4OGuqWF0YX1zCcBt9ARUzanDP7fljwc354IYFLjLd9sFr9i9IT
 TNmUfLocRK6/oI2Gdd8pURJtmgf3xED78JIfzMAMek16CzMz8GP0h4uNcNrq+5NX0DTzyvrNjGh
 kM4kFpjggSDxIGt/fA/6ugQN/1iHp4DPDl0rFpDDH6Ntn2ViBVQThfrywcL/YN0QgUKbcQGFAqx
 OD+EZQ1KtwuBPqaO2oEhgwJXx51ILTxhnCULs0lNFlnqiS/c2R0mZVvUhbmEc6fI264/bs2Gol+
 +8f8Soxl
X-Proofpoint-GUID: YuuIMdfHULhlRLfdLb9oBgDy6xftCdyb
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689fb029 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=pGLkceISAAAA:8 a=72Elj11P4sURrl_B_tIA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: YuuIMdfHULhlRLfdLb9oBgDy6xftCdyb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_08,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074

On Fri, Aug 15, 2025 at 03:14:26PM +0000, Eric Gonçalves wrote:
> Add new device support for the Samsung Galaxy S20 FE 4G/5G
>  (SM-G980/SM-G981B) phone
> 
> What works:
> - SimpleFB
> - Pstore/ramoops

While the patch is correct, are there any obstacles in enabling more
devices on the phone? I'd say, buttons, remoteprocs, PCI and USB
peripherals should be low hanging fruits. If you can read pmic_array
from debugfs/qcom_socinfo, then you should be able to identify PMICs and
add corresponding regulators too.

> Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |  1 +
>  .../boot/dts/qcom/sm8250-samsung-r8q.dts      | 47 +++++++++++++++++++
>  2 files changed, 48 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8250-samsung-r8q.dts

-- 
With best wishes
Dmitry

