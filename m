Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F098E21D8E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2020 16:46:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729695AbgGMOqo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jul 2020 10:46:44 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:41204 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729523AbgGMOqo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jul 2020 10:46:44 -0400
Received: by mail-io1-f66.google.com with SMTP id p205so5178660iod.8;
        Mon, 13 Jul 2020 07:46:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nbDwnmZqExm0GJ0AQBPbfTfEhmeWr4XCe+A+8/PM6M0=;
        b=T5+4jJYQlZ5hUHd84SckU3rKPK7CClh70W5uYAWcrpD9ssDeB3QErZxptmwPRGy1HQ
         4WvN3oBwXakKPlwT2ygLIM0OGQeXSgttBR6eJZzB2JGAfW2K7eoOsk4ROpEHerEUWJXq
         DJD6nU4dsC14/HW6+stbG7dN4axGQsmzWn2fkIUiFe2/rzmDUmUyBL8I/kHspXQvjDYg
         7FOIYd5J0g9f7i1ueqaHmm3wlscR2Qc4uV3qPmvgmOcb0+c4xqBmiTvGIsimkLFA6r8J
         fFSjQv53fYvFtbUhtZV1cJ3KKWwN5+RRsgTbd1cDTg5a1jTvnEaUqOCywaQWaG4i0YRS
         yi7A==
X-Gm-Message-State: AOAM533Y3+xWv+OEHt1KTm8MPBbjuW8Ab1LgnQuYE6VWPpSsbGku1g0b
        2lXrckrw4Z6c2YfBtnRmug==
X-Google-Smtp-Source: ABdhPJyC5hljtwK8AI4NvIkZ9UF+F6cv86WbaPgrtAlXxynhWmF1sbz5QKxouIpA7c6uyqRQqrL5Nw==
X-Received: by 2002:a05:6638:2615:: with SMTP id m21mr394291jat.134.1594651603099;
        Mon, 13 Jul 2020 07:46:43 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id s11sm8669417ili.79.2020.07.13.07.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 07:46:42 -0700 (PDT)
Received: (nullmailer pid 157351 invoked by uid 1000);
        Mon, 13 Jul 2020 14:46:40 -0000
Date:   Mon, 13 Jul 2020 08:46:40 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krishna Manikandan <mkrishn@codeaurora.org>
Cc:     kalyan_t@codeaurora.org, seanpaul@chromium.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        robdclark@gmail.com, hoegsberg@chromium.org,
        linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
        nganji@codeaurora.org, devicetree@vger.kernel.org
Subject: Re: [v5] dt-bindings: msm: disp: add yaml schemas for DPU and DSI
 bindings
Message-ID: <20200713144640.GA155367@bogus>
References: <1594389469-2573-1-git-send-email-mkrishn@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594389469-2573-1-git-send-email-mkrishn@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 10 Jul 2020 19:27:49 +0530, Krishna Manikandan wrote:
> MSM Mobile Display Subsytem (MDSS) encapsulates sub-blocks
> like DPU display controller, DSI etc. Add YAML schema
> for the device tree bindings for the same.
> 
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
> 
> Changes in v2:
> 	- Changed dpu to DPU (Sam Ravnborg)
> 	- Fixed indentation issues (Sam Ravnborg)
> 	- Added empty line between different properties (Sam Ravnborg)
> 	- Replaced reference txt files with  their corresponding
> 	  yaml files (Sam Ravnborg)
> 	- Modified the file to use "|" only when it is
> 	  necessary (Sam Ravnborg)
> 
> Changes in v3:
> 	- Corrected the license used (Rob Herring)
> 	- Added maxItems for properties (Rob Herring)
> 	- Dropped generic descriptions (Rob Herring)
> 	- Added ranges property (Rob Herring)
> 	- Corrected the indendation (Rob Herring)
> 	- Added additionalProperties (Rob Herring)
> 	- Split dsi file into two, one for dsi controller
> 	  and another one for dsi phy per target (Rob Herring)
> 	- Corrected description for pinctrl-names (Rob Herring)
> 	- Corrected the examples used in yaml file (Rob Herring)
> 	- Delete dsi.txt and dpu.txt (Rob Herring)
> 
> Changes in v4:
> 	- Move schema up by one level (Rob Herring)
> 	- Add patternProperties for mdp node (Rob Herring)
> 	- Corrected description of some properties (Rob Herring)
> 
> Changes in v5:
> 	- Correct the indentation (Rob Herring)
> 	- Remove unnecessary description from properties (Rob Herring)
> 	- Correct the number of interconnect entries (Rob Herring)
> 	- Add interconnect names for sc7180 (Rob Herring)
> 	- Add description for ports (Rob Herring)
> 	- Remove common properties (Rob Herring)
> 	- Add unevalutatedProperties (Rob Herring)
> 	- Reference existing dsi controller yaml in the common
> 	  dsi controller file (Rob Herring)
> 	- Correct the description of clock names to include only the
> 	  clocks that are required (Rob Herring)
> 	- Remove properties which are already covered under the common
> 	  binding (Rob Herring)
> 	- Add dsi phy supply nodes which are required for sc7180 and
> 	  sdm845 targets (Rob Herring)
> 	- Add type ref for syscon-sfpb (Rob Herring)
> ---
>  .../bindings/display/dsi-controller.yaml           |   4 +-
>  .../bindings/display/msm/dpu-sc7180.yaml           | 230 +++++++++++++++++++
>  .../bindings/display/msm/dpu-sdm845.yaml           | 210 ++++++++++++++++++
>  .../devicetree/bindings/display/msm/dpu.txt        | 141 ------------
>  .../display/msm/dsi-common-controller.yaml         | 178 +++++++++++++++
>  .../display/msm/dsi-controller-sc7180.yaml         | 115 ++++++++++
>  .../display/msm/dsi-controller-sdm845.yaml         | 115 ++++++++++
>  .../bindings/display/msm/dsi-phy-sc7180.yaml       |  79 +++++++
>  .../bindings/display/msm/dsi-phy-sdm845.yaml       |  81 +++++++
>  .../devicetree/bindings/display/msm/dsi-phy.yaml   |  79 +++++++
>  .../devicetree/bindings/display/msm/dsi.txt        | 246 ---------------------
>  11 files changed, 1089 insertions(+), 389 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/dpu.txt
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-common-controller.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-controller-sc7180.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-controller-sdm845.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-sc7180.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-sdm845.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/dsi.txt
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/dsi-controller-sc7180.example.dt.yaml: example-0: dsi@ae94000:reg:0: [0, 183058432, 0, 1024] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/dpu-sdm845.example.dt.yaml: example-0: mdss@ae00000:reg:0: [0, 182452224, 0, 4096] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/dsi-phy-sc7180.example.dt.yaml: example-0: dsi-phy@ae94400:reg:0: [0, 183059456, 0, 512] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/dsi-phy-sc7180.example.dt.yaml: example-0: dsi-phy@ae94400:reg:1: [0, 183059968, 0, 640] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/dsi-phy-sc7180.example.dt.yaml: example-0: dsi-phy@ae94400:reg:2: [0, 183060992, 0, 480] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/dpu-sc7180.example.dt.yaml: example-0: mdss@ae00000:reg:0: [0, 182452224, 0, 4096] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/dsi-phy-sdm845.example.dt.yaml: example-0: dsi-phy@ae94400:reg:0: [0, 183059456, 0, 512] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/dsi-phy-sdm845.example.dt.yaml: example-0: dsi-phy@ae94400:reg:1: [0, 183059968, 0, 640] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/dsi-phy-sdm845.example.dt.yaml: example-0: dsi-phy@ae94400:reg:2: [0, 183060992, 0, 480] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/dsi-controller-sdm845.example.dt.yaml: example-0: dsi@ae94000:reg:0: [0, 183058432, 0, 1024] is too long


See https://patchwork.ozlabs.org/patch/1326868

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

