Return-Path: <linux-arm-msm+bounces-90109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCWAJL+TcWlZJgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 04:04:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D8361261
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 04:04:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 647AB4E76DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 03:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A86F366DAA;
	Thu, 22 Jan 2026 03:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HbYaekua"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E903624DD
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 03:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769051061; cv=none; b=HrW2f/URbz8M58xtG912FbWDsxxnnw3/h7HvUkHkd2IKQl1bhLpSpNteX8sLxQasPA2oovVPi+KYPI+kFqTZ+nbYbub2Exg5292y3WYIia5YQ2edliUfg6V/GdYez3iq74DnI4vojeMYuqu9qwaQnxRQ0fOzxVPhvAreDkbA7ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769051061; c=relaxed/simple;
	bh=aWIpZruFnfeLnUmipF9PoJwZIk+pza0G6A4wP33USMs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nLRxL7uyFuDhp7R6qx5cU5wG5JBpZTMzH1sRv8GfdmGqnO66BPpOQIhXzUhruhGh2ylbzUcts4udIMjROpdVCOCqWA6fzq00dvJ6TeiAj/3yxWg4cw8ZXuDqWRqN1zH462PDejrb+lFQ80mmLATqmwaUvn0OQCJYJUfM9/wLLbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HbYaekua; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so4503875ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 19:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769051057; x=1769655857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AVZBAJ5EXu46k88wk2XqEWl9oBv9MxHKCH3s/g0zXt0=;
        b=HbYaekuasl4GvlGYX+ROb7YujhY3+6JnfRI1rzVQpZXjNEwtwSPAsI3C9p8xKZKciw
         UGrNBGVwLxeNKv+YPhpfLQPLAPHpQ8GCTM0YLHxYfrSucIxKi8G0ZOUwhDz9V7PLjGgI
         R6OAwiCD0lFiqkeXnZ7I4KURuxOM17Be3YeOVE35uIu/3pvhCqZVKr5obcPmecpg7Wbm
         L3Kdhrf8wIpvapbbmb7sn1avF0i969fiQixF67A9v60Yy9uj1xyE95qxZg6NY0nUYyju
         fzu1dK/YNfh5nk93SeQdbRWnxJ+MeXinxaeC39KSbAMkdHTYAAZqbDzDbc123BlKi9yU
         h5HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769051057; x=1769655857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AVZBAJ5EXu46k88wk2XqEWl9oBv9MxHKCH3s/g0zXt0=;
        b=wPYOEe6xilVHdhlfzndLdH2/PF/ffqaT2m7U/9Sq9LYXDSXwtnxInk6mr5aHhuSoev
         abaihdsxGp5rK5hqVe21caK72ddO6OoSH7M8AMT+rIUH2oqH3jZx3TOvZhYKdIyTR9LK
         jfO92Ewxu7oRmypaCJC76QvhQPUnELbwU9QdXSs7Nc/LtnAA8h9ptxT8n803WrWOBYJR
         2KbFksK+6B+/Wzq4Re2/8CBZjzU1bQZKApTleiAulFhNei4RIvBqYB1x0sapvstTP9ov
         KLq6DwMxLbWGI91sntS5aOX58EZ65NSWN7+JVQCUsa+m++GIA6njIBDw0DI8AB+d7b9a
         NDBA==
X-Forwarded-Encrypted: i=1; AJvYcCWnvHSZjE3SUL6f+uicCgQo9tiWAx9nseh0nEi61eMW1pylG4Ys35bq+pdS8XFeGx7O2cIXPvlbz+ytubnM@vger.kernel.org
X-Gm-Message-State: AOJu0YxgTzSUZscsogeUUFEMGGPBJmrnrS4TwvnFECccnaGNnhBMO0qa
	BRlMJWv8yEvLerSNxoYeUZGeY9poEqges/Vq8ZU+JgC34Cq9cvYqpPsS
X-Gm-Gg: AZuq6aIL+aLAxogHHo0RJtBUjNEzoB/G/rPa+NrWlDHgBwZAL7Lod1s1LfU1HHzGyVc
	YYtjobr8yEZ0e8olhfghRl8q7E/EbMpVqHPGdOKLROB0OX8cF/eciAFb7NzeB+cE/ZTsyaKXFkU
	D0ALCM/20jB02cFj+mC7faSYU3Yl9mWPsj27Qr0BT6k7tNDoVh8olUTItUQq4NAg97MUFxqFfFd
	MOH8eZwQ4wg1cSpkEQ9uaZCPAUkhmIiSACXVoxdgF80EEdzsbW0sa74mgpqHaKAhx+VEHpDl30M
	gEX+SimiekuyR5M4tHXSWpMIIcAg8pJ9/ooFGxrBxzMCM2niYJyp7qu2EdQgMoCp5OmRTj67uRA
	+/aWt9J6aiADzJ584Y7N0gX9fZKGQOcUo8KpqkbCBWmPnQFMAf5TsA5c0sFghoV1uea09xbKvKf
	/Uu8upeYaUHyqDYdEmoRGf8sq0P1hzq9HDhfe6HNdriDAvz6Rth3mBXvUb/Pq4pJ3ntg==
X-Received: by 2002:a17:902:cf41:b0:29e:fd60:2cf9 with SMTP id d9443c01a7336-2a76b169703mr73489085ad.54.1769051057371;
        Wed, 21 Jan 2026 19:04:17 -0800 (PST)
Received: from eurus-Lenovo-Legion-Y70002021.. (n058152022160.netvigator.com. [58.152.22.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fb998sm168938085ad.69.2026.01.21.19.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 19:04:16 -0800 (PST)
From: Wang Jiayue <akaieurus@gmail.com>
To: dakr@kernel.org
Cc: broonie@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	driver-core@lists.linux.dev,
	gregkh@linuxfoundation.org,
	hanguidong02@gmail.com,
	iommu@lists.linux.dev,
	joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_c_gdjako@quicinc.com,
	rafael@kernel.org,
	robin.clark@oss.qualcomm.com,
	robin.murphy@arm.com,
	will@kernel.org,
	Wang Jiayue <akaieurus@gmail.com>
Subject: Re: [PATCH] iommu/arm-smmu-qcom: do not register driver in probe()
Date: Thu, 22 Jan 2026 11:03:56 +0800
Message-Id: <20260122030356.61373-1-akaieurus@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260121141215.29658-1-dakr@kernel.org>
References: <20260121141215.29658-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_FROM(0.00)[bounces-90109-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,lists.linux.dev,linuxfoundation.org,gmail.com,8bytes.org,lists.infradead.org,vger.kernel.org,quicinc.com,arm.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_FIVE(0.00)[5];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	FROM_NEQ_ENVFROM(0.00)[akaieurus@gmail.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: 09D8361261
X-Rspamd-Action: no action

On Wed, Jan 21, 2026 at 10:12=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:=0D
>=0D
> Commit 0b4eeee2876f ("iommu/arm-smmu-qcom: Register the TBU driver in=0D
> qcom_smmu_impl_init") intended to also probe the TBU driver when=0D
> CONFIG_ARM_SMMU_QCOM_DEBUG is disabled, but also moved the corresponding=
=0D
> platform_driver_register() call into qcom_smmu_impl_init() which is=0D
> called from arm_smmu_device_probe().=0D
>=0D
> However, it neither makes sense to register drivers from probe()=0D
> callbacks of other drivers, nor does the driver core allow registering=0D
> drivers with a device lock already being held.=0D
>=0D
> The latter was revealed by commit dc23806a7c47 ("driver core: enforce=0D
> device_lock for driver_match_device()") leading to a deadlock condition=0D
> described in [1].=0D
>=0D
> Additionally, it was noted by Robin that the current approach is=0D
> potentially racy with async probe [2].=0D
>=0D
> Hence, fix this by registering the qcom_smmu_tbu_driver from=0D
> module_init(). Unfortunately, due to the vendoring of the driver, this=0D
> requires an indirection through arm-smmu-impl.c.=0D
>=0D
> Reported-by: Mark Brown <broonie@kernel.org>=0D
> Closes: https://lore.kernel.org/lkml/7ae38e31-ef31-43ad-9106-7c76ea0e8596=
@sirena.org.uk/=0D
> Link: https://lore.kernel.org/lkml/DFU7CEPUSG9A.1KKGVW4HIPMSH@kernel.org/=
 [1]=0D
> Link: https://lore.kernel.org/lkml/0c0d3707-9ea5-44f9-88a1-a65c62e3df8d@a=
rm.com/ [2]=0D
> Fixes: dc23806a7c47 ("driver core: enforce device_lock for driver_match_d=
evice()")=0D
> Fixes: 0b4eeee2876f ("iommu/arm-smmu-qcom: Register the TBU driver in qco=
m_smmu_impl_init")=0D
=0D
Glad the backtrace helped identify the root cause.=0D
=0D
I applied this patch to the qemu setup where I successfully reproduced the=
=0D
boot hang earlier, and the deadlock is resolved.=0D
=0D
Tested-by: Wang Jiayue <akaieurus@gmail.com>=0D
Reviewed-by: Wang Jiayue <akaieurus@gmail.com>=0D
=0D
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>=0D
> ---=0D
>  drivers/iommu/arm/arm-smmu/arm-smmu-impl.c | 14 +++++++++++++=0D
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 14 +++++++++----=0D
>  drivers/iommu/arm/arm-smmu/arm-smmu.c      | 24 +++++++++++++++++++++-=0D
>  drivers/iommu/arm/arm-smmu/arm-smmu.h      |  5 +++++=0D
>  4 files changed, 52 insertions(+), 5 deletions(-)=0D
>=0D
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-impl.c=0D
> index db9b9a8e139c..4565a58bb213 100644=0D
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c=0D
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c=0D
> @@ -228,3 +228,17 @@ struct arm_smmu_device *arm_smmu_impl_init(struct ar=
m_smmu_device *smmu)=0D
>=0D
>         return smmu;=0D
>  }=0D
> +=0D
> +int __init arm_smmu_impl_module_init(void)=0D
> +{=0D
> +       if (IS_ENABLED(CONFIG_ARM_SMMU_QCOM))=0D
> +               return qcom_smmu_module_init();=0D
> +=0D
> +       return 0;=0D
> +}=0D
> +=0D
> +void __exit arm_smmu_impl_module_exit(void)=0D
> +{=0D
> +       if (IS_ENABLED(CONFIG_ARM_SMMU_QCOM))=0D
> +               qcom_smmu_module_exit();=0D
> +}=0D
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.c=0D
> index 573085349df3..22906d2c9a2d 100644=0D
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c=0D
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c=0D
> @@ -774,10 +774,6 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct a=
rm_smmu_device *smmu)=0D
>  {=0D
>         const struct device_node *np =3D smmu->dev->of_node;=0D
>         const struct of_device_id *match;=0D
> -       static u8 tbu_registered;=0D
> -=0D
> -       if (!tbu_registered++)=0D
> -               platform_driver_register(&qcom_smmu_tbu_driver);=0D
>=0D
>  #ifdef CONFIG_ACPI=0D
>         if (np =3D=3D NULL) {=0D
> @@ -802,3 +798,13 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct a=
rm_smmu_device *smmu)=0D
>=0D
>         return smmu;=0D
>  }=0D
> +=0D
> +int __init qcom_smmu_module_init(void)=0D
> +{=0D
> +       return platform_driver_register(&qcom_smmu_tbu_driver);=0D
> +}=0D
> +=0D
> +void __exit qcom_smmu_module_exit(void)=0D
> +{=0D
> +       platform_driver_unregister(&qcom_smmu_tbu_driver);=0D
> +}=0D
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/ar=
m-smmu/arm-smmu.c=0D
> index 5e690cf85ec9..1e218fbea35a 100644=0D
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c=0D
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c=0D
> @@ -2365,7 +2365,29 @@ static struct platform_driver arm_smmu_driver =3D =
{=0D
>         .remove =3D arm_smmu_device_remove,=0D
>         .shutdown =3D arm_smmu_device_shutdown,=0D
>  };=0D
> -module_platform_driver(arm_smmu_driver);=0D
> +=0D
> +static int __init arm_smmu_init(void)=0D
> +{=0D
> +       int ret;=0D
> +=0D
> +       ret =3D platform_driver_register(&arm_smmu_driver);=0D
> +       if (ret)=0D
> +               return ret;=0D
> +=0D
> +       ret =3D arm_smmu_impl_module_init();=0D
> +       if (ret)=0D
> +               platform_driver_unregister(&arm_smmu_driver);=0D
> +=0D
> +       return ret;=0D
> +}=0D
> +module_init(arm_smmu_init);=0D
> +=0D
> +static void __exit arm_smmu_exit(void)=0D
> +{=0D
> +       arm_smmu_impl_module_exit();=0D
> +       platform_driver_unregister(&arm_smmu_driver);=0D
> +}=0D
> +module_exit(arm_smmu_exit);=0D
>=0D
>  MODULE_DESCRIPTION("IOMMU API for ARM architected SMMU implementations")=
;=0D
>  MODULE_AUTHOR("Will Deacon <will@kernel.org>");=0D
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/ar=
m-smmu/arm-smmu.h=0D
> index 2dbf3243b5ad..26d2e33cd328 100644=0D
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h=0D
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h=0D
> @@ -540,6 +540,11 @@ struct arm_smmu_device *arm_smmu_impl_init(struct ar=
m_smmu_device *smmu);=0D
>  struct arm_smmu_device *nvidia_smmu_impl_init(struct arm_smmu_device *sm=
mu);=0D
>  struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu=
);=0D
>=0D
> +int __init arm_smmu_impl_module_init(void);=0D
> +void __exit arm_smmu_impl_module_exit(void);=0D
> +int __init qcom_smmu_module_init(void);=0D
> +void __exit qcom_smmu_module_exit(void);=0D
> +=0D
>  void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx);=
=0D
>  int arm_mmu500_reset(struct arm_smmu_device *smmu);=0D
>=0D
>=0D
> base-commit: dc23806a7c47ec5f1293aba407fb69519f976ee0=0D
> --=0D
> 2.52.0=0D
>=0D

