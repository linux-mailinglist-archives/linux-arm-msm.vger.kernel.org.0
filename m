Return-Path: <linux-arm-msm+bounces-88442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE14D107CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 04:31:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6109D303C238
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 03:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC6BB2264C9;
	Mon, 12 Jan 2026 03:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UrLBmvBD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TRrHl9pi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BB81E5734
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 03:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768188671; cv=none; b=TiJDBfjnLfKoZVkW+Msaazb6o3sVlgOvd41EbaHBMDvOjs+hU9Vp5+7cIXqjLiO96eVtnCBVS7v7c4+LUJ1xO9vIItxSY6CBDulkmBMhr4yCB1REe16k8RCR02qO1RkXJsvpNwT6pDL9kpxRjiFHs7d+AnuuzimfTjUxoSZvRDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768188671; c=relaxed/simple;
	bh=hXzQoF956YOpuypOsmLTgZBiovv1ICKbYwszqy7A2xs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tWk4ZrMhtAL7JYGrAi21Si0+NPeDZszy9DDxndnmpnMOJxvMmdFGacpYur53k/g1Re9KyilRb5+PsQ+YWTTGYVT5L0B1cUFdt4u3YSVB1IQrqtdepHVA+udZXaCFlcS9OLBEA8CHUMe3b3ounZx8TTWqECTwVew35r+C0fxGihw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UrLBmvBD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TRrHl9pi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BMbGA04024750
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 03:31:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nwTPguPrpmiXRmw7m/cNINqZ
	6SyBciSjbwBSLvsVGNk=; b=UrLBmvBDsMTUQ5+eOmDL6kPUBCsCrVFjm+7Z7eg4
	I/30jv11hUMNYYRPXAextkx2CYlfrYbbDVUu9LpdpFYw4z9YvQjnJQEFOuXdqm9I
	Hl0Yspc3v2KhqjTzi45FF0T7SDm39ohFhOy2pGSLMujafIK3d/OqfDelF4P+ZUgP
	Wg4YbZA1kYHq4F6g+jREnKjKnx9+CSERQFDJrZ7IL8vbmvBAPr0l8mhxq2lemzyf
	ScKrrrmwmuiGJBIME80gYvH9teiyo4jKwql+R3vh00o+VZknslMmC2zG5h7wZOtG
	PeAOkOFVurGg/xfujFX/jZrJvLu1zEt5pB6PQgASWUGhtg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkfhaka1t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 03:31:09 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-890805821c0so195035356d6.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 19:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768188668; x=1768793468; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nwTPguPrpmiXRmw7m/cNINqZ6SyBciSjbwBSLvsVGNk=;
        b=TRrHl9piMF72yDknTN4XVDEhLFF7jLusLfQB4zZbjCG1sZWP0VCIdQpEdMCDtvLlXP
         spNi0P1H9xwGQFk1JmdNkq1M2PLvSr3O70d+7zAr5kkJskTz3f4EpC0RYuizoHWZ6VY4
         F1KlybTE25+qzQklZ5EjttxJD4PpQhzNpePm5CXw+tuNXkWPcCvb9Lb10KBwJN5zy7P1
         b4foqYmZuJN6UPPrb4+9qQCShlpuZhLhd7Oci9yLGqdX39cTF5uppO5qHwRf69USylKG
         hq2IOSkG3I5lJISvm96WVDLhO+zSNbRHhcGQ90YSgCEuguNC4K9aLekAv2nzAx4gZNNZ
         9uCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768188668; x=1768793468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nwTPguPrpmiXRmw7m/cNINqZ6SyBciSjbwBSLvsVGNk=;
        b=FxwA0782kpfwiI4mzuDYX+hlmfjIPcH2llLVm31DOpVFsxCrTDQ0Aofxv1xkcendRn
         azAY6oAY6A99XnNxiOA0esISiK3brCcCygM0p3XW8dVcFyOgnaukv0/T9mv/Q3jZ0l+X
         UvKVwhYPhWGL7GbOqpD5Zy869k5cL5aL7i2xkIiDeng5RVLmIAsRritO14aitwwXlYok
         O1CJHQq2BBhxWjuhfBULBZAm89fuSkJxMHRh8AYnxc9aCVe5mHV+EO0YINfZ8V+UKGbB
         RZGA6bKXdWX5U0+N030s5Vt2Dq2FAz2+Ksxj3+YBSNPNg5veqdD66KZG0yAm7/nWsqIS
         yaUw==
X-Forwarded-Encrypted: i=1; AJvYcCULyKEUPPLfhAhcvtL9FdtZTxWSuYrnd3W9CKXDToBtEDdkPiV5NGhN92nI/8KPDROdL6D14Nsi/HHCRPlJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzUim+q8OVCqGJ6H6p3hnbOmY4mCImS4hHgMBwdeElEWf9Y8Zjl
	mifPJbF+L0ivm4moqJshsVQSqcatSV1COgEpfawGQ4A83llVHtg3MWfZ2mEkwWxxWDcq7mQ/Oby
	WiGH/thNgmuLkgVCLEmf9Qi0oNV99XkwUtOwPfOJ9RzqEkHkeN42CdKC1uujHAto7MhE/
X-Gm-Gg: AY/fxX4PAxNuCzmsaDn91iGZEY1hOg7XlKxxRTCN2PC0cOm68gRwRbJJ0bDAM6kLXRj
	upy8HCvAIV3+fyKndARIoYmH4fNL7uV4mY3d5WiNmqctRLSqdlSrpotVHvQ6QX3Ff9NWC8SCEkO
	bR8VX/BzXnljNHCUGJr5L8LCC0scvl6KiDKblM91xo8LCphFhe0ZngxhNqCuXO3i/QA4eqvubmL
	MM95LoKmb5P9pUYhX8bcxGWitE/kn8eZ5Xj26Apn3JLn8iqmDJi6X2sWtUhIBzFYZUEvSsvVe85
	mZqd4RbhQE2Y6mJm+lv8+1usjRvH6ZM7G4v9MXsn1Eut2OMw4NWceiuTktyDux1IvqMJn+KBlyD
	AD+biXRAu1kLcaxnlbk7swwTe1MhmmfvyGhv3poK5Tm/TxzZ7Ky+LbemNXUyrPzKWl2gnJ4w=
X-Received: by 2002:a05:6214:c2e:b0:888:4930:82ab with SMTP id 6a1803df08f44-890842dd44emr259160576d6.71.1768188668552;
        Sun, 11 Jan 2026 19:31:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0EmdAXthpRDVwaBUjY3AWOzWji71FlmH/kjQtB6Q1Zdj0JN4HNSWEEUPjVTizHHWbaf8EBg==
X-Received: by 2002:a05:6214:c2e:b0:888:4930:82ab with SMTP id 6a1803df08f44-890842dd44emr259160406d6.71.1768188668135;
        Sun, 11 Jan 2026 19:31:08 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770cc7b1sm127049726d6.5.2026.01.11.19.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 19:31:07 -0800 (PST)
Date: Mon, 12 Jan 2026 11:30:59 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, krzysztof.kozlowski@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 1/2] drm/msm/dpu: fix mismatch between power and frequency
Message-ID: <aWRq8wDjtj015kq1@yuanjiey.ap.qualcomm.com>
References: <20260109083808.1047-1-yuanjie.yang@oss.qualcomm.com>
 <20260109083808.1047-2-yuanjie.yang@oss.qualcomm.com>
 <dc16d4f8-21a3-42f9-95e6-c508311268c2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc16d4f8-21a3-42f9-95e6-c508311268c2@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 2eyIjnWmczvh3QnSVMSmVFQeZVnxUGQy
X-Authority-Analysis: v=2.4 cv=bOEb4f+Z c=1 sm=1 tr=0 ts=69646afd cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=BS6H7PxNumziHjRwYM4A:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: 2eyIjnWmczvh3QnSVMSmVFQeZVnxUGQy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDAyNyBTYWx0ZWRfX0oXzQY3Tjr2L
 rUFpIjsMXgOwSzYa+yuSKTU07GI2r2CamWBKncI2lD8BYJymqEnP6kJwgiXQL8YxJfAezB9YHea
 ovbVwFwWPhuXcuH5wcIjJG2Ye6BkvEMhIPW4cfvsVVHXhDCuJ/7+11yk//RWQjb1CrTLoTaAMRb
 jCZbtZw4uD5wK2/Jo5q6BW++wTe+aHrzTmSa6kwxtoxZOPvRrW3T9IWrnlP6FlMyI4k/XIWXNvz
 vBhkWMgXTEIr12nugZ+LBl42EV9yYjQAxEpL6Cu2W/AVLjUQbjtiYVANsIleJt1cUzKEv2eNfTj
 0G6tKH/3nt0S+g6PpCP6y5PGxqmMpktoyj4/PvduMtX4JzVJNfGNflFvIeDxnTBdz89CpunG39q
 Q09sa90yGnsiGGygzZIaRiiE8RPTmU523zqqLYSqQCiEUpdo3jVAEb2OBTf+KMlwW8I9wTlHtRq
 aKkAij4E5sD8Bz+al2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_09,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120027

On Fri, Jan 09, 2026 at 11:44:48AM +0100, Konrad Dybcio wrote:
> On 1/9/26 9:38 AM, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > During DPU runtime suspend, calling dev_pm_opp_set_rate(dev, 0) drops
> > the MMCX rail to MIN_SVS while the core clock frequency remains at its
> > original (highest) rate. When runtime resume re-enables the clock, this
> > may result in a mismatch between the rail voltage and the clock rate.
> > 
> > For example, in the DPU bind path, the sequence could be:
> >   cpu0: dev_sync_state -> rpmhpd_sync_state
> >   cpu1:                                     dpu_kms_hw_init
> > timeline 0 ------------------------------------------------> t
> > 
> > After rpmhpd_sync_state, the voltage performance is no longer guaranteed
> > to stay at the highest level. During dpu_kms_hw_init, calling
> > dev_pm_opp_set_rate(dev, 0) drops the voltage, causing the MMCX rail to
> > fall to MIN_SVS while the core clock is still at its maximum frequency.
> > When the power is re-enabled, only the clock is enabled, leading to a
> > situation where the MMCX rail is at MIN_SVS but the core clock is at its
> > highest rate. In this state, the rail cannot sustain the clock rate,
> > which may cause instability or system crash.
> 
> So what this message essentially says is that dev_pm_opp_set_rate(dev, 0)
> doesn't actually set the rate of "0" (or any other rate, unless opp-level
> is at play), nor does it disable the clock.
> 
> Seems like a couple of our drivers make this oversight..
> 
> I see that originally calling dev_pm_opp_set_rate(dev, 0) was forbidden,
> up until Commit cd7ea582866f ("opp: Make dev_pm_opp_set_rate() handle freq
> = 0 to drop performance votes")..
> 
> In fact,
> 
> $ rg 'dev_pm_opp_set_rate\(.*, 0\)'
> 
> returns exclusively Qualcomm drivers where I believe the intention is always
> to disable the clock.. perhaps we should just do that instead. We don't have
> to worry about setting F_MIN beforehand, because a disabled clock won't be
> eating up power and when enabling it back up, calling opp_set_rate with a
> non-zero frequency will bring back the rails to a suitable level

Yes, calling opp_set_rate with a non-zero frequency will bring back 
the rails to a suitable level. The other steps are unnecessary.

And here I just choose the highest freq, because I see 
dpu binding patch:
dpu_kms_init(struct drm_device *ddev) use highest freq to do initialization. 

I want to keep it consistent with the previous initialization logic.

Thanks,
Yuanjie

> 
> Konrad

