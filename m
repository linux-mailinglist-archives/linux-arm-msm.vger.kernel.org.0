Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2938B11034D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2019 18:19:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726592AbfLCRTW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Dec 2019 12:19:22 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:42194 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726182AbfLCRTV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Dec 2019 12:19:21 -0500
Received: by mail-oi1-f195.google.com with SMTP id j22so4004070oij.9;
        Tue, 03 Dec 2019 09:19:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sACLwtw9ZycysYh4CjupBwKohmIIzlHEdF8/8ei3VtI=;
        b=DBjzQObRZH1IB4IuUJN/P737k4/cbo/ymuycVUlhmgGrzEp3KPE1Ycq8xZw3tgKQlo
         3wbqFQLKJjtSl0689uWSLPi9vVKMGqBTIg+3GObCGA0kCHThQ+zY7ZLn2GU2K89h2fKE
         JG37yEsUhz7ddQYFnw7bqFjV9LSTu5HBOjRCBLKIDD1vmz6ZKUhj/mC6hQuINZqoouFk
         SFkP/+OTKltjSmdgpKFsZT1w8nuksutDeievFD1C6o435h0jip9k3iJhnOZOJIuXR7rl
         JMpwHfvVW+whQKxegELRpoJm17YFgiT+yMdMaHtT/4bYGSKI2woBY+nuoMbBEuohCg/V
         Qb0Q==
X-Gm-Message-State: APjAAAUsxQg/ehzuomM09HuZHLb5uqKhxNlXjSXHo3I6n04ngOdUjSbi
        dnMv/ldct1Xp16XJuLh4xQ==
X-Google-Smtp-Source: APXvYqym/W12eHYf+vwtWZ8ND9FuNTbiq3s4he4IOzqbI2UPm59HEMXtvi5KmbSm7Y/jyXVaM05muQ==
X-Received: by 2002:aca:510d:: with SMTP id f13mr4673917oib.107.1575393560750;
        Tue, 03 Dec 2019 09:19:20 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b20sm1310332oib.1.2019.12.03.09.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 09:19:20 -0800 (PST)
Date:   Tue, 3 Dec 2019 11:19:19 -0600
From:   Rob Herring <robh@kernel.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette =?iso-8859-1?Q?=A0?= 
        <mturquette@baylibre.com>, David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v1 2/3] dt-bindings: clock: Introduce QCOM Display clock
 bindings
Message-ID: <20191203171919.GA11701@bogus>
References: <1573812245-23827-1-git-send-email-tdas@codeaurora.org>
 <1573812245-23827-3-git-send-email-tdas@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573812245-23827-3-git-send-email-tdas@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 15, 2019 at 03:34:04PM +0530, Taniya Das wrote:
> Add device tree bindings for display clock controller for
> Qualcomm Technology Inc's SC7180 SoCs.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,dispcc.yaml     |  1 +
>  include/dt-bindings/clock/qcom,dispcc-sc7180.h     | 46 ++++++++++++++++++++++
>  2 files changed, 47 insertions(+)
>  create mode 100644 include/dt-bindings/clock/qcom,dispcc-sc7180.h

The subject should have SC7180 in it somewhere. Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>
