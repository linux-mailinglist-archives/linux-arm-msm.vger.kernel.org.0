Return-Path: <linux-arm-msm+bounces-10883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF8E85308F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 13:34:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6E5A2854AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 12:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31D1F41C6D;
	Tue, 13 Feb 2024 12:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lXNUwAjI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3933EA76
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 12:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707827630; cv=none; b=GoAvNqbcGDTPZal53XjN3sBVO4jpigaO3//vYyoK32KvYWEr2Y7OWJ3kQTaPb2axN4dsEq5YHDnhBwjPE+8QWh7JVvDuOVQaEyRzfRlGdt/FykYvox5WxDdQfyUO0/9EZuMGpYv9rfKikR6IKmTWFCefKy8eIOPC4dCLJaAOSMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707827630; c=relaxed/simple;
	bh=GMDHwwXkzcxHkwk+TqIPYewSVvBe87yCpMtxMdQ82Qg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tbYAWvCKNNRNSdVlVPoll8MbtZMA3WRuUnkH6EphzkJ5egLPP2aUsFQaXQHibmJv2lSJifp2TyKT2XdploChg+7V5DXQZUWo5hDOFYNIO6+hEv72aG/MZEexvKK7mp7XCi1Pbg493bLqRyYMZqHxM/zLf3aNFkLYoiF1dL9BnfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lXNUwAjI; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dcbcea9c261so1358034276.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 04:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707827627; x=1708432427; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fWEmkv1wRlTjtIudMGgJCDXVUaDjTH42e1ec42CHDu4=;
        b=lXNUwAjIdgDd3xRJB/sX8ZfMQ9rdCD3XDM1LoQE1uWszAIDUX1OYMB/DXyCBRcRnI+
         KJNxOIJrVX4PbdJ4su/9pCLbCYaB/CrkQYRu5SR6WA/ea9xPXHWj1GQaKGcO+2ONvLTB
         37pyGYKaKpA66wPxNO5JhrFMqxah6fYySowDNGofkM7/veU8eLXnsj5X9GT/gbvsy1ZQ
         0bjWxnyrEnba8ZuC+frdkdPiKI0/9M+cayMGqRqTRZ9FWsduxX+G1NYG1Xpq8xRhzUhT
         onF1nIabwRHunU8WTMFH6tVVo2ygMTbK+FHhPHamyGtPEMCO9kXKj7IGEA8rMbx33Y4z
         y2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707827627; x=1708432427;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fWEmkv1wRlTjtIudMGgJCDXVUaDjTH42e1ec42CHDu4=;
        b=KH62fiQfH5v4/H6WRSiyXGPFAJesG3eXCJVvxwPBx8VYHw/gO6xeEjxHBMYqSVb1LX
         ZddmWyg1nmgOFY7unzSDu8uwOPJ5VE2JWDlS/z06QjIryfK6o1Q28IiuDsiE39qJ23AF
         c0RMJdJlMhTCAfC6cRYUvb6GPbW1PiNsJZTXXAuIvPAo3qmUo+g4GKhAoSXlKfNcFr5A
         lvS0H5Ii2tusneA9tkMZCiuj9jkWF0tcQNO+XwuzKrGmDdcP+5v0q5O2MXc+XWgZDKMI
         ebIr3+8fDv+NsVYu24ZIg/lSP1JMDOIWjvVkMAKJHDJpkWx5WVJ8fd6E0rYFaY7AKk8/
         vpXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXK1gXJs0eWQlpADy+LNTXlM6s0up7BIRGT0RpXWBSHMGXoLrcbZ6YeKnEYydLpjhAVIGBuxv7F14Etg+sR/rst+sP6cNw7zvQMDpsvfQ==
X-Gm-Message-State: AOJu0Yzuw2GabAQOhH/uu+jKoa8Ro4oTuWXlUGCeahP9HSARp7sQV9FG
	vNNgUvcca7vdR5ZHH1ETziZ4bAZNufvdbcYUSKp0pmd91dDniJ3h+PS8CXGHh/39sTCOWTEfELw
	gQohxkORz/AUfnvMzAlmtKBUiba7ENAgCkvHWVXW1zWvcOyLt
X-Google-Smtp-Source: AGHT+IHvc9k2oWattriqGHpx3El0OYm+dm99rljLfk88Y7yk69L1blCIMgpRIFKSInBvds7wzUxGvswVs2vA6NerpMI=
X-Received: by 2002:a25:7108:0:b0:dcb:f7a0:b031 with SMTP id
 m8-20020a257108000000b00dcbf7a0b031mr2275869ybc.50.1707827627415; Tue, 13 Feb
 2024 04:33:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240210-msm8974-rpmpd-v2-0-595e2ff80ea1@z3ntu.xyz>
In-Reply-To: <20240210-msm8974-rpmpd-v2-0-595e2ff80ea1@z3ntu.xyz>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 13 Feb 2024 13:33:11 +0100
Message-ID: <CAPDyKFrmq4nq2JPQs17z6AyRKY3e6VrMJgjUJJVEhzsf7Off2Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Add RPMPD support for MSM8974
To: Luca Weiss <luca@z3ntu.xyz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephan Gerhold <stephan@gerhold.net>, =?UTF-8?Q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 10 Feb 2024 at 17:39, Luca Weiss <luca@z3ntu.xyz> wrote:
>
> Add driver support for the RPM power domains found on the different
> MSM8974 devices.
>
> Devicetree integration will come at a later point since also some
> mostly remoteproc drivers need to be adjusted.
>
> Also the MX power domains on this SoC seems to work quite a bit
> differently, we'd need to send raw voltages to it, so these are ignored
> in this series.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

Applied for next, thanks!

Note that patch1 is also available at the immutable dt branch, if soc
maintainers need to pull it in too.

Kind regards
Uffe


> ---
> Changes in v2:
> - Drop MSM8974_VDDGFX_AO in all patches
> - Link to v1: https://lore.kernel.org/r/20240210-msm8974-rpmpd-v1-0-de9355e6842a@z3ntu.xyz
>
> ---
> Luca Weiss (3):
>       dt-bindings: power: rpmpd: Add MSM8974 power domains
>       pmdomain: qcom: rpmpd: Add MSM8974+PM8841 power domains
>       pmdomain: qcom: rpmpd: Add MSM8974PRO+PMA8084 power domains
>
>  .../devicetree/bindings/power/qcom,rpmpd.yaml      |  2 +
>  drivers/pmdomain/qcom/rpmpd.c                      | 83 ++++++++++++++++++++++
>  include/dt-bindings/power/qcom-rpmpd.h             |  7 ++
>  3 files changed, 92 insertions(+)
> ---
> base-commit: 6e3fa474051f3d276ea708bdb8e8e1f66d1d3ee5
> change-id: 20240210-msm8974-rpmpd-6e48fe374275
>
> Best regards,
> --
> Luca Weiss <luca@z3ntu.xyz>
>

