Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C04AFCC51
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2019 18:59:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727015AbfKNR6z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Nov 2019 12:58:55 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:36413 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726444AbfKNR6z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Nov 2019 12:58:55 -0500
Received: by mail-ot1-f65.google.com with SMTP id f10so5645707oto.3;
        Thu, 14 Nov 2019 09:58:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RfR6bpd+7RNBJaz7pO9oQTzcRrr4AZRdzRBMq8/RSDk=;
        b=qSxEWNXYC5VU43b26rQ1mstkGbF148SIk2hy9l7opcjctrypDp/j0hiiNi3F34jC0a
         SAH7bDD9MWQNDnjycaGyNmt78SG+ojwZIWBG77oJJ6vXrH9uI1+RYTH6xBP4IgM/JGFr
         yt4WIv1wnYKGf4g+PMMPANrKHqbsmEVTVBqiwVpqFxR4MReXqMNrsPYpsG2/ZDShDS03
         fE19Q2GuvDQjll1QD/vMCtGk4O3zmg45AQpHsgojFlskkxxqrrOKQMr54VXhDrLbdNo3
         2WcIkk/qAXRbyeFI1nK1EEP3a01uhOdHG/MGQNM37VV/rJ3c3UH1tfesOC5f+qwiHaFN
         OLGw==
X-Gm-Message-State: APjAAAXxF0VW5ut8vSDdKSvfgJUTz3ws5p+nACR8/9td6d9MOLHpv+0v
        96lSd4qL5XhSM32CzekP6g==
X-Google-Smtp-Source: APXvYqxJpMpphl8ic0lq5+iIIiAn1l1PwDcZCMzifYBDwOG3S/JdkFma5EBVUFSSLbo5Dm1Wgp3QqQ==
X-Received: by 2002:a05:6830:200c:: with SMTP id e12mr8862386otp.127.1573754332574;
        Thu, 14 Nov 2019 09:58:52 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o4sm2042587ota.57.2019.11.14.09.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 09:58:52 -0800 (PST)
Date:   Thu, 14 Nov 2019 11:58:51 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, mark.rutland@arm.com,
        agross@kernel.org, bjorn.andersson@linaro.org,
        marc.w.gonzalez@free.fr, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v9 1/4] dt-bindings: clock: Document external clocks for
 MSM8998 gcc
Message-ID: <20191114175851.GA11664@bogus>
References: <1573591382-14225-1-git-send-email-jhugo@codeaurora.org>
 <1573591466-14296-1-git-send-email-jhugo@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573591466-14296-1-git-send-email-jhugo@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 12, 2019 at 01:44:26PM -0700, Jeffrey Hugo wrote:
> The global clock controller on MSM8998 can consume a number of external
> clocks.  Document them.
> 
> For 7180 and 8150, the hardware always exists, so no clocks are truly
> optional.  Therefore, simplify the binding by removing the min/max
> qualifiers to clocks.  Also, fixup an example so that dt_binding_check
> passes.
> 
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,gcc.yaml        | 47 +++++++++++++++-------
>  1 file changed, 33 insertions(+), 14 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
