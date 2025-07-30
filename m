Return-Path: <linux-arm-msm+bounces-67125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C75BEB15F80
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 13:32:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E79E3B4B37
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 11:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A06DFDF49;
	Wed, 30 Jul 2025 11:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EY0p8jSE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D057415E96
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 11:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753875171; cv=none; b=X9PeIF+w2W1QmnYRxBPY7KACuK2s8HrEFDPsCIjq3xDYm8FU+iyp0pzCjW5niXk/9YaXQuIvZqQ6l6Z9rOb5lCHcJpCgv4Ou+IUFqIZJ7lyEjoi141tfucyEDh6ZEm0jl/yueH8s7jomRS2Ed6O8CYSIE+iNcD/krV7X5jC6xP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753875171; c=relaxed/simple;
	bh=sA7CIKx9JtzmSMrlgZzAhDloWbQe41uj2nnOzD3lqC8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KGugouNr/Qv5QkuBwYUVmgP9Q4zHQ4F4Iwd0V9dRRxEd7vsMdDigYTSWmEvToSHB4ptqhtwHgewqBeumNyWuQtO8tnStmcY4zRE34a0zKhFzudblmc3vbKvq9Dn+KSbcqovMWU1u5ULmnZcHpBdQxaoGgsuPb22MGZH6skwl7BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EY0p8jSE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U4kKGw013712
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 11:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QhSrLEfIXPGfZv83U+5DPeP/WgOAi6APpH7KJyBiwWM=; b=EY0p8jSEYUHt0xEM
	wT38sEMWwjirgHXIcobjApSZx0a1+N1tbZLT2A7ZKcSsI3yycqXLqVo1jLGTYjaX
	U7z1diKt688I3Q+7cKg7rrNBI8D5mQyqnG2KdqPz8aVYhX2XxQ0MJAqmbnwwE3i1
	alAfby0KBdYUN8kFRdhFeE2h8k9bkRatBrV8w9oibskcVFYaUquQ1Dl/lwr4rvrO
	UKwzWruk9hfsht3/eR2m0mUV3MMTQLLLikYdTSDMkkR29+W3QKbNm87RRMmA1xK6
	iFzzP2dTjORcAlDGygQrEln02qk9QJb+5kFRX0Hp41MCGH6zC6Q9El8wm6HhkQVR
	NjMyzQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qda3fhj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 11:32:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ab6cc9811aso74198961cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 04:32:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753875115; x=1754479915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QhSrLEfIXPGfZv83U+5DPeP/WgOAi6APpH7KJyBiwWM=;
        b=V3+31JuH4U3yAbol6W1EXPt7ZyFVOf1TATyk3KWooqpNdoPIcbmm1kkwXtmXe5vJx1
         AJ/3EtyppyVY2W7YvUqtOWWav8zN8kuTIaDFAYMc4IfKuZrOd+tVvCtDmBREXlTEbYwD
         qPkT9HEUAB28CLJ+Sm+0RE4CiTNgtW9ksUdQWByQSoE6WYpcFfMyKDejUzXMk0HGiqlj
         oyx8a1Qi+dqf7WjKr4F6Ufcv3+s13wa6SAS4WGHsabErqdFcLWBfWbGA4uWksdzE+DH0
         M0Ot6IA802m+OFDkmzx7SunqVsbwwrorg0YiWouYBr90h91innA2dwa4nXzEj914cR2J
         y0gg==
X-Forwarded-Encrypted: i=1; AJvYcCVDz9Md/f3eOe9H4ct4ga5o/G3+OIQloB63atnIAbPTqHpnEoMIW+6XwIwcqSlRexwYRtakexhFTayteMWN@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5vQPBVun4DNyEg0m0gnxwzBn3374O+noVp4+TdSiecGiAL3tw
	MkBQKSiMVaZ7ajunQAxeKToES1KVOm3gfUU3phpJhufrxYslY2Na4HZSbRvDZWKh9IG2E+asuQV
	xbyZfE4YP1XY9NQJRSSxHMTR0mo9gVJV3fm+HhxoKAUdCglwckzI42Qf6a1v/5XuDe2JjVilpa1
	waD2USVwa/umaPXVQiPQY0oIMRyLlje9bFct3ehbrg2ncXLhMRUBaquYRx
X-Gm-Gg: ASbGncuWq+Rato+4gdW49tkcCzqPH/jx9a6KJZGLFvV7sH8N/zBI7atLGDUjBlYLvrr
	N4A7E00dq8fGqTqtiM6dnOjfa9tb/NSbHHQFVMmRAkj6r2uzarZMyusKB0ddPfdxAu7LdsPXmGO
	aoKG5uoTwk0M22+3Y+bVuk8VA=
X-Received: by 2002:a05:622a:48:b0:4a9:cff3:68a2 with SMTP id d75a77b69052e-4aedbc3c0dbmr45844331cf.37.1753875115143;
        Wed, 30 Jul 2025 04:31:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgI5SCKV8YtZM/zSBddSyK33G/A0zZdCkH+fwXiqzGFN+iNvRWAG/BAy5IoAavwJ1ONWgDHWYMIrONjqdvfzY=
X-Received: by 2002:a05:622a:48:b0:4a9:cff3:68a2 with SMTP id
 d75a77b69052e-4aedbc3c0dbmr45843831cf.37.1753875114586; Wed, 30 Jul 2025
 04:31:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250722-eud_mode_manager_secure_access-v7-1-40e9a4569895@oss.qualcomm.com>
 <2025072446-ensnare-hardhead-12f5@gregkh> <CAPHGfUMnaJ8HPX=CC_q6m2nbq-ODP=MY_NkcvHjXR8mD9b=tBQ@mail.gmail.com>
 <fo4hek5twtgl7fa5ncqefatowz5nw64iwifaibl3yyzonucpqz@uwwxf5jdke2x>
 <CAPHGfUOusGDDumM81ZwfWCT+4H6ku2rTgYw4Wuz3KduZ96KhXg@mail.gmail.com> <2ee9a4c7-f971-4b73-8c83-cbb26c7072fd@oss.qualcomm.com>
In-Reply-To: <2ee9a4c7-f971-4b73-8c83-cbb26c7072fd@oss.qualcomm.com>
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Wed, 30 Jul 2025 17:01:43 +0530
X-Gm-Features: Ac12FXzgLcQ2yizHuwssmnQfXHgYZ2NUuPDYJso_5m2s0XS8PzpGLEfywe7jhjE
Message-ID: <CAPHGfUMcuXNtGiTmEFi0BvFkc9CvC9JfX8SFVKDg0-qytC2KPA@mail.gmail.com>
Subject: Re: [PATCH v7] usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through
 secure calls
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Melody Olvera <quic_molvera@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 9d0u_eANBQyeqbsVL7S7Fu8O3W8X3ApW
X-Authority-Analysis: v=2.4 cv=Pfv/hjhd c=1 sm=1 tr=0 ts=688a02dc cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=ag1SF4gXAAAA:8 a=COk6AnOGAAAA:8 a=nCA0bClemygIX1r7OBYA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 9d0u_eANBQyeqbsVL7S7Fu8O3W8X3ApW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA4MiBTYWx0ZWRfX5U7yrowZuhrd
 OkZ5+8PsMIsDZnRfhM2cQBknMOEm03/hoeV9gOXkf7tQAlWt0wTfNEBGDJCsJ2huIpDFPOxATJj
 s2xyuT0RgdLLBpBh61tHZVs6JnBAxD2uST2XN0Mq/QbN/jB+0JRRmZChNc+bphcwH5eGlz0rkWJ
 lRjGTwNXxqcDgfPJzPfJDJEsFawxEm2W/9xPPuOHMCIDfXbR19tSzUJhV18k7bCOYRl5LcOmFrQ
 zup1eYSGQxcRYOnEzAg8ZJWXFfHpbb0ymtGBbkBtTvJpSA9gbIvjM/0rF5eJ0qhBNQBXPwFTvHy
 ahkv7eHUkkaOoU5z51Ghp9ObO1u9RvV43tIV/PMKLtxtDwL21BosCNJamfJcLJe0H35IHlvN9BM
 BR1MvHUujFMjyWgYs8i4ye8IXLxuzSPS3movSzTOmj4dtM+YX78DlovWog4utcR7uyDjurW/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=956 clxscore=1015 adultscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507300082

On Mon, Jul 28, 2025 at 4:00=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On 28/07/2025 13:19, Komal Bajaj wrote:
> > On Fri, Jul 25, 2025 at 7:07=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >>
> >> On Fri, Jul 25, 2025 at 06:19:21PM +0530, Komal Bajaj wrote:
> >>> On Thu, Jul 24, 2025 at 3:06=E2=80=AFPM Greg Kroah-Hartman
> >>> <gregkh@linuxfoundation.org> wrote:
> >>>>
> >>>> On Tue, Jul 22, 2025 at 05:01:53PM +0530, Komal Bajaj wrote:
> >>>>> EUD_MODE_MANAGER2 register is mapped to a memory region that is mar=
ked
> >>>>> as read-only for operating system running at EL1, enforcing access
> >>>>> restrictions that prohibit direct memory-mapped writes via writel()=
.
> >>>>>
> >>>>> Attempts to write to this region from HLOS can result in silent fai=
lures
> >>>>> or memory access violations, particularly when toggling EUD (Embedd=
ed
> >>>>> USB Debugger) state. To ensure secure register access, modify the d=
river
> >>>>> to use qcom_scm_io_writel(), which routes the write operation to Qu=
alcomm
> >>>>> Secure Channel Monitor (SCM). SCM has the necessary permissions to =
access
> >>>>> protected memory regions, enabling reliable control over EUD state.
> >>>>>
> >>>>> SC7280, the only user of EUD is also affected, indicating that this=
 could
> >>>>> never have worked on a properly fused device.
> >>>>>
> >>>>> Fixes: 9a1bf58ccd44 ("usb: misc: eud: Add driver support for Embedd=
ed USB Debugger(EUD)")
> >>>>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> >>>>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> >>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> [...]
> >>
> >>>>> diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
> >>>>> index 6497c4e81e951a14201ad965dadc29f9888f8254..73ebd3257625e4567f3=
3636cdfd756344b9ed4e7 100644
> >>>>> --- a/drivers/usb/misc/Kconfig
> >>>>> +++ b/drivers/usb/misc/Kconfig
> >>>>> @@ -147,6 +147,7 @@ config USB_APPLEDISPLAY
> >>>>>   config USB_QCOM_EUD
> >>>>>        tristate "QCOM Embedded USB Debugger(EUD) Driver"
> >>>>>        depends on ARCH_QCOM || COMPILE_TEST
> >>>>> +     depends on QCOM_SCM
> >>>>
> >>>> You now are preventing this code from ever being able to be built in=
 any
> >>>> testing systems, including mine, so I don't even know if this patch
> >>>> builds or not.
> >>>>
> >>>> You did not even document this in the changelog :(
> >>>
> >>> QCOM_SCM is essential for QCOM_EUD for its functionality.
> >>> One option I'm considering is using select QCOM_SCM, which ensures
> >>> dependency is enabled when QCOM_EUD is selected. QCOM_SCM facilitates
> >>> communication with secure world, this approach should not cause issue=
s even
> >>> when COMPILE_TEST is enabled on non-ARCH_QCOM platforms.
> >>
> >> QCOM_SCM is not user-selectable, to it is not correct to depend on it.
> >> Have you had used `git grep`, you'd have seen that absolute majority o=
f
> >> the drivers uses `select QCOM_SCM`.
> >
> > I had initially used select QCOM_SCM in an earlier patch, but based on
> > the concern
> > raised about enabling it under COMPILE_TEST on non-ARCH_QCOM platforms,
> > I revised it to use a depends on condition.
>
> QCOM_SCM can be selected on non-QCOM platforms, so there should be no
> concerns for that.

Understood. I will update the next patch to use select QCOM_SCM accordingly=
.

Thanks
Komal

>
> >
> >>
> >>> Alternatively, I could use a conditional depends expression like:
> >>> depends on (ARCH_QCOM && QCOM_SCM) || COMPILE_TEST
> >>>
> >>> This would allow the driver to be built under COMPILE_TEST while ensu=
ring
> >>> QCOM_SCM is present on actual QCOM platforms. However, this would
> >>> require proper stubbing in the qcom_scm driver to avoid build failure=
s during
> >>> compile testing.
> >>
> >> --
> >> With best wishes
> >> Dmitry
>
>
> --
> With best wishes
> Dmitry

