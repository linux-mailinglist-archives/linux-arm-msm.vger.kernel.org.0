Return-Path: <linux-arm-msm+bounces-73194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22446B53FCB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 03:22:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 420FB1C275DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 01:22:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86E391514DC;
	Fri, 12 Sep 2025 01:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fmzof5cE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C542F4A
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 01:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757640147; cv=none; b=vE9VaDYkOPOXUL/vbEToYTomBluZ0et4YC/qrWsLzd8DZgtBjvaH9CE5hH/L/5W92F2CD3XMELxpmk7wBVDmXWlI73TKbbMSq/6wW2r5CKDGdE3IWPlxBElxgY0rctJ16Dl7kg6psPztxW1S26gKV5k4wVtBlyhn2Iwxsrf98bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757640147; c=relaxed/simple;
	bh=mBPv3yMMYQAv8SWn18U10xx/gHV/3T4mCcLgppUbHqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qfpP3UGN3DBgWJ5BFIs4v7P4y22xU1x30IVjqMPhp8ATO9HSFU3F21IOFs/PcTrsUvHFBhM4xW638/m+1+Jz39JgjAJw3kErTKZu7maWs5YdqLTt3QYKzutSRhQNKptaEFM0TH0iIDP5XT0lWucDrwcJcnUxXI4e31kQxE5ksFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fmzof5cE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BIOAva025747
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 01:22:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BzTMuuDjSttsP/lC8DaVWg4q
	sEsoHITtFwASx4KsovY=; b=Fmzof5cE0h2EPMjPraJEqiGNDRktmxmJwEfTPGzD
	jVTjtx+XTyCyni4b9+c0wTthD6OSw66uoCjXGWx7dw3GeylX5Tm0lcBw+RIW/C9k
	hZchCguTrYBrRhcH/Mur1RSt1FH9++AiAihjKnnxsDo8zkXurTnypvV4NCQrNKr0
	KAxBXudjKwKbs0RoLNXoYDBQEDKKaiCHMPkD1CL83htE+5Rtc0+tIPNuQJZcQNWz
	ySGI3KyeqluX2CE5xgVuTWifItSnb22isUD4yYHvnhZsH5WTeRTkpOMAgHh5vg98
	NbSZQ72NIkrKUSFfuf1QW4wZorixjik7+cDRIawdsDIvbA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj11rxm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 01:22:24 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-768181ba081so6713816d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 18:22:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757640144; x=1758244944;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BzTMuuDjSttsP/lC8DaVWg4qsEsoHITtFwASx4KsovY=;
        b=IiciLc17lLG0uBqk7UxfmczzZunsdyr5DeVr94klDQ1wjKt3dpSAwDQk90FK2BD4bE
         d43XrrpRYGFPb4DcdAFRNTbjrKpn/sJ3cv+hTRx9GB1+O5Z2knO1KD2oEfaI49ijYFAa
         YWSXPcwYdpfUWyQmB4Cspj8e2ceZQo0XMo+pSF9GodmjLDY1jzakdTvX1PdK3URbUiLK
         NkiwFpVPXxXC9wdtV+idpT5D7X+yXqh6h9wIK5kdbF3CeX/I07GJpyt/oAg36BsUStRH
         ELpmMBT3dAVGG0eMsHOTbeO7tFFEFkyQ949xS+nWudQaBkULnOjCZvzfLFShITjvfcLQ
         63eA==
X-Forwarded-Encrypted: i=1; AJvYcCXHcWoSVrv1ZRuSGwp/Dpma5mo9WRn4IdlB9X26bAB6l6HoNUK7hEJ0ZbQbWUAXQ1YftGz+5R5E0GlsgYcW@vger.kernel.org
X-Gm-Message-State: AOJu0YwYSECDbGz/4qIT0MVNyDjGQoeXUe1dZkiOcfjQq7SeuUCwEJGh
	uRTEC/m4GT9uz2qcBGHiH7uBCHqsYaWt/8kANWl/1rwajo7GeUgLpzMxwxf/K8h1yncb7sWcy46
	TPzRy9UqwWvE85gBCKKzmhvEadies1GxbG+Y6tzcTYqSyhaR3/xbkaqjEB/q1LKZWdwKBnxeKol
	X2
X-Gm-Gg: ASbGncvpagG+50qHZZnBetTjjOB+y4SEfTUpgARj4o3dS0HLJndF3DwZzsu8yJ4Iutz
	XyDwy7+6VJ8pNhk4GShzAT6qbZBQPwxu5zigERxHkKDcyutewwCMvWEbm3USpqC70epLpt6opT2
	5tuZjvzpa0dH+kahU2tQOLKvtD7Nb8JFVdRZgf9+to45bbORTChQBfPlvXqeG+I0gZkzu51d6mf
	s2jOyp+AMf5W6mASGiuXgNN7gfzV9svbTUSKnXhjEYdnme2w5trHUt5jEnbPZzljlJ819iLTjsf
	1O5WIJIYwmOGdiJ4G2SXtlyfM5jplpIE0Hb16AZoCXbQ97En1CAyoaHxO5Pc/OIbCQrU9PktV0e
	raCxzcNMLxxDhFB/Ksd1/LzffPURBQz+Rr/1LHP/l4iZJd4xzePYn
X-Received: by 2002:ad4:4ea3:0:b0:70d:f55f:ef97 with SMTP id 6a1803df08f44-7621c32efaemr64971636d6.1.1757640143691;
        Thu, 11 Sep 2025 18:22:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGa3DVgCbahRQBJw1LnRpwbmCl3+J/uxTrOa/Dcg3ZkKhfb7sCMmlslgoZeHS5Wv7jGebaung==
X-Received: by 2002:ad4:4ea3:0:b0:70d:f55f:ef97 with SMTP id 6a1803df08f44-7621c32efaemr64971436d6.1.1757640143246;
        Thu, 11 Sep 2025 18:22:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-34f1b4920acsm5476141fa.58.2025.09.11.18.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 18:22:21 -0700 (PDT)
Date: Fri, 12 Sep 2025 04:22:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: dts: qcom: qcm6490: Introduce Particle Tachyon
Message-ID: <2bc767td7gw4bxts4k4xwhdiv5tgxmpyjwwv6nqeatvncdov6c@u7gfilzxgomp>
References: <20250910-tachyon-v1-0-5090bfd133e0@oss.qualcomm.com>
 <2tnzsjw3xy5jct4bcmahcwhjbzlmyxgcx6fzlz5qrzxume2uoy@phpcz6mnydlt>
 <nweaxuma3dkhzcc46ztfhmxxrchgidxjprc2tz5eahle6sxsuy@qvczmexs4qnn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nweaxuma3dkhzcc46ztfhmxxrchgidxjprc2tz5eahle6sxsuy@qvczmexs4qnn>
X-Proofpoint-ORIG-GUID: ucke7xInIu_0uqHvcNYKcdhv51foZd4K
X-Proofpoint-GUID: ucke7xInIu_0uqHvcNYKcdhv51foZd4K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX63RMZ24+/fci
 S6AULyI4moAdQBvqtXxID756Gz5WR8TytRugOcMV3B0/JnyW/LgcL5XN5F/q7brZYHSzqthesnf
 cYAmTiwU/juxD/x7MM9cK1MnyTs9xW72OGTnoIpJvVXwGmvRrNhOlZZtMHJEK2kVJaKhD2Lf5d6
 x9qQvTi0Uvsjr7F6bZ1yXY1/2XOnqe1Dm3lMQfImsGGgppK1kP6TCMdE+FRB9jfGbMcwpQv60K2
 kqhwFqrZF9i36qkpRuTeDVoNSGXbNiZFEbQJ+dSkKMOr1cFqCHpYkO8AwQuhu7AwJYvlnB9r2Sj
 1eiMIPo1do7JO1Ad8JLdWJf9MlJvk8QibIRy11jEQwpC2MrdqYjiwah5j9Wly/RGKpoOgq7z2FT
 a+6AydVf
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c375d0 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=7AODkVuKAAAA:8 a=K4zJXCh-jB-3kEFs_x4A:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=sRHRY8H3vKB1GfNvUtpx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024

On Thu, Sep 11, 2025 at 02:19:39PM -0500, Bjorn Andersson wrote:
> On Thu, Sep 11, 2025 at 03:01:35AM +0300, Dmitry Baryshkov wrote:
> > On Wed, Sep 10, 2025 at 06:05:36PM -0500, Bjorn Andersson wrote:
> > > Introduce the Particle Tachyon board (https://www.particle.io/tachyon/),
> > > a single board compute with 5G connectivity and AI accelerator.
> > > 
> > > The boards currently ships with the Android Boot Loader, but replacing
> > > this with abl2esp allows writing a EFI System Parition and OS partitions
> > > to all of LUN0, and a more UEFI boot experience. A prebuilt version of
> > > abl2esp is provided at [1], as abl2esp-v6.elf.
> > > 
> > > With a (very) recent version of QDL, a flash programmer from a Tachyon
> > > software release, and a full distro image, this can be achieved with:
> > > 
> > >   qdl prog_firehose_ddr.elf write abl_a abl2esp-v6.elf write abl_b abl2esp-v6.elf write 0 image.raw
> > > 
> > > The following firmware files are currently used, on top of what's in
> > > linux-firmware already:
> > >   qcom/qcm6490/particle/tachyon/a660_zap.mbn
> > >   qcom/qcm6490/particle/tachyon/adsp.mbn
> > >   qcom/qcm6490/particle/tachyon/cdsp.mbn
> > >   qcom/qcm6490/particle/tachyon/ipa_fws.mbn
> > >   qcom/qcm6490/particle/tachyon/modem.mbn
> > 
> > Is it locked?
> 
> It doesn't look that way.

Then anything preventing us from using the default, non-signed FW?

> 
> > Would it be possible to Particle-signed firmware into linux-firmware?
> 
> That is something that would have to be discussed...

It would be really nice...

-- 
With best wishes
Dmitry

