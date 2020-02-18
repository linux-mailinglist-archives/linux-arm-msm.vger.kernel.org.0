Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00A8C1636A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2020 00:00:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727547AbgBRXA3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Feb 2020 18:00:29 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:38451 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726427AbgBRXA2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Feb 2020 18:00:28 -0500
Received: by mail-oi1-f193.google.com with SMTP id r137so2325711oie.5;
        Tue, 18 Feb 2020 15:00:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Bf5tJJthgfJM887l+Ctf/g6n9DpGJfGe44w63jWxcmw=;
        b=mLeG3XmawjMmMBM9yKrW9YNsC4ZS/tisbu/GYU7CTmwiqgIgjzlFIgMma60hv90giV
         ey/ydShiUdZUXtEU42QVb2iAmRkwD5+m25vJ/6Jcmb14SId25jg1eTlqU/7mUZX1eeGm
         ZDdR7+d9R5bq/5O1g0n8Y5G71cQw6PGI8d7EvSL79wQZ5lCLj1hx2jnnefm6yt1ex3CJ
         Hq+P5XXI6eoo5zcLPNSIx7e5DWUQAdlhUse7hTWmQxGeFz3oPcCNZtP7VOtaZ+FiiA4g
         XIV1iWuv4FufSkj2gv47YEJyGzbcdaDoIvJR0gc/D6IXmufW38cyj1klEP4Yiu7KR8MZ
         3ALg==
X-Gm-Message-State: APjAAAUTt9Ufxz8RjrxxS3IvfixT1X3mUW61HBS+leqJ/EYb2vCRKZ3U
        tyVykPZZQy6+KY5jjQkCtQ==
X-Google-Smtp-Source: APXvYqzEdH3audeyFCh7dGF3e/CskWz54r+w4mowwT+YvKgEMA80NJD71Wbx9ma/vwiCUaIvpZx86g==
X-Received: by 2002:aca:1c09:: with SMTP id c9mr2893247oic.85.1582066827798;
        Tue, 18 Feb 2020 15:00:27 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m2sm106784oim.13.2020.02.18.15.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2020 15:00:27 -0800 (PST)
Received: (nullmailer pid 4224 invoked by uid 1000);
        Tue, 18 Feb 2020 23:00:26 -0000
Date:   Tue, 18 Feb 2020 17:00:26 -0600
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
Subject: Re: [PATCH v4 3/5] dt-bindings: clock: Add YAML schemas for the QCOM
 MSS clock bindings
Message-ID: <20200218230026.GA3778@bogus>
References: <1582049733-17050-1-git-send-email-tdas@codeaurora.org>
 <1582049733-17050-4-git-send-email-tdas@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582049733-17050-4-git-send-email-tdas@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 18 Feb 2020 23:45:31 +0530, Taniya Das wrote:
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

Error: Documentation/devicetree/bindings/clock/qcom,sc7180-mss.example.dts:21.26-27 syntax error
FATAL ERROR: Unable to parse input tree
scripts/Makefile.lib:300: recipe for target 'Documentation/devicetree/bindings/clock/qcom,sc7180-mss.example.dt.yaml' failed
make[1]: *** [Documentation/devicetree/bindings/clock/qcom,sc7180-mss.example.dt.yaml] Error 1
Makefile:1263: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1240251
Please check and re-submit.
