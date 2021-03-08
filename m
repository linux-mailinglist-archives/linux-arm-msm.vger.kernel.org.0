Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3444330BC4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Mar 2021 11:53:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231594AbhCHKwk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Mar 2021 05:52:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231562AbhCHKw3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Mar 2021 05:52:29 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83A08C061760
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Mar 2021 02:52:28 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id h10so13995298edl.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Mar 2021 02:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ed2ZmyjgMuArkep/x+pkAPo7evPjB1BAFOc6v5tfSJ4=;
        b=i5DDN26Aj7bY9aXwfNceG+NhoTZBh+NU6hUF/EKYDC6mCxMGzFyBmTzQESYeydRhCA
         uSppQ2DS3VpD/t8ejN/f5KIMxoOycbCeLS7IaBOgNqXDUgugs+voyYawCtnzH67M/ljq
         gTXTmn3PPxpyM59Z2m+JcIR1DnUMZHx18wo2nCpUbnSkTytm9ZiSTbUb911czkyVzO67
         DANktJwG/D6nddWMppt8f8xEVQUNV/sUlvpDceE5Mp8koEzSsUU5hbke/Ic3bJWOGSl2
         TjanvsUTbskjUfVkwh7k/Si2eOOI7kZWsy7e16I/bOwNHsb5mKhdiKVsUi2FYTpI2v4i
         mLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ed2ZmyjgMuArkep/x+pkAPo7evPjB1BAFOc6v5tfSJ4=;
        b=e3xwXuMaNrQ2kekWsgLcDbwvizALE0UY1sYBrOcN3ZXt4Z1grW1LF8w16AYGbbc0NQ
         HaXoohs+awHm15xyI8RkmjR1cjDFDWea0EJK+4DC+7rvVmmI5gkeetCJ8vjy0Jwj1DrS
         +NEc3cyoY/ImDWriJ7kFVnxBcu6xAjXejfFg715D4DtsaHMW4WrdjlCsAGjdHi0TST6b
         AKeEhN6KTrhcJ7Ux1bFpiRVYrJEG4VXBT4sLwdTk7q0Sfnw3njZO5PCzz7GiuYCiSfri
         8RZDH6POpvStUWY4q334oyVf/pVJ04pLvE9IzOh0K4CVvOD8A+eg9KhDmjxB5be2NQi5
         Urkw==
X-Gm-Message-State: AOAM5315xK7UF8TRV3xg3F9/sQbIjWNEHi5oq4JHvissnYBIHM8mc5zj
        8UgXTz2CNF86hvTZvUmY3cbD+Q==
X-Google-Smtp-Source: ABdhPJyA2a7BfNZBhViBq6dW6JSDMhqhNtugGFPTO4MeabFG/qITeFF3eCs6Tg/FY40GGWPkVRMnow==
X-Received: by 2002:a05:6402:254f:: with SMTP id l15mr2366106edb.189.1615200747272;
        Mon, 08 Mar 2021 02:52:27 -0800 (PST)
Received: from localhost.localdomain (95-43-196-84.ip.btc-net.bg. [95.43.196.84])
        by smtp.gmail.com with ESMTPSA id y9sm6386297ejd.110.2021.03.08.02.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 02:52:27 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        stable@vger.kernel.org
Subject: [PATCH 5/5] venus: hfi_cmds: Support plane-actual-info property from v1
Date:   Mon,  8 Mar 2021 12:52:05 +0200
Message-Id: <20210308105205.445148-6-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210308105205.445148-1-stanimir.varbanov@linaro.org>
References: <20210308105205.445148-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The property is supported from v1 and upwards. So move it to
set_property_1x.

Fixes: 01e869e78756 ("media: venus: venc: fix handlig of S_SELECTION and G_SELECTION")
Cc: stable@vger.kernel.org # v5.12+
Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_cmds.c | 24 ++++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
index 4f7565834469..558510a8dfc8 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.c
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
@@ -1039,6 +1039,18 @@ static int pkt_session_set_property_1x(struct hfi_session_set_property_pkt *pkt,
 		pkt->shdr.hdr.size += sizeof(u32) + sizeof(*hierp);
 		break;
 	}
+	case HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_INFO: {
+		struct hfi_uncompressed_plane_actual_info *in = pdata;
+		struct hfi_uncompressed_plane_actual_info *info = prop_data;
+
+		info->buffer_type = in->buffer_type;
+		info->num_planes = in->num_planes;
+		info->plane_format[0] = in->plane_format[0];
+		if (in->num_planes > 1)
+			info->plane_format[1] = in->plane_format[1];
+		pkt->shdr.hdr.size += sizeof(u32) + sizeof(*info);
+		break;
+	}
 
 	/* FOLLOWING PROPERTIES ARE NOT IMPLEMENTED IN CORE YET */
 	case HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS:
@@ -1205,18 +1217,6 @@ pkt_session_set_property_4xx(struct hfi_session_set_property_pkt *pkt,
 		pkt->shdr.hdr.size += sizeof(u32) + sizeof(*cu);
 		break;
 	}
-	case HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_INFO: {
-		struct hfi_uncompressed_plane_actual_info *in = pdata;
-		struct hfi_uncompressed_plane_actual_info *info = prop_data;
-
-		info->buffer_type = in->buffer_type;
-		info->num_planes = in->num_planes;
-		info->plane_format[0] = in->plane_format[0];
-		if (in->num_planes > 1)
-			info->plane_format[1] = in->plane_format[1];
-		pkt->shdr.hdr.size += sizeof(u32) + sizeof(*info);
-		break;
-	}
 	case HFI_PROPERTY_CONFIG_VENC_MAX_BITRATE:
 	case HFI_PROPERTY_CONFIG_VDEC_POST_LOOP_DEBLOCKER:
 	case HFI_PROPERTY_PARAM_BUFFER_ALLOC_MODE:
-- 
2.25.1

