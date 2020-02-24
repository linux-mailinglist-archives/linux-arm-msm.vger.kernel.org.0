Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F30D116AF78
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2020 19:42:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727745AbgBXSmE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Feb 2020 13:42:04 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:36476 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727709AbgBXSmD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Feb 2020 13:42:03 -0500
Received: by mail-ot1-f66.google.com with SMTP id j20so9694372otq.3;
        Mon, 24 Feb 2020 10:42:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0oNSfC/VueKVt/Nz7VSIdO4jhQ0NPkVJt3k9o2m6tZQ=;
        b=DgdLN4yg9NCsMZ2a929hhQj8yt8Zum4KsPlwM8OU1zNUjT+9JmzfHSYnRxz9a+X7Vc
         O+YJVJ++0gB0KhbLKteLDG3CnH3BPjk4Hc+QKd71c6IwwbwsgxJpvc6ywHSb69i41jWt
         +6OS1RiwywKGEUax9KBf01rfSxaTG/HRxVAAi5YQjVzbU9r/3MFvpcTV615wJDl/tct2
         OP2hJ4k1X97XoWjlARZtIwbKlS4iNRfy5LCgo9kCgMYMxVjuTkogE1LnC1Ksg/eEqnBh
         W7BYRucx+BN3/zbS6b8fWmKKfuM9IScNiEtACKrM1BCT48WAaWxO2aa2ZcgMSxWDsSlN
         6Hkw==
X-Gm-Message-State: APjAAAVbUfLkz78muMSmrqxNUP3duS/iVFP9CHtWVTZOIi5tREbqZeKR
        hHQONE9r9suaHH8vXmyMvFZubrQ=
X-Google-Smtp-Source: APXvYqz00HiO0Z2/dfXCRqcQOlXMa9/Bu6VsS+b3HJP8XuF8m3LmzbOURtJ9vXw8MuKXObQfvQXlmA==
X-Received: by 2002:a9d:64b:: with SMTP id 69mr39683937otn.237.1582569722788;
        Mon, 24 Feb 2020 10:42:02 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v134sm2287844oia.38.2020.02.24.10.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2020 10:42:02 -0800 (PST)
Received: (nullmailer pid 7356 invoked by uid 1000);
        Mon, 24 Feb 2020 18:42:01 -0000
Date:   Mon, 24 Feb 2020 12:42:01 -0600
From:   Rob Herring <robh@kernel.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette =?iso-8859-1?Q?=A0?= 
        <mturquette@baylibre.com>, David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v5 3/5] dt-bindings: clock: Add YAML schemas for the QCOM
 MSS clock bindings
Message-ID: <20200224184201.GA6030@bogus>
References: <1582540703-6328-1-git-send-email-tdas@codeaurora.org>
 <1582540703-6328-4-git-send-email-tdas@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582540703-6328-4-git-send-email-tdas@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 24 Feb 2020 16:08:21 +0530, Taniya Das wrote:
> The Modem Subsystem clock provider have a bunch of generic properties
> that are needed in a device tree. Add a YAML schemas for those.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,sc7180-mss.yaml | 62 ++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-mss.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:21.16-37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
Error: Documentation/devicetree/bindings/clock/qcom,sc7180-mss.example.dts:21.26-27 syntax error
FATAL ERROR: Unable to parse input tree
scripts/Makefile.lib:300: recipe for target 'Documentation/devicetree/bindings/clock/qcom,sc7180-mss.example.dt.yaml' failed
make[1]: *** [Documentation/devicetree/bindings/clock/qcom,sc7180-mss.example.dt.yaml] Error 1
Makefile:1263: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1242999
Please check and re-submit.
