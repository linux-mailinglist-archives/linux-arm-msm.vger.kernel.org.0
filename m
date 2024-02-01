Return-Path: <linux-arm-msm+bounces-9290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB22845006
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Feb 2024 05:04:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D57D28780D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Feb 2024 04:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DE593B7A9;
	Thu,  1 Feb 2024 04:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b="pMYWn59+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3663B293
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Feb 2024 04:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706760272; cv=none; b=BDxSxlBpNZ+BQ7ln9a9Q1iVL2dQkuujowHaeqba4yIZ7qKB9AN957bWjx6QAMwPCoNMsSkUQdd0Q9ECN8+C8zm2D4oRpOvZyANHa0MK+gkCjkUJrAIjzcAxjHSRDBcyd0Sw+v6H4SwZPnzxpqTCSWUR1u3nUoe1w9wRFhqAEJ0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706760272; c=relaxed/simple;
	bh=U+z/Gzi2e8oSaSkN5Mf9nf9eVZKujMwhE9OLgovc7bM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R//JiRRLtve4VdKNB8dtQSd+LYCaDA8AhJ54VZRp2BL+/g6dBf3CkfGiwJLZlR63f9FIaoJTiU9o2sy6tY60bmYdBVcqXHTt37Si2X8MFH5kWn6Ne8xHf5rnIVCBt2lgJMgonxb7+FyjaShtLr7Wj/acqhr7QTCj6j1l9WcB6K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org; spf=pass smtp.mailfrom=kali.org; dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b=pMYWn59+; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kali.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5113000a426so122097e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jan 2024 20:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google; t=1706760268; x=1707365068; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1pCpqVMhWzU3nLiNxALZDbTH3+vNR66xyNLLKO0v8w=;
        b=pMYWn59+cHhsWgr23hYLZ+Mp1Er1uJdeAOsf2u6UaBEWvrra4HjgjJMG/0DuZTnFCq
         jdizSoHWrB4oHAK0jBV/Ci1fD1d6xnD8jZLAVPkxukQA3l0omqddNVBPxKIcjowloqgP
         0QO4vhtJ1305mJ+lcm5Ptuv94fgplSu3nhAKsXV2iJnhYE/PfiPy9hilN3vuAzXrFgqr
         Cl4nuzNDS1CBhR7n5ZVFeu6PywrAWdPczJ165tTU3uF1RWtNOn8HVzjyM12uQIHce3Nk
         5hBTDCkBMRO2Vc/nWMYqbNOgs07ZFvxRsN+P0oazYfmj6MISAMkYJCSzd+N56cZXfGE1
         1EWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706760268; x=1707365068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g1pCpqVMhWzU3nLiNxALZDbTH3+vNR66xyNLLKO0v8w=;
        b=YDO3FKX8uAis91VOPkkeyQ1rtbQuLi+LPSP2aKVSACLXs+nwDmcGuFRiFOPptFTwPu
         xO3U5RQy2ir4gWHBkA3C91QiLXH+HOHvvjhplSMeAyC/fnkoh/eS1AwUIpowbPqsH5rz
         DrOeGKvQ0HtADSv7OtDJsUalE5ty4F/2p2qDdNjivWazYWwHucNi5fpVjyq/jOy/k/Y0
         KE+bpOiHheNzTCXW9muRnBj6NoEnqNw4Cm3M+8GhIwKkSTcXYcR7MSzoFPEvpASc9bfu
         KthfY8VxKqHXOaPuqswpi63NahOAI34M02Spzy7jCCJ3Y1YOzqjK78DyvZ88uqcLTqJR
         bqxw==
X-Gm-Message-State: AOJu0YwuQUsnxYmawPQYwvWWYXEQixeRhFbKoWf+IlTpzBgwDDDlglRh
	cvV3/0BB5W6l37+M/tQ+rPp8eykb/UIwUHIYN5zZvkkZRavOLuCxwzHkqsd2v9GtG+6BDTTF28R
	HP45mo+msnSfsRJtDRqWPEeQ5skOj6LvbkM71dw==
X-Google-Smtp-Source: AGHT+IFe5H/phU7lMtzKlpQzEnleJByHGXLacQC79IKXkfpOvLnNeg3HBnc/RI/6OD+znY9scOVD1GK6dfOsLTNVxEI=
X-Received: by 2002:a05:651c:1cf:b0:2d0:6fe8:bb2a with SMTP id
 d15-20020a05651c01cf00b002d06fe8bb2amr2054277ljn.32.1706760267723; Wed, 31
 Jan 2024 20:04:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240131-x13s-touchscreen-v4-0-39c0f9925d3c@quicinc.com>
In-Reply-To: <20240131-x13s-touchscreen-v4-0-39c0f9925d3c@quicinc.com>
From: Steev Klimaszewski <steev@kali.org>
Date: Wed, 31 Jan 2024 22:04:16 -0600
Message-ID: <CAKXuJqh0Js8t6YHLOOj8p6YQgKAAfchVLXfFWotVVR_H8bFsbA@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] arm64: dts: qcom: sc8280xp-x13s: Enable touchscreen
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, Jiri Kosina <jikos@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh@kernel.org>, 
	Daniel Thompson <daniel.thompson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 31, 2024 at 9:07=E2=80=AFPM Bjorn Andersson
<quic_bjorande@quicinc.com> wrote:
>
> This documents and defines the necessary properties for the I2C
> HID-based touchscreen found in some SKUs of the Lenovo Thinkpad X13s to
> work.
>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
> Changes in v4:
> - Introduced the patch in the HID driver removing the comment about the
> need to update the binding.
> - Link to v3: https://lore.kernel.org/r/20240129-x13s-touchscreen-v3-0-c4=
a933034145@quicinc.com
>
> Changes in v3:
> - Rewrote the commit message, to properly describe the problem being
>   resolved.
> - Link to v2: https://lore.kernel.org/r/20240126-x13s-touchscreen-v2-0-53=
74ccc9e10d@quicinc.com
>
> Changes in v2:
> - Dropped output-high from &ts0_default, to avoid bouncing the reset
>   line unnecessarily
> - Link to v1: https://lore.kernel.org/r/20240125-x13s-touchscreen-v1-0-ab=
8c882def9c@quicinc.com
>
> ---
> Bjorn Andersson (3):
>       dt-bindings: HID: i2c-hid: Document reset-related properties
>       HID: i2c-hid-of: Remove comment about post-reset in DT binding
>       arm64: dts: qcom: sc8280xp-x13s: Fix/enable touchscreen
>
>  Documentation/devicetree/bindings/input/hid-over-i2c.yaml  | 6 ++++++
>  arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 7 +++++--
>  drivers/hid/i2c-hid/i2c-hid-of.c                           | 5 -----
>  3 files changed, 11 insertions(+), 7 deletions(-)
> ---
> base-commit: 8bf1262c53f50fa91fe15d01e5ef5629db55313c
> change-id: 20240125-x13s-touchscreen-48012ff3c24e
>
> Best regards,
> --
> Bjorn Andersson <quic_bjorande@quicinc.com>
>
>
Thank you for this work!

Works great on my Thinkpad X13s
Tested-by: Steev Klimaszewski <steev@kali.org>

