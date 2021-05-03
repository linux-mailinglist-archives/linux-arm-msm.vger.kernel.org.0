Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D55337207D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 May 2021 21:32:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbhECTdN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 May 2021 15:33:13 -0400
Received: from mail-oi1-f182.google.com ([209.85.167.182]:42599 "EHLO
        mail-oi1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbhECTdN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 May 2021 15:33:13 -0400
Received: by mail-oi1-f182.google.com with SMTP id v24so6466090oiv.9;
        Mon, 03 May 2021 12:32:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZgB6CjgP7WKgCNvnKrWdWH8RARcUeRIqbbaQfmtubRs=;
        b=leUM6NvPPMEgImuWnHIfmCj5Ehb/5bmmtCY5sgUihD0xiSGr540oLQwsmeQaSK/aGq
         F6jtC6veKX3tAtufTzJA0770+1kDoTMI//Qh29cFSBOiR+3ZdIplZBl7zihSPuCARGVM
         DiMqVvPTCEc6HVAUFOk8kpeYkKn+6WQ+f+eGCJ7ICso33B5CGnTiinEajIM4I+y4lf/y
         dmmyHA1qRk19QSZ9oOt3LsdJmlZs0LfMm3Mv0AXPcM7IH0KBt0F58ARc/lxBHUYYcxvD
         Z9UAlM33fFCteXmzcxLH+fcraOvWLfC/gJU1lbNQEPYO5dzBL9ndBKYoe4l+jEXKIAZj
         tI4w==
X-Gm-Message-State: AOAM532f885VA6kIgHPgf6Q5wNmBWsFeXggWdquZwhzeu9o48EezyE9u
        5H8I6aUk+y2by/6Rf+2lHA==
X-Google-Smtp-Source: ABdhPJx0gYVb5sYfTUTK7HU+6i0UjhpETR3lhF/j1xSFnLwh+V5Y2WSPSIghgW/WMc4DpExk5rRsiQ==
X-Received: by 2002:aca:b208:: with SMTP id b8mr100161oif.79.1620070339146;
        Mon, 03 May 2021 12:32:19 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w10sm174867oou.35.2021.05.03.12.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 12:32:18 -0700 (PDT)
Received: (nullmailer pid 2248404 invoked by uid 1000);
        Mon, 03 May 2021 19:32:17 -0000
Date:   Mon, 3 May 2021 14:32:17 -0500
From:   Rob Herring <robh@kernel.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        dianders@chromium.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Document google,senor board
Message-ID: <20210503193217.GA2248345@robh.at.kernel.org>
References: <1619674827-26650-1-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1619674827-26650-1-git-send-email-rnayak@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 29 Apr 2021 11:10:26 +0530, Rajendra Nayak wrote:
> Document the google,senor board based on sc7280 SoC
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
