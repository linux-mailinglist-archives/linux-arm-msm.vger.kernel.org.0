Return-Path: <linux-arm-msm+bounces-71882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B38AB422F6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 16:04:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C65A5E4C05
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 14:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 908641C5486;
	Wed,  3 Sep 2025 14:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bRlYdSsp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02882248F58
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 14:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756908155; cv=none; b=jP8pAEjh9b6s8QrePfoFpdi/9Mtx2ePfglWGd40YT3nw34O0qPxNmF0wzGnKCzLJ7+pc0aZI/6707vtwksCuSbApc+NocG8i0+hGD7KSig6fugoDhnjsPEyoEfXSX3ZD29RTq2fURo7/SalWoZC03mni08lryG4D3Pwl5ame38s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756908155; c=relaxed/simple;
	bh=M1LtgKaIxvKtJ+9qrPZwuMH/I9dN5enhPX3YUdHFus4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bYaDIXCIKIn9fThRxG1bBn0CVq0RiDFSp4XculkyxRSLq5T7Du0znUvbIxI40tCIrjvRjz5ilL83Tgw9C+XgGUe/0Y6jHJ/3sGnXotQLvE1a0/92OwLvcVfeiFNvd4NIo+6oFEsdFqyhvlq934InM07XC1GZWUiuWFSLu7HuALU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bRlYdSsp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583DxAIB004051
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 14:02:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n+WcvQ74Ce4lJ577+ml0y8UW
	yDHNSNlwkTL36vqsE/Y=; b=bRlYdSspZpKNzm2T/cwtImHx1+fmgqAOO2AOAF7o
	wGcT89iVb9A6IuUdLa5F1mdHTmBJce+mUxFFhS9rAt5Qfn62K0zs5ue7tTc+FZwE
	sdJonU1/V68ggFK2zIWWWlljsdySDjE+G3VNbG2QSLZI1k8a1APeeOkFIxrQJyOw
	49AQrBPZ3tTk9Zxh1GCpS5fRje3OE2HRs0ARc5YwRZQI7PW+wvAkajLGVPUHJkxw
	WayV7c3miaOWdpu6HtigjV2hmyAPpGz9p8dbohnquZhmWT0bFvimoZSgIjgICCrH
	mFpfaQNrU+5MqRwa5DeIqN4oMRcKO9eKK2cbI/AdXf9Hlw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8uuh8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 14:02:32 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b4f86568434so2506782a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 07:02:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756908151; x=1757512951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n+WcvQ74Ce4lJ577+ml0y8UWyDHNSNlwkTL36vqsE/Y=;
        b=NFUwVnuQn8qp7d/IUKrBWqdC5xY3QTpB71ZZDnAKCvy8gSrdMZvAKFT4ZF5p+Ar6xA
         bH4QYBxjV3EqSuHj91kgKPkfo2LdLhrYGDF8roUqabQe5aHhMxsCTq8Uilxu0pV7QLSV
         HIODlI69U9h0BszJ2ABrp/4Sug1wj6RDJ+1Zf09fRzD8KdaKfRbnFtWZnsB+9KT1GmFH
         z7rFKJm1+tBe496coz0GiKZqH07Fwt+DJXIu4ZEq/jWzNemAaI3hUBTfeFyiA0IISxQl
         c7f6lkD++JPut0OnPSpzM1P/ojL9UdfuOc/kVFbDYHripLRAX3LiYv7bRK7PvTCWljjO
         IRvw==
X-Forwarded-Encrypted: i=1; AJvYcCWDZDrszRw5NhovcTA269vFgJiufEiMEeRurQbC17qKQADDSFKpU4eAYLIWw9xu5QA3yO1Qnk6QCTRbYcDB@vger.kernel.org
X-Gm-Message-State: AOJu0YxEn7/+t5s4jVR9Pqy81v+8jfE3ez2AFDhrlewZzWPtxZ6XqCB0
	dvAbAj4lMBB5n9xxklwBSzSAlhL9oHkC0OC6ERAPtdDLItZHvi4IQJokWPfit1mrCtq8bmIcPCW
	haem4n9Dx1wirqt7SNcNtwxq0oSbWaFODbCI8ajs0WRdIR4HBV+VE9jV+okAJkDdjjEy+
X-Gm-Gg: ASbGncuoQW7/wPLR88neNtjKDeJ9xWy5OrUGhokGdyqMiMvxC2KGz1XcKKQrmAfPL0z
	h/9ElmIYRbY51saeFEkRf0adNttvmsmNu+VY1/r2hAM5ozvi4GmsyNO3LQrZ3EB1arcCjYc4X3a
	6t23c62qCnP7uSXysYNgQoVdjACMMxmC5MjXZzxseFd5FmevYtW+Fou+rOeJKifGG+4pWtaQhw7
	tCmwrmySBr3e5QTl0bZYoh9MBKN68Z+rmKfb9rEX4dQRfHNieZeR85bvtPbTlu3PSeD80og0Poo
	yY3Aj5wYfsEhXZmz5LuoW1S2KO2h23MizW90kessjPgiYxbTjiqWX5cPJD8oeHJeocH7BKQeEPT
	SS4obBvdmVf72M5fL4pJxWhkeKmxIQmt3wO6JiIBgdZSz68BOvodX
X-Received: by 2002:a17:902:d512:b0:248:f653:538f with SMTP id d9443c01a7336-24944a12af8mr216023285ad.27.1756908150906;
        Wed, 03 Sep 2025 07:02:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIBrzUehFEhNOQDQfk8OUpugY6wgISvKlXoqbQ3W4x5v+1NPoa7mta8UknLJu8FmxdZvq0rg==
X-Received: by 2002:a17:902:d512:b0:248:f653:538f with SMTP id d9443c01a7336-24944a12af8mr216020855ad.27.1756908148649;
        Wed, 03 Sep 2025 07:02:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ab5e53dsm548761e87.7.2025.09.03.07.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 07:02:27 -0700 (PDT)
Date: Wed, 3 Sep 2025 17:02:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 00/11] Peripheral Image Loader support for Qualcomm
 SoCs running Linux host at EL2
Message-ID: <2g3iwc2en6wh2ucrsth5ontzdwqr7tr6oplxjnfdjsy3lwyyfe@l76frwiadgru>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <660c2594-9a93-450e-9a2e-17ef6b4c696d@linaro.org>
 <20250820112242.usd4sdd3avxdlcas@hu-mojha-hyd.qualcomm.com>
 <f5582304-8f55-4c3b-b752-9cefa1e4df96@oss.qualcomm.com>
 <b5a0ad0d-ceba-40d3-a111-0831c4538cea@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5a0ad0d-ceba-40d3-a111-0831c4538cea@linaro.org>
X-Proofpoint-ORIG-GUID: 9llFI-hWVLja9NSFpRexrWwsUyhY18XQ
X-Proofpoint-GUID: 9llFI-hWVLja9NSFpRexrWwsUyhY18XQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX+IidQaWLRZWq
 Mht29tYJGHWMG1rKqtPNU5IrBo3/n3TSolSiSAf8/HsZu/xj8k3Sre2TYLonbZa+9b5Rj/85DAd
 koh7ETraR5Y4yXg4tzKE8orRoRaDHR5+tOHZnrvg5QeqmfrzVx61tZod0rLpcZhy0yC+uM6Vhex
 JGvovAlHcL5gwuY8G0YFNU3dpjU2fDIiP+SVjwTLNIwxJzn6kmjLss5a+KWlnHjRrndz0IkLsZs
 HKrChevbOKgAR4jGp1l2Wdu70Z89/V+lu8sZmEBdltNCi5MpAZOhhQWLxk5qNYHYUE4AcFn1Osj
 R5AoqjNC42DmxI1MZkQfBBoCZT3wNorMfGKA3di7wozDMnsKGsfJznmTRs2JvJeZEWL5uh7cCmG
 CxmqSTJH
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b84a78 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=14clLndLnRljEXVP7n8A:9
 a=CjuIK1q_8ugA:10 a=x9snwWr2DeNwDh03kgHS:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020

On Wed, Sep 03, 2025 at 02:31:55PM +0100, Bryan O'Donoghue wrote:
> On 03/09/2025 12:56, Konrad Dybcio wrote:
> > > Can you try with this next-20250814 tag ?
> > You sent it on the 19th, so it's in your best interest to run a quick
> > 
> > git rebase --onto linux-next/master $(git describe --abbrev=0)
> > 
> > and giving the series a prompt re-test before sending, because there might have
> > been incompatible changes, whether ones that would prevent applying, or break
> > things functionally
> 
> I can't even find that tag next-20250814 closets thing is

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tag/?h=next-20250814

> 
> | * \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \   00062ea01d35e - Merge tag
> 'drm-xe-fixes-2025-08-14' of https://gitlab.freedesktop.org/drm/xe/kernel
> into drm-fixes (3 weeks ago)
> 
> but patch #9 in this series stubbornly won't apply to any SHA I've tried.
> 
> meh
> 
> ---
> bod

-- 
With best wishes
Dmitry

