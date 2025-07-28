Return-Path: <linux-arm-msm+bounces-66826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 61815B13826
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 11:50:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91D17189D879
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 09:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24DB3269806;
	Mon, 28 Jul 2025 09:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DVDp0PqB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7887222173F
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 09:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753695867; cv=none; b=bHVg66qDYPdmwq+enQMKzgfO5RZ/L2hO49uDVKfkOUi37dnZmDMFMG3Gz/BtI9tqO5bfS13q/QrIibjVGSB3DwrvrZk+Jz0vFF0O/CxN2Oo4ll9BZwWac00d3Q6iZpMRhcf1oZPsjkzEC+IhiXSLjUEueRRgSFmxNA8iOME2y4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753695867; c=relaxed/simple;
	bh=x7T+LcXKIjMmy7Hhqz7r27F76rxlsf9DlWoE8pE2OAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YtvlyuWIT0iS0OItob3kBl/gCVVhiBrQi055Ukehk3pcWH5EtsPnhbfMrIZKkmEvGRz7NJZYTmV4u3h5y9wAs6xC4p9uuRL0BAD7fYppfkGvy6URjGSId+mni/j0sowrZjv8snoZmPw1BApktR3QPKfBWEWpHJJgi8otWqP94YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DVDp0PqB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56S4rwEg020683
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 09:44:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UOxjWi9b8eIAm2p2pRQ1nK3w
	CINCr+bSXTxNl04Iwns=; b=DVDp0PqBgLD+NF8qmIq9Qt29gBEp5VDIQCAjQkSf
	3npSFDhlHpICA5usCGoY5cfH9tM6JZAJKFp5NIZ+SX40YcKCBJx+RKv/7s0WBHQO
	2wm4egiX4/zdb3BsGuONb9o+82nOU4Y4lu3KDXkUuGRVZpxaNn9Gje7BPIfahr1j
	RS3K7QyhnL7MGGnWSPZs2zKd/XsyQ/lx8JBDYj88GUgwDlDH7wojIPM0aOR6Mgou
	O/LEu0laj17/H+dRJf59W+061sSkUd63Xwicjokp0PDYJ2R0w3V9TUhL73UpjJsD
	ox8/4YeovcrXExrxvfE2fS5nBkhQOwTDcnA3SLM/o4UlOQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484r6qkyye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 09:44:24 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70743a15d33so19465016d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 02:44:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695863; x=1754300663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UOxjWi9b8eIAm2p2pRQ1nK3wCINCr+bSXTxNl04Iwns=;
        b=iajM61rVpRHMxojo82azc+XOKOTny5Q2xVPhQP8Nt8P9cemeTX0bwZX0a3LUI2U8rZ
         wXJQ8Owd4ncPZEdKoHzFBUKpJ2+9XIgTL5FiydrU4tma6pofA4TAeddwrCVyBFYmQk4g
         0t7RoNwUzQqvH2FsfsUbrJoXnv9W1K7EdQfB+7LpGbBc9XnQzk/OoKcAHscuFKOsH/rH
         e0szz8F3NyuE5Ox7j9EHc+5yWxYoi6YrQVFclstLgdg4yJ07jNleIoufSFl35q/cOYzO
         gRfeeseV0IcNR1sU5hqYF0KCxYB/wwyOsePy3sc4DK/D/yg2RLk7NQCGcjmLVj1D5JBt
         0OTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWK6cQPlcmZGyK7688HwGKgXCbdLqPX5JYkAA6ugsfVMLY2ZdRVYD11+LtOPv0txJFGH5aZYL+HbVly1M6@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjr8XxFlGZkAafIlG8LXvT1hhXDuEXtURDik4xSweNbktDPBni
	6iC9C9eilNTsWwgWXHEGvb9tUCgmFzG2+n8kco4lwevgMnrh8VOiMuvubj010XgQhRBsRoVyF8K
	a+sDjVGAwgTWRQo7uoz6GdkoyAPKrREdsL6DcG03vMfAa2kzUrUmQDmgLD7UGiW4bYk2X
X-Gm-Gg: ASbGncs5pKE5CyeNPB78gjnYD78Cr7zWrTjrLFSPOEBLXYZoKxgUJOw1avZc7Bjpxi/
	xWFiGdkheISPPpo7Q0ZQDD8kHMVrjegiVIttI/NsWLeQ/whEsgHTx3VjQDO1T/Y9WgOUB4QUruE
	/ZNUl2lXc5LvWSYPzugBxvQVSPZvSCsp/Z+4RzueexA72BRayNnT+sixWeBFSKi1Ii2IJ7N6Pme
	yUGr5OUCeDfk/7mDSt5cgRSC7ytJ6/8Ri3bhNqCIjHthrHa9jTcI85XwmQdjQWPgoCyc8wwRTb6
	lBWEd4hy6I4gqcp7HIue2gAL/BW5ZKB2kJoHKMVTbzXT64RRS9T9YC51I3v74qW0g0a55PKkpH9
	uoeY0kcJeTPHxaUJbIltIFJCT8o/jYQqh5bTgqBp6sY0oIAMNG1aF
X-Received: by 2002:a05:6214:401:b0:707:419d:2e28 with SMTP id 6a1803df08f44-707419d33aamr57187556d6.41.1753695863266;
        Mon, 28 Jul 2025 02:44:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSFwEBe/2mm24nadIjbBi00JjeMT/2cBqpF+9f5PXZDrO8IXpWYX2OiIxMU2L7zeyH96PryQ==
X-Received: by 2002:a05:6214:401:b0:707:419d:2e28 with SMTP id 6a1803df08f44-707419d33aamr57187146d6.41.1753695862738;
        Mon, 28 Jul 2025 02:44:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b63394014sm1183804e87.180.2025.07.28.02.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 02:44:21 -0700 (PDT)
Date: Mon, 28 Jul 2025 12:44:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v13 07/10] firmware: psci: Implement vendor-specific
 resets as reboot-mode
Message-ID: <3gtlf5txxtioa5bvo6o467jupyoam4hjhm2mdiw5izv5vbl3tz@drndgp3tcrgo>
References: <20250727-arm-psci-system_reset2-vendor-reboots-v13-0-6b8d23315898@oss.qualcomm.com>
 <20250727-arm-psci-system_reset2-vendor-reboots-v13-7-6b8d23315898@oss.qualcomm.com>
 <b81aa592-a66b-457b-9f42-df4505b28508@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b81aa592-a66b-457b-9f42-df4505b28508@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDA3MSBTYWx0ZWRfX/5PtNFytC3Z7
 y4WtU/jM1PQllrYcCUQXKD1arxfBn980Pur1YruF7DnrSFAccOMwinLeNUXdRr8c4zFPU1VBGdI
 4p9k6KGHL5/n4C1Re2VOPj8d9oEpigTZKK9Uy8mzrOwGRjnJetDzm/hYxY1jGly+uWBJGBC0Yhq
 NRfpRsQkYskKrDZqoazLFyJCZh46sTnPk/2LtK66gfYAjSvBX7CH57B7ccziWgQdrQJ69beWF1f
 g9K5kuJv2FOXbQnJIa1bIIGGkVz2OEeZyhoxWp3dHXnGdMkyxpqVC+i0TWVC/crgtQwA2fQEwNe
 7rEBxstLJswk6hk0xn8ybph5F3CEGh8SAWiAHpQTpWpmQoYxQqb/V4/bcAbVpJHi5sPq8yKMPgu
 GVzbmdaAwrAUaQstugQ6UrO83VpIGFuSbNKn0Zn9CQ69rsM2szxxRf081ux02lhoYAlqS2BE
X-Proofpoint-ORIG-GUID: cwOhBU-EPwDRPo5OGGoY0KMzenxFSGan
X-Authority-Analysis: v=2.4 cv=ea89f6EH c=1 sm=1 tr=0 ts=68874678 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=fdSrWZEoeHojn4nDOlUA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: cwOhBU-EPwDRPo5OGGoY0KMzenxFSGan
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280071

On Mon, Jul 28, 2025 at 06:53:14AM +0200, Krzysztof Kozlowski wrote:
> On 27/07/2025 18:24, Shivendra Pratap wrote:
> > +
> > +static int __init psci_init_vendor_reset(void)
> > +{
> > +	struct reboot_mode_driver *reboot;
> > +	struct device_node *np;
> > +	int ret;
> > +
> > +	np = of_find_node_by_path("/psci/reboot-mode");
> 
> 
> Why are you looking by full path, not by compatible? Is the ABI - above
> path - expressed anywhere?

PSCI node is required to have a node name of psci, it doesn't have MMIO,
so it resides in the root node and the reboot-mode is defined in the
previous patch. So, I'd assume, the path is defined.

However the question might be slightly different: why do we need a
separate initcall for reboot handling? The reasons for that need to be
documented in the commit message.

-- 
With best wishes
Dmitry

