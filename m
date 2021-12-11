Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55B3A4710EE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Dec 2021 03:23:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345864AbhLKC0e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Dec 2021 21:26:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345640AbhLKC0Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Dec 2021 21:26:24 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D653DC061D76
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Dec 2021 18:22:42 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id x10so17916854edd.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Dec 2021 18:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0vlB+HiEimZ6SFp79jIcvOvjtvYaAMP5gG+NgcNA//0=;
        b=E8WLMnqlqi3ACFoJKLNiHy64aVtWVahCGk3XSkM4+Gj1AKqY8yUQXP4NxFQ+EoGttv
         +VEfKy3BIz8rGTfT5X45U0pCuboIphd4ViM2KV7SpzI1xp/QtdMrTh53lTbYhuN0ezCQ
         EBqxpl6AsXz1VSHS/MTM5HrQ1utHW+agxgn5KeOdtFTjM9C5lRjurfVLFAY6fDvP6VoR
         8dZvFC6yPlB6dsWH0OwM8uO5g+pZULcKUXPkBlBbBRFtwaez6obdRnMspW1Mz6GiMott
         8zhhCmG7YQdq95VNWNkZb+5HMc44fhhwCh8IhDC9PIKUvQ96iw96zlqQfff9cihYqoKL
         ImIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0vlB+HiEimZ6SFp79jIcvOvjtvYaAMP5gG+NgcNA//0=;
        b=eqyu398DSqtX9ZXBawZLPV6TehZOzG8KivXYHp2r79fIiyPgFA6JU5R70V/mjsOKr+
         ujYLf2Cuc0os29HUxCW10q0bVwcAtinKDlAmvEXsTGr4LZAD6/BWLa2VYj4koJs4xc6A
         KB6/f6okb08Td/apkIgNsYntzXfEp5LoVLoSyqyU9N32k7+DiOMIlIUGVNb1/gUc5cBI
         4t5BWUkFgMWjwCFuCVuTpMPubC3kc5hYREUPHnGr4BpKO39HWc/a1CKWGjRN7eqE6eiI
         BBIw0zekQD+l+V4Gssv+iz4VYPml+B9BrFLqX+xzBZyJi+1S1WaA2v3jnkiG76hmXZlf
         r2vA==
X-Gm-Message-State: AOAM533TkF/Ac2tHTjo5zF74nG2ZB0CKOQEfC+GodGjuucyWaBPHaVXp
        Jw4WpQkEqj8N2svJBzyezdO3Iw==
X-Google-Smtp-Source: ABdhPJyiAnrPpCTVsSwW8avW1hpdLBXljsuaiNw0xjlqwJ32+D65jaQsRiBBs8U/PfFh4oL0lTYONg==
X-Received: by 2002:a17:906:4fc8:: with SMTP id i8mr28474735ejw.427.1639189361412;
        Fri, 10 Dec 2021 18:22:41 -0800 (PST)
Received: from lion.localdomain (cpc78119-cwma10-2-0-cust590.7-3.cable.virginm.net. [81.96.50.79])
        by smtp.gmail.com with ESMTPSA id s2sm2449424ejn.96.2021.12.10.18.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 18:22:41 -0800 (PST)
From:   Caleb Connolly <caleb.connolly@linaro.org>
X-Google-Original-From: Caleb Connolly <caleb@connolly.tech>
To:     caleb.connolly@linaro.org, sumit.semwal@linaro.org,
        amit.pundir@linaro.org, john.stultz@linaro.org
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 7/7] arm64: dts: qcom: sdm845-xiaomi-beryllium: enable RRADC
Date:   Sat, 11 Dec 2021 02:22:24 +0000
Message-Id: <20211211022224.3488860-8-caleb@connolly.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211211022224.3488860-1-caleb@connolly.tech>
References: <20211211022224.3488860-1-caleb@connolly.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Caleb Connolly <caleb.connolly@linaro.org>

Enable the PMI8998 RRADC.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
index 580d4cc1296f..481132b0cee4 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
@@ -312,6 +312,10 @@ resin {
 	};
 };
 
+&pmi8998_rradc {
+	status = "okay";
+};
+
 /* QUAT I2S Uses 1 I2S SD Line for audio on TAS2559/60 amplifiers */
 &q6afedai {
 	qi2s@22 {
-- 
2.34.1

