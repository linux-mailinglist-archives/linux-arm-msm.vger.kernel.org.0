Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84D914588B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Nov 2021 06:05:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbhKVFI4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Nov 2021 00:08:56 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:4352 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229505AbhKVFIz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Nov 2021 00:08:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637557550; x=1669093550;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=YmvyHv6Yvfelml56//ytC9A5xcv0iMZ2Fh2fTzYsK4Y=;
  b=uRo95V2iPysVTVsGows0SRbSJESx328McwL+976D0gBt75we8Kraz6No
   /iRdk4/CHB1ViEhSlzSwWKpta4J+L/XJBXMDAWS0LKdo3CXnAa0CTr3dR
   hSnyYZKRzUf1RLKqpl9K19RjTjZ+7/fRQ2jw0HjcDmCDQ8CgWXg+BUYxv
   w=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 21 Nov 2021 21:05:49 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2021 21:05:49 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Sun, 21 Nov 2021 21:05:49 -0800
Received: from hyiwei-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Sun, 21 Nov 2021 21:05:45 -0800
From:   Huang Yiwei <quic_hyiwei@quicinc.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <mani@kernel.org>, <jassisinghbrar@gmail.com>, <robh+dt@kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_psodagud@quicinc.com>,
        <quic_tsoni@quicinc.com>, <quic_aiquny@quicinc.com>,
        <quic_eberman@quicinc.com>, Huang Yiwei <quic_hyiwei@quicinc.com>
Subject: [PATCH 0/4] mailbox: qcom-ipcc: Update the QCOM_IPCC driver
Date:   Mon, 22 Nov 2021 13:05:05 +0800
Message-ID: <20211122050509.5979-1-quic_hyiwei@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Update the QCOM_IPCC driver with below main features:
Dynamic alloc for channel arrangement instead of static alloced
array.
Multiple instance can be supported.
IPCC interrupt wake up support from suspend.
More protocol and client ID support added.

Huang Yiwei (4):
  mailbox: qcom-ipcc: Dynamic alloc for channel arrangement
  mailbox: qcom-ipcc: Support more IPCC instance
  mailbox: qcom-ipcc: Support interrupt wake up from suspend
  dt-bindings: mailbox: Add more protocol and client ID

 drivers/mailbox/qcom-ipcc.c             | 99 +++++++++++++++++++------
 include/dt-bindings/mailbox/qcom-ipcc.h |  2 +
 2 files changed, 78 insertions(+), 23 deletions(-)

-- 
2.17.1

