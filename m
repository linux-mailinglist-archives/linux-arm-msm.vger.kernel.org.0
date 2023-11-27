Return-Path: <linux-arm-msm+bounces-2166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 731057FAD98
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 23:37:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27C35281B94
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 22:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C8843C6B9;
	Mon, 27 Nov 2023 22:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AFA1A5;
	Mon, 27 Nov 2023 14:37:02 -0800 (PST)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3b8382b8f5aso3044049b6e.0;
        Mon, 27 Nov 2023 14:37:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701124621; x=1701729421;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PuP/BIBy04vLBcoBGVqhGTXN9mmV1eIZYFN8vss7cQg=;
        b=A+lFa78Pym1Yhid5NTeaNc3CvCf5pmIVgjVnBkKoUVGRvjxc9Z4+SeCwrwsih0ccOi
         xRh8JT0iQ5SE2vy1OL3eKmJGziVjZ0b8a1RtcsdsZCo8YxCEmhkZJ+ZEVgX1V7PLeYhr
         CRRKM0pxc7H2/IKMd/i/mIX1tw014yu1iHG2BRuEaKW4XYrj+3kn0DmFds8cKLqknZ2T
         Pwqjl74qrsyylprcMOxKlM9EEO1k9iA/sDwHL/eO++KaloKsilNxIwKdMSRpzu7RlakV
         Pq2bgY/qEs5GiCtpzWgTqXRz4R7K85oqA/W4I9dcKvsPDqsCXmmOyu4WQiMSQussurl/
         2ksw==
X-Gm-Message-State: AOJu0YwXPVPEMA8He+aCQ/Oj6iru0sGZzkYFkB9ZcRLGlLUGjyHEPwz7
	lXr9FqEJLFLlFUIAf1DCjw==
X-Google-Smtp-Source: AGHT+IHnBoOuhgYs4OuZFTxhqfLVnkGsU3Xz25XMs+5zcX/cSJDESCt0UIwuoRDE3kSUCtKtw4b/eA==
X-Received: by 2002:a05:6808:6493:b0:3b8:42e2:6004 with SMTP id fh19-20020a056808649300b003b842e26004mr19430047oib.42.1701124621210;
        Mon, 27 Nov 2023 14:37:01 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id e13-20020a056808148d00b003b85cc30fe8sm980458oiw.36.2023.11.27.14.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 14:37:00 -0800 (PST)
Received: (nullmailer pid 167239 invoked by uid 1000);
	Mon, 27 Nov 2023 22:36:59 -0000
Date: Mon, 27 Nov 2023 16:36:59 -0600
From: Rob Herring <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Robert Marko <robert.marko@sartura.hr>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [net-next PATCH RFC v3 5/8] dt-bindings: net: add QCA807x PHY
 defines
Message-ID: <20231127223659.GA152280-robh@kernel.org>
References: <20231126015346.25208-1-ansuelsmth@gmail.com>
 <20231126015346.25208-6-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231126015346.25208-6-ansuelsmth@gmail.com>

On Sun, Nov 26, 2023 at 02:53:43AM +0100, Christian Marangi wrote:
> From: Robert Marko <robert.marko@sartura.hr>
> 
> Add DT bindings defined for Qualcomm QCA807x PHY series related to
> calibration and DAC settings.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  include/dt-bindings/net/qcom-qca807x.h | 30 ++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 include/dt-bindings/net/qcom-qca807x.h

How is this used? There's nothing in the binding about it. Binding 
headers go with the binding schema that define how they are used.

> 
> diff --git a/include/dt-bindings/net/qcom-qca807x.h b/include/dt-bindings/net/qcom-qca807x.h
> new file mode 100644
> index 000000000000..e7d4d09b7dd4
> --- /dev/null
> +++ b/include/dt-bindings/net/qcom-qca807x.h
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
> +/*
> + * Device Tree constants for the Qualcomm QCA807X PHYs
> + */
> +
> +#ifndef _DT_BINDINGS_QCOM_QCA807X_H
> +#define _DT_BINDINGS_QCOM_QCA807X_H
> +
> +/* Full amplitude, full bias current */
> +#define QCA807X_CONTROL_DAC_FULL_VOLT_BIAS		0
> +/* Amplitude follow DSP (amplitude is adjusted based on cable length), half bias current */
> +#define QCA807X_CONTROL_DAC_DSP_VOLT_HALF_BIAS		1
> +/* Full amplitude, bias current follow DSP (bias current is adjusted based on cable length) */
> +#define QCA807X_CONTROL_DAC_FULL_VOLT_DSP_BIAS		2
> +/* Both amplitude and bias current follow DSP */
> +#define QCA807X_CONTROL_DAC_DSP_VOLT_BIAS		3
> +/* Full amplitude, half bias current */
> +#define QCA807X_CONTROL_DAC_FULL_VOLT_HALF_BIAS		4
> +/* Amplitude follow DSP setting; 1/4 bias current when cable<10m,
> + * otherwise half bias current
> + */
> +#define QCA807X_CONTROL_DAC_DSP_VOLT_QUARTER_BIAS	5
> +/* Full amplitude; same bias current setting with “010” and “011”,
> + * but half more bias is reduced when cable <10m
> + */
> +#define QCA807X_CONTROL_DAC_FULL_VOLT_HALF_BIAS_SHORT	6
> +/* Amplitude follow DSP; same bias current setting with “110”, default value */
> +#define QCA807X_CONTROL_DAC_DSP_VOLT_HALF_BIAS_SHORT	7
> +
> +#endif
> -- 
> 2.40.1
> 

