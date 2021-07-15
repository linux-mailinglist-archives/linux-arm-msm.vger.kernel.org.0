Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67D0F3CA45E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jul 2021 19:28:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230347AbhGORbM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jul 2021 13:31:12 -0400
Received: from mail-il1-f178.google.com ([209.85.166.178]:40872 "EHLO
        mail-il1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230166AbhGORbL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jul 2021 13:31:11 -0400
Received: by mail-il1-f178.google.com with SMTP id b14so5696076ilf.7;
        Thu, 15 Jul 2021 10:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JA6U0tnyhnbxM8RPLfy8JF8C8+fkg6o/l2csb94yffI=;
        b=ARLl6+wsXnqk41AWxZrlBnhFeya4jvFRKMsGlMK2COuaugOOOrs/2CZK5rrz+0NNMY
         cMfW3ovmcDUEt0JSmb88FyyAQ8CfcMro9QaG4wrPU8QXS2v2ZMEUx4Nl59EoDZ7mF6zG
         h5vSv6Zvfcon1YGOkbegC8WhoO4okXwha2k3MYieIzZU120foiqPMWko3weX1GYSVnGy
         Di/XXVr0IW+1FT3ajot/Ul/CTXxaUyuXrMxZNajwtzBvuzcBlKkSmIhSZsz8YfDGvuXm
         2my0U/RSNNPKSMwagDU51+WYsFly0mIaf9TQiez1o2u9R6Lwz/Gmxv8Tj5Oz6JrTwIEv
         r43w==
X-Gm-Message-State: AOAM531Tx4DIDBaiUcQeAC/Vw0saej0nNKOAXdJ4lNW+wRuyFvs0ehKe
        Zhs/WA9CsDRvUP8YLwLsvRDOUgq0JA==
X-Google-Smtp-Source: ABdhPJz6X5czAlJUTYTcRu39CqmrO/yjySzDKpTW8z5d4QaH7vx57UnwLyEzG7ssCGIswBlajleTaw==
X-Received: by 2002:a05:6e02:1a24:: with SMTP id g4mr3290444ile.260.1626370097397;
        Thu, 15 Jul 2021 10:28:17 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id h10sm3560606ioe.43.2021.07.15.10.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 10:28:16 -0700 (PDT)
Received: (nullmailer pid 1285647 invoked by uid 1000);
        Thu, 15 Jul 2021 17:28:13 -0000
Date:   Thu, 15 Jul 2021 11:28:13 -0600
From:   Rob Herring <robh@kernel.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        robh+dt@kernel.org, linux-soc@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/7] dt-bindings: clock: Add SC7280 GPUCC clock binding
Message-ID: <20210715172813.GA1285594@robh.at.kernel.org>
References: <1626189143-12957-1-git-send-email-tdas@codeaurora.org>
 <1626189143-12957-5-git-send-email-tdas@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1626189143-12957-5-git-send-email-tdas@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 13 Jul 2021 20:42:20 +0530, Taniya Das wrote:
> Add device tree bindings for graphics clock subsystem clock
> controller for Qualcomm Technology Inc's SC7280 SoCs.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,gpucc.yaml      |  6 ++--
>  include/dt-bindings/clock/qcom,gpucc-sc7280.h      | 35 ++++++++++++++++++++++
>  2 files changed, 39 insertions(+), 2 deletions(-)
>  create mode 100644 include/dt-bindings/clock/qcom,gpucc-sc7280.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
