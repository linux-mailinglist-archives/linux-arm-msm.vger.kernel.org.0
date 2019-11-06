Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5307F1BC9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 17:56:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732258AbfKFQ4f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 11:56:35 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:35477 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732257AbfKFQ4f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 11:56:35 -0500
Received: by mail-ot1-f66.google.com with SMTP id z6so21440543otb.2;
        Wed, 06 Nov 2019 08:56:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bKw0VnnNhxLDCfwgkMNCot+CxHtvj7koN2Tbmbg1cOw=;
        b=fm3vTN8eRQ8DisXG10MynigUvTppWhqVDbDkU812wTUV/lv7l9bytSm6Ko8cBpIfO2
         SgPbphbgasBw68+FshnIokXUuBjqyJx0vUu0OrDVW4JEQ0wHVv6B4+x0zhxT7ZmVFDpC
         TtddQqLHCjAdEL6rCJRY5b+iUkupoVgp5jXdqYFQvyQHpBvhiTTUyByHScZcX6nSiSbB
         S2zm0ebGa+QmBA3WLarkZtCd1t+f/CQ6WPbWjzqyyDRKYQY1QleMO7X9sYRCs+5ZwYlp
         +NzocnNu+0XTI2hciVZSuAg2PuD7CQf/MH+ohXQKvlpd/mfkd2glNGH+juxtmpRADp2h
         Sqrw==
X-Gm-Message-State: APjAAAWQa1IocxhqxD/c/DcwE94jOkojZgm/APBvfgeJ8UfDS2HmUrd7
        eIoly9WoNO3RbYy6p4RWBA==
X-Google-Smtp-Source: APXvYqxwsNDVP+nSwdBJITYQaV3J9Tytq+ZUv8LySKHZGMEWBhzTrOvwwhFD75qIHPp0+x1ihlXTRA==
X-Received: by 2002:a05:6830:1d74:: with SMTP id l20mr2613599oti.111.1573059393967;
        Wed, 06 Nov 2019 08:56:33 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d205sm2583526oig.28.2019.11.06.08.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 08:56:33 -0800 (PST)
Date:   Wed, 6 Nov 2019 10:56:32 -0600
From:   Rob Herring <robh@kernel.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        swboyd@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v4 08/14] dt-bindings: qcom,pdc: Add compatible for sc7180
Message-ID: <20191106165632.GA15103@bogus>
References: <20191106065017.22144-1-rnayak@codeaurora.org>
 <20191106065017.22144-9-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191106065017.22144-9-rnayak@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed,  6 Nov 2019 12:20:11 +0530, Rajendra Nayak wrote:
> Add the compatible string for sc7180 SoC from Qualcomm.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Cc: Lina Iyer <ilina@codeaurora.org>
> Cc: Marc Zyngier <maz@kernel.org>
> ---
>  .../devicetree/bindings/interrupt-controller/qcom,pdc.txt      | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.
