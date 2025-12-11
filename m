Return-Path: <linux-arm-msm+bounces-85051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4C3CB6002
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 14:21:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48D49301FF73
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 13:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F842307AC2;
	Thu, 11 Dec 2025 13:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q8SidISC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jqZ/ZJN+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F062131065B
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 13:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765459251; cv=none; b=lemNa7L0rrCp1B1ODFxLvKjZJrR8YVP7PBJyvfeQnI+7SKH/l8FaysAHMUU+bfiTMH94oAmrPUbtzNV7lA2PZ34LwshLj6KPOvHnN3k01PO/Vzl2RyujyIhxndOlYc/1RP5jIkKmwZl6b89xrLXjG+AW89W1TtBTs/MCwhDyjM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765459251; c=relaxed/simple;
	bh=L9NyLNX6HCQh3bUeHuy2dTxPkj5iHqvZzQK0AnDPwJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GxJi8nAXFZKZNec1n/GMCrOoM7L54XMHWvOBZOPJa+KZaE5TjiAPRKFlseRZBK/U95HfZnrLOxnhDcajmXPFJHf7UtJEgoLV7KRmKZGqy1TlfzyBhyLzhK5dxkCiqLwhwteqD6VXp22AP/VTAqOudvL8mqIfTkOuNOTvt9XnBts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q8SidISC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jqZ/ZJN+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BBB4gt91956303
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 13:20:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WFHGtRHcsxo+9DnEaYfQmLZD
	11L+ZRrbP7/NZnMckUM=; b=Q8SidISCz+ttaqVtIcVgLTzayri7madVXAzGuzHu
	5BxvfkfIjEJP+wjLn9CPDuWuxOzAoEdLCAXCSGUtews5TCO9x3+QzYmg8wxPWomF
	xG/pv1pi9GZDjPUb6v9fuNljE2RT0+bIpzD48JOgJmWx3gHd4JiN/lEpVvXqEmw+
	+/NmD/gbu/RjyIRXeppJ2q4UU9Sid7H0Moj37yCUpwlujZB37hEkMZjZ9UhA6hhl
	jmwV2TYM+gVX9VzBtffV+G0Bk98c7oiRJ/e88SwdVuyUNR28WL41NcJbdn+xD4aw
	CkEKLXaeaZM473ntgvVt7VSILkrWxfTzPYSnyL+1CYYr/g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ayvrygcx5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 13:20:48 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7baaf371585so36081b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 05:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765459247; x=1766064047; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WFHGtRHcsxo+9DnEaYfQmLZD11L+ZRrbP7/NZnMckUM=;
        b=jqZ/ZJN+1TiTrtKZNUjusMwMxqDQ/53nnzYBbbsBF2rffgfxxHzJ60QCJXl3UZI01C
         Nz0DH+Uu1pYzLa4z7216L3vyidBgSpb3QFHwFDeIgJsl5NP9zTf37oRSxL0eN6dhppvB
         qg84jS7U9mm207Dgu37aKVqYd7OtxwXgZSMMAJlMpg5bwASZKXA4feemgYua0wcwAwSR
         RCQ24kLhf36BOA/FXx/rpbC8jgbPRbiM/4Rk2JX0vrjIlUpwuFAOoNLG453W5NUtKjsa
         LvAt4SWoynyGw/wuqpT3/eCxX8h54gautaVoHCAQL3b3EPeW6ZApGzW0LIMjMKCSnsAV
         0djQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765459247; x=1766064047;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WFHGtRHcsxo+9DnEaYfQmLZD11L+ZRrbP7/NZnMckUM=;
        b=BmVCyDplv3j96tHLVcr5rIHBnsqZiVNGUIg04s0wv7495w5QVZOg04Qp0vrTgmZrzO
         MUGIByZv1vjU6DBZ5LWFCdgkcqZhVxAruhsGA5pz9sW25UlOJDqgci6Qd8klE0uJhEIS
         cZI4rdHINlFJh3DTyCQdKmBbifY57tfcxBcPg/qP6SPMd6lxGB8RaneKbFPxSnfPg4dB
         +WvV7y1pUY3U9iFwV9UGFv23UcPYfSmxz61JzCOCgOamGcufu0yCVy7O9FlsVQZ/XLVe
         bxQW9GYhgjW8LvPMUCTQpadQCQYLpGTNB7iVJjlDWNKfWUaDK0tx0JhoTlQ4Of63XIF9
         HOuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOTzU0AD0iJT1MysLEM6VQR/BKL925pqN5C9jAmgKowQRkfxm2c3ZtPNtJ33Ue4xA8cGkwajuRLgk/PZ9h@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ+5VfFuhcZFTquxGN+LOKuEt7YAs4LH/d3zEnvwDmMCQmGZa4
	ijwfHunJdMURPl5gAooJ6BzAY8s/YfDJqHbiWBt9cLYR6z/RaJq4AyY8TqPvwt6oiws7Cddfw08
	OFzvZ888q66tdolVX1SDKYizIfeaMEnjF3n2ACMi7H9xtC+nw/CO5WqasRS0Hg+6/kxmf
X-Gm-Gg: AY/fxX4hSSIBM3NdVkRxpZjq8SnWjBqgrRmOsQWsZtq9NqkkiocTeI6xyOITkZ6LklX
	opScUsvBCAmN6aMoblyGfZCwRQUHHV16iO/UuZr5sVnIIQ1Je43gkW3TN2UT8I6W1v+5Y5lWbS6
	eisOU5RTO7tmPualXHjVux/e9YMWK+hTA8DAE4/d48NJt8Alsg5Rkn1AnC6JXQkg0WmMt/TsBWw
	2eeDljB++SGNNV+/TjAG8hNC5wmfnqERttsZHZjV17Wm3aq6PBSC9sLK0y8Q4z7T+IstnltDOTi
	trlFg5NG1IyKrwnl4HNc0gW81UUxGo0wb5uma16XeoUSAroVIw75LRfNnxuZsFiV8X4VwWunpfs
	wsHBUgfmxbbFOI2myFMOxmuS/6Oglkx1K+gTt
X-Received: by 2002:aa7:8046:0:b0:7e8:3fcb:9b06 with SMTP id d2e1a72fcca58-7f51e4e6d5fmr1528993b3a.28.1765459247114;
        Thu, 11 Dec 2025 05:20:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEOZoQc1WUL/5CEOgh1wQLQsKylFgKN8ddbcRuqLTP7TFn3yJ7Np94ixWpC5SYaIXEOJj24Cg==
X-Received: by 2002:aa7:8046:0:b0:7e8:3fcb:9b06 with SMTP id d2e1a72fcca58-7f51e4e6d5fmr1528958b3a.28.1765459246475;
        Thu, 11 Dec 2025 05:20:46 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c54812c5sm2576514b3a.59.2025.12.11.05.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 05:20:46 -0800 (PST)
Date: Thu, 11 Dec 2025 18:50:38 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Subject: Re: [PATCH v8 2/2] watchdog: Add driver for Gunyah Watchdog
Message-ID: <20251211132038.mt3tuqw535vdo3rh@hu-mojha-hyd.qualcomm.com>
References: <20251118-gunyah_watchdog-v8-0-e5de12e2eef5@oss.qualcomm.com>
 <20251118-gunyah_watchdog-v8-2-e5de12e2eef5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118-gunyah_watchdog-v8-2-e5de12e2eef5@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=P9g3RyAu c=1 sm=1 tr=0 ts=693ac530 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=qi9a3yEbpvmg9l7mAUAA:9 a=CjuIK1q_8ugA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: u-LHD-HFt55ocFRQaSfPXG4-2SV9VlyY
X-Proofpoint-ORIG-GUID: u-LHD-HFt55ocFRQaSfPXG4-2SV9VlyY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDEwNSBTYWx0ZWRfX0UEa6OQ2rilE
 CZK7Bp5p+w5gz3jR4yRmxTED8/A+ukRRk/JP40OnhYkbCpF1y3FKYa+Gbmi4GvSh/PbAhROycF2
 YVb6ZVaEeRTCyogp8TW/X6F6QnSTwAiBJuXoZUlE82dYvg7ed1zN0C6wyjrauhpp2KWEP/shVw3
 nbiTOF0sWYzHWipeWt+COgPwgZofRxteodrp9o/WcAazScKxgMd8agj0r9LdzX33MnIwECQEmKk
 KTjdlbIXrqEH86AHy9x4VCeQjJQZgppBectfIixDjFKL2feKTbGl4RX/Yl0+1dLxJPomQwY3UsV
 0t+4YYANBRqniBfGuEOhI0uEPFM6hLn41BfXM1NyZM9rxAR0e3h96KY3kNlxw5Wfxw6MJh60joH
 fCwkTb/ln8f19g0nflQ2KepMSZO9dw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-11_01,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 suspectscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110105

On Tue, Nov 18, 2025 at 10:40:57AM +0000, Hrishabh Rajput wrote:
> On Qualcomm SoCs running under the Gunyah hypervisor, access to watchdog
> through MMIO is not available on all platforms. Depending on the
> hypervisor configuration, the watchdog is either fully emulated or
> exposed via ARM's SMC Calling Conventions (SMCCC) through the Vendor
> Specific Hypervisor Service Calls space.
> 
> Add driver to support the SMC-based watchdog provided by the Gunyah
> Hypervisor. Device registration is done in the QCOM SCM driver after
> checks to restrict the watchdog initialization to Qualcomm devices
> running under Gunyah.
> 
> Gunyah watchdog is not a hardware but an SMC-based vendor-specific
> hypervisor interface provided by the Gunyah hypervisor. The design
> involving QCOM SCM driver for registering the platform device has been
> devised to avoid adding non-hardware nodes to devicetree.
> 
> Tested-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>

I wanted to test the latest mem-inspect (Minidump) patches, but due to a
firmware bug, my last log after crash messages were not being captured. This
forced me to get another device. I had an SM8750, but it does not
support dump collection because of the missing Gunyah watchdog support
in the upstream. Luckily, this series came to the rescue, and now I am
able to capture the last crash messages.

Feel free to add

Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

to the series.

-- 
-Mukesh Ojha

