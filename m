Return-Path: <linux-arm-msm+bounces-64137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAFDAFE2AE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 10:32:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1B7C5822AE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 08:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C696D275AF4;
	Wed,  9 Jul 2025 08:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c1YWVPck"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D367082F
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 08:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752049924; cv=none; b=nJDeNilqz1V1WdRCS4oBPo4yzfRWVs1e+WB55GEzyDaJB6g5a7mkq07ty2hbclMcBKmlgCsR2yXrNjkgM6AJ84BDZ3nigaPlJe/oY0MaE6aDX6Wrv5ezkSPomRJtfjKfv79JGRPOKVjAZR0TJyLJOrcQ0nCLjrR+nGYyVIYlJBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752049924; c=relaxed/simple;
	bh=bvDbbRKoyDjxVaZBMlfvkXXUw0Rx9oajNH6sxggKwFw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=puqT5CvKuCDnBffgS/sNHz7sf2gbqBaMH99RZYQT/zz43KG0chZ7ykaeqWdcggxf5sDqVozqhs5ESGaCCCSy+/pxiqpRvrJ9wk5+duovpgGAXLZc3YU/+bxxtFiuU9HkswJae0OfqCH+z6d7nwAMKNCn0KckCBpGP/yB5oX2unE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c1YWVPck; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5697j3kb008644
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Jul 2025 08:32:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R7Ujx2kaKVzLyIA+H4UYprruc3V8KAQFqRIULOW/gg0=; b=c1YWVPckluN3hP9V
	+jWtQNEU+Ny9OsWuEuW3nuW1OMV9r6LWg5QOn4PXrfcUo3p9a22K8JVSC7Qcy+m5
	2nGWtl7TAPplcaoGKwb3YwqhJohJbnoJqqg3gGPVLUShXxb1KNGxdWiO2DOh1efr
	DKKXVPFFyB0et5vaTn4WVg5zP/GUSBXsEitCoUeBekClE6BqwiOZAlNsn6r/jBgq
	H7af65AZa2ja96j7ZoNLdrHlbc1RGjUEYFjy9/wbbVYFbjGaWr3q1w0eiOxF5/rw
	E3O6f7XZAcZLWu+GKSsaK4g5+86faOfC8Qa43xiM1eX+kd5zc8InULAQKzLO6smP
	5WKIiA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smafg4kg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 08:32:00 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6face45b58dso73455576d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 01:32:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752049920; x=1752654720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R7Ujx2kaKVzLyIA+H4UYprruc3V8KAQFqRIULOW/gg0=;
        b=MC7lellB+BBo+BDqQGd+8XXsCskimBmnIQdbawSJpytcIK7ER4lbdu2LME3WmZr5RL
         frFEk0EFX2JinJ3CIegTRasK24TWpSK2DxaRoA+Yn9+vC4EqnisBC31Z+JAyruEdUm9q
         WJep8ATEGGu8Tvqsxisr+ykqiuxHuIdBsa1A+Nyq+4lDbU0Kav8VEUBFOk6WhQnbCJJd
         MNucsZL+CV22d14x2ll+UWrySsdEemjZfmgC/cq0ZKcbt3ywwDSfM9gkllICPZPYnxzL
         0LnzegsWo+QibpL2io1vCr6tsKUlzXH1LKK81n7KOzId2QkMkvSKpGp8PNJi/dLUcQqP
         DZyg==
X-Gm-Message-State: AOJu0YwPJoIPcso7MDqYk4/YMUAIHm2PAtf7ySPrvfGmKtC3REtVEXa0
	WElnqYr4AaJ0aAAUAB0P7JInJkROFmUyEjB18tv8b8FQn/AfPORR8C6eJA62xPQvo7MDBN9qc10
	pDcUfW8/tjCS1ziUAje86tBmbzcMS5opoNUEm4KDCex6E43V4TE0ACsqcnz8tHsvc5uSIQ8ij5B
	GnKz4JoComqcrFTDM1R71+2DDneUZ/UjLUj0JNSa/gtxU=
X-Gm-Gg: ASbGncvh2jfPxRPmK47VQGrkVxKTQp3PZJbumZnZgBxPCdW0Kcz/C9xDKU58MCoDgua
	N97zMQio9L4YOzNRW1CJz5yY+IkjWIB4nMaIlOYz14UJLd6AyvI+sLwi/jBKAQpk3C7kHyX4f1s
	+dE3vb
X-Received: by 2002:a05:6214:5888:b0:6fd:d91:ba28 with SMTP id 6a1803df08f44-7048ba304c1mr23085356d6.41.1752049920124;
        Wed, 09 Jul 2025 01:32:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzCrbEcZUfqFs/i1liWPqCseBPAUwivYFuLwrJ2dfMFo45jB86/Vep2siUv3SBlLcr2sYgF1HK8G0vU5P8N+M=
X-Received: by 2002:a05:6214:5888:b0:6fd:d91:ba28 with SMTP id
 6a1803df08f44-7048ba304c1mr23085136d6.41.1752049919665; Wed, 09 Jul 2025
 01:31:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709065208.25472-1-komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20250709065208.25472-1-komal.bajaj@oss.qualcomm.com>
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Wed, 9 Jul 2025 14:01:48 +0530
X-Gm-Features: Ac12FXwVlwOSKH6M7Xb7lRtJAzGLw2oZX6LTk8jHLEoWJrUUTz17pJVTrb17mQk
Message-ID: <CAPHGfUODORLkOwd6T68fYOFMpcc_S+zDAJ0inj7Vu_Sbn-dxPQ@mail.gmail.com>
Subject: Re: [PATCH v3] usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through
 secure calls
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=ZJ/XmW7b c=1 sm=1 tr=0 ts=686e2901 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=BjlrWRqCICg19y0UsegA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: LJF1embJb5sRTcQlrEa8WgbRAHZdvf7n
X-Proofpoint-GUID: LJF1embJb5sRTcQlrEa8WgbRAHZdvf7n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDA3NSBTYWx0ZWRfX9aAYxQnX/lfA
 9ZcQu0PW3vuA2VxmIx/hXkTGXuDenZn4PHzYnsgMFaHyNkJpZfK9jBTRY2kIVsbYtdzwDZ7RAKa
 OCWOGMqBMfXzLa5NGx8Yhrn/x9wOGyd/bNgGLNcWNyoqj7E5647WUgs7UjINJtBO+5C3xtO9Url
 yvrbtlv3MnHjdRKASNp9MUXDki31khHpwUL74eek/8puPgscdiAC699TXtQCGUmbMhoE8gXrjLs
 sIOAkuAqfpN2/x0CipGlO/W1oGPPxKmOW097HrYeD0Lx9B7GLqTlW7Ob1YZSfs93dZ5o9OvXDAo
 JCmPbgAkFniX0pwlHQHo756V+O2ZxDfEo2Bp7jbMGCK45RQ8N5uVN40SvyubdRCv0+920HiA9y4
 WG5ipVFYEXhb+0ZwBBuBOSVICxI1ELxgZWLqMosJcKh/zII5/Jg3LOVLwd7D/y2BoGxDBxaB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_02,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 impostorscore=0 spamscore=0 adultscore=0 clxscore=1015
 bulkscore=0 phishscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507090075

Please ignore this email

On Wed, Jul 9, 2025 at 12:22=E2=80=AFPM Komal Bajaj
<komal.bajaj@oss.qualcomm.com> wrote:
>
> EUD_MODE_MANAGER2 register is mapped to a memory region that is marked
> as read-only for HLOS, enforcing access restrictions that prohibit
> direct memory-mapped writes via writel().
>
> Attempts to write to this region from HLOS can result in silent failures
> or memory access violations, particularly when toggling EUD (Embedded
> USB Debugger) state. To ensure secure register access, modify the driver
> to use qcom_scm_io_writel(), which routes the write operation to Qualcomm
> Secure Channel Monitor (SCM). SCM has the necessary permissions to access
> protected memory regions, enabling reliable control over EUD state.
>
> SC7280, the only user of EUD is also affected, indicating that this could
> never have worked on a properly fused device.
>
> Fixes: 9a1bf58ccd44 ("usb: misc: eud: Add driver support for Embedded USB=
 Debugger(EUD)")
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Changes in v3:
> * Moved secure write before normal writes
> * Added error checking in disable_eud function call
> * Use ENOMEM error code if platform_get_resource() fails
> * Select QCOM_SCM driver if USB_QCOM_EUD is enabled
> * Link to v2: https://lore.kernel.org/all/20250627125131.27606-1-komal.ba=
jaj@oss.qualcomm.com/
>
> Changes in v2:
> * Drop separate compatible to be added for secure eud
> * Use secure call to access EUD mode manager register
> * Link to v1: https://lore.kernel.org/all/20240807183205.803847-1-quic_mo=
lvera@quicinc.com/
>
>  drivers/usb/misc/Kconfig    |  1 +
>  drivers/usb/misc/qcom_eud.c | 24 ++++++++++++++++++------
>  2 files changed, 19 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
> index 6497c4e81e95..f49d5ac0e957 100644
> --- a/drivers/usb/misc/Kconfig
> +++ b/drivers/usb/misc/Kconfig
> @@ -148,6 +148,7 @@ config USB_QCOM_EUD
>         tristate "QCOM Embedded USB Debugger(EUD) Driver"
>         depends on ARCH_QCOM || COMPILE_TEST
>         select USB_ROLE_SWITCH
> +       select QCOM_SCM
>         help
>           This module enables support for Qualcomm Technologies, Inc.
>           Embedded USB Debugger (EUD). The EUD is a control peripheral
> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> index 83079c414b4f..156c4f75c3c9 100644
> --- a/drivers/usb/misc/qcom_eud.c
> +++ b/drivers/usb/misc/qcom_eud.c
> @@ -15,6 +15,7 @@
>  #include <linux/slab.h>
>  #include <linux/sysfs.h>
>  #include <linux/usb/role.h>
> +#include <linux/firmware/qcom/qcom_scm.h>
>
>  #define EUD_REG_INT1_EN_MASK   0x0024
>  #define EUD_REG_INT_STATUS_1   0x0044
> @@ -34,7 +35,7 @@ struct eud_chip {
>         struct device                   *dev;
>         struct usb_role_switch          *role_sw;
>         void __iomem                    *base;
> -       void __iomem                    *mode_mgr;
> +       phys_addr_t                     mode_mgr;
>         unsigned int                    int_status;
>         int                             irq;
>         bool                            enabled;
> @@ -43,18 +44,27 @@ struct eud_chip {
>
>  static int enable_eud(struct eud_chip *priv)
>  {
> +       int ret;
> +
> +       ret =3D qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 1);
> +       if (ret)
> +               return ret;
> +
>         writel(EUD_ENABLE, priv->base + EUD_REG_CSR_EUD_EN);
>         writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
>                         priv->base + EUD_REG_INT1_EN_MASK);
> -       writel(1, priv->mode_mgr + EUD_REG_EUD_EN2);
>
>         return usb_role_switch_set_role(priv->role_sw, USB_ROLE_DEVICE);
>  }
>
>  static void disable_eud(struct eud_chip *priv)
>  {
> +       int ret;
> +
> +       ret =3D qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 0);
> +       if (ret)
> +               return;
>         writel(0, priv->base + EUD_REG_CSR_EUD_EN);
> -       writel(0, priv->mode_mgr + EUD_REG_EUD_EN2);
>  }
>
>  static ssize_t enable_show(struct device *dev,
> @@ -178,6 +188,7 @@ static void eud_role_switch_release(void *data)
>  static int eud_probe(struct platform_device *pdev)
>  {
>         struct eud_chip *chip;
> +       struct resource *res;
>         int ret;
>
>         chip =3D devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
> @@ -200,9 +211,10 @@ static int eud_probe(struct platform_device *pdev)
>         if (IS_ERR(chip->base))
>                 return PTR_ERR(chip->base);
>
> -       chip->mode_mgr =3D devm_platform_ioremap_resource(pdev, 1);
> -       if (IS_ERR(chip->mode_mgr))
> -               return PTR_ERR(chip->mode_mgr);
> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +       if (!res)
> +               return -ENODEV;
> +       chip->mode_mgr =3D res->start;
>
>         chip->irq =3D platform_get_irq(pdev, 0);
>         if (chip->irq < 0)
> --
> 2.48.1
>

