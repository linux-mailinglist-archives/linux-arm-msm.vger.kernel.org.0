Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2C4042143B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 18:37:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237206AbhJDQjG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 12:39:06 -0400
Received: from mail-ot1-f43.google.com ([209.85.210.43]:43910 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237178AbhJDQjG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 12:39:06 -0400
Received: by mail-ot1-f43.google.com with SMTP id x33-20020a9d37a4000000b0054733a85462so22307367otb.10;
        Mon, 04 Oct 2021 09:37:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yXdfDKIRSjWNIHGf2GeNCQna0ZEGH+oW5o42/i9ekhg=;
        b=PSIR2APqIY2QkztOxdB2fKufn0KzF826/IcSwjQnTd1KtG98Yz75LrAMe7gf9gSmqk
         RjMwDUuCZX/n8NrngRTP3WnWewFtNpXZ2OcbNZDjkZsSZeNa2Omb0wkJ1xdnzPaS5l/y
         lic0sEQepETyVI87Hxc3vhq2ADBDWZgv1o30ewGqB/CHZtC4yeb2pR0kAqOFyin4/hIQ
         EGzHhjfexkj36n65n7nm61uGmr+g1/kNCs5vjS4XSHmKlx97ahC/yY4RfiZXT/9ZNnCM
         agUcdlAqS4BHCG9QGpcx2KeZfmxspakDlgP+QFUhxOMI9e/32mHk9JiV122qhaq4YXDb
         Etsw==
X-Gm-Message-State: AOAM531ThcKwnavljq6F12yN98XMSfzqqDrOd/kXf8e7Is276Ha/iQIL
        FzuFk87gX/ov4gsXvuDSnw==
X-Google-Smtp-Source: ABdhPJwQeu5GQkOhwdultlP8GZAfwsFJamVDEnHx3HwKXq9slIXZcX4Ve7cxU63r6uzg0buHOFtWyw==
X-Received: by 2002:a05:6830:410b:: with SMTP id w11mr10073772ott.210.1633365436517;
        Mon, 04 Oct 2021 09:37:16 -0700 (PDT)
Received: from robh.at.kernel.org ([66.90.148.213])
        by smtp.gmail.com with ESMTPSA id l22sm2993874otr.63.2021.10.04.09.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 09:37:15 -0700 (PDT)
Received: (nullmailer pid 1434458 invoked by uid 1000);
        Mon, 04 Oct 2021 16:37:09 -0000
Date:   Mon, 4 Oct 2021 11:37:09 -0500
From:   Rob Herring <robh@kernel.org>
To:     Souradeep Chowdhury <schowdhu@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bryan O'Donoghue <pure.logic@nexus-software.ie>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg KH <greg@kroah.com>, linux-kernel@vger.kernel.org,
        ckadabi@codeaurora.org, tsoni@codeaurora.org,
        bryanh@codeaurora.org, psodagud@codeaurora.org,
        satyap@codeaurora.org, pheragu@codeaurora.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH V0 1/7] dt-bindings: connector: Add property for eud type
 c connector
Message-ID: <YVsttQySDnaXxOuI@robh.at.kernel.org>
References: <cover.1633343547.git.schowdhu@codeaurora.org>
 <246c9d24da27b6ce91d5f1e536fa96ac5656a0b2.1633343547.git.schowdhu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <246c9d24da27b6ce91d5f1e536fa96ac5656a0b2.1633343547.git.schowdhu@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 04, 2021 at 04:46:19PM +0530, Souradeep Chowdhury wrote:
> Added the property for EUD(Embedded USB Debug) connector.Added
> the "reg" and "interrupts" property which is needed for EUD.

You are going to need a better explanation of this h/w.

> 
> Signed-off-by: Souradeep Chowdhury <schowdhu@codeaurora.org>
> ---
>  .../devicetree/bindings/connector/usb-connector.yaml      | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> index 7eb8659..908129f 100644
> --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
> +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> @@ -30,6 +30,21 @@ properties:
>            - const: samsung,usb-connector-11pin
>            - const: usb-b-connector
>  
> +      - items:
> +          - enum:
> +              - qcom,sc7280-usb-connector-eud
> +          - const: qcom,usb-connector-eud
> +          - const: usb-c-connector
> +
> +  reg:
> +    items:
> +      - description: EUD Base Register Region
> +      - description: EUD Mode Manager Region

A connector node represents the physical connector on a board. That 
can't really be an MMIO peripheral. Maybe you need a node for EUD and 
then it should have a connector child node? Don't really know without 
understanding this h/w.

> +
> +  interrupts:
> +    description:
> +      EUD interrupt
> +
>    label:
>      description: Symbolic name for the connector.
>  
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
> 
