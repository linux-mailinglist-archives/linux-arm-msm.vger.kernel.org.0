Return-Path: <linux-arm-msm+bounces-88330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A90D0CF0C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jan 2026 05:18:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A1273011013
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jan 2026 04:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C4A231195B;
	Sat, 10 Jan 2026 04:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BfekGxZY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BHqe9MnZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF70A30F7F9
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 04:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768018691; cv=none; b=F080xkEwGqCC7IpDFA/5YcfhzIucFlYqquRYrsIJ7TCSnQsu75Jt9ypP1IRcexePxbnNNTYbPJNxdnPwioSNQwA8jelQX3vYgjZP46GnVRsJRQtaT08DVCXx+Nz/rli91Tn9Mgv/ZvkfqVjmDQmABDQr4X/0afTaR030XUhw3iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768018691; c=relaxed/simple;
	bh=dpUYUjDfyoU1qeQolcb2vaj2IIakm+BGrb623R/LCm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JOGgoJuAftHRJMiSSdxHM7XbSdwOMBTiAHQyVDDGd1Sb9mECy6VtoG7aLjfoIUOWE2HwY5jBe5P34u5pu0lUugjGlY4on9fkeHwd0nXhwVwkoIfzclM/JCrEO67L8S1uZG4e9bfSmlV/WQxjAyImy/zKmNsWShOOV26No8riggY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BfekGxZY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BHqe9MnZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60A28gic2855473
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 04:18:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=YvjR0sBl390qKfGTGwTn1b7N4BohJDG5WI0+S6lfGO0=; b=Bf
	ekGxZYZrvAfw6lK8Y4gHqENufiUBXfU3wkG7ro068gB6oDimVe10D6URbkdZ35cw
	o/Z/Sfe9HKU2EqyccdEWiZu1Vhbw8nQyuCXuko0G8kZld4nuFBIxBo/mOBcdPnWo
	dQoTBAtSOiSwZS3qs2mMm3sBkirrj4RkiKJ2Ha8KvElBXENGufDQkIzgvdufPc03
	0cygvwlLV8VpZHHuUMSqzoCQUq6JOm61jMRuNdphO4ZqKH6lh4FQVrj95PqKN0d+
	M+Dp733rW7Pch3HbOn1GIffgkx7c2DyaxmyMoGi6ya2DwipG8TcpnhCeP84jNxaE
	ZFDjQhFH33HI03eRlLBA==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkdqqr5m3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 04:18:06 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4501735f488so9163769b6e.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 20:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768018685; x=1768623485; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YvjR0sBl390qKfGTGwTn1b7N4BohJDG5WI0+S6lfGO0=;
        b=BHqe9MnZogH4A4s/Fc376aBtg6bUL1gD624LKpEEX66QPBUaK4FiN+0tKZ9ppbfe/x
         3MGf86t1/X02fRhauWA5PdNp52P5+LJBggMhHwW2XHx1mepNAW4Te3eF8XGksPTnRwxe
         2DUHgyX8E+MCsxfMnYB7GTmRu2N6CbUoLfeBJbhja5kYuFQ6yaM6xcZf/OGJj0hWGPcY
         0rltkZZC+odb8qrFHhGOJX8GwBV97HWUkyLRh92Pmoe6jZ/It8uOCboQNZ0QOghj4yON
         Ueo47/2rb63naY1D9pvn2IRZ+1NmvM/2ClsrpIiFJ741A252fpORijutq0tZMDTw5Lo0
         VnLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768018685; x=1768623485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YvjR0sBl390qKfGTGwTn1b7N4BohJDG5WI0+S6lfGO0=;
        b=nknKtjyOXWrm806Hhk6jyoaBrjx6oeUabUYTmQc7gapEKNDiSKVjprPS9Ooz0S0NIq
         I4RHBGu0e/xXQzzMfDNYGy+5FwWVhXNMms/TTYo5p198ky/B6MGVJquZ7N9O90Af81Eu
         lKnNi2S/B3hutVXOB9g3r1qLbRjuABSCHmhtL9PDx4SAkVETIjFuQwEl5a7WQUzpzc56
         J/VjoHrBLRhr8IihaETYYT8CdqrytTLLgyFN345281olBCse0HPc5u9rcSCULwoVpV9A
         LxCDZoyEupD2ooe625bKW04Dcj46wXBXjqW86S+Do7lvGQ38l55hLAYwuprl9lgbrqsG
         f0Jw==
X-Forwarded-Encrypted: i=1; AJvYcCUE5exYLGmi3vHXY1ZyKUGpXI5LXeYHglNicyq+4g62zXpPMbhyn/OLacGqb1Mig1v+SHxQblQifo7iUdyM@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ5Ydg2aPrwF+HVxrWlp1eXaTrc/COt+I/Ive5/tJMc5xvSeY+
	RmKTS2spo5M+9J1kACr6fnfI/RwRR52lLsrtb2iV1Sra0Ke4YRZvUBxlgwThbYowDmeIIEp9N5P
	byR6wbPcoFVe05Z7V4reEk3bvOkp2H4WW/lz9a0EHF8k3rvXyc9nS80WJLFcVG5pWDXMWUXZgAp
	2bXXJhtUJgyW85FttHaWpzhFJhBnw4iyiz8V7uoGae3Wo=
X-Gm-Gg: AY/fxX74HOlP8Yrib+hYFJcgwhCkojCR4TQx4lUgtdgv991PT8+B6nlt722DjlU63QM
	BxRJ7WnvLFLX6DokZDWuAIgdsgKDsgZtgvZFi12CdjyaBomEpCNbguPqBSrEk9fqzgqLyfMQrmo
	90KvBoK+MNFq8oNRWARmprn95E+iX9GQ0SNPZ3K7Hf2ibEOW8AMLQvYHn30B/YmbUMFQ==
X-Received: by 2002:a05:6808:2215:b0:44f:6ab9:4aee with SMTP id 5614622812f47-45a6befaaeemr6297673b6e.63.1768018685328;
        Fri, 09 Jan 2026 20:18:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEymw+xBhx5CKa9dPjA1bNNpF9wJib+zhE+Ki6h1wPxpj6SjAHb+30fr/sZ4jiXlFDFMlOvN+MlaY3wAHuPd3g=
X-Received: by 2002:a05:6808:2215:b0:44f:6ab9:4aee with SMTP id
 5614622812f47-45a6befaaeemr6297655b6e.63.1768018684906; Fri, 09 Jan 2026
 20:18:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <CACu1E7EDmLPhUFyouD=W6n+U7=oo7+6PY0Gz9=3pVpT2Qu9Z6w@mail.gmail.com>
 <CACSVV00iiAXGOqV2HZs9KREoqatE0eNBZjFH9hSFMmNaX3_RXw@mail.gmail.com> <CACu1E7Fh=GbLTiedj6OqtUxWiZbCVcKmsEzV6FYan5G6r1uyUA@mail.gmail.com>
In-Reply-To: <CACu1E7Fh=GbLTiedj6OqtUxWiZbCVcKmsEzV6FYan5G6r1uyUA@mail.gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 20:17:54 -0800
X-Gm-Features: AQt7F2pDX7FL2yQ5nEVGvdEQ4fegGKJEg02gjG594h0T2ZpR_q9rSVNBqJ-Mto8
Message-ID: <CACSVV015qwuGnJrMiZa=eKzu8BeGyGg5gpp=ko7-QgrAjE2phw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Retrieve information about DDR from SMEM
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sean Paul <sean@poorly.run>, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: Ja9tnv7iXSezMV0hiJsQbr4Dxnkt_XjT
X-Proofpoint-GUID: Ja9tnv7iXSezMV0hiJsQbr4Dxnkt_XjT
X-Authority-Analysis: v=2.4 cv=a9M9NESF c=1 sm=1 tr=0 ts=6961d2fe cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=KgOssdJzQp_kbXOIULcA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDAzMSBTYWx0ZWRfX+0npkrfMr2MV
 R3Z8271onD1Ftj+JfoM7VrZGJBIolS/1NfW8XI+tvo7LH2COfqprWhN3YidjOalk1lvus2QiUj2
 41c16hNCQIsCjDNUIZYLCaEU82A8z04MfTZr14JAXw53kOhJiCBU8D8cUIENp78fn7Sjw4dvO5Q
 PIBRWEPFIemBfklCJn0b6q66/873KWQ30zaUJ7HUN7TN5NR2LOs5gWfTcHL+FBVX0akrXTpOtx5
 rXZCRzcd8exwcwVHWK4MZTw3TRWOAs838S1fkYEF0YCSa0GLOldPmqiGxqMBF8HG/Y0pF8uN8Pk
 bqe6XR9SBwobV6ZM2x62ljCrHDdMc2OpCrTX/k9icNbTjCdfcwTepE5XPIac1cjjIXBzbdRnbIV
 saBK8xZB+xhruAKEKnyHf+Dk5a7W9Y7lr8wb+bbkkdFafHfoin1Utmo/ECODkoSn3sc3XjO/JYH
 c1BAYixB9BWprsm77BA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601100031

On Fri, Jan 9, 2026 at 1:03=E2=80=AFPM Connor Abbott <cwabbott0@gmail.com> =
wrote:
>
> On Fri, Jan 9, 2026 at 3:41=E2=80=AFPM Rob Clark <rob.clark@oss.qualcomm.=
com> wrote:
> >
> > On Fri, Jan 9, 2026 at 11:11=E2=80=AFAM Connor Abbott <cwabbott0@gmail.=
com> wrote:
> > >
> > > On Thu, Jan 8, 2026 at 9:22=E2=80=AFAM Konrad Dybcio <konradybcio@ker=
nel.org> wrote:
> > > >
> > > > SMEM allows the OS to retrieve information about the DDR memory.
> > > > Among that information, is a semi-magic value called 'HBB', or High=
est
> > > > Bank address Bit, which multimedia drivers (for hardware like Adren=
o
> > > > and MDSS) must retrieve in order to program the IP blocks correctly=
.
> > > >
> > > > This series introduces an API to retrieve that value, uses it in th=
e
> > > > aforementioned programming sequences and exposes available DDR
> > > > frequencies in debugfs (to e.g. pass to aoss_qmp debugfs). More
> > > > information can be exposed in the future, as needed.
> > > >
> > > > Patch 3 should really be merged after 1&2
> > >
> > > No. The HBB value currently returned by the bootloader is *not* alway=
s
> > > the same as what we use currently, because some SoCs (like SM8250)
> > > with the same DT ship with multiple different DRAM configurations and
> > > we've been using a sub-optimal value the whole time. After all, that'=
s
> > > the whole point of using the bootloader value. But patches 1&2 will
> > > only make the DPU use the bootloader value for HBB, not the GPU. So o=
n
> > > one of the affected SoCs, it will introduce a mismatch. You can't
> > > change anything until the GPU side uses the new ubwc config as its
> > > source of truth.
> >
> > Hmm, how is this even working today if DPU is using HBB from the
> > global table but GPU is not?  Are we just getting lucky with
> > compositors that don't know about modifiers and end up scanning out
> > linear?
>
> It works out as well as it's always worked out, i.e. we try to make
> GPU and DPU config match and pray that we didn't mess it up. At least
> now we'll get a warning when they don't match.

I mean, upstream we kinda have a lack of feedback metrics other than
people reporting bugs... so maybe the first step is to break it with

  *cfg =3D *common_cfg;

and see what happens.

> >
> > We do log warnings when the global ubwc config does not match the
> > "fixed up" config.. google search for those msgs doesn't seem to turn
> > up anything other than the patch which introduced them.  Idk if that
> > is conclusive in any way, but I hope that means we could just delete
> > the fixup code on the GPU side.  I suppose we could add:
> >
> >        *cfg =3D *common_cfg;
> >
> > after the warning as a first step.  That would maybe get some bug
> > reports along with enough details in dmesg?
>
> Yes, the plan was always to delete the fixup code in the GPU config.
> And even that first step would be enough to prevent regressions when
> switching to the bootloader HBB value.
>
> There is a problem in that ubwc_swizzle isn't as well tested. Older
> parts supporting UBWC 1.0-3.0 partially or entirely ignore
> ubwc_swizzle, because it wasn't configurable back then, but we rely on
> it being set correctly in Mesa for VK_EXT_host_image_copy and sparse
> textures. So if ubwc_swizzle is incorrect you probably wouldn't
> notice, until you hit the HIC codepath in zink or some game using
> sparse textures. I think we fixed up all the cases where it was
> incorrectly set to 0x1 instead of 0x7, but it would be worth it to
> check again.

There are a lot more things out there than there are things running
games that would hit that.  Idk about zink, but there is a gallium
driver.  Either way, we don't have metrics feedback so the only option
is to break things with enough info in dmesg to figure out what is
going wrong AFAICT.

BR,
-R


>
> Connor
>
> >
> > BR,
> > -R
> >
> > > Connor
> > >
> > > >
> > > > Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > > ---
> > > > Changes in v3:
> > > > - Support v6 and v7 DDRInfo (v7 is used on e.g. Hamoa)
> > > > - Handle rare cases of DDRInfo v5 with additional trailing data
> > > > - Rebase/adjust to SSoT UBWC
> > > > - Expose hbb value in debugfs
> > > > - cosmetic changes
> > > > - Link to v2: https://lore.kernel.org/r/20250410-topic-smem_dramc-v=
2-0-dead15264714@oss.qualcomm.com
> > > >
> > > > Changes in v2:
> > > > - Avoid checking for < 0 on unsigned types
> > > > - Overwrite Adreno UBWC data to keep the data shared with userspace
> > > >   coherent with what's programmed into the hardware
> > > > - Call get_hbb() in msm_mdss_enable() instead of all UBWC setup
> > > >   branches separately
> > > > - Pick up Bjorn's rb on patch 1
> > > > - Link to v1: https://lore.kernel.org/r/20250409-topic-smem_dramc-v=
1-0-94d505cd5593@oss.qualcomm.com
> > > >
> > > > ---
> > > > Konrad Dybcio (3):
> > > >       soc: qcom: smem: Expose DDR data from SMEM
> > > >       soc: qcom: ubwc: Get HBB from SMEM
> > > >       drm/msm/adreno: Trust the SSoT UBWC config
> > > >
> > > >  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  11 +-
> > > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  82 +------
> > > >  drivers/gpu/drm/msm/adreno/adreno_gpu.h |   5 -
> > > >  drivers/soc/qcom/Makefile               |   3 +-
> > > >  drivers/soc/qcom/smem.c                 |  14 +-
> > > >  drivers/soc/qcom/smem.h                 |   9 +
> > > >  drivers/soc/qcom/smem_dramc.c           | 408 ++++++++++++++++++++=
++++++++++++
> > > >  drivers/soc/qcom/ubwc_config.c          |  69 ++++--
> > > >  include/linux/soc/qcom/smem.h           |   4 +
> > > >  9 files changed, 485 insertions(+), 120 deletions(-)
> > > > ---
> > > > base-commit: fc4e91c639c0af93d63c3d5bc0ee45515dd7504a
> > > > change-id: 20250409-topic-smem_dramc-6467187ac865
> > > >
> > > > Best regards,
> > > > --
> > > > Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > >

