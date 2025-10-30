Return-Path: <linux-arm-msm+bounces-79580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBE7C1EB19
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 08:09:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5631188AB3F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 07:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6954A3358D7;
	Thu, 30 Oct 2025 07:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k+v7FLmK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UV1QKUct"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E59A3358A3
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 07:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761808096; cv=none; b=oHhHagnM+AcbEFmm14R+85aanaJq/EbJLxzCzXgM5Jkg2/PCMWBiWGhMAJTBGdznH7c2+cO3VBOfXiBx/nhCEan4uULAkVmsJWs90GM76Fl+A3isiwzPxQwKwifL1QKuBmqJ5qzaFjte+tlXzgX/Q0WEb3eAWLuoJVbypyGlJO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761808096; c=relaxed/simple;
	bh=QOT8AywopCumtDIgwTaQwMqJZk8XCSFzIgduBpEutpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tZPkHMrgWFNnBOApx3snMnnlIRP8RY5cmrrTtPgaOzJHckmSr4KbCRAwGG17faXYQU7hhadBNNYgnGUjHsGIO7XuVMIisqdRTD9UUHnLpmLoZlHC89eCTg03hfmz5SbbzO9K6PVruBOSfX88WT0kPKPEfaZBzc6vC78W8yHNzCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k+v7FLmK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UV1QKUct; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TLs06u568009
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 07:08:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IYBMombL8T1bltomZZaQTOz9
	2EhYNFQ6v2Qs6UxOLuI=; b=k+v7FLmKgRWh6+sAFlXrqWjVGaylcQDC/8Z1iokE
	d5w9DhvSHUU9nEqRrXe5dGBfvVQr8l4nqbqPEG3GFgcsIPXVrMYCOYV7PNqegvbk
	mUETGV2cfEkyIFoCErKTb6qC6ObQ1BHtZVyFVePGdSBQGWPspJM4putckJBamGB6
	b0IWbroqpWj8nZG6DjVQklpKqVTyoQ6FJlFJ63VqfLsuVMwCpOyxyEWqSK2UTBZq
	esEiR1dX2HF+tdzOXI+CxdnxnlhmxeMIdGURByXxIDQVZpQXg8YFnyV3CIlMM+lO
	uGEoaBUN4GnSKC5M31ok+MFOQ+cro30GTZ8kR+54vmG1ng==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3m0bju6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 07:08:13 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88022ad6ea3so4184956d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 00:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761808093; x=1762412893; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IYBMombL8T1bltomZZaQTOz92EhYNFQ6v2Qs6UxOLuI=;
        b=UV1QKUctbwNQ8UEJBplAumvVv6EGafVhedfOxm1vnhjEia5Pt36B+GXU+kTh0QPXOm
         J93xvMt0QsIvF7BNNqY795zehlA/FuIGOUUipGzEWVvULRswIVBw99SurXiPTf47Ugbi
         5wGjjErz/gk7Zy4QILY+GpnbCB7bHKkIwyUyzGpAWTQVQaPIUKvmSRNPut+D2MOXL7Fo
         L96iQcl7vvDxWsXmFyEOdx2E7L8n1D53w/G+afM5X9cwAEUx9DmK6CI4cg+Xju/X6BG6
         ntU9mzyTA75y/Yh91dgUMah6CDsYkj7wfBM6ELCizZIDijEE8XkLEWUfYe0IPgGhPBi2
         7vKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761808093; x=1762412893;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IYBMombL8T1bltomZZaQTOz92EhYNFQ6v2Qs6UxOLuI=;
        b=u9fHDiPywWRjnTfIDVjEv/xBlQj5pjLEAjMbe9eMneytXMdnLDTRAhH7zLNm23qsNu
         483KdMBZuykHYIbKuwO2+8JmvzXH9ANfnBHsu+zA9hZ2bCpw24oliobCMuVWbvmNBdQR
         mAEMXNFY6KSfg19u9rH9Rvk/HKPOqDh8eOiZNmOYw2ys1rjekOZtcLibEdZyRIiOaF5f
         YXxdkH/5sTnXh8sgbPireXk36G8CNYdrwaXZUX7wMg4yTaZ6bDL4Bv+7EACDyEKM8i78
         B5bDnFSsALm0z/8tnEG+lUp4cToHNOw2ZyOYbDsNU0SUmJ7lI7HGC/2Nkp9ZHhEXsXct
         Xd4g==
X-Forwarded-Encrypted: i=1; AJvYcCVDst1Kw5yrChIHP7up3l2B/avS0Z9hO1EuutxFsxyzg3ajN45j95JRNyCG0rYzTK7minTCEa0X6geOAvdT@vger.kernel.org
X-Gm-Message-State: AOJu0YzncxX8whuLMHwwzSeUB7cZfwPYVE+EJ7gL9PnF6V+EZmN+s5CK
	4OAqqfYWfthy7nRqn09HN8IIR1UF1X3kH4iVcaRoHm0Rsp9/vw++bg1PCUzYlBtqYdVGQpUyAt5
	ARLc3JIvY2jcqNvPuakVGZHuSz32skEqAgEEJrSSWKTPh73MJbl7lYs5gsDxvS1N8cNtU
X-Gm-Gg: ASbGnctCrKeULLNXtkIvV4hcVvUhv4SLTbhQygukmA6/11tP9TDp1pNGjq2E/4Tq96j
	xCeUbTgQuLI8/p9nnmWo/InvzhCrrZFFPSDMYMygzK4qstBZlbEoSA/O1YzPhVhfyHv2i1FtNJV
	JpmVAPFs2V2QUrSl5ssA225HUeBQnLd3anHFfZVDpKd7hpCgZFybTihCdQndZsfSlmwjhPbmY6/
	p4JZAnBczEXiATvNzRF7W9AnnXf+ePSKyzc1I7GeShRmz5z+z7l7+HVB0jXDCOgso6wv0a7Ainx
	OLawNPDHcVRzCqqfjti0gaZMDdhuNuOEDFDqKZ/ViVkioDN8J+fTQ/BAUe+3XkF5nkDskJb9tEX
	N3TwXjQleFjm9vWNpFI8KfZBZF49QuCsWeKfq2nzD4yb3Yw+7A1B+Nl2WpYJNRjPG
X-Received: by 2002:a05:6214:b6c:b0:810:e12a:48fd with SMTP id 6a1803df08f44-88009ad09a1mr83592336d6.7.1761808092796;
        Thu, 30 Oct 2025 00:08:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8zPyr7CBc17zabeEthaobsdk5MfrOpcUhAgyht/VFw5dcoi3n9FednzAFRqYb6ttQ+XA7xw==
X-Received: by 2002:a05:6214:b6c:b0:810:e12a:48fd with SMTP id 6a1803df08f44-88009ad09a1mr83591986d6.7.1761808092324;
        Thu, 30 Oct 2025 00:08:12 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87fc494ab16sm112217426d6.39.2025.10.30.00.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 00:08:11 -0700 (PDT)
Date: Thu, 30 Oct 2025 15:07:59 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, robin.clark@oss.qualcomm.com,
        lumag@kernel.org, abhinav.kumar@linux.dev, sean@poorly.run,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
        quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 08/12] arm64: defconfig: Enable NT37801 DSI panel driver
Message-ID: <aQMOz4P2/WyjXy1b@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-3-yuanjie.yang@oss.qualcomm.com>
 <wuh7agcgg6spghilnx4amqukaaydj25u7kbdiod7fl6pu2ulvm@pmosyuo43cyw>
 <aQF98RvLuOlJZlFi@yuanjiey.ap.qualcomm.com>
 <38c8e26c-08a4-42d9-8f6d-93969af90d50@kernel.org>
 <aQLOaI3ngjswi7kd@yuanjiey.ap.qualcomm.com>
 <7c1e0cb5-2483-4efa-be52-84cbe5d1a4b2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c1e0cb5-2483-4efa-be52-84cbe5d1a4b2@kernel.org>
X-Proofpoint-ORIG-GUID: 9VIAJEUJfzJdoOXSLQEKe2TTzvooFEMg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA1NyBTYWx0ZWRfX4282IfbxMxQa
 87gLRFQzJ6WlffJafug/cGs7JRTWrAxSkLF2V1ccTtGOImhpmB4hGrjorQ97AvaUMJEsyLIN8vH
 hMCNwOG2U/+XII6l5xdlQH5HkHJHjvTN70l0Z3MckOL/Kqzbco/UnDbd1de2nW2UDWI/esH0EpP
 ez5uYaYtvXe63rWjlyC6pXvUdTtqRKPzgBG2qcfUB+A2KSmAzz4aO3tvtd2vgFTjmfxtlHMdBib
 lSIrUE9y5ETUVncOfBGlX6NggSksMClxyJzhV9qocwnGIWgrbiE78fVi7eEVZlL6zhrZPSODehZ
 2XS42wfz9+ixJylYt7DNcMTYBKrXa50Skg/5Vq31myLr5156D/C1eHUHQFZndDaTaIrtEE3oojI
 VqgQK88oHN/OE1NnrC78k2rB8/7FLw==
X-Proofpoint-GUID: 9VIAJEUJfzJdoOXSLQEKe2TTzvooFEMg
X-Authority-Analysis: v=2.4 cv=YLySCBGx c=1 sm=1 tr=0 ts=69030edd cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=x1sgA4FD8JzbF63Z9coA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300057

On Thu, Oct 30, 2025 at 06:37:40AM +0100, Krzysztof Kozlowski wrote:
> On 30/10/2025 03:33, yuanjiey wrote:
> > On Wed, Oct 29, 2025 at 02:05:20PM +0100, Krzysztof Kozlowski wrote:
> >> On 29/10/2025 03:37, yuanjiey wrote:
> >>> On Mon, Oct 27, 2025 at 10:51:23PM -0500, Bjorn Andersson wrote:
> >>>> On Thu, Oct 23, 2025 at 04:06:05PM +0800, yuanjie yang wrote:
> >>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> >>>>>
> >>>>> Build the NT37801 DSI panel driver as module.
> >>>>>
> >>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> >>>>> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> >>>>
> >>>> You (Yuanjie) authored the patch, but forgot to sign-off, then Yongxing
> >>>> provided certificate of origin, then you provide certificate of origin
> >>>> and send it to list?
> >>>>
> >>>> Please correct.
> >>>
> >>> All the display patches were jointly developed by Yongxing and me.
> >>> So every patch 
> >>
> >>
> >> So two people were working on this absolutely trivial defconfig change?
> >> I have troubles believing this.
> > I want to say these patches I am first author and yongxing give me support, so
> > I think yongxing is second author.
> > 
> > I want to express my gratitude for Yongxing's support in every patch, so I included
> > both our names in the sign-off for each one.
> > 
> > However, if my intention causes any trouble for maintainer, I can remove Yongxing's
> > sign-off from this patch.
> 
> 
> Please read submitting patches to understand what Signed-off-by means.
> Otherwise I have doubts we can accept your patches - you simply do not
> understand what you are certifying.
Thanks for your tips, and I learn some tips from submitting patches: 
https://elixir.bootlin.com/linux/v6.18-rc3/source/Documentation/process/submitting-patches.rst#L524

I thinks below sign should be true, if you also think it true, I will use it in next patches.

 Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
 Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
 Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Thanks,
Yuanjie
 
> Best regards,
> Krzysztof

