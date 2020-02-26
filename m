Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDC0C1702CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2020 16:40:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728328AbgBZPko (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Feb 2020 10:40:44 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:37945 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728244AbgBZPko (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Feb 2020 10:40:44 -0500
Received: by mail-oi1-f194.google.com with SMTP id r137so3458139oie.5;
        Wed, 26 Feb 2020 07:40:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3R1Mq+MisD9G4+ZpOmuB3h2FDH8y3/7UmntuhjMNOV0=;
        b=pVNbzQ16z2M2NzzQzhTY6SZfRgQ+X/V0BaIoehJM3rODE/U8cA1CbMKmGyMaHq5flo
         iG68PdXnHQ3PyenOf2Ejt9cdFbsu/1BPKCx6xkAQ1QMldE111BykOQ4xi5Z1DQbhx3Rb
         goN0z+f7W6wgpe4KK93uHisFC2aHF9tScrOXeTUj16XK/edBVZb3EKvFXuj0TVqvNeNy
         YdalOoJiPf11LNvnJCq2pR8Klbz0CTG4E3z8uxPi3yEf8a39Qm2YBLIQkl3WezBW6KIq
         h1Zgi643oqXWzw5IBhX1PQkXLdTfSUoiNNam+QYkX4CvGbMwauRMjQfKil/YkvAQgw74
         ursA==
X-Gm-Message-State: APjAAAV+4w7W5ArgRK2jYtQT8e2d9MYenQBNFsXCfgk2C0okJLG3eTxn
        YyTz7lxICcZagvpfKo6RnOwb2boUtw==
X-Google-Smtp-Source: APXvYqxcBvbXOvynvDFxXZbtbXfYpnw0GKqWXRxA1hG0x/H5llfZKmKRiUnj9vUsgZ7itckep14F+w==
X-Received: by 2002:aca:2315:: with SMTP id e21mr3589037oie.147.1582731643096;
        Wed, 26 Feb 2020 07:40:43 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f1sm889779otq.4.2020.02.26.07.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 07:40:42 -0800 (PST)
Received: (nullmailer pid 21596 invoked by uid 1000);
        Wed, 26 Feb 2020 15:40:40 -0000
Date:   Wed, 26 Feb 2020 09:40:40 -0600
From:   Rob Herring <robh@kernel.org>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     John Crispin <john@phrozen.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: clk-rpm: add missing rpm clk for ipq806x
Message-ID: <20200226154040.GA17521@bogus>
References: <20200219185226.1236-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200219185226.1236-1-ansuelsmth@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 19, 2020 at 07:52:25PM +0100, Ansuel Smith wrote:
> Add missing definition of rpm clk for ipq806x soc
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>  .../devicetree/bindings/clock/qcom,rpmcc.txt  |  1 +
>  drivers/clk/qcom/clk-rpm.c                    | 35 +++++++++++++++++++
>  include/dt-bindings/clock/qcom,rpmcc.h        |  4 +++
>  3 files changed, 40 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
> index 944719bd586f..dd0def465c79 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
> +++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
> @@ -16,6 +16,7 @@ Required properties :
>  			"qcom,rpmcc-msm8974", "qcom,rpmcc"
>  			"qcom,rpmcc-apq8064", "qcom,rpmcc"
>  			"qcom,rpmcc-msm8996", "qcom,rpmcc"
> +			"qcom,rpmcc-ipq806x", "qcom,rpmcc"
>  			"qcom,rpmcc-msm8998", "qcom,rpmcc"

Perhaps keep this somewhat in sorted order.

>  			"qcom,rpmcc-qcs404", "qcom,rpmcc"
>  
