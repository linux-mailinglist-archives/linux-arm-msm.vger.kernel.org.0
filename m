Return-Path: <linux-arm-msm+bounces-84716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08770CAE437
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 22:52:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3C6393015121
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 21:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D0DF2DC76C;
	Mon,  8 Dec 2025 21:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pK8dULUR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AE5cHtTQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EF62D9ED1
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 21:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765230767; cv=none; b=aEjC6lNI9MuUnVZTu1/PxcseA+xF/LKhztXqELPgYRFBN53cuctbNbuIkLDHNoI+uNogUQ+Kp01ok9nVMY/qCiOeM5kikeKqkroSI+Oi9dpL9W774e2vP87hxdzFaIFnzA6xC4kzT1FIbchJc9b12+BXrc3S3aTcIob9tV4bbRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765230767; c=relaxed/simple;
	bh=Slnor+JN0iFcfZd5NxPtbuPQ62i3eR28iaAD6v/K9kM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AKeb4B12+pvtub/GZcJsO7FblpZUkIIAh7lR9XZA7I9PLmW3VrLam2hkOUpIN7dvZDZ4Q3mH6ZSu+GAS0UlSM3UiN2D1oub4D5PGotrCAvEvqSuD4HkLeNbBtofLu/ELbBBHg7+uV+A3u5isciz5s8OrUjZnf2QHRNC4TlupSoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pK8dULUR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AE5cHtTQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8E5kov1420073
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Dec 2025 21:52:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oqTS0Tct4IrdjazqxdZHqMaIuUGqzq8Y7NDwmG+AE5g=; b=pK8dULURYSuVFl9q
	i2m7FchacIfi1bUy8oihubHk9r7aTvURQo62evM6yKDco4Pt+iqA8Upjnqdg6RWf
	DauZbku9j0kdd9WnCImaNWLpzcL8I1gcx98ZyCDrsvReERlUdZdJ7WhEYtiVzPi/
	q7f6lFG8hi9xl4yPSLYcTxB2693XcR+9BDQQrpEiccO+RW94GjYLuctZHhM56YG6
	wf2Mc9zG4hifJ1dY11/xkvlObpSazFS808bwXdywwhxGp9GkAgc+gnAPcok3eOm3
	JUZOlED2kk96HhzC2N+mQMF5HlirOvoUhx2F/txO8dM8OJXPSFZ1KtdQq1muJ0Gq
	kFnLDg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ax04nha0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 21:52:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4eff973c491so108850091cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 13:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765230764; x=1765835564; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oqTS0Tct4IrdjazqxdZHqMaIuUGqzq8Y7NDwmG+AE5g=;
        b=AE5cHtTQhbbY/4X5BFjpbLDs1+ZmcVe3WDsbbAG0g8RrGfTx4iJl3T8NQxlsJS2vbS
         9syHKefgEVGeL/eiybQGWs+zVBtwLRkEUY7OS2bgbeiCeePRHw1ov0bv7yGVvfs8PFjH
         UTs4DyZyCOTxrxlnmFbJXdneEVxE+/zoHz9fuvBg6QNfi6J3lW79Pxz4wfCBzEOzm2jn
         ulaZ5D7Sp0nXy2NB8jA/FpKbTB8CgbqLHWTAMxffiTkhbrFq80gnAr3uL9/0AHnvEiQW
         AlqhU59xkFyfHElKl5gcxwDla45MmbR/pXwmI9wT76g/wQe5X4+CWCvGGP5l2UMJZNv2
         ZqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765230764; x=1765835564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oqTS0Tct4IrdjazqxdZHqMaIuUGqzq8Y7NDwmG+AE5g=;
        b=LdmHudHEuj310xUJbSDTs2BLdaQmNvQ/2ITkzeRwtnU+vP85eHFamLp2pN4WRP4yKG
         yWxiS5m8rv6S5dNO1jnofplxBAcAsya06Qn0E96Ht4h+ynQloSw7kQUpr7eADIc7K6Jn
         QcsDmwWDOOdR5kJYo2Llgo8fY0arhUP5MjhdfA1yy23W8BpGWzF0FWwF56jRKbcu4g3d
         pdnwomVKf0wWPtv1UYaMw0OK9jQiJt3uxOViufB55Ky00iXLmO9oKS0HYSmXvqeN/kKb
         MHkXzc4nW/I7MBxED9g2D+ZT1Lc/ZfgoE9EimlqS6W6C5QWd/x0+u1b+r1y/cx86ruaB
         MDCg==
X-Forwarded-Encrypted: i=1; AJvYcCV6NKCEMcACA2tzpKTBYeeUTbCLiCkgOe5qDjHtbv4H0kyMtRAmFt2+MnZIwHxrH+PTzw1iaZBOac8wLvOZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxyX/uXxe1XBDV1hwCqUv7ESYFYHiN4CR2DLykPfusF21YqzZDw
	GQQ0wzkrzOovDI/Gi3rmTXlC0DbupELIf+OWdWSVvqBa0ZbKgNO6rrK3hNawoRrKAvDZ20dRtMV
	FqLZs5/2P0FX7vfCBRsT+JP6uKD2Aak7hp76g94FznU8ccaFGCg5bPQvWebFnpZ7H1D7jd0n2rQ
	8bNVPIUA1dMJuNqyB2EMQp2SeEZnEK92Qd5wTnaSXA1BY=
X-Gm-Gg: ASbGnctp/MCobLvaSBNd6QNhDPoLDtywUyH5cZuhWbmv6Uat1JP1+TubwISp/FJSNrX
	3QRRMIEAj1BPQPvMeJ/MqqHhoGx/WRCQ14njC6B58iktcR/vQ3eLmmlzD6hLYnohVD37+gjA5wk
	0C+N0DYO2160kpo5KdLrHT3BBOgzQuPF1OTbl9f6qzoLdJ8Ngfv6hkLgfeor2WqBSLlCFOX/j/p
	5zYUzDMCwR5ve8W2MHNVG/umMt7
X-Received: by 2002:a05:622a:1104:b0:4ee:26bd:1401 with SMTP id d75a77b69052e-4f03ff1618fmr131974541cf.72.1765230763876;
        Mon, 08 Dec 2025 13:52:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQlY/xxqaC1fvA0toKGgeuU6suJgg5SATcyujgCwrFMEU0vwqsl/RTELFWVdraPRMaak4uD+Sop1eVlj64uQo=
X-Received: by 2002:a05:622a:1104:b0:4ee:26bd:1401 with SMTP id
 d75a77b69052e-4f03ff1618fmr131974361cf.72.1765230763455; Mon, 08 Dec 2025
 13:52:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251205160437.259125-1-loic.poulain@oss.qualcomm.com> <r33k3aif4lzwfwashvkstqbxyncrr2yrtqejobfj6pm65wasi3@gyy3zex3u7lx>
In-Reply-To: <r33k3aif4lzwfwashvkstqbxyncrr2yrtqejobfj6pm65wasi3@gyy3zex3u7lx>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 8 Dec 2025 22:52:30 +0100
X-Gm-Features: AQt7F2p0VmA_IkuQAYSme4kXiXphTi6Hr3cSIsncWSFubbCfhMpb33g5YfAbq3Y
Message-ID: <CAFEp6-3Gv_F7RZD=b_aXfwFdM-mR7xh1DcO=efnmNy1ZaT738A@mail.gmail.com>
Subject: Re: [PATCH] phy: qcom-qusb2: Fix NULL pointer dereference on early suspend
To: Bjorn Andersson <andersson@kernel.org>
Cc: vkoul@kernel.org, kishon@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, dmitry.baryshkov@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDE4NSBTYWx0ZWRfX8Jh8FribXX7c
 TNaZiigc5tNAqDxJxaKr6Eg39+EziFi7Xh1oQgBE1uRywZDe9NZ0CmdGBKe4vpb2v4vBS9Npl7K
 h7+dLxm7Evbh4MGQTJJNtNmqWv5nklSFZZmw0UOpiyfw4bCTufMMAhTUuiBJSuUeDN6PhUCjeFb
 FeVSV2IwOVch6i+iIH9BOYWEVbNhtXt9c63t1vKZfJaqf65RJjP7vrOFkvp/v0UMFldd9vlj9uG
 sJ046F+NN9iRO271NJ1kZPcI0wBptOJ8pDwSR2+ZxeIxiQQlkTCxsWD1Mz1WXF4i13LTtVlBslL
 S91Et6vY1ks80HuwrT4li9PFkVkyFCsfFAcdt0JpWLxdacl63LWUEltkjW+/JLDtU2Z/Tsc6Hoe
 tNmtr2pdHhqjUX2opiJ+Q/SnjaK3xg==
X-Proofpoint-ORIG-GUID: RdgIGX2udi9WhUMsfqX4Hw9oSqnsM07v
X-Proofpoint-GUID: RdgIGX2udi9WhUMsfqX4Hw9oSqnsM07v
X-Authority-Analysis: v=2.4 cv=CKUnnBrD c=1 sm=1 tr=0 ts=693748ac cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Ily-Lp4ULqXFMyuIuh4A:9 a=QEXdDO2ut3YA:10 a=-_B0kFfA75AA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512080185

On Fri, Dec 5, 2025 at 10:30=E2=80=AFPM Bjorn Andersson <andersson@kernel.o=
rg> wrote:
>
> On Fri, Dec 05, 2025 at 05:04:37PM +0100, Loic Poulain wrote:
> > Reorder runtime PM setup to ensure pm_runtime_forbid() is applied befor=
e
> > enabling runtime PM.
>
> Your commit message is pretty good, but in the future please consider
> following the documentation [1] and really start your commit message by
> establishing the problem. The "most significant bit" of your change
> request isn't "let's reorder something", it's something along the line
> of "enable before forbid can result in autosuspend, which results in
> NULL pointer dereference".
>
> [1] https://docs.kernel.org/process/submitting-patches.html#describe-your=
-changes
>
> > This avoids possible early autosuspend and prevents
> > qusb2_phy_runtime_suspend() from being called before driver data is
> > initialized, which could otherwise lead to a NULL pointer dereference:
> >
> > ```
> > Unable to handle kernel NULL pointer dereference at virtual address 000=
00000000000a1
> > [...]
> > CPU: 0 UID: 0 PID: 11 Comm: kworker/0:1 Not tainted 6.16.7+ #116 PREEMP=
T
> > Workqueue: pm pm_runtime_work
> > pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
> > pc : qusb2_phy_runtime_suspend+0x14/0x1e0 [phy_qcom_qusb2]
> > lr : pm_generic_runtime_suspend+0x2c/0x44
>
> If you pipe the log through "./scripts/decode_stacktrace.sh vmlinux . ."
> we get these decoded.
>
> But that said, I'm pretty sure that what fails is the attempt to pull
> cfg out of NULL on the second line?

Not exactly. The actual NULL dereference happens on line 7:
    if (!qphy->phy_initialized) {
I assume the second line is optimized and the compiler defers the load
until cfg is actually used.

This is what I got when debugging this:
/scripts/faddr2line drivers/phy/qualcomm/phy-qcom-qusb2.ko
qusb2_phy_runtime_suspend+0x14
qusb2_phy_runtime_suspend+0x14/0x1e0:
qusb2_phy_runtime_suspend at drivers/phy/qualcomm/phy-qcom-qusb2.c:639

>
> > [...]
> > ```
> >
> > Fixes: 891a96f65ac3 ("phy: qcom-qusb2: Add support for runtime PM")
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-qusb2.c | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualco=
mm/phy-qcom-qusb2.c
> > index b5514a32ff8f..97bc3755a390 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> > @@ -1093,13 +1093,14 @@ static int qusb2_phy_probe(struct platform_devi=
ce *pdev)
> >               or->hsdisc_trim.override =3D true;
> >       }
> >
> > -     pm_runtime_set_active(dev);
> > -     pm_runtime_enable(dev);
> > +
>
> Doesn't this end up being two blank lines?

Hmm, yes good catch.

>
> >       /*
> > -      * Prevent runtime pm from being ON by default. Users can enable
> > -      * it using power/control in sysfs.
> > +      * Enable runtime PM support, but forbid it by default.
> > +      * Users can allow it again via the power/control attribute in sy=
sfs.
>
> I think this warrants adding "TODO: Removing the pm_runtime_forbid()
> might allow autosuspend to invoke qusb2_phy_runtime_suspend() to
> dereference the NULL drvdata" here.
>
>
> But, if we know what the problem is, perhaps we should just fix it right
> away?
>
> Looks like the fix for the NULL pointer dereference is to move the
> dev_set_drvdata() and phy_set_drvdata() above thus hunk.
>
> And the "problem statement" stating why we're doing this change (which
> still makes sense) is that "a wasteful autosuspend might happen between
> pm_runtime_enable() and the pm_runtime_forbid()".

That's correct. My initial lazy approach was a bit simplistic, just
swapping pm_runtime_enable() and pm_runtime_forbid() to indirectly
prevents the NULL dereference by avoiding runtime suspend, but
ideally, we should apply both, swap the calls to prevent unnecessary
suspend, and reorder them with dev_set_drvdata() to restore proper
initialization logic. =3D> Will do this in v2.

Note that Once this change is accepted, I plan a series to replicate
the fix in other PHY drivers that exhibit the same issue (e.g.,
phy-qcom-qmp-usbc, phy-qcom-qmp-combo, etc.).

Thanks,
Loic

