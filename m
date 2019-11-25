Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 295B3108FCD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2019 15:25:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728039AbfKYOZP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Nov 2019 09:25:15 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:39590 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728023AbfKYOZP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Nov 2019 09:25:15 -0500
Received: by mail-lf1-f68.google.com with SMTP id f18so11162941lfj.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2019 06:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jJGjqIUVepPLRHV22oqqOHDreGtDqVWxcWdZC6G8yok=;
        b=l1SwZIBz0kpCh6mjQ1tTCN3YgKucw0MFxLyXXFgDJ9e9/VWs5egA1uNyn+s63YFdf5
         QD3+utHSpmupD0wvVrPU5Mxb/eQvgtRJwW5DW8Psi9RQSuluXnGY/K4C7UF0KxLHK+iI
         aHDstMocXx3EpwBIIv1jpBZQFtRKwAl8TYNRjNwfvoNv12MHpJKTmm7HiANy59nH7djp
         dhefBQRn2TrK3wyRhBlEjT3onEybhzYbJZbOtZl/IhXXDteAxFI5Ubb1dYlAB7Y6LemU
         Q33T3L+gsT4MdepvwuPEDR1d7p5Yfn0UxRkeMj2wUcYL2rWsC2AanuZFBTT1a5Nso8Ym
         dlAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jJGjqIUVepPLRHV22oqqOHDreGtDqVWxcWdZC6G8yok=;
        b=qaSS+8uHjmtjmuPoNJUZ2opaS0boVt/3n0tcjmjvrvgvElkizWhWO4enSsLtfbLUz7
         UMzN0XMleiuaqAAHyIyPgC+4FJjgPfqggwXgz2EnrLKNauxEPZgMft2A46vAOTxNARPM
         0xHFISfVcsn6GQ0BP6CUxlIzHhYJVpNQczYJcCLJUfvOBNp81jSxWGQV89zOeJSKGv2R
         SkthAP2eefPOzlDQffmZZpy+E3Vzq5jyaZUL4Be4CEDIhi9Y82JfYQVAr0qaxrnoICiN
         DpHWhbqQf7wT0jPL5Qo4/Bnj93R6x06KtrAblreSL1fuOyPCqtKJwS3u+kurlaonFiMk
         dLhA==
X-Gm-Message-State: APjAAAWRvNOCeSipDaOAk+2smRFDV5D/ao8jtRWBQFh4PeFEOEzqjkIc
        jCALEBY2zdFRZs8epuW6CAWIl2oFX57lCg==
X-Google-Smtp-Source: APXvYqzP9+NUfhIW+ld6KbXz6vRF5nWC4KK2171kbO1EU3AOvuqRZSjCLzfJbm9JvAixkFVrpwwVcQ==
X-Received: by 2002:a19:22c4:: with SMTP id i187mr19509055lfi.152.1574691912976;
        Mon, 25 Nov 2019 06:25:12 -0800 (PST)
Received: from centauri.lan (ua-84-217-220-205.bbcust.telenor.se. [84.217.220.205])
        by smtp.gmail.com with ESMTPSA id b28sm4595260ljp.9.2019.11.25.06.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 06:25:12 -0800 (PST)
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     amit.kucheria@linaro.org, bjorn.andersson@linaro.org,
        Niklas Cassel <niklas.cassel@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/5] DTS changes to support cpufreq on QCS404
Date:   Mon, 25 Nov 2019 15:25:05 +0100
Message-Id: <20191125142511.681149-1-niklas.cassel@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following DTS changes are required to enable cpufreq support on
the QCS404.

Changes since v1:
-Added a cover-letter.
-Swapped order of "pll" and "aux" clocks, in order to not break DT
backwards compatibility. (In case no clock-names are given, "pll" still
has to be the first clock).
-Removed incorrect newline in the middle of the cpu0 DT node.
(This extra newline must have been added by mistake, since no other
cpuX node in the same cluster had this extra newline added.)

Jorge Ramirez-Ortiz (5):
  arm64: dts: qcom: msm8916: Add the clocks for the APCS mux/divider
  arm64: dts: qcom: qcs404: Add HFPLL node
  arm64: dts: qcom: qcs404: Add the clocks for APCS mux/divider
  arm64: dts: qcom: qcs404: Add DVFS support
  arm64: defconfig: Enable HFPLL

 arch/arm64/boot/dts/qcom/msm8916.dtsi |  3 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi  | 42 +++++++++++++++++++++++++++
 arch/arm64/configs/defconfig          |  1 +
 3 files changed, 45 insertions(+), 1 deletion(-)

-- 
2.23.0

