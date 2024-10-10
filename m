Return-Path: <linux-arm-msm+bounces-33845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F350F99843A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 12:55:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 279451C20B47
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 10:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F6E71C2300;
	Thu, 10 Oct 2024 10:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xXQPah5z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9141BF324
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 10:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728557726; cv=none; b=tp/HTrlIdy8M/J/byO/b4cPJZCRTujQKTg6/MvfRIxOnDhMSOi370N+XJizka2XgX3ChOtvf0Ojh5wKmOJuR40geuwa8CQ7oHYwGj/z1GgaXj9RxLZGXobzNzUD7X7DjfyJWz15M/HEDvQZc9EMpPjBye94e+NaVoLqmp3f92pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728557726; c=relaxed/simple;
	bh=WwiIGmhyGOdZon8LAJcoEDUYGTqw+cL2/HmhFVSNbQ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nfWavURJV8mmvyLBIDzqHVCiSBuLpz8sgcSrnHHYbeyjM7IlwwuQom4F9b9FAT8SFHfv97HDSsM5dMnil01HUEd5CbkBukTAddXTCJ37Hv4+E/K8f44muFM/FEjhTNKU6kpPYnvG70tPoKDrVwx2jYH+FFALX1Vd5sCj+9kqv2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xXQPah5z; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6dbb24ee2ebso9129767b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 03:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728557722; x=1729162522; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7VGs/fU4SpegpQzbG2AYNWcbAGbbD3orYU7SBex+GqM=;
        b=xXQPah5zkZ3pXMjl1jQjwPztSHx6T/n0fnHKw3PEHMU2/uREicaX8QP99Z9vczKgiC
         CmZxMVVZEAMQqQ9jWOZ18X8q9+MGrh/Tax/NdrWjF/aHoFralMo6V7Qbd9PW6LVO5y2x
         RjeZSg7DikOCLKuqginmSrXOSkD/e9q4s4Bgya7889BdyjBJoO6EGaCigkyEErKmFsvV
         CKQZd6e0QfQN+OQbBRgE6mRNNPiElJVYGmZO/7+J5O1cpn6iozzDsUn5PUB2v1go5wtT
         +Eya94CbMX8TxpsojZo2atXjVUo2Dh0AcW+9zhGf4ZGpv+DHAfwcoYI8hFiRGHxLTK+W
         QE7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728557722; x=1729162522;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7VGs/fU4SpegpQzbG2AYNWcbAGbbD3orYU7SBex+GqM=;
        b=Oam3kk60t0yQEcdL6+325yucSL/7DgC5X6sahCXikCsmA8/VbtOAecjlwYnqaYHQgB
         Hg/jRAgXEbATxVJCTdcqeajc3lXP/Z3+I1hBNcDjeYlcnWY8MDOCTFPLiJxHxpBipvlU
         ZrOY0mZaJiAxk8Dv8nuNQ/fztbJ8440oTvkqqbX5MIcJp2bvyxKp8i+E4apfyomcQIyr
         7ov4J6IzVT8Bxl6kYkkDeqz2lHBPnhpZHaUikiwoeb8SUPWKsJTxE44W3irH4gBal3ph
         3nowkxIHJQ64zZTngSUZQMVoarDx9646un4w4PNMCeHt3nyHM2E00rGH5We6gWX1sY+R
         OWwg==
X-Forwarded-Encrypted: i=1; AJvYcCXo4742CMg5gEgL3zo7ipNJ01BQ0TN1I9fjCQhDLinHW7qOFjx5JGacdzpPi88DFPI+7p53t86TSUMzM0IH@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5UjcgV7oJoY/3JGOEekfjL+SDA9FwzCFIVS09Rguj2Ifwi55B
	nWasDxAaOtvjnfGAzcD5ns11YszdJJ2R3cxYUv6RWsr/9q7EzxBq3MRmpVs6QcEqhNwZEAjG48w
	51eMP3mYnH9yEI6CBNnBdRL6MV99XLKEbDFRuYw==
X-Google-Smtp-Source: AGHT+IG1+R1ihC/1zJ5/CzYx7qkYB8pOlHdDW4xPGn5q3The6Ty0NU52LviZm5BHoiKxIMgoBbp/st/dwycsc6TdX98=
X-Received: by 2002:a05:690c:298:b0:6e3:36fd:d985 with SMTP id
 00721157ae682-6e336fdd9eamr4919897b3.23.1728557722397; Thu, 10 Oct 2024
 03:55:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241010074246.15725-1-johan+linaro@kernel.org>
 <CAA8EJpoiu2hwKWGMTeA=Kr+ZaPL=JJFq1qQOJhUnYz6-uTmHWw@mail.gmail.com> <ZweoZwz73GaVlnLB@hovoldconsulting.com>
In-Reply-To: <ZweoZwz73GaVlnLB@hovoldconsulting.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 10 Oct 2024 13:55:11 +0300
Message-ID: <CAA8EJprg0ip=ejFOzBe3iisKHX14w0BnAQUDPqzuPRX6d8fvRA@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: mark pd-mapper as broken
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Chris Lew <quic_clew@quicinc.com>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Oct 2024 at 13:11, Johan Hovold <johan@kernel.org> wrote:
>
> On Thu, Oct 10, 2024 at 12:55:48PM +0300, Dmitry Baryshkov wrote:
> > On Thu, 10 Oct 2024 at 10:44, Johan Hovold <johan+linaro@kernel.org> wrote:
> > >
> > > When using the in-kernel pd-mapper on x1e80100, client drivers often
> > > fail to communicate with the firmware during boot, which specifically
> > > breaks battery and USB-C altmode notifications. This has been observed
> > > to happen on almost every second boot (41%) but likely depends on probe
> > > order:
> > >
> > >     pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to send altmode request: 0x10 (-125)
> > >     pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to request altmode notifications: -125
> > >
> > >     ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: failed to send UCSI read request: -125
> > >
> > >     qcom_battmgr.pmic_glink_power_supply pmic_glink.power-supply.0: failed to request power notifications
> > >
> > > In the same setup audio also fails to probe albeit much more rarely:
> > >
> > >     PDR: avs/audio get domain list txn wait failed: -110
> > >     PDR: service lookup for avs/audio failed: -110
> > >
> > > Chris Lew has provided an analysis and is working on a fix for the
> > > ECANCELED (125) errors, but it is not yet clear whether this will also
> > > address the audio regression.
> > >
> > > Even if this was first observed on x1e80100 there is currently no reason
> > > to believe that these issues are specific to that platform.
> > >
> > > Disable the in-kernel pd-mapper for now, and make sure to backport this
> > > to stable to prevent users and distros from migrating away from the
> > > user-space service.
> > >
> > > Fixes: 1ebcde047c54 ("soc: qcom: add pd-mapper implementation")
> > > Cc: stable@vger.kernel.org      # 6.11
> > > Link: https://lore.kernel.org/lkml/Zqet8iInnDhnxkT9@hovoldconsulting.com/
> > > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> >
> > Please don't break what is working. pd_mapper is working on all
> > previous platforms. I suggest reverting commit bd6db1f1486e ("soc:
> > qcom: pd_mapper: Add X1E80100") instead.
>
> As I tried to explain in the commit message, there is currently nothing
> indicating that these issues are specific to x1e80100 (even if you may
> not hit them in your setup depending on things like probe order).

I have the understanding that the issues are related to the ADSP
switching the firmware on the fly, which is only used on X1E8.

>
> Let's disable it until the underlying bugs have been addressed.
>
> Johan



-- 
With best wishes
Dmitry

