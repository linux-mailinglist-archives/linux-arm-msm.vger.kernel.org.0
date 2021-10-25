Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A97B439E3F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Oct 2021 20:16:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231971AbhJYSTS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 14:19:18 -0400
Received: from mail-oi1-f174.google.com ([209.85.167.174]:37693 "EHLO
        mail-oi1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231671AbhJYSTS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 14:19:18 -0400
Received: by mail-oi1-f174.google.com with SMTP id o83so16782458oif.4;
        Mon, 25 Oct 2021 11:16:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=xi7P1Rrna9Jet22xDzvAkW1hYhgZ5q2ACsTSGvVAVYU=;
        b=2X/Pd+78yAW2xH9n2rgE+0y+w5faqTwE8sY8E971X0p0KdQH8Q7w/ajVSC/vzXKi08
         dwkO41ebTMg4whXgoPkDDoEUJcJGxPypr92Nycl2jPTrGLdHnDyFnxkzu+KPG7peHCWb
         VOGoSCz0Rl2j/Ejm3aoduQQg6mjoGIEStLuIiKxDcgiaLed09wJLNs6iadeZAqI3XoHW
         bqKsgD4Xgly1Q/lzuYIPZP0GhOhXmf2BsC9b1PNLSEIvSA6YSceddxjicmRAk1zK/sZO
         eNvK93zpLzxAs+fWlAPMnJBPbQCGOv0kTL4sg0pHC+RSU9jq3R1BXdpXPh4w/KFtmHun
         ObHg==
X-Gm-Message-State: AOAM531+CUDvynMI3h8jtduQcpakR6H3Zn491uJcwIQRHNRewFv7/wZb
        uzNfDw9OiEuvlagKIZDiQA==
X-Google-Smtp-Source: ABdhPJzO0ZaESWJKCka3JkpLozhsZTIWwkp8vrWrZGosJ5NjJETw1tpHO/GvuST2HiDVPhnZAhbadQ==
X-Received: by 2002:a05:6808:1aa6:: with SMTP id bm38mr15728806oib.163.1635185815303;
        Mon, 25 Oct 2021 11:16:55 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id d25sm3689068otp.33.2021.10.25.11.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 11:16:54 -0700 (PDT)
Received: (nullmailer pid 824863 invoked by uid 1000);
        Mon, 25 Oct 2021 18:16:53 -0000
From:   Rob Herring <robh@kernel.org>
To:     Sandeep Maheswaram <quic_c_sanm@quicinc.com>
Cc:     quic_pkondeti@quicinc.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-usb@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Doug Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>, quic_ppratap@quicinc.com
In-Reply-To: <1635152851-23660-2-git-send-email-quic_c_sanm@quicinc.com>
References: <1635152851-23660-1-git-send-email-quic_c_sanm@quicinc.com> <1635152851-23660-2-git-send-email-quic_c_sanm@quicinc.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: qcom,dwc3: Add multi-pd bindings for dwc3 qcom
Date:   Mon, 25 Oct 2021 13:16:53 -0500
Message-Id: <1635185813.742664.824862.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 25 Oct 2021 14:37:29 +0530, Sandeep Maheswaram wrote:
> Add multi pd bindings to set performance state for cx domain
> to maintain minimum corner voltage for USB clocks.
> 
> Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
> ---
> v2:
> Make cx domain mandatory.
> 
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml: properties:power-domains: 'oneOf' conditional failed, one must be fixed:
	[{'description': 'cx power domain'}, {'description': 'USB gdsc power domain'}] is too long
	[{'description': 'cx power domain'}, {'description': 'USB gdsc power domain'}] is too short
	False schema does not allow 2
	1 was expected
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml: ignoring, error in schema: properties: power-domains
warning: no schema found in file: ./Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
Documentation/devicetree/bindings/usb/qcom,dwc3.example.dt.yaml:0:0: /example-0/soc/usb@a6f8800: failed to match any schema with compatible: ['qcom,sdm845-dwc3', 'qcom,dwc3']
Documentation/devicetree/bindings/usb/qcom,dwc3.example.dt.yaml:0:0: /example-0/soc/usb@a6f8800: failed to match any schema with compatible: ['qcom,sdm845-dwc3', 'qcom,dwc3']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1545621

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

