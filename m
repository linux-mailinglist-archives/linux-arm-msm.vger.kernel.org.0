Return-Path: <linux-arm-msm+bounces-81396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FEFC51F8B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 12:29:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 27C624FD85C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 11:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82FDA221FBF;
	Wed, 12 Nov 2025 11:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HWMCUqVR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D8hT/4Sa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16C12E8B7D
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 11:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762946192; cv=none; b=dj/pTyfX5o72EKufekmFOGwhVJTRWT2/hE5guF6xS2TNRExbhl+YDBqVb00zmKsGFCGhjM4do/13wgobUg9l0qnD+5tzDPDh7UBtLFZpj6UAXxIDugqLRDQCx1uQgmj8ZS8krIVus/aoa+cJ57qVyUtXyebk3z7EAuIOh8hwB9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762946192; c=relaxed/simple;
	bh=2RbCPxBXrvXGXOedZj1/8RpYrvzys0WCnNhRvJnhUuA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hh8kqppjFksUc26IwJhsMp8OujKsMO/T2gmjzUK3GkxG/6sEqX/60VFtYxBlQKe847MsTyk9MG6upITOUl/OL08BVg9CzETENJc8qYdMJq0j1X6JINfuBDzlm+MSgdo6uRKiciYq82Jn1CK5iGTxePYx+KGG6g+yDA58ePIKWSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HWMCUqVR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D8hT/4Sa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC9Wwf91001732
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 11:16:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NoxDKOeccwe0hHKDuDC3QJhQ4gtuxY2B4MV4Ct21dd4=; b=HWMCUqVRnQp66ell
	L7R9KwvxD1Kp/G6e47U0iQ0l3KxXSUxZOHdNTwYp/Sy/JXGfVeH7ehZJ773Bdsad
	VN3P6AuBjMscsrsodKaIBZAIa3lz7YuIeZdqfUDpI7WXqAdL4cm5augKiXnzfJrd
	2Fx0HCUuMCi7SqDxMFrwriMWlPnCJixKcZESi3SkXD99tf6g8Au7Fn/+5CNFQ6BJ
	wAnyHqXyvzoYA2ddjdkXA2DmKCLtmaASvO8dihAIFHKeVritIUQsy6LJknQa3zTt
	xpBj2iz1lj2qVMAhRTeL/vcuMSF6bLO0kWhovVB7+QFhaB3sI/DkbUy+XE8uxLXp
	6pdAAw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acqq20c6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 11:16:29 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-882376d91beso20354176d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 03:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762946189; x=1763550989; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NoxDKOeccwe0hHKDuDC3QJhQ4gtuxY2B4MV4Ct21dd4=;
        b=D8hT/4SaYpeCcLai+n+TCpWhHkUv+qXhdHfas+jbG48vT6d5HNWV4hFCxRn5BPyPik
         bHhwrl4flcbqfEhApTSJpHZi0/KgK0eTomYocGIrjiNc+EVIUxrCxKnH4KeaSn/xfyBb
         B1wO4ktbuCnvqrzeysrIIFr9LZJLVqcNA9LbRRRWYFB0b90mrHGrVBoV59E2kb38srZq
         cDsX+BOv6k9xntUR2vFSILBIc+7XP2OuBZb9KWB14fLvYwIco7Z+J5whxiaBFcZA+wdR
         w9A9Eet4sNyuImUS2Ewx0V2JX+ZVWhe2WkI26dGJCpUH/x41ZC2pPTDuxCbBbfzOqhO5
         ug2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762946189; x=1763550989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NoxDKOeccwe0hHKDuDC3QJhQ4gtuxY2B4MV4Ct21dd4=;
        b=NmZnQJ1f2Ri9cyPXaegXJMHffIb4Sj2fKv/aBEbjUdQGAzVbKs5aTyoZbPbEJ9MThl
         FVSczcqU/O2dL2K0BxEY9vQ55atEj4GcWPqoL66WQKn4161dip2aZVrKJ0+qK7yT+FV4
         72XlY8xjXFlTInNTBVdaaevbTHRqrxzcA8N84vx3EaMFqr9L5tv0Ocu4eXe/TIQP/9qN
         oyln8L2/9k5Q2ZHarlvWl8mVs4WwgrAFefCmH6MeAGkrzJX3DyBXLkIHo+4Qa4EJHV2z
         N6GKTwePp9BMvKYgsHyVUCOS0D0e4gjlDNxCYqw2Mu2gMXvjVGYQTnTpYY8CbMY2JgIW
         REcg==
X-Forwarded-Encrypted: i=1; AJvYcCX54WOAFmUUecZWdu5d96cVbvPravvGwGVqjn3HuLtJKeLUuEHJqtOQb1lwbRIyXv1pUUD6gFrEW7EA9feY@vger.kernel.org
X-Gm-Message-State: AOJu0YxBPNybrK7W9qcUvv9vgtkaPiBWa/sGhkOcNlh2oHoB8kzyqXKs
	k04RF2Qd50iE59M2TO5t2NFvXRgGhYJazbndrhAQbixEJLkMTrTUURHbg/RTNA/uctgj8fCVOCA
	Lepy3nrQV/gztUoRAEY1OtPVHvPBZcqZTg2WNDzhnGztC7OjHkDSNBkrcUSbhL+LnrF/B/hCsw4
	58Vkf9VW7G71OiAW1Roqi797C6z6leHC5oObDn+j6bwXIWWoiZxr2bsQ==
X-Gm-Gg: ASbGncuryqcZiKW+WojvC7l+NTQFMQD0cfBWm19xbaXvET2YUhUDfLpi/LvTaOd+aw/
	Im9xQCwZgUvGTwfEPde4Zz6xKDwiMAjWA5uzgKiSxt7p26sO1mKwTCSxvhXCZLUFRp+kXll2Wds
	MXKrzYJna36rC5o3eaRQ0Q+7uIOssBSLDItG8JYaU1LKyUIRFWLtaGpCpcRmFc3JHZ8/iYJiG1T
	GEukH1u2HyDMzdt2Q==
X-Received: by 2002:a05:620a:17a4:b0:89f:5a59:bf30 with SMTP id af79cd13be357-8b29b84978cmr310116685a.78.1762946188504;
        Wed, 12 Nov 2025 03:16:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEbFMkRlXTnyauzcsrT9L1dZMT8pmOX8XA3fFrhIrcGJfg7RI6eB1RHXioVGWBqcn68+pLzUTvJit6HnES/i0c=
X-Received: by 2002:a05:620a:17a4:b0:89f:5a59:bf30 with SMTP id
 af79cd13be357-8b29b84978cmr310111585a.78.1762946187783; Wed, 12 Nov 2025
 03:16:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251103182006.1158383-1-loic.poulain@oss.qualcomm.com>
 <20251103182006.1158383-3-loic.poulain@oss.qualcomm.com> <740b9e7c-59bc-4a35-a268-526d92db372c@oss.qualcomm.com>
 <CAFEp6-12qN0=cv5=tPeVq3bVDLkaQDHLLCVQY4dtCTSvx+dPOQ@mail.gmail.com>
 <c1269f38-ab90-40d1-b5d3-39f546829d6c@oss.qualcomm.com> <CAFEp6-1+inMhsgjSqAZ+UDBMuNc9DA-jXFyqB=gkvYpSzW9Ukg@mail.gmail.com>
 <6daf722b-6b1b-4c91-b108-74793d930319@oss.qualcomm.com>
In-Reply-To: <6daf722b-6b1b-4c91-b108-74793d930319@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 12:16:16 +0100
X-Gm-Features: AWmQ_bkmppPZqTvg4YgUg-M0KbsuBOPKkMsqNwJWI4AM834g9wwfM8l1Kra8Vug
Message-ID: <CAFEp6-0sbDj0C9KAMxq1mrGO9jGz4YDMqnf1AGVU49PyGzLi8w@mail.gmail.com>
Subject: Re: [PATCH 2/5] power: reset: qcom-pon: Add support for WARM reset
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, conor+dt@kernel.org, sre@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=EbHFgfmC c=1 sm=1 tr=0 ts=69146c8d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=g6XIpITSSIbtmoP3y8UA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: LGB1lH9GL_lG04lFG5OSj5KQH1frHZi6
X-Proofpoint-GUID: LGB1lH9GL_lG04lFG5OSj5KQH1frHZi6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA5MSBTYWx0ZWRfX1GLhlt9GEw7v
 T98rxheYxoM2Wylqv8Ni3n0fwE9uccYFWuWf6eu4TYjN9Vy8u6j8rLee2snOMxB76g+zPpy5r2O
 KPqpsPI8kNb/gXXUtQJ/B8YBMDCAJIFGoUOUy8tVFGNe3yizTZv1fiJL/B8QQis000OhZ0ohb19
 SxWfBPIdo4PA1K3QQ7kK0HyUaBqGFBKlStKm0oXuPOivYRkE3Q0pOaHedcMMJ033zrhWOK1/DQj
 JE/2xYKyc2UOkxcOvvVpizjxIRNWmGECPQ32OZya2H5qxYgLxb9xT785O6tHNKpwJ6+47pO1/0R
 gke1ISCUDv4ExUImrDQV0uAvTUEyTnMjjQKNBv1XiVWqTSyrUMHgJNZT8lOFSg8DhAMuf6lTCFo
 j2ZQBBbJnL83WJL+fbda5O6Gtadamg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120091

Hi Konrad,

On Thu, Nov 6, 2025 at 1:50=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 11/5/25 10:44 PM, Loic Poulain wrote:
> > Hi Konrad,
> >
> > On Tue, Nov 4, 2025 at 4:20=E2=80=AFPM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 11/4/25 4:01 PM, Loic Poulain wrote:
> >>> Hi Konrad, Krzysztof,
> >>>
> >>> On Tue, Nov 4, 2025 at 12:50=E2=80=AFPM Konrad Dybcio
> >>> <konrad.dybcio@oss.qualcomm.com> wrote:
> >>>>
> >>>> On 11/3/25 7:20 PM, Loic Poulain wrote:
> >>>>> This mechanism can be used when firmware lacks proper warm-reset ha=
ndling,
> >>>>> for example, when the PSCI SYSTEM_RESET2 function is not implemente=
d.
> >>>>> It enables the warm reset functionality via the PMIC.
> >>>>>
> >>>>> This fallback is only enabled if qcom,warm-reset property is presen=
t.
> >>>>>
> >>>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >>>>> ---
> >>>>>  drivers/power/reset/qcom-pon.c | 47 ++++++++++++++++++++++++++++++=
++++
> >>>>>  1 file changed, 47 insertions(+)
> >>>>>
> >>>>> diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/q=
com-pon.c
> >>>>> index 7e108982a582..684e9fe9987d 100644
> >>>>> --- a/drivers/power/reset/qcom-pon.c
> >>>>> +++ b/drivers/power/reset/qcom-pon.c
> >>>>> @@ -19,12 +19,20 @@
> >>>>>
> >>>>>  #define NO_REASON_SHIFT                      0
> >>>>>
> >>>>> +#define PON_SW_RESET_S2_CTL                          0x62
> >>>>> +#define              PON_SW_RESET_S2_CTL_WARM_RST    0x01
> >>>>> +#define PON_SW_RESET_S2_CTL2                         0x63
> >>>>> +#define              PON_SW_RESET_S2_CTL2_RST_EN     BIT(7)
> >>>>> +#define PON_SW_RESET_GO                                      0x64
> >>>>> +#define              PON_SW_RESET_GO_MAGIC           0xa5
> >>>>
> >>>> Going back to msm8974 where the SPMI arbiter first showed up, these
> >>>> values are all seemingly valid, so I think we can drop the dt proper=
ty.
> >>>> The restart reasons are set in stone too, and you can find more of t=
hem
> >>>> in the register description.
> >>>
> >>> Yes, but this should only apply when the platform firmware does not
> >>> support warm reset via PSCI, right?
> >>> Making it unconditional would override the PSCI implementation even
> >>> when warm reset is supported.
> >>>
> >>> The point is that psci_sys_reset() executes a cold reset if warm
> >>> reset isn=E2=80=99t available. Therefore, our PMIC reboot notifier mu=
st have a
> >>> higher priority than the PSCI handler.
> >>>
> >>> So maybe the alternative could be to introduce an additional reboot
> >>> handler in psci, with the lowest priority, so that warm reset can hav=
e
> >>> a chance to run either from the psci main reboot handler or from the
> >>> PMIC reboot handler before falling back to cold reset?
> >>> [PSCI-handler]->[other-handlers]->[PSCI-cold-reset-fallback-handler]
> >>
> >> This seems like a common enough problem, perhaps the framework could
> >> accept EOPNOTSUPP or similar and try to delegate further, coming back
> >> with a normal restart or so, if unsupported. Trying to make a special
> >> contract between qcom-pon and psci silently will be very fragile
> >> otherwise.
> >
> > I tested the following, as described above:
> > https://github.com/loicpoulain/linux/commit/5c34ea54e1a21ff1192c3c34187=
7b24eff5f80b4
> > The only special 'contract' is the handler priority.
> > If you can elaborate on another/better approach, that would be helpful.
>
> Thinking about it again, it'd be difficult to grab some sort of a handle
> to the ""parent"" reboot mode, so what you propose here is good
>
> >>>> That said, we're circumventing PS_HOLD this way - is that intended?
> >>>
> >>> Well, we don=E2=80=99t have direct control over PS_HOLD since it=E2=
=80=99s managed by
> >>> the firmware in our case. That=E2=80=99s why I considered using the P=
MIC
> >>> software reset as an effective way to achieve this warm reset.
> >>
> >> Hm, so is there no longer a way to assert it by writing to PMIC
> >> registers?
> >
> > PS_HOLD is a SoC signal, and we can maybe assert it via the
> > MPM_PS_HOLD register through the msm-poweroff driver if needed (well,
> > if access is allowed from a non-secure world).
> > However, this would also require coordination with the PMIC driver to
> > select the correct PS_HOLD action (shutdown, cold reset, warm reset).
> > For that reason, I=E2=80=99d prefer to keep PS_HOLD based logic abstrac=
ted by PSCI.
> > Using the SW_RST PMIC register allows us to perform a reset without
> > additional signal handling.
>
> Yeah of course we should use PSCI where functional and available
>
> I think PS_HOLD used to be fully manual on old (msm-3.10) platforms
> through PMIC registers. I see that e.g. msm-4.19 has an SCM call to
> (de)assert it. There's also a "halt PMIC arbiter" call.
>
> (via drivers/power/reset/msm-poweroff.c)

Yes I could try the SCM call to deassert PS_HOLD, is it something we
should prefer over PMIC soft reset?
Asking because the implication would be a more complex solution
(though not yet tested):
- Adding reboot mode support in qcom-scm to activate ELD mode
- Adding reset-notifier in pmic driver to modify PS_HOLD action to warm-res=
et
- Adding reset-notifier in qcom,scm (of lower priority than PMIC)
doing the actual SCM ps-hold deassert
- Ensuring that PSCI is still used for cold-reset and warm-reset when
supported...

Regards,
Loic

