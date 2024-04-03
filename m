Return-Path: <linux-arm-msm+bounces-16266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D52F2896E01
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 13:21:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90A41291010
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 11:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AD3014386C;
	Wed,  3 Apr 2024 11:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IyGuMKYC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C661420A5
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Apr 2024 11:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712143298; cv=none; b=plbHPtieSNVk6KeVImz4j0D3pKxxbDcEEY+RrcEgdihmvWQTu2GaT73YdbKMdmDDMdQMDqNixerVERnXPlpQ7jIWFe2/xUjO6ZiR0Uzv/8w3W8KtwW/17R8cNAVAefYvmb8ZbXnXj0IGmoXyYQQYk8406SON986N//7J3qaP+do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712143298; c=relaxed/simple;
	bh=14A2zGvt71HCwM6O6gK42NmYjcKdFxMOyjGXH9M8uaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XndVUvOvVwXIxNH7nZlsQyDHcOZlwsLzPplKOCu6V3J6jO8+ozbhpuYLqQXMSRvgvO4q4JCkcW5uFNAFw7HB+vldSFEr8yUq6nT9p1sPYBB1QQaJonW8+f+/7hlJtIz/dr2bk7SZpgMQ9XrKnRoYraInYhhzpa83hs05tURF7nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IyGuMKYC; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dc745927098so5850175276.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Apr 2024 04:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712143294; x=1712748094; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lF+T4bxnDZj7vHWxhdfHcPO4VDzU3zVkWYi0IqT5ix0=;
        b=IyGuMKYCNcOdj5zfUJMfwLXjQxs/QumlNmkmfT3cw1Til7Omi0PtrwB/QZHbGgMzKX
         SjRMQWV+hxVdIFkbklSq+gOhEywIm0JKTe8lKi4D9AHXowyOd4fuR8/kH3CfFgfJpayj
         LLiUy2+frpgvRV4C8icpjezhPAT5ekYkBpETxXo+4qtTBBTNRkoGBaYQROZYcWRgY1Ay
         ttB+RYBzWxe6OqOVDXQugdOkbNVbp7Tb9R7UKTUXRAKVWdKDn0l3CiDaeTIRoWusCO+L
         hvb8jNJ+ML76ZA4v9mRde7zB7y0WpQ7Y1m05K30IqUjnTXFibl3XWOVpjcW23ipUjuxp
         nZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712143294; x=1712748094;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lF+T4bxnDZj7vHWxhdfHcPO4VDzU3zVkWYi0IqT5ix0=;
        b=D1wBrKM9r/82FhIg185Zjx6hgqKEI7oBwytLHyfKcVyetirfdzqdkW+bT/0Y9hGL+k
         eGPWJHO3xTXFKtZX51w4A7q6fUwZaQO0SqafzGgsXwv0DQbomTCD87Cz3A85NyrvpaNN
         8vjbiubEoyznljpuiBbfRaz+81bc/vL0ZdusfWcUF9e+/pIocLLMOKiAHnlpX8b797I0
         xOkjRm5cVj8l5VzWsMHCLT286tGbzATF3Ms3vXBO7+/tlC56Xq4XTTIq1bCEJ8Z5pQXu
         Gu/qrz44M4tSrF+P/lgXXB6qfy412BzvGU9IDpu2D21ps2pMlHoZlXf5lnm5mObHK0Iw
         5BeA==
X-Forwarded-Encrypted: i=1; AJvYcCV4VvKAEI0j3Z+oKeYWKYZmWZ43gVXKIdfHplgRpTTNaLmBIOIt6u/gekgiSbPfnf5HYFaE9MSVlJGkNh+Q1mpi1BJ9vQJMX3wzgcmY7w==
X-Gm-Message-State: AOJu0YzTAevbzR4clsn/YnzlIOlsAV8o59Y/LphLxs6G4DaVkduew68g
	if57i2croblOJi3ksfzKD0TO6WrIYTeT0O0yYWUCPnHJcXUBR/ssCkJpX8TpLSXFl49/fXMZxkk
	jTVWxJ5vaoxjcpPnd2cePnoK2IucW43bSoMvEYQ==
X-Google-Smtp-Source: AGHT+IFtc7mBgFp3kaw9P5n/Or46d3MjVihrSW5DyRrTli9K6KFjlNUz651nVrW1gUHor3EUrMSY621ZfPcAB6Oktbw=
X-Received: by 2002:a25:b198:0:b0:dcf:56c3:336e with SMTP id
 h24-20020a25b198000000b00dcf56c3336emr13726871ybj.35.1712143294469; Wed, 03
 Apr 2024 04:21:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240328095044.2926125-1-quic_sibis@quicinc.com>
 <20240328095044.2926125-6-quic_sibis@quicinc.com> <Zgvnh0J2a_fBH0bR@bogus>
In-Reply-To: <Zgvnh0J2a_fBH0bR@bogus>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 3 Apr 2024 13:20:58 +0200
Message-ID: <CAPDyKFous+aoopf+=ZRugR78jyekobODqn7tqWRCyirPD+=eYw@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: x1e80100: Enable cpufreq
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Sibi Sankar <quic_sibis@quicinc.com>, cristian.marussi@arm.com, andersson@kernel.org, 
	konrad.dybcio@linaro.org, jassisinghbrar@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	quic_rgottimu@quicinc.com, quic_kshivnan@quicinc.com, conor+dt@kernel.org, 
	quic_gkohli@quicinc.com, quic_nkela@quicinc.com, quic_psodagud@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Apr 2024 at 13:10, Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> On Thu, Mar 28, 2024 at 03:20:44PM +0530, Sibi Sankar wrote:
> > Enable cpufreq on X1E80100 SoCs through the SCMI perf protocol node.
> >
> > Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> > ---
> >  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 27 ++++++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > index 4e0ec859ed61..d1d232cd1f25 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > @@ -68,6 +68,7 @@ CPU0: cpu@0 {
> >                       compatible = "qcom,oryon";
> >                       reg = <0x0 0x0>;
> >                       enable-method = "psci";
> > +                     clocks = <&scmi_dvfs 0>;
> >                       next-level-cache = <&L2_0>;
> >                       power-domains = <&CPU_PD0>;
> >                       power-domain-names = "psci";
>
>
> Any reason why you wouldn't want to use the new genpd based perf controls.
> IIRC it was added based on mainly Qcom platform requirements.
>
> -                     clocks = <&scmi_dvfs 0>;
>                       next-level-cache = <&L2_0>;
> -                     power-domains = <&CPU_PD0>;
> -                     power-domain-names = "psci";
> +                     power-domains = <&CPU_PD0>, <&scmi_dvfs 0>;
> +                     power-domain-names = "psci", "perf";
>
>
> And the associated changes in the scmi dvfs node for cells property.
>
> This change is OK but just wanted to check the reasoning for the choice.

To me, it seems reasonable to move to the new binding with
#power-domain-cells for protocol@13. This becomes more future proof,
as it can then easily be extended to be used beyond CPUs.

That said, I just submitted a patch [1] to update the examples in the
scmi DT doc to use  #power-domain-cells in favor of #clock-cells. I
don't know if there is a better way to promote the new bindings?
Perhaps moving Juno to use this too?

Kind regards
Uffe

[1]
https://lore.kernel.org/all/20240403111106.1110940-1-ulf.hansson@linaro.org/

