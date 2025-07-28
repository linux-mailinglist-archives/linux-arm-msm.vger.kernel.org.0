Return-Path: <linux-arm-msm+bounces-66831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 588C5B138D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 12:21:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E16A1720E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 10:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FE901FBE9B;
	Mon, 28 Jul 2025 10:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AlawJk5M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDD025D1EE
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 10:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753697959; cv=none; b=PTy4gWNcX2IzqcLvVJbdyDXuc18qC9b0BbhneyUjxmqRzFmExnrhzkclzK2+aesIZoH38LW/mzIJazflRx2Kpr3csEJI7DQpICdCDsa8E46fDrkM5m3lQuf9eRsiFXlMTOPtRM1gD0OHMui7dvgI8ijxBYUIDy1Ro3VflKQrjTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753697959; c=relaxed/simple;
	bh=yNigUOA6pm0FmhyE2Az3PHx7BLDsPG5gveHCt4RTApI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KF6otqnhkEmO+8VG0j3fhiVZg3M7gpvI4UPMmeHCQ8CCbzV5k78LO8BptoD2A3ujuBxqqnGF6WVGHeSxLt52fMvFxYcBvOkN9EQ7u6+7PfLMvnTYIXyJfLsc88+ag8MiU/p+NksPNcV2ZnkjGhcXgSl+nozK+yUbKV61sGGuMH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AlawJk5M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56S4ruD9008881
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 10:19:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qCAkqzNEArjyO8l+IqYZDgX3WVmNl4Qdxh+2kVLmr9k=; b=AlawJk5Mey8lU8ri
	JZYTT+2E88oP4S9b1Ad//c8Q2a/3gFsfVJzWsyA2Hh+KBMcfUu6YsfagdhzrY4Tf
	5qje1wJjl0b4PjzsdyXzdd6qAuZa3ga9+SX8K0iBzCvfMjVgpVrij7TgQ8wei3eU
	FgQX/QegXtaJMV073dzA2cD1Jge1fUbhXi/D0fy94JPgDxBJORpXzf0z7aIJtHn9
	0EOimrYZluoHNl/cdSV53kb7oTH7o2zw2+0bri6hbphgwnJY891nCP2dCXmUNWa1
	+7X6NlkrkZ97Yk2ZXOuUsbc1iO+OFQtIIH8bACv3Ig+zzXqrGBKLexpJqAOy2oTU
	IRfBcg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qsk46y7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 10:19:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ab878dfc1aso92073901cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 03:19:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753697955; x=1754302755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qCAkqzNEArjyO8l+IqYZDgX3WVmNl4Qdxh+2kVLmr9k=;
        b=dend0nHHT+bLrTJOucjAKhby4r5u5iu3ylnrfnl1z+1i1qcqUUJR5L0aSXgeq4FrOl
         TDkIqQnIQI/89PMqb37qu2c/VKddZ7ZCIjjWclB/Sxxa8VHjLQA8LDbFzab5RKsCLp+/
         ts9/2sR8LEomfmJHLnQtjLL8IWqcBqKazwXdCtdGXO41RNyYqQVgMr4RKW4nF3f63cE5
         aGyg1aoVthj9rgM8bCtLcGd/Thk5GTBezQvht3CF9AuMYJAGdEa1GoOGfiiLI2CbdqNm
         on9M1REmPDFi+OqjeqK3WquWTSC4DTggbs0hkZIrBQ5SBNBoNdCOG6lZwkAF8KFRF0df
         p5zQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVLfRQQrIlF/bzQnEwU5C0m4o6KjLkF7xkoNBqZbfLdUp/M6nlyLy8nvlKvALHy3/MaUnVOeKsZvMq/PsO@vger.kernel.org
X-Gm-Message-State: AOJu0YxiVXITeufYyyHjIaKCcD35VFatdPssIxTICaXQ2rC/B9GP4m//
	W3E73Bl7Gm9BdEcpxHY3RaHM/GNuxs11xQkF2IPGftJw50DnpHfMwC4MCW/dJhQVUctn0JJu2GY
	AUsYKxl/7RDRTROVhzNnNMFaL/YTVe22Z8+eYR9m6dl2I82yywjfQ3zZRBTeaVqIFsVfynd2mxA
	w1boA/a8qe1pzErcG9QqtUBv79S5vCsztPwpDHxO5P9hEspWOZWkA3shxP
X-Gm-Gg: ASbGncuNF6J61x0CBb/WW3U6Mz9lkFoPlG9Q9S30u9IrkHHnrXmZt+y+th9SvXL7/+z
	r4Mn+eZ0gFQzOaCQ5aV2e8CX0zvM9oGmeoCqoPplnU0nMJG3Lo1a3QlxrvXNXIxn0EAfDxhBUDY
	doU2X/ZTdCzm0rbO1T45LpfEU=
X-Received: by 2002:ac8:5754:0:b0:4ab:6eef:315b with SMTP id d75a77b69052e-4ae8ef7e1cdmr169957101cf.23.1753697954846;
        Mon, 28 Jul 2025 03:19:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEN78DW4LBZE0r/NJmIp1+Eb4u/HsFKHPIwJ9DwJxNeoCH8vSbe82y+ipojmokYnEObzitbh04M93nPQwuZL3M=
X-Received: by 2002:ac8:5754:0:b0:4ab:6eef:315b with SMTP id
 d75a77b69052e-4ae8ef7e1cdmr169956831cf.23.1753697954376; Mon, 28 Jul 2025
 03:19:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250722-eud_mode_manager_secure_access-v7-1-40e9a4569895@oss.qualcomm.com>
 <2025072446-ensnare-hardhead-12f5@gregkh> <CAPHGfUMnaJ8HPX=CC_q6m2nbq-ODP=MY_NkcvHjXR8mD9b=tBQ@mail.gmail.com>
 <fo4hek5twtgl7fa5ncqefatowz5nw64iwifaibl3yyzonucpqz@uwwxf5jdke2x>
In-Reply-To: <fo4hek5twtgl7fa5ncqefatowz5nw64iwifaibl3yyzonucpqz@uwwxf5jdke2x>
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 28 Jul 2025 15:49:03 +0530
X-Gm-Features: Ac12FXzcjMs3ledjXLB2bivgGjtbaYbhCNNmEJxWDSmTRQHXrmyOKExQyuTlQ6Q
Message-ID: <CAPHGfUOusGDDumM81ZwfWCT+4H6ku2rTgYw4Wuz3KduZ96KhXg@mail.gmail.com>
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
X-Authority-Analysis: v=2.4 cv=KdDSsRYD c=1 sm=1 tr=0 ts=68874ea4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=ag1SF4gXAAAA:8 a=COk6AnOGAAAA:8 a=qPzGZKhM6qUPuxfXCfQA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: cnq32EfiKxUGprHIv_ikiM2JV-LlwFhd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDA3NCBTYWx0ZWRfXwJ3EXeKgWmqp
 GCqB2fk424FN4v62F+cDXFNH4QrgfZ1rMAbKNfPtsQOvCv2QKJ5VzTYAu90uP0XkgYgf5ta8gXr
 txMNoAUahKYxoVxC/VJwAYlRMgBTvC1cigCCOMhtJzHb7NwT8C09Ve78Aotk6ZparxJjUJF3FXJ
 EJKiuammzFbn8RBa0HRDsm2/s+NanL1XXvka8S61qa//0hMk7+DpSN//yjhsQ+Bhc4lRp5Fu6HR
 cICvdzyHZmsuF9/JYaYX3ehoCKaYhPkVrAgFw28VnoPIxNTU1R6vjklZgjlNanja7SmSSEzASqd
 C9oy7Tuz9KDmBb25Cj3Kyo7eycy7tkE6IL5qfePmpkdBZH0apXiIr0H6INqDgVGdHbtAdsHNIsM
 2TamNh2gCaB2E0/jyV4YRw0G3vmsf5g5y0t6ID/RfjBogEjT0evsXg+sOGK0LuP1w5g2m8oh
X-Proofpoint-ORIG-GUID: cnq32EfiKxUGprHIv_ikiM2JV-LlwFhd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 mlxscore=0 spamscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=925
 lowpriorityscore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507280074

On Fri, Jul 25, 2025 at 7:07=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Fri, Jul 25, 2025 at 06:19:21PM +0530, Komal Bajaj wrote:
> > On Thu, Jul 24, 2025 at 3:06=E2=80=AFPM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Tue, Jul 22, 2025 at 05:01:53PM +0530, Komal Bajaj wrote:
> > > > EUD_MODE_MANAGER2 register is mapped to a memory region that is mar=
ked
> > > > as read-only for operating system running at EL1, enforcing access
> > > > restrictions that prohibit direct memory-mapped writes via writel()=
.
> > > >
> > > > Attempts to write to this region from HLOS can result in silent fai=
lures
> > > > or memory access violations, particularly when toggling EUD (Embedd=
ed
> > > > USB Debugger) state. To ensure secure register access, modify the d=
river
> > > > to use qcom_scm_io_writel(), which routes the write operation to Qu=
alcomm
> > > > Secure Channel Monitor (SCM). SCM has the necessary permissions to =
access
> > > > protected memory regions, enabling reliable control over EUD state.
> > > >
> > > > SC7280, the only user of EUD is also affected, indicating that this=
 could
> > > > never have worked on a properly fused device.
> > > >
> > > > Fixes: 9a1bf58ccd44 ("usb: misc: eud: Add driver support for Embedd=
ed USB Debugger(EUD)")
> > > > Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> > > > Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> > > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> [...]
>
> > > > diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
> > > > index 6497c4e81e951a14201ad965dadc29f9888f8254..73ebd3257625e4567f3=
3636cdfd756344b9ed4e7 100644
> > > > --- a/drivers/usb/misc/Kconfig
> > > > +++ b/drivers/usb/misc/Kconfig
> > > > @@ -147,6 +147,7 @@ config USB_APPLEDISPLAY
> > > >  config USB_QCOM_EUD
> > > >       tristate "QCOM Embedded USB Debugger(EUD) Driver"
> > > >       depends on ARCH_QCOM || COMPILE_TEST
> > > > +     depends on QCOM_SCM
> > >
> > > You now are preventing this code from ever being able to be built in =
any
> > > testing systems, including mine, so I don't even know if this patch
> > > builds or not.
> > >
> > > You did not even document this in the changelog :(
> >
> > QCOM_SCM is essential for QCOM_EUD for its functionality.
> > One option I'm considering is using select QCOM_SCM, which ensures
> > dependency is enabled when QCOM_EUD is selected. QCOM_SCM facilitates
> > communication with secure world, this approach should not cause issues =
even
> > when COMPILE_TEST is enabled on non-ARCH_QCOM platforms.
>
> QCOM_SCM is not user-selectable, to it is not correct to depend on it.
> Have you had used `git grep`, you'd have seen that absolute majority of
> the drivers uses `select QCOM_SCM`.

I had initially used select QCOM_SCM in an earlier patch, but based on
the concern
raised about enabling it under COMPILE_TEST on non-ARCH_QCOM platforms,
I revised it to use a depends on condition.

>
> > Alternatively, I could use a conditional depends expression like:
> > depends on (ARCH_QCOM && QCOM_SCM) || COMPILE_TEST
> >
> > This would allow the driver to be built under COMPILE_TEST while ensuri=
ng
> > QCOM_SCM is present on actual QCOM platforms. However, this would
> > require proper stubbing in the qcom_scm driver to avoid build failures =
during
> > compile testing.
>
> --
> With best wishes
> Dmitry

