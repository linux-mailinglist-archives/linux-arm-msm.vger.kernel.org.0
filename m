Return-Path: <linux-arm-msm+bounces-87556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B53CF5ACF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 22:32:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD9EF307515B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 21:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97ED9284665;
	Mon,  5 Jan 2026 21:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lFUJ1iqt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gm2eIds6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6B81C695
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 21:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767648691; cv=none; b=F+wMQAj//FsewJ18RkEyDNX+MZqKLh6SzYtM7wcjSQMnan/0rd71uhOYXq2XWk6LzSuKY1nE3Jk21SLwFXwFbH4XXtm1fgop1STpXSPmheFf7TEqzhWFqDNtkVUCL7ma+DLUV5lrfECc8Rwvnl4zlE9G1AsgGdJGmY/sQmH9WGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767648691; c=relaxed/simple;
	bh=utkjV6+Kk2zjUaBHcQnXOzor5MiIt6uMzcWnSOF2MDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aEZ1WLSTSMjZMdCW/ERCkFkNZJ86ciHATAXaMo59TUFWXgVyNN5cXxUUkh8WeJl0xfrQIpTlRAHm1JKeOxzmugxjpPSbIf7F7a48Ql0gi8EERORsFbtWajEic7skmc+Tiit4sz6mrVce+4cEdlMpKJv0G1vJ/bEtsPSm0Erw+zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lFUJ1iqt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gm2eIds6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605FKf8Q1751808
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 21:31:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4zu5KsSSAYr8IXy49RPMoofLX2Z45PWdd94vhBIDqqE=; b=lFUJ1iqt2RX7MJd9
	d/lofAm3V64RkHAtaYCanL5/o5QFTL5LQfLkcDzgDFaIQ+VS1q1PeQ9eoxYwV9/i
	dt926QH7MxKqiz6IQL2yDVa5OqvgaSHhN8HpiJQNw2OEAxMX4jXBOeYXvqKENBSj
	RfbrJW8bZPNGVrUzpaxFKZ5XSGxykDtw5tQBbeOq/jCxwZqRJ96MZwJsqguHw6Er
	Y6nR6nEThARXFInszk08xj2RsXAY1B+TtzxoGeXdJZUAe2ggBq13paSpVQOSFbql
	ET1gnVfGF/nY8cXCxUWdgfRdTKD8ZbN5NN5PuxJpSIyjD4U8c2nhU0ovkHRxLQbZ
	pXmM8A==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgfv011pt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 21:31:29 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-93f5e6c2110so410131241.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 13:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767648688; x=1768253488; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4zu5KsSSAYr8IXy49RPMoofLX2Z45PWdd94vhBIDqqE=;
        b=Gm2eIds6ldMZ7YTUQmX1/536yRRLw3vD6QnPC0+hDv1JwngNZDjtkJ2vc04lIit2CM
         ZlOWgtrOGmPGEHDIMrs4DT4IGwhAwc76o1yW5l4Cz35V62hEbM9dpyu/d8EZHRo5jPjk
         T0vm9ZbZsCq3GPbvNKPOOqR6XbUsDkH9vISQwlFX1wGg5o0YMoZX6Ue+DKyA/eGHPNE7
         hyKT7pyjhazBc8jRSo8NOEo5koknZScw/7AVd3tcmhiDNy9MJYF61lA1wXz8mN3ZAMgS
         YO4bR2S0L5vF0gC6Uhsa0Swtz/S2MZGNZ/iU8gDzbM39L8ZMFyqmReS6rGc/QPlZgurs
         DfYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767648688; x=1768253488;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4zu5KsSSAYr8IXy49RPMoofLX2Z45PWdd94vhBIDqqE=;
        b=pymGQnSd04gfwunSmjE73CDiZWs2IL9BuWiX+ljPxroCW8GK+F8kAKYUVpujYjpqh/
         h+wZcPfegWIseXZkf2JEG0gTPFzHsJt2NsdSY/HZnmt5MGfejyag5nuRRhLqkU8KVDfe
         RWl7xNQEd/6EFJ+8++ukFQqCOVq86WjRyyv2bH14+tFMYZkzrWeKPV4HRrdXGvbeAHNN
         wPDEeL+H/HgjMQMu0heEwq/BJgY90MwgVT01RMC1LTsiu6tOVWIGSN6T26VZYSvlc355
         NuyIyH3claULyM+c1ytbQ413HvhPqnLMKTK6tvCqf1TaeVTQAnGnJQw51guzbD+xpqYX
         NEcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWS4dLTYjK7T7c/lvq0+Ve2YtffjuTnyK3xuJ2fFAN85YmL1HOME4J32c8+lJHQRdT6EloDaZu+cOeuk1E@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2S4kebLVy3GlV35wrffeUebWYbb6WlEtcvvMmNP+Loy5eB+wB
	B0/xGMvktXVXZwjVoXB0KwDfmU/WXR8hG1iCtJ+aceQyVPqUKt4v7hyhHsqvP6keCrQTN8Ut3ZG
	5HKjtaiNky+X+sW0XmZDhdp176DAQai7ibdYEVeCWvAvZXWJv5/2x9HMxipXgCi3y47f4
X-Gm-Gg: AY/fxX5P2cYAF5ms2OaXzgYwv3duOJQ0HkbUyzO093vI4CJPLjqDk8fy0hbN4SeqSZT
	enJzau60Nj0cYj2SdClVRUVeGXOPwPsxQWqkRmrab/sJ6fMbWwJhcgB3xwJyGngMEDn8FrTXz+I
	mPBT6Cs+HdjysAI4MJqZDrQ42+EuCs7NCycCsGZyt9WR2CaiaffsC9KWEDqSo9B1FmifFHhIf6T
	CQM7S2gqaCYI6avqO3BzxF14lcCRGRL9oS3r/0VL+Vut77zB1ns5oa8CIvpzIYwdhsnFtgDENwu
	Bv72+4DWPyXtsnVZR1OYxRll7ZSlhRYHe/KM754I+/k7g37l6ybHFevSMAAonhq+ng/eRxHWKHc
	kSGFIrYy4hhZraIpW5UUIwHsnm1Ihw3u/CkPZTAjM0ELWs7Hq3nt0feAceEaSGacVSBuM2Xpd4j
	GgRCIQzRwNqO4oE4cIljyTh3E=
X-Received: by 2002:a05:6102:2912:b0:5db:e851:938e with SMTP id ada2fe7eead31-5ec74318ab0mr280756137.10.1767648688146;
        Mon, 05 Jan 2026 13:31:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHN6D3L01UfV6GWimrbBRPwGxz03pI11NWXb7fzsx236R9fU8MdRrZ4c01w5FGgeM95dAMb7w==
X-Received: by 2002:a05:6102:2912:b0:5db:e851:938e with SMTP id ada2fe7eead31-5ec74318ab0mr280739137.10.1767648687644;
        Mon, 05 Jan 2026 13:31:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb8ad6besm652641fa.27.2026.01.05.13.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 13:31:26 -0800 (PST)
Date: Mon, 5 Jan 2026 23:31:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v19 01/10] power: reset: reboot-mode: Remove devres based
 allocations
Message-ID: <cvmtn335gwnl6rvmlm4vgyablsj735rknga4ffv53gpk4k7d6g@tt7ebuyusocu>
References: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
 <20251228-arm-psci-system_reset2-vendor-reboots-v19-1-ebb956053098@oss.qualcomm.com>
 <CAMRc=McEB+yVYxropzsqLExZCU5Pd_iy_=5N3pTxu28-ZX=7_w@mail.gmail.com>
 <acbb37a1-3189-4d4e-5c05-55b13cd40a7f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acbb37a1-3189-4d4e-5c05-55b13cd40a7f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=e9YLiKp/ c=1 sm=1 tr=0 ts=695c2db1 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=gjb6EQGLQTTv68HWFF4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: bOUS27GoVfK2QDTvr5tCe-vyVS_vx9MI
X-Proofpoint-ORIG-GUID: bOUS27GoVfK2QDTvr5tCe-vyVS_vx9MI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDE4NyBTYWx0ZWRfXw0SzsiBz/ghr
 XEW/8HvIwGS4LhMI39PDkkpq+wXkrSsciHn/BNaSay6d9sozsGQNtpyAumr53emanyoja40K48e
 lvz8knkngRFEn7H9Hs2TTWAnc9lXUDQMTuJUQgbmJPN5X+vT921bGiGrsZtnzhLKZPAFdjyigzr
 /kcTdu6FT6jd2mpb9VVHVSoO3fpEItnT69YF5Lqe0QLR1RmzDAtNrYu0JpNHsQZcE4G4PS43I4u
 NijuwHPRWXHIAF3xDjoMr0bn+HmdnlEVXDDa7iT1KhEemFN3mkZ1VEVlaxoc67Hq4luT3WCDGct
 7DFnnwFiO+DM107S26AnsyKfpZ2GCux1ZBC/H2PW96GPeqTdbHl7+nPcMlveVXoUF8ZAXHzlM3A
 y2jJIuL64sb3BS+0wjEFvGHOTO8fAODIADsIF/6xQ3yXf87Yj0YotDLpdmt70Cc94Upwt4KHMu8
 XyhMNhpCDouVRAv6qzg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050187

On Mon, Jan 05, 2026 at 11:46:40PM +0530, Shivendra Pratap wrote:
> 
> 
> On 1/2/2026 3:35 PM, Bartosz Golaszewski wrote:
> > On Sun, Dec 28, 2025 at 6:20 PM Shivendra Pratap
> > <shivendra.pratap@oss.qualcomm.com> wrote:
> 
> [snip]
> 
> > 
> >> +                       pr_err("reboot mode %s without magic number\n", prop->name);
> > 
> > If this is an error, shouldn't we bail out?
> > 
> >> +                       continue;
> 
> This is not an error as per original design of reboot-mode framework.
> The code as of now says, if the reboot-mode node has an entry without
> proper magic value, ignore it, and, process the next.

Then why are you using error level for the message printout?

-- 
With best wishes
Dmitry

