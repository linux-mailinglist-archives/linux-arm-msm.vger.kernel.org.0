Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B5E520F6C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2020 16:09:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388565AbgF3OJd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Jun 2020 10:09:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730339AbgF3OJd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Jun 2020 10:09:33 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A31ECC061755;
        Tue, 30 Jun 2020 07:09:31 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id d16so9716662edz.12;
        Tue, 30 Jun 2020 07:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2aw9SI1zZwxufKdUMmejN/ekatHE+VAVco1DX+Y+FY4=;
        b=rwwK6jpRJsEHiK4BoMlll0ENItVNp+mdP+ONVk1jZq6ohef/P76F/DtnarxckVKWQR
         BHstHgSub3cksT46FLvW/F7jYFucwEKwfUFffHse00k8NakI4sbCQ9vz0plj5z07KmDf
         BTLyYoWByVhXIV03J20RrH5AggIqbGVQX6NIDTbA29FuEaTzHo4q8a1jiHUVmzHpFp/0
         TMJbg4tqasK+gCNNOsAoHBhHFJZzPXjvl4foU3+d2v2ayU9l2jVRQVUCb+HrkwknRPWa
         Vk5VHuvga0SXfiYcEkRQSoCZU+cAzet08TBKBBim/+5oiohSWDy9gBHOTfdf8b+gI/8Y
         9UKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2aw9SI1zZwxufKdUMmejN/ekatHE+VAVco1DX+Y+FY4=;
        b=C3IuiKKQeKdsNdLTTMPX1NjWuE0Vj1pLHGQRG9yU3UM3GLpb9j8TieUqbfRk9ii/+L
         ARByIZDXSwq8MlkM58039z6nPI61xv5kxlN94dwu6mM6xFat65t789K9Zl0cQh2ZmGwo
         F7g27YEbuq3mfExxSXA+MHLQf/UAwXs+S2eRYiSugf99YJFYKnx8qle9EjXUuULoY63m
         Iy6DOAvc4ASlACbDWuJk0gkx4AJwH8DKkESPGqFogdUZ+G+3igkuhpSY+W9FJ0gJMIMv
         SbwNZZF+BwtE/sqEmI5NhtyXNwntyKxTeIlTCUEcqGVT7/rpynkaUzm+DB0HxyeLbcWR
         Timw==
X-Gm-Message-State: AOAM5336znGWlqK4yY5c0BTB9zez7d2MlEaxGHWSFENPoPK6KZH/GTB2
        3MBza5kebfQyrKxXlDFb/iY=
X-Google-Smtp-Source: ABdhPJzYXiy/R6+9eFuU9RewJe73bnv8r6K5lsqiboSZRIHamXRSwLD42BFEmfwnH2m+rnpJO5sLYQ==
X-Received: by 2002:a50:9dc8:: with SMTP id l8mr23076742edk.248.1593526170484;
        Tue, 30 Jun 2020 07:09:30 -0700 (PDT)
Received: from localhost ([213.191.183.145])
        by smtp.gmail.com with ESMTPSA id b98sm2982891edf.24.2020.06.30.07.09.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2020 07:09:29 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH 0/7] ARM: dts: qcom: msm8974: klte: Enable some hardware
Date:   Tue, 30 Jun 2020 17:09:05 +0300
Message-Id: <20200630140912.260294-1-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable support for various hw found on the Samsung Galaxy S5:
- touchkey (the two buttons around the home button)
- touchscreen
- notification led
- wifi
- external SD card

Please note that for working wifi the correct firmware is needed. Check [1]
for links and locations.

Also note, that to actually run a mainline kernel on the klte, you'd need
to apply this patch [2]. Any feedback on getting this to run on pure
mainline are welcome.

[1] https://gitlab.com/postmarketOS/pmaports/-/blob/master/firmware/firmware-samsung-klte/APKBUILD
[2] https://gitlab.com/postmarketOS/linux-postmarketos/-/commit/765f55b248cd3b231af8431fe2f2aeca263b4e4b

Iskren Chernev (7):
  ARM: dts: qcom: msm8974-klte: Merge pinctrl nodes
  ARM: dts: qcom: msm8974-klte: Add support for touchkey
  ARM: dts: qcom: msm8974-klte: Add support for touchscreen
  ARM: dts: qcom: msm8974-klte: Add support for led
  ARM: dts: qcom: msm8974-klte: Add gpio expander chip
  ARM: dts: qcom: msm8974-klte: Add support for wifi
  ARM: dts: qcom: msm8974-klte: Add support for SD card

 .../boot/dts/qcom-msm8974-samsung-klte.dts    | 301 +++++++++++++++++-
 1 file changed, 292 insertions(+), 9 deletions(-)


base-commit: c28e58ee9dadc99f79cf16ca805221feddd432ad
--
2.27.0

