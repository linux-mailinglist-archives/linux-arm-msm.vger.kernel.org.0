Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EE8E7844E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Aug 2023 17:02:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232185AbjHVPCD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Aug 2023 11:02:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231479AbjHVPCD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Aug 2023 11:02:03 -0400
Received: from mail-4325.protonmail.ch (mail-4325.protonmail.ch [185.70.43.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E729126
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Aug 2023 08:02:00 -0700 (PDT)
Date:   Tue, 22 Aug 2023 15:01:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1692716517; x=1692975717;
        bh=vNE21ZTe7mLvoj01papGrGrvh/vOzPIZLy8eBN+RGSs=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=DBaui7dxhE2HIqDc4A7XlL9pOt6XIHySGO5qXohJQBE6STGGqdhlSQZOXWOH66ulx
         CLm0PFUBOr6qxWg4YDMuBewbcDTewvfQOgllVebvP4meA7ax+foqzbRy6XtezqUUhv
         DZcKiFgGjm7VMsXEmheLn/vAECI7/W6gEdwqNuX7LCoYdUYO03cmYKxqxlAcsnCWGt
         HxBgiDjjK363XCMmZvxFL3AMSDbxJ4mXFl7S1JXaDfyhfi2f4cwUmVRt9H1XmMfnpB
         mnbX9mCNMWJBgeY+mGI7X+EDnb7zcJ4R/IHCMZtI5f3PMQresyuDMiiUoVfv45QJCL
         o0Rrm/XJK2RSQ==
To:     konrad.dybcio@linaro.org
From:   Raymond Hackley <raymondhackley@protonmail.com>
Cc:     agross@kernel.org, andersson@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        nikita@trvn.ru, raymondhackley@protonmail.com, robh+dt@kernel.org,
        stephan@gerhold.net, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH] arm64: dts: qcom: msm8916/39-samsung-a2015: Add flash LED
Message-ID: <20230822150035.3803-1-raymondhackley@protonmail.com>
In-Reply-To: <c016d9ac-da33-4a0b-8684-ab7b4b50ebe3@linaro.org>
References: <20230822140407.3316-1-raymondhackley@protonmail.com> <c016d9ac-da33-4a0b-8684-ab7b4b50ebe3@linaro.org>
Feedback-ID: 49437091:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Konrad,

> What about the other subdevices registered with the RT5033 MFD?

Currently the MFD is not able to control the flash LED, due to missing
driver for it.
Alternatively we control it with GPIO pins. With driver leds-sgm3140, the
binding is not under the RT5033 MFD.

Regards,
Raymond

