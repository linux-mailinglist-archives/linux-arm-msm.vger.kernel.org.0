Return-Path: <linux-arm-msm+bounces-88324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EBAD0C335
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 21:41:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C10353011750
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 20:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BE9C2EA168;
	Fri,  9 Jan 2026 20:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hw6lZDKr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J+XREj7/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE6B1A285
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 20:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767991283; cv=none; b=IBCq03iN28hP+YI6n1/n2stkG7i3JCXswh00yYKYiHE2014+Yqwspd+BF4RTjtjilBl65dDsfby5e/NE7bc+sc7egbQFRo/KnVlr6ZR1EQ4o5E9kobZNZ/QHQ/7cQ3hvT/Dh1edIspelAXo++pmx3TKsoihn5NZ6y0svsCBOIWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767991283; c=relaxed/simple;
	bh=to9ahcS4219wq5I/lD0Sq+R4Za7W+mDk3w0XKlFRtOM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LiLTm0ZPlMuu4oPFDGJT86S/6Po99Mmecl3c8RKRDw+VR9o/y7wA819SyPuQTdtnz7x87U083Zkx1zGXsFvtI/DX/9phg7V1GJI1sziiKqwkzdPQPyoxHQlQv4/gGuckd7bOlCf0oivYFJi49Rrjr+LcqSaSE6Onnd58BWSLVmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hw6lZDKr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J+XREj7/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609ISEAE1048225
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 20:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=Hir9brUJpHlA7x/ase7YIvZHRMJOe3oUrJ+uuUbm8s4=; b=Hw
	6lZDKrJ46BEgUBnKqkzKorchH5R3IBD1F77gZyULb3YSoBlzwstHEtdE5PA7lVBt
	ocoEVSMC3zDNrSwIQBouzsnEUmb+AqT6Iyc7rVL5s7EN22cQpM8Lool158nRjbhH
	uXCDw2aLt/igk9m/Tmu68JO1YyrA6oVUAaA6yKraVP7NrQM0Lep/EIQiodeUPGjx
	Pna9HeH7eiUWt9Ar39AumeNOnt11ctdcTbsghpXzjrWBjLe+G3Q1GYfkFiu/XuCV
	nOSryMIFZ/0BHn6jjd4/HWgyWDNzt7EPEjQluDTSgwVKOBejuqkcg+0i0Cabzr7/
	cO67bS6I+2LwAFTxSzag==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjy5b9tjf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 20:41:19 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-45015d0d16aso9925990b6e.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 12:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767991279; x=1768596079; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Hir9brUJpHlA7x/ase7YIvZHRMJOe3oUrJ+uuUbm8s4=;
        b=J+XREj7/01vTX4CzKhjaoA9ZX1GRBICaaHorpRuFFvhJU4ywSKxzGajBUEF6+KITCR
         RNV6tUk+wrplBncfItJ0IL/aY6N6dfEPMmO1i/2JGUFwprP+gyiXNmdZ1OS0sZowLEa7
         99qQ5/6Dl0qZlQvl7bmiegWB+HocpHvE41i2j7EA2WkHMQeqeSG5PIkXFMe8Js490VMQ
         wic9FfVJ8gI9+PSd757rzjiqOWK5J6nYRPtkyLYbij7zHg7CztStNgw4h/5wGG5eNsII
         6/L/b5pAEGveY73k7pStMseI+xs388Yl6K16gVKiloqE2MQcclVm+sI1WNyjjB7ffyP8
         55tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767991279; x=1768596079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hir9brUJpHlA7x/ase7YIvZHRMJOe3oUrJ+uuUbm8s4=;
        b=ZubuRqP+qyx++mynSHlTDvQ6mn5TSA8RQdxHt4s+esPu9JaB8fgnHMZYlG81NOxF6i
         8j716pgYZl9VQAFa0j+H3djlRT2QNcjfCa6KcLMw/Ox0JErlMYBH0vXEYw/61cM1cWUG
         adNtWRjAnv7lHWJp5gib1sgNpj9qS61pwlRFGynq3QponxIiQp9Vt0nTDzAO+TCr04AU
         KFvz6UbvU5M7lEBaYtqzXCJUMfcQU+/D8U3wMlYWdJxZwbT5yOrPebErfWVELOUkQj4g
         Ls/dJPSC/Dnd5znbOAt4TN8CJGox8GatmNdBD5zJxQU0pe6+15+BwxmWyB76Q8zoY4ec
         nkog==
X-Forwarded-Encrypted: i=1; AJvYcCVe0L/V1DE9qhH5NCfzWnjxyQhqBVbKqNo2rWM2bsHWknY6w2hibrDDDpSheihYjjWPi4txGX5WsO8f2euJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxRH1cQhgApC9Z7H+Sbjb+1Qbfz334NXaQGGeBfq1wdLGMKG8vo
	75dt4XOHHVqYiKm0dLu4NdnXw99Ye08U1D8xi4QvcyzvIIjDs33rIX/n/5cc9Wg+GBsN9SExxNA
	OTvo7tfj7eGVU8hcoOOUuSW+S+pSIJHw40b1k//J/yRHltigvt9gLUdhIpRLcGk9VLauqb6S9CA
	75tlHk9rHO8wtyCBUBzty0t1LPcpdpBzeRN7siAvLudj0=
X-Gm-Gg: AY/fxX5/N8moLa4K/rMnov5XX9FTRGUU38u30QnyUotDH1LWAmQ3Zr/4cxtVJyFOi7E
	KxqpB8XLT485yLnJ01/heeSo6IOo79ZD/KGO4rXlMCnFKPZA9LfNjyPoaGgDPjKpYqIq3RB1adS
	9h7EmgtrnTVrSSE2ZbjstK2S7nPzQA39IeYIXSllhmYGBJRbRToVQuHXngeQ1oidWA0Q==
X-Received: by 2002:a05:6808:c16b:b0:453:7404:90bf with SMTP id 5614622812f47-45a6bd85759mr6083950b6e.14.1767991278955;
        Fri, 09 Jan 2026 12:41:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpfhjiKOuT+qlJfi6rYssjk7Vc0RpE22HCOpT+0NSEG6xwpBeSi/q77IqnzuKXXx8CpL/quxvWSJlWHLbx7ow=
X-Received: by 2002:a05:6808:c16b:b0:453:7404:90bf with SMTP id
 5614622812f47-45a6bd85759mr6083932b6e.14.1767991278592; Fri, 09 Jan 2026
 12:41:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com> <CACu1E7EDmLPhUFyouD=W6n+U7=oo7+6PY0Gz9=3pVpT2Qu9Z6w@mail.gmail.com>
In-Reply-To: <CACu1E7EDmLPhUFyouD=W6n+U7=oo7+6PY0Gz9=3pVpT2Qu9Z6w@mail.gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 12:41:07 -0800
X-Gm-Features: AZwV_Qh6Gca2q8cBDwfG4Zl54AnO5eHMEPHL-qw8ARyTQOHUjVKrl7UjWTjSTY4
Message-ID: <CACSVV00iiAXGOqV2HZs9KREoqatE0eNBZjFH9hSFMmNaX3_RXw@mail.gmail.com>
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
X-Proofpoint-ORIG-GUID: P1HTpN9WaS-FRb2SEwpYBigClzjFjSHC
X-Authority-Analysis: v=2.4 cv=JP42csKb c=1 sm=1 tr=0 ts=696167ef cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=I_tfjSbw-6LnIXkDKrAA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDE2MiBTYWx0ZWRfXxolphxszPYX0
 IxoiLw94juE9QHW4TuvKmm9fXJkN64eCyKJmqtL8LznVMA8HPu9C7vHEohybcpv2ooO2k+EmwrJ
 M9k3Lyz1Lhf0rLrcM/M645EBBxHmtAYLDP4V1fbKElgVEZD3h11oBoh1B5LWRErHkVSsVLQY4Nk
 xw99Q1Far//xr/JHHS7QULFQzGMQGIaMF9k9FRQ/cusmRcwcjJzgH5Y/7sdgqA7ySMxv66wcySV
 Pt8DUishQtS6kYeS1yWDqg8ybt98zpKgkmUrhVMZkGhi0UA9hjbbtZ/Hq6aZFrjlPo6w/uMPbag
 OaaEAER83lZeAisamUnfNU48lgsQyuFu5HSw/Gcw9Nw3NdqRcU2NkOzm2DoRDxXA/PQ0NurZjVZ
 0etvUMBd5STM3QbgVvrY8AuRbUrrOxvy9dWnzIfJBMXstWjTr2B7Vo6G2B3hLGaZnZk8DHEzpyc
 nJl6NeqS0qeorfnq50g==
X-Proofpoint-GUID: P1HTpN9WaS-FRb2SEwpYBigClzjFjSHC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090162

On Fri, Jan 9, 2026 at 11:11=E2=80=AFAM Connor Abbott <cwabbott0@gmail.com>=
 wrote:
>
> On Thu, Jan 8, 2026 at 9:22=E2=80=AFAM Konrad Dybcio <konradybcio@kernel.=
org> wrote:
> >
> > SMEM allows the OS to retrieve information about the DDR memory.
> > Among that information, is a semi-magic value called 'HBB', or Highest
> > Bank address Bit, which multimedia drivers (for hardware like Adreno
> > and MDSS) must retrieve in order to program the IP blocks correctly.
> >
> > This series introduces an API to retrieve that value, uses it in the
> > aforementioned programming sequences and exposes available DDR
> > frequencies in debugfs (to e.g. pass to aoss_qmp debugfs). More
> > information can be exposed in the future, as needed.
> >
> > Patch 3 should really be merged after 1&2
>
> No. The HBB value currently returned by the bootloader is *not* always
> the same as what we use currently, because some SoCs (like SM8250)
> with the same DT ship with multiple different DRAM configurations and
> we've been using a sub-optimal value the whole time. After all, that's
> the whole point of using the bootloader value. But patches 1&2 will
> only make the DPU use the bootloader value for HBB, not the GPU. So on
> one of the affected SoCs, it will introduce a mismatch. You can't
> change anything until the GPU side uses the new ubwc config as its
> source of truth.

Hmm, how is this even working today if DPU is using HBB from the
global table but GPU is not?  Are we just getting lucky with
compositors that don't know about modifiers and end up scanning out
linear?

We do log warnings when the global ubwc config does not match the
"fixed up" config.. google search for those msgs doesn't seem to turn
up anything other than the patch which introduced them.  Idk if that
is conclusive in any way, but I hope that means we could just delete
the fixup code on the GPU side.  I suppose we could add:

       *cfg =3D *common_cfg;

after the warning as a first step.  That would maybe get some bug
reports along with enough details in dmesg?

BR,
-R

> Connor
>
> >
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > ---
> > Changes in v3:
> > - Support v6 and v7 DDRInfo (v7 is used on e.g. Hamoa)
> > - Handle rare cases of DDRInfo v5 with additional trailing data
> > - Rebase/adjust to SSoT UBWC
> > - Expose hbb value in debugfs
> > - cosmetic changes
> > - Link to v2: https://lore.kernel.org/r/20250410-topic-smem_dramc-v2-0-=
dead15264714@oss.qualcomm.com
> >
> > Changes in v2:
> > - Avoid checking for < 0 on unsigned types
> > - Overwrite Adreno UBWC data to keep the data shared with userspace
> >   coherent with what's programmed into the hardware
> > - Call get_hbb() in msm_mdss_enable() instead of all UBWC setup
> >   branches separately
> > - Pick up Bjorn's rb on patch 1
> > - Link to v1: https://lore.kernel.org/r/20250409-topic-smem_dramc-v1-0-=
94d505cd5593@oss.qualcomm.com
> >
> > ---
> > Konrad Dybcio (3):
> >       soc: qcom: smem: Expose DDR data from SMEM
> >       soc: qcom: ubwc: Get HBB from SMEM
> >       drm/msm/adreno: Trust the SSoT UBWC config
> >
> >  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  11 +-
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  82 +------
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.h |   5 -
> >  drivers/soc/qcom/Makefile               |   3 +-
> >  drivers/soc/qcom/smem.c                 |  14 +-
> >  drivers/soc/qcom/smem.h                 |   9 +
> >  drivers/soc/qcom/smem_dramc.c           | 408 ++++++++++++++++++++++++=
++++++++
> >  drivers/soc/qcom/ubwc_config.c          |  69 ++++--
> >  include/linux/soc/qcom/smem.h           |   4 +
> >  9 files changed, 485 insertions(+), 120 deletions(-)
> > ---
> > base-commit: fc4e91c639c0af93d63c3d5bc0ee45515dd7504a
> > change-id: 20250409-topic-smem_dramc-6467187ac865
> >
> > Best regards,
> > --
> > Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >

