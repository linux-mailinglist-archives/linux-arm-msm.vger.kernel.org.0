Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35F1921E58A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2020 04:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726478AbgGNCRs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jul 2020 22:17:48 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:42336 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726372AbgGNCRs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jul 2020 22:17:48 -0400
Received: by mail-il1-f193.google.com with SMTP id t27so12956270ill.9;
        Mon, 13 Jul 2020 19:17:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oFdPFI+MbNBnmxHM20F+AOCXori4Lgn3RYqynR+OBf8=;
        b=SNw32SyAJECuugIEwvc8NSGCKGR5vq1ViOcJoHzNqUa0pbY9beGF1Cdz9fgkYBzcXK
         myoZSk46tOkBSljDNn5vYoyqrZzgyODl2tB0RU2bnBzQvO6VKdcAcJXm0J02NOiJTwbn
         eLEA7fYHTcYYEFezP9B7hUJllnjz+Pe296yDLUHzymw1Tgz38iaFOXUR8KTKq6LX+ceG
         Jrc2x51dlRh2nDQKssi6GvPUk3pEsfMiea7FnK76fz8yBge1T6My+GCzAivQJwdJa85E
         Yfy20Y71LW7ujnasxTpBOvRxWLAWPv2Mi8MclpggzDXWmYRAm/Q11CY/UH3MA/IxPR5N
         QEXw==
X-Gm-Message-State: AOAM531KORd9LINceY7Sx38yLN4TsXdgbB0X/rxjRM+MBdTGAvCdkXQQ
        SNVGeqMUnEGVgDO11uXGdA==
X-Google-Smtp-Source: ABdhPJwwwbrRzUvoKcbbV4zCrrZnyCRjMCDpLDC5U2L/wfozkEChDnPIWXBNDDoEO/fbqqWxsE1aOQ==
X-Received: by 2002:a92:d2c6:: with SMTP id w6mr2628347ilg.24.1594693067006;
        Mon, 13 Jul 2020 19:17:47 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id i84sm9543027ill.30.2020.07.13.19.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 19:17:46 -0700 (PDT)
Received: (nullmailer pid 1144515 invoked by uid 1000);
        Tue, 14 Jul 2020 02:17:45 -0000
Date:   Mon, 13 Jul 2020 20:17:45 -0600
From:   Rob Herring <robh@kernel.org>
To:     Kathiravan T <kathirav@codeaurora.org>
Cc:     lgirdwood@gmail.com, robh+dt@kernel.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, sivaprak@codeaurora.org,
        broonie@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH V2 5/6] dt-bindings: soc: qcom: convert the SMD-RPM
 document to YAML schema
Message-ID: <20200714021745.GA1144468@bogus>
References: <1592889472-6843-1-git-send-email-kathirav@codeaurora.org>
 <1592889472-6843-6-git-send-email-kathirav@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1592889472-6843-6-git-send-email-kathirav@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 23 Jun 2020 10:47:51 +0530, Kathiravan T wrote:
> Convert the qcom,smd-rpm.txt document to YAML schema
> 
> Signed-off-by: Kathiravan T <kathirav@codeaurora.org>
> ---
>  .../devicetree/bindings/soc/qcom/qcom,smd-rpm.txt  | 63 ---------------
>  .../devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml | 92 ++++++++++++++++++++++
>  2 files changed, 92 insertions(+), 63 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
