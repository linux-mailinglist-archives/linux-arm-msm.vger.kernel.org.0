Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A7AD285222
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Oct 2020 21:11:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727002AbgJFTLp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Oct 2020 15:11:45 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:44605 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726760AbgJFTLo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Oct 2020 15:11:44 -0400
Received: by mail-ot1-f65.google.com with SMTP id a2so13313410otr.11;
        Tue, 06 Oct 2020 12:11:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DY9Zt1ry2lIlzxDhuWgUN21EOi0oppFyFtZImZAafQM=;
        b=saabmVv01kplQwZgaTa4RNwuEuZQnYUnTRn1Q9u1n7eLN2kBgvUVPs/XDiH6ZSzFwN
         1C63JedHrUsc8sifxQTAUYB8xNnqJ8GJ4BiC7+gO1r7/ZRPecfuCOcda+jPn1EWjCHFw
         yoN0tfHQAMKtrOq2AwiWsiJa8x0v/Hx049rsv4USlAOxbVmEMiGO5ERK4UdVMq/6+tZy
         R/Hrp+YFMedno0kMM09qdbWc6T4Q9PmwMVASdBYMPCfgn7S1Ji6Vn4DqVEb6K+tENg6Z
         2wCRhJbw3ZA3R2FlUA+msmwAcThdgxRzAZUZpuqM86ZM1pur5gQ+lpbnt6t7fy5ccsVy
         wamg==
X-Gm-Message-State: AOAM532k0b0CMsV/mIxuU54SuFxdqzChJl4YXee9NhsTMKbBaeIh09Iq
        QvhYyD0XWzV47emESJ05RA==
X-Google-Smtp-Source: ABdhPJx40W/PBkaFIunLkJoOPrmASxxYMlhvc4CiCp4bvqQwjnfY/9kwcOObBZxuqDLAbFl0N3sVeA==
X-Received: by 2002:a05:6830:19ce:: with SMTP id p14mr3983708otp.315.1602011504109;
        Tue, 06 Oct 2020 12:11:44 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f13sm306710oij.0.2020.10.06.12.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 12:11:43 -0700 (PDT)
Received: (nullmailer pid 2659280 invoked by uid 1000);
        Tue, 06 Oct 2020 19:11:42 -0000
Date:   Tue, 6 Oct 2020 14:11:42 -0500
From:   Rob Herring <robh@kernel.org>
To:     Souradeep Chowdhury <schowdhu@codeaurora.org>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH V1 1/3] dt-bindings: msm: Add LLCC for SM8150
Message-ID: <20201006191142.GA2659248@bogus>
References: <cover.1601452132.git.schowdhu@codeaurora.org>
 <141e7cf03932859243edec83451c04c655ba640b.1601452132.git.schowdhu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <141e7cf03932859243edec83451c04c655ba640b.1601452132.git.schowdhu@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 30 Sep 2020 13:44:12 +0530, Souradeep Chowdhury wrote:
> Add LLCC compatible for SM8150 SoC.
> 
> Signed-off-by: Souradeep Chowdhury <schowdhu@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
