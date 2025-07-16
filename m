Return-Path: <linux-arm-msm+bounces-65265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4440EB07804
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 16:28:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9CB8A427F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 14:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 499CA23496F;
	Wed, 16 Jul 2025 14:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bDBSFMwB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22D1218589
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 14:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752676087; cv=none; b=aYAppDV3YwzWD8IsCDKVSApxYr/zHprgIh5waoBgwA5ZrJ/zCH3oqhHQM4rCuVUWI/GDH0zjHT+WPYhpJE+dgRBRs+EHnIb/pHj12SZdp7/BnErS3gdTib2JlWfWVjq+L0jsvuzk8jhQiodioC02+FduQ++XZF2VZU4sYRZFTiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752676087; c=relaxed/simple;
	bh=HzXwiqqDnfe41YiTu6uYFU8UDZG1ohDw66m7kk99BP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lB4BEFt9CWi6c0ylyqtG6g3HRynoLGrjnMMghFVoMkc2gg9125JCaGthkk9oHMiI3uCWwrETKWIlZDIw+4AytkClGKP88ToC/3FCsSNGwJ/wdCw+YKsN0sW6wy9pSx/w51Z4e9tKuEINUi73C/ubtcCjgwiY/dQ4bCcUA1jHcow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bDBSFMwB; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2f77591f208so444688fac.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 07:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752676084; x=1753280884; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VuHTPSN5ob/sxMMWugl2mb75NZygOdwpDw39+8JfWkw=;
        b=bDBSFMwB7OrQ6FKJKzr/cqxRxm0cfISSULyTCV2jLvYxrureRTEgcwE7O6dPL66F7G
         2xVpg5w/BF9zLTzFjjlT76VSZPLgtLFILdszzjzgLwmRFLXRoVlAKPUpLTXFiujWXY+C
         hieEV8VomfL4vlbs+wqg5zKdcVfaakGk8j9gQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752676084; x=1753280884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VuHTPSN5ob/sxMMWugl2mb75NZygOdwpDw39+8JfWkw=;
        b=iJakOZsZtk0ICJnJFDbTnVIDkLz4lyQcVsG3Lv2JKZTCnouXVXfRsIinBIJcU+u3en
         EMKfG+Pi3rY6YCuEepmmooUCGSjPekazNKqIqfzBqougHJZ0WMEQTrrzsiqO62jUJNsY
         8rgvUhSmp8hiRAZ46czuS8TAOUnCByAr54mKUy0nngdkOTyk2VW0Pmw5Cx5ZiYMOhExy
         N1xYZ7HT1za+CO2TmQObBDBhG7cCeaAP7zu58pPlMR2Esv3MBG235pFPB4wcvnkAtu9R
         7iNxFz1RXBtias1FVSeT7BhmHnwQW/6Fn0IGqux/wJApZuTioVmxU97YiTg7Cu+TsN0M
         IsRw==
X-Forwarded-Encrypted: i=1; AJvYcCWXAyV3o4t9L+844Nh6iQJ9dm4sZHf8540HtMsgnuF6i+gAN3wxclwMTUvXMIMuVHi6hxKc9BQ0BwsK4K9y@vger.kernel.org
X-Gm-Message-State: AOJu0YxsWwp/gAQoQp6MqYnzzCF50fmseSYheMdm/WLZdrg3WrsW2cAy
	+vSMX1DCwdkxxUv/cXIlqO6PHLfahVQcUQtnIwy5nqHcPGFcRgxHMzZmmzFSsDVvPjYXEzbgzA0
	hqjA=
X-Gm-Gg: ASbGnct+86mMNZCWHmvpZ7hCiHC7v43Bkujgb+vOYgRjBG3QHteIN4xb5P3RwBmQs6o
	wj+DZG5+xwAxXKe3kzScsDXZUDHGtzfIbBQd/nXcKZySauUfD8Q+JKGnlZgEMRM1PxgQW4XXxWM
	DHbMEx7vyi1ox+0ka8cIM7b6hszYASfdHUsoXYO7tv+r9pbkUedXDfi3jI+sropsS80/pBe8g+r
	6mb0mCShdxMJfUmy+o7ZzGIJ0LslR6V7ptBA/KccBqnnKRureYp+8ERaZ3GRZ97guBGju/rlAd8
	jondxJmCEs4d8lLRjKfAvBJLnXCDVoPOWdvcLH8ZUasSh+hlPPyeWj0dw6EvhvBZHRuvy7JgAd4
	QLNPx9B402KK2GPPAMKzrXaw6SOdGI7fXcQhCn1UTvGE4reRbLNfgxbU4sYIwwQ==
X-Google-Smtp-Source: AGHT+IGQXKwyqEbtc7GG0joiSr37ZBS8Tvx4iUNyWTCvSu72HSCPgnyc7z5YEvra3q/qqVX02OYRkw==
X-Received: by 2002:a05:6870:64a9:b0:2e9:5d01:effc with SMTP id 586e51a60fabf-2ff8f990b24mr5068780fac.2.1752676083848;
        Wed, 16 Jul 2025 07:28:03 -0700 (PDT)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com. [209.85.160.54])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ff116d68a8sm3549180fac.38.2025.07.16.07.27.57
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 07:28:00 -0700 (PDT)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2ffaa884a44so475129fac.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 07:27:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWzXeDrDSMAFS+AAzUSUo4qw+8ZfQPnotG3aScB+i9nldDd5Twb4X8kqilFKVY9kyB2zOCoLwIgvKIb/d4Z@vger.kernel.org
X-Received: by 2002:a17:90b:3e45:b0:310:c8ec:4192 with SMTP id
 98e67ed59e1d1-31c8f9bab05mr11330150a91.10.1752675724138; Wed, 16 Jul 2025
 07:22:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250716-topic-goodnight_cheza-v2-0-6fa8d3261813@oss.qualcomm.com>
 <20250716-topic-goodnight_cheza-v2-3-6fa8d3261813@oss.qualcomm.com>
In-Reply-To: <20250716-topic-goodnight_cheza-v2-3-6fa8d3261813@oss.qualcomm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 16 Jul 2025 07:21:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XmwiA_gX9pF5Dja1vezson7f21WHC8u8+Rhg_6OUJ+rw@mail.gmail.com>
X-Gm-Features: Ac12FXxTIFX6vNFTUbNM5dNMu4K5yloNK1nFrEKpkxnVSSYFOEXl7o-QWsvciQ8
Message-ID: <CAD=FV=XmwiA_gX9pF5Dja1vezson7f21WHC8u8+Rhg_6OUJ+rw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: arm-smmu: Remove sdm845-cheza
 specific entry
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rob Clark <robin.clark@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jul 16, 2025 at 3:16=E2=80=AFAM 'Konrad Dybcio' via
cros-qcom-dts-watchers <cros-qcom-dts-watchers@chromium.org> wrote:
>
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> The firmware on SDM845-based Cheza boards did not provide the same
> level of feature support for SMMUs (particularly around the Adreno
> GPU integration).
>
> Now that Cheza is being removed from the kernel (almost none exist at
> this point in time), retire the entry as well.
>
> Most notably, it's not being marked as deprecated instead, as there is
> no indication that any more of those ~7 year old devboards will be
> built.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Docu=
mentation/devicetree/bindings/iommu/arm,smmu.yaml
> index 7b9d5507d6ccd6b845a57eeae59fe80ba75cc652..646814ec7d15f6d8a0136de73=
b7eaddae232ea64 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -132,10 +132,6 @@ properties:
>                - qcom,sm7150-smmu-v2
>            - const: qcom,adreno-smmu
>            - const: qcom,smmu-v2
> -      - description: Qcom Adreno GPUs on Google Cheza platform
> -        items:
> -          - const: qcom,sdm845-smmu-v2
> -          - const: qcom,smmu-v2

The code supporting this can also be removed then, right?

drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c:     { .compatible =3D
"qcom,sdm845-smmu-v2", .data =3D &qcom_smmu_v2_data },

Reviewed-by: Douglas Anderson <dianders@chromium.org>

