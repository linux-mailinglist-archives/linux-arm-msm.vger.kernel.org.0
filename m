Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6E8C1634A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2020 22:19:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726811AbgBRVT2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Feb 2020 16:19:28 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:40805 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726595AbgBRVT1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Feb 2020 16:19:27 -0500
Received: by mail-ot1-f66.google.com with SMTP id i6so21005868otr.7;
        Tue, 18 Feb 2020 13:19:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XgkRYjMZSy2zFAcHDa4KGpDFkUtjw2hNkoLV9SrG87g=;
        b=H9R33l+h1MFkTvNgoqOgETQUGs/LEhfAIfwy5r0R5KXoCNg3jfMGBEP6VeV0bEKghC
         HP8h48mAO6smA1/bOJdL6SaS80qVNAtlT9lYbAPzCUKkXmRzonL+YzboL6Y5/1BvH8Ye
         Wflm67lvEB2dAr/fVzYb/cdpp2NoajGfmkZ0lwlP/nzcrt8G7svQTPxs+d1xyVQCO9VB
         nLRaearF0ORCbvJNtKoyOQx+fYWiXs5ALwvdjj5nAqeIVlfaMj1rBktpbQwIER/nfYuu
         HR6Kav83D28qJ6KV7hIwBMDH4n+viR5dZPmW+huP44tdszImgDRLmoAhyBLxQXqaeSdk
         iU7g==
X-Gm-Message-State: APjAAAWHNWQ2rc889xc/O0/5Brk+JBuK80gCnLUcoIHwvgLXSb7MdlpG
        Qi5+4/RoggNv9yebzwX6Bw==
X-Google-Smtp-Source: APXvYqx067Jn3haA6964Buxg+JndkTb+lf/jrEZqq63qpLnE/ua7P966IM0TjJlG4ye8i+J20JHvjA==
X-Received: by 2002:a9d:750b:: with SMTP id r11mr17982137otk.310.1582060766950;
        Tue, 18 Feb 2020 13:19:26 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t21sm1750223otr.42.2020.02.18.13.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2020 13:19:26 -0800 (PST)
Received: (nullmailer pid 23228 invoked by uid 1000);
        Tue, 18 Feb 2020 21:19:25 -0000
Date:   Tue, 18 Feb 2020 15:19:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     robh+dt@kernel.org, agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mgautam@codeaurora.org,
        rojay@codeaurora.org, skakit@codeaurora.org, swboyd@chromium.org,
        Akash Asthana <akashast@codeaurora.org>
Subject: Re: [PATCH V4 2/3] dt-bindings: geni-se: Add interconnect binding
 for GENI QUP
Message-ID: <20200218211925.GA23175@bogus>
References: <1581932212-19469-1-git-send-email-akashast@codeaurora.org>
 <1581932212-19469-3-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1581932212-19469-3-git-send-email-akashast@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 17 Feb 2020 15:06:51 +0530, Akash Asthana wrote:
> Add documentation for the interconnect and interconnect-names properties
> for the GENI QUP.
> 
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
