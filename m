Return-Path: <linux-arm-msm+bounces-11138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F84855C48
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 09:21:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88D891C2154C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 08:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38D9019A;
	Thu, 15 Feb 2024 08:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qwwcB3zS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C49313AC2
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Feb 2024 08:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707985172; cv=none; b=nZro0Gqr78MKMXH/tQeS2Sn0z0SNarmxJ/Url3UifwUb214U9ZDbSd8fqs/QY4gyVEVvKDySGijk1kIDk/cwZZG79fPKuoI5M2PMCMBELbQiOoj1X9FdQuN/+grYSFdw/ZBSR4BYrazTV8eugf+b0rnyRDy5OWcRFEfsVljr0uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707985172; c=relaxed/simple;
	bh=BqII8sLl+bLQlyhO+D8CNbC1gFYjbsADqDSOC1kPc5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FiR9UlWVrCqlgx54xNXvkPfStyg18l/y0Xfbe0RU4nWrUewe4cfFWlSmhbBPWe3c/wCAbLhGAYvBvnvPpSC8EnlfSw4o56XR2/gLkcnzJGLjFz+cpBOmdkfz3cwt5ju06LcLFoyfOzr39d2DnyMOkm/lb0q9/i0cZNzyJ1JijlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qwwcB3zS; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-607c300ad0eso6013237b3.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Feb 2024 00:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707985169; x=1708589969; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=smEYS7WqwFSJ9Pd2kHyuKD+PL+fmgIBnH3NnS3BRkCE=;
        b=qwwcB3zSPGM+jAkOvGTqQe7adNcInrAy+mDcI53w060De2POOq3/LibggB8peCCKhG
         eNDhlLuH1E4ld2vtO7UkRkl/BozKUndgLDVK7xfj10+3mxymr8R6b9pgymHdqPfej3AY
         M8WrklcbGML8gzfWDewm9ltYRvmVG5Gq7YkyRnpe/TDiqRhQkiZsgnt0HDpJVeZqo9FE
         hfTHFOYOrr4lv2SmGOz76Ahmu9QHhrUf5BU8xb4lTu6wC8+jgcSOOokiJs2Z1A3uWWGe
         UeW4ERjCi9FQHgPG4sv4YppD/KnJgOpnqnnoqnaxZ+6I/7+0GM/cbtS1LSSIlGSkR8Ye
         Z4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707985169; x=1708589969;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=smEYS7WqwFSJ9Pd2kHyuKD+PL+fmgIBnH3NnS3BRkCE=;
        b=ElvJy7HvuYl/nFNoA2MZ9COZoLF52XLD/hHymUtfGtnGuJLhk7xbk7KWzOi66r3QJi
         jX03x+99NzcMpF+cuwhRuOazQvwOelAapG2lUpFrqUeXMdr0kqUDXFFB8i/zs9ohv3WT
         lLvkuBoEYSELFjOoWlGSBV1gokTEYJ8Baz8mq6v/DGLvgCKizdmEmexiu3RkwBg9K4rB
         D5Ee3qVOMce2GhQel+NXoilbKxwfsmRILmmjP2hRlD8UtDec6ktGr0l+7Nn/x6yXK13E
         J2t9f4hnRyE3PmSRwlcgHwspVe+gCvv8wLoxiYKM4M/5QnQlFVVrip3etBFyL4Z+z7bF
         BPBw==
X-Forwarded-Encrypted: i=1; AJvYcCXg+ygVMtHum1FKzGOsv6vem3vzdRT9OvleRfl1Rsyvpp18irJE9yQ/9lBsW7xXy1fi8q2Ft4FCyUQT0MAcCXf1efiRbqdO8QJBCz9k2Q==
X-Gm-Message-State: AOJu0YyP+c2exoyjY9X7rx+DB0JSfL6bWsnGkCcLXlwKyPHINAne+lj8
	NaO9BW/bAFSRIliBVB07wc+NyxlVQUi8aEqOAO0lRhRjIn9dHKz/0VbJxe0Eyk2ctOPJmNClN0m
	fWoBQP9hF/CR6qBYeD+tD1oIuMMjSVjge1MkZXg==
X-Google-Smtp-Source: AGHT+IFQ5xk0zng2QCwMIJqzsnAFQcVsqtYYUFMBaSsSK/qzjxvxnRcCnApdfjbw2VVm3Angga8cG50TFG1YC4IGHYo=
X-Received: by 2002:a25:c581:0:b0:dc6:17d2:3b89 with SMTP id
 v123-20020a25c581000000b00dc617d23b89mr889731ybe.61.1707985169569; Thu, 15
 Feb 2024 00:19:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240213-msm8996-fix-ufs-v2-0-650758c26458@linaro.org>
 <20240213-msm8996-fix-ufs-v2-3-650758c26458@linaro.org> <a0f7de54-7e6b-473e-94ac-bece804bd6e8@linaro.org>
In-Reply-To: <a0f7de54-7e6b-473e-94ac-bece804bd6e8@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 15 Feb 2024 10:19:19 +0200
Message-ID: <CAA8EJpqPpn43bNca9Ld_XtoBYJTTMXcMhHywU8E9CgkeQEbwow@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: msm8996: specify UFS core_clk frequencies
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, "James E.J. Bottomley" <jejb@linux.ibm.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Nitin Rawat <quic_nitirawa@quicinc.com>, 
	Can Guo <quic_cang@quicinc.com>, 
	Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
	Bart Van Assche <bvanassche@acm.org>, Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Feb 2024 at 23:24, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 13.02.2024 12:22, Dmitry Baryshkov wrote:
> > Follow the example of other platforms and specify core_clk frequencies
> > in the frequency table in addition to the core_clk_src frequencies. The
> > driver should be setting the leaf frequency instead of some interim
> > clock freq.
> >
> > Suggested-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> > Fixes: 57fc67ef0d35 ("arm64: dts: qcom: msm8996: Add ufs related nodes")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > index 80d83e01bb4d..401c6cce9fec 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > @@ -2072,7 +2072,7 @@ ufshc: ufshc@624000 {
> >                               <&gcc GCC_UFS_RX_SYMBOL_0_CLK>;
> >                       freq-table-hz =
> >                               <100000000 200000000>,
> > -                             <0 0>,
> > +                             <100000000 200000000>,
>
> That's bus_clk, no?

No, it's a core_clk. The "core_clk_src" is removed in one of the next patches.

>
> Konrad
>


-- 
With best wishes
Dmitry

