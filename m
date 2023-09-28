Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39E577B1008
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Sep 2023 02:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229445AbjI1AaL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Sep 2023 20:30:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229965AbjI1AaJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Sep 2023 20:30:09 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D412126
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Sep 2023 17:30:08 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E1D5C433C9;
        Thu, 28 Sep 2023 00:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695861008;
        bh=c+Ubefzvk60cz3YUFu2YM3sTtUtcU+Pm3k4KUjr6wbM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=H/NHodYvIaSMi+kcKM2+/zejkQVXqoiFM7RVwoF94pJpSBCgnojjdKwnpmbr1qSZf
         cwOzPcq7fHzc+JRgEe3IXh/qtL5Wr5nKEUc8tqceBqwo6asVewQyiTdRQWDKP7VyzW
         kQDi+MQctp8ZLIiWrb5akaiBO9RRCXcPB3CikoUAQKJqlzdIUWUPsaCt7VpC/nKgGG
         Uzh+HqQ4thnGNgzQAEE2EDPQQU/xItNGZ30z1V7zRxZlkkBoMQpvezGMdgRzsEqXf9
         mJeQIthg7rx1fqPULsz+zsAb97EQgahHXy4eunStFiUSbk5msNp9Tfk0Ne05ve3b0i
         WFzrgjE6IOa5Q==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     linux-arm-msm@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] soc: qcom: llcc: Handle a second device without data corruption
Date:   Wed, 27 Sep 2023 17:34:13 -0700
Message-ID: <169586125039.1226038.15611772084066328413.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230926083229.2073890-1-u.kleine-koenig@pengutronix.de>
References: <20230926083229.2073890-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Tue, 26 Sep 2023 10:32:29 +0200, Uwe Kleine-König wrote:
> Usually there is only one llcc device. But if there were a second, even
> a failed probe call would modify the global drv_data pointer. So check
> if drv_data is valid before overwriting it.
> 
> 

Applied, thanks!

[1/1] soc: qcom: llcc: Handle a second device without data corruption
      commit: f1a1bc8775b26345aba2be278118999e7f661d3d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
