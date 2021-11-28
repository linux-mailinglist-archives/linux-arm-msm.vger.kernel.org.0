Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3601E460B05
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Nov 2021 00:16:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357399AbhK1XTY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 28 Nov 2021 18:19:24 -0500
Received: from mail-oo1-f45.google.com ([209.85.161.45]:45794 "EHLO
        mail-oo1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359474AbhK1XRX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 28 Nov 2021 18:17:23 -0500
Received: by mail-oo1-f45.google.com with SMTP id v30-20020a4a315e000000b002c52d555875so5129568oog.12;
        Sun, 28 Nov 2021 15:14:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=E7YB16y0wT7AgSG9E05suzTqDyBhomfEB6fhcc6pb/k=;
        b=XxbTXFD//GFlw0/VAF2/xYWRmBCanklV0sO6FzdLCBtG0EAicsb/YsGDU18ivbVXkP
         m2I6yp6hTKtdQWUDmbIUVve6ndPeW7zZ2qk1C2e1fzVaLKZNwmtFk96fGwbfX0x/Lqjd
         hgrHsAfSSjHwuKsq+h5msFyzz2YlLR5tsE+l7B98/KLVi6CHkl3flK6x/MZtaFPB1aWO
         yQCdmJhK1J4eq+9TdzImRY6VBeh83SZIufQVvBSkpcnc8R1aUTGddAQQP6TCzheinoOy
         MrbUFcN0NxUtxud9hs3mk7xzKZWLgV01jxLSX5VB3kCczKrGkazVHPNvjTUWEWqCXktw
         x4Ww==
X-Gm-Message-State: AOAM5312kca2pVuTZzMfni5+IuV9uogDKmfUZC50Vv0GJNyH9DBoVNg+
        9EFAzWKcyMFafZKHs7ITpg==
X-Google-Smtp-Source: ABdhPJxPmMk4S9C2AfLmslWdb0YYZa+Sv5/6uaqWmZ8sMaaYSfGWRVzhilkfyLAOa+VNvdPc+WdP4w==
X-Received: by 2002:a4a:b387:: with SMTP id p7mr25155929ooo.46.1638141246826;
        Sun, 28 Nov 2021 15:14:06 -0800 (PST)
Received: from robh.at.kernel.org ([2607:fb90:5fe7:4487:4f99:dbc0:75d1:3e27])
        by smtp.gmail.com with ESMTPSA id r37sm2384625otv.54.2021.11.28.15.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 15:14:06 -0800 (PST)
Received: (nullmailer pid 2794741 invoked by uid 1000);
        Sun, 28 Nov 2021 23:14:02 -0000
Date:   Sun, 28 Nov 2021 17:14:02 -0600
From:   Rob Herring <robh@kernel.org>
To:     quic_vamslank@quicinc.com
Cc:     bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        maz@kernel.org, tglx@linutronix.de, linux-arm-msm@vger.kernel.org,
        sboyd@kernel.org, agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, manivannan.sadhasivam@linaro.org,
        mturquette@baylibre.com, robh+dt@kernel.org
Subject: Re: [PATCH v5 1/6] dt-bindings: clock: Add SDX65 GCC clock bindings
Message-ID: <YaQNOtjqCqc/PPif@robh.at.kernel.org>
References: <cover.1637302009.git.quic_vamslank@quicinc.com>
 <e20b452994bbd410411a631ef96091031c2fc039.1637302009.git.quic_vamslank@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e20b452994bbd410411a631ef96091031c2fc039.1637302009.git.quic_vamslank@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 18 Nov 2021 22:11:33 -0800, quic_vamslank@quicinc.com wrote:
> From: Vamsi krishna Lanka <quic_vamslank@quicinc.com>
> 
> Add device tree bindings for global clock controller on SDX65 SOCs.
> 
> Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
> ---
>  .../bindings/clock/qcom,gcc-sdx65.yaml        |  80 ++++++++++++
>  include/dt-bindings/clock/qcom,gcc-sdx65.h    | 122 ++++++++++++++++++
>  2 files changed, 202 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-sdx65.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
