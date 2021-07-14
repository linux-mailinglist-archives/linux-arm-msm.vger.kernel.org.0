Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22AA83C8A66
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jul 2021 20:05:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229905AbhGNSH7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jul 2021 14:07:59 -0400
Received: from mail-il1-f176.google.com ([209.85.166.176]:46800 "EHLO
        mail-il1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbhGNSH6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jul 2021 14:07:58 -0400
Received: by mail-il1-f176.google.com with SMTP id y6so2462223ilj.13;
        Wed, 14 Jul 2021 11:05:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+QsVe4lUqCYYMsLNfhYjOlfobs26Nk0H0MT5bPQ9JzQ=;
        b=uRtNMGWT5fuBN9rzasC8Zs9KDbQmWmaBDT9E72NJL15PA+Llw4L5RVsrTG1hX6aAko
         of/W5aU9OsMbpnb6/YfUHVWU9W9qNus2imtW4XGhIZeB6eGvVElHsoJDwfhje+eyncjD
         xntYGKohG/lK90Dvn9U7dY7YJwXJjFltGikGSW/fXVEXz8B3NLfMLSkS2eMTRpain8uo
         Ixx5vffpyyubVsfEDnXpuHlpXI1MUHuGOTGZpSgEnXVvnSexthg6maZvzZC3eG1Qi36l
         BdDFxtPVGRqiFBTLWg24DEQ2zG15rs8X89APIMTCrQG/huxHf9U8Gy2LHp/BFB7zAlLh
         r6Ew==
X-Gm-Message-State: AOAM533u9oCwgffKe1U7Rgpl+7KBFAy7NsK8+FEjEVhlVri4mRRKm3d1
        BBzfSKfMJYhgh6qW6fbzjg==
X-Google-Smtp-Source: ABdhPJzHDz8Uqm10xXFyaEDEWjMq1Yk31YzpOu+N8b5hUpJ8OoEkHbqKVZ7LfEPOKTJibL5koUFgMA==
X-Received: by 2002:a92:3009:: with SMTP id x9mr7227520ile.49.1626285906343;
        Wed, 14 Jul 2021 11:05:06 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id d8sm1623733iom.49.2021.07.14.11.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 11:05:05 -0700 (PDT)
Received: (nullmailer pid 2854005 invoked by uid 1000);
        Wed, 14 Jul 2021 18:05:04 -0000
Date:   Wed, 14 Jul 2021 12:05:04 -0600
From:   Rob Herring <robh@kernel.org>
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, phone-devel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Kathiravan T <kathirav@codeaurora.org>
Subject: Re: [PATCH v1 2/5] dt-bindings: clock: qcom: rpmcc: Document
 SM6115,SM4250 compatible
Message-ID: <20210714180504.GA2853975@robh.at.kernel.org>
References: <20210622202156.546718-1-iskren.chernev@gmail.com>
 <20210622202156.546718-3-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210622202156.546718-3-iskren.chernev@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 22 Jun 2021 23:21:53 +0300, Iskren Chernev wrote:
> Add the dt-binding for the RPM Clock Controller on the SM6115 and SM4250
> SoC.
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmcc.txt |  2 ++
>  include/dt-bindings/clock/qcom,rpmcc.h                 | 10 ++++++++++
>  2 files changed, 12 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
