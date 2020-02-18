Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4A3C16333F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2020 21:42:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbgBRUmv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Feb 2020 15:42:51 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:36102 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726283AbgBRUmv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Feb 2020 15:42:51 -0500
Received: by mail-ot1-f65.google.com with SMTP id j20so20921423otq.3;
        Tue, 18 Feb 2020 12:42:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fbxbwEaD4qF3WMZRRbbcfJIaLGPm78vL8TqgF9rVVVA=;
        b=Q1x81srnkkxGxftk0rVGqR7GuIJw8PjgvFxxzJI6hmJvyf31IU6EfuvdGxs0VdVING
         R1aUzms5D5EayZDsSj7Atw8iP0IhtWc1bnvrA64I3KWbmtQRhkOJ4conCkndZckM66ph
         ll5ppXUssnl67ZvDh9+JQzI8slBlSIeqXbY+fe7Pv4dg4EX7qHBjp6KVptjQg+dtZSrc
         8K13u8iIT/SDi/hctgFoUHQq8fIrl82vgeO0zhq5sftv9aWSo+gohruzIdTdOKqpx75H
         iCpF/rIWwxPm+NhNpOvrhehw8v9gjQyMqsG1EUPiYVJVhRhmR1XOqxLylKYdat8k2VTN
         asrQ==
X-Gm-Message-State: APjAAAX92qHRz+clnOlUVqV7Mi+YOE5Tu7ka4Llp8mN948zX+AiATP2y
        TL+CZxIjDPx6xNvo8sp9uQ==
X-Google-Smtp-Source: APXvYqxIC26xwfaXsfuVbpL+ibxTaDBrPmM7K900gLuNY2/+tZr+rM1AS6Cj9VbvN/PVfLYNmFsuGw==
X-Received: by 2002:a9d:6443:: with SMTP id m3mr16551864otl.20.1582058570147;
        Tue, 18 Feb 2020 12:42:50 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w201sm1547806oif.29.2020.02.18.12.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2020 12:42:49 -0800 (PST)
Received: (nullmailer pid 3007 invoked by uid 1000);
        Tue, 18 Feb 2020 20:42:48 -0000
Date:   Tue, 18 Feb 2020 14:42:48 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org,
        linux-kernel@vger.kernel.org,
        Sriharsha Allenki <sallenki@codeaurora.org>,
        Anu Ramanathan <anur@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>,
        devicetree@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v6 02/18] dt-bindings: phy: Add Qualcomm Synopsys
 Hi-Speed USB PHY binding
Message-ID: <20200218204248.GA2908@bogus>
References: <20200210120723.91794-1-bryan.odonoghue@linaro.org>
 <20200210120723.91794-3-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200210120723.91794-3-bryan.odonoghue@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 10 Feb 2020 12:07:07 +0000, Bryan O'Donoghue wrote:
> From: Sriharsha Allenki <sallenki@codeaurora.org>
> 
> Adds bindings for Qualcomm's 28 nm USB PHY supporting Low-Speed, Full-Speed
> and Hi-Speed USB connectivity on Qualcomm chipsets.
> 
> [bod: Converted to YAML. Changed name dropping snps, 28nm components]
> 
> Signed-off-by: Sriharsha Allenki <sallenki@codeaurora.org>
> Signed-off-by: Anu Ramanathan <anur@codeaurora.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/phy/qcom,usb-hs-28nm.yaml        | 90 +++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,usb-hs-28nm.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
