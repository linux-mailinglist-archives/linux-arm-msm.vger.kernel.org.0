Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0301F337BD0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 19:11:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230176AbhCKSKd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 13:10:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230196AbhCKSKG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 13:10:06 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D28EC061760
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 10:10:06 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id o19so4213871edc.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 10:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qa4VJOH7edLfgrfvR8OaRVl2g9iMvgF1hLjXeKfPqA4=;
        b=U/jGIF63pHPQlTFqvJpaJD7y9g+zXOMxUTmCLDoTDyWdGD5ahnTKhiB0+yP1TPeGqH
         Y3icOkQRASyeOTj2NZ+XfONHMstpPOJ8mN4ydGBu/TpdiuNgyzsKeNcUXMqwsd7YiLse
         2geJarY3Nr+Ph0PCxWmwKjoSHqE8CpQEHdy4dw17QFpaMzKxlgHS4kK5UVqQ8j9eapwU
         5NE8BdQ6SJSzkdbBHotU8Bx5Btuy6qelmhRaJ5gSv8D+5hjrMPc/R39OoW5JYJoyVfa9
         qIbuLHliGA48AfXB8A1lDZRvC7CDnxrSyffrzWp9RhEDfeYmI02kgOH+hMsIW5xDppHq
         z+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qa4VJOH7edLfgrfvR8OaRVl2g9iMvgF1hLjXeKfPqA4=;
        b=QSUu71FGUDyo5icHthNALf41dE5r/ZA+M/ZEHOVIKGb2md28GS+D7blbzLglRT7Gpx
         0F6ZMA+OqgYQqx4/bVbCzsjiuU/GPXe9gpMUxnVvRBI4DvyQKvwdCdHDylnEaUZ2c54i
         t+aXuY38KQh+jgDgLCfMDh04UxhXqXS0ipcaxID9eQJsBx0+4Pfvm5rVjWFvz5SHRXXP
         wpZ8QRkSXDCLh33AgHKKq7E8PKG67OTqHViLM5CMaYB5Lk1bpbX7hGuZ+lvGDVw++eng
         V9AQ8sKjOQrv1OyT1Dukz2NF2JIRoiBr+n+onczKadVzyre6UYKdeKs2huOfRgXVJy9A
         YrOA==
X-Gm-Message-State: AOAM531WBqBh2u51hBBhhFLyirGOwW47OaTqhNr6uyOkgMg1mn8SNlIU
        6yPYvUJxRim60zFBvL3t2LWNOA==
X-Google-Smtp-Source: ABdhPJxQYlVKZoxoNhRG//Zv4/sGy/BTCwUuDVISE+v2ISlgRpQDIPd0dUHftdLOu+MiBlqu4EAsqg==
X-Received: by 2002:a05:6402:104c:: with SMTP id e12mr9544330edu.108.1615486205083;
        Thu, 11 Mar 2021 10:10:05 -0800 (PST)
Received: from localhost.localdomain ([2a02:2454:3e3:5f00:8e01:34c:da50:eb7e])
        by smtp.gmail.com with ESMTPSA id a22sm1741290ejr.89.2021.03.11.10.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 10:10:04 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v7 04/22] media: camss: Add CAMSS_845 camss version
Date:   Thu, 11 Mar 2021 19:09:30 +0100
Message-Id: <20210311180948.268343-5-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210311180948.268343-1-robert.foss@linaro.org>
References: <20210311180948.268343-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add enum representing the SDM845 SOC, which incorporates version
170 of the Titan architecture ISP.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---

Changes since v5:
 - Andrey: Add r-b


 drivers/media/platform/qcom/camss/camss.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index e29466d07ad2..63b35ea2ca36 100644
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

