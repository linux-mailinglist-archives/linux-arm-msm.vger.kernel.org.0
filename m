Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E979F3A072A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jun 2021 00:39:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235339AbhFHWlD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 18:41:03 -0400
Received: from mail-qt1-f174.google.com ([209.85.160.174]:45605 "EHLO
        mail-qt1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235360AbhFHWky (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 18:40:54 -0400
Received: by mail-qt1-f174.google.com with SMTP id l17so12408666qtq.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jun 2021 15:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8P0FnlG0YttnZy7G9DIFqllXRTBKP0W3XSSCKygwnEE=;
        b=DWSo1OszYz5aKItcDr+djliHZDNXb3OoTGfE2Z5EwQ+D6ApkFO4IoolMP7WYykYrZ/
         aoFFpvyNIpxuaDTRzENXnTOJdr0IV2UocIXIdSiNLA0FwOVamuKBSpfnmVcxGj/cjmBy
         BeCJRuxiVTHRBGdwFNJagguw0QCjcPFO2rlO72nLVeiEmLtzF3FlSqZnsAyGreHjtX2q
         7FAIIaTM5Q2snh4q6mNwUP+I1zseerIz3wS610lnnlLpZ5kSpDYHLRbnfdn9Njr2oG0b
         z07CO78o9XLjyspoXdoL89vMVRsDPrMf5h+kBHUCsKT+YwcYqr/3d5B6D0ewDCC6s3aT
         lj9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8P0FnlG0YttnZy7G9DIFqllXRTBKP0W3XSSCKygwnEE=;
        b=iXjBMg+Ae02bSB3MCarMSya3QzhA0+MooHTzG3XNYOeURWCACNxaETbrFONfqdsAGl
         CqgSRQsuZCcEjkNrG+KZXIgbvLRhrHzqZLDJyIkhH+u61IZu7TCkUYxA2xo+PgRZzPDD
         zi5FvCxuXEOkjdxhnJbTRhTb6zdGAu4fsmsDdMnAAlC6xx9yB2r01EuMnd7Oh24iAMKL
         BeRH3c+3mQQeQFoiK8fOPWn1TSua8lozJhq54WoIOmz/uGeBHOJhyP/NPpL6NCa9thBs
         Y91IDKZwnymxCGDA1G4nGLPytZHEJRUmL7nGFD7/q3MnPkRDH5DdxKuysXkIXCPlNDzO
         MJDg==
X-Gm-Message-State: AOAM531Vf9wy4WNg8ObrY6/TeFadM72LbKMaMKXLM17e4t+sM3Zhc/Ls
        fIOrkzTZDGqTp898hORv/WYHlZPh4+nqWrMV0dnP8A==
X-Google-Smtp-Source: ABdhPJwrNxCD4dGPUAdeeUnsJRDhQoEszqoi6N0G4GI2x8/YxbU8Kax19t/l34YdhiUk++MVX/Mzkg==
X-Received: by 2002:ac8:5ac7:: with SMTP id d7mr23253380qtd.173.1623191874094;
        Tue, 08 Jun 2021 15:37:54 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id m3sm2324266qkh.135.2021.06.08.15.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 15:37:53 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     robert.foss@linaro.org, andrey.konovalov@linaro.org,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org (open list:QUALCOMM CAMERA SUBSYSTEM DRIVER),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 07/17] media: camss: csid-170: support more than one lite vfe
Date:   Tue,  8 Jun 2021 18:34:56 -0400
Message-Id: <20210608223513.23193-8-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210608223513.23193-1-jonathan@marek.ca>
References: <20210608223513.23193-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change the IS_LITE condition so that it returns true for the second lite
vfe found on titan 480 hardware (8250), which will have id == 3.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-170.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-170.c b/drivers/media/platform/qcom/camss/camss-csid-170.c
index f0c6a72592f99..2c84d40fe3e04 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-170.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-170.c
@@ -21,7 +21,7 @@
  * interface support. As a result of that it has an
  * alternate register layout.
  */
-#define IS_LITE		(csid->id == 2 ? 1 : 0)
+#define IS_LITE		(csid->id >= 2 ? 1 : 0)
 
 #define CSID_HW_VERSION		0x0
 #define		HW_VERSION_STEPPING	0
-- 
2.26.1

