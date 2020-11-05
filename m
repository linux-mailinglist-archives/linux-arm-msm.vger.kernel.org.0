Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9CBA2A8549
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Nov 2020 18:47:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731644AbgKERrl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Nov 2020 12:47:41 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:36372 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731595AbgKERrl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Nov 2020 12:47:41 -0500
Received: by mail-oi1-f193.google.com with SMTP id d9so2547445oib.3;
        Thu, 05 Nov 2020 09:47:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=McY2lY34EfAh6fddMPAzH0+MXtKxILa6ScxU/OCG25M=;
        b=tVrB+rOQMs4eAh1FNxwutZ0PyKh7ErKTm1kyFJZsli9MG+9T3deJv909ETggcdMbp/
         FKaGwHzFOHfVg344JyouoH6dKPxkbmXxcfW6ObILfJX079raANbzujk9R+lcp6WC2lor
         5weM1daDdLR4UuD7x77qIuBV6MAAiQmYCJ59YGm4MOXaXxHT1NrjsVPRfQ9ikw1ZcjfL
         owhpvKgglHn1Nwz0wAO6EQ/sfUHj2FYjO/nkk4Xw/ihbMjTolzJk5qyyUX5Vun9PzuvI
         adBX4/+KZFyMQiUzClFLjSyU2JM0YBwGhYhXJPtNN0diN87N/JJRpDGX/K9kLfxfnNih
         T/Wg==
X-Gm-Message-State: AOAM533dJtXLOWJjy65dsODifJxZqF/77jisB7MnheY0pO/bvnPPUd86
        SVApHE5bOVrv+7vxU6kdIw==
X-Google-Smtp-Source: ABdhPJwSZ9grrI3XWBEElWUAwPpB6BjcRmlvLGWUG5aXSTObjnbmwbo3WCozbFSQ6UyC8WViu5uNHA==
X-Received: by 2002:aca:5e03:: with SMTP id s3mr354570oib.125.1604598460170;
        Thu, 05 Nov 2020 09:47:40 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 38sm35743ots.3.2020.11.05.09.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 09:47:38 -0800 (PST)
Received: (nullmailer pid 1540089 invoked by uid 1000);
        Thu, 05 Nov 2020 17:47:38 -0000
Date:   Thu, 5 Nov 2020 11:47:37 -0600
From:   Rob Herring <robh@kernel.org>
To:     Guru Das Srinagesh <gurus@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        David Collins <collinsd@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org,
        Anirudh Ghayal <aghayal@codeaurora.org>,
        devicetree@vger.kernel.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Subject: Re: [PATCH v5 2/3] bindings: pm8941-misc: Add support for VBUS
 detection
Message-ID: <20201105174737.GA1540053@bogus>
References: <cover.1604349076.git.gurus@codeaurora.org>
 <09cc8600ccf884d00d8cfac6af2c5af6cc89e2d8.1604349076.git.gurus@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09cc8600ccf884d00d8cfac6af2c5af6cc89e2d8.1604349076.git.gurus@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 02 Nov 2020 12:34:58 -0800, Guru Das Srinagesh wrote:
> Add interrupt support for reporting VBUS detection status that can be
> detected via a dedicated PMIC pin.
> 
> Signed-off-by: Anirudh Ghayal <aghayal@codeaurora.org>
> Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
