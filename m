Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 715257C5497
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Oct 2023 14:57:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235009AbjJKM5Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Oct 2023 08:57:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346983AbjJKM5C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Oct 2023 08:57:02 -0400
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15471F4;
        Wed, 11 Oct 2023 05:56:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697028992; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=WCRuTYLUEcAnpp0CXxv8KXehZDqpwssQF8PEeHpO47pfiUmmOsqiAnyeKjyJ8fqwaL
    SiyT4HwaTJhMUYKGWZdpHVVPziRte1YAgck+kb77F9fWJK4JV/lj8GvZiRcdm9XGEcXG
    pXHGLFHeZ1jBY/Z6QQTuNTo2ZJPnkM5vN3c/YkZWD9yY3KL147tI9csfZj8YmMaltbbM
    7biXqGbPtmqGkhadrgw8mq1LQWQZyQzmW95rC6XWiElOuOu30JRSaboDscbg9ve9Fg1N
    JqHFCgZpjIMO48yzYdkrIRtNBNXMxbobqdhS5pj0T/v6NZZmySyMnVH9vUQLzU49zCib
    iuuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1697028992;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=a0Cq3cklZ8DPohKTz6lL/A6gM1hpQm6XBeiqBwsDqSM=;
    b=PqwTd1KCJsdz80gHRE2lxVs4Dxaq+F0c3/daZ5mx1O22X38hlsA7HzvZrf71JsEqB7
    U/MCnb4qnBXk6zRtdfgftS7EIg3WBE1ugUPuYjPUwNPmWTJkO7WDJ6VYRBO1BaRkJOo2
    0E7L4bAe46JJrliYMKzplBckiEhLaDM78sL7uqXJ0zKvxA2PzCZGkYqDPzyvHNOf5UUz
    uzB3wdKjn9o5vFxzxtpsjfW5nVdaeP63VfZoZkkilqdOjfa6DlcMTQtleMMN85LQv53P
    BvqogjXHiPSogIIoDUJ27lfhFc+wdKH8wrtFdMAkTbv7TpzlwAnNo1FPOWZSgMLroD5a
    kFWA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1697028992;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=a0Cq3cklZ8DPohKTz6lL/A6gM1hpQm6XBeiqBwsDqSM=;
    b=S1T7mLX1H7VphJUbDePNC7ik6IaNOOu/q51okJXOWJL08Tfe6B15zrwuAfem/7pJIL
    UanZud/F71muEKzmyMqUTNV3YDwKCXem9Y/9X0nvt7Wc3x9l5fy/plBtmfXDokckNOEk
    zHNYN37PzpzDJfKS8tdN4cZIuwbt9oVFtl1f3BoF58LHYgbQMRgtlQSae9wJVIqZv4OG
    8AhK+d9z2o4LcKq+AcopWqFzQJtNzQw6y1uZ6zaR+pIeIX6JV7eLH7KO5GA/eS0bTyvl
    2jtVN2qZxmXUwxWdYEXXoX1AOQ2do5knqJrjKI3/kOtEurc/DEUkQPtYzVHGqix2ffro
    5bNw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1697028992;
    s=strato-dkim-0003; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=a0Cq3cklZ8DPohKTz6lL/A6gM1hpQm6XBeiqBwsDqSM=;
    b=7CujSOxBGrtX2Mdm9YmtFgeduCVQNbh1ryZKnZcBr1XvJYKp/cij7x8/ExPw/WiJm7
    uRP/sWQEKBiNVbYqo7Bw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u261EJF5OxJD4peA8p+L1A=="
Received: from gerhold.net
    by smtp.strato.de (RZmta 49.8.2 DYNA|AUTH)
    with ESMTPSA id R04c57z9BCuVXkA
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Wed, 11 Oct 2023 14:56:31 +0200 (CEST)
Date:   Wed, 11 Oct 2023 14:56:24 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: pad sa8155p-adp DTB file
Message-ID: <ZSabeBrfhFf8T8yM@gerhold.net>
References: <20231011111936.165581-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011111936.165581-1-dmitry.baryshkov@linaro.org>
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 11, 2023 at 02:19:36PM +0300, Dmitry Baryshkov wrote:
> On sa8155p-adp platfor the bootloader (ABL) fails to reserve enough
> memory for updating the DTB:
> 
> Cmdline:  console=tty0 console=ttyMSM0,115200n8 androidboot.verifiedbootstate
> Error adding node
> Error carving out UEFI memory: FFFFFFFF
> 
> Adding `--pad 1024' to DTC_FLAGS for this board fixes the issue by
> providing enough empty space for node creation.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> 
> This replaces my previous attempt, which added DTC_FLAGS globally ([1]),
> which was rejected.
> 
> [1] https://lore.kernel.org/linux-arm-msm/20231009172717.2695854-1-dmitry.baryshkov@linaro.org/
> 

Thanks for making this specific to sa8155p-adp. I completely agree that
this workaround might be needed for devices that are locked down (with
no way to update the bootloader).

But is this really the case here? As far as I understand, the SA8155P
ADP is the "Automotive Development Platform", i.e. a developer board
where I would expect that secure boot is not enabled (just like on the
DragonBoards and RoboticBoards).

Fixing this properly in the bootloader would be very easy, you just need
to increase the DTB_PAD_SIZE I linked [1] by 1024 like in this patch.
This would fix the issue properly, with no change needed in Linux. And
if you have some way to communicate/contribute this back to Qualcomm
somehow we could reduce the chance to see this problem on actually
locked down devices in the future.

Thanks,
Stephan

[1]: https://git.codelinaro.org/clo/la/abl/tianocore/edk2/-/blob/LA.AU.1.4.1.r2-05100-sa8155.0/QcomModulePkg/Include/Library/LocateDeviceTree.h#L59
