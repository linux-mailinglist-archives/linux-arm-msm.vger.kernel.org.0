Return-Path: <linux-arm-msm+bounces-29182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AC195977F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 12:09:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64A8A1F211ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 10:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01F4D1B5EAB;
	Wed, 21 Aug 2024 08:33:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476491ACE12;
	Wed, 21 Aug 2024 08:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724229207; cv=none; b=njIl4COATwRK+blV8/E7VPGYcRY+Z9GVFBLY6q6OE3JdWkVIsvUS9msWQhwlRjOYNUU8g39QMrIKN4CysWxvFEv2Looj1I3NXRtks7+SlSAWB37ZQ5dOT/5Gvrux5G++hcC+ELw7Gv8TGmXgn1EzbRTuHP9s4bJRfF5FUeOsMj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724229207; c=relaxed/simple;
	bh=bPsU7ZXJDVjEN0/X77OOy5U+xlpyZ0HoOyMDMarI9IU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PoVDt6vK/U5fBB7gIhUTi4LvzOFVc7sNlqMDo1rV0ov3Z5SE0OW9MzLXPI1Yr9cTKEDK0tQSV5tsPvH98OqPxqTioBImA92J/h7J/MmjH5tWP7mPf9dO9N+kRztL+Gm3ObgobDI6XANql4fx4NhQUhTs8wF4Rzl5ZcIyeP9OFdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-428e0d184b4so49539175e9.2;
        Wed, 21 Aug 2024 01:33:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724229203; x=1724834003;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shNn0P28pz/AiG6lziQ1M6jTDXawzKEkDhjq3toOIpg=;
        b=MCuhr+3sx5kX0tGaFsD78qT+uStXW5wJSRle5VRfq6gLeQ7dGi8Ukv0YHOJKblEYnM
         MRm5x1tEN0FDJKHwyfQPaybFv6QJz3rdXAmfuAAk0CncFLU/quIhFuc32bRe7abyqNqf
         Cuc4E8IcKSM6FvH5NSt+YNg5Fl+JFWrIZktP5thewPZVxTKGbM93HWHzIIUQr/bkEdKj
         RHHElvvFugR14r+lcli0xpCwyk8ar/wApIxMvZrfSvQAUzMRG2A3TW29Zy2zhNqbLr+0
         ELJJMfmwL1Ls8md6onC1jj/LroTGSCvN35VaVV2FWADggizlg/coBNZQGyIqlMNJu5Mh
         AaYg==
X-Forwarded-Encrypted: i=1; AJvYcCUsL1KjGy0VQy+O/O6EMoskkXqfZFNuoqThcfXcy7P+irOv4/DDqqgrilubXEm6tLNGlzU0w7bFlNDvkkMInQ==@vger.kernel.org, AJvYcCW2xj9xY4sZF3kSH9I2cKtlJCR+eLGsvphjYWZyIpoexYFRXb+4PG/qnB+zsCFELk3zz4jKCoRef+lI@vger.kernel.org, AJvYcCW5NlsAdtpg3Bxv9mafmSczc/p3eE7ZbbwUz4hZRD7w2fafScEH2cI6x5QD7Yz3dggxC+Qn8qoVRP/D@vger.kernel.org, AJvYcCXIVnvEDFIG3XoKDhJOXL/37ETbE5i8el6vDcA0rFOxPxJJvAjEz5i+7Qgu5WKK4GQ0bsoTRV9vh7vQHpBv@vger.kernel.org
X-Gm-Message-State: AOJu0YxM0smzE5ZVmntnAqVV2MaCYD/4h+/vO+UUl7OTTcRAHJOneqXT
	pxORq5/DbHN2zpWJ7kl0wCNmPff+flEJOOS1bKFDWYErNqv18PEN
X-Google-Smtp-Source: AGHT+IH95BHoxJWhlM+gqtaeqzWmQeH2LSFfrrv8VetEKIZZY+2KaVtVEDMpDLODC9IfPV8Nto/yEw==
X-Received: by 2002:a05:600c:45cd:b0:425:649b:60e8 with SMTP id 5b1f17b1804b1-42abd21c8fbmr12936265e9.18.1724229203128;
        Wed, 21 Aug 2024 01:33:23 -0700 (PDT)
Received: from krzk-bin ([178.197.215.209])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42abed8b91dsm17368495e9.10.2024.08.21.01.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 01:33:22 -0700 (PDT)
Date: Wed, 21 Aug 2024 10:33:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com, quic_suruchia@quicinc.com, 
	quic_pavir@quicinc.com, quic_linchen@quicinc.com, quic_leiwei@quicinc.com, 
	bartosz.golaszewski@linaro.org, srinivas.kandagatla@linaro.org
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: qcom: Add CMN PLL clock
 controller for IPQ SoC
Message-ID: <krbpzjccn6xvnpfsa7eeeowmtjuuw4yp72qqqbeq2icxrqvdo4@x6pawrcctyd3>
References: <20240820-qcom_ipq_cmnpll-v2-0-b000dd335280@quicinc.com>
 <20240820-qcom_ipq_cmnpll-v2-1-b000dd335280@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240820-qcom_ipq_cmnpll-v2-1-b000dd335280@quicinc.com>

On Tue, Aug 20, 2024 at 10:02:42PM +0800, Luo Jie wrote:
> The CMN PLL controller provides clocks to networking hardware blocks
> on Qualcomm IPQ9574 SoC. It receives input clock from the on-chip Wi-Fi,
> and produces output clocks at fixed rates. These output rates are
> predetermined, and are unrelated to the input clock rate. The output
> clocks are supplied to the Ethernet hardware such as PPE (packet
> process engine) and the externally connected switch or PHY device.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---
>  .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       | 70 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,ipq-cmn-pll.h       | 15 +++++
>  2 files changed, 85 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
> new file mode 100644
> index 000000000000..7ad04b58a698
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,ipq9574-cmn-pll.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm CMN PLL Clock Controller on IPQ SoC
> +
> +maintainers:
> +  - Bjorn Andersson <andersson@kernel.org>
> +  - Luo Jie <quic_luoj@quicinc.com>
> +
> +description:
> +  The CMN PLL clock controller expects a reference input clock.

You did not explain what is CMN. Is this some sort of acronym?

Best regards,
Krzysztof


