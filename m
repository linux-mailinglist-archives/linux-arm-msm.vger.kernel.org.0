Return-Path: <linux-arm-msm+bounces-81463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A12CC53085
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 16:29:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7A3E03586AD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 15:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CA6333C510;
	Wed, 12 Nov 2025 15:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cW/Ju3Xd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539AC2882D3
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 15:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762959908; cv=none; b=Fip/Cs/2o+uouIOOP9IFsyAGgiWtEQ5bYho0ST4xWGbgPpah29+aqq5Y3BY50KDapH/vZBGH6m+wlJjziGb6qxgJfykCIaTf6P1VVCosL3XBd1JW+b012aQAL7tZE27cWV8wEOsE+N/Vp4A1QuICsO5EEQ89ljHYW8GmH06h/NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762959908; c=relaxed/simple;
	bh=FIAphDibMa8xAGt0oMhOdg/Lxpd1tnylTtVjb7k1iJM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HpqTviUYb4j0oO5ZrgrLgR4D8rxMeikVv496NZDGALhzYbxhrYEahsC3d9KPmnVYCbd3E8IWbgfyRtvAB9K9ltD0WfyOGXfUUgta0uVTG5IRgnx0M3dSX1R7ZMSrickuiRx/eF4NghgF62Fl9ULnb2ZKL6UklbKV4i9m7xcy4fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cW/Ju3Xd; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-37a33b06028so8894861fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 07:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762959904; x=1763564704; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rmsnGw4PfJsQw8KA/neT+eebP5BBF6SBpPNbiarSAls=;
        b=cW/Ju3Xd3wL9t399QvrP4TM9yvMhC39qt/nLYOjU24Z7Kn1reRSli5ecLHUb3SOEcS
         566R0xKvlxdBI3pyDLqDhsduggbl4iCU0JTsV30M9e6092s/uk5/BMMNnBg2FGc8/v/T
         lDNILxxMVlWst86bBVJgVDT0g9uOmhVLD1oTUDMHKpHx2FXRI+9m03pYciEl6oh2DHVt
         XNFiGc/yerpmhbJhKwv9Nrk8qA9QeCzm83o7iwZRo+d0X/xePfK8h1oQFrBH8JI7Bw7o
         dcD1ew1iXmnihKvT5whwRyOovuDnTOxSL6M/zp3nFlHsWJlXeTHHlFQFf3wRlATiZ+ys
         539g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762959904; x=1763564704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rmsnGw4PfJsQw8KA/neT+eebP5BBF6SBpPNbiarSAls=;
        b=wz9UMVfjUaRba1XJPclcj/3WdEgXKkw6WGdZ87Oghli2+5Cqtg4TuQDv7wrd86i6oG
         AZjdW3jBLAVg5hCGm1aS5tZZ0cL7mi1Sql4XGZLd2uVD8ofbwRSnUSA+8YZGmF9QcmnT
         ueh+ZfcV+aJsUnwjJrtdzFXkRCFzi5h5aom5ObbEv6i16/dQ2qNTbtkt93pyi0ErDHDl
         a8dNGEl+aI4EKcCFcVdshpFcZsfkA4CZMCFvTJzO+cc2mQfw8pOGez5McjkuOpYvyhiW
         MwwJFN2z8pg+gtXMCpPYq/14dRNUAKTpcyt7Su2x+R8VK6zUzLzEztQsHD8IhOy9lqEw
         JYSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjvmYPehRz0ZYIY05um/XY/zX/zKawNHoFjiMpHO6QETvUNsyOi+T2I68+axBMzBX2G+z1sqIFOyoVj2bA@vger.kernel.org
X-Gm-Message-State: AOJu0YxOyaJHAExZf9yXCLJXupCLzn/0ADaKRc8Yjz1k8b1SeknOYIEy
	exF1aJ2ZhhqIzSISiFCRvKB5pkdw4LmPRO5RQp4Rpy2S80788atqrAVFiTqBtRlg710DihdAEwH
	NpdFoqPStaZ3ofjcQWmlCthhFW1J5MU98yx+SuoHd9w==
X-Gm-Gg: ASbGncsRy0wfgMq94Cspa2TkTp8hKGFuU6RkzcBlTyXVxEF58dVw9SMcjWfWl2ri9W3
	iJ+l/EFImMut4NNwKuaoq2dZPO02nmAk1Pzh7W0NQ0clX1u57Svmk9zMbDRFrnDga+rC/ePcq8t
	EPGUOa2qosaAFS/MfI3iYB1JMB9bkjc8E1S4U8bywCqur3ydmT/vPSvHtslYARum5ojyxn7xLtX
	xITTO7Eb84HO4w8HYzV7dMcWNVSbijKTGBX000IdoQIrcQBhmPK3EZzB3qfqHJdsQq+125wrecw
	vgQPoZ8jL874
X-Google-Smtp-Source: AGHT+IGpFZP82Q3cbrNeFsJc4tKVrryXSSKN61jox+qRc2N3O6n0Phs2f40ef+TfbeVUzZ7oOVHXjU/rRF9NrH3t2mo=
X-Received: by 2002:a05:6512:2244:b0:594:4ebf:e6eb with SMTP id
 2adb3069b0e04-59576df8bf0mr1056064e87.14.1762959904372; Wed, 12 Nov 2025
 07:05:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251108-pci-m2-v2-0-e8bc4d7bf42d@oss.qualcomm.com> <20251108-pci-m2-v2-4-e8bc4d7bf42d@oss.qualcomm.com>
In-Reply-To: <20251108-pci-m2-v2-4-e8bc4d7bf42d@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 12 Nov 2025 16:04:51 +0100
X-Gm-Features: AWmQ_bn6jfC1UwRAcmNPmB9esLpHkqY8yzwF9QLHVPKS_PQlxia95vgSqktJHYI
Message-ID: <CAMRc=Mfh-5D4Fv+HGJLFMUcOGKPkq7Jsz64LZcTiYxP0b87goQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] power: sequencing: Add the Power Sequencing driver
 for the PCIe M.2 connectors
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 8, 2025 at 4:24=E2=80=AFAM Manivannan Sadhasivam
<manivannan.sadhasivam@oss.qualcomm.com> wrote:
>
> +
> +static int pwrseq_pcie_m2_match(struct pwrseq_device *pwrseq,
> +                                struct device *dev)
> +{
> +       struct pwrseq_pcie_m2_ctx *ctx =3D pwrseq_device_get_drvdata(pwrs=
eq);
> +       struct device_node *remote, *endpoint;
> +
> +       /*
> +        * Traverse the 'remote-endpoint' nodes and check if the remote n=
ode's
> +        * parent matches the OF node of 'dev'.
> +        */
> +       for_each_endpoint_of_node(ctx->of_node, endpoint) {
> +               remote =3D of_graph_get_remote_port_parent(endpoint);
> +               if (remote && (remote =3D=3D dev_of_node(dev))) {
> +                       of_node_put(remote);
> +                       of_node_put(endpoint);
> +                       return PWRSEQ_MATCH_OK;
> +               }
> +               of_node_put(remote);
> +       }
> +
> +       return PWRSEQ_NO_MATCH;
> +}

Nit: I would simplify this function with __free(device_node) since
there'll be a v3 anyway. Other than that it looks good, so when the
bindings get acked I assume this can go into the pwrseq/for-next?
There don't seem to be any build-time dependencies between this and
the PCI part.

Bart

