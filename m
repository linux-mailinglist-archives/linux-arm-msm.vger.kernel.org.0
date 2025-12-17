Return-Path: <linux-arm-msm+bounces-85570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2BACC8D65
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 17:44:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66266301A1DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 16:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4DFD34A3C9;
	Wed, 17 Dec 2025 16:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CYDtl8HT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bsb85ZuY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC91345759
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765989286; cv=none; b=cRFBL4YAUCMzx03A6QiXP1lJXGT5GCpBPhw56j9D3r5kCyErlfZSgKRsY2XOi0gWVnSmOWNMevayrLoknbsadhHVQqVn8jvwcIIL8c9KPmypRyKQfMupFh4kKCVYUcsK4IXtTUngyfIsYMNzHAlAVYODvG4Hfwenkj6uSH4O/Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765989286; c=relaxed/simple;
	bh=b+d6o7PIy88Nf8fMsJvNdIh5oqps9OqiSSI9SYHnDd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B7E6RX0bKu2UWV9sO0D5L29MaViaXl3JOHPySbz0D6MPtkbk/2+GAkKBCWki0eT5eIB5fy3ZvIPNIET4uPqop71N/B2ZkA/GcnJDHol3Hs5mFeN3UKFtj3yBy70u7iL5g98hyHaukxjxNKF5AELrCjlEozH6x3cO0IcdrPcupZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CYDtl8HT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bsb85ZuY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKoH43329736
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:34:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EoS2/SEtxcfOVm1nycVOUKsk
	ylsoggbceMpNDql009E=; b=CYDtl8HTW6hJG3zMzleDv/pNLNdGlHA82rjbwhvZ
	SEwQIiBvdo83E5GzBE4lzRK+sAyqJvnXznZTa70si/4Fj10YAL4bC+1ewfakpj8t
	eVoSLkiFKMgam4IXhjRXKAqXjHh4SMOwosdesGpLET0hZRLqTzUVgipgUAeSCS21
	xNC+n2gVtljXXpe60jJ61BcEdeqF40Sm0lEoF4hqZF4xzVTJ8ilewVEpDFKCIGEC
	2oJ/5M9xz74h5JZHLM+uvCPtjrchhflUp1/Or0TKLUm1kV62D+2KSG6kp8so9aql
	yG3CrqXo7vtSLtMNwT6d4xCYym1XQxpKdyLWS7jRqKdF1w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3nkkj95t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:34:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee27e24711so105881891cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 08:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765989283; x=1766594083; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EoS2/SEtxcfOVm1nycVOUKskylsoggbceMpNDql009E=;
        b=bsb85ZuYMz+62AdlgfXMAvDBQXNS5MOjpbd6JMz2gvfUekPcAGYvkle2r0eNdwuGg9
         ThOBv3vn+8PocUhBxkpTSb3hMNVyrQWvHpXztC8wUufzMSoFSlb0H/WDgYnESezrq4YV
         n6sG1mpKnTB0wXTDhzIGklH/2N49F5oEsuEqH5HgHI1+XxYFmmyehm5B9mBpY2qObcpt
         EQYgcoZkSEYod8vbDD0UQ3ZafTzvVQjtqfP7dRJMuReT1pMLj8jUVZH7Ad9guv4nQVMW
         t541oDRewqbuVszGZjrIRcVu0OnjQu0Q5OJ91nA274oxFdIrtX/EEvAxynbnG1t2bw1M
         /fMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765989283; x=1766594083;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EoS2/SEtxcfOVm1nycVOUKskylsoggbceMpNDql009E=;
        b=dbl/WekNDsKVY+1y02kWeCo6okkwc4xtoxWVYdLp5z4U9ZKjGUrn51P6ZVkNRpElLI
         W6MzwFGRf2hBF6IWmHFJ/zFDs5DPE20nngrsJeRKGDg6DmVB22k/sC+eTy4TzUg1q0rU
         ZnYbRLj7H8YwKYBr+ZdJNeAN+F5CqYMeYguq51nIJgSPoqy7dLB7tsj4qo0LT6QIgxxQ
         XLAwCuMuJF5NNs8rcFjCKy5ce0pRzahj02jikZk2b349viWGntto6igWrQ5jx0jQ0FmN
         BhqBkNrA5hbCLpcyrwTeHR0DNkQ+i2qzQhISQz7mx66dfWFJacygO6k5/dA6uNJSR0Tu
         Dw2w==
X-Forwarded-Encrypted: i=1; AJvYcCUiGSuipGQhmTsXzf8UtMmhB2LM1lCMRRY/mQjtvY5ASllIkAv9+hwx9SilpR6mHkpeoUPXW8uU+uxfzMoR@vger.kernel.org
X-Gm-Message-State: AOJu0YzYzMJgYlDLfiE7Tv6hp4oWcha9XWKjGGxb914z4zXlLuQMYe8o
	BlpNi7b4we/CW9hByRZCF4F4KiSeu6XfHPewt8VpwFviWK23l3kw4L7yrSDIYwL5AIV19G54tMg
	IuFpmrAH7PZGRHuaywHv+WpwCL1rCcK0e4SWFMyav6O9U5JCEglCyvIFKzaAzicLsIJXA
X-Gm-Gg: AY/fxX455G9pY77HtJCosbvTjrO+dzo3JJKsytxLOI8eoFwBdRl9bgtN6RGlGtb4Lbr
	uopadkKp+DHjsu1KL+Wfq7gKUsoxvqQZJxxSMkOnS0fhicwsC4PO4mQlnoW28n/zUmF7Jxz42eU
	5QvXbcLVoEtgKgRTidwulea4nq2BRIKrO9PAu2Qe9+vVZY8dJeeSdEUGhhSU1ZyRehfj4H904Co
	pa9gkfkvhq7DFAp3fI75pYzul7qtdeikgC0jIq+KdChtHvsqJ2K3Lj9bDxOTSTO/0Ohfoweb0Vl
	bCPBVKFfrn7CgAkV02yrzCpzSe2sFzCNYjFdLJRNB53CQGHrQ6He3SgzfDJOFCME6lB7gQHJuld
	qG9wkxWIjTMiimGHPwiJEgTOOlf8RiEygD8xfVWwL/jOcY5QSZH/W0+urFM5kZsSx3ePVJwXhXg
	x2SevU5Yaverrh6yHGxX1EOIU=
X-Received: by 2002:a05:622a:a18:b0:4f1:c72b:284a with SMTP id d75a77b69052e-4f1d049ff8cmr220756101cf.15.1765989283257;
        Wed, 17 Dec 2025 08:34:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsAAJHwqxmftk+OQ1zGcEv9EePgWku3/QTaYBqJtm4eCKo2EQ/iMJ21n1xekg/vIL0bnve2g==
X-Received: by 2002:a05:622a:a18:b0:4f1:c72b:284a with SMTP id d75a77b69052e-4f1d049ff8cmr220755741cf.15.1765989282670;
        Wed, 17 Dec 2025 08:34:42 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5990da5dcd1sm2503254e87.81.2025.12.17.08.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:34:41 -0800 (PST)
Date: Wed, 17 Dec 2025 18:34:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Paul Sajna <sajattack@postmarketos.org>,
        barnabas.czeman@mainlining.org
Subject: Re: [PATCH] drm/msm/mdp5: drop support for MSM8998, SDM630 and SDM660
Message-ID: <dcapydafye2v6owrkehngivqlucjcx6aa3sszszflh3ocm7dpq@qsajm2qkc52d>
References: <20251211-mdp5-drop-dpu3-v1-1-0a0186d92757@oss.qualcomm.com>
 <8e1d33ff-d902-4ae9-9162-e00d17a5e6d1@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e1d33ff-d902-4ae9-9162-e00d17a5e6d1@postmarketos.org>
X-Proofpoint-GUID: c5ImXFf-s8uexxxFHi_NeC9mUsRD0ugX
X-Proofpoint-ORIG-GUID: c5ImXFf-s8uexxxFHi_NeC9mUsRD0ugX
X-Authority-Analysis: v=2.4 cv=f/RFxeyM c=1 sm=1 tr=0 ts=6942dba4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=jsZ3alcmfn4h52Hz5qMA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEzMSBTYWx0ZWRfX7koPZm9uzOcy
 82PlmAVyd3aQYR/ftPHQR/AcnOcJ05VWvvHfEYcKU8Q4DWcSSderOIfqAlhKMsqVGaWaUAIuXid
 TzWAFvcM7aisKfzPEa4YzlrEmJwQboOEQg5ui+n/la+s8AfPYHNILoFHbrcoSdyTL/6KoeKH91D
 pLYdP4aGd5BsuWCm/gD3R3e7J+cb643coIqmC3W4FmcXEuWzVubepT6jq1QhwECQ1Y7cNQVqFOl
 9qaHa3ZiSre1bhLKusWsLtjh+8N6YzzLriOvayICM6C7Gi1UGEFOclvUo4YRQu7czV5kt/qP0bL
 lFoBYH2yY1EEEupPIupyOm6Ga9zVCEhWq6hb60IO1weYyHoiE5cr7w7RvWvVzbnZI8vkoG1A/DU
 l3eJNdEEWvuk5kIfqnpdnADGQaY95A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170131

On Wed, Dec 17, 2025 at 06:05:31PM +0300, Alexey Minnekhanov wrote:
> On 11.12.2025 04:25, Dmitry Baryshkov wrote:
> > Currently MDP5 3.x (MSM8998, SDM630 and SDM660) platforms are support
> > by both DPU and MDP5 drivers. Support for them in the DPU driver is
> > mature enough, so it's no longer sensible to keep them enabled in the
> > MDP5 driver. Not to mention that MSM8998 never used an MDP5 compatible
> > string. Drop support for the MDP5 3.x genration inside the MDP5
> > driver and migrate those to the DPU driver only.
> > 
> > Note: this will break if one uses the DT generated before v6.3 as they
> > had only the generic, "qcom,mdp5" compatible string for SDM630 and
> > SDM660. However granted that we had two LTS releases inbetween I don't
> > think it is an issue.
> > 
> 
> I've retested DPU driver on our downstream release based on 6.18 (by
> using msm.prefer_mdp5=false kernel cmdline parameter) on all devices
> at my disposal, and I can confirm DPU driver working fine an all SDM660,
> SDM636 ones, but not on SDM630. Some logs from sdm630-sony-nile-pioneer
> (Sony Xperia XA2):

Unfortunately I only have SDM660 and video DSI usecase here. BTW: is
your SDM636 / SDM660 using CMD or video panel?

> 
> [    2.356546] msm_dpu c901000.display-controller: bound c994000.dsi (ops
> dsi_ops [msm])
> [    2.357328] adreno 5000000.gpu: GPU speedbin fuse 146 (0x92), mapped to
> opp-supp-hw 0x4
> [    2.364802] msm_dpu c901000.display-controller: bound 5000000.gpu (ops
> a3xx_ops [msm])
> [    2.444649] [drm:dpu_kms_hw_init:1173] dpu hardware revision:0x30030000
> [    2.449793] [drm] Initialized msm 1.13.0 for c901000.display-controller
> on minor 1
> ...
> [    2.911900] [drm:_dpu_encoder_phys_cmd_wait_for_ctl_start:654] [dpu
> error]enc33 intf1 ctl start interrupt wait failed
> [    2.911916] [drm:dpu_kms_wait_for_commit_done:525] [dpu error]wait for
> commit done returned -22
> ...
> [    3.176171] [drm:_dpu_encoder_phys_cmd_wait_for_ctl_start:654] [dpu
> error]enc33 intf1 ctl start interrupt wait failed
> [    3.176367] [drm:dpu_kms_wait_for_commit_done:525] [dpu error]wait for
> commit done returned -22
> 
> Which results in horrendous ~3-5 fps in shell.
> 
> The block "enc33 intf1 ctl start interrupt wait failed" + "wait for
> commit done returned -22" is repeated few times per second whenever
> the display is turned on, and stops when it's turned off.
> 
> Meanwhile it is working fine using MDP5 driver (msm.prefer_mdp5=true).

It's interesting. Would you please capture the devcoredump for the
platform? There will be a lot of blocks, I'm interested in INTF_1, CTL
and top_0.

Also, as a debugging check, would you mind patching
dpu_encoder_phys_cmd_wait_for_commit_done() so that it always calls
dpu_encoder_phys_cmd_wait_for_tx_complete()? I will check if there are
any differences for CTL_START and similar registers, but it will take
some time.

> Well, as fine as possible considering [1], using several FD_MESA_DEBUG
> tricks to work around GPU issues.
> 
> P.S. I have not yet tested MSM8998, but I can try if required

As far as I remember, MDP5 on MSM8998 has never been wired (as in never
committed to the DTSI). Angelo has enabled and Freebox people have
tested DPU on MSM8998, but I think it was limited to video / HDMI
usecases.

> 
> [1] https://gitlab.freedesktop.org/mesa/mesa/-/issues/8442
> 
> --
> Regards,
> Alexey Minnekhanov

-- 
With best wishes
Dmitry

