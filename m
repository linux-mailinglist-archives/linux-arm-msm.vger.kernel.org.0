Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12E7412FFD9
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jan 2020 01:59:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727156AbgADA7S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jan 2020 19:59:18 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:44177 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727159AbgADA7S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jan 2020 19:59:18 -0500
Received: by mail-il1-f196.google.com with SMTP id z12so1573844iln.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2020 16:59:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=he5w4xe5758mzPhyknWVdWn5blsV7hMVch+zol3itAA=;
        b=OMXQSY8g+DAFiyig6zvWcMvQkCc656FdSy6+dY3ffTPDnepEobjcwv8vALRv/MS561
         t3ZMtkYVYQpyoZah/yUet1fLgl/aBLwGRLgqKVgtd4ihYD8bWZ33oDGfAVJh7QqPCeUZ
         wG491nPKRBLdg19dKD1hZpghZ2c5sP7D6xrUpqzi6wXJhbluFuBK3KZJeYYumt37v0Pv
         o/6tKf/GvzmzJODaPrOUpjn6W5JBwwezhnv1aZwsDnKAgW4CDjhDvycA9pK1IxkCYKcG
         SsdWYSAPcc2OaYrlybl30w+YToxBmYcAuiKm9dfmNOjA+1E3c90d25dgbR7oK1MEeZ6H
         T+jA==
X-Gm-Message-State: APjAAAUmr3FMVHbOIsPbjSgWhxTtw15sV9bYVYbdz91dHFV+YCtm0FOz
        wkyUS1Lj9ALU1KiyxLO8P0tgHi0=
X-Google-Smtp-Source: APXvYqzdUwumviPCjb/lQeeoJSgIfKnQCDwF2t1E88ACpKQpkdUgVnl0UXVWDCHduncSc++MgOjgvg==
X-Received: by 2002:a92:8311:: with SMTP id f17mr80356188ild.82.1578099557363;
        Fri, 03 Jan 2020 16:59:17 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id f125sm11655172ilh.88.2020.01.03.16.59.16
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 16:59:16 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219b7
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Fri, 03 Jan 2020 17:59:15 -0700
Date:   Fri, 3 Jan 2020 17:59:15 -0700
From:   Rob Herring <robh@kernel.org>
To:     Sricharan R <sricharan@codeaurora.org>
Cc:     sricharan@codeaurora.org, agross@kernel.org,
        devicetree@vger.kernel.org, linus.walleij@linaro.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-soc@vger.kernel.org, robh+dt@kernel.org, sboyd@kernel.org,
        sivaprak@codeaurora.org
Subject: Re: [PATCH V3 3/5] dt-bindings: qcom: Add ipq6018 bindings
Message-ID: <20200104005915.GA14735@bogus>
References: <1578052177-6778-1-git-send-email-sricharan@codeaurora.org>
 <1578052177-6778-4-git-send-email-sricharan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578052177-6778-4-git-send-email-sricharan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri,  3 Jan 2020 17:19:35 +0530, Sricharan R wrote:
> Document the new ipq6018 SOC/board device tree bindings.
> 
> Co-developed-by: Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>
> Signed-off-by: Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>
> Co-developed-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
