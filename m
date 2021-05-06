Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7004937567B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 May 2021 17:22:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235163AbhEFPW4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 May 2021 11:22:56 -0400
Received: from mail-oi1-f182.google.com ([209.85.167.182]:37540 "EHLO
        mail-oi1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235162AbhEFPWy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 May 2021 11:22:54 -0400
Received: by mail-oi1-f182.google.com with SMTP id k25so5823342oic.4;
        Thu, 06 May 2021 08:21:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qiQcHqOYIXFOrcNRY8skrVa1gR2hS65cWXM4biN5VPY=;
        b=EeLSWeF9A9Ooxh/aBcVD2nSPvh9l1d4l1Wfflc9ExJGENpVttno8P+q+newYcAib04
         x2MOHymGGOIHqImHVc0wcKfAyQ9OV+Vo6Yst94r7uBwfOPF6g/fyGK5RTtd4yadqzE8B
         +1BCBcz5mOSvvy8+4IxzxHBgv+OomHWqWg3cESwXbQqjMbjthm615sSTqqBpvCEmlPz0
         A9toYp/7ZWReI45dFgYsRZfrifh6jk26pbJh2RJTcS93iXk2CfHxf5NyNvtUxEleqh0I
         JI/+bNi9vzmiFYkY1MJH6UbOX+9dGpBwEH57qut+wfK8+SeW1/X4kE8qDNXIWOnVN5Qh
         E5HA==
X-Gm-Message-State: AOAM531KB1sEzmlcHzcIWoLGzXSkcd6JKotkqu9OWQctloo0ds9QoNs1
        sFxxmFmVBTwANnD7lSTzcqj1M3DePg==
X-Google-Smtp-Source: ABdhPJxzS3TucSyd8reOfoWjifggE2ht4oN1VQrDwH5uYjZijgP79SailQKtHuANBFNTrYxKe8inAA==
X-Received: by 2002:aca:e003:: with SMTP id x3mr3693717oig.118.1620314516297;
        Thu, 06 May 2021 08:21:56 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x11sm8368otr.36.2021.05.06.08.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 08:21:55 -0700 (PDT)
Received: (nullmailer pid 349670 invoked by uid 1000);
        Thu, 06 May 2021 15:21:54 -0000
Date:   Thu, 6 May 2021 10:21:54 -0500
From:   Rob Herring <robh@kernel.org>
To:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH 3/4] dt-bindings: clock: qcom: rpmcc: Document MSM8226
 compatible
Message-ID: <20210506152154.GA349630@robh.at.kernel.org>
References: <20210502122027.9351-1-bartosz.dudziak@snejp.pl>
 <20210502122027.9351-4-bartosz.dudziak@snejp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210502122027.9351-4-bartosz.dudziak@snejp.pl>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 02 May 2021 14:20:26 +0200, Bartosz Dudziak wrote:
> Add the dt-binding for the RPM Clock Controller on the MSM8226 SoC.
> 
> Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmcc.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
