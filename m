Return-Path: <linux-arm-msm+bounces-14715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6FF885768
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 11:26:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C744B1C216C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 10:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF6DF56B68;
	Thu, 21 Mar 2024 10:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kg+5ZZLh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A83200D3
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 10:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711016797; cv=none; b=QLHmlDZsQWEyE0pKLf9p5UuF/q6qWxD598G8R/NpZzm5s32fydpRRrx4dZcOjli1ZTuACEbSWrURdN9k1XcbXQVNlAYcuSFw3vpNs1xZ1nAS4bale/ZYS1pRaOzRfdIAp3ngCxln196vXff8lw4x7LEAGaZf72JI5kZKCq3pbJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711016797; c=relaxed/simple;
	bh=+884RlU/GlvwTUa+q87xsqia51wLJdHzo+MtTS+qfuA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bO/EK0UigOZCqPXBLL0IIlWtsWz7dRML8fIOA4YEK+wlhObm6AIVftSU01wqxwfGvkfxs5knwFiIfnszkk7CnIgsG6HUUzp4HTTSFcCqYuWfO4/z+XkCLJdCEL+KcEZ4Yi8l5RBN296FhDoUBBOmKdVKbLET7QDhX+mTNb6g3ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kg+5ZZLh; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dcc6fc978ddso698784276.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 03:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711016794; x=1711621594; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G1DsQsCfjVXlcreC9mkpHOUXs3G0EDhLcSU9dnMnmlI=;
        b=kg+5ZZLh+doRgTaLkijY08SgBBLjl9YUBJ3oUe9BEryI7Ud81dZkGMzUsR3GI8dIvZ
         Mq/jTO2KhL7ferxBN/HoUIkDXzkjczA1Qzu5+a5+rH+zy/8dNjUPmBHOju8RXLkSuf+G
         J5jBJ4n3ZmbR37wH9pmSu4aqcV6m3ougqSZx8gwPjxEzz0PehxhclKPKUafKBOiku7Yz
         pOEph7nvmuFY15RfYBZCQ8/VO1Hb99KMcFnNFRasyElNltmHdi9Dvi6F1oe1Th5WG+Tr
         EuprPQ7t/Li/2Bn1m3MFDh7pjNzcFZsYkd8jwMkYM3ogqt1WlZ75oihg0vJRv3iNp12N
         Ux+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711016794; x=1711621594;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G1DsQsCfjVXlcreC9mkpHOUXs3G0EDhLcSU9dnMnmlI=;
        b=tsguW23tmPy2yoLvuK5K/Z2SWqsD+LZqCRqMyZjOWqDFBLXkBSvRN8KSJubjppJiSE
         TToxJaKOAi7sya4OpK48kYztU3z1mr2vgQlIFquLyZHmvGUPAJXO1bfZtUZXydcs5mCf
         g2PG7FY7WVNTsjUPlVX+C4kH5rQUxSA+BL4Vz/Cs2TfF2MFTixNxpS9NZLZzfPBd6q1Z
         hef3uBekvfhMg1erchzFuu+0fX7wvZrODJWydTmEARO30+3MIQbf8cdomJ9W4bGNLF0y
         oiomX9lW+IUWLE0NhQvzmnmaY0gn7mr5Gcn3jXD1XNGz0Fs1AKparOcH1pKVGRqEhj9Q
         9mnQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6XWRSaVganKwQ3wOFTAvCecH7c1mA/nP66wSOSP8jDWaybFKqxirGpZJ0wpEmqs7Po559SomjnFZCwM8kdccEuf9ZXbJLRSAV14//pg==
X-Gm-Message-State: AOJu0YwkitZPRbPCPjNqrBrpFT3p1JF54by93tMnZBmMBj9jSGKEtiyn
	mSyfm1lXDFFeU+NbtD1/6BRpH9LsS4lRSZVWRORgrZyy3uePXs4SYabRfO81CoDNlMHpeeTcTHP
	AiSiNLYV0olr1DTXuSMeD6Qv2iKiFyIk+7sgDhw==
X-Google-Smtp-Source: AGHT+IExb+vzGD2UTaSisA7Z8I+voE+Wf1d1MMMQfTeCa1gMgMMvvTYLlKLB30P2jM8a1OlAg5BhSTY31uqzspWQZBA=
X-Received: by 2002:a25:7208:0:b0:dc6:e7f6:254a with SMTP id
 n8-20020a257208000000b00dc6e7f6254amr1505416ybc.8.1711016794255; Thu, 21 Mar
 2024 03:26:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240321092529.13362-1-quic_jkona@quicinc.com> <20240321092529.13362-6-quic_jkona@quicinc.com>
In-Reply-To: <20240321092529.13362-6-quic_jkona@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 21 Mar 2024 12:26:23 +0200
Message-ID: <CAA8EJppoeOgcEoaoAYs0cS9yVTPOOwa7J47GvZ=OHNRZzj69FQ@mail.gmail.com>
Subject: Re: [PATCH V2 RESEND 5/6] clk: qcom: camcc-sm8650: Add SM8650 camera
 clock controller driver
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Mar 2024 at 11:27, Jagadeesh Kona <quic_jkona@quicinc.com> wrote:
>
> Add support for the camera clock controller for camera clients to
> be able to request for camcc clocks on SM8650 platform.
>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/clk/qcom/Kconfig        |    8 +
>  drivers/clk/qcom/Makefile       |    1 +
>  drivers/clk/qcom/camcc-sm8650.c | 3591 +++++++++++++++++++++++++++++++
>  3 files changed, 3600 insertions(+)
>  create mode 100644 drivers/clk/qcom/camcc-sm8650.c
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

