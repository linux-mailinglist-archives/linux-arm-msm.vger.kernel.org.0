Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D265222B84
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jul 2020 21:06:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729541AbgGPTGK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jul 2020 15:06:10 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:44962 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729459AbgGPTGK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jul 2020 15:06:10 -0400
Received: by mail-io1-f66.google.com with SMTP id i4so7149489iov.11;
        Thu, 16 Jul 2020 12:06:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=v8Lw8iRcUbfIMmEZuvabApUaprnK5KPvjBZIB8JMFTM=;
        b=U75dVo2euOX69W33ovc6jDak4z4iagCHiRfX0THI7lmzbpbR6UYBSpebnh8V3SUobO
         U/cv8z+YFnh9NlXjwbU+r4Gn35ar9CCbhVU7xhYksjEcDIo/NV8Y6XLNW9i4t0jygP6z
         RJaLCvLJuo9/iHmGW1V52HSX37uetkesbcUNbvqDHsu4bpNbfGdFImnfukKnpqmfzgn6
         qy70qoW5ftnKWnMEnv/XUFmL9axDRmRoc6U++4EJ0WcoIZmrt8Zp17j8cLiGp15q6vEr
         Kyr9XxSeXNt2jotsdPFLGhwQj4W9kDLIsWM2d5Q6bqWcf+tj63QXRbscEQmAdbfkMLSu
         ANvQ==
X-Gm-Message-State: AOAM533H5x6KWlfr+aEqMQwvKyYiBq0Ouli6hEcTBNFbxwEA4ynDj+Xs
        zd/wCCaj6VyC4B9QCKDZwA==
X-Google-Smtp-Source: ABdhPJw832MtqVoeoon1nB6/OKXVLHjKT8w7sDGa/IX2AqeEGewwLI7NVjrpt182ieGq3rTlBoJeSg==
X-Received: by 2002:a02:9109:: with SMTP id a9mr6985664jag.130.1594926368977;
        Thu, 16 Jul 2020 12:06:08 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id o19sm3140787iob.5.2020.07.16.12.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 12:06:08 -0700 (PDT)
Received: (nullmailer pid 2675109 invoked by uid 1000);
        Thu, 16 Jul 2020 19:06:06 -0000
Date:   Thu, 16 Jul 2020 13:06:06 -0600
From:   Rob Herring <robh@kernel.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        David Brown <david.brown@linaro.org>, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH v4 2/4] dt-bindings: clock: Add YAML schemas for LPASS
 clocks on SC7180
Message-ID: <20200716190606.GA2675062@bogus>
References: <1594795010-9074-1-git-send-email-tdas@codeaurora.org>
 <1594795010-9074-3-git-send-email-tdas@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594795010-9074-3-git-send-email-tdas@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 15 Jul 2020 12:06:48 +0530, Taniya Das wrote:
> The LPASS(Low Power Audio Subsystem) clock provider have a bunch of generic
> properties that are needed in a device tree. Also add clock ids for GCC
> LPASS and LPASS Core clock IDs for LPASS client to request for the clocks.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  .../bindings/clock/qcom,sc7180-lpasscorecc.yaml    | 103 +++++++++++++++++++++
>  include/dt-bindings/clock/qcom,gcc-sc7180.h        |   1 +
>  .../dt-bindings/clock/qcom,lpasscorecc-sc7180.h    |  29 ++++++
>  3 files changed, 133 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-lpasscorecc.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,lpasscorecc-sc7180.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
