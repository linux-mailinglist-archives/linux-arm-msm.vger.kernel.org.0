Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1E066534E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Dec 2022 18:16:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234871AbiLURP6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Dec 2022 12:15:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234799AbiLURP1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Dec 2022 12:15:27 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1D87DAE;
        Wed, 21 Dec 2022 09:14:56 -0800 (PST)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BLDqBvK018901;
        Wed, 21 Dec 2022 17:14:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=gBhHKx02h6Axdy+iRKzp80j+cKaack/GA8r6SHvEQjg=;
 b=Hcq/uMmEZDfqTcvh88boF5kjeDCqSG+DcwHnt/fnoOnlJG3QDe4SgGBF2t/67L3e2FPU
 ZNrRm6kYOVdHoHfHgDhYRoNYnZ81ttlsTjafzlTkB+w0+l8uTTd1DbfhjkMy5UN2WmPq
 UGJjSMekoOuPsQLpVl/iBIZumje8tw6gkmTKB+1M9hGojm9CB49dcag7M/qmX3QzUzeP
 g7LCK8T5jpf2ODJ0qUqInUiDyNgQUZ+zMooGK8NEnq6yul0+qGGUqPd5ta1jJz+/u8Tt
 F30lPx84kDXdpbxRZfcAXNYWLMkgenaqLqny1tsSi3Sza5/uWFWOI1SigfFXoxL7AySC AA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mm2brrjcb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 21 Dec 2022 17:14:26 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BLHEOd0024082
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 21 Dec 2022 17:14:24 GMT
Received: from hyd-lnxbld559.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 21 Dec 2022 09:14:16 -0800
From:   Akhil P Oommen <quic_akhilpo@quicinc.com>
To:     freedreno <freedreno@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC:     Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Andy Gross <agross@kernel.org>, Chia-I Wu <olvaffe@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "Douglas Anderson" <dianders@chromium.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Kevin Hilman <khilman@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        "Len Brown" <len.brown@intel.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Pavel Machek <pavel@ucw.cz>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "Sean Paul" <sean@poorly.run>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>
Subject: [PATCH v4 0/5] Improve GPU reset sequence for Adreno GPU
Date:   Wed, 21 Dec 2022 22:43:58 +0530
Message-ID: <1671642843-5244-1-git-send-email-quic_akhilpo@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: A7scqoT25a38Jvcnb90YnPX4YI2t75XX
X-Proofpoint-GUID: A7scqoT25a38Jvcnb90YnPX4YI2t75XX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-21_09,2022-12-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212210143
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


This is a rework of [1] using genpd instead of 'reset' framework.

As per the recommended reset sequence of Adreno gpu, we should ensure that
gpucc-cx-gdsc has collapsed at hardware to reset gpu's internal hardware states.
Because this gdsc is implemented as 'votable', gdsc driver doesn't poll and
wait until its hw status says OFF.

So use the newly introduced genpd api (dev_pm_genpd_synced_poweroff()) to
provide a hint to the gdsc driver to poll for the hw status and use genpd
notifier to wait from adreno gpu driver until gdsc is turned OFF.

This series is rebased on top of linux-next (20221215) since the changes span
multiple drivers.

[1] https://patchwork.freedesktop.org/series/107507/

Changes in v4:
- Update genpd function documentation (Ulf)

Changes in v3:
- Rename the var 'force_sync' to 'wait (Stephen)

Changes in v2:
- Minor formatting fix
- Select PM_GENERIC_DOMAINS from Kconfig

Akhil P Oommen (4):
  clk: qcom: gdsc: Support 'synced_poweroff' genpd flag
  drm/msm/a6xx: Vote for cx gdsc from gpu driver
  drm/msm/a6xx: Remove cx gdsc polling using 'reset'
  drm/msm/a6xx: Use genpd notifier to ensure cx-gdsc collapse

Ulf Hansson (1):
  PM: domains: Allow a genpd consumer to require a synced power off

 drivers/base/power/domain.c           | 26 ++++++++++++++++++++
 drivers/clk/qcom/gdsc.c               | 11 +++++----
 drivers/gpu/drm/msm/Kconfig           |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 46 ++++++++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  7 ++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 13 +++++++---
 drivers/gpu/drm/msm/msm_gpu.c         |  4 ---
 drivers/gpu/drm/msm/msm_gpu.h         |  4 ---
 include/linux/pm_domain.h             |  5 ++++
 9 files changed, 97 insertions(+), 20 deletions(-)

-- 
2.7.4

