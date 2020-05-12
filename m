Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F36E81CF64A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2020 15:58:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729461AbgELN6K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 May 2020 09:58:10 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:34298 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727859AbgELN6K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 May 2020 09:58:10 -0400
Received: by mail-oi1-f194.google.com with SMTP id c12so17272249oic.1;
        Tue, 12 May 2020 06:58:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CZM7qY/VR2Qz31TeWcm/jF7dQ7HT5V2CZiGyP+g6mHI=;
        b=YTL7/SRbdD5qU592/VwWfQZsKh+QA3LQx0FEGja1jMCV2Oe8Zl+UEXI6IBIhdNU4Ae
         Y/dIshK0U1/SExFRrY8kyB8FNHCYaZ4Jk5HNBvPi49/hOSTtfelF1fdPaFGoYWT0U6dG
         52kOG2xaxVtLCeV5NlsPzGY8uj8lpGRgIh9494uWM0ZtBg7YZyM7Aim7rgHd/9pbpYgo
         RRtwk11TQTCU60l42Qy1USp7Aak6tOhIcHWMdsPri6GByzeHHnsfk7NkUyzGKuodbY3u
         HXXd2vZF0O5NwiDFHOi3W8tIMgtJugppPTxmW5b2Ee3pejeR9HNavl75hn+OqCpkLxnG
         6xJQ==
X-Gm-Message-State: AGi0PubZycblm+h5nHPNZM/he2MFOPK5oJwyNmUcg6xl07JZQswmbyfD
        ZXCDtr+yVRNws+TS/T0mvg==
X-Google-Smtp-Source: APiQypIwmkbnX5Sb2oV1hGg6uEJnYAI3+wIEqPQG7uo2hEE2JbCsnecwxKCCPVRQz2cG8d7amOSAvw==
X-Received: by 2002:aca:4386:: with SMTP id q128mr22953082oia.150.1589291888011;
        Tue, 12 May 2020 06:58:08 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u197sm5325693oie.7.2020.05.12.06.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 06:58:06 -0700 (PDT)
Received: (nullmailer pid 2669 invoked by uid 1000);
        Tue, 12 May 2020 13:58:05 -0000
Date:   Tue, 12 May 2020 08:58:05 -0500
From:   Rob Herring <robh@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux-clk@vger.kernel.org, p.zabel@pengutronix.de,
        vincent.knecht@mailoo.org, devicetree@vger.kernel.org,
        shawn.guo@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, konradybcio@gmail.com,
        sboyd@kernel.org, mturquette@baylibre.com,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org
Subject: Re: [PATCH v4 1/2] clk: qcom: Add DT bindings for MSM8939 GCC
Message-ID: <20200512135805.GA2022@bogus>
References: <20200512115023.2856617-1-bryan.odonoghue@linaro.org>
 <20200512115023.2856617-2-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200512115023.2856617-2-bryan.odonoghue@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 12 May 2020 12:50:22 +0100, Bryan O'Donoghue wrote:
> Add compatible strings and the include files for the MSM8939 GCC.
> 
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Tested-by: Vincent Knecht <vincent.knecht@mailoo.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../devicetree/bindings/clock/qcom,gcc.yaml   |   3 +
>  include/dt-bindings/clock/qcom,gcc-msm8939.h  | 206 ++++++++++++++++++
>  include/dt-bindings/reset/qcom,gcc-msm8939.h  | 110 ++++++++++
>  3 files changed, 319 insertions(+)
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8939.h
>  create mode 100644 include/dt-bindings/reset/qcom,gcc-msm8939.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
