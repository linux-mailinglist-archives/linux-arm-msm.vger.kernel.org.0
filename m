Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7F9D3A1ED2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jun 2021 23:18:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbhFIVUh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Jun 2021 17:20:37 -0400
Received: from mail-lj1-f175.google.com ([209.85.208.175]:37753 "EHLO
        mail-lj1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbhFIVUg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Jun 2021 17:20:36 -0400
Received: by mail-lj1-f175.google.com with SMTP id e2so1692398ljk.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jun 2021 14:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9dgs04cWZ3Msqx0W8W8q6j1oCvkBtnZBWkKinotEoUY=;
        b=MjSGuvkj52+NlpRiGoEMHe2XcyMbHXdWIJJWE2M5Z06Lmbq34wKHLFa8JneKOyxT4T
         zPQnUk2WvpqaElBp2Kt++0dC3z1B0g0kZ6ivnLSHoDGpjw3MNOrdCcvR4C+O91dxKueb
         k7FsAycDiGW+0/StVBhfKgugAfjm+71Hhue8nXVlkxRvWfqHvZGwIyKxYq0CcSwSooMD
         LgZO6GseD3yq11IrONZkYunffe0mtj+x6AblEy57tb2J1N7FWnSMurP4GYaKX8GLQl6m
         wkv4GifRkcHPRRs+XTDFNZyxzRVSzlkMGGxfCWb8RNT7SrPMKi6xWkltr/+v6HrzIMII
         hfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9dgs04cWZ3Msqx0W8W8q6j1oCvkBtnZBWkKinotEoUY=;
        b=I7WlWk8Oazwbb6U8U/Kcq1Ptj7+Cy0w9fXAHXhJLCYhSIy8SWywqHe7ZfGGnPAACib
         T8vTCpP/M9euhSBPdSGTL2ORNhrOFCkpFjcKhQdBbfrwdhz+PJdktBCDRDZLZtrbEZ7q
         LoH9aFOaC5Kg0m6NO0hi7ha6OATvUgkxQKqueKVg3TsOhi4mgoVVzT0TxtNIxxsgLkPo
         jN5Wh3iWBcIk8Oij2T+3IoNvQvbL+k6LkqZrx1yBMUxfdQATB7D1ZCIDJ2qNjCqpkmjx
         gFBI19FGHmaFLYbCb7u0wtoqWyXdOub0xAZXO6K34sDp1hqavp7oUkujKLO/0MNbLWCI
         gF3Q==
X-Gm-Message-State: AOAM5310q19ebYgFdIzQCz7dD2KH2RjKe3EdyK9wQvvViLkdneDneOW8
        JC8V6drZD5VZA6RaISZAfS31mg==
X-Google-Smtp-Source: ABdhPJwA6Th/FL1bvaEHObvbGAvSjDBwCyEftMmoigBEJSWVVDst/PLSoptXRuDpaYTAtZwJsLWdsA==
X-Received: by 2002:a2e:a48f:: with SMTP id h15mr1304167lji.252.1623273448317;
        Wed, 09 Jun 2021 14:17:28 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z20sm95329ljk.50.2021.06.09.14.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 14:17:27 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [RFC 3/6] drm/msm/mdp5: move mdp5_encoder_set_intf_mode after msm_dsi_modeset_init
Date:   Thu, 10 Jun 2021 00:17:20 +0300
Message-Id: <20210609211723.2565105-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210609211723.2565105-1-dmitry.baryshkov@linaro.org>
References: <20210609211723.2565105-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move a call to mdp5_encoder_set_intf_mode() after
msm_dsi_modeset_init(), removing set_encoder_mode callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 15aed45022bc..b3b42672b2d4 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -209,13 +209,6 @@ static int mdp5_set_split_display(struct msm_kms *kms,
 							  slave_encoder);
 }
 
-static void mdp5_set_encoder_mode(struct msm_kms *kms,
-				  struct drm_encoder *encoder,
-				  bool cmd_mode)
-{
-	mdp5_encoder_set_intf_mode(encoder, cmd_mode);
-}
-
 static void mdp5_kms_destroy(struct msm_kms *kms)
 {
 	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
@@ -287,7 +280,6 @@ static const struct mdp_kms_funcs kms_funcs = {
 		.get_format      = mdp_get_format,
 		.round_pixclk    = mdp5_round_pixclk,
 		.set_split_display = mdp5_set_split_display,
-		.set_encoder_mode = mdp5_set_encoder_mode,
 		.destroy         = mdp5_kms_destroy,
 #ifdef CONFIG_DEBUG_FS
 		.debugfs_init    = mdp5_kms_debugfs_init,
@@ -448,6 +440,9 @@ static int modeset_init_intf(struct mdp5_kms *mdp5_kms,
 		}
 
 		ret = msm_dsi_modeset_init(priv->dsi[dsi_id], dev, encoder);
+		if (!ret)
+			mdp5_encoder_set_intf_mode(encoder, msm_dsi_is_cmd_mode(priv->dsi[dsi_id]));
+
 		break;
 	}
 	default:
-- 
2.30.2

