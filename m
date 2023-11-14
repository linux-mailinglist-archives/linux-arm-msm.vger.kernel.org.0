Return-Path: <linux-arm-msm+bounces-653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DFA7EBA11
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 00:00:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAF832812AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 23:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77FD22FC22;
	Tue, 14 Nov 2023 23:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="CaIrtYL5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007C02FC21
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 23:00:40 +0000 (UTC)
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91F1BFF
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 15:00:38 -0800 (PST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5b499b18b28so71635797b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 15:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1700002838; x=1700607638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cpJg20SvqJHFde7hdRwbQhfmXK7eKDJA+6y+igvktAk=;
        b=CaIrtYL5zP0EobCPzSK6v6WsO7JTWvxsYT2Fk+qkRLqrw8VCSNwwlWuBlhvXZMTRp1
         TqAZbUOTuW0OOJvdX5DTGc8ow89MFeXVDCwzfS+z1QqnZhroFynj/pLQfTkjUvTqv/Xl
         lNXfDC7TbkWDJUYCtrihj7tMBipBRxaAmts6TAtUaspKMyHjkvD2N7G5gH7X+98NliLA
         tp/yXHHr36EZxroiykF33hgrv25gzDV4cp3qge/d14LASuA/eCq8z32bUbkkjzPMlzpq
         oSYkENDpt3F3JyDHDbSZlBYSjk2V2GeWmsfumMZUOFNKZibTv7YNaAtgG3iDqbynJ6y0
         EKIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700002838; x=1700607638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cpJg20SvqJHFde7hdRwbQhfmXK7eKDJA+6y+igvktAk=;
        b=MATgJHTSVOXoHExGRjUcX6GN6pFOp8MH1V9+InoAbJJUJpgSxx1la8pF3o1+zhOkeH
         6lnHhIvCBVzWTKi3ZY7dXfa01fXbG1SBtUP+Kkfblu39tzo0sjn5ZbZRqd99+RSEgFKa
         6/BkxmcITVbN3a7OdZHOde6jKmrgNMiN8HhTVnCzsHimqUL8IFktWOYje9Q3d+GmQiJr
         A/eITsAuD1zTJ2rttLubckOUZCYRlBgq1gygmiQx3qLVe77+ARuTsBxEbouwJwKQ/fK1
         cZAC+XyBVn9hXHnBYJGS+Euv7F6bMoK7ykYrmm9KlS2aU2KsZCiJLwQFI4vOscMdpERp
         FPTQ==
X-Gm-Message-State: AOJu0Yzc65PDWpMTiCvG2U4JPc6u/ew7vM5No4EQbzGIHPpUSGMqK7bw
	lO0wl8LS1GK/EHT5/JfkTIr41g==
X-Google-Smtp-Source: AGHT+IF625S3cBQuZUFbUGBAhZkGCmiGu+ZC9noNuDSK6oc2pQ7dDTxwb4mFW7Ih4VTIW4LqjLUQKA==
X-Received: by 2002:a0d:ca84:0:b0:5a7:bfbf:1bbb with SMTP id m126-20020a0dca84000000b005a7bfbf1bbbmr11185827ywd.17.1700002837716;
        Tue, 14 Nov 2023 15:00:37 -0800 (PST)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id u2-20020a05621411a200b00674a45499dcsm25274qvv.88.2023.11.14.15.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 15:00:37 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Jiasheng Jiang <jiasheng@iscas.ac.cn>,
	linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 4/6] drm/msm/dsi: add a comment to explain pkt_per_line encoding
Date: Tue, 14 Nov 2023 17:58:32 -0500
Message-Id: <20231114225857.19702-5-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20231114225857.19702-1-jonathan@marek.ca>
References: <20231114225857.19702-1-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make it clear why the pkt_per_line value is being "divided by 2".

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 66f198e21a7e..842765063b1b 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -877,6 +877,8 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	/* DSI_VIDEO_COMPRESSION_MODE & DSI_COMMAND_COMPRESSION_MODE
 	 * registers have similar offsets, so for below common code use
 	 * DSI_VIDEO_COMPRESSION_MODE_XXXX for setting bits
+	 *
+	 * pkt_per_line is log2 encoded, >>1 works for supported values (1,2,4)
 	 */
 	reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_PKT_PER_LINE(pkt_per_line >> 1);
 	reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_EOL_BYTE_NUM(eol_byte_num);
-- 
2.26.1


