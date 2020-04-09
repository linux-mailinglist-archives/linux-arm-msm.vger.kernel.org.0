Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D54EF1A3CAA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2020 01:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbgDIXAq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Apr 2020 19:00:46 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:36342 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726875AbgDIXAq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Apr 2020 19:00:46 -0400
Received: by mail-il1-f193.google.com with SMTP id p13so355435ilp.3;
        Thu, 09 Apr 2020 16:00:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Uc46kdVNduykSvXO5lVtxr8veYg7KgzN/ssrZ47l1hg=;
        b=qRk/AmNRkiM64e9flKAXC/e8RiPLXo2PZgzorxNcPH9k2kN/nRo9gHLZvSYP4Jab4J
         7/F2srfnI4nBlTYsxmmj/MPxs4W2/m6FtfuTyRRwbeoK+2zObh8OrPt6PJyezsqjit+g
         2FWp/l0UTXScdOBgR8FiQGXLBZvYI6qVbxLT830dMVsAE6L7vSOaHjSW10BPd90U1LmQ
         X1Vc1ZL4Niy54WrdhMjVr0QlHlPkIRy/F4SMoPO9DfSGwEYiFY7hbcvCUrvP44tdMmdY
         z2QS3kwfzqX0H3mF6gfAVyGYspwg7fS3Auut/kx7DaM0H9xAbShH3bAsiZ9+k5E0ahIZ
         /wtA==
X-Gm-Message-State: AGi0PuaG3XddwGEcF9w/kzqijGL81lCYygcrBrxbyOrpCSH0HrnEkloa
        mMVbDEydj/cu8m2HFm3+jQ==
X-Google-Smtp-Source: APiQypILccj1GZ4l+HD6IM1kuuB93JyalMoaWIKBSZb2y88Xpbg2XvHKiX5upl96mrxT+spAIxQLZA==
X-Received: by 2002:a92:359b:: with SMTP id c27mr2249082ilf.148.1586473245487;
        Thu, 09 Apr 2020 16:00:45 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id e11sm147208ilr.30.2020.04.09.16.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 16:00:44 -0700 (PDT)
Received: (nullmailer pid 5080 invoked by uid 1000);
        Thu, 09 Apr 2020 23:00:40 -0000
Date:   Thu, 9 Apr 2020 17:00:40 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sivaprak@codeaurora.org
Subject: Re: [PATCH V2 2/8] dt-bindings: clock: Add YAML schemas for QCOM A53
 PLL
Message-ID: <20200409230040.GA1782@bogus>
References: <1586086165-19426-1-git-send-email-sivaprak@codeaurora.org>
 <1586086165-19426-3-git-send-email-sivaprak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586086165-19426-3-git-send-email-sivaprak@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun,  5 Apr 2020 16:59:19 +0530, Sivaprakash Murugesan wrote:
> This patch adds schema for primary CPU PLL found on few Qualcomm
> platforms.
> 
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,a53pll.txt      | 22 --------
>  .../devicetree/bindings/clock/qcom,a53pll.yaml     | 60 ++++++++++++++++++++++
>  2 files changed, 60 insertions(+), 22 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/qcom,a53pll.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/clock/qcom,a53pll.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/clock/qcom,a53pll.yaml#

See https://patchwork.ozlabs.org/patch/1266526

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.
