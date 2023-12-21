Return-Path: <linux-arm-msm+bounces-5687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 713C381ABC0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 01:29:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2786E1F21F0B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 00:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D862964A;
	Thu, 21 Dec 2023 00:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ow8eCw1R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A747C623
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Dec 2023 00:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dbdb5e37f93so219620276.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Dec 2023 16:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703118499; x=1703723299; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5sMbFiggIUmpWXZnrREwNxuVRfp3qHTdWSSj+2QBgxQ=;
        b=Ow8eCw1R88bJd64R3tLV0RS4CGnNFiqum9RVlbpD748bZR7iKrm+oYkEmE77cOlJjC
         3KRRnvtZT0TfhXpv9WLltiNDFq6p0WdembXMQJGkupl3wErFPLFBxqBRn1F8cQ44FzCN
         8sOjOQfulMpaoirnzL3gLThWUa7GcWxTMZU96yFBkeLk97yrEeFilEeJ4IdVe26wzCnj
         mmtusxZUcaYVwgGsdE9TwRaz1MP3ju2DOA22obDfoTGPbBqOKjkr2Zj4kyur8WoCIsbP
         gQ/i2QRM2vRNqt3eeRSiMIkv06bNzV2FFi5D5PSPewpeG3KKpJAsM6h0dfwDlZpgpIF1
         2mLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703118499; x=1703723299;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5sMbFiggIUmpWXZnrREwNxuVRfp3qHTdWSSj+2QBgxQ=;
        b=h88y/cNhooHau5TEXT2mSvpPNuyUaJ1BlcM0AjDK6dgMX1+4c4nqL0VyeWS48J69Jf
         xSYMjYXBdrvuvbisoGwxUj7wJnM+qSw/2mdei+rqhgISy10/fgqkuUEd/cMJa+vA+dtz
         mlR6tyKqq1xrOf8lSPoOMKYQx3yzFF1MLzmgDOdfDz8fD1QJOuNJe8/ZzagbVWpicyIi
         1+ryQjJQJeGvDRkB39RVwPWFPkZ5YH7oi5ynLSF0Zs40GB3AO+1Ghv6Y09/qKNoPEULt
         OyvkWD7ze7hb+d40nQebrUVsySZBerx/vrLQCjYIGU3u+4v3+duS+W7PYg13x6Xu5QBm
         HS9A==
X-Gm-Message-State: AOJu0YxqVnGJSV8Y/kT59FdpP0tzHMdjRvYza17iiAl7/ogYY9ecNtmr
	Q/DGv2hrkBcWyzn/mklxEAr+NfIamLZIqWIeWt3V0w==
X-Google-Smtp-Source: AGHT+IEXA5o0utbapRU0+vSEAQxdKOvIWZZnqGp+XkTJgxSCokGvW5Qw4aB0oXschndT2a3KehjpQUnEbq8jzosLp4w=
X-Received: by 2002:a25:2d11:0:b0:dbc:e3cf:5763 with SMTP id
 t17-20020a252d11000000b00dbce3cf5763mr552348ybt.57.1703118499654; Wed, 20 Dec
 2023 16:28:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231220133808.5654-1-quic_bibekkum@quicinc.com> <20231220133808.5654-3-quic_bibekkum@quicinc.com>
In-Reply-To: <20231220133808.5654-3-quic_bibekkum@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 21 Dec 2023 02:28:08 +0200
Message-ID: <CAA8EJpoh_jsA6UrH1aEaJ4cufBTKENvG1zqjciy7WSTEh9nmnQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/5] iommu/arm-smmu: refactor qcom_smmu structure to
 include single pointer
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, 
	konrad.dybcio@linaro.org, jsnitsel@redhat.com, quic_bjorande@quicinc.com, 
	mani@kernel.org, quic_eberman@quicinc.com, robdclark@chromium.org, 
	u.kleine-koenig@pengutronix.de, robh@kernel.org, vladimir.oltean@nxp.com, 
	quic_pkondeti@quicinc.com, quic_molvera@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	qipl.kernel.upstream@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Dec 2023 at 15:38, Bibek Kumar Patro
<quic_bibekkum@quicinc.com> wrote:
>
> qcom_smmu_match_data is static and constant so refactor qcom_smmu
> to store single pointer to qcom_smmu_match_data instead of
> replicating multiple child members of the same and handle the further
> dereferences in the places that want them.
>
> Suggested-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c | 2 +-
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c       | 2 +-
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h       | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

