Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08336572E16
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jul 2022 08:24:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230077AbiGMGYY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jul 2022 02:24:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiGMGYX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jul 2022 02:24:23 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0431CB46E
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 23:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1657693462; x=1689229462;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=l3O8bpPbmlCj5ClVjdMOYaBIcJZfMAtXaOax1aoCalM=;
  b=dzPI55xUK7DVaPcO2rB9Htdjdhj0JRIgg/c9ZM+l+QuH/5eJytTQ/DSy
   6uNXbupFQWniHGluM6fxCI92mUdKrAFi3FpHqLi9JG2hRpHTfoBxAXIbw
   8oZzF2UAkxIrYeRiju+sUwjqcxTrm5sN+DrNwSEssvjdK1e0fENQcmqOi
   8=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 12 Jul 2022 23:24:22 -0700
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2022 23:24:22 -0700
Received: from hu-ddhamara-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 12 Jul 2022 23:24:20 -0700
From:   <quic_ddhamara@quicinc.com>
To:     <freedreno@lists.freedesktop.org>
CC:     <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <robclark@gmail.com>, <quic_akhilpo@quicinc.com>,
        ddhamara <ddhamara@quicinc.com>
Subject: [PATCH 0/1] drm/msm/a6xx: Fix null pointer access in a6xx_get_indexed_registers
Date:   Wed, 13 Jul 2022 11:53:54 +0530
Message-ID: <20220713062355.6846-1-quic_ddhamara@quicinc.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: ddhamara <ddhamara@quicinc.com>

Fix a null pointer access when memory allocation fails in
a6xx_get_indexed_registers().

Akhil P Oommen (1):
  drm/msm/a6xx: Fix null pointer access in a6xx_get_indexed_registers

 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
2.37.0

