Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A59422B4E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jul 2020 19:31:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727044AbgGWRap (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jul 2020 13:30:45 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:33031 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726666AbgGWRap (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jul 2020 13:30:45 -0400
Received: by mail-il1-f196.google.com with SMTP id a11so5030248ilk.0;
        Thu, 23 Jul 2020 10:30:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3Ow5vY26aW+rLwamS/6/cMT0oAqoc9a80Oft+f/ONOw=;
        b=VCK+QO6lqIEdA3bz0T2ZDT9Gj1Dq79GYmeWaJfbPRMJVcC+9pQnrzivjReHbVY6vwa
         u+FYdiPZSbV49X8kw9oL3MJIsiA9OGICt2mKj6UdcQUiz6UU7QmzgiMVVrMnf6Dx/wPN
         DbqJZNix++0rz8lH+c1sCMscp9X8addJAtSsBmqkkhJBo6kpDcZiHYWGhM/U4rd9HhE8
         TkTT/xlZ2O13VgXtPLC1rAHg4ApaRNB+KtkNppV1sOTC+OS1pAVKlYoMwWwvvWVy7y+E
         Fg3wuE/NYhALUPuGgAun77ZbuL43L/TvhHwwH41ZvdunZNbFBNDZYUQOiuCyWKcLYP+F
         u3NA==
X-Gm-Message-State: AOAM533qCg0TNFXtu8RTV3MR0P4417Y2rHf/q7ZB23RSbPzWzTBOQBuU
        KEfh000qSaTapI4t5hNFjw==
X-Google-Smtp-Source: ABdhPJxBOQrG/3mEEEQzyqanTv7H+CFMIOya1grP238Ldzx6PJ0bIs5hUr8gokRkmSWtY5N/Fyyr/A==
X-Received: by 2002:a05:6e02:606:: with SMTP id t6mr5870185ils.181.1595525444202;
        Thu, 23 Jul 2020 10:30:44 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id e84sm187809ill.60.2020.07.23.10.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2020 10:30:43 -0700 (PDT)
Received: (nullmailer pid 573433 invoked by uid 1000);
        Thu, 23 Jul 2020 17:30:42 -0000
Date:   Thu, 23 Jul 2020 11:30:42 -0600
From:   Rob Herring <robh@kernel.org>
To:     Kathiravan T <kathirav@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        sricharan@codeaurora.org, sivaprak@codeaurora.org,
        agross@kernel.org, linux-arm-msm@vger.kernel.org,
        broonie@kernel.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, lgirdwood@gmail.com
Subject: Re: [PATCH V3 1/4] dt-bindings: soc: qcom: Add IPQ6018 compatible
Message-ID: <20200723173042.GA573384@bogus>
References: <1595225543-12127-1-git-send-email-kathirav@codeaurora.org>
 <1595225543-12127-2-git-send-email-kathirav@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1595225543-12127-2-git-send-email-kathirav@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 20 Jul 2020 11:42:20 +0530, Kathiravan T wrote:
> This patch adds the dt-binding for the rpm on the Qualcomm IPQ6018
> platform.
> 
> Signed-off-by: Kathiravan T <kathirav@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
