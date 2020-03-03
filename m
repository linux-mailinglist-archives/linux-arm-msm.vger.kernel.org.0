Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F0B01779BA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2020 16:00:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729731AbgCCO7X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Mar 2020 09:59:23 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:40330 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728975AbgCCO7X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Mar 2020 09:59:23 -0500
Received: by mail-ot1-f65.google.com with SMTP id x19so3270759otp.7;
        Tue, 03 Mar 2020 06:59:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jxXZabJF36zBqHLvSkp1BT+uIXDUsdzVqIFAD0M2EXo=;
        b=Ec0whZDOP87o26kq8TtpXG6lXy8JX2l9/TEDXRM3pM6nb9lBbOKZOxZvVrdZ5I2eUi
         RZ4BaU0h7pqdc+x3TvbVYaWGa26lk/KgwS6boEnOidBJnKiss4o/G8PWvdC8zqUl2IfT
         nn1zhdr0QKcF7Qd/32SA+83cKF6cPoEvaNJLWOUbbnVivV9OA2YAi29MJZJpW1FKtbsB
         MBfoBHXQxON3UNjwz4FpL8qw/0MSHC0o4K2AXT0x0y6JVKjxwxSehYmzOmjiBbkGh0ZA
         V3hPphBqgKm6MCnDHiJJzUua/MDZJHuA8AQfoVdN46qrpHlXSETdRlILcX3ek95A02TG
         wVig==
X-Gm-Message-State: ANhLgQ0wg6VVuqTcbxvNCkxCa6ldIRtMQbQ0WPG7k8TDM4MM/GN+koWI
        G7blP8ffL/8ZigRuQh6ppg==
X-Google-Smtp-Source: ADFU+vs0akez33tRS244m5eGi3FSV87z7OM5KR9hAV09veZ9Jb9+CkWsSjCrP6apKPamqlw3XwLehQ==
X-Received: by 2002:a9d:748c:: with SMTP id t12mr3506779otk.38.1583247562238;
        Tue, 03 Mar 2020 06:59:22 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c7sm7904442otm.63.2020.03.03.06.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 06:59:21 -0800 (PST)
Received: (nullmailer pid 32405 invoked by uid 1000);
        Tue, 03 Mar 2020 14:59:20 -0000
Date:   Tue, 3 Mar 2020 08:59:20 -0600
From:   Rob Herring <robh@kernel.org>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Ansuel Smith <ansuelsmth@gmail.com>,
        John Crispin <john@phrozen.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: qcom: clk-rpm: add missing rpm clk for ipq806x
Message-ID: <20200303145920.GA32328@bogus>
References: <robh@kernel.org>
 <20200226214812.390-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200226214812.390-1-ansuelsmth@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 26 Feb 2020 22:48:12 +0100, Ansuel Smith wrote:
> Add missing definition of rpm clk for ipq806x soc
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> Acked-by: John Crispin <john@phrozen.org>
> ---
>  .../devicetree/bindings/clock/qcom,rpmcc.txt  |  1 +
>  drivers/clk/qcom/clk-rpm.c                    | 35 +++++++++++++++++++
>  include/dt-bindings/clock/qcom,rpmcc.h        |  4 +++
>  3 files changed, 40 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
