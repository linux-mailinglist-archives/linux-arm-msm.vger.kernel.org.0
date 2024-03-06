Return-Path: <linux-arm-msm+bounces-13533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5330874015
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 20:05:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7ABCE2829AA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 19:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88C3213E7E4;
	Wed,  6 Mar 2024 19:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nU3fX5Tu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE35E5FDCC
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Mar 2024 19:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709751915; cv=none; b=NQsc+/zcjJ+d+BzNJv/JXF5GIdbiZuxmJVPomSftmFNr/ZZ/b6KqfDLiRm1ygr+MZQvXgT9vg1cvmBqOCn2VxglxxBRAptulq21zEsLWz0Ec89OdJci+vy/90AHQO4235pa2ymK/0VmdPwjOVBBGnLw7NICG5JaCuRLr/rVZ8zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709751915; c=relaxed/simple;
	bh=mHLju7qL93F2u968OifIn91fsuAol3MDudKqWQKxROc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XTjAzv+KWECcZizXeNT5JruRrNHHHnXcfLJCAoz8W0Sl8ttVAl+eIzyIPOsOHB2VdUaC04Yk1UaJm4Rv67R49oeq/VC17XIcC4iXFJtIJwm2TwkHxIgbw/JLL1KUiVVIPG4tayGJUxHVIPn+3aRexkOX8abIL08fG60QdHlpb1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nU3fX5Tu; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dd02fb9a31cso4315300276.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Mar 2024 11:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709751913; x=1710356713; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q9Dz5IweVp7u5AkiGYK4q5oZtWjMI5V6f9hbtIZbpnw=;
        b=nU3fX5TuZkYqo628+U2CZ7LTDIXLy8rHpM1hIbJ+Jcn3KYsrFNo+jk2n/Jr63nwUvL
         3FfZ/ftece8LHjrawKn8SZt/36xHc1rptCpEsbH58BblT9do3JDklWXovvwip4c0nklf
         F7X71p8Bqgk9vaS/NH7oCd69kaqt7ht/YT6neD4HdGdvNjB6Rl952dUSyCTTZC0pkpIb
         PRghW0coRbR3+ttZoyX9ORYbsySBJYAvI31g64SkFRksbZKfKjp9mgn6Qu3Bef3W6Lvj
         Dyt+HnoPDSFA3qGvWZxFwn4CzmOA6csHwEbyoethy+swhSszmRT1lVL+lMVn6JNH72Et
         MGPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709751913; x=1710356713;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q9Dz5IweVp7u5AkiGYK4q5oZtWjMI5V6f9hbtIZbpnw=;
        b=VWTNJlydyfakJJJaRk+MzhPcRv/HN0lLg3IX0dJf0q3KKt8qYv5iksS83uZRS8MRzV
         2VBmRYjaY1T9SB35ZdHNh/J7gIWBWOGMMm11Au6CNOoRqezHudKfrKwkR3VhnGMF/Fq/
         /ol2VKAz3kfKyni7PIny3gtOeX53+il4yn8KWkFxCd5Ty0ILwDoeWIrSXalE5VoWAEHR
         /ASN/0qZ7AsqSHCSkTmxvOkxOCmeUrPIh/2rszqeYiyKUhp/AAjxmNIsfaLZVLB6y2Er
         tgdidTGoRo70BEnQgg38HWNFpd5Exe7Iw16g9pl0+6wwJ7pB19cp2CuL82d6USta3kjD
         sg0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVNIFWHsc1kKbT4bGmGJZB98r6A/yUfDNfhfhfemlNoE7wPCbPGHz+/tJxwZIkwXOdRJr8qqd0QRrjFfYG/b1tM+uB/NjnZ5PQ2FZZIkQ==
X-Gm-Message-State: AOJu0Yz8FHA3T9JJRUKK/xkC/ozyAYpKCwo3B81BnuYt53QAMBY+++1R
	6YleoZ90QEXBvvGYpQZNlTxAylefrtXgKr17k7h07OPJLjptLfZCZ5Ug43Sxp+JqqyVhw5K+pPF
	6+Lic0HOJHWN6CdEnmMAXALPrazTFWKXFjSP4/A==
X-Google-Smtp-Source: AGHT+IFC+4YdX9W/XnW+sn+ulzfAedByNbzUijQDRlwBizUg8UJ0PuL6UYp9q1eWBsfhKNGKnuSCWJkwn3BXptbDTO4=
X-Received: by 2002:a25:df11:0:b0:dcc:245b:690e with SMTP id
 w17-20020a25df11000000b00dcc245b690emr10217316ybg.40.1709751912731; Wed, 06
 Mar 2024 11:05:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1709657858-8563-1-git-send-email-quic_sriramd@quicinc.com>
 <1709657858-8563-3-git-send-email-quic_sriramd@quicinc.com>
 <CAA8EJpoi0T-riqxbTzVymHwZmBHg5xO_Rwqy0ck-7cvGy291_A@mail.gmail.com> <935cdd47-ce71-4095-8cb5-e0f03fb30959@quicinc.com>
In-Reply-To: <935cdd47-ce71-4095-8cb5-e0f03fb30959@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 6 Mar 2024 21:05:01 +0200
Message-ID: <CAA8EJpp4pYCx5hVwrmb0gs2PaRnxUapHqAhksDocEugBsOECbQ@mail.gmail.com>
Subject: Re: [RFC 2/3] USB: dwc3: qcom: Add support for firmware managed resources
To: Sriram Dash <quic_sriramd@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org, 
	kishon@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, gregkh@linuxfoundation.org, quic_wcheng@quicinc.com, 
	Thinh.Nguyen@synopsys.com, p.zabel@pengutronix.de, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, quic_psodagud@quicinc.com, quic_nkela@quicinc.com, 
	manivannan.sadhasivam@linaro.org, ulf.hansson@linaro.org, 
	sudeep.holla@arm.com, quic_shazhuss@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 Mar 2024 at 18:53, Sriram Dash <quic_sriramd@quicinc.com> wrote:
>
> On 3/6/2024 2:15 PM, Dmitry Baryshkov wrote:
> > On Tue, 5 Mar 2024 at 18:59, Sriram Dash <quic_sriramd@quicinc.com> wrote:
> >>
> >> Some target systems allow multiple resources to be managed by firmware.
> >> On these targets, tasks related to clocks, regulators, resets, and
> >> interconnects can be delegated to the firmware, while the remaining
> >> responsibilities are handled by Linux.
> >>
> >> The driver is responsible for managing multiple power domains and
> >> linking them to consumers as needed. Incase there is only single
> >> power domain, it is considered to be a standard GDSC hooked on to
> >> the qcom dt node which is read and assigned to device structure
> >> (by genpd framework) before the driver probe even begins.
> >>
> >> This differentiation logic allows the driver to determine whether
> >> device resources are managed by Linux or firmware, ensuring
> >> backward compatibility.
> >>
> >> Furthermore, minor cleanup is performed for the private data of
> >> the SNPS Femto PHY. However, ACPI handling is omitted due to the
> >> absence of clients on the ACPI side.
> >>
> >> Signed-off-by: Sriram Dash <quic_sriramd@quicinc.com>
> >> ---
> >>   drivers/phy/qualcomm/phy-qcom-qmp-usb.c       | 290 ++++++++++++++++++++------
> >>   drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 213 +++++++++++++++----
> >>   drivers/usb/dwc3/dwc3-qcom.c                  | 259 +++++++++++++++++------

[skipped]

> >> @@ -2165,9 +2305,11 @@ static int qmp_usb_probe(struct platform_device *pdev)
> >>           */
> >>          pm_runtime_forbid(dev);
> >>
> >> -       ret = phy_pipe_clk_register(qmp, np);
> >> -       if (ret)
> >> -               goto err_node_put;
> >> +       if (!qmp->fw_managed) {
> >> +               ret = phy_pipe_clk_register(qmp, np);
> >> +               if (ret)
> >> +                       goto err_node_put;
> >
> > pipe_clk is an input to the GCC. If you are not registering it here,
> > how would GCC get it?
> >
>
> The pipe clk will be managed by the firmware.

Which pipe clk? Coming from the PHY to GCC or from GCC back to the PHY?

Anyway, you can not drop this, this will break the ABI. The rule of
thumb: existing DTB files MUST continue to work.

> >> +       }
> >>
> >>          qmp->phy = devm_phy_create(dev, np, &qmp_usb_phy_ops);
> >>          if (IS_ERR(qmp->phy)) {

-- 
With best wishes
Dmitry

