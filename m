Return-Path: <linux-arm-msm+bounces-85219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 298EACBD2EB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 10:35:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3D4803015ACD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 09:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEA56314B8A;
	Mon, 15 Dec 2025 09:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ijq9ODai";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d0FOiAoE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620E22DA757
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 09:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765791329; cv=none; b=SUxU/w78PZRUtyHWJskqpJxPeELm323zmwm3XOVCGIZxQoeNwzeJ8tBqxwxSd64qbBcA7BYlrMKQcPp1Q8b+m+I4lceUjtMYFJC5QZKqlXD3q7kJkBorzrkBPuQHb7/9hvGoHnqcvJIpRZ0Iobu5XzVlDxzptHjJ+TmprvbbhFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765791329; c=relaxed/simple;
	bh=MJWYNoijKACZhf0cDJh5RBkcwi5oPSTkAiX0TJj8NVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K5h8eu8orDlGXN2EGNR2JV4OZFgiOzzuhNDaUlxOM4gPsyMWth4u54YD+B1u14skNfFS54uXiOaA9r/yVZ3e++c1VwDgMYH4SCNyHilHeuJzve5u+610bPvWhCVKYZ04qRgubhLKboPbXklPMH7N0Tu+8LXYfA5Nkf92PBnpFU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ijq9ODai; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d0FOiAoE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BF8dRmD3343435
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 09:35:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MJWYNoijKACZhf0cDJh5RBkcwi5oPSTkAiX0TJj8NVo=; b=Ijq9ODaiLQHimDCV
	3NyxCwarW9SABgTjzCRYb7Pz9S0RSJfBybmHHAjUlPpYMyanxd4+5XwRERZBMa2f
	mQBT5qLDPJ/n/qs80MCHGIwr1xcHp6JCIvqLpW1KV9fWXJD8K3aDyp54ozt738TW
	IJ+Cf/4blAiP9o5zUrojJCM7rJL0xi9xgQGsxtT9qN6msV2qF+8Mr4NBmzwWwZBN
	uKm1WBUl98omqbAnbNizu8J4khs5KXAnCk4SOjcRP4ZUNikuv0TVwYgXBocqBH11
	ATEzQn8TwiQXXuf8qQni4KuR+C2sk6vTzNS7+QVOskTbhr4Rj2vqoAWCYcyj3N+L
	Sgd8+A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b11cykyaq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 09:35:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed7591799eso74272121cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 01:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765791326; x=1766396126; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MJWYNoijKACZhf0cDJh5RBkcwi5oPSTkAiX0TJj8NVo=;
        b=d0FOiAoEAjpE9vJ0J6j87OTWzWzu2hg1qyVNRguXhGR19fl8q3RmPBtiqhWcklZd2T
         UWsyKZ008hD6A3AxmUK3UklHMzktyk/ACGVzZ+XfyPAGk9JClSiYFX2XWReM6YEyUfIG
         PHBRZSdJyMjClPed3Wx7zCVKjlcQiHnLwM1jiBia+mtR1iKWsBkc1JmngWf8ny59go7f
         /FrbVpknxda04xhKOAYcaz35tdUHR5cQHDTN+wWXQMpo/BYwwFSMDL9mBydHFExXjN9p
         kw1oLwAIeHtCCD7XIyerhflgzSsH4gpaCVTj3DNUyP4pUw4+TE96iUmslWJGlXb3w9Sj
         ZEWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765791326; x=1766396126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MJWYNoijKACZhf0cDJh5RBkcwi5oPSTkAiX0TJj8NVo=;
        b=JmOafFO1F5WSF0Wi3M3QgNRZyc9/WYbRNuYE/d7aUruKtVE+mrMl6Be3UV7WyqQcjD
         lGFtp+aJ1fAZP8VfXA61P9j4m4Opq3smR5Nk5OSNzIauY529YM5ED1YQZ6csuGlLsECp
         dArMP9MPY5rFTBhiQsBEkglDO9qmbylsEXmhFl/Nz8LXgmqgFaldXteebKAu6evjk0Ap
         gcQo9Mx8zQcl6JpzlYXWhh1jVwIoaVxcmfPZx0yRPdksuhITg35fODnGvmKd+twXAsgV
         lKqUXJtv+gFnI8OrLXII3XJCPEnqnpql/ALH2C+B0Ecun6bNR7a/FKbALoQ8BijGkqMm
         7Zsw==
X-Forwarded-Encrypted: i=1; AJvYcCWpW684plHsX4Rtd+5D42HlBnyD3FGEBx4tI7grv1BHzC1vFKHsHmhEfIE/Odadp/Sx3hMjJRfvBeuNlK0x@vger.kernel.org
X-Gm-Message-State: AOJu0YxgyD17lp8QwfRnuOYp5/imM3IGcGH+nfbfITownQIev5tEYoXP
	46Ldgr9HqtJNEUtfQKSbBBuVYxe/82siCh5clzbaudm/B7NqUW5Cw4RNcLCzkZat4dwYkYVFKOr
	lCehm8S4NCHFkDDCzNXpFkx4Ls9NI3G7tA3/FweLXBMmswkB+NQZ9R7tMeov3PJMj2XqzeppkzW
	4IxxNSuTEToMv9jOzK0TZku8se87wkOppgw2GHKeQyVug=
X-Gm-Gg: AY/fxX48qfnkP0ZLrXDlXj9Okq7IQn0Z7ivvz2TuJLNM9FeoJ2iYkgC79xSIuCrSf7c
	bHTOlcKANrzmm9IEYBUtwFu2DOwLqbmg294QqdUy9V7MdeUBFsmjzmyQAaW6kkmsCQauS/u21xI
	tdFPgSUVxKpsWcGJbrwAq58kKuJU+scup3DO9iu6KifZ3i15LXx8YQAaEjdm7XxMUmSbDrZocrW
	+h+USnE0TABmqS3fDozniPyg8o=
X-Received: by 2002:a05:622a:5c96:b0:4ee:4a3a:bd0f with SMTP id d75a77b69052e-4f1d05f3245mr145330731cf.69.1765791326577;
        Mon, 15 Dec 2025 01:35:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEOKuYvRw82Q/pFKFm7NzaaRCE+w/qvrke/M6Tab+zjDyrCQWqXZJl5TcsJzvuk81rmy2MB1DoBlhmYev5gnuM=
X-Received: by 2002:a05:622a:5c96:b0:4ee:4a3a:bd0f with SMTP id
 d75a77b69052e-4f1d05f3245mr145330521cf.69.1765791326121; Mon, 15 Dec 2025
 01:35:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251114133822.434171-1-loic.poulain@oss.qualcomm.com>
 <20251114133822.434171-2-loic.poulain@oss.qualcomm.com> <aRtbwK0Afo50Lh0B@kekkonen.localdomain>
In-Reply-To: <aRtbwK0Afo50Lh0B@kekkonen.localdomain>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 15 Dec 2025 10:35:15 +0100
X-Gm-Features: AQt7F2rp-ZrChXGlmL-Mm2N-EwG9Tf3xPbpi4Dm5-uAespUvYTGXUcc6g_5CJsc
Message-ID: <CAFEp6-1Tdmr5v0r+q0qeOG6qqA-hiBaF1iTEcmhBA0oTjLgbgg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] media: i2c: ov9282: Fix reset-gpio logical state
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        dave.stevenson@raspberrypi.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mchehab@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA4MSBTYWx0ZWRfX6ONtNPD0uZx6
 FYa7prkfjX5NtAAByrmT3OU/dcIc6Guu3ZEUftUV0rneDJtsDY7YXf6n0QIVP8MckM/vM2CrKhZ
 yn1hc1KwpVa+Su9aKj97CagtOYjOP+ywtaCsI1ina4uvN6O4smQQsM/2QkRrvNk1Cw1IZWFiJhg
 Tv+3KsYdfQ/2gAjUG5/DHIL/NekEWBoJxE5I9tfjDD0M+NvLevD222enww50DW2O2rzg0jnAFx2
 Bkc+oPg4eGsDqbE+s215U5E3k3vP+bZ3DiQJYCl6+eCFVynraErWq/TXqEUL41WzxNoVfGNkJD4
 EB9DJw5Z7Hf4RRxFsRiWeniryO2baBq+DqSwDoZnH7dnkmeJOiwXW3fq8aUfAJV4CocWkXrMSdA
 BUs4dFrBQrEwJCclNfuw6C20z4a0/Q==
X-Proofpoint-GUID: 5DKZYPz-LqK8G4YRkiJVFBlIowIb1g34
X-Authority-Analysis: v=2.4 cv=Afq83nXG c=1 sm=1 tr=0 ts=693fd65f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8
 a=y2W2zGIOAgzQDGN_av8A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 5DKZYPz-LqK8G4YRkiJVFBlIowIb1g34
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_01,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150081

Hi Sakari,

On Mon, Nov 17, 2025 at 6:30=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Loic,
>
> On Fri, Nov 14, 2025 at 02:38:19PM +0100, Loic Poulain wrote:
> > Ensure reset state is low in the power-on state and high in the
> > power-off state (assert reset). Note that the polarity is abstracted
> > by the GPIO subsystem, so the logic level reflects the intended reset
> > behavior.
>
> That's an interesting approach to fix DTS gone systematically wrong.
>
> I was thinking of the drivers that have this issue, too, but I would have
> introduced a new GPIO under a different name (many sensors use "enable",
> too). Any thoughts?

Apologies for missing your point earlier. We can=E2=80=99t really name it
enable, as it performs the opposite function and that would be
confusing in the device tree description. A property like reset2 would
be more accurate, but I suspect such a binding wouldn=E2=80=99t be acceptab=
le
from a device tree/bindings perspective.

Regards,
Loic

