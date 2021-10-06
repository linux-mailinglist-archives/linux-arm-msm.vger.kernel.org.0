Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 027074236C0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 05:57:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237592AbhJFD6u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 23:58:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237954AbhJFD5d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 23:57:33 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF912C0613AD
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Oct 2021 20:54:26 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id u18so4430797lfd.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Oct 2021 20:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DZOpdA3eYjpudg4OpQFFkH8jLHw3BxsNdxzTMff7kgw=;
        b=Vqowca4UgiaC+fBXqBcu/uY1PBquzcLUSNLvI4m85X7UrokO3SMSU2VjgjwlLvMQmh
         qsx0PVYwuS97nctSczbW0/EPVJ0QBpI8npXxHwrFMaNxAVtaIlRSrtfDr/01lMkJFIzk
         NeLaREUo2x9NAHKctYTeKFJdcbLKG3DGrW4TE6vnxKsvxVRzGpwnzWZPAhbV6qTOP1TZ
         8albRcafCq9VIoNGF5i1EtEgCzTR7YeJxiTMPsw8rZxBFCSGpBQwXD+jrBjbyyQnVjnb
         ujZ8iI+IoHoh/d/5ZhPx+FNiAsGnS4MzGWDOWNQ3qbBfyZhavzipupkGO+MkveylWsCR
         B8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DZOpdA3eYjpudg4OpQFFkH8jLHw3BxsNdxzTMff7kgw=;
        b=rd6f9/rFXagdxrPQiShjond1OoyTfbznNX8hiilxJrT2GYkqWjnXK19uDIMTmEpSXS
         Au6DJ/eG8g5D8cXGvZIZ8GrdgwygeyCtmGiHV+URDFG9RcgYkjunsgZvXloq4HuKz7FL
         Oz7C6fSFu/84u+O6yiyEoRD7GxaM3XAPJy3AIH85gN5/vfl0tGw0uE/ERPPXYhIqrRnW
         X+ZANuEw4A4/ZJgTT/Xx3Ts9rJvxENMfYF7cjiMfYByghJzIZLJaOCjEu8KzowNxZDjQ
         5l6pZtbd9HHIZM0M8n8txT/4SxZA52/+7+NEHfSLlMtqwMGAx8U1/QKUZF0ausO0Of4r
         TpKw==
X-Gm-Message-State: AOAM531EM3eBjc0fXpfg/zLXjwblaW5KD0F02GAfvJij4Y4VU0R4DIE0
        7i5huyU+9HAb0R1rDPXP3sxuWQ==
X-Google-Smtp-Source: ABdhPJzAuciR0Bs89UsVK2ICmqc78PA7gPD8wfVqylDag0DqJdI3Y1HguWHKaOEbTu8SD0HZCDgojQ==
X-Received: by 2002:a2e:480a:: with SMTP id v10mr25910067lja.268.1633492465108;
        Tue, 05 Oct 2021 20:54:25 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s4sm2142967lfd.103.2021.10.05.20.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 20:54:24 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Kalle Valo <kvalo@codeaurora.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
        netdev@vger.kernel.org
Subject: [PATCH v1 15/15] WIP: arm64: dts: qcom: qrb5165-rb5: add bus-pwrseq property to pcie0
Date:   Wed,  6 Oct 2021 06:54:07 +0300
Message-Id: <20211006035407.1147909-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211006035407.1147909-1-dmitry.baryshkov@linaro.org>
References: <20211006035407.1147909-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 326330f528fc..0c347cb6f8e0 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -689,6 +689,7 @@ wifi-therm@1 {
 
 &pcie0 {
 	status = "okay";
+	bus-pwrseq = <&qca_pwrseq 0>;
 };
 
 &pcie0_phy {
-- 
2.33.0

