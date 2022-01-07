Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3D06486F31
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jan 2022 01:55:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236259AbiAGAzY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jan 2022 19:55:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230226AbiAGAzX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jan 2022 19:55:23 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A24B4C061245
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jan 2022 16:55:23 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id s73so6173538oie.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jan 2022 16:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PPHN7dIp4QC+dIELGI0e4PB8xgBekSRxt9hWBqYZaeQ=;
        b=QAoJfOBrBgvrMUWejWpVu+DGP0fKi1jKKzzm0JxDDhqqdjpvInSeW2fQwwOZnN/44N
         c9OjRqHLLopjfcrSBsptXfUcmjG2js+eW8+gv/n5Qa7hA8vDEYx6QpbShaiHjfrDYNAy
         bKWR1MpZM0RvtS04wQaTyVhyhVd5BwrrhmwYUqwOxELjco1lKVtOYPKGQqR3CjOxDIUo
         LsHxt5cLZW2PGLAbyqeOsD19xEXhTTgUtGaHNn/ySKyeBSb692CDquAmy3gx08FHyPvE
         F/o2xfGaTrOwY46ssKOxkf0rIyWzi3qa/GnfGbIu+ksWxdFG3v264RLuRoK3pgkCRjhj
         Awjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PPHN7dIp4QC+dIELGI0e4PB8xgBekSRxt9hWBqYZaeQ=;
        b=msplb3BzzQ0Sa40AaGiNL8xsNbhEBa1FUnGKsanWriGCP0V7PlqMdAejZ0IjKZ0QDC
         O1TO27xgSosfKBnR1wU8HevixGh7SzyxFyXTbqv+YLmoMz3Ww+b35rm6o2SEc4Tg+luU
         /3oTjbImyIHfrC8NVaIsToowa6zxyEsP2957F3U3gjDmYbnxL9ijsfmXe/EaGLIu1nEX
         URR6S2r27YycHIkw3pKTu6EjruMVm+jEPg+IsXkikM8zBrsakphRFm0LJACykGutJanb
         jMMCFA59/jVjbo6/7o+n/QC94BHyVIDPiLqQgbVpmVZN0IfMaTBMZWlYqtBViltV72C7
         Ifvg==
X-Gm-Message-State: AOAM530vTw2Tw1MCQ3UVsX7p5oxeMiCXu07HlxJ7IqhZ0Rm4I92FVoL6
        6edQ1qmfJv2Ajd7LnZ+D7PtHkQ==
X-Google-Smtp-Source: ABdhPJzreEyFRJ4mudEoHFIkqdyi66BzGsimcD1Jb7Q1Uwvgz9R2jmPCaxSvZBU0jpuX2qjcPAh0kQ==
X-Received: by 2002:aca:1214:: with SMTP id 20mr6675134ois.126.1641516922985;
        Thu, 06 Jan 2022 16:55:22 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w20sm5557otl.40.2022.01.06.16.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 16:55:22 -0800 (PST)
Date:   Thu, 6 Jan 2022 16:56:10 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, pure.logic@nexus-software.ie,
        greg@kroah.com, linux-kernel@vger.kernel.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, satyap@codeaurora.org,
        pheragu@codeaurora.org, rnayak@codeaurora.org,
        sibis@codeaurora.org, saiprakash.ranjan@codeaurora.org
Subject: Re: [PATCH V3 3/7] bindings: usb: dwc3: Update dwc3 properties for
 EUD connector
Message-ID: <YdePqpJjIiPAuHlJ@ripper>
References: <cover.1641288286.git.quic_schowdhu@quicinc.com>
 <163f4d977fb6a0d80d8fd8d358991aeeb58d31a6.1641288286.git.quic_schowdhu@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <163f4d977fb6a0d80d8fd8d358991aeeb58d31a6.1641288286.git.quic_schowdhu@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 04 Jan 03:58 PST 2022, Souradeep Chowdhury wrote:

> Add the connector property for dwc3 node. This connector can
> be used to role-switch the controller from device to host and
> vice versa.
> 
> Signed-off-by: Souradeep Chowdhury <quic_schowdhu@quicinc.com>
> ---
>  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> index 078fb78..9382168 100644
> --- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> @@ -318,6 +318,12 @@ properties:
>      items:
>        enum: [1, 4, 8, 16, 32, 64, 128, 256]
>  
> +  connector:

The dwc3 isn't the connector, so I think you should put a ports {} in
the dwc3 and link that to the connector that is described elsewhere.

Regards,
Bjorn

> +    type: object
> +    $ref: /connector/usb-connector.yaml#
> +    description:
> +      Connector for dual role switch, especially for "eud-usb-c-connector"
> +
>  unevaluatedProperties: false
>  
>  required:
> -- 
> 2.7.4
> 
