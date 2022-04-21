Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6A4250A235
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Apr 2022 16:27:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389268AbiDUOaM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Apr 2022 10:30:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1389234AbiDUOaK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Apr 2022 10:30:10 -0400
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0FF33E0FE
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 07:27:15 -0700 (PDT)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-e656032735so4275848fac.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 07:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9VwmgAIE3C/SlM3FCg1mKc45JuOL6JcnrTvihhf7z+8=;
        b=gT3MpU79adYbNmR619A7KZwgwzy1/l+VS3jcW/0aVqreIbPUeSR1kvM5Jb7X6iaMLF
         hepxgbkIFjyA0lyb2iKgUwyiDlRYoiWHEJrXRCvMKilJQPOGCZjQO93YBqW9A8zXqKz2
         ddqB/FLDaRO3w5C3ai/PqyTaro2lIa3UlF+YO6ipQG6wrUV3SRwNIdPY/NgMEWEeCdhF
         etGVz6KBFTfhWl223r61PYEJfc/dgFRYslxc5evi9EDmvyjx4McoH3H/DoV2DdHOhc1y
         3DeCaQkI0oWrYrwImQwK9jmEitPo6bYdMWDwKG2j1xWSDt4LcvUEZHNLYBOskJSW66kT
         PB5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9VwmgAIE3C/SlM3FCg1mKc45JuOL6JcnrTvihhf7z+8=;
        b=qnhcLJoxSA/qwIwdjWdlKXcqyXAoWLbCuokcUGEyXDT/tfmjGMWUM16h2E2Vy9P7DX
         STM2YuOO3Mnh6JylvtAEnlG87V9p1HNCNAxaZnxPaJRSjKLmX+RPxT2HYJDeRdQzt706
         mYM7nk+mnBg58+iwfP+UXaXOKSXx/pQrzeqr67ijOKxQyvrLPea0GUGB1l0hQavSsAQa
         WVpWil4D898KJHn/9Mon2Ci/ZzlS9Xw4dC13kV0rC+QlsI1wjrWk8AoQWwj12CUHwN1Y
         C3PAQwXgY93NnB8z/a8p7xwRylit4fypI9zpoJfYbkx77UO0wZOXBwJZ6rBERLaR6spj
         pYlg==
X-Gm-Message-State: AOAM533r/gorhdd8b431fMcS/BCfzQVkNcaY0JjQMonVoK57AaCz5XkE
        3TZeaq+b2Rl6ViMkH43QC0Jegw==
X-Google-Smtp-Source: ABdhPJzWNi+qzNkI0Z6gcAFg1/3ClDqHJiyimleT4ouAEJm0pBZSjF3lzP64rQX+WtyZnNbDDrP/xw==
X-Received: by 2002:a05:6870:538c:b0:da:f5e5:5b56 with SMTP id h12-20020a056870538c00b000daf5e55b56mr3993013oan.241.1650551235008;
        Thu, 21 Apr 2022 07:27:15 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id s14-20020a0568302a8e00b006054e841915sm4296295otu.73.2022.04.21.07.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 07:27:14 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>, Joel Selvaraj <jo@jsfamily.in>,
        Rob Herring <robh+dt@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, Amit Pundir <amit.pundir@linaro.org>
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sdm845-xiaomi-beryllium: change firmware path and use mbn format
Date:   Thu, 21 Apr 2022 09:26:52 -0500
Message-Id: <165055095990.2574292.4581684573517329144.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <BY5PR02MB700966DEE6F6044EBEB5B892D91F9@BY5PR02MB7009.namprd02.prod.outlook.com>
References: <20220330064505.243799-1-jo@jsfamily.in> <BY5PR02MB700966DEE6F6044EBEB5B892D91F9@BY5PR02MB7009.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 30 Mar 2022 12:15:02 +0530, Joel Selvaraj wrote:
> The "qcom/sdm845/" path conflicts with db845c's firmware that are
> present in the linux-firmware package. Xiaomi uses their own signed
> firmware for Poco F1 and can't use the db845c's firmware. So let's
> use "qcom/sdm845/beryllium/" to distinguish Poco F1's firmware files.
> 
> For easier handling and packaging, the mdt+bXX files are squashed
> using Bjorn Andersson's pil-squasher tool from this link:
> https://github.com/andersson/pil-squasher
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: qcom: sdm845-xiaomi-beryllium: change firmware path and use mbn format
      commit: efbd3599154cb3d947564a9dce419a6754d233ef
[2/4] arm64: dts: qcom: sdm845-xiaomi-beryllium: enable qcom ipa driver
      commit: 84b6c2420415767079baa24ffd70d048cd35bdd8
[3/4] arm64: dts: qcom: sdm845-xiaomi-beryllium: fix typo in panel's vddio-supply property
      commit: 1f1c494082a1f10d03ce4ee1485ee96d212e22ff
[4/4] arm64: dts: qcom: sdm845-xiaomi-beryllium: enable second wifi channel
      commit: 3213b3741a147db59ed6f1ebc5f569854725b91f

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
