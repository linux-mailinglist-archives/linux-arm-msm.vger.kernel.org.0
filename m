Return-Path: <linux-arm-msm+bounces-11936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3128785CADC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 23:40:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5D2B1F2294A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 22:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CA7515443C;
	Tue, 20 Feb 2024 22:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AJ8roU4E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F8D15442F
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 22:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708468846; cv=none; b=QWIibkpEriRT0o8C5cRJloy6Bhi/umgw9CCSORtCFvw898U33cpEu3LvJjP9F5X/NUGQEA3Qyg3D/HugDUqvR9+w/ra4C1cRG7ICQTtO3H777XWkv6QDkj0X+HzejI6sU4IADfDlvANL0Eq1EUBkcC68sCgxg0SgnvL/59Wo5lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708468846; c=relaxed/simple;
	bh=qqa0KvriwB1v8Bj7pTBYPvZ+DPDnOmT8Yxi6uMiKXwY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qB+SpJehC7M1Pzem5u0yi5DNq6bXCBPJeGflpojWSJEbmFNA54ROhZnYGl/5grSpx73Y+Y0gV0pU33m4Uu7v5E4ANOK+zdrkKawd/58HUdfOAt5lekX3yLAqqkSziYauuUkTRfIow8mY0IK3L1WtTJjNvZyQmBxw0VAdoQ6ngko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AJ8roU4E; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-607f94d0b7cso49932637b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 14:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708468843; x=1709073643; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MmwuqZ+SRwcH0WhEWSC1fUHglZZfWWDUa+m2OJY8rik=;
        b=AJ8roU4EID6WpClvCwPxjcgXaCaWQnxpcmKDB4L147zDSKMdn1ItToPD/hISY1rbt5
         FTulxBHFMkmZu24v6Sw1IyLFvNF1f2xDxw18vhiKeH6XtxPjzhSKCKbAnGckJvEB3Xfi
         1SWD2XrbZXptZKcgZpMOePkmu9F2jt0hqEk3uFyVtTxpwAOE8j4YQ1YK/y+DPjC0A7Z8
         PesWtTZ0yN5RU+bh86bpOyAZhKqdUuQiPIt5eBoSf5uYloDe7wxribjFCZlW6VboXnxD
         37BCx1kjTZsolU3WLawjuchbt144tpbCK41upSk9vS/nsInw6bXxn8TNURj3Hga2b2i+
         myLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708468843; x=1709073643;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MmwuqZ+SRwcH0WhEWSC1fUHglZZfWWDUa+m2OJY8rik=;
        b=O5y2fl25gOXtFEfnBItHGgLH/DzcGWao1hTx7V8ZuE6bvvKuZgxHGyM3TkqmDSZJ6x
         6GuGV9jzEjY0WKyvcO2+0L0+lnLhS+bklbcwH3etsRmHRbthsMrplwVbs3G345xjbWQ6
         BSx9ltfITKbqU4k1tzkBt8XebMXdaDOAPCnN/C0bE1Bc2nCdvTL+s1HXWTSgykAHgEJo
         nFeaauESWAsLKvTntfwmH/DV7kr3kQvzKQKdie5jKc5/KIcytozz+mlTUW3Fakbjbsgy
         L9H4N3odLgIcvMbAZ4tmBhcgKVN3OqzQTA/67uxNLQqBUnPBNnK2JJDljsUhoOA/ooc2
         AmNg==
X-Gm-Message-State: AOJu0YwiZc5BhmYQlGfv3fDE58gd81rTOxTM6Bqqoa/QKP0i0HBKEz3r
	DomJrVxUgZZrBTG2Wnxqs4LtS3vYFa1FMlbPA2Z7oIS2M5hQIWrp689eKgj5FPPYybf4V26eur4
	iMON+xz6durOCSgWOz+e+CnLnIaPy6k2XipRRDw==
X-Google-Smtp-Source: AGHT+IECKOxvwNIHjH+q3UCKrD0cIZc/Wky7bvQz0uKvXaoNUSqNSg4CHepJRR3O8AFfyFDZjhCR5X9cScX1yRPWYQg=
X-Received: by 2002:a81:b71b:0:b0:604:3ee2:f258 with SMTP id
 v27-20020a81b71b000000b006043ee2f258mr15118384ywh.45.1708468843468; Tue, 20
 Feb 2024 14:40:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240202-pm4125-typec-v2-0-12771d85700d@linaro.org>
In-Reply-To: <20240202-pm4125-typec-v2-0-12771d85700d@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 21 Feb 2024 00:40:32 +0200
Message-ID: <CAA8EJpoUHi8FDAKa+LO+2t7fXxXaFYhXAJzkUUPs_uJH9pvZWw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] arm64: dts: qcom: qrb2210-rb1: enable Type-C support
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-usb@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 2 Feb 2024 at 01:55, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Reuse Type-C support implemented for the PMI632 PMIC (found on Qualcomm
> Robotics RB2 platform) and implement Type-C handling for the Qualcomm
> Robotics RB1 platform.
>
> Dependencies: [1]
>
> [1] https://lore.kernel.org/linux-arm-msm/20240130-pmi632-typec-v3-0-b05fe44f0a51@linaro.org/
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v2:
> - Removed unnecessary conditional expansion, covered by existing compat
>   string (Krzysztof)
> - Link to v1: https://lore.kernel.org/r/20240130-pm4125-typec-v1-0-e8d0097e2991@linaro.org
>
> ---
> Dmitry Baryshkov (4):
>       dt-bindings: regulator: qcom,usb-vbus-regulator: add support for PM4125
>       dt-bindings: usb: qcom,pmic-typec: add support for the PM4125 block
>       arm64: dts: qcom: pm4125: define USB-C related blocks
>       arm64: dts: qcom: qrb2210-rb1: enable USB-C port handling

Mark, Greg, granted that the dependency has landed, could you please
pick up patches 1 and 2 correspondingly.



-- 
With best wishes
Dmitry

