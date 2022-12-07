Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF116645E12
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 16:54:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229819AbiLGPx6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Dec 2022 10:53:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229893AbiLGPxk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Dec 2022 10:53:40 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0530929CAE;
        Wed,  7 Dec 2022 07:53:34 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 20E79CE1ECF;
        Wed,  7 Dec 2022 15:53:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA83FC433D6;
        Wed,  7 Dec 2022 15:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670428411;
        bh=6KnpI9b6bmAapZLcrIrl2KQnkReiZaXDZ7EMTUfB9F0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qjTuIWgnKzs1XskGUjKuYNcRl1Zadrw5Tu2oU2hv4mePpVs+IlF+n+rLU20rKdy38
         M8UCLtUkYEcs7Wb8rZf6AkcHZjzD+xehC1OOJHfnYjQ5uDwBcGyW45/XOrIjQNvioF
         HgrgVKWizEHxtTuqL3HYxNXuW9UA5qTLocuVNvgl8cjkOgSrA/BXeqDMEcGDbwjVf4
         oIDhW7N1aC5eLgns9NnVu5T6NGGEYdlF8Jb6kFAf7M2eHn1ISRjcZT98Z4n97a6fs/
         H1000DsXoRQZ+EkteygPY9DZ+l1x/PW0S4q1lULXtYt9VjXttuIB721xmbm5Klbyfq
         YriBujusm7eeA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     sibis@codeaurora.org, konrad.dybcio@linaro.org,
        cuigaosheng1@huawei.com, mathieu.poirier@linaro.org,
        agross@kernel.org
Cc:     linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] remoteproc: sysmon: fix memory leak in qcom_add_sysmon_subdev()
Date:   Wed,  7 Dec 2022 09:53:24 -0600
Message-Id: <167042840343.3235426.17635567664381088217.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221129105650.1539187-1-cuigaosheng1@huawei.com>
References: <20221129105650.1539187-1-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 29 Nov 2022 18:56:50 +0800, Gaosheng Cui wrote:
> The kfree() should be called when of_irq_get_byname() fails or
> devm_request_threaded_irq() fails in qcom_add_sysmon_subdev(),
> otherwise there will be a memory leak, so add kfree() to fix it.
> 
> 

Applied, thanks!

[1/1] remoteproc: sysmon: fix memory leak in qcom_add_sysmon_subdev()
      commit: e01ce676aaef3b13d02343d7e70f9637d93a3367

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
