Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F0C570286C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 May 2023 11:27:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239972AbjEOJ07 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 May 2023 05:26:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240033AbjEOJ0l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 May 2023 05:26:41 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D99152D41
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 02:25:20 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3f41dceb9d1so95516785e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 02:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684142718; x=1686734718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PVidKPM6B2z7ddqDY5aZH6ShVFOkPon+GZvhdRhyC+I=;
        b=yvkH4Qgu/dwqliFP7mDhEJKWKKVgcEUkdrPtIxjen3Hd6A7Tu0RXeDdCtK0m7KJLKk
         k7+FpDzBxJNRgbFpxWPtvBhFdowCcoibvxT7VFm2Kf/VmP8jA/2P/OLV6BbM4Fd6/7tt
         cAWULVtEsc1vq0pvO8dbjFKVUbINxHOb985FoR4jB/g+Wm0qakdTe+ctmYWMBhqJz4mV
         1MeH8UqbP71+F+OksoBcAfgEG3lGzlYtPZd8d7GQVU/d4g8svoB5wsBN7u6AvfV1tkZa
         k8/VDCpPlPwbxQV4JAnlkw06255O/V92DgvrAkROh8LcXUAUjjEiiZQ+SEebQIh6YjSg
         EbEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684142718; x=1686734718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PVidKPM6B2z7ddqDY5aZH6ShVFOkPon+GZvhdRhyC+I=;
        b=Bcr22TshU9DN1BeHoYawP9HcHbfmXW5rtDMPe4FMsoeMa8HvxkR/lsfPTIA8+5O93r
         mYPb/8lI2Wr4DxMXBg/L8wSjxf1QGY5VrhfLdpNnoXKDDk4d83xExB3oBzVWeXDJpk/U
         OCHtfjWSFcxh/M8mEvS1zqkRu75AbliDPyQqMoCsEVcvjC+lo0JDDDNJhRIH9vG1Rrik
         lB18rQ/C4cbeD1vcGhhyrO4F++xmZM7dXnYSQJOfhV3o54EEUdrZpOuzCZ6cPDQ8eVa+
         dtImiNNsHmjqn1RzliNbCpYbxdZYHe9uPv5vXHYFU8n3WuzkMnSbJB4sNRA+GxD+Iw0i
         Jojg==
X-Gm-Message-State: AC+VfDxLW+i+WGl2d6Xs53KgtryInSSPb9utXR0t5zrOa3Wl6crHu7ZM
        ID/qtWHgP+/l/HOzwX6hdAbszg==
X-Google-Smtp-Source: ACHHUZ62YhhyaBS2jVJvAuBbi9ScTBt4hk24OJHdQyaZCVpoDF+uyjZhhpE8DLxisuDUzjVVGH5xdQ==
X-Received: by 2002:a05:600c:cf:b0:3f4:9bee:b9c with SMTP id u15-20020a05600c00cf00b003f49bee0b9cmr13459168wmm.18.1684142717849;
        Mon, 15 May 2023 02:25:17 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:1388:9f6:c7d9:3b77])
        by smtp.gmail.com with ESMTPSA id s2-20020a5d4ec2000000b003063a92bbf5sm32013764wrv.70.2023.05.15.02.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 02:25:17 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2] pinctrl: qcom: sa8775p: add the wakeirq map
Date:   Mon, 15 May 2023 11:25:15 +0200
Message-Id: <20230515092515.180920-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The SA8775P TLMM driver is missing the GPIO-to-wakeup-pin mapping. This
adds it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
v1 -> v2:
- fix the 30->200 mapping

 drivers/pinctrl/qcom/pinctrl-sa8775p.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-sa8775p.c b/drivers/pinctrl/qcom/pinctrl-sa8775p.c
index 2ae7cdca65d3..6ea0197b36c6 100644
--- a/drivers/pinctrl/qcom/pinctrl-sa8775p.c
+++ b/drivers/pinctrl/qcom/pinctrl-sa8775p.c
@@ -1491,6 +1491,23 @@ static const struct msm_pingroup sa8775p_groups[] = {
 	[153] = SDC_QDSD_PINGROUP(sdc1_data, 0x199000, 9, 0),
 };
 
+static const struct msm_gpio_wakeirq_map sa8775p_pdc_map[] = {
+	{ 0, 169 }, { 1, 174 }, { 2, 170 }, { 3, 175 }, { 4, 171 }, { 5, 173 },
+	{ 6, 172 }, { 7, 182 }, { 10, 220 }, { 11, 213 }, { 12, 221 },
+	{ 16, 230 }, { 19, 231 }, { 20, 232 }, { 23, 233 }, { 24, 234 },
+	{ 26, 223 }, { 27, 235 }, { 28, 209 }, { 29, 176 }, { 30, 200 },
+	{ 31, 201 }, { 32, 212 }, { 35, 177 }, { 36, 178 }, { 39, 184 },
+	{ 40, 185 }, { 41, 227 }, { 42, 186 }, { 43, 228 }, { 45, 187 },
+	{ 47, 188 }, { 48, 194 }, { 51, 195 }, { 52, 196 }, { 55, 197 },
+	{ 56, 198 }, { 57, 236 }, { 58, 192 }, { 59, 193 }, { 72, 179 },
+	{ 73, 180 }, { 74, 181 }, { 75, 202 }, { 76, 183 }, { 77, 189 },
+	{ 78, 190 }, { 79, 191 }, { 80, 199 }, { 83, 204 }, { 84, 205 },
+	{ 85, 229 }, { 86, 206 }, { 89, 207 }, { 91, 208 }, { 94, 214 },
+	{ 95, 215 }, { 96, 237 }, { 97, 216 }, { 98, 238 }, { 99, 217 },
+	{ 100, 239 }, { 105, 219 }, { 106, 210 }, { 107, 211 }, { 108, 222 },
+	{ 109, 203 }, { 145, 225 }, { 146, 226 },
+};
+
 static const struct msm_pinctrl_soc_data sa8775p_pinctrl = {
 	.pins = sa8775p_pins,
 	.npins = ARRAY_SIZE(sa8775p_pins),
@@ -1499,6 +1516,8 @@ static const struct msm_pinctrl_soc_data sa8775p_pinctrl = {
 	.groups = sa8775p_groups,
 	.ngroups = ARRAY_SIZE(sa8775p_groups),
 	.ngpios = 150,
+	.wakeirq_map = sa8775p_pdc_map,
+	.nwakeirq_map = ARRAY_SIZE(sa8775p_pdc_map),
 };
 
 static int sa8775p_pinctrl_probe(struct platform_device *pdev)
-- 
2.39.2

