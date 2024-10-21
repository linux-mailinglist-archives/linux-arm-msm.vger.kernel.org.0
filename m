Return-Path: <linux-arm-msm+bounces-35278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4D69A90F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 22:22:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B50E91C20E33
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 20:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 136C51FBCBC;
	Mon, 21 Oct 2024 20:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YHGEbyUy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B135198E79;
	Mon, 21 Oct 2024 20:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729542149; cv=none; b=lZfkpNWuk53Q17f17SfhiUXs4cIZNBPjz4aFt+oMy8zMmcBWhbmLonNFBfEAOMNb52JF0NCV9MmRKbCZ+RQjtXwTD2bmS6am2/i9QspVZ5LbZFoD9dRmf+5YpMA3fsak6T5AlA3aTFfdfwG/PBK2gty6dB+EHgJInnVgZmkEfgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729542149; c=relaxed/simple;
	bh=ZpfCtHn2O4R8r0LEZ4QGJu7WRUg+G4jvdZG0heIwcTY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nWUf8AHmrpmy9JAwAOJF7nq7VtG4uwfwWTGEf5YoUVxbOSWbId++rQIBJsfc8lMQep+JZC3HbYn0oFXG1wcaVL8TyMWvCCL+5ZQhfYzz0QE73RYVJNi2d5roXpkK3LN5V2wFbUg72IuYpW3vajiicGx/CJ7tMIuns7F2bxkWKaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YHGEbyUy; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5c9709c9b0cso6392684a12.1;
        Mon, 21 Oct 2024 13:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729542146; x=1730146946; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jY8OatSCHAEDl/Scbg8OD1aJsKnRgZhXcNmGjQdlyhc=;
        b=YHGEbyUyyu+BamwbxhAUjTNIsZg6UGC8ji3s7QijF1tgZXRZ/3cMtZSzO/OLt9dblA
         GkuvV0iXTvOd0ZXsEoygOpRaCpqYhvF1N+sS9N/zZ7Cbbli51iQT/PM6zTD+SPM0JiFi
         MDXvZmlKjEaNf4gYLjslG1wUOgSrlA2AtdbsZaoLOXWXbDNhwAczcOwdfhEu5nceElwN
         RnrNrHCrQvgbw6obAPSxy4tf4M7Qgzis/WzIKyrJydTpT1OHiiIWBh/4GdbpFaeTShI7
         yf2Vip8fjC/CO5atWsiokYgyJ9Mvwf8VcE8ccN03otO2/scs3ENZvBuDmgVT0KbDQVeH
         BxRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729542146; x=1730146946;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jY8OatSCHAEDl/Scbg8OD1aJsKnRgZhXcNmGjQdlyhc=;
        b=MuQhzlEnNQH9wFcb+UXxtompzWN5jUrmpybD59DDmXVH/P+W66Uak0wXx/sbMBCVZY
         w4t49hlIeYkpXaYvXOk7/BpMivSIfBa/9xXeHFw6k2eoNMBm6YrHHLVXeNZKabVUoW80
         VP/myDVqyResNGdX5JB673ATcEttxLtbRn9b9ROFCh8lyzuFeHhxRytmQS6WOJRQi69t
         bLXl4PpE4o+EyvLkDbORnXnJ+xTYWGC017WI4N55dUFpTCbMV2VP8fO7R71TA/CzkVkc
         Jt2suuOSPFEt9+jRKNDAj0lv4skRrgdV1R61xwWmDZsHDQEUSjAgPR8Eu5CKyw8a+5ml
         6xZw==
X-Forwarded-Encrypted: i=1; AJvYcCVGx0gLmsY9GVse7U5YWRRsPX+LkTd+HdTSwBxfzUqRSZl9TuCi+AMDffoFhTT6FRKGTkAFzhgeU8Q=@vger.kernel.org, AJvYcCXphB/918KJH0Bfv3F26v9S/gOy8+Q7Ub8+CsUAiBj0WWvlkxI6gLbaxOybslWAQnBi7aYqMZTzVQwfm+Qt@vger.kernel.org
X-Gm-Message-State: AOJu0Yy86flIM55gL+uMUU1MyWqXKJErtLTv4EQ7yeCnyBxK/pkODOvI
	aiFY534B9tPbcHXZlZ8D0KORWmYqcPwzhVV62JKR2mAovYE7LpUo
X-Google-Smtp-Source: AGHT+IHo7l+Vf1sY6p/35XoIOJDGR06391ogRH4hW+ZFRMTWg2Y0TuqOo81a/7PZXX5dHLJSviUCuA==
X-Received: by 2002:a05:6402:4315:b0:5cb:6713:c60f with SMTP id 4fb4d7f45d1cf-5cb781f47e1mr1170036a12.0.1729542145502;
        Mon, 21 Oct 2024 13:22:25 -0700 (PDT)
Received: from redchief.lan (5D59A6C7.catv.pool.telekom.hu. [93.89.166.199])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66a654b9sm2366497a12.34.2024.10.21.13.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 13:22:25 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: [PATCH 0/5] clk: qcom: remove superfluous alpha settings from PLL
 configs
Date: Mon, 21 Oct 2024 22:21:56 +0200
Message-Id: <20241021-alpha-mode-cleanup-v1-0-55df8ed73645@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOW3FmcC/x3MQQqAIBBA0avErBtImQy6SrQwnWqgTJQiiO6et
 HyL/x/InIQz9NUDiS/JcoQCVVfgVhsWRvHFoBtNqtEK7RZXi/vhGd3GNpwRjVFTS2SIfAcljIl
 nuf/pML7vB7BQecBkAAAA
X-Change-ID: 20241021-alpha-mode-cleanup-661b544644d7
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2

There are several alpha PLL  configurations, where the alpha mode
is enabled even if it is not strictly required in order to get the
desired output rate of the PLL. This small series removes those
superfluous settings.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Gabor Juhos (5):
      clk: qcom: apss-ipq-pll: drop 'alpha_en_mask' from IPQ5018 PLL config
      clk: qcom: apps-ipq-pll: drop 'alpha_en_mask' from IPQ5332 PLL config
      clk: qcom: gcc-ipq6018: remove alpha values from NSS Crypto PLL's config
      clk: qcom: dispcc-qcm2290: remove alpha values from disp_cc_pll0_config
      clk: qcom: dispcc-sm6115: remove alpha values from disp_cc_pll0_config

 drivers/clk/qcom/apss-ipq-pll.c   | 3 +--
 drivers/clk/qcom/dispcc-qcm2290.c | 2 --
 drivers/clk/qcom/dispcc-sm6115.c  | 2 --
 drivers/clk/qcom/gcc-ipq6018.c    | 4 +---
 4 files changed, 2 insertions(+), 9 deletions(-)
---
base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
change-id: 20241021-alpha-mode-cleanup-661b544644d7

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


