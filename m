Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFFD96618D7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jan 2023 20:54:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233863AbjAHTyA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 14:54:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233817AbjAHTx7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 14:53:59 -0500
Received: from amity.mint.lgbt (vmi888983.contaboserver.net [149.102.157.145])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE1ABD10D
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jan 2023 11:53:57 -0800 (PST)
Received: from amity.mint.lgbt (mx.mint.lgbt [127.0.0.1])
        by amity.mint.lgbt (Postfix) with ESMTP id 4Nqnnw3YfHz1S5FN
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jan 2023 14:53:56 -0500 (EST)
Authentication-Results: amity.mint.lgbt (amavisd-new);
        dkim=pass (2048-bit key) reason="pass (just generated, assumed good)"
        header.d=mint.lgbt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mint.lgbt; h=
        content-transfer-encoding:mime-version:x-mailer:message-id:date
        :subject:to:from; s=dkim; t=1673207635; x=1674071636; bh=9dsgbhg
        A9vnJIYjG6YuVbFl47O4RVEcVJHNR4rpiPy0=; b=XZeTxp1l84FpPTY/Z14i5en
        WqmXm4e75S/oeXvOC7s4z+OU2cBm7RdW9qTcEBQP8RpNNAziA5Lf7FtlmrW02mUX
        9sPy/XjTNHPT0yBnZKwPN3FyRhz2bGu1Urli1x3rb9/DXMXFjydsNasr6ZgB03zV
        utuGL0S6SWM+bemSFOfZaZaoJ8mC3KwKRVVlS0FEF4FzHQ+DCwXfN7jbW18dJ0LR
        iawbeZupzEIM/st8dUh3QOp+Ofl/RbXhXjL+Pp/kQomSlaqmeMbTKtvauAUUF6e4
        NpzGO/hsxGX4mveTRXNZBU8MqiGbckyMGeJa39G9gX01s05eEuq+M4q4eRWh4zg=
        =
X-Virus-Scanned: amavisd-new at amity.mint.lgbt
Received: from amity.mint.lgbt ([127.0.0.1])
        by amity.mint.lgbt (amity.mint.lgbt [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id Qauvrw1g3I9L for <linux-arm-msm@vger.kernel.org>;
        Sun,  8 Jan 2023 14:53:55 -0500 (EST)
Received: from dorothy.. (unknown [186.105.5.197])
        by amity.mint.lgbt (Postfix) with ESMTPSA id 4Nqnnj34NHz1S56d;
        Sun,  8 Jan 2023 14:53:45 -0500 (EST)
From:   Lux Aliaga <they@mint.lgbt>
To:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        vkoul@kernel.org, kishon@kernel.org, alim.akhtar@samsung.com,
        avri.altman@wdc.com, bvanassche@acm.org, keescook@chromium.org,
        tony.luck@intel.com, gpiccoli@igalia.com
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-scsi@vger.kernel.org, linux-hardening@vger.kernel.org,
        phone-devel@vger.kernel.org, martin.botka@somainline.org,
        marijn.suijten@somainline.org
Subject: [PATCH v6 0/6] arm64: dts: qcom: sm6125: UFS and xiaomi-laurel-sprout support
Date:   Sun,  8 Jan 2023 16:53:30 -0300
Message-Id: <20230108195336.388349-1-they@mint.lgbt>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce Universal Flash Storage support on SM6125 and add support for t=
he Xiaomi Mi A3 based on the former platform. Uses the name xiaomi-laurel=
-sprout instead of the official codename (laurel_sprout) due to naming li=
mitations in the kernel.

Changes since v5:
- Drop "non-removable" property from ufs_mem_hc for sm6125 platform
- Drop "status" and "autorepeat" properties from gpio-keys node for xiaom=
i-laurel-sprout
- Rename "key-vol-up" node to "key-volume-up" for xiaomi-laurel-sprout
- Drop "gpio-key,wakeup" property from key-volume-up node for xiaomi-laur=
el-sprout
- Set "linux,input-type" and "wakeup-source" properties on key-volume-up =
node for xiaomi-laurel-sprout
- Change "key_vol_up" node name to "vol-up-n-state" and its label to "vol=
_up_n" in PM6125 GPIO node for xiaomi-laurel-sprout
- Use labels instead of node names for PM6125 ADC channels in xiaomi laur=
el-sprout
- Set "regulator-allow-set-load" properties on l4, l5, l10, l11, l18 and =
l24 regulators on xiaomi-laurel-sprout

v5: https://lore.kernel.org/linux-devicetree/20221231222420.75233-2-they@=
mint.lgbt/



