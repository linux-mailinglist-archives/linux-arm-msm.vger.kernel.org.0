Return-Path: <linux-arm-msm+bounces-83394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9856CC88B35
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 09:44:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3F37134DFE9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 08:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37CEC31A057;
	Wed, 26 Nov 2025 08:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KjZmp7wL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PpT8zBEd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DB531A554
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 08:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764146641; cv=none; b=SJp5gAbDdgpZTTgQOTyyH2YPgU1pFFXucfgsXYVZgtDdPwfTW3lORW0+WuUOGydxk8fvzexL1+MYKl7sxCiojNK4YXd0N+AtBfwxcLbf3lYOrwmdOfsqeiKHZ19Zhyhuk5N1Bs61jq3M4zuWoX+RWIusfg5SHezgbNoRcX58fQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764146641; c=relaxed/simple;
	bh=5iJt7kqxmWow/SP33k5ZbybYddkk9W7+Uyf0Iy5saZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BWKRDfrgfHjsKSmnm1LALTMGrIcZNxV+nQutePvhsiwS7wzNFQKFbWhtbnn8Cc0doz5Z5gmdzeUc7pcQpHULzsjtYkTHn12cOr6pnYiOAEWyNfSRYgLFVT3fhy5jXoAwTQyxUnMHtBenrbSvHGC1Pa2K+B7TWSfvvYcah6/Oymc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KjZmp7wL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PpT8zBEd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ2Xdi33706875
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 08:43:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=o/rH1NqqlyziQAsrS262NAo9
	GGpJWwf2l4gmU8C2Rps=; b=KjZmp7wLZZL7ewgA/252OIJfD0Dz69wfkPL2gYNb
	JpbF2h00zywOGklkghfoCz1wwQwIcwIPLIimHEgeMJBGXtyaPI86TRs7RmLWPBRs
	LD3QonV+OzR/2p/F9UFJUt7ZTKEg5FxY4W3zzlCjmaAgxxeiDKRbJ9p1GBhnSWps
	W8TmUlDmq1sx13dZLyM41vd2j9m/Ep4ekX221b7wIOvth0xeA8xfvfaO1AXePDSs
	fW9PInrVMUjgLJkLAoN3KugaES1N1/iggnmecmIUIIwKSaWoxnVl4yqfgrNTv3AE
	/vgmBmXDxTPXf2yy/2sZ6c9mnU7YCR/WHaJoRh9tN8xonQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anduftr91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 08:43:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-343e262230eso7495437a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 00:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764146636; x=1764751436; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o/rH1NqqlyziQAsrS262NAo9GGpJWwf2l4gmU8C2Rps=;
        b=PpT8zBEdO+KjVjlBpsfcRKC7aLWb3D3WQ/V9rpdPXf9k80U8oPMa5NfFAkjgvU7Hj7
         LuFNKERFOT0maTGB90wIXDwwGfpMTfARhbFHVVP5i4Xet5QB1ODbJoMNfUT45DuLVYS4
         RLdmMXQWpV7UMTKRvtbKZ3MUKbOvjcrJW+O4crFcxi8+HXbslV6AtY6PnI88FoqN0VlO
         MU4HDEoBmPlHnhb0S3iA6klwQg2xtbOvK1qTBpfefnj+G3i+eArbiI3M5/+YdBRZU0/5
         5hGSk/I3whFKyfT1jzWU1Xtkk56x1CgVj2jQyQMx9ATrJfuXqBzUllhmFyvjz6B2hLb2
         p10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764146636; x=1764751436;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o/rH1NqqlyziQAsrS262NAo9GGpJWwf2l4gmU8C2Rps=;
        b=M+EURiG0rzsm69jbvxgs/CCVS6FULR4kFdfcE/89ibDue619Z3GIL56NqRIh/5G/2A
         dGh6Pw2EMk+WmMvT/Ps+pb7zfQuos3+AbDHW+FbZ/T9wjtYpv957LwbIa6cgjiqwfDFZ
         U1tiW4TqQwSHm94mz71AkZVnb9TXe++SMcXBlyZ30n+r387tEjfHuYGN51mSofUnpl0j
         ACcTOO4lDxaYBtL4x8x/T3w+3ugVwurBxGtzu9gQXWFZJ7V1AJ2zt+ouYlYD9ebCVo49
         gya5cAnm6spLBk5O4P2IDVqeFRC1oPp41vNVq7Qi1V8WOrJMtFCwhKWhJuIQKnHwSiLN
         vbvg==
X-Forwarded-Encrypted: i=1; AJvYcCX26GwVIfbDlqm20Vzp3WGYfThFT8SkReFKUSAgjZgE5VDqn++J4IaauRQF78IdENf0lXJ9CJiZENXA0XDo@vger.kernel.org
X-Gm-Message-State: AOJu0YwFC7mzGgghe3GR5Ibbn4rqHzGhlk8oKx12KcXn6UH59ocg/K+V
	qZzavZKJuZIestJSV7dotsoBTLEmBTJJSwfrzYphAL2UWBH+E3iUR7BTcdz2PrVIKB63l2vDjp4
	AL2iH3DJ3M+ubcYQy4dXIVmDXcsP5I+vY7V+gDnrReLFG6t6wfKxuiKgb3IShYSb0Gx5MGQW8iJ
	9+Gjkz/lVfcBJ9reDGOrjAfdq58YlFkpoMUQM+OOrCWZU=
X-Gm-Gg: ASbGnctEDUEVtcFfx9zoss41mOAXi8NB7lna4hvnUs6KfAsjwBK4eRmzCxGNrb2NQS+
	mOCMLMwDxZMPkPY7N4hY2JLuH+hHErlUEwJ25SMB+HgOZ99Hs7slhgLTfXBNECV7N5inkN9ARSl
	WkIjdrKMn2w/Xm/QQ7JWuck7rsrDCwGU4KNuAtqEFgEZPyWzlYtwQ/NxORIN5adRPMKsQ4WuMxp
	o/W916e
X-Received: by 2002:a17:90b:4e83:b0:343:684c:f8ad with SMTP id 98e67ed59e1d1-3475ebe73camr5256501a91.4.1764146636277;
        Wed, 26 Nov 2025 00:43:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+MCOBmpkgtJkt8Q8YV3P9JhgDTGcUeja80vgR2I9w2KPZzYM6OkePa/Z9x/egF4KzEvoENs2TDnQaQHXWjoA=
X-Received: by 2002:a17:90b:4e83:b0:343:684c:f8ad with SMTP id
 98e67ed59e1d1-3475ebe73camr5256472a91.4.1764146635749; Wed, 26 Nov 2025
 00:43:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125-venus-vp9-fix-v2-1-8bfcea128b95@oss.qualcomm.com>
 <wq7kaelokxqxkxxi5cvp7sz2az5hlam4nyyt4v55zrgei3jsyo@yyefysdsw3co> <e2b33a10-819d-df49-0687-74f6db4c5a05@oss.qualcomm.com>
In-Reply-To: <e2b33a10-819d-df49-0687-74f6db4c5a05@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 10:43:44 +0200
X-Gm-Features: AWmQ_bmZ9E8L_XdhwjK9pll08g_dWUBQaaSVb-FsGekM-Z55hRcfcZweuiJ15Ik
Message-ID: <CAO9ioeVKDjKMh3su2XVwXPxjfZNbVSan73d099C6_vkCqjkJmA@mail.gmail.com>
Subject: Re: [PATCH v2] media: venus: vdec: restrict EOS addr quirk to IRIS2 only
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Viswanath Boma <quic_vboma@quicinc.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Mecid <mecid@mecomediagroup.de>,
        Renjiang Han <renjiang.han@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=C53kCAP+ c=1 sm=1 tr=0 ts=6926bdcd cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dzuc0l4uWgn2Qoy4hN0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3MCBTYWx0ZWRfX008wHc2xUYSC
 /dvX7KS+TBSibOpFu1Mf3faq9Un0ExBS4wxfsYCasnlr8R4Xc8qU8QJMD9OwAqLDBbCVQz/KkSz
 YLLkBusJ6MWB1MdyciTfywl64XZPWJlc9s4xzSx9JcWZiEyV66nqgQVBk/N5pYSDCdJlDIrCTrv
 +OhPw9VcHcy66dI31KWfsljphn8E0xgIqc4LXwAL8hURuZUdlyZ8cG99+Bab10+NYeWZDgHN5cO
 eh4/GtGIZM5g0VjC3EQjdWMsRfs8bpKjh1MO461swfxbNuUFPK1Ro1GTGTqqdO64qjyNAHEE39T
 pDLzQhHNxeLt1+CZRayF2Pi0nMcrWIgcnh1MBUQ+qOfkvG3hpuNUBdLJXA1YIUOOdbpYTvEaOnj
 52PJSFN3o85Jx38axFCmOOeh087ufg==
X-Proofpoint-ORIG-GUID: PxhQ82tDrYwFPlhuodQwH22VBqoFF_GB
X-Proofpoint-GUID: PxhQ82tDrYwFPlhuodQwH22VBqoFF_GB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260070

On Wed, 26 Nov 2025 at 08:02, Dikshita Agarwal
<dikshita.agarwal@oss.qualcomm.com> wrote:
>
>
>
> On 11/26/2025 6:43 AM, Dmitry Baryshkov wrote:
> > On Tue, Nov 25, 2025 at 11:04:19AM +0530, Dikshita Agarwal wrote:
> >> On SM8250 (IRIS2) with firmware older than 1.0.087, the firmware could
> >
> > Hmm, interesting. In linux-firmware we have VIDEO.IR.1.0-00005-PROD-4
> > for SM8250 firmware. This version wouldn't be parsed at all for SM8250
> > (nor does it follow the format string). Why? Would you please fix
> > version parsing for this firmware?
>
> Right, Seems this firmware doesn't have the proper version string, I will
> upload a new binary with proper version string soon.

That's fine, but also we need to fix the driver to correctly work with
the firmware we currently have in linux-firmware.

>
> >
> >> not handle a dummy device address for EOS buffers, so a NULL device
> >> address is sent instead. The existing check used IS_V6() alongside a
> >> firmware version gate:
> >>
> >>     if (IS_V6(core) && is_fw_rev_or_older(core, 1, 0, 87))
> >>         fdata.device_addr = 0;
> >>     else
> >>      fdata.device_addr = 0xdeadb000;
> >>
> >> However, SC7280 which is also V6, uses a firmware string of the form
> >> "1.0.<commit-hash>", which the version parser translates to 1.0.0. This
> >
> > I still think that using commit-hash is a mistake. It doesn't allow any
> > version checks.
>
> Agree, we had this discussion with firmware team sometime back and for all
> latest firmware they are having rel version in the firmware binary, but
> SC7280 firmware binary would still have commit hash in version string.

What prevents us from updating SC7280 firmware to also include :rel-NNN part?

>
> Thanks,
> Dikshita
> >
> >> unintentionally satisfies the `is_fw_rev_or_older(..., 1, 0, 87)`
> >> condition on SC7280. Combined with IS_V6() matching there as well, the
> >> quirk is incorrectly applied to SC7280, causing VP9 decode failures.
> >>
> >> Constrain the check to IRIS2 (SM8250) only, which is the only platform
> >> that needed this quirk, by replacing IS_V6() with IS_IRIS2(). This
> >> restores correct behavior on SC7280 (no forced NULL EOS buffer address).
> >>
> >> Fixes: 47f867cb1b63 ("media: venus: fix EOS handling in decoder stop command")
> >> Cc: stable@vger.kernel.org
> >> Reported-by: Mecid <mecid@mecomediagroup.de>
> >> Closes: https://github.com/qualcomm-linux/kernel-topics/issues/222
> >> Co-developed-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
> >> Signed-off-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
> >> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> >> ---
> >> Changes in v2:
> >> - Fixed email address for Mecid (Konrad)
> >> - Added inline comment for the quirk (Konrad)
> >> - Link to v1: https://lore.kernel.org/r/20251124-venus-vp9-fix-v1-1-2ff36d9f2374@oss.qualcomm.com
> >> ---
> >>  drivers/media/platform/qcom/venus/vdec.c | 8 +++++++-
> >>  1 file changed, 7 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> >> index 4a6641fdffcf79705893be58c7ec5cf485e2fab9..6b3d5e59133e6902353d15c24c8bbaed4fcb6808 100644
> >> --- a/drivers/media/platform/qcom/venus/vdec.c
> >> +++ b/drivers/media/platform/qcom/venus/vdec.c
> >> @@ -565,7 +565,13 @@ vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
> >>
> >>              fdata.buffer_type = HFI_BUFFER_INPUT;
> >>              fdata.flags |= HFI_BUFFERFLAG_EOS;
> >> -            if (IS_V6(inst->core) && is_fw_rev_or_older(inst->core, 1, 0, 87))
> >> +
> >> +            /* Send NULL EOS addr for only IRIS2 (SM8250),for firmware <= 1.0.87.
> >> +             * SC7280 also reports "1.0.<hash>" parsed as 1.0.0; restricting to IRIS2
> >> +             * avoids misapplying this quirk and breaking VP9 decode on SC7280.
> >> +             */
> >> +
> >> +            if (IS_IRIS2(inst->core) && is_fw_rev_or_older(inst->core, 1, 0, 87))
> >>                      fdata.device_addr = 0;
> >>              else
> >>                      fdata.device_addr = 0xdeadb000;
> >>
> >> ---
> >> base-commit: 1f2353f5a1af995efbf7bea44341aa0d03460b28
> >> change-id: 20251121-venus-vp9-fix-1ff602724c02
> >>
> >> Best regards,
> >> --
> >> Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> >>
> >



-- 
With best wishes
Dmitry

