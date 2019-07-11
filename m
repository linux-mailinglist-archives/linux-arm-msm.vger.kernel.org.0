Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13DCE65FB2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2019 20:46:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731139AbfGKSqx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jul 2019 14:46:53 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:39762 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731135AbfGKSqw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jul 2019 14:46:52 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 97B3360A00; Thu, 11 Jul 2019 18:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562870811;
        bh=Wcwypd2shfHXRN1F4mXhVFKFlMevSQTBgV1XmEcucRU=;
        h=From:To:Cc:Subject:Date:From;
        b=AU4gwqJxErfuXfgItx6xH8I+yK2wUcHK+770guwguGiZSl0mC5tEJ5OPGDDv9dphk
         skcWXU2dx0IAg7PsYut/kqNcOL7id2B4lgyfHodA5pR5oIlabaTl+TvtS1PaQqN1jw
         FdFrxlJFb5gwPNc+mjGUevAZGW39Yk/H8KzEw6Mw=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jeykumar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jsanka@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 99BAA60E3F;
        Thu, 11 Jul 2019 18:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562870811;
        bh=Wcwypd2shfHXRN1F4mXhVFKFlMevSQTBgV1XmEcucRU=;
        h=From:To:Cc:Subject:Date:From;
        b=AU4gwqJxErfuXfgItx6xH8I+yK2wUcHK+770guwguGiZSl0mC5tEJ5OPGDDv9dphk
         skcWXU2dx0IAg7PsYut/kqNcOL7id2B4lgyfHodA5pR5oIlabaTl+TvtS1PaQqN1jw
         FdFrxlJFb5gwPNc+mjGUevAZGW39Yk/H8KzEw6Mw=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 99BAA60E3F
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jsanka@codeaurora.org
From:   Jeykumar Sankaran <jsanka@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, seanpaul@chromium.org,
        robdclark@gmail.com
Cc:     Jeykumar Sankaran <jsanka@codeaurora.org>, pdhaval@codeaurora.org,
        nganji@codeaurora.org
Subject: [RFC] Expanding drm_mode_modeinfo flags 
Date:   Thu, 11 Jul 2019 11:46:44 -0700
Message-Id: <1562870805-32314-1-git-send-email-jsanka@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

    Hello All, 
    	drm_mode_modeinfo::flags is a 32 bit field currently used to
    describe the properties of a connector mode. I see the least order 22 bits
    are already in use. Posting this RFC to discuss on any potential plans to 
    expand the bit range support of this field for growing mode properties and 
    ways to handle one such property needed by the msm dpu driver.

    msm drivers support panels which can dynamically switch between
    video(active) and command(smart) modes. Within video mode, they also support
    switching between resolutions seamlessly i.e. glitch free resolution switch.
    But they cannot do a seamless switch from a resolutions from video to
    command or vice versa. Clients need to be aware for these capablities before
    they switch between the resolutions. Since these capabilities are identified
    per drm_mode, we are considering the below two approaches to handle this
    use case.

    Option 1:
    Attached patch adds flag values to associate a drm_mode to video/command
    mode and to indicate its capability to do a seamless switch.

    Option 2:
    drm_mode_modeinfo can expose a new "private_flags" field to handle vendor
    specific mode flags. Besides the above mentioned use case, we are also
    expoloring methods to handle some of our display port resolution switch use
    cases where the DP ports can be operated in a tiled/detiled modes. This 
    approach will provide a standard channel for drm driver vendors for their 
    growing need for drm_mode specific capabilities.

    Please provide your inputs on the options or any upstream friendly
    recommendation to handle such custom use cases.

    Thanks and Regards,
    Jeykumar S.

Jeykumar Sankaran (1):
  drm: add mode flags in uapi for seamless mode switch

 include/uapi/drm/drm_mode.h | 5 +++++
 1 file changed, 5 insertions(+)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

