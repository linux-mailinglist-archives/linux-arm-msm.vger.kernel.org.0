Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06D33F08CF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2019 22:55:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729770AbfKEVzv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Nov 2019 16:55:51 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:45516 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729747AbfKEVzv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Nov 2019 16:55:51 -0500
Received: by mail-ot1-f65.google.com with SMTP id r24so2739705otk.12;
        Tue, 05 Nov 2019 13:55:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YELZCQwYPigqOFYaRv7YTPEJ4AJcr13YEeiRSB+FW5s=;
        b=JQomvfY7ZDOp8rgTGeYIuK+BVEJprrYOUwFk8v0+0ofMAKor/Akjs9SO76hDoEVJhR
         ZEcs7NRTwguWdPq4XMdyJ5V2j9UnDhJtmMpbA/RQLtmpVY76S/9hmPoZ6KMPgMdC1Xnh
         Q2x/lhfKjbbAHnbIwLpJDxbP/+E8w8rnP8xS+iWaZShXBiaE2kkX9QsJ5oZ/mE97RVPO
         hqfFQP3Ju06cNOAHk3gK6HomNg4BMOPw4W3zorC1HdATyklDm5fJUSnv3u5NQOVgo2/F
         pJx5vY8lZhkJJ/OWivwDFuxXWjdTbcxJtP9MoQAudh8JxPNM/linMLjpabXeX+O+vK9z
         YdDw==
X-Gm-Message-State: APjAAAVui6QcM3JfQpmauglvhUz613jViGa/9jYt18dA1bd6IWPC26np
        2y0sJrIRjxXvZuCvj8Q18Z91DxU=
X-Google-Smtp-Source: APXvYqy4zjKx1imvVoqgoArtBoZXF2eaAGyn6TXNj1wQ4qDJLn+h46+UfHjeO440F37r29jD4dP9AA==
X-Received: by 2002:a05:6830:2316:: with SMTP id u22mr25596171ote.100.1572990949120;
        Tue, 05 Nov 2019 13:55:49 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 34sm6484839otf.55.2019.11.05.13.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 13:55:48 -0800 (PST)
Date:   Tue, 5 Nov 2019 15:55:47 -0600
From:   Rob Herring <robh@kernel.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette =?iso-8859-1?Q?=A0?= 
        <mturquette@baylibre.com>, David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: Add YAML schemas for the QCOM
 RPMHCC clock bindings
Message-ID: <20191105215547.GA402@bogus>
References: <1572371299-16774-1-git-send-email-tdas@codeaurora.org>
 <1572371299-16774-2-git-send-email-tdas@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1572371299-16774-2-git-send-email-tdas@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 29 Oct 2019 23:18:17 +0530, Taniya Das wrote:
> The RPMHCC clock provider have a bunch of generic properties that
> are needed in a device tree. Add a YAML schemas for those.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,rpmh-clk.txt    | 27 ------------
>  .../devicetree/bindings/clock/qcom,rpmhcc.yaml     | 48 ++++++++++++++++++++++
>  2 files changed, 48 insertions(+), 27 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
