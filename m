Return-Path: <linux-arm-msm+bounces-55644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5579A9C8B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 14:13:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBE844C5AFA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 12:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D23B5250C1C;
	Fri, 25 Apr 2025 12:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="3EAXAlIP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DA024A074
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 12:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745583194; cv=none; b=sg48rriD2gfNUAQkx1NkA03QTERAuQaoXky8yqVhRX1kzl1w2aumFbgJUDZ7z5oXbXK/5zwLCLlYjqdDDcyTXV1mQt0+C2VcmdRMR9BlrARfu4L2oj+FzPwS/1vH+e6QeubitJNAzmoJIaqzQSTqAmo8IDX5oDioWftxwtwNg3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745583194; c=relaxed/simple;
	bh=JVSzmCDGp4nuQ6agq8glyL213yGkNRHdBwMtv9WYkiw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aFg1YWD/IlfNGrPDcQc3y/IDSgDbIkPaZxkQxvlQR05jYIQwJiFEbJ/+Jddec+VHnOFhu+SR+q9FMCp0wc2qdowxwsqDyYyDIL5r6EuDDZNIEp8AR95j3kUfIeTfDPiIVniacbSHyqw9KJLCdtuqO+jzn7SqaTPkuEmyiQJCl6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=3EAXAlIP; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39c1efc457bso1551252f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 05:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745583191; x=1746187991; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q/1Wlg6H1/gsC3xe3K5/5ZBy+8/izEwpHo4955zg7uw=;
        b=3EAXAlIPUmU+447uG4dAXS2Nmt11G1sQ5LvL+i7L1v68+ykwrXzN91290WI9xq1sII
         RlsdZ+OauloicARLTH/d3rur097WhMO1L50/qg+ckBZ6zmjXQudEiCf7LBagx7uiT9ld
         3BRrJXz/V1f52uCc6AtbJ6QRPJyBlA9baR0r9SxDT7C1il5JzMuVdLComsglWApPTSyn
         jG/saWdpVsJ/QqvgpzOcTfp0J4FpBhGRDwXZDMaLz7envjFfZwqpZ3Vk3eDsMk4tFleN
         MOMi1kXk3jN+IfWUBmXJsU4wFdVYgdNiw0rS2FJSfOwWI/4nHauUo+kCwGY9YXGZjRTl
         kvfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745583191; x=1746187991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q/1Wlg6H1/gsC3xe3K5/5ZBy+8/izEwpHo4955zg7uw=;
        b=Fe/SEBYYEKx2ltwDBfI/R/GwJN6Ou1oxON5pgb7U+Dh+xXENkQWY58AKzOHDdjupBy
         sHSs7mST1v7OordrmF0IJ4G0UEVH9Utpyxdhj6QtVSE8D1DHQp/UIwEGL9qFwNi+NTv2
         SlWKeBbhuZOZof2epS6JWqFu2dNNhT/WAdqXqpIi/yl5zNFdV4M6kkVGZ1Oyhghx5rb0
         rYUqp15FQpyGwtBPzyOUAlCmN9mFBSmluy//RMMo780x82O/NX7qoYUUY5mf98XbjTWD
         grvp9sFdoU2DvO/QfM64xqJpbjVD05YTEVMuy8ZoSksj+eimq8P3qpKVjOlf+siRoWnP
         DVtg==
X-Forwarded-Encrypted: i=1; AJvYcCXepbVxkc9KtW4mEe+2lacCslEbRNFbwdFx0C/dWDKyG4ZfJcjnWDJzZnhIj4IDGxbFVAoRCmZoOyzFcQ8g@vger.kernel.org
X-Gm-Message-State: AOJu0Yw61m5lXKLKbj2ldBOuGRkxEkF3sKYSfHS0LMA8fTDRoEDdbVpN
	7hdyE1ub9yVWgTvNhdZzVREEFsB+ZWYyPuaFAQ0Qj9Na7YgfNFV7mmD/3TgbE/c=
X-Gm-Gg: ASbGnctNtAGDwxmkwHrZ+EossCx/f1BoVQfpAnwYdB93LrlyM1qO+hoACad2NrkMW2o
	dXEglS/QJpnDUdLPYPutNuN1/PQ/R+1DjFW5Ry1Ao8GnixfvrjFcbe0jyoplPfP5m6RwtJpjOUg
	4I1isSKldJkVwAw79aP9wD1GLMGmA9ftDBG1A5hLAa33ZMphzgOyWNW4oIfrGus8RDVRwQ86M9Z
	szmpJwZzElPkMMPfHkLKLqfU8MgOr9mmJ3+9xoWuEVtnzWPArX6xX4sXLS8L/5WVwNbchWLaQ6M
	H+8dWs/Y+rtZrDpBXl0a1BzH30noNy0YTevblxv/V2z6yGFuZHscaoWRxoUILxhd0r8ijJrL5P+
	LC86lIWOr8TQHy2WsjhCzaLVfweFzPY0U0Nt4YqInhiK+E/KizXjNqzoB
X-Google-Smtp-Source: AGHT+IEz/JdBLzuttdV2d717kw4v6NRxmdBkm3ghbvJLmxaD7EJVTw/4WP622g4Rua3FQUiTc2w5bw==
X-Received: by 2002:a05:6000:2482:b0:39c:1257:c96f with SMTP id ffacd0b85a97d-3a074fbc451mr1574899f8f.59.1745583190713;
        Fri, 25 Apr 2025 05:13:10 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46501sm2147310f8f.73.2025.04.25.05.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 05:13:10 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 14:12:57 +0200
Subject: [PATCH 3/4] clk: qcom: gcc-sm6350: Add *_wait_val values for GDSCs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-sm6350-gdsc-val-v1-3-1f252d9c5e4e@fairphone.com>
References: <20250425-sm6350-gdsc-val-v1-0-1f252d9c5e4e@fairphone.com>
In-Reply-To: <20250425-sm6350-gdsc-val-v1-0-1f252d9c5e4e@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Compared to the msm-4.19 driver the mainline GDSC driver always sets the
bits for en_rest, en_few & clk_dis, and if those values are not set
per-GDSC in the respective driver then the default value from the GDSC
driver is used. The downstream driver only conditionally sets
clk_dis_wait_val if qcom,clk-dis-wait-val is given in devicetree.

Correct this situation by explicitly setting those values. For all GDSCs
the reset value of those bits are used.

Fixes: 131abae905df ("clk: qcom: Add SM6350 GCC driver")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/gcc-sm6350.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sm6350.c b/drivers/clk/qcom/gcc-sm6350.c
index 74346dc026068a224e173fdc0472fbaf878052c4..a4d6dff9d0f7f1216c778165a1fe9604d9ae41dc 100644
--- a/drivers/clk/qcom/gcc-sm6350.c
+++ b/drivers/clk/qcom/gcc-sm6350.c
@@ -2320,6 +2320,9 @@ static struct clk_branch gcc_video_xo_clk = {
 
 static struct gdsc usb30_prim_gdsc = {
 	.gdscr = 0x1a004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "usb30_prim_gdsc",
 	},
@@ -2328,6 +2331,9 @@ static struct gdsc usb30_prim_gdsc = {
 
 static struct gdsc ufs_phy_gdsc = {
 	.gdscr = 0x3a004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "ufs_phy_gdsc",
 	},

-- 
2.49.0


