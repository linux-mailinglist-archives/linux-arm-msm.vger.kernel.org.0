Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A15C7AA07C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Sep 2023 22:39:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231883AbjIUUjE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Sep 2023 16:39:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231960AbjIUUiw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Sep 2023 16:38:52 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FFCE86127
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Sep 2023 10:37:57 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A0A5C4E756;
        Thu, 21 Sep 2023 14:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695306371;
        bh=7WnMhNa/jb+Q8Bl79eEf/spefDNIbqOzo6zv6UE81fs=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=Fh/h65Xx2awq/PoJrb0rSjZDsSVXxgzr6I+eO7it73tD4O+qaLAD8BRxOjsIPLNtv
         MALcyAkThXL0Y9KS/xYjtuILSj4QfaQRl941+AmBrkOck78+lA0V2uVFcdY9pX/4Fi
         esABf0jLQzC111Bb7XbPbUWGWtpwQIJczr+eBdV2/SNGHhLJGnoIsDkjIiPKhbXklf
         Tg9PomV3/u/EZxklRQpmonbYw8cOXCECuy7/rOKwT0+qNaTJae3RVg5sSnMhQcQr7y
         kF4Cu/qJl6l9ltJ2xpC+UU2rgAN2CcDu5xFH9mB1AJ+psW+uQmOVH/IHrPE1V4cQm2
         cogigBh5vMFHg==
From:   Vinod Koul <vkoul@kernel.org>
To:     linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Yang Yingliang <yangyingliang@huawei.com>
Cc:     quic_varada@quicinc.com, andersson@kernel.org
In-Reply-To: <20230824091345.1072650-1-yangyingliang@huawei.com>
References: <20230824091345.1072650-1-yangyingliang@huawei.com>
Subject: Re: [PATCH -next] phy: qcom: phy-qcom-m31: fix wrong pointer pass
 to PTR_ERR()
Message-Id: <169530637015.106093.4444444051557145401.b4-ty@kernel.org>
Date:   Thu, 21 Sep 2023 16:26:10 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,DATE_IN_PAST_03_06,
        DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Thu, 24 Aug 2023 17:13:45 +0800, Yang Yingliang wrote:
> It should be 'qphy->vreg' passed to PTR_ERR() when devm_regulator_get() fails.
> 
> 

Applied, thanks!

[1/1] phy: qcom: phy-qcom-m31: fix wrong pointer pass to PTR_ERR()
      commit: 5f7cd740a6b657fba775bde744496e5ed21851ca

Best regards,
-- 
~Vinod


