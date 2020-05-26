Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 157C11E31FE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2020 00:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391812AbgEZWEu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 May 2020 18:04:50 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:38005 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389342AbgEZWEu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 May 2020 18:04:50 -0400
Received: by mail-il1-f194.google.com with SMTP id q18so963007ilm.5;
        Tue, 26 May 2020 15:04:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4+Nqzubi5qDcEFVMZS+DoVAaOhv2OcfcUjqNZ5zEgxk=;
        b=ApQ484SjAVTbtkk3xEGy0H8dXWY2tucMnYvAZz0ZcICl+D2nyEAsX4TW8ZrhKNH1P0
         N+iBaVTuJmz0vTeWIOktTDvQ4wzreGRilOLx8AqYxX/gbJgycjLJBJkGrfenn6nkwiqM
         UQJOo87EjOy/hhoN3yqAnEPnzieXLe7KIWskbzkoraAFgEjtNlwG04E+p6Qh7Jgy7JMh
         g611Y0Q7qHhqoNDen8WicQScOmc/xtSdiC99F+oe7sIJUtmrcaIw3OPGPu5Yyxw1v4Ch
         1Ff4hsgte8OlEgYGjaq6jbdMPY1XJyrSYP5CKYc33CrDcWKOC58g6C2p9cU17uAzjj76
         TD5w==
X-Gm-Message-State: AOAM531lKTsed/Ao0XoNq2bf2uZrTR/TFZwmMw2Fjsa6rBu7ygx6zWx/
        fuMhG9n+IldFiMW5ncLDWA==
X-Google-Smtp-Source: ABdhPJyiuvVFoCmUphZsk18kZQgyM8mMz45CmBlDHyye6pc29KhRfabK1MRa6/KBIPfc4+r0IKwvCA==
X-Received: by 2002:a05:6e02:801:: with SMTP id u1mr3249749ilm.295.1590530689080;
        Tue, 26 May 2020 15:04:49 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id p1sm578883ilq.67.2020.05.26.15.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 15:04:48 -0700 (PDT)
Received: (nullmailer pid 461819 invoked by uid 1000);
        Tue, 26 May 2020 22:04:47 -0000
Date:   Tue, 26 May 2020 16:04:47 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v7 2/2] dt-bindings: usb: qcom,dwc3: Add compatible for
 SC7180
Message-ID: <20200526220447.GA461055@bogus>
References: <1590075499-21350-1-git-send-email-sanm@codeaurora.org>
 <1590075499-21350-3-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1590075499-21350-3-git-send-email-sanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 21, 2020 at 09:08:19PM +0530, Sandeep Maheswaram wrote:
> Add compatible for SC7180 in usb dwc3 bindings.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks!
