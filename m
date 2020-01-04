Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3D3A12FF60
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jan 2020 01:00:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726229AbgADAA6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jan 2020 19:00:58 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:40766 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726477AbgADAAz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jan 2020 19:00:55 -0500
Received: by mail-io1-f65.google.com with SMTP id x1so43059752iop.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2020 16:00:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xmFf6L8ePvGKyOz/wpH8wXZ5AKBsBj34hi1vb6ky2dA=;
        b=NzkJXpsmskykB9yI/tUlD16tU00ynvwgNclrv+46YNnO7FTJK4nKIujEN6JOtSJYrX
         jEbtsLjSK+2UtkNH8aX+gRGjHlychg6BQcUXPC/P+6EkokHGqMiREaLX0NvxOUuGPgHG
         eVmDy8hHgYxHMIXpi4qV+Cr/s8++7mZQtsxEf5MCMR+K4NaRcDYE5NQBgRfKMmEuhQK4
         de1FFPBaRuq6yoQ8pC/DMVp/v1wLYkg+0jIGWCzX3/VyA+7yhvEaCY3yT1WHVJblq9Qt
         Hz1EYl8ZxvgyNfb4fInHPSab0HBwqzDPdZi/BmEMs6VuZTEIWSvLOinG3B8eCLTN203l
         Gh0g==
X-Gm-Message-State: APjAAAV9k/2tCwCTYJHdzVB/7d4/q+tKUkdpOFya9LXE8TSSM8QWx5UN
        7NHTzX5plbtW5BDjTT1pBLtviYk=
X-Google-Smtp-Source: APXvYqypH7IfmxQoxMg1i8mGc4xX5KFQ296NmgNkLv87GaVjKjOfON09QqIcjiO4sTHi9IZzwJJUGA==
X-Received: by 2002:a05:6638:3b6:: with SMTP id z22mr69492882jap.35.1578096054156;
        Fri, 03 Jan 2020 16:00:54 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id p12sm21356773ilk.66.2020.01.03.16.00.52
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 16:00:53 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219a5
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Fri, 03 Jan 2020 17:00:52 -0700
Date:   Fri, 3 Jan 2020 17:00:52 -0700
From:   Rob Herring <robh@kernel.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        dikshita@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: Re: [PATCH v3 12/12] dt-bindings: media: venus: delete old binding
 document
Message-ID: <20200104000052.GA17596@bogus>
References: <20191223113311.20602-1-stanimir.varbanov@linaro.org>
 <20191223113311.20602-13-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191223113311.20602-13-stanimir.varbanov@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 23 Dec 2019 13:33:11 +0200, Stanimir Varbanov wrote:
> After transitioning to YAML DT schema we don't need this old-style
> document.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  .../devicetree/bindings/media/qcom,venus.txt  | 120 ------------------
>  1 file changed, 120 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/qcom,venus.txt
> 

Acked-by: Rob Herring <robh@kernel.org>
