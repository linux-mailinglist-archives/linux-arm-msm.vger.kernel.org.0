Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F8867A0A04
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Sep 2023 18:00:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241409AbjINQAp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Sep 2023 12:00:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241426AbjINQAm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Sep 2023 12:00:42 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E62D1FC0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Sep 2023 09:00:38 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0859C433A9;
        Thu, 14 Sep 2023 16:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694707238;
        bh=zu99lEyZIfFscoztG4Q+q7IBEd5nUwRzFfj2QcjuWLk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=d1OLnA53yqZf7FfCbwjzLwwqKsX+TdCgvTawBRYNq/mCVPXGBNCpUPoSgvuCYXRpA
         /u2lJ4qPCmp2zVXACZ5visECDU2OI5aPDwr69r+atO2cnAErg0PZXrgb4sWSLMUpqZ
         lDNm98nQTTu2Zlgv1bT496K8J6pkgItJDyDCZIsduitq5qNCpjgzPpKyCEZr5rtv1z
         BTDvwIaNw5WyBnEFdYZgLeypAdWSUMY4+ljebVGiNNMWQMVk8yyQpASP0z9kjem7ZN
         0zMgELz/Q42D8HJAkWtIxjve7eoMcU2yYuX+Idwh4a8ROmn6fl2GPNH7Xi/9DK6TIc
         f76R3drlqe1BQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     agross@kernel.org, konrad.dybcio@linaro.org,
        Li Zetao <lizetao1@huawei.com>
Cc:     linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH -next] soc: qcom: wcnss_ctrl: Remove redundant initialization owner in wcnss_ctrl_driver
Date:   Thu, 14 Sep 2023 09:04:26 -0700
Message-ID: <169470744875.681825.9513225506725018557.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230808021446.2975843-1-lizetao1@huawei.com>
References: <20230808021446.2975843-1-lizetao1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Tue, 08 Aug 2023 10:14:46 +0800, Li Zetao wrote:
> The module_rpmsg_driver() will set "THIS_MODULE" to driver.owner when
> register a rpmsg_driver driver, so it is redundant initialization to set
> driver.owner in the statement. Remove it for clean code.
> 
> 

Applied, thanks!

[1/1] soc: qcom: wcnss_ctrl: Remove redundant initialization owner in wcnss_ctrl_driver
      commit: c2bfe2b7a921906858006d72fd822f6121f6649f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
