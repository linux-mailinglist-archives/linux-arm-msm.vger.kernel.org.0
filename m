Return-Path: <linux-arm-msm+bounces-91939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GaNBVC/hGnG4wMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 17:03:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A39CEF4ECC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 17:03:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97039305B966
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 15:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ACF0421F10;
	Thu,  5 Feb 2026 15:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PeoBVwjT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dPyAvZNF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183AA42B757
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 15:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770307052; cv=pass; b=hTVqtf2CYwR5NOWOBTaku7eULQ/2RhyIm7ljHH+Tx6o52nuo6B0RrTGM+Y0yWpPad5OjMirFKZF+Gt61QqbKkCqIaljcEzmHwIsPVLTOKeCActrYgmCvNRWlwGTGKI2le3w0oIRTYDx+ZvFzhoVZURpnrqI7DrbZG1frmCFal3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770307052; c=relaxed/simple;
	bh=VGp65YHirjqnuTnVdsh8G0pAsuaXyyjsTXTi2+GENag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sHfc1xOAP5URm7yZjruKE7oruTh9aORb/uv0XRIMCcVzIjyw3Zig5Pg3dilwIeTxt5s0RP4nJGXVkGP/CK5GO3LguZYAhqfuhdrTw8OkUQucCa4zQP+pscfQ0nvH8uf0TN6TVpPvCCHlSke05hWKvkbQG9cIiR27XTziAXemEE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PeoBVwjT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dPyAvZNF; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615BhK1f3047940
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 15:57:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fSzWOY7N9ZIbhHc3cCqI4uZzb8cUVIyyPjxeJeKfZMo=; b=PeoBVwjT9W5kVcXQ
	fXPz66lYjlq/Eiv/oYUWDtQlTFgOIzhmVOTucVLEkcFoWW8/PvpJx+cauzrMenDz
	k4+W64P3YUhXwFZ7xZBJzV3thwdPi34nrgxPmJ3soAsQ+GsNLjANFnjU+pjH6h38
	FsdaJD8ZGWaX/ZPok5ytxp2uq5ELL3fIXxF45LsF0qFkAvqWg/dn3DkhH+IqKBXP
	XLuRPUdY7mRKOCYnGXfu8QjE6MZWrjB43cMjFsKOg1MKfYslAlzeyaWNGhi1qFE5
	dVFxMugv1ngeC02SQYWQpTjG5V/LvMicrC021mlP8aVSEfgniO/KMOd/s0UAeNb0
	Hl5Yeg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4mrthxy8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 15:57:30 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8947d47793fso76691416d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 07:57:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770307050; cv=none;
        d=google.com; s=arc-20240605;
        b=LlxJptOF+PgYe0MpxKNP/0Gm5jpIuXMQQJhue05povhmHu3YvSACpvF8pxNYNBT1yT
         muBiG9SwbhpUTBvnonkMBtEn/4nFnnqoolPzSsNQfPYMZ8AjpUZs8d6JZ/a5dOP4EZkQ
         cHROSgU1r5MDGajWErL0/VTX2KkRW34ireW+t5qx/zwSKF+QIGW+hH9g308m9q4/E0v3
         xM2hDOzCBMfPryxNfAViD3m/Jle6j1HT3BJ5rX/NUXy/pM3xPbB3JwIKUySHlgqBkvzN
         ih5jlBuDjqz2qPgO4K1UOnfxXaIY+WjmLPHFHCrng0ZQfboEvU0ZSDB6H/S6kFwocx8q
         OUNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fSzWOY7N9ZIbhHc3cCqI4uZzb8cUVIyyPjxeJeKfZMo=;
        fh=aJCp1QWbpB/zxYFwqyGHVEQYdPVcTwzloMrZ3rQ8msk=;
        b=G0DlbqtHzKfMBnhLBhm099HMGr4Nqs/GIElm9JDae9DzRqqZTW7lOkT0d9STx7KDYF
         9osDvVulyfv6l9cbX8w0qazhiV8qyrQRXE0sVBgO9Wz9rENhrYjKeC9okT1tTw54KzCX
         dVYiaoHLHjHysJD7Q/c1IhgPWvPRZ8anFb6UEqefQy5pGF+MI+y+Z/wN/EOWCKWyw5jJ
         hXreSc+eM+TaZkIXOUnVczsPdloZ8vIDIKrND9kl52iJOp8uSsYkEWBaBaBCugOsyhTY
         WTHiTsKWtYz5TAhGg+xVLobyz4IoTz8IrkJw5L47f9JaG+R2RVlmuh4jlaWh/iVzOS+8
         mSwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770307050; x=1770911850; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fSzWOY7N9ZIbhHc3cCqI4uZzb8cUVIyyPjxeJeKfZMo=;
        b=dPyAvZNFGQgAPa2RxbUnzvev4fWMODS91f3Od0CXBvwVr0+NjW4vbCysEXetCG9c2i
         yBspnyvQ/HFzrzF9B7a20ACba5be1lo2n0nbCD0HsoclNm3MPKehhEyvAIFP74+DwK7b
         gB2OsnI/EC0KPHkAG3n4YxsocMBlxpNDh1TQfgmwvoqjmaVvDDj6e6npfmMf/aR/Tg4a
         DEq1IX/1q/bULKAiRBS9EgRE6Q4XraIJnZ/ulbp3Nc3ozad2vpNrgaiDmbc8J3L1rcqx
         jbi0FwZDlimdhzLzabtDU3TZRUID5fa5lR+UNUPeiwRD1YMp9KrB//FgV7/ixIN4CU+i
         /5PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770307050; x=1770911850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fSzWOY7N9ZIbhHc3cCqI4uZzb8cUVIyyPjxeJeKfZMo=;
        b=skGMDiI8AZficehaUBl2TQkk3eTP2llyDund0T6RV0zdGy02MFE48MSnkgsjG+jvSs
         Ij5tnaza5oqYBTqHwNhShORaMPT4DPkC8mqt6QaDiq9Pmi1K+zsf/JuoLN/HrgqxQUTi
         GYrXQP6ArcT16cDA9pDSflm+VJOQUglOQTPLNvA3FrkgZlOdlV9uPOzEpkMHihUBPLA7
         CLmruCh/roeqwqSHz9ol7JGZUx3k976JOhcjWBpzZtK+8dS9pLd3grnp6bBZHaHbalty
         hprLTg8HPNUrnjMNkM63PcCEJ8CuA6lRoESUQkp3HlYkgjf0n8lX4XYRgcw3isT/OHVX
         6moA==
X-Forwarded-Encrypted: i=1; AJvYcCUe6EaL1WI/0UazVmCSO/WoRNYk5y+S/mEdoMDB6DXf1LlYWSS9oieE14M8sF9QZxlXHtKU5RBeyuFYF43y@vger.kernel.org
X-Gm-Message-State: AOJu0YwQF392EuZyOyG11tIfGR4tQnniBmHrXEHNT61tLWTdOifYQ/fR
	F6noGHR3ItdoXUOykZUWO49oszvXRutkt+ng5ZRJcWI6LlXjCg7q7nA+MF4z0WBfLahNnd1XeR+
	qWki0yDuS7x0CsZN59bfHTN4CqR90fnFjML/yjOsc4EK2wNf59qYE64w6GVKTk/1wxAHBeAzdWb
	bbegbXSMNm46a5eCwcVDAkMBpNzyls7bp0dxsE3GxtGZ0=
X-Gm-Gg: AZuq6aLDYBSWhD1CELXS0+giHVsEIJS/mfKIRvpbtOv5fU1NR741S1I3N3v6dypCWJz
	ekFSR0adk09QtqLgiMQzi2IzJcpnxPzQNe0B2GcA4T1VFqadr7ileZIE3x5Byu/c4Ixvb4zcekB
	icEGhY1sCl9uHD3LBEJEzHSmuVE1rgfEHfutBpHy+CMoJfVT8IYbzb9mrlRhmxcUlUlajR2nxMA
	T7+Na2JTt69TG/1KzBACMT29Ig=
X-Received: by 2002:a05:6214:20cc:b0:894:6c2d:533a with SMTP id 6a1803df08f44-895221c7e17mr103620466d6.37.1770307050227;
        Thu, 05 Feb 2026 07:57:30 -0800 (PST)
X-Received: by 2002:a05:6214:20cc:b0:894:6c2d:533a with SMTP id
 6a1803df08f44-895221c7e17mr103620026d6.37.1770307049763; Thu, 05 Feb 2026
 07:57:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121142827.2583-1-loic.poulain@oss.qualcomm.com>
 <20260121142827.2583-3-loic.poulain@oss.qualcomm.com> <3facbb23-80ad-4648-b81c-73f4608129f5@oss.qualcomm.com>
In-Reply-To: <3facbb23-80ad-4648-b81c-73f4608129f5@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 5 Feb 2026 16:57:19 +0100
X-Gm-Features: AZwV_Qh1Z06yd9BDAsc2kDJRh1ttLlphk-7I0IyoswFK-pToiw7AwuVqTGPa2SY
Message-ID: <CAFEp6-1scG6AbRzYDwLRNxGwSULDTjLqyXEiBmNq2yEDorGzDQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] phy: qcom: qmp-usbc: Fix possible NULL-deref on
 early runtime suspend
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: vkoul@kernel.org, kishon@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, dmitry.baryshkov@oss.qualcomm.com,
        neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDEyMCBTYWx0ZWRfX+qf1VtkoOMcB
 7BLQFyG8iVRz8ks+yJALtYTyfNoK3IDEohc2L3uq7GEhcSXIs4JN6ZYSSt+CK/lywBuFRRPx2RD
 hN7IjLa/n09TjNrgqgzg/aWW3ef0c59gfGtNXgBoQ239o1hNCx2WEicVIKZYCk1Su8cjEDezU/r
 1UVjmU8vfiA4n8oQucfETHP/9mSHdNMXLF6bARoLMjWHKWC5T0SJB37ubg9IWl+Ft+1s+KrTEKU
 3USg5Hmon1K4XhyxwpMYe+75hNwCji2nedvvQeQc3x+d0cyumKwJmYjrb/kFf5ScWqdX2mjSWe6
 178JvdXAJzyDGCA+7PVnafcyGOTZyyqIpSxQ/4HkAedqUjKHFRYvu2Wv6S884xk8JTrCS57CVG7
 e7NXbnC3ycpWAblz5oSZfUkpW7o8DPIJEU0D41SpuzA9IG803MIEKRYARcfa6qZhLoTEoAckLh1
 gB2WBm75mIdei3mGYQQ==
X-Proofpoint-ORIG-GUID: qQ9ph3lXorCRcpoZSQEHQENl43S5zVtk
X-Authority-Analysis: v=2.4 cv=UoBu9uwB c=1 sm=1 tr=0 ts=6984bdea cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=UD6jFWV5_MqAamJTNaQA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: qQ9ph3lXorCRcpoZSQEHQENl43S5zVtk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_03,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050120
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91939-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: A39CEF4ECC
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 4:00=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 1/21/26 3:28 PM, Loic Poulain wrote:
> > There is a small window where the runtime suspend callback may run
> > after pm_runtime_enable() and before pm_runtime_forbid(). In this
> > case, a crash occurs because runtime suspend/resume dereferences
> > qmp->phy pointer, which is not yet initialized:
> >     `if (!qmp->phy->init_count) {`
> >
> > This can also occur if user re-enables runtime-pm via the sysfs
> > attribute before qmp phy is initialized.
> >
> > Use qmp->usb_init_count instead of qmp->phy->init_count to avoid
> > depending on the possibly uninitialized phy pointer.
> >
> > Fixes: 19281571a4d5 ("phy: qcom: qmp-usb: split USB-C PHY driver")
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qua=
lcomm/phy-qcom-qmp-usbc.c
> > index 5e7fcb26744a..edfaa14db967 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> > @@ -690,7 +690,7 @@ static int __maybe_unused qmp_usbc_runtime_suspend(=
struct device *dev)
> >
> >       dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qmp->mode);
> >
> > -     if (!qmp->phy->init_count) {
> > +     if (!qmp->usb_init_count) {
>
> This function changed a month ago, please rebase against next
>
> Although I believe this patch becomes unnecessary with 3 in the picture.

Thanks. I can indeed remove this patch from the series

> I suppose the case that you mention in the commit message, however
> improbable, could be fixed by moving the pm call to after devm_phy_create

For whatever scheduling effect, this behavior has been seen quite
regularly (~1/50 boots) during stress=E2=80=91test scenarios with other PHY
driver (qcom-qusb2).

As Dmitry noted earlier, PM must be enabled before calling
devm_phy_create(), because phy_create() relies on the PM=E2=80=91enabled st=
ate
to configure its own runtime PM behavior.

>
> Although we'd then rely on devlink to make sure a consumer doesn't snatch
> the reference halfway through .probe...
>
> Konrad

Cheers,
Loic

