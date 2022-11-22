Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CEC3633EE7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Nov 2022 15:28:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233139AbiKVO2i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Nov 2022 09:28:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231808AbiKVO2h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Nov 2022 09:28:37 -0500
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 826E26316F
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Nov 2022 06:28:36 -0800 (PST)
Received: by mail-il1-x136.google.com with SMTP id h2so6483337ile.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Nov 2022 06:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gzHNTCuPBl1243bm48FKjt2m0TJt4ZAgEwgFxeyfelg=;
        b=AL3TCWiq8qz85gebwtmflSjU1TeY7vO9uOjerKfsr2hpsUEbbAdb0sqdA67uvzQ9Ul
         2yOt1LsxjMfUGlR10Aa+2x4LTc+feZY0fLlDlrVwOpo1/pavzg0bx3YnicgigF7Caz06
         rt1nVAb5bpishJPCpgh+eHrsesx3lf597h5C0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gzHNTCuPBl1243bm48FKjt2m0TJt4ZAgEwgFxeyfelg=;
        b=0iZf4vR1D0JpiCKZkxZGcI701reBopMaXVgiCcFvE5snC+Lz3dXwG3v0UTXsNtbRim
         gQWKT4aD7uaPvu6LcOtRNNlYZkYSqsFk0tfh+MJ4z8C6WvSeIOmaaajsxSj5ynMCyeZ2
         tqnnMpkl4F6flb2lSTOMlH9YihiiZrLnyla1A3eUOWfJeYHZRrEg2/j6D632QhY7bxb7
         ECLgXeFj04nbbDn4iADy25MROm2yilTxp3NRBZs5gSwd01ej3VxD2hJUOk/SR9NEQ7pH
         iiKjHwPsbwSLhl6rI2/4MHPKI0ThtQIM+cOa+aPpUJFfJHNwkYYASqwZIvBoigflc3fA
         ce7g==
X-Gm-Message-State: ANoB5pmewUrm3UpBgURwMfq0IvwCoedNiDBUJBsSWp5YFu2fg9/MMv5/
        SBSRtmCmCNjR9kn+9+bJF3EhKA==
X-Google-Smtp-Source: AA0mqf5gm7VUPG1g1odiwwIbuTVfM7E/P5h6sxqOsZuLoFOtjNCNF/RBNtatfOLOK9rJX+Jum4PaWQ==
X-Received: by 2002:a92:1912:0:b0:302:5c57:c19d with SMTP id 18-20020a921912000000b003025c57c19dmr2821667ilz.226.1669127315866;
        Tue, 22 Nov 2022 06:28:35 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id r13-20020a92440d000000b00300df8bfcf5sm4837898ila.14.2022.11.22.06.28.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Nov 2022 06:28:35 -0800 (PST)
Date:   Tue, 22 Nov 2022 14:28:35 +0000
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Owen Yang <ecs.taipeikernel@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Bob Moragues <moragues@chromium.org>,
        Harvey <hunge@google.com>, Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Adding DT binding for
 zombie
Message-ID: <Y3zck7tPA5WFd0p1@google.com>
References: <20221122203635.v2.1.Ie05fd439d0b271b927acb25c2a6e41af7a927e90@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221122203635.v2.1.Ie05fd439d0b271b927acb25c2a6e41af7a927e90@changeid>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On which tree is this series based? My earlier reply bounced for Bjorn's
old Linaro e-mail address, which suggests that the series might be based
on an older kernel tree (maybe downstream Chrome OS v5.15?). Please make
sure to base patches to upstream lists on the corresponding maintainer
tree/branch or a recent kernel version/rc.

On Tue, Nov 22, 2022 at 08:37:02PM +0800, Owen Yang wrote:
> Add an entry in the device tree binding for sc7280-zombie.
> 
> Documentation/devicetree/bindings/arm/qcom.yaml
> 
> Signed-off-by: Owen Yang <ecs.taipeikernel@gmail.com>
> ---
> 
> Changes in v2:
> - Move binding item to Google series bottom.
> - Modify DT file for zombie.
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index c15a729a6852..f617923f7485 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -538,6 +538,16 @@ properties:
>            - const: google,villager-sku512
>            - const: qcom,sc7280
>  
> +      - description: Google Zombie (newest rev)
> +        items:
> +          - const: google,zombie
> +          - const: qcom,sc7280
> +
> +      - description: Google Zombie with LTE (newest rev)
> +        items:
> +          - const: google,zombie-sku512
> +          - const: qcom,sc7280
> +
>        - items:
>            - enum:
>                - xiaomi,lavender
> -- 
> 2.17.1
> 
