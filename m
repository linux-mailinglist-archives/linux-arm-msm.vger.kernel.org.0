Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13BB924E295
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Aug 2020 23:21:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbgHUVVa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Aug 2020 17:21:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726457AbgHUVV3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Aug 2020 17:21:29 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07381C061573;
        Fri, 21 Aug 2020 14:21:29 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id f24so394751edw.10;
        Fri, 21 Aug 2020 14:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FsSHEkxuTyYKBr+RaPBvNnmq19cuPmIHZizROaUDX+g=;
        b=K4kuDA232grAmwo2sAq8iTB5jsLokPktZ/nMcqEO/7PrGBBspH1i2W9rLOzU0JYL7i
         D14lVcQtQ0SoUWVJ8zQh6K1fqBT17oJ6wSz5mjGOLL/rdJSrvhiyowchckMg/lYp8f/i
         6udNeBQph1xBiTy6QdXH/4RWosEw3BojmDcxUuz+aq0L+fWnawcHorpCiZ9/+pSnRO5O
         xLEkO35D1ZO97U1rHChvdY51/H/U7MG9V8EvW3I1S8Ixtk2USfsBDhHQnn0EcIsN7xGc
         xxAMpMbuOTxMw6H6CMghsZfWBzl/C9//KyJ+zfdS9L9VmtdGtTJCEwo92zha/1O2i6WM
         Chog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FsSHEkxuTyYKBr+RaPBvNnmq19cuPmIHZizROaUDX+g=;
        b=EiGNpUPVyEkgK+dcVsPyJeY6QMaJH1kuEz5flbUBUPlwcWq+4gpvpbs66c5PqRdxY9
         mPjdObTrtpXRyEyP4wiRuux1Lc+xErQg+icKpFfracmA0YbL7HtJYbkkbbX2mk9qV1wh
         HE/Vl7/Xl2SuWp9imIWGwIjfkbnZoM29rbNe0SP04bBVgarafZDhx+tY82o3PX6Q7P0c
         Xoa3FGU8piuu/vGxAvQl+RzctxXMNE9WU2OT+ByS4IhbEhIBc/bGaIxDQODN5yE4PtOM
         Ngpub/lKmzXQmd1fJ32DoT87Ob01c93+hXL3xlPU+uVIpVUn0ii51e5ctmfRzAgk1KSg
         tz9g==
X-Gm-Message-State: AOAM531ApUUFqA/OQ6BeO6Oka81E2sC4r32IA3Gp4ObcE8pOXX/0UR6B
        tno+xgAoYtbvt9eSxnrqF9Y95GJkDMKyjQ==
X-Google-Smtp-Source: ABdhPJxdpixX0Vn75qgMUReBJYW4RhCAvJYy6dVGGHvbKdvo8mmbtSPxxIL3xj+ifrEeNisYTa8TrQ==
X-Received: by 2002:a05:6402:22c8:: with SMTP id dm8mr5001024edb.41.1598044887418;
        Fri, 21 Aug 2020 14:21:27 -0700 (PDT)
Received: from [192.168.1.106] (abab36.neoplus.adsl.tpnet.pl. [83.6.165.36])
        by smtp.gmail.com with ESMTPSA id p12sm1741093edt.27.2020.08.21.14.21.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2020 14:21:27 -0700 (PDT)
Subject: Re: [PATCH v5] arm64: dts: qcom: Add support for Xiaomi Poco F1
 (Beryllium)
To:     Amit Pundir <amit.pundir@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
References: <1598029961-2474-1-git-send-email-amit.pundir@linaro.org>
From:   Konrad Dybcio <konradybcio@gmail.com>
Message-ID: <23c4191e-4d64-80d8-e688-27d004729ea1@gmail.com>
Date:   Fri, 21 Aug 2020 23:21:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1598029961-2474-1-git-send-email-amit.pundir@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi

First of all, sorry if anybody sees this twice. I've been messing with Thunderbird lately.



> dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r3.dtb
> dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-beryllium.dtb

[B]eryllium should come before [C]heza, no? Also, aren't the non-development boards supposed to include the vendor name? i.e. sdm845-(xiaomi/poco)-beryllium.dtb


> +	model = "Xiaomi Technologies Inc. Beryllium";

At least with Xperias, we settled on setting the model property to the "pretty" name, in this case Poco F1


> +	pm8998-rpmh-regulators {
> +		compatible = "qcom,pm8998-rpmh-regulators";
> +		qcom,pmic-id = "a";
> +
> +		vreg_l1a_0p875: ldo1 {

I think you forgot to include (regulatorname)-supply properties which should cause havoc with all things regulators..


> +		vreg_l1a_0p875: ldo1 {
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <880000>;
0p88? Unless it's a PMIC limitation.. Please also confirm names for the rest of the regulators.

Also why are there so few regulators? And none from pmi8998? Are the rest WIP/coming in a followup commit, or are they disabled on this board? AFAICS you only include SoC/PMIC DTs which would suggest they should be there.


> +/* Reserved memory changes from downstream */

Wouldn't it look better if you included that in the main {} node instead of reopening it in the middle of the file? I mean, it works, but let's hear what others have to say.


> +			 * It seems that mmc_test reports errors if drive
> +			 * strength is not 16 on clk, cmd, and data pins.

You say that, but then you set "drive-strength = <10>;" for cmd and data, please confirm it's intentional.


> +&ufs_mem_hc {

UFS comes before USB alphabetically.


> +&ufs_mem_phy

Ditto


> +&qup_uart6_default

Ditto


Konrad
