Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D8007C4C2E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Oct 2023 09:44:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbjJKHoL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Oct 2023 03:44:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbjJKHoK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Oct 2023 03:44:10 -0400
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88D379B
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 00:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail2; t=1697010244; x=1697269444;
        bh=fhfaMyYupSidT8X2qeuG5+kniub3gKCqrstcySbQZYU=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=E3+TEcLoODu/hy/5rKQqKzVOGyshqn4KUFFQkQNpn2rjiJn0fOA8QifLRrB2PN4cT
         zZBZp4BDXTZ40f528qozszVFNG2Rp453THk/UD/U/hDKj/T4UJnGLoWY95XVFfTKpo
         Yjp4wTRqPSGrTPTPtIbOh2Bli7Z5CZbglc1jSihRiZox+Uit+hnnrBIpF0bCq8iX8o
         YQmQkRo6nqliHF4yzvUXGCVFn+431Nqi3nu8yjdRw0BIreH/rUFqExxm7vS4GXzcrX
         a85L897r+M8wHhcD/0RHxFOHFDdHKrxVoNU0vja2T5+w5b+XBydYxdubBUvPEYJaLH
         7UVr+keMas/lA==
Date:   Wed, 11 Oct 2023 07:43:47 +0000
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
From:   Simon Ser <contact@emersion.fr>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH] soc: qcom: pmic_glink: fix connector type to be DisplayPort
Message-ID: <HIG_NEF6icf1NPpaYFpV4-5TILrAGna4mq_L-6TeHSBqn2BNAnwHTNowxfak9S2lKKNCI9yGLi5FdDJaAZHlicLbS9gfTVxQoIbxJewpgq4=@emersion.fr>
In-Reply-To: <20231010225229.77027-1-dmitry.baryshkov@linaro.org>
References: <20231010225229.77027-1-dmitry.baryshkov@linaro.org>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H5,
        RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks for fixing this!

Acked-by: Simon Ser <contact@emersion.fr>
