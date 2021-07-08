Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 762083C1799
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jul 2021 18:59:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbhGHRBg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jul 2021 13:01:36 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:29861 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229819AbhGHRBg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jul 2021 13:01:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1625763534; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=CdKAtOicPcmHu+CUWLoTIqa7VrY/40zPjKj7i68UcTc=; b=hu2auXdmUVmpDqbX09T/b9v93ADTCDCjtCvP73dJdRBM6TTNhZc1k1jVeLL3sLJd2dj9vXYQ
 dSskGNZRSYsFPz2CeklD/qg/WWhnmdKnzCEA+SpHuoV5riQR++XrAYD71aAfUWA48YofqQUy
 n/eqdf9IINh4p9XZFKdza9PdM6I=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60e72ec01938941955b309af (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 08 Jul 2021 16:58:39
 GMT
Sender: deesin=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 22BCCC433D3; Thu,  8 Jul 2021 16:58:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from deesin-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: deesin)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AF6AEC433F1;
        Thu,  8 Jul 2021 16:58:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AF6AEC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=deesin@codeaurora.org
From:   Deepak Kumar Singh <deesin@codeaurora.org>
To:     bjorn.andersson@linaro.org, clew@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Deepak Kumar Singh <deesin@codeaurora.org>
Subject: [PATCH V2 0/2] smem partition remap and bound check changes
Date:   Thu,  8 Jul 2021 22:28:20 +0530
Message-Id: <1625763502-22806-1-git-send-email-deesin@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change from[V1]
Addressed most of the review comments in V1.
Also changed the patch order.

Deepak Kumar Singh (2):
  soc: qcom: smem: map only partitions used by local HOST
  soc: qcom: smem: validate fields of shared structures

 drivers/soc/qcom/smem.c | 290 ++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 229 insertions(+), 61 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

