Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9490D46A018
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Dec 2021 16:55:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356861AbhLFP5q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Dec 2021 10:57:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387818AbhLFPyh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Dec 2021 10:54:37 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E358C07E5E1
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Dec 2021 07:40:07 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id v11so23254023wrw.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Dec 2021 07:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i6fTCBNWukPOt3wBrx1/7JFE0qpnlKKJtTP5y1N5eWU=;
        b=RxHby9kH1VoJb9Mavi3ad3+GXfps5X3G1LKPuMIjtf+Zb1aHClTqcYNyg5Krknww6t
         1H2nKGDO32TrXPHeygOJGP5wn8+GfTCati2UufXo8BI5N0SKKlom9T43GPB8UI00TG9C
         OBKEJG6xLd9L5MCVCerxOPhb1k18si62jWzAQslmpLNE+n36xdgqnUQXs9o7MGbrG2lf
         5xjSoJsesw5TzMyxyKcaQ3Q2/nhcvAwCMXEOENoYI8XiCgS+/jkmYIX9j+jpXp5zu7NM
         PTpxBIhHvube4cF9QLG5T4fKKv649m+rnD3Nrs1UR9dA5rReoc91nnJoce8b4laJN2xd
         PhsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i6fTCBNWukPOt3wBrx1/7JFE0qpnlKKJtTP5y1N5eWU=;
        b=wFqQqrGUhYM58QNJYrW7nU0vVfqz/yi3vjrk4OlbgZC4ThJxGeD3K3Z5O5ulkFFc3X
         wYjec8NaxozGvmOYaZsxWSfJz3xychDQ/22tEh0aZPw1z8x0m+ugtoFDgcHuMO1hyNqQ
         jv3wA8tfjdKtz/U4klfnllg4bSzJhXDQL60Jxnfm09PAEkaCUvR5Os/dTCIBmIjw4xmx
         03wX8DfRTqYiii7/kiXjKcWaHtEgSdKg1+wkCWTfK5DW4OppfD2m1uX6Jz1wwvBwdgy3
         LvOc4NVajNG3n7E7t4lbrD6LtvNt+6GCaEHuDBF11LByoYNUnTOScjtMyi5Y0SqaC/qp
         dluA==
X-Gm-Message-State: AOAM530d2L3Gtjt1oGLsO92CspvxVk7qM/0R7F/6uaqg32EBn6rKLTzt
        eAUHK1ck9bQfFuurIXh13I+3pFelQhjH3g==
X-Google-Smtp-Source: ABdhPJy5DHLjTylMVXKYVxebk0J1FBmtxrTd2RWEg+LpY8jnOdFNCNZyU2lE4C8qXRuNHLfcSo3Sdw==
X-Received: by 2002:adf:db47:: with SMTP id f7mr44845000wrj.113.1638805205923;
        Mon, 06 Dec 2021 07:40:05 -0800 (PST)
Received: from xps7590.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id g13sm15818962wrd.57.2021.12.06.07.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 07:40:05 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Mauro Carvalho <mchehab@kernel.org>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v4 0/2] Remove clock-lanes DT property from device trees
Date:   Mon,  6 Dec 2021 16:40:01 +0100
Message-Id: <20211206154003.39892-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series depends on the below series being merged.
https://lore.kernel.org/all/20211206151811.39271-1-robert.foss@linaro.org/

Changes since v3:
 - Bjorn: Added RBs for both patches
 - Split series into two series for the ARM64 & Media trees

Changes since v2:
 - Stephan: Rebased on v5.16-rc1
 - Stephan: Fixed 3/4 commit message title

Changes since v1:
 - Rob: Instead of documenting and fixing the use of the clock-lanes
   property, remove it, since it is is not programmable and
   therefore shouldn't be exposed in the DT.


Robert Foss (2):
  arm64: dts: qcom: apq8016-sbc: Remove clock-lanes property from &camss
    node
  arm64: dts: qcom: sdm845-db845c: Remove clock-lanes property from
    &camss node

 arch/arm64/boot/dts/qcom/apq8016-sbc.dts   | 2 --
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 3 ---
 2 files changed, 5 deletions(-)

-- 
2.32.0

