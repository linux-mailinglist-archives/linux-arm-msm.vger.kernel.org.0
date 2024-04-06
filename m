Return-Path: <linux-arm-msm+bounces-16638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 327FC89AB64
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Apr 2024 16:40:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD053B21CB5
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Apr 2024 14:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE87F20314;
	Sat,  6 Apr 2024 14:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="krTATqmP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329421E4B1
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Apr 2024 14:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712414416; cv=none; b=ufeB+Lr7sqO9zXrKF0v0POb4eZdx5eWwVg1smtMlLhwVyHluxnBXTDwvyoBiB/it/9plVjTPi88CUbUUHneOEyhk3L5VZlq3xvI7ooh5X6UnFur7HPLTIp2iK5CRGxz6NzuSffzzTktp9Rh9CDGYbPqZj1abbpiunNkFu32XEE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712414416; c=relaxed/simple;
	bh=CcxHNkjEoTPBe+t4JyilkjceY1L6THn0B6VroagQ48A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cMO1DYbCgdI0uwqvRp0Fa1awW1D/7KwT7CLwIMzVT48TTBQaQhKSxNKieGyNa3wmS+T7pFUiPFKvKZrwZ4IPRNpA/veQy/Yv4+1sv1Pgkyi25hIjmg0Av4gSqEuVg7CWIZ+Wr5OScZecM4BLwaApGbJAFlMnwBMUovLJT5/n1mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=krTATqmP; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dcbcea9c261so3348508276.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Apr 2024 07:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712414414; x=1713019214; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RJZ+wW1F0Udf2WYtlYShrGEiUXEZlJBVlEyGRMWnHC8=;
        b=krTATqmPVcekRjdTdJBVv/EosiLP/Ep1qM/+uYACGWZyADEDQL6OeywNgbCMy0t41l
         J3Pr54s9mE55eTg6M3rzFaYuW9CWToXar4E8nnq3WMGjAYR/609QbndQa8xR6p3tTpj+
         XR7mFnz6aDQQWae+7XRWiXkcqgktnzfRRuy5tr+weyZrX+uMQuZsA5Wyfm5Gw11Aulp5
         hwytowRGy92j3F3FU/YN2RpDFQko3TQlcWvG+43/27GdZneArlayLFSHNLAE2wfqv+wb
         YK9FpIC/zq960qxGg9YJHyJhvifjB9O5n42NtxlXmL617kw1k8Ew2i2Ku+scgedVVhLn
         zgLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712414414; x=1713019214;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RJZ+wW1F0Udf2WYtlYShrGEiUXEZlJBVlEyGRMWnHC8=;
        b=ZmiX9NFygZ2iYT9skhAq0ug00oAXObsH+Ub3i5cqbul29I0TRWAywefTIdM5CoH4zW
         X0SjDpu8pweoeLObRUx5kQ3uqzsXeSFzRa9heCLPES+3yZyNmtsBpNURy0Bo0N1MAqf8
         0ZaIS6KleY7K+ke7sXka7fI4LscbaylavVNjC5jxueSJr6jARAqa4dhqYRwb28jIcn05
         g23PXMFR5GNxP65fKpktVKKtO8dnB7t8KR4YIgdCjTnHlBBEZrkIzLxaTwaHqk6IYJFi
         SSSyYhpK0cWYVw/Db/bagNcyoJ7lmEl98xLtdxKt9rTDQFREm+4LbJDENdbXHtI8vEdG
         rULg==
X-Forwarded-Encrypted: i=1; AJvYcCXNkJiFBb9eYzu07KduA12XXhASi6+5JNbPwx3zpRpiILEX5+wTNV2BlUcQrkihAPZhpI375BSMNuMwivS1o+CANcUXov7pBFg0M8Rlug==
X-Gm-Message-State: AOJu0YzLuVWQabZQIz4DBB5Y4qAIrDLjLHaR6J6NjjWxQlXmZLbjlNjh
	GhOdGEnxuG6EJcWnv0W6QkekrzIgpwNuwrcYo0idzRFh8ZolcT0slsuO5J05Od+DBaRs9cMzcpI
	Xv5Xt8hjSkfuR3FIsVR9A48FeFdSoPO41UsaaiA==
X-Google-Smtp-Source: AGHT+IHHKJBvpms8GyKJP3zvG/nih1HHOJPLUjfhe7C8wwi+ufj1fM/ahAT8qyaXumJtQ9xSI13siiwrE40dsyyY+ww=
X-Received: by 2002:a25:ae5d:0:b0:dd9:2a6a:3bcc with SMTP id
 g29-20020a25ae5d000000b00dd92a6a3bccmr3754646ybe.28.1712414414202; Sat, 06
 Apr 2024 07:40:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240406-phy-qcom-m31-regulator-fix-v2-1-c8e9795bc071@gmail.com>
In-Reply-To: <20240406-phy-qcom-m31-regulator-fix-v2-1-c8e9795bc071@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 6 Apr 2024 17:40:03 +0300
Message-ID: <CAA8EJpoENH_4Rp38R8igf72fc3j=qAfVNOh5Qjr0y7_tmsyrAQ@mail.gmail.com>
Subject: Re: [PATCH v2] phy: qcom: m31: match requested regulator name with dt schema
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Sricharan Ramabadhran <quic_srichara@quicinc.com>, Varadarajan Narayanan <quic_varada@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 6 Apr 2024 at 16:37, Gabor Juhos <j4g8y7@gmail.com> wrote:
>
> According to the 'qcom,ipq5332-usb-hsphy.yaml' schema, the 5V
> supply regulator must be defined via the 'vdd-supply' property.
> The driver however requests for the 'vdda-phy' regulator which
> results in the following message when the driver is probed on
> a IPQ5018 based board with a device tree matching to the schema:
>
>   qcom-m31usb-phy 5b000.phy: supply vdda-phy not found, using dummy regulator
>   qcom-m31usb-phy 5b000.phy: Registered M31 USB phy
>
> This means that the regulator specified in the device tree never
> gets enabled.
>
> Change the driver to use the 'vdd' name for the regulator as per
> defined in the schema in order to ensure that the corresponding
> regulator gets enabled.
>
> Fixes: 08e49af50701 ("phy: qcom: Introduce M31 USB PHY driver")
> Reviewed-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

