Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC794F2693
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 05:33:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733034AbfKGEd2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 23:33:28 -0500
Received: from mail-pf1-f170.google.com ([209.85.210.170]:43651 "EHLO
        mail-pf1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727279AbfKGEd2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 23:33:28 -0500
Received: by mail-pf1-f170.google.com with SMTP id 3so1412227pfb.10;
        Wed, 06 Nov 2019 20:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=nvxthaTfx1srxjTfLKFTlEDvlap5S76uZJxJFqI/x1U=;
        b=VbGDR0Nb1EQSuzSPC8FSACWw0fjgvYrV/hhqciF7gnKRmrdIA7CGfSWxv1QMc14U0B
         b8pHqRLXpZCcT8Wo76xwNwwaige8ZAeiCKPJa8ieU40wIOLnEHvL3ZwJfVkgEt+6PfSJ
         88uJPWXIFc5Z24Bz2hlgxsS3eIkipdHY3WqdfX3/ZJd/WOnoXGPiUCqShLlS8CYm4FFx
         K0RPEP2/l7ybJ2Fexb/RYjG+M6T+UGJ05tWekh18VnbidMf7e2oNIlL/LIEbkOw4zFNN
         BE+O3n1Dgxwz9PwSbD3UqBntLYjgK1LZo6pLpzwDG2290sJBBNU97DVjeAZkoAgwfla0
         m8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=nvxthaTfx1srxjTfLKFTlEDvlap5S76uZJxJFqI/x1U=;
        b=cKaOy1GlB+FGGfItaDkYL6YuwWWExW4eJjrK+Xq/zFUTHeMo6SxRwnrFgiT234T/24
         9d6BrqFB2+8bg9ryghm322WPYiCIUXcKYIoQvfl6K77yqNvxa8FVkEBgoNDBuLk8vsEY
         bSGkMF5YMufEYLdxHA0y3Ylh1c1qhBItYQmSlIaHU35XMmp4kh9SgNkQz14vXSl9XIm2
         vw2roLNT/KyzIbFYjtx2qePlNWtP8sFx08ioHnXH7PiONgHft0CLKNoI4CxCAkah3LGt
         IzWpMrQT//3w/GiYwfXpuE5CN4cAU5fKDkQ1fQxJQPr5h6Jn4+Y8m2hj39eWnmthAc1a
         +YOQ==
X-Gm-Message-State: APjAAAUt2rdvSlHEsqU/DucqXrvrnr9XlVtkgWkN72CtlUtE+5D2ug/M
        mu+b8LyBi/MfhV0aRJ5kheM=
X-Google-Smtp-Source: APXvYqzvQDJRLnQ5r45vQi0+NBjgKhjH6Tpy9LfE5QVgtojjyywbiFxPsu0SHClDFyPtGI12/BsCag==
X-Received: by 2002:a63:a452:: with SMTP id c18mr1978944pgp.188.1573101207815;
        Wed, 06 Nov 2019 20:33:27 -0800 (PST)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id r22sm737524pfg.54.2019.11.06.20.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 20:33:27 -0800 (PST)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH 0/2] MSM8998 describe wifi hardware
Date:   Wed,  6 Nov 2019 20:33:11 -0800
Message-Id: <20191107043313.4055-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We can describe the wifi hardware for the MSM8998 platforms.  The
firmware runs on the modem subsystem, which is pending clock changes, so
wifi won't be completely functional yet.  However, by describing the
wifi hardware, we can use it as soon as the modem pieces come in.

Jeffrey Hugo (2):
  arm64: dts: qcom: msm8998: Add anoc2 smmu node
  arm64: dts: qcom: msm8998: Add wifi node

 .../boot/dts/qcom/msm8998-clamshell.dtsi      |  9 ++++
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi     |  9 ++++
 arch/arm64/boot/dts/qcom/msm8998.dtsi         | 50 +++++++++++++++++++
 3 files changed, 68 insertions(+)

-- 
2.17.1

