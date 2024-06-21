Return-Path: <linux-arm-msm+bounces-23517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7C8911B2C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 08:15:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A4FC1C21011
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 06:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6E9716E894;
	Fri, 21 Jun 2024 06:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ex/2yM5U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CAB16E88C;
	Fri, 21 Jun 2024 06:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718950307; cv=none; b=gUoVXjhIF3WCS63yHZGdEKWlZ5wxLabZeBi0PsvQHHlDol6ly5sQ/VttQn1ini6WvTsDqZ8m0Cn6Z2zad3IDjxWIOn+luC8yGrAV9ZlIqh2ZVLfdoH7LQqsijy5RuFt8GL6J0YmC588MDwCvUr8WVQ/+bghAWhLVNskSzdEqj/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718950307; c=relaxed/simple;
	bh=wpSp/pTfduTOoJb3xpDrVQJdLz9ox914+uQCGKTnHwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WUNqfkYxYSEd7pCo3jfYSWsOzHirV3FY8rwQm2bBjhsIUhOcqZU6zTMPEwIuTieicE6eRGmdbyoLNwylBovV6Ly55ZFjtLgZyXd93OitLc8nQMqmpkv6hs+drNqRI+N8xv5XHTF3Zs1qCiLlOS5QQqQ0U8N7zIwvmxzx97h9CSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ex/2yM5U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C03AC2BBFC;
	Fri, 21 Jun 2024 06:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718950307;
	bh=wpSp/pTfduTOoJb3xpDrVQJdLz9ox914+uQCGKTnHwU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ex/2yM5UdEnGlkYi2M4X6HejZ2vA7iP3/g1mAgg/xa9XlVh7YCQoiEJAjyIwC2VKj
	 K3H1w7gof3yrDssQ3YB7uO7agK6WxBzjXakUGKbs4NUjdvqC7s1Nh4Zq+ZJl+dydCQ
	 CoVQ1g39taNU4tQ+6mMUCnLSkFwALBjKKlAN1iRtGiZ27SX4touYC/zSljA9/BNFGw
	 mE8sX3baNL+M6mlvczySNvOPAJM4OyeSbC6iUEhuNNSbq+p/aP/AIebz09QTcN8Z/z
	 R9nysd0nbjr35M1D5nEkWzW773K4qimo9vY60X3QA6TWcoGHdhWaFL9wSLyNsqZcZa
	 rRSHcuh6tjJWg==
From: Bjorn Andersson <andersson@kernel.org>
To: konrad.dybcio@linaro.org,
	krzysztof.kozlowski+dt@linaro.org,
	thara.gopinath@gmail.com,
	Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	quic_rgottimu@quicinc.com,
	quic_kshivnan@quicinc.com,
	abel.vesa@linaro.org
Subject: Re: [PATCH] soc: qcom: icc-bwmon: Fix refcount imbalance seen during bwmon_remove
Date: Fri, 21 Jun 2024 01:11:30 -0500
Message-ID: <171895028810.12506.12669413431970809730.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240613164506.982068-1-quic_sibis@quicinc.com>
References: <20240613164506.982068-1-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 13 Jun 2024 22:15:06 +0530, Sibi Sankar wrote:
> The following warning is seen during bwmon_remove due to refcount
> imbalance, fix this by releasing the OPPs after use.
> 
> Logs:
> WARNING: at drivers/opp/core.c:1640 _opp_table_kref_release+0x150/0x158
> Hardware name: Qualcomm Technologies, Inc. X1E80100 CRD (DT)
> ...
> Call trace:
> _opp_table_kref_release+0x150/0x158
> dev_pm_opp_remove_table+0x100/0x1b4
> devm_pm_opp_of_table_release+0x10/0x1c
> devm_action_release+0x14/0x20
> devres_release_all+0xa4/0x104
> device_unbind_cleanup+0x18/0x60
> device_release_driver_internal+0x1ec/0x228
> driver_detach+0x50/0x98
> bus_remove_driver+0x6c/0xbc
> driver_unregister+0x30/0x60
> platform_driver_unregister+0x14/0x20
> bwmon_driver_exit+0x18/0x524 [icc_bwmon]
> __arm64_sys_delete_module+0x184/0x264
> invoke_syscall+0x48/0x118
> el0_svc_common.constprop.0+0xc8/0xe8
> do_el0_svc+0x20/0x2c
> el0_svc+0x34/0xdc
> el0t_64_sync_handler+0x13c/0x158
> el0t_64_sync+0x190/0x194
> --[ end trace 0000000000000000 ]---
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: icc-bwmon: Fix refcount imbalance seen during bwmon_remove
      commit: 24086640ab39396eb1a92d1cb1cd2f31b2677c52

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

