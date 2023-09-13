Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF1D579F1E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Sep 2023 21:20:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230419AbjIMTUJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Sep 2023 15:20:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230039AbjIMTUI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Sep 2023 15:20:08 -0400
Received: from smtp48.i.mail.ru (smtp48.i.mail.ru [95.163.41.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35E021999;
        Wed, 13 Sep 2023 12:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
        ; s=mailru; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
        Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
        X-Cloud-Ids:Disposition-Notification-To;
        bh=/MzMW0pdFPiGBBYF8AVkyaIqwIsDsYNGu2D9iG3+EIE=; t=1694632804; x=1694722804; 
        b=f735/DXfRJx/nc81NrtGoPvYg3TzEOX24RcGL6+5M/+0wYvnq7hiL3p6ovSDHXAj0viS4x+ea7L
        suoXWf/Zdta/u2MKUn8Q+56r4R1oDrUY0IA8w+OfLs7uHIcCnLPb4LxDz6e5BcDHN/F/AQ2kJHBDw
        VpUrnT87BigSFdK+XJ0=;
Received: by smtp48.i.mail.ru with esmtpa (envelope-from <danila@jiaxyga.com>)
        id 1qgVP5-00CPMR-2M; Wed, 13 Sep 2023 22:20:00 +0300
From:   Danila Tikhonov <danila@jiaxyga.com>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run,
        marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch,
        konrad.dybcio@linaro.org, johan+linaro@kernel.org,
        andersson@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH] drm/msm/adreno: Add support for SM7150 SoC machine
Date:   Wed, 13 Sep 2023 22:19:57 +0300
Message-ID: <20230913191957.26537-1-danila@jiaxyga.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp48.i.mail.ru; auth=pass smtp.auth=danila@jiaxyga.com smtp.mailfrom=danila@jiaxyga.com
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD927CFE6CA1630A10CF782CE425D4B0F1A540183BACB61478600894C459B0CD1B91FE74FCC09D826408EEA94788840D70E150C915093AC89B2242CE91CCB49B96E
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE743A67C3F703598BFEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AAEFEF2B38A4D0058638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8F4427A762C4539D123570855D0833A40117882F4460429724CE54428C33FAD305F5C1EE8F4F765FC292D688DDAD4E7BC389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8FA486DC37A503D0BF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C0085B890FD2717DA2D242C3BD2E3F4C64AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C38486209235C84D5EBA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF3D321E7403792E342EB15956EA79C166A417C69337E82CC275ECD9A6C639B01B78DA827A17800CE788761406820A3098731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A5AFBF33C4DC5339A9232AAEF9A448B50FB1F81E620164DE40F87CCE6106E1FC07E67D4AC08A07B9B0F254576263B31EA99C5DF10A05D560A950611B66E3DA6D700B0A020F03D25A0997E3FB2386030E77
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF1A8AEC52E45206157EBF47E1D4B24D61E5889C9FFBF66A603D4F391E8916E0EC392F865EE1B25CD5C4B8F2E8CFB8F5718993A19836A70E19B56C08E2E798176509F6894F2AE002664C41F94D744909CE4BCAC77546666B612CC0CD5AA9A1B9887EE09F5AAA95A50543082AE146A756F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojoMTWofjSWSTJDp2RIeQauA==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C7394981442F1286F52BEADC1B002AD7DC0A7F96273299E982988C7F643683D8C0F3ED1CA3C71A376745D86BBE86167304C7680C3980CE5AAA35C7CD60F22E8815EDE5EAEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SM7150 has 5 power levels which correspond to 5 speed-bin values: 0,
128, 146, 167, 172. Speed-bin value is calulated as FMAX/4.8MHz round up
to zero decimal places.

The vendor's FW GMU is called a618_gmu.bin. And also a618 on SM7150 uses
a615 zapfw.

Add this as machine = "qcom,sm7150", because speed-bin values are
different from atoll (sc7180/sm7125).

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index fa527935ffd4..64ef9813e9ae 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -293,6 +293,28 @@ static const struct adreno_info gpulist[] = {
 			{ 157, 3 },
 			{ 127, 4 },
 		),
+	}, {
+		.machine = "qcom,sm7150",
+		.chip_ids = ADRENO_CHIP_IDS(0x06010800),
+		.family = ADRENO_6XX_GEN1,
+		.revn = 618,
+		.fw = {
+			[ADRENO_FW_SQE] = "a630_sqe.fw",
+			[ADRENO_FW_GMU] = "a618_gmu.bin",
+		},
+		.gmem = SZ_512K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
+		.init = a6xx_gpu_init,
+		.zapfw = "a615_zap.mdt",
+		.hwcg = a615_hwcg,
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 128, 1 },
+			{ 146, 2 },
+			{ 167, 3 },
+			{ 172, 4 },
+		),
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x06010800),
 		.family = ADRENO_6XX_GEN1,
@@ -507,6 +529,10 @@ MODULE_FIRMWARE("qcom/a530_zap.b00");
 MODULE_FIRMWARE("qcom/a530_zap.b01");
 MODULE_FIRMWARE("qcom/a530_zap.b02");
 MODULE_FIRMWARE("qcom/a540_gpmu.fw2");
+MODULE_FIRMWARE("qcom/a615_zap.mbt");
+MODULE_FIRMWARE("qcom/a615_zap.b00");
+MODULE_FIRMWARE("qcom/a615_zap.b01");
+MODULE_FIRMWARE("qcom/a615_zap.b02");
 MODULE_FIRMWARE("qcom/a619_gmu.bin");
 MODULE_FIRMWARE("qcom/a630_sqe.fw");
 MODULE_FIRMWARE("qcom/a630_gmu.bin");
-- 
2.41.0

