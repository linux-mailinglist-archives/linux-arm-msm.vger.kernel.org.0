Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C5AD580A89
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jul 2022 06:46:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230158AbiGZEqB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jul 2022 00:46:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbiGZEqA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jul 2022 00:46:00 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EB8223150
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jul 2022 21:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1658810760; x=1690346760;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+hMHWP4TrhFZRGvCOWqhFzNxgYw3fCmXGdC/7XEsrbA=;
  b=p/0WpnNA4CpZkmC9IDmsRP2Od6RiY8rXOmOAviuIAYzMIY2zWlAZmP8z
   CVUMdCN40oo53yhlUJ9YvGvd1QTKE7iF17qSTVYCdBJ/38OrX/qkxyA4r
   tffNYiW8fd3DyijCBjyOcAgsSqGaGOveWJouvlYLYxMKEU5cuZvVd71ab
   Y=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 25 Jul 2022 21:45:59 -0700
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
  by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2022 21:45:59 -0700
Received: from hu-ddhamara-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 25 Jul 2022 21:45:56 -0700
From:   <quic_ddhamara@quicinc.com>
To:     <freedreno@lists.freedesktop.org>
CC:     <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <robclark@gmail.com>, <quic_akhilpo@quicinc.com>,
        Devi prasad Dhamarasingi <quic_ddhamara@quicinc.com>
Subject: [PATCH v2 0/1] drm/msm/a6xx: Fix null pointer access in a6xx_get_indexed_registers
Date:   Tue, 26 Jul 2022 10:14:45 +0530
Message-ID: <20220726044446.21102-1-quic_ddhamara@quicinc.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Devi prasad Dhamarasingi <quic_ddhamara@quicinc.com>

Fix a null pointer access when memory allocation fails in
a6xx_get_indexed_registers().

Akhil P Oommen (1):
  drm/msm/a6xx: Fix null pointer access in a6xx_get_indexed_registers

 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
2.37.0

