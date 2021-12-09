Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74EC346F282
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Dec 2021 18:53:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242064AbhLIR5U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Dec 2021 12:57:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242058AbhLIR5U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Dec 2021 12:57:20 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FBF6C0617A2
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Dec 2021 09:53:46 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id q3so11066383wru.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Dec 2021 09:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S94HYVQzH97jxu7RUKxapx+uPUnLaRlXd89o8iouWQ4=;
        b=clBLTvGizSA3Z+Xv1mYU1TqNvCQZ628HvQTdvb4RXcG9xjTQJrz8RAWriXk32hQlp+
         6ooEjMLnljBOhOsDm1gD42CZsjjUkprfYMZsxgsq+LOvDFdSsj27KXxigVURCn1be3xK
         mSsr+QMOfOnqjh4Zm8onTnBfLeO3AVEhwJ/obcpn4iDXlvtInC6LWGRA6sqwKeWwuKMR
         FmGbd7CwzsHlslOxGXq30SQo5c8nUkeYACtCIRZXz/XwgN8BlF3AM6kBHE+8Qu3jGWps
         c1Vi0AnHkGN6LLjkaTxVMsFxHVju2n0gNcSRcFzjh+OZPg4W7mZFonTPqX5dkIgVEz4z
         +1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S94HYVQzH97jxu7RUKxapx+uPUnLaRlXd89o8iouWQ4=;
        b=u9sBtuaBlerzjEAmhKtjpgvr0zlVajp2zQpsJWILo32OHPkE4ljPhXy6xRbX7LPMU7
         C05z6SKeMoBMxq1F1gkXyJjw8g5d1wt10thl5lsQ9ZsDFO28E9LxYrcyyqPSB4qfhK7d
         ozZdYkaypnM+TsQ/PjydGlH+Tpw802ZH76x0T7WCsYafZqgsCNTOThVNZQn9GL8ixFgK
         nqhmIg7nFnwuq4Iuv3lLp29/RgoLQhYX870Sl7QOQiZNB2mIqcJ1tvYUwZ3wzciYmbfX
         4XksAvGEb41by1BEFWPWlUpk5Y9id7jClkzdLoCPBKLVyiu4PSeH2Yg7q5dqyaHqmiFQ
         Ec5w==
X-Gm-Message-State: AOAM532DXhJvfVabFaqhKlXV4Ytx6yzebkHbDXB9kG/230yU68C616Ux
        /YsyMlbP/jLlUj0YY7c/iV9N3wUYi5DRCQ==
X-Google-Smtp-Source: ABdhPJwqrDwNcNOfNJ2qWV/r5L8ZFTBIZfAzptivi0DVQ8/eYhvKZ3L4btqok4jRQxhwzjvMQhiYoA==
X-Received: by 2002:adf:d1c1:: with SMTP id b1mr7986282wrd.296.1639072424892;
        Thu, 09 Dec 2021 09:53:44 -0800 (PST)
Received: from srini-hackbox.lan (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.gmail.com with ESMTPSA id 21sm427004wmj.18.2021.12.09.09.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:53:44 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 0/2] arm64: dts: qcom: c630: update sound card setup
Date:   Thu,  9 Dec 2021 17:53:40 +0000
Message-Id: <20211209175342.20386-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patchset fixes issue a with existing sound card setup on c630 and
also adds Headset button threshold values for button detection.

relevant UCM changes are at 
https://git.linaro.org/people/srinivas.kandagatla/alsa-ucm-conf.git/log/?h=v1.2.5/c630

Srinivas Kandagatla (2):
  arm64: dts: qcom: c630: Fix soundcard setup
  arm64: dts: qcom: c630: add headset jack and button detection support

 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

-- 
2.21.0

