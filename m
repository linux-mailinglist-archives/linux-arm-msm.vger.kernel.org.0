Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F34E2EF1CC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jan 2021 13:08:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727228AbhAHMGO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jan 2021 07:06:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726735AbhAHMGN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jan 2021 07:06:13 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75532C061290
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Jan 2021 04:04:57 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id i24so10916370edj.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Jan 2021 04:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PC2sXSUCVtuCTR4UN7c8iTkNydyknx8hb/BTqhYKVYU=;
        b=miKIH2/KA2gdiU3s0ELiBnYKEIeRnwm5UpU5m0MFQ2dV/8LbgCVRtrSEK8LyBjpz2E
         jE+txvOGyifb0nbxmuhUAy14tD/MLXievu93W0WWdnN58apTHJRhcjpBt1rctWz4pndg
         v1jmsAtEXD7Y+/YVm9lGdkibfYDMCuSFW1bgW/2B37ef0bFJ1J77Bn+wk/vHiFE3RO9p
         9n8/N8x49CnhauN5bZvw8wNsAr39Zz0VBY2xNnVYRnuW6vCXhjqvj4lGLHBovmEuYjT/
         lvavazo/YxEOkgisdtCTbFX2DyGTZQsubXUtXfo+V3FRwgNuy4XFVhYioCTPWIh+5VY0
         jitw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PC2sXSUCVtuCTR4UN7c8iTkNydyknx8hb/BTqhYKVYU=;
        b=dp8/3AWSW1S/wchyyKBgBtCy0S5tVaFsMDFi5GbYisuL2hTzxkXEoFyc73vZGq9+oF
         +ulnrHj3szEz9XWHeIfbHf6L+ozRtlETf1fwzmdcv3EYxzfhywPu+WQf92945rJum94j
         lonk2PohV68qwn35PWktOXOC8c8ShAdS5Ki1p2ckRM8UzWQUa36GHUAEMQ4r+cEfXyOg
         9v0xfl5GGC/RDXH+FI/a7u5PmWMz6QO343n80I/j7L7BLmBdmU+p/XT//u0llgTqVzyU
         NlAgUOGg+2GJcLIanw04MyNhgPNT9Y5dj86AaQytwrcZ4csbYy46wmySXz3rjRMBL50/
         Hm2Q==
X-Gm-Message-State: AOAM531Wr0eY3/EW8E2w6a31hYcxX1088mHTmnYC9pRMGMPTAZnOql4k
        NkNT4ToP9HQzp4I4kwYXf2U0fw==
X-Google-Smtp-Source: ABdhPJy+geP6y9YpBZworQOI4ogSqDq3lxSxUhRydOx5JQzx3dUSuK8aBoV0sHYmCuO0ZlJVQl5pCg==
X-Received: by 2002:aa7:df0d:: with SMTP id c13mr5146956edy.387.1610107495953;
        Fri, 08 Jan 2021 04:04:55 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:bb2e:8b50:322a:1b9a])
        by smtp.gmail.com with ESMTPSA id i18sm3674498edt.68.2021.01.08.04.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 04:04:55 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, leoyang.li@nxp.com, geert+renesas@glider.be,
        arnd@arndb.de, Anson.Huang@nxp.com, michael@walle.cc,
        agx@sigxcpu.org, max.oss.09@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 03/17] media: camss: Add CAMSS_845 camss version
Date:   Fri,  8 Jan 2021 13:04:15 +0100
Message-Id: <20210108120429.895046-4-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210108120429.895046-1-robert.foss@linaro.org>
References: <20210108120429.895046-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add enum representing the SDM845 SOC, which incorporates version
170 of the Titan architecture ISP.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 3a0484683cd6..46e986452824 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -66,6 +66,7 @@ enum camss_version {
 	CAMSS_8x16,
 	CAMSS_8x96,
 	CAMSS_660,
+	CAMSS_845,
 };
 
 struct camss {
-- 
2.27.0

