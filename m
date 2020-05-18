Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F323C1D7AE5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2020 16:17:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727006AbgERORh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 10:17:37 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:42242 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726998AbgERORh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 10:17:37 -0400
Received: by mail-il1-f193.google.com with SMTP id 18so1027868iln.9;
        Mon, 18 May 2020 07:17:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=s4TcDNDS3QM/2KVd7294s1MpV8sGjG6xtKJIu72IkFw=;
        b=jrm6oCb+JSL+NzHvRdGWxqGcWr6PtW3U6ZyMn0JziQhq2QWjSp+i4m3JL+jRa6JILt
         t0+jMvTlGtb3JxoWxvZnaado4Yt08gwtBVYdCCLWLMWyWbuCoKO56DBpu+qXcQHu8909
         adYX3xNXCGNOSdW4gGdYzMOblUjzpIajiHgwt9Ff64GMghdH/l6S7KGu9pfo3NIy/V+q
         oLJERjGW2YwWBUsH+GW4KB7AsWsnbt4ybz/RtSqBQIr1Nd5Y7y1cS3UqCZsaDP9ehgRr
         gMIhV9Zo3oAtqYqpOZ1gikEk8u8wAAPcF+DrBVlb8WCJPinSglDRhBY6srpx2Pv/P0fK
         mvyQ==
X-Gm-Message-State: AOAM533b87vGmpWFCBK0gj5q0HwceSAKjOIf+RXsDlmyWEH7F3OgujMl
        SVWPrUMPA3wSIFurjuUDYg==
X-Google-Smtp-Source: ABdhPJzHP8Ro8/4oUA9Fgt5ZOHrfRK+rsvNiPBByP3WgO3+qiK7XcLyuhVX7Th3TGlo7ugCodmENbg==
X-Received: by 2002:a92:c68c:: with SMTP id o12mr14945066ilg.96.1589811456172;
        Mon, 18 May 2020 07:17:36 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id k5sm4353242ilg.55.2020.05.18.07.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:17:35 -0700 (PDT)
Received: (nullmailer pid 2493 invoked by uid 1000);
        Mon, 18 May 2020 14:17:34 -0000
Date:   Mon, 18 May 2020 08:17:34 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, linux-usb@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v6 1/2] dt-bindings: usb: qcom,dwc3: Convert USB DWC3
 bindings
Message-ID: <20200518141734.GA2367@bogus>
References: <1589534960-6973-1-git-send-email-sanm@codeaurora.org>
 <1589534960-6973-2-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589534960-6973-2-git-send-email-sanm@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 15 May 2020 14:59:19 +0530, Sandeep Maheswaram wrote:
> Convert USB DWC3 bindings to DT schema format using json-schema.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  .../devicetree/bindings/usb/qcom,dwc3.txt          | 104 -------------
>  .../devicetree/bindings/usb/qcom,dwc3.yaml         | 162 +++++++++++++++++++++
>  2 files changed, 162 insertions(+), 104 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/qcom,dwc3.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/usb/qcom,dwc3.example.dts:28.13-20: Warning (ranges_format): /example-0/usb@a6f8800:ranges: empty "ranges" property but its #address-cells (2) differs from /example-0 (1)
Documentation/devicetree/bindings/usb/qcom,dwc3.example.dts:28.13-20: Warning (ranges_format): /example-0/usb@a6f8800:ranges: empty "ranges" property but its #size-cells (2) differs from /example-0 (1)

See https://patchwork.ozlabs.org/patch/1290971

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

