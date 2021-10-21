Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 182F14362F1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Oct 2021 15:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230444AbhJUNc1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Oct 2021 09:32:27 -0400
Received: from mail-oi1-f179.google.com ([209.85.167.179]:44859 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230349AbhJUNc0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Oct 2021 09:32:26 -0400
Received: by mail-oi1-f179.google.com with SMTP id y207so823471oia.11;
        Thu, 21 Oct 2021 06:30:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=9tYUSXrv+aJRgRoUi4LsxnIyvrDFQxilKTvm9UGMfQw=;
        b=XUgWrudnuO9IVhZnpMs1r9qQDLpZdxjf6BfyyXPiPJdHunrckVb8o3N+mz42vQQ1h8
         5I/tBeFTstW8ASuXoGXI73E8rlVJojVBW0Yuo1ceuXgWGkRanMPM64VgdlfUyuXB5PNI
         gpZVMDCdhXqnXevJA0DMnzvXhmXl24JPGnMrn5zuT5+BeGtD166F87J8pP4V2zQN18JV
         4yWrf4MsicBMPlJ8IIKSc1v9SgEVcXX+i6d2r1h9ROVMfCe156TFdX7jNnOFpByuCkLM
         CCKTrkh+fwUS3MGrAcAM9/uYJ6wI7KXrn/YFsR1zo1Vr9U81RKlvvTgTWvIK96xUzRtH
         1Dzw==
X-Gm-Message-State: AOAM530+5ljUxzu66/24MIYvBesixdJF6w6OzkZpHyUw7jMe1FuCK21e
        ijtqkbI/rm8vK4vjmOm0Gw==
X-Google-Smtp-Source: ABdhPJzwATZTOqJPdVrIby7aiYWs8CklYXzzyozkscDmUEsTPHn+sO4ma6HMFkCRHgfWTxZeyhXT1w==
X-Received: by 2002:a05:6808:bcc:: with SMTP id o12mr4569690oik.151.1634823009913;
        Thu, 21 Oct 2021 06:30:09 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id c17sm1136592ots.35.2021.10.21.06.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 06:30:09 -0700 (PDT)
Received: (nullmailer pid 353172 invoked by uid 1000);
        Thu, 21 Oct 2021 13:30:05 -0000
From:   Rob Herring <robh@kernel.org>
To:     David Heidelberg <david@ixit.cz>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        ~okias/devicetree@lists.sr.ht, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Satya Priya <skakit@codeaurora.org>
In-Reply-To: <20211020231646.278706-1-david@ixit.cz>
References: <20211020231646.278706-1-david@ixit.cz>
Subject: Re: [PATCH] dt-bindings: mfd: qcom: pm8xxx: add pm8018 compatible
Date:   Thu, 21 Oct 2021 08:30:05 -0500
Message-Id: <1634823005.115639.353170.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 21 Oct 2021 01:16:45 +0200, David Heidelberg wrote:
> Add missing compatible for the PM8018 model.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1544064


pmic@0: compatible: Additional items are not allowed ('qcom,pm8921' was unexpected)
	arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml

pmic@0: compatible: ['qcom,pm8018', 'qcom,pm8921'] is too long
	arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml

pmic@0: 'gpio@150', 'keypad@148', 'led@131', 'led@132', 'led@133', 'led@48', 'mpps@50', 'pwrkey@1c', 'vibrator@4a', 'xoadc@197' do not match any of the regexes: 'pinctrl-[0-9]+', 'rtc@[0-9a-f]+$'
	arch/arm/boot/dts/qcom-apq8060-dragonboard.dt.yaml

pmic@0: 'gpio@150', 'keypad@148', 'mpps@50', 'pwrkey@1c', 'vibrator@4a', 'xoadc@197' do not match any of the regexes: 'pinctrl-[0-9]+', 'rtc@[0-9a-f]+$'
	arch/arm/boot/dts/qcom-msm8660-surf.dt.yaml

pmic@0: 'gpio@150', 'mpp@50', 'pwrkey@1c' do not match any of the regexes: 'pinctrl-[0-9]+', 'rtc@[0-9a-f]+$'
	arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml

pmic@0: 'gpio@150', 'mpps@50', 'pwrkey@1c', 'xoadc@197' do not match any of the regexes: 'pinctrl-[0-9]+', 'rtc@[0-9a-f]+$'
	arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml

pmic@0: 'keypad@148', 'pwrkey@1c' do not match any of the regexes: 'pinctrl-[0-9]+', 'rtc@[0-9a-f]+$'
	arch/arm/boot/dts/qcom-msm8960-cdp.dt.yaml

pmic@0: rtc@11d:compatible: Additional items are not allowed ('qcom,pm8921-rtc' was unexpected)
	arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml

pmic@0: rtc@11d:compatible: ['qcom,pm8018-rtc', 'qcom,pm8921-rtc'] is too long
	arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml

pmic@1: 'mpps@50' does not match any of the regexes: 'pinctrl-[0-9]+', 'rtc@[0-9a-f]+$'
	arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml

