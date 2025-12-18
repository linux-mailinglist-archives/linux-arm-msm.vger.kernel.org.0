Return-Path: <linux-arm-msm+bounces-85701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6EECCC26F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 15:00:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7A0F830868BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 13:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F1E333F8A0;
	Thu, 18 Dec 2025 13:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ObAwvppY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WqljbYiM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A159D33F393
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 13:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766065785; cv=none; b=nX+vAu4uJc2vytmTbBwXlj0LWy/Bm9QKOgQTZqmtSblNfWr22wXD+NgAGeYtTwDM36Ys3NUXLeGl4wBZl5eSss8K/gtYR4WVne9ZBlNY6M+CxtwJhowh8SZ5T8H8ul5l8wXmo6j4LsUCFcNcykt2DStIXlZ+adSwk1siiUcyprU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766065785; c=relaxed/simple;
	bh=umm8TI6XmXJRr935/n6ou9XPSVR5PFpzTHbJButiwwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YRFa2HonMG5m21OdYtcmYLyXtlDH4NCq+AgsIx+0HEAvyiwBQ9NjQOk9SK6juW66KC9dgPu23cc+kuXAbtZlZ22bb273AvFyhDTXIuv1Qv8tu5S3790HWdG46uX1xZOr6sb5UVImmNUAidrLQA1EJsSGinI8ptiVcFGNz9vipNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ObAwvppY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WqljbYiM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI8phRD174282
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 13:49:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=445Eu5duRxZZ2Z2+iNHrIZvn
	vItlkOkEEhrbBxq/R3w=; b=ObAwvppYV8TDO379X3NuiD3D0WLk9a4qZDvNf+th
	//iCttlqRrdFt9WFxDg5E5R71nMjUoTY9j0KYkOdE6sPrEoycBos5Z3pxI2RbcWe
	eUrPT7/AyIAJNKbLrUIH4oO/RVw+brXFSocVNXZLkwic9d/UcrMwyLySbIwsfpsN
	K5w6EISraM5Nrll9BekwugPAixD5fuwNFEJM9/rJsEV33dZU4ArtXIeV1EIIsKRt
	NkZ7+ioBSPi38oftci0Pj/KPz13UxpDPQeMrYMoEaF3i/rC1S66f4jDdmFh+81Xt
	N0Zlq8kAPM2SlN55YGk6lbXGUW0sNxxtK68eC6h+zyvJFA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b43nmtu9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 13:49:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4edad69b4e8so12639281cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 05:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766065781; x=1766670581; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=445Eu5duRxZZ2Z2+iNHrIZvnvItlkOkEEhrbBxq/R3w=;
        b=WqljbYiMte2DeYWnq1PVtDMr9YOVcsnNVxwEfwE6eOeKLZvsdGjhmivv1JTGOx+YWl
         3z0cEtKVa8qzURJO8FmGNiOye1/nxai7zcIIShZCjflDLjJRKeMUKaszzF/8L6CAcSA2
         j75dcfVMXJqtCA0yCEZLll1i5T0YRGIOG8DrICsug2BKwloie3W3qqN3ZlJRAbs3LrEb
         BDmCMx+V4C7Ng2H8LKAJOUIOQFiK0yXSiWUluSZz8/4dOjeGZYo/cfjVkyB3+zNBOY6/
         ai0nmtq+IonUeBNU1Jht4663fHBedgd1ey78QLAi1ejW167Qat7kL/7UMALTwVmlABr4
         ex1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766065781; x=1766670581;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=445Eu5duRxZZ2Z2+iNHrIZvnvItlkOkEEhrbBxq/R3w=;
        b=pqpeLIUZbouauO174HY9q5KIsS3P4IjhWHzMESsjVJfSsn5QxLAaieojb+VHUX1M9G
         DoTvabatOPymKHImzX8jynpKoQ0vFts5sCog7sqy2wKjhtw5Zv0DvOL06Wiir/ROrrHd
         AWKd7gL3B219w8VCCpghYz9cWY9gg0CLlQedynKlJ9Jxf1xKutYph22/FoM/kzD6ktLI
         UkA1rUSuiCbMzv8+ra68IFP3ybKoVWd/zvWTLM8tSbG2sfgbpkIE67oSPAUBHfgcC+rM
         0OfdEK0s4iXX1ahoOGmgNEBEqePA5q/UT4CBK4wFEI57dm4MIMeBnAwfMskm6QS6y2cD
         EMTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSsP4Zhjf4r5tLTxWu7yi2LticdcySyDyi6l7EpbRgyjFfCwTTUlPvOUwYlwpj8XDj4zqvOwFuWwgjUff2@vger.kernel.org
X-Gm-Message-State: AOJu0YzeiBBK4A9zBhLhIIl1GBXgtya0DaqYSdtz4Z9+SFr684QqIeYO
	dxyACPwYGd+TKuYvKSRmx1yy8dB8yF0SJ9j7dSDGqmnMT20lf0/jEzw/ER6wA+4IXAa1tpjnQuG
	3FNYyut+mXLyRDljsJkj2ZFLfcxpUmFQtvXW+9/XNv+qFqIYuXinCf87KgOw0WuaAmCYK
X-Gm-Gg: AY/fxX5ZE/HUS4TE8WvF6XMHzuKmHnJvm8fO954BjzvULb7ZxigW1GnmKnm+Piin1DM
	kGUwblAFnhbOvMe2O2mSu7+e5okgY1OJ9joIAB3w7Dv9gpd9uFKT8fZIjdoZEDjoOkIQjcMjYw7
	uooGiW9Mfb446YQusGObHxkBW5+AB2MCW248fG9zjzDuIxo5pfY3OMCd5K+X46eSl83k8Cb1H7L
	WfkP9iJmZYX5J6xd3fAwIfMp5LdX+Oe+KV05mlcU7bezbzTPjjB0kEAUetaPbwEtCEqgZJFcdy0
	J1K+ymQAA15xu7LmJFl+Qi6LcOzWO20XnxGKuy2ij8IdxDjL7kOjktGT2PrpHFgCLgSJuBLlejl
	NGOm9OOMOxTXL3a+qa4CVj87hBhgqSVzayJvb+cNwBpRddPKI9iZ5n4IfV5mPMS3TBT9oW80eBH
	sDv7WufVnk6U4nWyRrisdT9EI=
X-Received: by 2002:ac8:7dc6:0:b0:4f1:8412:46e2 with SMTP id d75a77b69052e-4f35f45578bmr49489151cf.29.1766065781318;
        Thu, 18 Dec 2025 05:49:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4SSTdlfiBcgtQ/sTaTy0ysl/PcwJDZMzMlU9COTYmy0R43ZsOc1KqN592StzDqEnGdb2NVQ==
X-Received: by 2002:ac8:7dc6:0:b0:4f1:8412:46e2 with SMTP id d75a77b69052e-4f35f45578bmr49488851cf.29.1766065780861;
        Thu, 18 Dec 2025 05:49:40 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-381136e2c55sm10176481fa.30.2025.12.18.05.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 05:49:40 -0800 (PST)
Date: Thu, 18 Dec 2025 15:49:38 +0200
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
Message-ID: <7dcs7n4pbdhmm4ujgqnek4setujzqxhkdsf3tuf4ggymajj3rj@xzapix7ujzr6>
References: <20251211-mdp5-drop-dpu3-v1-1-0a0186d92757@oss.qualcomm.com>
 <8e1d33ff-d902-4ae9-9162-e00d17a5e6d1@postmarketos.org>
 <dcapydafye2v6owrkehngivqlucjcx6aa3sszszflh3ocm7dpq@qsajm2qkc52d>
 <24f29ff0-99d0-4175-a6c9-f402ce99f645@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24f29ff0-99d0-4175-a6c9-f402ce99f645@oss.qualcomm.com>
X-Proofpoint-GUID: uoT5KJPivIMOqs1e_-YupziOUh0RVO3J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDExNCBTYWx0ZWRfX0Hm35gWuJzF+
 CC3Lpyk/I3m1rpKO1lyl+cACjaakAA72Exf1kOveJLOnc5sIzDMVpgVEIZ8Y/hqaatRh3ZZ5lGE
 TWEyJw2uVRwiBsG7s3MIvyLQKjL8uhfNl48WXkh/zeo3CGuzrdo2PgyZllxzF9l2jvzuxOI2VIK
 hPKqxnCS4maLYG7HNGBG1hmwTXHRJ7qKYs92wyZ8Vm60sUW8lAeR6D3ja1iJLeqIb3gw4SWDUKV
 MPzG+BPslaAhDu/cMA/6duR/hd4AFaMPaKIU2h3au04d2hY/80C25PJ1+JoTKvgVfmOr1meRsXZ
 DEJbc1bAJ8xSQ1WqzC+PeCas4n9SWU963tRxnCvLnvle05kUX8jqMuEGJR5m8a9r7/cEgB9FEtk
 h3ZRSvUPmxJpaId5A/w/08x/LIt9mA==
X-Proofpoint-ORIG-GUID: uoT5KJPivIMOqs1e_-YupziOUh0RVO3J
X-Authority-Analysis: v=2.4 cv=A6Zh/qWG c=1 sm=1 tr=0 ts=69440676 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=Q4OzpPgPSF-fUoI1-2YA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180114

On Thu, Dec 18, 2025 at 12:23:49PM +0100, Konrad Dybcio wrote:
> On 12/17/25 5:34 PM, Dmitry Baryshkov wrote:
> > On Wed, Dec 17, 2025 at 06:05:31PM +0300, Alexey Minnekhanov wrote:
> >> On 11.12.2025 04:25, Dmitry Baryshkov wrote:
> >>> Currently MDP5 3.x (MSM8998, SDM630 and SDM660) platforms are support
> >>> by both DPU and MDP5 drivers. Support for them in the DPU driver is
> >>> mature enough, so it's no longer sensible to keep them enabled in the
> >>> MDP5 driver. Not to mention that MSM8998 never used an MDP5 compatible
> >>> string. Drop support for the MDP5 3.x genration inside the MDP5
> >>> driver and migrate those to the DPU driver only.
> >>>
> >>> Note: this will break if one uses the DT generated before v6.3 as they
> >>> had only the generic, "qcom,mdp5" compatible string for SDM630 and
> >>> SDM660. However granted that we had two LTS releases inbetween I don't
> >>> think it is an issue.
> >>>
> >>
> >> I've retested DPU driver on our downstream release based on 6.18 (by
> >> using msm.prefer_mdp5=false kernel cmdline parameter) on all devices
> >> at my disposal, and I can confirm DPU driver working fine an all SDM660,
> >> SDM636 ones, but not on SDM630. Some logs from sdm630-sony-nile-pioneer
> >> (Sony Xperia XA2):
> > 
> > Unfortunately I only have SDM660 and video DSI usecase here. BTW: is
> > your SDM636 / SDM660 using CMD or video panel?
> > 
> >>
> >> [    2.356546] msm_dpu c901000.display-controller: bound c994000.dsi (ops
> >> dsi_ops [msm])
> >> [    2.357328] adreno 5000000.gpu: GPU speedbin fuse 146 (0x92), mapped to
> >> opp-supp-hw 0x4
> >> [    2.364802] msm_dpu c901000.display-controller: bound 5000000.gpu (ops
> >> a3xx_ops [msm])
> >> [    2.444649] [drm:dpu_kms_hw_init:1173] dpu hardware revision:0x30030000
> >> [    2.449793] [drm] Initialized msm 1.13.0 for c901000.display-controller
> >> on minor 1
> >> ...
> >> [    2.911900] [drm:_dpu_encoder_phys_cmd_wait_for_ctl_start:654] [dpu
> >> error]enc33 intf1 ctl start interrupt wait failed
> >> [    2.911916] [drm:dpu_kms_wait_for_commit_done:525] [dpu error]wait for
> >> commit done returned -22
> >> ...
> >> [    3.176171] [drm:_dpu_encoder_phys_cmd_wait_for_ctl_start:654] [dpu
> >> error]enc33 intf1 ctl start interrupt wait failed
> >> [    3.176367] [drm:dpu_kms_wait_for_commit_done:525] [dpu error]wait for
> >> commit done returned -22
> >>
> >> Which results in horrendous ~3-5 fps in shell.
> >>
> >> The block "enc33 intf1 ctl start interrupt wait failed" + "wait for
> >> commit done returned -22" is repeated few times per second whenever
> >> the display is turned on, and stops when it's turned off.
> >>
> >> Meanwhile it is working fine using MDP5 driver (msm.prefer_mdp5=true).
> > 
> > It's interesting. Would you please capture the devcoredump for the
> > platform? There will be a lot of blocks, I'm interested in INTF_1, CTL
> > and top_0.
> > 
> > Also, as a debugging check, would you mind patching
> > dpu_encoder_phys_cmd_wait_for_commit_done() so that it always calls
> > dpu_encoder_phys_cmd_wait_for_tx_complete()? I will check if there are
> > any differences for CTL_START and similar registers, but it will take
> > some time.
> > 
> >> Well, as fine as possible considering [1], using several FD_MESA_DEBUG
> >> tricks to work around GPU issues.
> >>
> >> P.S. I have not yet tested MSM8998, but I can try if required
> > 
> > As far as I remember, MDP5 on MSM8998 has never been wired (as in never
> > committed to the DTSI). Angelo has enabled and Freebox people have
> > tested DPU on MSM8998, but I think it was limited to video / HDMI
> > usecases.
> 
> I think we poked at both, back in the day (tm) and DPU worked on msm8998-
> sony-maple (sharp,ls055d1sx04 cmd mode panel) with the funny CMD mode hack
> (due to a register field not existing on <845?)
> 
> https://github.com/SoMainline/linux/commit/14e0517e2fd5eee116a32db624b09856c60fa022

Ok, so my guess was correct and CTL_START is not present there. Checking
the regmaps, there is no intr_start too. Let me cook the patchset.

> 
> FYI panel wiring:
> 
> https://github.com/SoMainline/linux/commit/88f276e81cea0f7496d3f92cd731f27615cfa703
> 
> +Marijn may know more
> 
> Konrad

-- 
With best wishes
Dmitry

