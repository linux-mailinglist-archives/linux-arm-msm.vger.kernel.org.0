Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4BAA1B17F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2020 23:05:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725897AbgDTVFh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Apr 2020 17:05:37 -0400
Received: from mail-oo1-f68.google.com ([209.85.161.68]:38884 "EHLO
        mail-oo1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726722AbgDTVFh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Apr 2020 17:05:37 -0400
Received: by mail-oo1-f68.google.com with SMTP id i9so2452108ool.5;
        Mon, 20 Apr 2020 14:05:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=k25lJJuF3KD2HkG1pD42IimL7Q4T4hDTKGEAQjI4bTE=;
        b=DsahfX5aYDaxPXyjXK1j6rfmvgRCBVNmQ3MYx553c/qM0a8fq5Ec928YG3wx+wgd9v
         EYb/e2Db5E0chohIH3znZ7uSG263ycTL8bQQOESCU5FgfojkvAZEpS4ALL+tG33CVgOf
         ol172uR19ZkGsZe3r3M+uXTpDXLd6JvSyWwRUVAWGrZhgro/RHzXUUTgSbF1YQwasKFV
         9Xyp5IA8Xed3dtdz59dbGPfFLJAsgKliawCe52cHAQRW39b+jf9w3HC4PJuo4naTvi1A
         n8JNURigBKegyi5jIrVEJYXRxQQ+zGGxAQLo7H9Oo2yLiGoMGaMkho1ElpMjuJDAuv/J
         tAxg==
X-Gm-Message-State: AGi0PuasiJSW/PR4wsoDn88g7dCwOpEQ6QTiRPFQ+mC61hOsVNhHo+Yy
        dArWKZiY3K5zvR2FofgRSQ==
X-Google-Smtp-Source: APiQypKWhsFkbrAEp3fNmGRzrhXjjhUwgl8zrrmaFlL3eoi4UBih2xLRhjbWw7AnOnqcBVKnrkYECw==
X-Received: by 2002:a4a:c18c:: with SMTP id w12mr13776324oop.93.1587416735968;
        Mon, 20 Apr 2020 14:05:35 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h64sm157466oia.11.2020.04.20.14.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 14:05:35 -0700 (PDT)
Received: (nullmailer pid 27715 invoked by uid 1000);
        Mon, 20 Apr 2020 21:05:34 -0000
Date:   Mon, 20 Apr 2020 16:05:34 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>
Subject: Re: [PATCH V3 6/8] dt-bindings: mailbox: Add dt-bindings for ipq6018
 apcs global block
Message-ID: <20200420210534.GA27676@bogus>
References: <1586832922-29191-1-git-send-email-sivaprak@codeaurora.org>
 <1586832922-29191-7-git-send-email-sivaprak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586832922-29191-7-git-send-email-sivaprak@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 14 Apr 2020 08:25:20 +0530, Sivaprakash Murugesan wrote:
> Add dt-bindings for ipq6018 mailbox driver
> 
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> ---
>  .../bindings/mailbox/qcom,apcs-kpss-global.yaml         | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
