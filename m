Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F37E297333
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Oct 2020 18:07:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S465137AbgJWQG7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Oct 2020 12:06:59 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:33303 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751283AbgJWQG7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Oct 2020 12:06:59 -0400
Received: by mail-ot1-f66.google.com with SMTP id t15so1844873otk.0;
        Fri, 23 Oct 2020 09:06:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4HRG/fiwKVOv7lkdiw46j9ctBU4B/I6T+hZZTK6pAwI=;
        b=npuNOFQ6HEZ9KQXkooOtAFl8KxlLB34VmNHxNX7Hgz7BSZ2virRoUDoKquUudpXe8p
         AZ/VGxCpgcrJaOEFN206xPkvLsvYPtJgBYqnkhHII2ovNePbrRcQW42IMByP3d9RvpvR
         7M3Gth+meIG3mZLz4p7gtNptEpvsbg6ebMvrBGFfa/qyGWfEWaJz+Hg+ZHGw0XhR3oQ0
         3Q1FQvXSaTkwUXBhAUKpy9IFmkBYRD7tZpU4Lpw1yqTpnkLMLF4vS87kac2pvP2ydJxq
         7kY/BpYg7BPVIR2GY60H+PKoIHOvBdcsDYjf4KLjwMRfZ/l/CgmIo3XDjGwIpwkD75wW
         kD2w==
X-Gm-Message-State: AOAM5332xhxn+1BEGJQTxSBSuJoPtcj+MBQ/lgPb6rPpP+miXjQmaFIM
        bDWgeApGqPKuih/yCOofpg==
X-Google-Smtp-Source: ABdhPJyiwn6jUyaTEfJ+h0slnBcr89VBk/H+1Sv4iZ0xWaHNY+vUEZwiyZOipA1c5NqgMex5YKj6GA==
X-Received: by 2002:a9d:7586:: with SMTP id s6mr2206833otk.46.1603469218269;
        Fri, 23 Oct 2020 09:06:58 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c12sm480785ots.48.2020.10.23.09.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 09:06:57 -0700 (PDT)
Received: (nullmailer pid 2790681 invoked by uid 1000);
        Fri, 23 Oct 2020 16:06:56 -0000
Date:   Fri, 23 Oct 2020 11:06:56 -0500
From:   Rob Herring <robh@kernel.org>
To:     Guru Das Srinagesh <gurus@codeaurora.org>
Cc:     linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        David Collins <collinsd@codeaurora.org>,
        devicetree@vger.kernel.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        Anirudh Ghayal <aghayal@codeaurora.org>
Subject: Re: [PATCH v3 1/2] bindings: pm8941-misc: Convert to YAML and add
 support for VBUS detection
Message-ID: <20201023160656.GA2790207@bogus>
References: <cover.1603403020.git.gurus@codeaurora.org>
 <b63ffcc19639f69aaba1072c059ca79e4081e6ef.1603403020.git.gurus@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b63ffcc19639f69aaba1072c059ca79e4081e6ef.1603403020.git.gurus@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 22 Oct 2020 14:47:43 -0700, Guru Das Srinagesh wrote:
> From: Anirudh Ghayal <aghayal@codeaurora.org>
> 
> Convert bindings to YAML. Also add compatible string that adds support
> for reporting the VBUS status that can be detected via a dedicated PMIC
> pin.
> 
> Signed-off-by: Anirudh Ghayal <aghayal@codeaurora.org>
> Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
> ---
>  .../bindings/extcon/qcom,pm8941-misc.txt           | 41 --------------
>  .../bindings/extcon/qcom,pm8941-misc.yaml          | 65 ++++++++++++++++++++++
>  2 files changed, 65 insertions(+), 41 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.txt
>  create mode 100644 Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.example.dt.yaml: misc@900: interrupts: [[0, 9, 0, 3]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml


See https://patchwork.ozlabs.org/patch/1386438

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

