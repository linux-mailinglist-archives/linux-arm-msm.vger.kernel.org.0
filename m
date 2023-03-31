Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BE716D281E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Mar 2023 20:49:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233051AbjCaStx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Mar 2023 14:49:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233151AbjCaStv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Mar 2023 14:49:51 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CADDC20DA1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Mar 2023 11:49:49 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32VHj05P020407;
        Fri, 31 Mar 2023 18:49:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=mfw/UjGa6SPTDb3sZoAoaGbNxAHmt1A9+2hPPHY/zE4=;
 b=MvfRHnF8vDnn4yUfrGE63UHroRhF0wrVAWGoGTQfetGcTGhtMkS31GqiKWM6LWn2DIx4
 9+pWUApVuJCzYjEsGCaZp/EzjVQtqoCJHHgb0iJUkjfLlagYKE2KBFjDjOfLtAME+NXW
 2mwkFxfdn8ue1jOVAJYZhl+iQ/dgE/djrGmAEZ6mHoc31HUIYR81chJUlFUgiQTBkxA3
 DY10oFAqkyL8teNSgWdFvAardaFcf+hOvrfZHfRWussr4UQsr8epodV3zjMdSxrY85cO
 NsYJR5jBFLBv6frPbg9Wbdgrd2eXba3cOln/4i98cUr8d9PkXVn1zDG2Qh0U1eeyCMk+ 2w== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pp29srkhv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 31 Mar 2023 18:49:42 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32VIngrt010573
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 31 Mar 2023 18:49:42 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 31 Mar 2023 11:49:42 -0700
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
Date:   Fri, 31 Mar 2023 11:49:19 -0700
Subject: [PATCH RFC v2 4/6] drm/msm/dpu: Fix slice_last_group_size
 calculation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230329-rfc-msm-dsc-helper-v2-4-3c13ced536b2@quicinc.com>
References: <20230329-rfc-msm-dsc-helper-v2-0-3c13ced536b2@quicinc.com>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v2-0-3c13ced536b2@quicinc.com>
To:     <freedreno@lists.freedesktop.org>
CC:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, <dri-devel@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>,
        "Jessica Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.13-dev-00303
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680288580; l=1093;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=LOoU48jUOI5So+PzGk8OQrrnD7/zf3G4RhnsPIPf+gE=;
 b=AbZFI1mPWFwulvI2WAK1yeGBhM+Gehwx5gdee1XXwwUhu2e1Loiu7oXTmjhh0WA5ryesadqkQ
 KGXd374zmtLBogJA8387o6D8jRWc+OARaAJtpAYxJc4Z/DTPbkvbnOk
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YaXhtdfjqvxqQM2dyV6Z6L0VA7JPuEIN
X-Proofpoint-ORIG-GUID: YaXhtdfjqvxqQM2dyV6Z6L0VA7JPuEIN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-31_07,2023-03-31_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=962 spamscore=0 malwarescore=0
 mlxscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303310151
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Correct the math for slice_last_group_size so that it matches the
calculations downstream.

Fixes: c110cfd1753e ("drm/msm/disp/dpu1: Add support for DSC")
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
index b952f7d2b7f5..9312a8d7fbd9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
@@ -56,7 +56,11 @@ static void dpu_hw_dsc_config(struct dpu_hw_dsc *hw_dsc,
 	if (is_cmd_mode)
 		initial_lines += 1;
 
-	slice_last_group_size = 3 - (dsc->slice_width % 3);
+	slice_last_group_size = dsc->slice_width % 3;
+
+	if (slice_last_group_size == 0)
+		slice_last_group_size = 3;
+
 	data = (initial_lines << 20);
 	data |= ((slice_last_group_size - 1) << 18);
 	/* bpp is 6.4 format, 4 LSBs bits are for fractional part */

-- 
2.39.2

