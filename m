Return-Path: <linux-arm-msm+bounces-67662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DE6B1A04C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 13:12:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F4777A8F0D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 11:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8047925229C;
	Mon,  4 Aug 2025 11:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EbzCjNJy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7982405E8
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Aug 2025 11:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754305937; cv=none; b=payLr1MnZhpfL9K2hVI6NmrCiX7Y7QCdT0v8tRj0RP0Dzjqy624D3raVILiHourdKq/O+oQcVElcoE7I646Z6vrKgA+EIHVITzqfXUAro8v59p6N39vy+0xZjwS11JT+JVaDw0w+gGJvfXnWNAYNoAD+C80/DNmj8CclPx0FUH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754305937; c=relaxed/simple;
	bh=Omw9hUFTDk90A03C6AJBHSpEvuZNntYrhakVU/5IIro=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OLZnCzgnqjWFdvQi7ZgBfI/qkoJN0BawfjoQWP8k8qU7JfTY+UnHT0TpwS0DZsvz37MlJHfxw3a08hseI/icntWv9spPf/1SNnNMaktEKNdExzCsH7C8xIQYTCxI8aoZPb8VuaVfghlFn+8KRlN9MjL39ziTVPVEI/LYeDdWrY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EbzCjNJy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 574A40FM031698
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 Aug 2025 11:12:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xY08u+5CBSgmq/xMQH9j0OMW
	anJB7Bd0uQk8adqRJ3s=; b=EbzCjNJydx55YP0xUhChkWIEueKB3twjMrbsr6se
	zfm8p6icRJ+M9G9ygWQ6SvjXTvh77mc/ocz6MOyz/3wTj1wULGycTi949PLO7ndD
	IMWPItJ8+Fcy1f+TnUUfhtSWa8Yvh0LJwmj2Qck7tjVNkaykmWTh1QfSRtDOckI4
	1LU19xf7yQKPPPJPB5nt+Q/NBJzfuNjIGiVYsl0fd/AvrOvYLEf1H7T6dY8I+fqx
	8ebTb3ha5Pw4bEwOgzSPbG+nvWPXIbeHcBRMkbl3brnt3is+1rW6AGrVYS27Fi7O
	81hFRwEeuw645OF+lC4SGtkJ1fXi6/1biO+hRjE7O+TFBA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ak5a1h6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 11:12:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b0791a8e8dso8469941cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 04:12:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754305934; x=1754910734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xY08u+5CBSgmq/xMQH9j0OMWanJB7Bd0uQk8adqRJ3s=;
        b=jDD5e/Uwm0uBZ3qrWHcCJW/l+SnhEZ1IqRw7l+cb6pvC5aD8Xp6QoGC9a7meKF664E
         YBqj1P3cCq3Olq89A9uox7PEkkrX6egY490o/TIg2dTkREs3mzX/y99ULpLBOWCHdhZ1
         ypNaCtas/e+yJeAYqbl2Ps4RjKUw50ZbDpjJ00/zSrc+IiVm3fqw7Y+CZ7+cRc54PY0y
         c0GgzmqbqD8w4xEUdjhKb2qmp/PgER9aX3gotZA072peKY7BtJ4gVZcvH7u20+fPYmcC
         X/FpdBbWrF48keLA8Xe4qlVEVsumFaFmZzij+6mRKMmIuqJZMl5YHVnvgXVeWkMsTaUM
         vxYw==
X-Forwarded-Encrypted: i=1; AJvYcCW67aAtX1PW/UeKbazMU07ycTOYdXdYhyb/q24eRUN7bIawkXYmsF8LtAwpRbF6/b7r5aIP5MyBSo2idyrR@vger.kernel.org
X-Gm-Message-State: AOJu0YxsKKiLOW/ckObclHwajYdUrqxWMYWisfQre5v6zBe9V7f8wbV9
	hYrS8pDdgDEyEQCA4fKPPN/DXCuoUduIbQ9DKIIGTvg2J650G9ABBy35qfQPRdYjPpumDZRdcZK
	Md+hd94cq6QHx2CAnr79ukN0XYb2MEyN3cg1SsjH4WGFxVsxj2zCdmpFyFZZ5szOqHfaz
X-Gm-Gg: ASbGncsCI+HbLlJEwjxQAPdGMYTuOFEg2loxZ+Lz160WxXh4gwHRzP6n047rw5mb/qY
	vbgNoXwsXwIzxMKGWy468Fbq9QV8V1AZlgGhppq91Wu9Ft/QO/w60L0jgClOvNMq5YGgR1KxW73
	iGW54Fqzg22CyCg4ZTa4BIMyu9s5kXGca8slPWCVxBf+seCeHyiowppqiSq6SGkRAOaART/t8GH
	Yv1WwRd8MYT5WPbkPtf+0vH4SerN9yJjncfaJ2iTQflYszDQShL1Mo/KD/ds7ZTBX1CHQmxinB8
	z5/jYW3qYTlu4cghCSJLTpKBQYzuVWFAUyVG+8Ng5BiZIy5ZEmCAfOgaY6iqq9M8FBzcBg==
X-Received: by 2002:a05:622a:1344:b0:4b0:7ae5:c3a4 with SMTP id d75a77b69052e-4b07ae5d169mr6112641cf.40.1754305933554;
        Mon, 04 Aug 2025 04:12:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYpcEbMHBm5v9EBV8ZN8gmjTX4c83T0s5eMl0+dY9O597Q54Xp8w1/yBRwTZEiScRbyY6AcA==
X-Received: by 2002:a05:622a:1344:b0:4b0:7ae5:c3a4 with SMTP id d75a77b69052e-4b07ae5d169mr6112051cf.40.1754305932999;
        Mon, 04 Aug 2025 04:12:12 -0700 (PDT)
Received: from trex (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458953cfeaesm217612295e9.16.2025.08.04.04.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 04:12:12 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 4 Aug 2025 13:12:11 +0200
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, krzk+dt@kernel.org, konradybcio@kernel.org,
        mchehab@kernel.org, andersson@kernel.org, conor+dt@kernel.org,
        amit.kucheria@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/7] media: venus: Conditionally register codec nodes
 based on firmware version
Message-ID: <aJCVi4fjY9SKWNOk@trex>
References: <20250715204749.2189875-1-jorge.ramirez@oss.qualcomm.com>
 <20250715204749.2189875-3-jorge.ramirez@oss.qualcomm.com>
 <2fd0d1a7-70ee-43ac-af84-d2321c40e8f8@linaro.org>
 <aHidibqhMyexExXJ@trex>
 <0dd1f38e-eaba-4c99-b386-4ff8fade5b9b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0dd1f38e-eaba-4c99-b386-4ff8fade5b9b@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA2MSBTYWx0ZWRfX68e4PPsB34UZ
 oOo7fG/2AU84BfqsNzDJRPDKObBfXvR1saDhCD6ppqOavjbVANoCEoJDoejERAXRqTxENT6PMPH
 55BFLZhsl5OVM8kk3jB0KlJQiu7TK0AV+VnKuAI1OactmWCyU3oTYa2/MyPCRHdtuvsXiCjInhm
 8P3k65CNiLH7cZkAlzOtvdykjrVMgwr5xdcvPfhUZKkDW0oZ02vC91UGAtINpbIukOKkQPb/+DI
 vjf0ma35MngS5uBTE+rriUGBCTBLGl315N+VdX45Nd7V9Z1fmFwjKiES56Qf8PzQy8LO8rud/NA
 0FjbFxZNom8lN0+MRS18bM7I7E6VkwEJj0XJrREir9prCb3+7oCK2MEqDdb+Z2XQwiB2M92CRFJ
 q/YKEhdnTLwEynZbuMoGt4itLEe60Wt1LLQ/qvbD0AVZOcjNG+eyuXbjIfcu4l3frdVMMrem
X-Proofpoint-GUID: BecyIDRw4bxIdd-HENGhEg4WQtzZogSK
X-Authority-Analysis: v=2.4 cv=LP1mQIW9 c=1 sm=1 tr=0 ts=6890958e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=mEtzVpvg6qvpzuVc8OAA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: BecyIDRw4bxIdd-HENGhEg4WQtzZogSK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 spamscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040061

On 17/07/25 09:55:08, Bryan O'Donoghue wrote:
> On 17/07/2025 07:51, Jorge Ramirez wrote:
> > On 17/07/25 00:37:33, Bryan O'Donoghue wrote:
> > > On 15/07/2025 21:47, Jorge Ramirez-Ortiz wrote:
> > > > The encoding and decoding capabilities of a VPU can vary depending on the
> > > > firmware version in use.
> > > > 
> > > > This commit adds support for platforms with OF_DYNAMIC enabled to
> > > > conditionally skip the creation of codec device nodes at runtime if the
> > > > loaded firmware does not support the corresponding functionality.
> > > > 
> > > > Note that the driver becomes aware of the firmware version only after the
> > > > HFI layer has been initialized.
> > > > 
> > > > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > > > ---
> > > >    drivers/media/platform/qcom/venus/core.c | 76 +++++++++++++++---------
> > > >    drivers/media/platform/qcom/venus/core.h |  8 +++
> > > >    2 files changed, 57 insertions(+), 27 deletions(-)
> > > > 
> > > > diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> > > > index 4c049c694d9c..b7d6745b6124 100644
> > > > --- a/drivers/media/platform/qcom/venus/core.c
> > > > +++ b/drivers/media/platform/qcom/venus/core.c
> > > > @@ -28,6 +28,15 @@
> > > >    #include "pm_helpers.h"
> > > >    #include "hfi_venus_io.h"
> > > > +static inline bool venus_fw_supports_codec(struct venus_core *core,
> > > > +					   const struct venus_min_fw *ver)
> > > > +{
> > > > +	if (!ver)
> > > > +		return true;
> > > > +
> > > > +	return is_fw_rev_or_newer(core, ver->major, ver->minor, ver->rev);
> > > > +}
> > > > +
> > > >    static void venus_coredump(struct venus_core *core)
> > > >    {
> > > >    	struct device *dev;
> > > > @@ -103,7 +112,9 @@ static void venus_sys_error_handler(struct work_struct *work)
> > > >    	core->state = CORE_UNINIT;
> > > >    	for (i = 0; i < max_attempts; i++) {
> > > > -		if (!pm_runtime_active(core->dev_dec) && !pm_runtime_active(core->dev_enc))
> > > > +		/* Not both nodes might be available */
> > > 
> > > "Neither node available" the latter for preference.
> > 
> > what about "One or both nodes may be unavailable" ?
> 
> Ah great that actually explains it then, as you can see I didn't get the
> meaning from the comment.
> 
> > > 
> > > > +		if ((!core->dev_dec || !pm_runtime_active(core->dev_dec)) &&
> > > > +		    (!core->dev_enc || !pm_runtime_active(core->dev_enc)))
> > > 
> > > Is this change about registration or is it a fix trying to sneak in under
> > > the radar ?
> > 
> > I think this functionality - the ability to enable or disable individual
> > encode/decode nodes based on firmware capabilities - should be standard
> > across multimedia drivers.
> > 
> > For example, on the AR50_LITE platform, the _current_ driver/firmware
> > combo does not support encoding as it requires secure buffer handling
> > which is not yet implemented in the kernel (changes to iommu, etc)
> > 
> > So, rather than disabling Venus entirely, I think it makes sense to
> > expose the decoder node, which remains fully functional and unaffected
> > by the secure buffer requirement.
> > 
> > Hence this commit (so yeah, I am not trying to sneak a fix, I swear!)
> 
> grand so.
> 
> > 
> > > 
> > > >    			break;
> > > >    		msleep(10);
> > > >    	}
> > > > @@ -202,7 +213,8 @@ static u32 to_v4l2_codec_type(u32 codec)
> > > >    	}
> > > >    }
> > > > -static int venus_enumerate_codecs(struct venus_core *core, u32 type)
> > > > +static int venus_enumerate_codecs(struct venus_core *core, u32 type,
> > > > +				  const struct venus_min_fw *ver)
> > > >    {
> > > >    	const struct hfi_inst_ops dummy_ops = {};
> > > >    	struct venus_inst *inst;
> > > > @@ -213,6 +225,9 @@ static int venus_enumerate_codecs(struct venus_core *core, u32 type)
> > > >    	if (core->res->hfi_version != HFI_VERSION_1XX)
> > > >    		return 0;
> > > > +	if (!venus_fw_supports_codec(core, ver))
> > > > +		return 0;
> > > Its not really a codec you're checking there, its a version.
> > > 
> > > The name should reflect that.
> > 
> > but the check isn't just about the firmware version: it is about whether
> > the firmware in use supports a specific coded based on the firmware
> > version knowledge built in the driver.
> 
> No OK "codec" is the right word.
> 
> ---
> bod

as per internal discussion - offline - I am replacing this feature for a
simplified an "all or nothing" version: either the firmware version
can support both the encoder and the decoder or none of them.

