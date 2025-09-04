Return-Path: <linux-arm-msm+bounces-72009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CECD0B436D6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 11:18:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF9CE1C24B71
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 09:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C0CB2EE619;
	Thu,  4 Sep 2025 09:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IwYl+urh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E672EE286
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 09:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756977494; cv=none; b=TvEtKgvl7eFEfAvnMf3XMsCZ1kikESn779nALTyO4jfGvzacAAlakHviIFunBaVzdSB1rs0fgVvfzONex13VQhm44qcnuPo7aaKt9r/OxkQIZh/H9d0F+Rff2F/AZFUv+Cruaz5YCpWPNk9WvOKvQNQY2/n2dPdwJGa4X5YxA3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756977494; c=relaxed/simple;
	bh=okyI9VENEpsFeL+2iWfOIXetanLtRHN5I9oZ9851xAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sZe+nQ+qXoNsn4GdVR2rCyx/sHJCuQ8x9jB689Jp/JoTtY8tsEbIUvGxhtpaYCe0S7kpyxVdBSSS0Dvon9I3vaR+MZ7vQS1zaj606tn8y3RgtYOuZl/ahz7qRMte0LmGaV+b6sbD6b3R0/uSN790aGadz/d5VI3h5Bm4OeUggfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IwYl+urh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58414EZL005269
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 09:18:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qmq9wf97WQ04RGKWFb6wkMRy
	x7DWCe5tA3lTLApTcbI=; b=IwYl+urhBylpm0TjNvP5v4UPRxAb7tjWGHc2T/hH
	H24q5AaNp9gCrWh5uktCFyDs6sR+xxPMoNw5dKfzdVuRwyKkpYxaxJldIbJ0gfod
	PZu2vKPAWYJ9lRhHFGYJl1fmnAAsv5p4O90t+/U5qMGfyOmE9SmLs59EYrl+LZ51
	BKTHIYSHTSRcWXCFzry4EfbK5FWmebldbhXwB7qcGeQ/p9dGJw3avYSzxaA6aHCW
	FhbYZ/oVnta+j5jPOG4LhaoXo6V9kKtwRO8Wscv0UYHcBMHgozrQtvBkDhs0Augf
	qXTfak72aahvzG1/06p11o9lXmyGIY+7vUmA9c6csBhPYg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjpw30-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 09:18:10 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-244581ce13aso18451635ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 02:18:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756977489; x=1757582289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qmq9wf97WQ04RGKWFb6wkMRyx7DWCe5tA3lTLApTcbI=;
        b=lsYOTrAgL/n0mfuu8gxUnF0bfEskZFC/uGmnVe07AI7zEs5qOR72hw4T7cou3wwrp3
         kYDspfIrsl73dFGAywul+VrsArjCxFZ+NeOcUOu7m4oY4YrKvJTZinVhaNx2pSxKt03C
         5JfwhDxi4Mb8lCW3yAyJETIO5HsHmkVrmuoNanhY1qKzcjljOP2kqFOg8xwK5qw062Le
         MwlB/BRk7KTdo7azmdqfbKm+kDE8xCfFSBEupxB306dgMT59CU5Yy3BHFtzIFF/Aiq1y
         qlD8aS4k8+1M0tY8jCQngxA5KW28fWDXvs5cPUegBp+uSIvzSshAGaO4ZV2igGBwVlf0
         LNJw==
X-Forwarded-Encrypted: i=1; AJvYcCXlfc3Q/gOAgttHLdkO/iSl4fuuqcRqWJ/xY3x30n9b+WJZJM7oaCvgbD8QAPrc2rKKB/d6KUYpZuUhYotA@vger.kernel.org
X-Gm-Message-State: AOJu0YykCfMFMRzcLZXydn8g2vf6CfWLysT8DjVtP/TdGdChln717wZ9
	Gjb+AcKEBLtwBe7wf9JbvhzS2tBHRv2M+1M9U/LsCwW+H7R7U5qJxHULuIgyuLwmxugbcEA45lT
	6MLUWO6HTIBgQqU5lYFjizsII6+H/iUd6e0EuqhtWympjLjfTz5ysueCQXo+ZvDwWxmVK
X-Gm-Gg: ASbGncvWFbjUups4Cog4t/UqVjXlXWkqzNZ4oD8fvc1OvMnGglL1OgDBekxn/wNnBRU
	C9gKCCzel4rW9utRO/7oHj5912RFtnWR8KMHAOrgcph1GrsvLEv9B2DcVIp05NGpKTpxGfVHxRM
	hpXZuu2wGGKvQHSmmocspQ+VksZuxfjuyj96jr3cWDBuJmSdTzR9laNLbgYkJLpKGorlhO6CI+w
	s+Dlt8eKCJ4GzcSsrz87Cud/CooWpQ7+cGvlT9TKsvEWosfnSx1Ar4Jbulltr3r1e9S0YSkqUXJ
	+HbeGxVwn4SH6H+Qrv93XCwVHAutw+K7Ltp6f5NWzU64BLhWtOiwqKmIOhn0gYMdxIYnJA6IOg=
	=
X-Received: by 2002:a17:903:2f0d:b0:249:f16:f080 with SMTP id d9443c01a7336-24944afb3ccmr234248815ad.52.1756977489609;
        Thu, 04 Sep 2025 02:18:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1YA8b/X0kiXwOjhDTMCW5oJYVAsU0R0JJ1m0N74tbsJnxiIQuGYYqpZFLwCSpwS0SH0XTgA==
X-Received: by 2002:a17:903:2f0d:b0:249:f16:f080 with SMTP id d9443c01a7336-24944afb3ccmr234248365ad.52.1756977489073;
        Thu, 04 Sep 2025 02:18:09 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b11448a5asm74820385ad.54.2025.09.04.02.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 02:18:08 -0700 (PDT)
Date: Thu, 4 Sep 2025 14:48:03 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: hrishabh.rajput@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add support for Gunyah Watchdog
Message-ID: <ec0dc13a-30f7-44a0-9a4a-5f44eccd3933@quicinc.com>
References: <20250903-gunyah_watchdog-v1-0-3ae690530e4b@oss.qualcomm.com>
 <a3af076b-ca0b-4d5e-8294-2bf5a9814959@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3af076b-ca0b-4d5e-8294-2bf5a9814959@linaro.org>
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b95952 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=bjUImR_lD7Cc3jxH_h0A:9
 a=CjuIK1q_8ugA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 5-L8G3Sx5onSs4PPiI0G0WS4zcpiQqL0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX8IZm4+S+9P1N
 uEv6066sPWaLrhazHUb7RI4cXGPmwuiXSBFJwyc8xhOTRy1Zl4rWSvVy0Eb6WTedEGP2LDhSr7J
 L8qsXMZVPgCfLayPlunXN7mOjoZ54pJ14hN3wjC0oNEtEByEDK778NoDIMSnHBzvix2nnOTu0eb
 MUWh9QjdOiniAtgH+T74tVhnEU/dpvX+wol0Yl3yPC9Yq9/enToS45KCUZKLCbGLzXbkG2JKRKr
 QztKZzdOW6RLGBTk6aVAh0ubLhepBi7YtLAjMO1oen46iarLc67Bde1U/MB/ff7kRhkTaIdSzXO
 XjSSTerUKy5WTpXn3YI/CoV9DGCWx3T++5QHD1NO9jsV3qHc6ZHqPHRx5JpZQZm3CyD0NBoqeLw
 uYePhcZZ
X-Proofpoint-ORIG-GUID: 5-L8G3Sx5onSs4PPiI0G0WS4zcpiQqL0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

On Thu, Sep 04, 2025 at 09:13:23AM +0200, Neil Armstrong wrote:
> On 03/09/2025 21:33, Hrishabh Rajput via B4 Relay wrote:
> > Gunyah is a Type-I hypervisor which was introduced in the patch series
> > [1]. It is an open source hypervisor. The source repo is available at
> > [2].
> > 
> > The Gunyah Hypervisor doesn't allow its Virtual Machines to directly
> > access the MMIO watchdog. It either provides the fully emulated MMIO
> > based watchdog interface or the SMC-based watchdog interface depending
> > on the hypervisor configuration.
> > The SMC-based watchdog follows ARM's SMC Calling Convention (SMCCC)
> > version 1.1 and uses Vendor Specific Hypervisor Service Calls space.
> > 
> > This patch series adds support for the SMC-based watchdog interface
> > provided by the Gunyah Hypervisor. The driver supports start/stop
> > operations, timeout and pretimeout configuration, pretimeout interrupt
> > handling and system restart via watchdog.
> > 
> > This series is tested on SM8750 platform.
> 
> Would this driver work on older platforms like SM8550 & SM8650 ?
> 

This driver should work on 8550 and 8650 too as long as the hypervisor
overlay is applied to the device tree which happens in the bootloader.

I remember porting some hypercalls to 8550 upstream kernel to induce the
watchdog bite in panic to collect the dumps. one of the biggest benefit
w/ this driver is that we can collect dumps upon kernel panic. since we
won't be able to pet the watchdog upon panic, the bite would eventually
happens and device enters dump collection mode.

Thanks,
Pavan

