Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 749A3302CF0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Jan 2021 21:51:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732176AbhAYUuz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Jan 2021 15:50:55 -0500
Received: from mail-oi1-f175.google.com ([209.85.167.175]:43641 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732182AbhAYUui (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jan 2021 15:50:38 -0500
Received: by mail-oi1-f175.google.com with SMTP id i25so4817196oie.10;
        Mon, 25 Jan 2021 12:50:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=If+LyBK3ZLwHImhlgUCrxNda868hqAi6J5PrkdR7cAg=;
        b=qbKr+Px3tGm9ty/9lo9qz9WGXelWO00XexEf8MjzKwGr/OyTBrPIzz3RSW46kRn+EW
         BXUTi+WiluLLKGFy/5F4AM5sBkWkbz2rktAedJmjRT1bG9YLaqO1r5saEEA+lVWMHe6g
         mZtnqfn5rwWzv0HKNXQI7B8d2+6UGCxyTtH77SNCrNpq748eO543MoAj6YJcqp8Lf3R9
         ok3DcjtjzSLmmcSGogzzLQ5HkSWUBeN92CwXtpo2r5H9Ni/QO+0dxZtyrT7k5wzOEHcZ
         Wj87vLaJQXN/tMNtMnPKdtmG+wHwlkxMz3FSQVeFAFqVJLyBF3a3P28sg7XFnsUD3GVi
         jrrw==
X-Gm-Message-State: AOAM533/akpjASd73rNS7vyROPM7HHH3Kqgjg4whcYjS/hFZeD+NznPS
        Wl//azLLBGIGOMSHmtaWQ49dJ/lPwQ==
X-Google-Smtp-Source: ABdhPJyA3+gXnHWwNRsfxas0aBBe6nBZ/V52aHml7J/D3sJRq/7hrx8ikgvJNDtJhYle1VVYGt1Fxg==
X-Received: by 2002:aca:4c85:: with SMTP id z127mr1251964oia.124.1611607797791;
        Mon, 25 Jan 2021 12:49:57 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y17sm3676343oie.7.2021.01.25.12.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 12:49:56 -0800 (PST)
Received: (nullmailer pid 961138 invoked by uid 1000);
        Mon, 25 Jan 2021 20:49:55 -0000
Date:   Mon, 25 Jan 2021 14:49:55 -0600
From:   Rob Herring <robh@kernel.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     robh+dt@kernel.org, konrad.dybcio@somainline.org,
        martin.botka@somainline.org, linux-arm-msm@vger.kernel.org,
        mturquette@baylibre.com, phone-devel@vger.kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org,
        marijn.suijten@somainline.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 4/9] dt-bindings: clock: Add support for the SDM630
 and SDM660 mmcc
Message-ID: <20210125204955.GA960821@robh.at.kernel.org>
References: <20210113183817.447866-1-angelogioacchino.delregno@somainline.org>
 <20210113183817.447866-5-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210113183817.447866-5-angelogioacchino.delregno@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 13 Jan 2021 19:38:12 +0100, AngeloGioacchino Del Regno wrote:
> Document the multimedia clock controller found on SDM630/660.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,mmcc.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
