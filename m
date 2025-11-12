Return-Path: <linux-arm-msm+bounces-81340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FE8C50B94
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 07:36:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2C593B41D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 06:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1EB92DEA94;
	Wed, 12 Nov 2025 06:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PjUveni1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E7znkbji"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93BDA930
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 06:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762929350; cv=none; b=kokMGkGlWEeQmX7Um3rRsUnpH4y5wn7bFTRW2WKMAxZxYot+L/fEcEdBydF6rmQ48pjFickZzNHYwV/UlbWpl45ntbQcQVtS0WT6e8lrPjl6/gzTTktgBr93KV6LKXL5DAnKDc7gfSb7fIq+pxMdPipETXxw17rL97fvtjWk8/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762929350; c=relaxed/simple;
	bh=iHNbur1CgPu9EMbbpr1oIxjrkDUOkh1go5m1xX4q/8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hsihJIcfww1cw3JQDx0bTF5RVwC8BmuoEVXz+POL0ze04Vp0m+S8vTfB8oCSKGEeGc5j38p9r+MHkgGzfAGnf9nCFVaGoOQalePZFU+125YSEYufImfPrYnpYd/iLT7oRm7chhzm7eYXQqy3vv4uBETAfbHqh4N0KmiaqQtYs9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PjUveni1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E7znkbji; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC3HZN34053645
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 06:35:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iEFXFi5trTxomRGsS7gEFHXX8gbfIDxo43cEy1pNfI0=; b=PjUveni14tOQgjUq
	TdUk7WXuyNPIVnRtvQcMvOoYLtM05b+VwEjKuJFP4b3KdXKXEl9tXgKanhjXbIbE
	0uyJVyTqkGgWqRPJzOIwY5aVtjM2U0jsDXMxv/KTZAcsI5IdYLJegrFZUvJZACtp
	fOIsYaeSBvfjy6G3hWRaHXwhzxvTeCRNNuhxdLghui/fsHFSiSSswt/Q71GbaH4L
	kjV4PvWP4Y7s0EuUNbFIPl+WYqOUeg2u24spHDxRDddhZ/ygcr0fDjC/O9KmFyVe
	Z6Mgr6N0r/xaX9KIxg0M9wXirapBhIQBuFugevnWnV52kmijmbw22f4xGo79lNXw
	sbJHXA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acj6v8g8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 06:35:48 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2982b47ce35so6265455ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 22:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762929347; x=1763534147; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iEFXFi5trTxomRGsS7gEFHXX8gbfIDxo43cEy1pNfI0=;
        b=E7znkbji9uQvyZBasrBQvXo8dnxoyYW4F+j0fS4m3y4zWL3xL1qVCswirGCx19LK1e
         N3VlIYih9uXqE9kMoLRK3IwnqbHGvhNgjSdUnDMD0w+4eXxPDkUbm0jskO7nN7AGfQUv
         i+c3tjiUlfGrHakXXvFRxTFnl75NUh+NQVbKgMUzVfB25Rx2sdXPRJ9rgv7oRdhpRIKV
         aj02cHXfoXXdoP2dJHLNYynOqiNl5ZZzomtweJEfsrPQCzW5w4TX9hEa/oU9fA93ONI5
         TVtvtFG+1Q/TG/z/qwjLFa7uoKU3/7HJhl1501N9iqFNHZaZMkE9jd2wFQY+WV4ry0du
         Zp+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762929347; x=1763534147;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iEFXFi5trTxomRGsS7gEFHXX8gbfIDxo43cEy1pNfI0=;
        b=ROI04b0TAUO3LydQufdYcZsMaettAIJwXfgTza+Hqfp7Rh6olK958k1HccrwIeXsTO
         EeJFWITObMkT/ZvXHd624o730osokMANT31uV/Hx0XA3/13A1GLF8914966PjTstwGVi
         pjiMZPSTuNARnDWQPARbfMIAqliqXHLgMAGewL6el66OxodQRgXHRQAHM5X20ftxlUTI
         +RocrTBP+hXDby3rixZtgf0yYyjL3N9D6uUZ9MQZlZu/9EEb2m59yFviZMymyg9tZvJ+
         RlvP/dIhWrCo76CajS37yxhbgzOvS/niirn4cDwqsvsK/nJHG/mx3nQkDlqv24i0Lxia
         vzTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgls2+4lwqLsw2oGQ3QokM5umct4hG9xWk9jAkxmWMcm1HNF0av12VO8M3UMKh3vC2PyFV9kFAyHJxihRk@vger.kernel.org
X-Gm-Message-State: AOJu0YztoBreNxiuHxGUX0wDr+mZswTXYsmNeHcRafsKCZ16RrEu3xon
	TnmOA2w0l9zHfYC3HNJ8eyC4C5ic4birD6ej7ulxyHnUSqAIzC7bkJtcFwS17RxBMY28VFvXeFX
	8baqpB7Fk6neZZGAf52FMYuJZmEK8f/Lcv50/oNf8jwrdNNEa6OUFkaohHD+XP/ujcxtW
X-Gm-Gg: ASbGncuxHunh3nvOmKClk7LnZEANNXZqJUaW6fdgUCbYtX9BZi7ZjpQZeB0QtDDAtMg
	0I9ZAD0x8LEX1nZ8VEBadZ1JRpI5AU4ieQdJP0esnRV2Ey1px9PudrSXvfYyZPFMwVAP+ZYVO6I
	ABkuyJSVhYHtdzRRPPrYE2kdCpHWJm1GTWnAoE5ztcWI5w7w8s4D9SqcaRQ0uH4lBCQsrffnHIB
	TZvHZk0+2sm/5cPd1KnzG6FFbV65T3JkI/H9rtSQCvcJPrdRWZ8eYcEur/Ng3gQK/fjC3aNoi16
	nDwE7QG19yrdisquTs4ta3sdPYlvmptHDOsGuK8kNR8fg/LdCN7DWLIzZHqEDo90Epqe6JZCmgS
	0sgxIFgrlDv1RimBDANh7ynxp6kB6GgMEjGR3
X-Received: by 2002:a17:903:2f88:b0:295:557e:746a with SMTP id d9443c01a7336-2984ed34126mr22611415ad.13.1762929347280;
        Tue, 11 Nov 2025 22:35:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBwTkfpC11yPeikWLPdn9cJivKbZakW5wxhoCWISx28xcRHZjpVs5bJWxOlZmoKbf+AA/WdQ==
X-Received: by 2002:a17:903:2f88:b0:295:557e:746a with SMTP id d9443c01a7336-2984ed34126mr22611105ad.13.1762929346761;
        Tue, 11 Nov 2025 22:35:46 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dbd8ed3sm18403175ad.15.2025.11.11.22.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 22:35:46 -0800 (PST)
Date: Wed, 12 Nov 2025 12:05:41 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: Re: [PATCH 0/2] Enable UFS ICE clock scaling
Message-ID: <aRQqvbn6cuTBde5u@hu-arakshit-hyd.qualcomm.com>
References: <20251001-enable-ufs-ice-clock-scaling-v1-0-ec956160b696@oss.qualcomm.com>
 <iy6ls7c2bjnzpfcuact4vd5fba7phmng2vlhzaxxix6hlevjbz@gnva4h2d4vsm>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <iy6ls7c2bjnzpfcuact4vd5fba7phmng2vlhzaxxix6hlevjbz@gnva4h2d4vsm>
X-Proofpoint-GUID: niOedyvISSbK-cqARfum99V1dsrI_G2b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA1MCBTYWx0ZWRfX8eJOnd6AFH9Q
 HQdyqjKaIE9siuuns+BDMweuVp4OlgWyT5OgE5tgcprSv8tQ3J95vYsKEH5Uxs1Mm1Ro636Z7ci
 7Y/dc28oU8Xf0mJl07JUxXNeeUB59V/Z4b4V5RNjgQmNYVRM8GbK9bZEPlHZmOhiYJHLUcNsuqE
 Z0U6XAT3alH1tFD/LQpr0/B6O/WOfXwi/VTv1goh4LvcKnff8cx2B6+0SIaxSgtik99KET7hdAr
 u0O2F7S9CZE3lxeWbP2+Vzow/X13lybjfNLnK8fC20IPPG3OfwyFEDl+0HhiutKtST/AXueTYfc
 MW8pK8Hut6ZVdXFs+QjgZ+MWqOt7W4VGvJDexz1sahTfGdx4fZuapAmeoWVVQRb9ZO4+va4c24+
 f0t26myeVx49Y/Rc0YcML3sSUKdOPg==
X-Authority-Analysis: v=2.4 cv=f8dFxeyM c=1 sm=1 tr=0 ts=69142ac4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gthY3zcKJWpGDLxpuiMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: niOedyvISSbK-cqARfum99V1dsrI_G2b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_02,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120050

On Fri, Oct 03, 2025 at 10:18:15PM +0530, Manivannan Sadhasivam wrote:
> On Wed, Oct 01, 2025 at 05:08:18PM +0530, Abhinaba Rakshit wrote:
> > This API enables dynamic scaling of the ICE (Inline Crypto Engine) clock,
> 
> Which API?

Will keep it more specific and update in patchset v2.

> 
> > which is tightly integrated with the host controller. It is invoked by the UFS 
> > host controller driver in response to clock scaling requests, ensuring
> > coordination between ICE and the host controller.
> > 
> > This API helps prevent degradation in storage read/write KPIs,
> > maintaining consistent I/O throughput performance.
> 
> I'd expect clock scaling to save some power, than 'preventing degradation in
> performance'.

The solution should achieve both objectives: maintaining functionality while
dynamically downscaling the clock during periods of low read/write activity to
reduce power consumption.
Will update with more details in patchset v2.

> 
> > 
> > The implementation has been tested using tiotest to verify that enabling ICE
> > does not negatively impact host controller I/O performance during
> > read/write operations.
> > 
> 
> On which platform?

Currently we have tested on Kodiak and Talos, with additional device-tree changes.
Will also update the tests details better in patchset v2.

> 
> - Mani
> 
> > Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> > ---
> > Abhinaba Rakshit (2):
> >       soc: qcom: ice: enable ICE clock scaling API
> >       ufs: host: scale ICE clock
> > 
> >  drivers/soc/qcom/ice.c      | 25 +++++++++++++++++++++++++
> >  drivers/ufs/host/ufs-qcom.c | 14 ++++++++++++++
> >  include/soc/qcom/ice.h      |  1 +
> >  3 files changed, 40 insertions(+)
> > ---
> > base-commit: 3b9b1f8df454caa453c7fb07689064edb2eda90a
> > change-id: 20251001-enable-ufs-ice-clock-scaling-9c55598295f6
> > 
> > Best regards,
> > -- 
> > Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> > 
> 
> -- 
> மணிவண்ணன் சதாசிவம்

