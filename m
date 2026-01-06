Return-Path: <linux-arm-msm+bounces-87756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C71CCFACC2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 20:53:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0BAB7300E40B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 19:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BED51F3B8A;
	Tue,  6 Jan 2026 19:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZASx1VmH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SLUmDh52"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700B62236FD
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 19:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767729233; cv=none; b=Lh/69m3/QbgWrxzFUOYh2Bn8tJ5siyHtgpFy4VxUjUpPwK81hExx0woMhxERcMVfiSYENk1Oy1y3gVD9JaVyqC9JQcUCxrmfl9K6EAqIhV2IL8Aede6DcpqpKx8OrG9XadKixc9GDxawB724rz0yOHQB1rjLYe9bkLO46VnQAFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767729233; c=relaxed/simple;
	bh=YcamPpbIjso9mYbUy/vG/whkEaKhUcZQk9lmdfvDMFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NjdN8snY1cmrgcDJOTv3tCJMV3d60IqUGz2KTcR5ykwSgxed82i65MUqPYOklcHL7tGIXn+VXG0r39gmSDcaO+Mt/k6fxwkn95df/Fj8Q0h/1ib71XwcUsGAZ0K5vkQDn2VXNULw/2oHDgfVDyRIztxL5wzxoscnEULRknRZBBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZASx1VmH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SLUmDh52; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606Givtq959531
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 19:53:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YcamPpbIjso9mYbUy/vG/whkEaKhUcZQk9lmdfvDMFQ=; b=ZASx1VmH9rXfWJqw
	nppBSJ1GXMNuZuLcTgih0Tm+rDYqMyUDeErsVfgIMwvfOPTMxSO/C5FCEKgp8W/f
	O3dh8uT01pvst5B5tAm2YnnCPKTrC0e9NB2fQ2lyswBuvidaf7L4S+PsgCH6aFkh
	Yvi1spwrJ4PJmso5oqV9XG/W1KbPi4wdG4TzYAjGGezMZ9gHbj/9c752WiLrY6H3
	D5f312oaEJs7V2qRj9J+i1trAVgrTNbTcQ4CHlWlnrKIUVNmaSwZIlOnwSoNuI7D
	96WTVtBASyDLVo6WCvhVbUVHPcxcjxv7ZYLp1/yR5JDDEOApQ8InbcbMGi4/cf/r
	iMVqXQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh66erk4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 19:53:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee0c1d1b36so1222571cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 11:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767729225; x=1768334025; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YcamPpbIjso9mYbUy/vG/whkEaKhUcZQk9lmdfvDMFQ=;
        b=SLUmDh52z6G7VIdXComJDkg/OEMCa7N290F2qSMhY/mJhJkVDtiagFxuDeT0N0dNF3
         RrWmI1WfyRCSVIk02DNBBMWqxbZzu+GOHiGLH6MFqwcRSk3tNxiU+ruTu3eHeJTKduiH
         RhRw9SxHumx0DjOsD+HMAovuiUkRILoyj45rF2Y3SBLZBjh3CSy67rNFdyHFxRXGgeEG
         A5NvU76lXSNVZ2b/dbIM9bF9nIps0Zr5lFI4ceZUwdVGfIj/XDNDWZ6+379uvoonJPUg
         SKR7PD2JoeiBXDtUwH1AtgeNOJerdydMSQN1IQfZGDXYcvwcRPKFMUjSz1t01HSnY8qK
         JM9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767729225; x=1768334025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YcamPpbIjso9mYbUy/vG/whkEaKhUcZQk9lmdfvDMFQ=;
        b=wg2rBT9lNf5jTW0zObOH3+66qEv9XEtIQRXC5gPwP4fktudaDqwRKdlqhGnw1lc9Q8
         D1Ag+M2dIfZDF1lGAu+bcJLosbdKL0Qgll2Q3igqostPvRlt02ix0NbcLHIbiLxzhV5p
         angyzv47Go5YHxGt0ZIX3HVcH5pGMJ1ntiKpxkAn2taKT/xTxiJ2oLi1IZc6qee7Luy7
         +cTm+OuZmzW2Kudb4IMMcOaOO2eOs7zbx9oXARHbTBVS8rzpeeJHtaUheGzkXeMNDWbZ
         6lTmH7BtODOJq4XYTvQOoWMyoUP66iYBd/qQkJSH8SAlJom2UfTCswfQifYoGmDUauzQ
         Rprg==
X-Forwarded-Encrypted: i=1; AJvYcCWB5+rqIfWnywDw+NV92IpyFwOBzrAeSTP64TkLln0essR4sm59am54WJesd7cEGnvQSCT91XSyDHVaWyiW@vger.kernel.org
X-Gm-Message-State: AOJu0YxxZXrjwIdN11G3GGBg/LnBzbxTKHEJEX0QSBKOyjf12IJH/jo2
	KgV1rzTrTKgq2N6VfanwJwxULMw9tSxEouKPrr1Sne2JvLumRsvEwQDhjKN6LWqVhhfNhlCtmN6
	OrKw4ldgECsJpJbIIBj2UcxHfnGQQq3MnnpUtvxE1thohsZfZuY+9liXlC0WkTWPY8yGO5ax5Z5
	efwQwXK1Qi4wruWmrsNO8VsItNOpdXg+dlqgcPtgqHBdc=
X-Gm-Gg: AY/fxX4KGfwQ02uyeSfSojSfFbZetABXyXwcPDHdAVRHVvtzx6Ph4svOxot1kmfmKGn
	2UFbKLGb4MpmhO9bVpTTSZXfxTlTZIXH/9CLwpR2q6avpTjPIWWXPtKrgylbDSseNTX+LWN//D7
	5DDbHgn0U/oji4sgkNhrDG2CNgRQHyevR3a8dzbdZbTKPSZEfnKuWVF8K+Dz5SAZS+WSEEmILhE
	fexTcwh2qUdXNYoZmBfJvEnJwDh
X-Received: by 2002:ac8:7d50:0:b0:4ee:2b93:2320 with SMTP id d75a77b69052e-4ffa841d459mr51197511cf.18.1767729225068;
        Tue, 06 Jan 2026 11:53:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG4qF+cdXm+CkkDV+c1stvb7fRrAsUhbR6ClYMMtabUEnGxDTwmgOmdkUXQGBZRP0KuB61h+cZE/1AM+F35g2Q=
X-Received: by 2002:ac8:7d50:0:b0:4ee:2b93:2320 with SMTP id
 d75a77b69052e-4ffa841d459mr51197251cf.18.1767729224668; Tue, 06 Jan 2026
 11:53:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251114133822.434171-1-loic.poulain@oss.qualcomm.com>
 <20251114133822.434171-2-loic.poulain@oss.qualcomm.com> <aRtbwK0Afo50Lh0B@kekkonen.localdomain>
 <CAFEp6-1Tdmr5v0r+q0qeOG6qqA-hiBaF1iTEcmhBA0oTjLgbgg@mail.gmail.com>
 <aT_Xc6LR161QBRFp@kekkonen.localdomain> <CAFEp6-2PP0ufge0RXTrE2Nrn_sLCN5erokxpJsuGeHq7ZEZ83g@mail.gmail.com>
 <41447e2e-52af-4fe0-8204-7ee7f43841c6@kernel.org> <CAFEp6-26NiAcoP-nTaFZrG6AT3QimZsNLfPU07Fj2TwqimBbRg@mail.gmail.com>
 <5c53a758-9499-4043-ad89-1cc6f1b12233@kernel.org>
In-Reply-To: <5c53a758-9499-4043-ad89-1cc6f1b12233@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 20:53:33 +0100
X-Gm-Features: AQt7F2qAFbR3XJSoZK0b2-WIsBcdWOxN7v0GYZbdC3HYJIVJeKN6pYa38sKjcaM
Message-ID: <CAFEp6-0d=kSkzFq-ki5DjcG+amzKaWP+c98vvNpLg64YxniPKg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] media: i2c: ov9282: Fix reset-gpio logical state
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        dave.stevenson@raspberrypi.com, robh@kernel.org, conor+dt@kernel.org,
        mchehab@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE3MiBTYWx0ZWRfX9QtfVu3mLCGk
 9z60mNACIgCBbh6Z31w95O3Nq2KGD62+AShHrNHBMeKNfsWHaxt1R1OkrRZYYCBSPO/2QiOGcDu
 KzgKxJ/EKlzp6Jip7KmFdNw65iuI+L3/cP4XzBGBN1d/D2k+jEM0jMNLME16ZLFFnlhYnEdXGZX
 s7VqN7ZpNYD5jfO28zcXiKyO2fFmY4D2qSsanRu8dNooqPNmDhbRSOfShoLblqjHBzYn33pVE5O
 KvXN4gETF+i6/o0VX2NXs75ouJ5x5EkVG1Ayg8BMyhCOE3frFj/zyO5a94kMhTEjgU9Ek8lNuBz
 3WmDcFbgvLkno+sX7WB03LMpLKVa1V7op+5N/e74pGfL4Hlmm6SNE/OQOPVjaLb05wHqoIPO38q
 Obk/JNmHlcZstuId3Vsm9TFz9ZhJvpRRvAEOJQVrTQiij3sjgNbm4tBFG2xvc2ZH3geb7bhCyo6
 YM5g8OZ/p2MtXoj6L7w==
X-Authority-Analysis: v=2.4 cv=HccZjyE8 c=1 sm=1 tr=0 ts=695d6849 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=VR60dbDf7Bikyl_Yo3AA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: agceZr5-QSnm0JOfdVpcARpIxXFWMe4t
X-Proofpoint-GUID: agceZr5-QSnm0JOfdVpcARpIxXFWMe4t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060172

On Tue, Dec 30, 2025 at 4:41=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 30/12/2025 16:03, Loic Poulain wrote:
> > Hi Krzysztof,
> >
> > On Tue, Dec 30, 2025 at 2:54=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 15/12/2025 11:19, Loic Poulain wrote:
> >>> On Mon, Dec 15, 2025 at 10:40=E2=80=AFAM Sakari Ailus
> >>> <sakari.ailus@linux.intel.com> wrote:
> >>>>
> >>>> Hi Loic,
> >>>>
> >>>> On Mon, Dec 15, 2025 at 10:35:15AM +0100, Loic Poulain wrote:
> >>>>> Hi Sakari,
> >>>>>
> >>>>> On Mon, Nov 17, 2025 at 6:30=E2=80=AFPM Sakari Ailus
> >>>>> <sakari.ailus@linux.intel.com> wrote:
> >>>>>>
> >>>>>> Hi Loic,
> >>>>>>
> >>>>>> On Fri, Nov 14, 2025 at 02:38:19PM +0100, Loic Poulain wrote:
> >>>>>>> Ensure reset state is low in the power-on state and high in the
> >>>>>>> power-off state (assert reset). Note that the polarity is abstrac=
ted
> >>>>>>> by the GPIO subsystem, so the logic level reflects the intended r=
eset
> >>>>>>> behavior.
> >>>>>>
> >>>>>> That's an interesting approach to fix DTS gone systematically wron=
g.
> >>>>>>
> >>>>>> I was thinking of the drivers that have this issue, too, but I wou=
ld have
> >>>>>> introduced a new GPIO under a different name (many sensors use "en=
able",
> >>>>>> too). Any thoughts?
> >>>>>
> >>>>> Apologies for missing your point earlier. We can=E2=80=99t really n=
ame it
> >>>>> enable, as it performs the opposite function and that would be
> >>>>> confusing in the device tree description. A property like reset2 wo=
uld
> >>>>> be more accurate, but I suspect such a binding wouldn=E2=80=99t be =
acceptable
> >>>>> from a device tree/bindings perspective.
> >>>>
> >>>> Many sensor datasheets document a pin called "xshutdown" or alike. T=
hat's
> >>>> not exactly "reset" or "enable" but it can be mapped to either and t=
his can
> >>>> be seen in the existing bindings. The polarity is effectively the op=
posite,
> >>>> yes, but does that matter?
> >>>
> >>> I assume naming a pin 'xshutdown' or 'xreset' indicates that its
> >>> polarity is inverted at the driver level, the driver interprets the
> >>> shutdown or reset function as being active when the logical level is =
0
> >>> (low), as they actually incorrectly do for the 'reset' gpio.
> >>>
> >>> From the driver=E2=80=99s perspective, this naming convention is acce=
ptable;
> >>> however, it causes the devicetree description to slightly diverge fro=
m
> >>> the datasheet and leaves the reset property effectively inverted (and
> >>> therefore incorrect).
> >>>
> >>> Honestly, in this specific case, the simplest solution would be to fi=
x
> >>> the driver, since there is currently no upstream devicetree using thi=
s
> >>> sensor. That would technically break backward compatibility for any
> >>> out-of-tree DTS (if they exist), but those would have been incorrect
> >>> in the first place.
> >>>
> >>> But yes, this seems like a good opportunity to discuss and define a
> >>> more general approach that can be applied to other drivers with
> >>> similar polarity or naming issues.
> >>>
> >>> Krzysztof, any thoughts?
> >>
> >> You need to first CC me. You sent it to the special bulk email
> >> address... Anyway, please be specific about the question.
> >
> > Ultimately, I=E2=80=99d like to reach a consensus before moving forward=
 with
> > V4, as several approaches have been discussed so far:
> >
> > 1. Keep the current (incorrect) driver logic: This was the approach I
> > used in V1 of this series, explicitly noting in the DTS that the
> > polarity was incorrect. However, this workaround was fairly rejected
> > as not being an acceptable solution.
> >
> > 2. Fix the driver logic: This was the approach in V2. It ensures
> > correct behavior going forward, especially since there is currently no
> > upstream DTB using this binding yet. The downside is that it would
> > consistently break any out-of-tree DTBs that *incorrectly* describe
> > the GPIO polarity.
>
> No... It will break EVERY out of tree DTBs, which was previously
> working. It won't break only the ones which were NEVER working...
>
> Breaking a working out of tree DTBs for a driver used for almost 5 years
> is a no-go.
>
> ...unless you get acks from all platform maintainers (so ~40 SoC
> maintainers?). Quite unlikely.
>
> This should stay as is just like I did not fix none of other sensor drive=
rs.

Understood, appreciate your input. I=E2=80=99ll keep the inverted logic as =
suggested.

Regards,
Loic

