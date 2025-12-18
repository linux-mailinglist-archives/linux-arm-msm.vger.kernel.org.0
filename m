Return-Path: <linux-arm-msm+bounces-85707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E75CCC4C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 15:37:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65D8B3058F9A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 14:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 501B22C11EF;
	Thu, 18 Dec 2025 14:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ey+09OW+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Epw1q1+Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539E42D6E63
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 14:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766067995; cv=none; b=k6zrKiULiqmnt0I6+VlEQ2YF57oBYjpnFssz2YMrznpiMKYxXMyAheboHOdwEcNfoBb3TJIcEn+o3FWwlcM0poagH4Y0oUVnVJmjFE/2saDtLJNNJ84JLy7sB28cj48Wj5cq8HUx9iSQWtEOKMvN27iCix46NF4iVCT3UwrdQ9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766067995; c=relaxed/simple;
	bh=LDItE4bkrfkHQ2BkSZESpDXOr2+FX/CaoYYTXzqVJmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pzIGewRDS8Wji9c/1t8jw3ujEU9gTtEd6tku2KW14Ohr7IumC/5j8TLh1QZTAd1s0bNxyhpNHzNSKu3vgs4XGCpnpDmljDr3mbuXe/at6yYAPubFX1+9GrFJ4m36zs1OtM3zTejzlOYKGe7fOU9LnZsIQIe1N8AcVICguaJRb5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ey+09OW+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Epw1q1+Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI9KY4Q680346
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 14:26:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+eNZeX22Bag+AhcIrdbMJYmk
	Oq1LYSfEEsUGr4TTpxk=; b=ey+09OW+AfCwhAHgoeJActuICH9YbylXehaAWFjN
	UVvW/dWY8zzGe2ieg+79kTCPR+1Su3K30lxentwc3LsKlorXY4nfK+SevAlhh4g1
	zxhrN+Vj8NqHO5YzuRNJOhoVfAqleuzyiTRC4ySSMNWZKCPD42PG3a61taQO2QHN
	8kSnIyy9CksNNXmGJhq4bndBcN4PBNjRpv63f37awbBUjWDZL4VvSnCyvhcM4O8p
	X4PF7GAAIWGNFno9rolV0eOx1UGMfjQiLAJEIznB2/taQbSRqZdoTvJi6QNR384d
	7Ezvm0ezxcUlSCvodSonMMeIIE2PZ9k9pnTFW8lCJNXvXA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b45bhjjsg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 14:26:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1d26abbd8so16400031cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 06:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766067991; x=1766672791; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+eNZeX22Bag+AhcIrdbMJYmkOq1LYSfEEsUGr4TTpxk=;
        b=Epw1q1+YePyN6Z1FQzCtYROiMkjNjAGAZv9JH4poCkmpTHtJ4nHIGnMsgH5pgmt3N0
         YSKcpo+sMUEBRvNLN9cwJKvVPpD7aujvBrL/GF+x0azJN00DeAp8uMxbXZUcK+w1qV5t
         JhIhzT+kVrK/Unb+/2MJExcphPUkAeA+bW5dHICO5Bqz//JS/tT7F8Lw9OYIWWdsOEud
         qzUSRkIwJFr3g5/deAuW/ZAtCWN0eAZrgqGRIutmTJDWUYP0LWmlXKfd/U1rl3l1kkft
         bfIewJZgtpgTEh0mvbvVGcTQWhBxR/XQvRolSu7Ewby/Qd1Cl2fz4qiqS3pXyGCMYbVD
         bcig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766067991; x=1766672791;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+eNZeX22Bag+AhcIrdbMJYmkOq1LYSfEEsUGr4TTpxk=;
        b=dOlGXtWSRerZ9RMntMYLEZQLtT/yOHv2NR1Twwtgv1caU3pFsrxtegnvZNGspPXL3R
         +PugCd7tmAtb4uMJRdszR0/wqXs6G95gVahTiY8JGztYJ9gWbbhjQMXDiBQFespXd4bB
         p6s9GMfITE5Hko+zIMsfGbfrZ9xTUz/X8zSQ4u7vjl6Mubyo/HxUGkHc9F9xSwaZnG+x
         OWr64Y5Kcs6sJVuULw/sS2BQKgQ5cMkH+PTF1iSPL4zjhLD8bGz3d0f4KvjVN/oZT0r8
         ILz7SfHYwt6nSGuYKFcUmphQilT17VOT4fIqrGTHRD7qet3CS2MLWPt/lAsTX1Bv2rgg
         vLRg==
X-Forwarded-Encrypted: i=1; AJvYcCUv99eKsPATHpY5aqTbIzKrZWP7Nm+H63K+uoZxVcyih+CHQH3WNLIwn49XLwGb+deTOGpOVDRo9tQvZbVu@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9txHZcSuHms0taMvcPdclbvpwsu9Cjzs2ggHKOhKkQM7GT/PF
	wy4vaq03MJzf1atzAF2y43yHf5uxSOzEWHfzHU+pnF8PUcHPH0UAkLulTN43p0Zi/QWAMWwuNDB
	3sR+URiHkj5FDVFLpKPX3yi/Vg1Fuwu6MPKCtqJF4JIbE53jSbiqjXHBgTpCw04Wd5GLW
X-Gm-Gg: AY/fxX6PaWBz0qrz8DgDqJOPphIA2Y/oYs8XTBJzEa82nS6IsPx4w4jC0wmDLzs6FM0
	/75Wy0GXivsswQY2cKC0u7kCC4a+ySl89VzZo2enlN4Eg2n2VsY/RAbAgd8AanU49vF/xhj5oKP
	t+xld8jiyybDY0icikH+y5Hgw2+HawExdOhlfXperqoy40gWg+qyhAo5xTEB0hVGuRqaUkAJoAK
	nHiJwmjeSAh/OijrJ/4pcEy7hRaWSjd5188g/s6H6tum7DdbhEYSzuO9wavqq7X2LieYHTHfKLW
	RlaO6CUs5xc0qnhSPvCiNk3QPiYF7cQxI6wA1Zo82dtn8ZY0IRJH0xuVAogG/1MPqfHfPQgTGce
	kQdXOJXlzeqjhWpA3u0OIqZdWclJg6bsVWwh55a8bMXJkmAmqpLK8T6iqE47n5/3l0RAXBQG+NV
	WocLSydqRJtsap6cXpT1O+a6U=
X-Received: by 2002:a05:622a:5513:b0:4f3:59c1:768c with SMTP id d75a77b69052e-4f359c17765mr71607091cf.60.1766067991525;
        Thu, 18 Dec 2025 06:26:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFX4Hrk9ZHUtg7fsmd9iQkwVpcpFhlhg3A3GpY51zv7nVekKtu/jcASONAOmixUYCFr9RhjYA==
X-Received: by 2002:a05:622a:5513:b0:4f3:59c1:768c with SMTP id d75a77b69052e-4f359c17765mr71606621cf.60.1766067991009;
        Thu, 18 Dec 2025 06:26:31 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a132cb37dsm1124446e87.5.2025.12.18.06.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 06:26:30 -0800 (PST)
Date: Thu, 18 Dec 2025 16:26:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Alexey Minnekhanov <alexeymin@postmarketos.org>,
        "marijn.suijten@somainline.org" <marijn.suijten@somainline.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Paul Sajna <sajattack@postmarketos.org>,
        barnabas.czeman@mainlining.org
Subject: Re: [PATCH] drm/msm/mdp5: drop support for MSM8998, SDM630 and SDM660
Message-ID: <3zwhkm3ncv6iujfcbehiqjspabakabqeargafr7csjnbbnjt5r@qwgjqghigwxs>
References: <20251211-mdp5-drop-dpu3-v1-1-0a0186d92757@oss.qualcomm.com>
 <8e1d33ff-d902-4ae9-9162-e00d17a5e6d1@postmarketos.org>
 <dcapydafye2v6owrkehngivqlucjcx6aa3sszszflh3ocm7dpq@qsajm2qkc52d>
 <24f29ff0-99d0-4175-a6c9-f402ce99f645@oss.qualcomm.com>
 <7dcs7n4pbdhmm4ujgqnek4setujzqxhkdsf3tuf4ggymajj3rj@xzapix7ujzr6>
 <92f0e801-032f-4c8a-8bb4-ecb3af48af0a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92f0e801-032f-4c8a-8bb4-ecb3af48af0a@oss.qualcomm.com>
X-Proofpoint-GUID: GiIersf_pxILFUvQReM_gURN1mpQG11s
X-Proofpoint-ORIG-GUID: GiIersf_pxILFUvQReM_gURN1mpQG11s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDEyMCBTYWx0ZWRfX9Vb+NgeCMOJ2
 /tEfov8XgQqnvvi63EN3cqWqM8Dn/r8HXbu+ZUseck7J9Ps4sZFHEPlGE1UsN2KyD2/l8gVEgz5
 zsp6SDU6UZfoA+JKp4jebCBlCzIgfMWiiQOgLxWca4SAatdfLNuoNl6pO6LHh2SYiol8OJbb5N1
 somFblcgiz5109y/Tg2PbdVaj+B91Fqaewm76/dtWZTjn9g67swYgufeoYG98Rwq5Vku6hdzeHN
 70m2hk3iFIf26UjhxpCkMJUGRZzwj+T8D8+30Qb9cWCkwsZnxAUDQMgH/Y7oxRdgNvDf6BrZZbT
 AqC6jMrPEwnWGf78wn8IIFZ488d+VHB1rZ6bfWRNBMXSeRZ9Kyr7+3Ehxcc4ROu53pMuxRmSESQ
 cIClO52X9qXUHPojcANSXJXrPrMuOA==
X-Authority-Analysis: v=2.4 cv=SZr6t/Ru c=1 sm=1 tr=0 ts=69440f18 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=mPYuMWSBsh0mtMeFgAUA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512180120

On Thu, Dec 18, 2025 at 02:54:15PM +0100, Konrad Dybcio wrote:
> On 12/18/25 2:49 PM, Dmitry Baryshkov wrote:
> > On Thu, Dec 18, 2025 at 12:23:49PM +0100, Konrad Dybcio wrote:
> >> On 12/17/25 5:34 PM, Dmitry Baryshkov wrote:
> >>> On Wed, Dec 17, 2025 at 06:05:31PM +0300, Alexey Minnekhanov wrote:
> >>>> On 11.12.2025 04:25, Dmitry Baryshkov wrote:
> >>>>> Currently MDP5 3.x (MSM8998, SDM630 and SDM660) platforms are support
> >>>>> by both DPU and MDP5 drivers. Support for them in the DPU driver is
> >>>>> mature enough, so it's no longer sensible to keep them enabled in the
> >>>>> MDP5 driver. Not to mention that MSM8998 never used an MDP5 compatible
> >>>>> string. Drop support for the MDP5 3.x genration inside the MDP5
> >>>>> driver and migrate those to the DPU driver only.
> >>>>>
> >>>>> Note: this will break if one uses the DT generated before v6.3 as they
> >>>>> had only the generic, "qcom,mdp5" compatible string for SDM630 and
> >>>>> SDM660. However granted that we had two LTS releases inbetween I don't
> >>>>> think it is an issue.
> >>>>>
> >>>>
> >>>> I've retested DPU driver on our downstream release based on 6.18 (by
> >>>> using msm.prefer_mdp5=false kernel cmdline parameter) on all devices
> >>>> at my disposal, and I can confirm DPU driver working fine an all SDM660,
> >>>> SDM636 ones, but not on SDM630. Some logs from sdm630-sony-nile-pioneer
> >>>> (Sony Xperia XA2):
> >>>
> >>> Unfortunately I only have SDM660 and video DSI usecase here. BTW: is
> >>> your SDM636 / SDM660 using CMD or video panel?
> >>>
> >>>>
> >>>> [    2.356546] msm_dpu c901000.display-controller: bound c994000.dsi (ops
> >>>> dsi_ops [msm])
> >>>> [    2.357328] adreno 5000000.gpu: GPU speedbin fuse 146 (0x92), mapped to
> >>>> opp-supp-hw 0x4
> >>>> [    2.364802] msm_dpu c901000.display-controller: bound 5000000.gpu (ops
> >>>> a3xx_ops [msm])
> >>>> [    2.444649] [drm:dpu_kms_hw_init:1173] dpu hardware revision:0x30030000
> >>>> [    2.449793] [drm] Initialized msm 1.13.0 for c901000.display-controller
> >>>> on minor 1
> >>>> ...
> >>>> [    2.911900] [drm:_dpu_encoder_phys_cmd_wait_for_ctl_start:654] [dpu
> >>>> error]enc33 intf1 ctl start interrupt wait failed
> >>>> [    2.911916] [drm:dpu_kms_wait_for_commit_done:525] [dpu error]wait for
> >>>> commit done returned -22
> >>>> ...
> >>>> [    3.176171] [drm:_dpu_encoder_phys_cmd_wait_for_ctl_start:654] [dpu
> >>>> error]enc33 intf1 ctl start interrupt wait failed
> >>>> [    3.176367] [drm:dpu_kms_wait_for_commit_done:525] [dpu error]wait for
> >>>> commit done returned -22
> >>>>
> >>>> Which results in horrendous ~3-5 fps in shell.
> >>>>
> >>>> The block "enc33 intf1 ctl start interrupt wait failed" + "wait for
> >>>> commit done returned -22" is repeated few times per second whenever
> >>>> the display is turned on, and stops when it's turned off.
> >>>>
> >>>> Meanwhile it is working fine using MDP5 driver (msm.prefer_mdp5=true).
> >>>
> >>> It's interesting. Would you please capture the devcoredump for the
> >>> platform? There will be a lot of blocks, I'm interested in INTF_1, CTL
> >>> and top_0.
> >>>
> >>> Also, as a debugging check, would you mind patching
> >>> dpu_encoder_phys_cmd_wait_for_commit_done() so that it always calls
> >>> dpu_encoder_phys_cmd_wait_for_tx_complete()? I will check if there are
> >>> any differences for CTL_START and similar registers, but it will take
> >>> some time.
> >>>
> >>>> Well, as fine as possible considering [1], using several FD_MESA_DEBUG
> >>>> tricks to work around GPU issues.
> >>>>
> >>>> P.S. I have not yet tested MSM8998, but I can try if required
> >>>
> >>> As far as I remember, MDP5 on MSM8998 has never been wired (as in never
> >>> committed to the DTSI). Angelo has enabled and Freebox people have
> >>> tested DPU on MSM8998, but I think it was limited to video / HDMI
> >>> usecases.
> >>
> >> I think we poked at both, back in the day (tm) and DPU worked on msm8998-
> >> sony-maple (sharp,ls055d1sx04 cmd mode panel) with the funny CMD mode hack
> >> (due to a register field not existing on <845?)
> >>
> >> https://github.com/SoMainline/linux/commit/14e0517e2fd5eee116a32db624b09856c60fa022
> > 
> > Ok, so my guess was correct and CTL_START is not present there. Checking
> > the regmaps, there is no intr_start too. Let me cook the patchset.
> 
> FWIW it's not something I came up with.. But I can't fully recall the
> original finder. Maybe it was one of the MSM8996/MSM8998/SDM845-mainline
> contributors? It was difficult to find, so I'd like to credit the author
> but I'm afraid I can't find it..

For now I credited Alexey for his email earlier in this thread.

-- 
With best wishes
Dmitry

