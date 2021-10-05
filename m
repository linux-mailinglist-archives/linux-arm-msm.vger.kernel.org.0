Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDA00423274
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 22:56:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236382AbhJEU6K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 16:58:10 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:35220 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236403AbhJEU6J (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 16:58:09 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633467378; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=d2UIVnPOW3ElF02gfggo+xeMDHqG4QtmTz1NBPCyNOc=;
 b=NBQuKFM2FQSKsTb8Q2ws5vvVZvtHJhnTvATqTSJnXhoYhMJ1xkJMiNAuyJcwW2r010O+vKEc
 VkPXfO7cVnanRe5/jAqg0fFRC7gESnModI2xFpreKadPNRF0QtSrPyHj2nTlSAqOBLUEJR7+
 db5UhReZ6TPGvyOtKgcOqaZEt0w=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 615cbbf29ebaf35aaa14b506 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 05 Oct 2021 20:56:18
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 60C9DC4361B; Tue,  5 Oct 2021 20:56:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6416DC43460;
        Tue,  5 Oct 2021 20:56:16 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 05 Oct 2021 13:56:16 -0700
From:   abhinavk@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [Freedreno] [PATCH v3 1/5] dt-bindings: msm/dp: Change reg
 definition
In-Reply-To: <20211001174400.981707-2-bjorn.andersson@linaro.org>
References: <20211001174400.981707-1-bjorn.andersson@linaro.org>
 <20211001174400.981707-2-bjorn.andersson@linaro.org>
Message-ID: <78cc9c0faafcab3375f74a4f52790a52@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-10-01 10:43, Bjorn Andersson wrote:
> reg was defined as one region covering the entire DP block, but the
> memory map is actually split in 4 regions and obviously the size of
> these regions differs between platforms.
> 
> Switch the reg to require that all four regions are specified instead.
> It is expected that the implementation will handle existing DTBs, even
> though the schema defines the new layout.
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
> 
> Changes since v2:
> - None
> 
>  .../bindings/display/msm/dp-controller.yaml         | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git
> a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index d89b3c510c27..6bb424c21340 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -19,7 +19,12 @@ properties:
>        - qcom,sc7180-dp
> 
>    reg:
> -    maxItems: 1
> +    items:
> +      - description: ahb register block
> +      - description: aux register block
> +      - description: link register block
> +      - description: p0 register block
> +      - description: p1 register block
> 
>    interrupts:
>      maxItems: 1
> @@ -99,7 +104,11 @@ examples:
> 
>      displayport-controller@ae90000 {
>          compatible = "qcom,sc7180-dp";
> -        reg = <0xae90000 0x1400>;
> +        reg = <0xae90000 0x200>,
> +              <0xae90200 0x200>,
> +              <0xae90400 0xc00>,
> +              <0xae91000 0x400>,
> +              <0xae91400 0x400>;
>          interrupt-parent = <&mdss>;
>          interrupts = <12>;
>          clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
