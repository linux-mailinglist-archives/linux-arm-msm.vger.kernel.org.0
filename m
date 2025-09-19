Return-Path: <linux-arm-msm+bounces-74190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0845CB89C5A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 16:01:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85FB81B27464
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 14:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FF3B2561AA;
	Fri, 19 Sep 2025 14:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fGxSeqpS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA2024BCE8
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 14:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758290440; cv=none; b=ta4q+KAKLaptOLlqLn6KL2c4VB8jube06jOs+PzvUU6uoJe0/jyvBF7Mt2iP5olumDdsXv2evv9qCTHePJThlMTGxUJqhrCXf6M1IwzG9Xl79fbDIfl01sbailnP7Sp90ZOm24xRF24a8prjnsx0hpAOYgNWompjA/pGz96JQOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758290440; c=relaxed/simple;
	bh=s+x6YRVA3rP2U+0OWL3dZKVfEgPXTUVuxhw8PdG1p7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UzXZ1GgzEWC5xeQGsF3uX8LrlknsKOnVi42K2Syiq+zjD7fNU0ck8B57JBE2S4t2sWnlwNBuC+roJrg0qlHitzHXCJ7bRotKg8L2OmcN+u/Bo0HcUnAqbj5LxcXSKEUN8ySGA9m3vOl2R0nx8JxcCMDUw48+BRdy0GWFt0y/Qp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fGxSeqpS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58J6ehH5018300
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 14:00:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7EIANb89BEomf1uEkm62rAj8
	IzdbVNBDry3TfdecrUM=; b=fGxSeqpS6zzRfyopulFiN0+AViqQKn3QQdLuREIL
	ExHu8BU8p74k4tWb1IxOHXfHGu8T51wjbUVMgod/8PzwPf7QLzYQ/9oMQSlo4Ohf
	sTXwdxlEzLIfIYWIc9jXNaLeJOFGOeGeGOrd2IJtnylix5IDnpqkGS9ZQZvm7CKd
	FaOdvE7e5FrAIwFSPx8MVZqpjCORnDqH343dtAfOIG5OJaDZwJq+GE9anU3Pjg8f
	+/XtBI2DpuMUpi4F4x8cxZgjIE4cipUg3gywAHHUpbi/rlKemaHe129WbVf0YZFa
	WpvkvrmLSWbdVheJm1HwsSFRWWpTiWM4VXd58jcbHrMYDg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxwjme6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 14:00:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b302991816so44078731cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 07:00:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758290435; x=1758895235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7EIANb89BEomf1uEkm62rAj8IzdbVNBDry3TfdecrUM=;
        b=uZLO/BdYSJIBTEt/V6BiXmukPNbbsvIDFoY25ap5Lq+HBlTnMOcWFFFUJOLHNbF4V6
         OiVz2BaB+xiN/GBWUsNSKP9TWCKYVhXPCLx/Xb3z+64AbkE6v/VmGKJWSB5QM4oS7HP0
         BP822ZdRDuF+s8HdraOW94Hk4DqHlF5CgLY6W7P4rzz2pJ06DPA33qICg1mx/6q6T0c8
         RTV4TEQN8EMaFMxT6YDVA/Jm+YLzjBtzeGkNibSguU2kkot4lsy74X58PT7bgJ9GSy2b
         cKDsbAiufrBnsLYotyvXfFZALLo+XoWgQ2yPTb/g5UGAJgZ4M9G1gGOx0iTsiGq2sZp6
         CnRg==
X-Forwarded-Encrypted: i=1; AJvYcCWO8C4xDEiq6XsK4QLMoLyziOEZ8HeKshcfqixxhicLYTY+oaXCfExey3MmK+NLQW3BpqbPev1zFuX7MmoL@vger.kernel.org
X-Gm-Message-State: AOJu0Yw//CxXrruC3wywYaiej0ReI1xE6QqhbPDsETIBQqGvEvb1gVWe
	ysm14vjz4MMBmnCiGpWW3sSKdZHtpiX/J987xwk7n57dT/4Wjyf+LjEfQcemydhQ+EEacF6DIu9
	auGfm4fhv8jhrubI5/w4qLDu02ywKHGuqg+sWElKpqLCGnIPLP9cMn9+dC/Mypb/+7Du1RkzPao
	9Q
X-Gm-Gg: ASbGnctIqHlupg6P7VrnJfsp9Ju7Z2E6+8PwMyqSVOsLXhf+m1Ph3oiRZUeBLutRxXT
	2HJ9V/oLrXdqoo3ONcXAKCfF6bhM2+GvhWzUyYBJ8Et93ScRrw8F2FE8bbn0dEKxFT87RHjoBgG
	pN2ElFYbqUUE7hHhJe9Wb9DuMTcwQcvO1+x7QVj8JypWGIu0ejUHQIbpwY83JNlR0HuzFc26Yg3
	ozrDlrlBfbxvk745T+43j1t4mri9LxX9w4hg8pGCVTpkc26G04oa2vZdzxO/dW3Wbw48p3fqPcm
	JETpJ3rY/OOH3AMy7nhUlre1X456P7U8TW8QE+Q/g3xWDOOGgB/yDR//8Jjji7arBfS1yB/w7LN
	SM4ig9AKiIHHTk9ME/wA7Kc8yru7zbvBzCbJuD8bL44NAYD2FCZdk
X-Received: by 2002:ad4:5c44:0:b0:796:db6:98cc with SMTP id 6a1803df08f44-79910ca57ffmr42013216d6.7.1758290434663;
        Fri, 19 Sep 2025 07:00:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJBm79dzokCKz3md6LUMuAK6nuYOgnP/+aPf8gv/Il1JnuRVh7uTmi1AvDr4P46BH80v9Hgg==
X-Received: by 2002:ad4:5c44:0:b0:796:db6:98cc with SMTP id 6a1803df08f44-79910ca57ffmr42008896d6.7.1758290431759;
        Fri, 19 Sep 2025 07:00:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5793b1a828esm1077242e87.115.2025.09.19.07.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 07:00:30 -0700 (PDT)
Date: Fri, 19 Sep 2025 17:00:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: linux-firmware@kernel.org,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: qcom: vpu: fix the firmware binary name for qcm6490
Message-ID: <zj2dreqyj7fnhiophdtevhuaohlpk3uoccrslkqt5wjt2jhiip@gqnasgvu7ipq>
References: <f5965570-9c49-860d-5de6-bc5a3056d9ad@quicinc.com>
 <w2zhq4nedrzjb7znmjqhixbk7ncxqedjsi5mapsfwfe7pqcnrn@36aeageuuhs7>
 <dcd27cce-7558-d055-caf7-3bf56ff31fdc@quicinc.com>
 <iksemnwiytrp5aelmhehyoexwzj6iem5b66qfr65nviad2fl6f@3qkn23jnzl2z>
 <5ea8f6e4-04c7-092c-2acd-24e18c0bf641@quicinc.com>
 <imo4dxtegwq6fiu6k65ztmezuc7mjlnpnpeapfqn5ogmytj6se@6z4akhw4ymp7>
 <5fdb8fff-d07b-c15a-3f40-eb088e3ff94e@quicinc.com>
 <2llwkhpwbkzqyvyoul2nwxf33d6jhuliblqng4u2bjtmsq7hlj@je3qrtntspap>
 <5a03b200-4e1f-082a-c83a-cb46ad4cea09@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a03b200-4e1f-082a-c83a-cb46ad4cea09@quicinc.com>
X-Authority-Analysis: v=2.4 cv=HbIUTjE8 c=1 sm=1 tr=0 ts=68cd6205 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8 a=NEAV23lmAAAA:8 a=4MwoUhHJQoa0W9kE-8QA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXwYBUf2ozS2c2
 YaPn/Bzk/3qlwmGUyx91dOt0Fogwq8JCAYlSaaYuYC0zwT7LB/XoVdruRj/vlEKT8B1g24gMdRQ
 7OaaZt7K4kQZcAobBgZk6ZQBdz4453W/GabehjdKgRii6N35QbrVnePRgRdEMOzdpYZoTBngsK1
 JEcQvM33FZIIaqUa5dfMSMeyfQMZ52XdbPApp9icYDkKCXXmcUuPSL20ZNXeG0ZmWYxe1feigHP
 87ivLN7wa2P1wsTqp3CyOE/ng2CZRYFo1SAgB9cRIIMAA8BwY0PwUHr4U8fqHsWBaxSZ7HUBAz2
 8PkAfnbl7mjcLEagoYq4/Ke91x3pJS2/L/4uhPVbe2D1MpfOUgDuMVTb8SDHIaPsaDxbF3qVPgD
 yeQCy4Zj
X-Proofpoint-GUID: c2CiNGOBS96chrO8X1NDZu4rNzd0sc5R
X-Proofpoint-ORIG-GUID: c2CiNGOBS96chrO8X1NDZu4rNzd0sc5R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

On Fri, Sep 19, 2025 at 12:26:03PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 9/18/2025 5:47 PM, Dmitry Baryshkov wrote:
> > On Thu, Sep 18, 2025 at 10:39:20AM +0530, Dikshita Agarwal wrote:
> >>
> >>
> >> On 9/15/2025 8:08 PM, Dmitry Baryshkov wrote:
> >>> On Mon, Sep 15, 2025 at 06:27:57PM +0530, Dikshita Agarwal wrote:
> >>>>
> >>>>
> >>>> On 9/15/2025 5:29 PM, Dmitry Baryshkov wrote:
> >>>>> On Mon, Sep 15, 2025 at 04:44:58PM +0530, Dikshita Agarwal wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 9/15/2025 4:09 PM, Dmitry Baryshkov wrote:
> >>>>>>> On Mon, Sep 15, 2025 at 03:40:24PM +0530, Dikshita Agarwal wrote:
> >>>>>>>> Hi,
> >>>>>>>>
> >>>>>>>> The following changes since commit f0f4634972f48c3330896bde5c94557b568a3a68:
> >>>>>>>>
> >>>>>>>>   Merge branch 'en8811h' into 'main' (2025-09-12 14:23:45 +0000)
> >>>>>>>>
> >>>>>>>> are available in the Git repository at:
> >>>>>>>>
> >>>>>>>>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> >>>>>>>> video-fw-qcm6490-update
> >>>>>>>>
> >>>>>>>> for you to fetch changes up to 6313c3b6ec0713d2cae0ac2aed050d70a50526ce:
> >>>>>>>>
> >>>>>>>>   qcom: vpu: fix the firmware binary name for qcm6490 (2025-09-15 13:44:49
> >>>>>>>> +0530)
> >>>>>>>
> >>>>>>> From the commit log:
> >>>>>>>
> >>>>>>>> Fix the firmware binary name to reflect the correct sectool being used
> >>>>>>>> for signing. Also update the version to add some recent fixes.
> >>>>>>>
> >>>>>>> Using different sectoosl isn't a determining factor. It's the security
> >>>>>>> profile and thus different MBN header versions.
> >>>>>>>
> >>>>>>> However, why is it important here? We have added vpu30_p4_s6 for the
> >>>>>>> sake of QCS8300 which requires MBN headers v6 (unlike SM8550 which uses
> >>>>>>> v7). Do we have such an issue with vpu20_p1_gen2?
> >>>>>>
> >>>>>> its the same case here, qcm6490 also required MBN header v6.
> >>>>>
> >>>>> But why do we need to mention that it's v6?
> >>>>
> >>>> we need this to be able to distinguish from the firmware binaries which
> >>>> doesn't need v6 header, we are following the same for other SOCs as well.
> >>>
> >>> Do we have anything to distinguish from?
> >>
> >> As of now, we don't. But in future if a new firmware is needed for the same
> >> hardware generation which doesn't need MBN header v6, how would be distinguish?
> >>
> >> So either we keep the name with _v6 now or change it later when a new
> >> firmware is uploaded which doesn't need v6.
> >>
> >>>
> >>>>>>> Last, but not least, is this firmware used at all? The venus driver uses
> >>>>>>> qcom/vpu-2.0/venus.mbn, which points to the old (non-gen2) file.
> >>>>>>
> >>>>>> its used here
> >>>>>> https://github.com/qualcomm-linux/video-driver/blob/video.qclinux.0.0/platform/qcm6490/src/msm_vidc_qcm6490.c#L2423
> >>>>>
> >>>>> Hmm, why is it using a firmware file different from the upstream venus
> >>>>> driver?
> >>>>>
> >>>>
> >>>> qcm6490 uses gen2 based firmware while sc7280 (venus) uses gen1 based firmware.
> >>>
> >>> This doesn't make sense, QCM6490 and SC7280 are the same thing.
> >>
> >> yes, they are same hardware, while it is one of those fortunate hardware
> >> generation which have the implementation in both gen1 and gen2 firmware
> >> interfaces. Board qcm6490 enables video with gen2 variant, while sc7280
> >> uses gen1.
> > 
> > What does it mean? There is no board-level difference nor SoC-level
> > difference.
> > 
> >> Given that they are same hardware, we use the same bindings.
> > 
> > Now consider the OEM having the fused device and OEM-signed binary. How
> > would it work? Will venus work if it's a gen2 firmware? No. Will your
> > driver work if it's gen1 firmware? Also no. You can't randomly change
> > the firmware interface in the middle of the platform lifecycle without
> > providing a back-compatibiltiy.
> 
> I understand your concern. To clarify, we are not removing support for the
> existing Gen1 firmware, so backward compatibility remains intact.
> 
> We are simply adding support for Gen2 firmware for this architecture. As a
> result, QCM6490 will support both Gen1 firmware (with the Venus driver) and
> Gen2 firmware (via Qualcomm's video driver [1]).
> 
> Additionally, as part of our plan to transition all Venus-supported targets
> to the Iris driver, SC7280 will continue to use Gen1 HFI and Gen1 firmware
> to maintain backward compatibility.

Dikshita, this is nonsense. Venus and Iris drivers are supposed to be
interchangeable for the hardware they both support, until the venus
driver drops support for V6 hardware. At that point it's expected that
there will be no V6 support in Venus driver.

You can not simply upgrade to Gen2 firmware as if nothing happened.
Consider a device node on SC7280 / QCS6490 with the firmware-name
pointing to OEM-signed firmware. Both Venus and Iris drivers would
happily consume the device node and try to work with it. One will work,
another one will fail. This is definitely not what we have agreed upon,
when you started adding Iris driver.

> 
> [1]: https://github.com/qualcomm-linux/video-driver
> 
> Thanks,
> Dikshita
> > 

-- 
With best wishes
Dmitry

