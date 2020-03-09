Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D182417E663
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2020 19:07:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727357AbgCISHC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Mar 2020 14:07:02 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:41532 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726269AbgCISHB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Mar 2020 14:07:01 -0400
Received: by mail-ot1-f66.google.com with SMTP id s15so2264493otq.8;
        Mon, 09 Mar 2020 11:07:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+8twmAkYC8gLumwmIlw3+TNjk4YZIpc4Yf4Svt7khAE=;
        b=hxesS+HJMdaYe7v+UFydhi9C5U/FqzuaAy9qlXBA2GSEkMunxcXVolep1eD4r6yIdU
         08r6nIU4cjh1Vg5fwUNl583j9qZO3+W/+hRj7FCUXFgOncW7LsMLqPNrCp4+SMW/KcpK
         buVbkXi2YChKqDhoAiBhXmOMa8LthzdAdrie4BMcHYg/fCNkHi2BBqa0cq5m5hhlkar7
         DrSuAjWL00jnhjE90N4Kkd2mfR3U1lEwVm/SaTtIG+eXf3VCMDaphi/5lFTfPZPCox+L
         sEZeqLy4wO9ZKqXUXJ0b6yfSuLAn5D2D4EDMJl8Shba/DxR3g1cht/csV6oKYMwb2dpn
         DgQw==
X-Gm-Message-State: ANhLgQ11Wl+ZDz/4yX8B/slT/vnmidmj3yxbSVgkLhcYxiMjEaF9a5Rm
        B3pLtRk+5KOvG2iNU0zgTw==
X-Google-Smtp-Source: ADFU+vs3IQ3wz+qJ/67vqIo0mD/X0qf+y/Hptx7ec/9FGLi0njnEexI24zE2V0heF26J/Ax0sA1e+g==
X-Received: by 2002:a9d:5f7:: with SMTP id 110mr8301002otd.73.1583777220691;
        Mon, 09 Mar 2020 11:07:00 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t193sm3355321oif.34.2020.03.09.11.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 11:06:59 -0700 (PDT)
Received: (nullmailer pid 18575 invoked by uid 1000);
        Mon, 09 Mar 2020 18:06:58 -0000
Date:   Mon, 9 Mar 2020 13:06:58 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krishna Manikandan <mkrishn@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        kalyan_t@codeaurora.org, nganji@codeaurora.org
Subject: Re: [v1] dt-bindings: msm: disp: add yaml schemas for DPU and DSI
 bindings
Message-ID: <20200309180658.GA15631@bogus>
References: <1583494560-25336-1-git-send-email-mkrishn@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1583494560-25336-1-git-send-email-mkrishn@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri,  6 Mar 2020 17:06:00 +0530, Krishna Manikandan wrote:
> MSM Mobile Display Subsytem(MDSS) encapsulates sub-blocks
> like DPU display controller, DSI etc. Add YAML schema
> for the device tree bindings for the same.
> 
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
> ---
>  .../bindings/display/msm/dpu-sc7180.yaml           | 269 +++++++++++++++
>  .../bindings/display/msm/dpu-sdm845.yaml           | 265 +++++++++++++++
>  .../bindings/display/msm/dsi-sc7180.yaml           | 369 +++++++++++++++++++++
>  .../bindings/display/msm/dsi-sdm845.yaml           | 369 +++++++++++++++++++++
>  4 files changed, 1272 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-sc7180.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-sdm845.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:21.16-37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
Documentation/devicetree/bindings/display/msm/dpu-sc7180.example.dts:17:10: fatal error: dt-bindings/clock/qcom,dispcc-sc7180.h: No such file or directory
 #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
scripts/Makefile.lib:300: recipe for target 'Documentation/devicetree/bindings/display/msm/dpu-sc7180.example.dt.yaml' failed
make[1]: *** [Documentation/devicetree/bindings/display/msm/dpu-sc7180.example.dt.yaml] Error 1
Makefile:1263: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1250230
Please check and re-submit.
