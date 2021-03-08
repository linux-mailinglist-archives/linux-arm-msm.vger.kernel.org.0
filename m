Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC562331654
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Mar 2021 19:40:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231208AbhCHSkO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Mar 2021 13:40:14 -0500
Received: from mail-il1-f180.google.com ([209.85.166.180]:41763 "EHLO
        mail-il1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229818AbhCHSkA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Mar 2021 13:40:00 -0500
Received: by mail-il1-f180.google.com with SMTP id c10so9751454ilo.8;
        Mon, 08 Mar 2021 10:39:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lw4l+rLMJMGEsx55Qbf/gHCYaiQyZEZqf2Nq/Dmr/RI=;
        b=jYAgaZE37rb+FVIx+3J6v3DEorg+P4yjQFYgwVUUiOA9zldWwMyIzzk7m70oubQz0f
         LYA06d44BjDMqeNOVFXD7CfOSAvHdxaZ6OhA/pvmV365kzt4UHILjkCuXr8SRbZNs+bO
         yJpmQorkYc5dx3sJUek1ZuLf5qgQ09E5THfpnX+Gm6v2d3dvtCFPCjUk6PjugxpNb2El
         CUoJQHEqdKnKyxztn8aIBT9mBG32AhRhLCmjX3jIbIEnT5J+UkDloPcRi247JZ3hdBEU
         msERqBx/KyLvFCP0O2eRwHWKJQSrd9t1m4jrOcQJIQGAc7fEOPqKp1V9irWQtCh4yjLb
         B5fg==
X-Gm-Message-State: AOAM533t0ZAW/kZq/jIf0dF2oo6/g2X1Xn/rx0lMexOAFGPSfdHO+0hb
        V2Cw15huXZfJBfI0OWT4fw==
X-Google-Smtp-Source: ABdhPJwVW4PuFonwOSGbDEP0tHgzDPFplAp37YU80bhL64fPNFlSe5nALXb//3YnVCfNQUtdGAI/Cw==
X-Received: by 2002:a92:dd82:: with SMTP id g2mr21509501iln.194.1615228799387;
        Mon, 08 Mar 2021 10:39:59 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id p5sm6478739iod.31.2021.03.08.10.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 10:39:58 -0800 (PST)
Received: (nullmailer pid 2762563 invoked by uid 1000);
        Mon, 08 Mar 2021 18:39:56 -0000
Date:   Mon, 8 Mar 2021 11:39:56 -0700
From:   Rob Herring <robh@kernel.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org,
        agross@kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: power: rpmpd: Add sc7280 to rpmpd
 binding
Message-ID: <20210308183956.GA2762516@robh.at.kernel.org>
References: <1614664092-9394-1-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614664092-9394-1-git-send-email-rnayak@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 02 Mar 2021 11:18:11 +0530, Rajendra Nayak wrote:
> Add compatible and constants for the power domains exposed by the RPMH
> in the Qualcomm Technologies Inc sc7280 platform.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/power/qcom,rpmpd.yaml |  1 +
>  include/dt-bindings/power/qcom-rpmpd.h                  | 11 +++++++++++
>  2 files changed, 12 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
