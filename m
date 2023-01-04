Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E5AE65D1E7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jan 2023 12:56:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239155AbjADLz7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Jan 2023 06:55:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239136AbjADLzh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Jan 2023 06:55:37 -0500
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E2EB1DDE4;
        Wed,  4 Jan 2023 03:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1672833331;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=JdRxlbw1R3Vopf51aW056z0eb59n+WtBycAy9CiYyJg=;
    b=tT2452AfN0FRp0yP/Wn9I6NlA0Fp+kdeK6UpxExucleykwccdn8s9tKtOfG+WVMo3U
    mbEkFxNvJxap9chAbSxcfSt6CNdyj4lOUQ6gJaHZWxwJ3b3wcPbOUUk/T89Dqjx4JoAA
    uvMxH8tZB0eogtLVk2v1bxs4fgSXjIfqlaIaj7gix81mIadycUFGML5mCDohQiUYY36O
    quceEv44k7FfOvALybnSRqcpTRTS3DFkj/3Y4mp/6/Lb/q1rMrSDZ315u0QP1lMeNPsN
    TWp9t6/+mSnS11YgF3lUfjb6er4HTjiu1SAFXyrpHwUZPabAKXUn0ovPT8u9/HXUTj13
    2LQw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIRvweF+KLA=="
X-RZG-CLASS-ID: mo02
Received: from droid..
    by smtp.strato.de (RZmta 48.2.1 DYNA|AUTH)
    with ESMTPSA id Yce349z04BtVkzK
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Wed, 4 Jan 2023 12:55:31 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 3/4] dt-bindings: arm: qcom,ids: Add a bunch of older SoCs
Date:   Wed,  4 Jan 2023 12:53:47 +0100
Message-Id: <20230104115348.25046-4-stephan@gerhold.net>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230104115348.25046-1-stephan@gerhold.net>
References: <20230104115348.25046-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Sync the SoC IDs in qcom,ids.h with relevant entries from Qualcomm's LK
bootloader [1] that is used for almost all older Qualcomm SoCs.

Several of these are already supported, e.g.:
  - MSM8960 -> APQ8060, MSM8260, ...
  - MSM8976 -> APQ8076
  - MSM8956 -> APQ8056
Others are currently being worked on, e.g.:
  - MSM8909(W) -> APQ8009(W), MSM8905, MSM8209, ...
  - MSM8939 -> MSM8239, ...

And even all remaining ones added are close enough to what is already
supported so that future support is realistic (if someone steps up to
do the work).

Add all of them at once to avoid having to add them one by one in the
future. This will also benefit other projects making use of the same
dt-bindings, e.g. bootloaders where adding support for all these SoCs
is a bit easier than on Linux.

[1]: https://git.codelinaro.org/clo/la/kernel/lk/-/blob/9d563e4a1d38c5a662bf94215ffc828db57c9e19/platform/msm_shared/smem.h#L286

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 include/dt-bindings/arm/qcom,ids.h | 74 ++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 18746bd3e595..22d7ba17804b 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -11,36 +11,62 @@
  * The MSM chipset and hardware revision used by Qualcomm bootloaders, DTS for
  * older chipsets (qcom,msm-id) and in socinfo driver:
  */
+#define QCOM_ID_MSM8260			70
+#define QCOM_ID_MSM8660			71
+#define QCOM_ID_APQ8060			86
 #define QCOM_ID_MSM8960			87
 #define QCOM_ID_APQ8064			109
+#define QCOM_ID_MSM8930			116
+#define QCOM_ID_MSM8630			117
+#define QCOM_ID_MSM8230			118
+#define QCOM_ID_APQ8030			119
+#define QCOM_ID_MSM8627			120
+#define QCOM_ID_MSM8227			121
 #define QCOM_ID_MSM8660A		122
 #define QCOM_ID_MSM8260A		123
 #define QCOM_ID_APQ8060A		124
 #define QCOM_ID_MSM8974			126
+#define QCOM_ID_MSM8225			127
+#define QCOM_ID_MSM8625			129
 #define QCOM_ID_MPQ8064			130
 #define QCOM_ID_MSM8960AB		138
 #define QCOM_ID_APQ8060AB		139
 #define QCOM_ID_MSM8260AB		140
 #define QCOM_ID_MSM8660AB		141
+#define QCOM_ID_MSM8930AA		142
+#define QCOM_ID_MSM8630AA		143
+#define QCOM_ID_MSM8230AA		144
 #define QCOM_ID_MSM8626			145
 #define QCOM_ID_MSM8610			147
 #define QCOM_ID_APQ8064AB		153
+#define QCOM_ID_MSM8930AB		154
+#define QCOM_ID_MSM8630AB		155
+#define QCOM_ID_MSM8230AB		156
+#define QCOM_ID_APQ8030AB		157
 #define QCOM_ID_MSM8226			158
 #define QCOM_ID_MSM8526			159
+#define QCOM_ID_APQ8030AA		160
 #define QCOM_ID_MSM8110			161
 #define QCOM_ID_MSM8210			162
 #define QCOM_ID_MSM8810			163
 #define QCOM_ID_MSM8212			164
 #define QCOM_ID_MSM8612			165
 #define QCOM_ID_MSM8112			166
+#define QCOM_ID_MSM8125			167
 #define QCOM_ID_MSM8225Q		168
 #define QCOM_ID_MSM8625Q		169
 #define QCOM_ID_MSM8125Q		170
 #define QCOM_ID_APQ8064AA		172
 #define QCOM_ID_APQ8084			178
+#define QCOM_ID_MSM8130			179
+#define QCOM_ID_MSM8130AA		180
+#define QCOM_ID_MSM8130AB		181
+#define QCOM_ID_MSM8627AA		182
+#define QCOM_ID_MSM8227AA		183
 #define QCOM_ID_APQ8074			184
 #define QCOM_ID_MSM8274			185
 #define QCOM_ID_MSM8674			186
+#define QCOM_ID_MDM9635			187
 #define QCOM_ID_MSM8974PRO_AC		194
 #define QCOM_ID_MSM8126			198
 #define QCOM_ID_APQ8026			199
@@ -68,34 +94,72 @@
 #define QCOM_ID_MSM8510			225
 #define QCOM_ID_MSM8512			226
 #define QCOM_ID_MSM8936			233
+#define QCOM_ID_MDM9640			234
 #define QCOM_ID_MSM8939			239
 #define QCOM_ID_APQ8036			240
 #define QCOM_ID_APQ8039			241
+#define QCOM_ID_MSM8236			242
+#define QCOM_ID_MSM8636			243
+#define QCOM_ID_MSM8909			245
 #define QCOM_ID_MSM8996			246
 #define QCOM_ID_APQ8016			247
 #define QCOM_ID_MSM8216			248
 #define QCOM_ID_MSM8116			249
 #define QCOM_ID_MSM8616			250
 #define QCOM_ID_MSM8992			251
+#define QCOM_ID_APQ8092			252
 #define QCOM_ID_APQ8094			253
+#define QCOM_ID_MSM8209			258
+#define QCOM_ID_MSM8208			259
+#define QCOM_ID_MDM9209			260
+#define QCOM_ID_MDM9309			261
+#define QCOM_ID_MDM9609			262
+#define QCOM_ID_MSM8239			263
+#define QCOM_ID_MSM8952			264
+#define QCOM_ID_APQ8009			265
 #define QCOM_ID_MSM8956			266
+#define QCOM_ID_MSM8929			268
+#define QCOM_ID_MSM8629			269
+#define QCOM_ID_MSM8229			270
+#define QCOM_ID_APQ8029			271
+#define QCOM_ID_APQ8056			274
+#define QCOM_ID_MSM8609			275
+#define QCOM_ID_APQ8076			277
 #define QCOM_ID_MSM8976			278
+#define QCOM_ID_MDM9650			279
+#define QCOM_ID_MDM9655			283
+#define QCOM_ID_MDM9250			284
+#define QCOM_ID_MDM9255			285
+#define QCOM_ID_MDM9350			286
+#define QCOM_ID_APQ8052			289
 #define QCOM_ID_MDM9607			290
 #define QCOM_ID_APQ8096			291
 #define QCOM_ID_MSM8998			292
 #define QCOM_ID_MSM8953			293
+#define QCOM_ID_MSM8937			294
+#define QCOM_ID_APQ8037			295
 #define QCOM_ID_MDM8207			296
 #define QCOM_ID_MDM9207			297
 #define QCOM_ID_MDM9307			298
 #define QCOM_ID_MDM9628			299
+#define QCOM_ID_MSM8909W		300
+#define QCOM_ID_APQ8009W		301
+#define QCOM_ID_MSM8996L		302
+#define QCOM_ID_MSM8917			303
 #define QCOM_ID_APQ8053			304
 #define QCOM_ID_MSM8996SG		305
+#define QCOM_ID_APQ8017			307
+#define QCOM_ID_MSM8217			308
+#define QCOM_ID_MSM8617			309
 #define QCOM_ID_MSM8996AU		310
 #define QCOM_ID_APQ8096AU		311
 #define QCOM_ID_APQ8096SG		312
+#define QCOM_ID_MSM8940			313
+#define QCOM_ID_SDX201			314
 #define QCOM_ID_SDM660			317
 #define QCOM_ID_SDM630			318
 #define QCOM_ID_APQ8098			319
+#define QCOM_ID_MSM8920			320
 #define QCOM_ID_SDM845			321
 #define QCOM_ID_MDM9206			322
 #define QCOM_ID_IPQ8074			323
@@ -103,6 +167,8 @@
 #define QCOM_ID_SDM658			325
 #define QCOM_ID_SDA658			326
 #define QCOM_ID_SDA630			327
+#define QCOM_ID_MSM8905			331
+#define QCOM_ID_SDX202			333
 #define QCOM_ID_SDM450			338
 #define QCOM_ID_SM8150			339
 #define QCOM_ID_SDA845			341
@@ -114,10 +180,15 @@
 #define QCOM_ID_SDM632			349
 #define QCOM_ID_SDA632			350
 #define QCOM_ID_SDA450			351
+#define QCOM_ID_SDM439			353
+#define QCOM_ID_SDM429			354
 #define QCOM_ID_SM8250			356
 #define QCOM_ID_SA8155			362
+#define QCOM_ID_SDA439			363
+#define QCOM_ID_SDA429			364
 #define QCOM_ID_IPQ8070			375
 #define QCOM_ID_IPQ8071			376
+#define QCOM_ID_QM215			386
 #define QCOM_ID_IPQ8072A		389
 #define QCOM_ID_IPQ8074A		390
 #define QCOM_ID_IPQ8076A		391
@@ -127,11 +198,14 @@
 #define QCOM_ID_IPQ8071A		396
 #define QCOM_ID_IPQ6018			402
 #define QCOM_ID_IPQ6028			403
+#define QCOM_ID_SDM429W			416
 #define QCOM_ID_SM4250			417
 #define QCOM_ID_IPQ6000			421
 #define QCOM_ID_IPQ6010			422
 #define QCOM_ID_SC7180			425
 #define QCOM_ID_SM6350			434
+#define QCOM_ID_QCM2150			436
+#define QCOM_ID_SDA429W			437
 #define QCOM_ID_SM8350			439
 #define QCOM_ID_SM6115			444
 #define QCOM_ID_SC8280XP		449
-- 
2.39.0

