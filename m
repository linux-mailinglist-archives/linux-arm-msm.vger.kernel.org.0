Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 006F5EAB1E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2019 08:51:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726884AbfJaHvh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Oct 2019 03:51:37 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:26169 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726776AbfJaHvg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Oct 2019 03:51:36 -0400
X-Greylist: delayed 367 seconds by postgrey-1.27 at vger.kernel.org; Thu, 31 Oct 2019 03:51:35 EDT
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 31 Oct 2019 13:15:26 +0530
IronPort-SDR: MN7tIGpJEpqomNc9ArNL1Jz6DKjfCwTsAuitr1lky9PtZWyuQpGXwxhUhQ0Pyxo9Vfp+gCL1Ug
 CEJbQgqcu3bJSb3fI0upuKKgDAv85fTNHVIf2Ss54D77EC2zOh8G0Ra1ZQFRZjQuB5sxPjiHVF
 I3iB4AY4UlGQNCgnRnorMyOJtXsuGyRCrukoCBznEjNyEea0ESjbjinI6SEZqSfiKhyoLOFwP4
 mohuaVo//BpciVfoqT/8xi+Thtmj15u3AUwdERZYEqCnQDoaR9B3fiR/RxS9J0ECc7Sa03W4l9
 jjHLqFi1Z4n1F5DHTirlF9nA
Received: from c-rojay-linux.qualcomm.com ([10.206.21.80])
  by ironmsg02-blr.qualcomm.com with ESMTP; 31 Oct 2019 13:15:06 +0530
Received: by c-rojay-linux.qualcomm.com (Postfix, from userid 88981)
        id A65E21A50; Thu, 31 Oct 2019 13:15:04 +0530 (IST)
From:   Roja Rani Yarubandi <rojay@codeaurora.org>
To:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     mgautam@codeaurora.org, akashast@codeaurora.org,
        msavaliy@codeaurora.org, rojay@codeaurora.org, sanm@codeaurora.org,
        skakit@codeaurora.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/1] Add QUP SE instances configuration
Date:   Thu, 31 Oct 2019 13:14:59 +0530
Message-Id: <20191031074500.28523-1-rojay@codeaurora.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This change depends on below series
https://patchwork.kernel.org/project/linux-arm-msm/list/?series=192087 

Roja Rani Yarubandi (1):
  arm64: dts: sc7180: Add qupv3_0 and qupv3_1

 arch/arm64/boot/dts/qcom/sc7180-idp.dts | 152 +++++-
 arch/arm64/boot/dts/qcom/sc7180.dtsi    | 683 +++++++++++++++++++++++-
 2 files changed, 828 insertions(+), 7 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of the Code Aurora Forum, hosted by The Linux Foundation

