Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7274E881C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2019 13:27:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727102AbfJ2M1H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Oct 2019 08:27:07 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:43068 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726290AbfJ2M1H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Oct 2019 08:27:07 -0400
Received: by mail-ot1-f67.google.com with SMTP id b19so7206716otq.10;
        Tue, 29 Oct 2019 05:27:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LE4PO0l8sU/LMs15ntY9NP1K54bi7Rn7T6Rvaa70k0c=;
        b=jatZl43+T1OAL+mtytfjxt5ONLw4ptfpIwjE/JagPLOYGBYq/xH8KNU31Q2e8/OUfk
         KdwfOk/JyAyhm66p+WV02Wjne4coodHaH62OzyGp+SM5zRYdtvFY+n+DPmn053NASUJw
         /XKETfGQ89DTKXBzDNbBuN0hntOJjAikGZ4OhLMx804Z92xHgXjN4k3udfRuCNDYu0X6
         zug7YnivB7sronBUKD7tGI8IS/goFzrvd/zQzJQn8Rs1qauC3TW60o57visQ0X+9KREY
         jFd8lug7DZFU/vTqqn5ZewOhWWmevmEY2MxEF0k8YQnDB7kmJLohL96bDxSgZ2+qjDSJ
         y7pw==
X-Gm-Message-State: APjAAAV83eqM4xEgaS1L/Pbj3QLLXwwUIBNi0zzP0/JyaJKUpilSIzOU
        NQADShGSmTq2BkP2CHlQfg==
X-Google-Smtp-Source: APXvYqz/kSbsYZbjOtemCxn0+8PVX7DGw9O5oetqGXvmK6OEFhe1CXtflAPDXmoOIX77jKZU/YDcDg==
X-Received: by 2002:a9d:7a90:: with SMTP id l16mr7208693otn.295.1572352026208;
        Tue, 29 Oct 2019 05:27:06 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l7sm1629839otf.39.2019.10.29.05.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 05:27:05 -0700 (PDT)
Date:   Tue, 29 Oct 2019 07:27:04 -0500
From:   Rob Herring <robh@kernel.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette =?iso-8859-1?Q?=A0?= 
        <mturquette@baylibre.com>, Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v1 2/3] dt-bindings: clock: Introduce RPMHCC bindings for
 SC7180
Message-ID: <20191029122704.GA8251@bogus>
References: <1571393364-32697-1-git-send-email-tdas@codeaurora.org>
 <1571393364-32697-3-git-send-email-tdas@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1571393364-32697-3-git-send-email-tdas@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 18 Oct 2019 15:39:23 +0530, Taniya Das wrote:
> Add compatible for SC7180 RPMHCC.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
