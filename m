Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 689423CA465
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jul 2021 19:30:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229899AbhGORdh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jul 2021 13:33:37 -0400
Received: from mail-il1-f176.google.com ([209.85.166.176]:37558 "EHLO
        mail-il1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbhGORdh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jul 2021 13:33:37 -0400
Received: by mail-il1-f176.google.com with SMTP id o8so5699510ilf.4;
        Thu, 15 Jul 2021 10:30:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=y6zmu1eYIV7Dk6l7YaFt2tTWke/nunx7ye4KjXElS4Q=;
        b=gbs//lpkPEHyTDv3kxLR3UP5UB36q7KLsz5ZC2gnb3heNhSmKAjupvCjZAwSz6dRD1
         ayRcCgcliYUdrFdpaug5LrFjxBABJVz5E4ZuITvXoyC370ThzGLp0jvFIjeXJzULEXJ+
         fklDV/Lcd2IEfv9UPSEUnxHtmjr08C0Kkg5bwMVA+acwMD6NcjvYI+UXO1AXLcCO3odI
         VnMd2rNSWbOOCow3S0upcHvz5NbPhf9C9Xa1MylBDQfhDhcJT1etjH2JJg5joabT68fH
         xn1Up9a7NWfGOSaQkQkRLg/r+t/i9Z2oDJGyzaP3q7UtFrDTJ/XQpK642G4+8q1jF+oM
         Z2bQ==
X-Gm-Message-State: AOAM533F3WFzINxPYHYQRiQDEilDjLbeZ5J2+8ksAOQWtxbn1hoZ0a99
        zk3/l8nL8fJm+LL/Xp7cTg==
X-Google-Smtp-Source: ABdhPJxfN/yskXpSuF1ppqKEB1G0e+KeMTMRHWQwQjZb2ksbXcurPqLTNHnNVD8w1cFZ1L9Fhqscpg==
X-Received: by 2002:a92:3004:: with SMTP id x4mr3412989ile.269.1626370242392;
        Thu, 15 Jul 2021 10:30:42 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id r4sm3313735ilb.42.2021.07.15.10.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 10:30:41 -0700 (PDT)
Received: (nullmailer pid 1289475 invoked by uid 1000);
        Thu, 15 Jul 2021 17:30:38 -0000
Date:   Thu, 15 Jul 2021 11:30:38 -0600
From:   Rob Herring <robh@kernel.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        robh+dt@kernel.org, Rajendra Nayak <rnayak@codeaurora.org>,
        linux-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 6/7] dt-bindings: clock: Add SC7280 VideoCC clock
 binding
Message-ID: <20210715173038.GA1289417@robh.at.kernel.org>
References: <1626189143-12957-1-git-send-email-tdas@codeaurora.org>
 <1626189143-12957-7-git-send-email-tdas@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1626189143-12957-7-git-send-email-tdas@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 13 Jul 2021 20:42:22 +0530, Taniya Das wrote:
> Add device tree bindings for video clock subsystem clock
> controller for Qualcomm Technology Inc's SC7280 SoCs.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,videocc.yaml    |  6 +++--
>  include/dt-bindings/clock/qcom,videocc-sc7280.h    | 27 ++++++++++++++++++++++
>  2 files changed, 31 insertions(+), 2 deletions(-)
>  create mode 100644 include/dt-bindings/clock/qcom,videocc-sc7280.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
