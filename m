Return-Path: <linux-arm-msm+bounces-64429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C9BB0089C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 18:28:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6EA463B9D36
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 16:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EBFA2F0C56;
	Thu, 10 Jul 2025 16:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OXkkWxxI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FA02F0C4A
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 16:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752164871; cv=none; b=fWX414Q6PN6VVQMlQxOTYOYR/rYqs5TAxlv90eQaX0emrv5ZLnAI/XhWHiCA8UwvQMYPORL4SOWg05azW29JW7w1ePpvvBwcXpFWY0u6Np890C5g47fmKfLvsXjrKpBDwjE8LTozSRc8LpTKHpJUSpwYkYvO4rJ5d7pgD256rcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752164871; c=relaxed/simple;
	bh=uByNPn2hW31VVNIAVITQmiBwDw9ZQzuzCS+fE0hn1Ds=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ooEJt7zuyakPGZNdfMHAZQkyo9h8ChVzpbWlqSJIPIYoAyW/AIZae3r34LE0gVt+mjoeGSkhzC2gUKOjgoamOiwqoBbDT06++jLLGsllPykvERAjPpNlmJaZ2k2xQ9lb/uLFZnk9DFg8P0c0RGqBFZrfD2qDDrJyI7EHVHrLGuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OXkkWxxI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752164868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3sO2/JwLoOB0WH2WCnvOSV6HSLemFLUS8qLx2PjBI2A=;
	b=OXkkWxxInpu+xJG19bN9XPKvft9oMZlX9jgxOwkGu8NODUqHomdfIGiDLt/kmm+BKV0p0r
	ypqQtjaPVnFY9JZSU6I/f524ba68Wmh6C56PYGGCoe7Mfs8+aIvwLJsMi0Lx91v3R1ayHW
	v31Qs+DBrM/qOtdxmUUvciN/oYTkA1Q=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-Io7k9yMDOC2GtreyN4dvQw-1; Thu, 10 Jul 2025 12:27:47 -0400
X-MC-Unique: Io7k9yMDOC2GtreyN4dvQw-1
X-Mimecast-MFC-AGG-ID: Io7k9yMDOC2GtreyN4dvQw_1752164866
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a585dc5f6aso24285861cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 09:27:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752164866; x=1752769666;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3sO2/JwLoOB0WH2WCnvOSV6HSLemFLUS8qLx2PjBI2A=;
        b=NOCK4MeqZbqcm9Q7s6EQp4XWj7HrxHdxdwaNXwe1ympUIZ9cmWXgKAik2DbiKTQxSg
         xDlQpbqeCNVSVly6oBlTu2RKYzHbOfU5e6bNDKn2TS/Eyov7kiwyOhGdCTdBQegcVMBG
         DmXd1PdDiDVsOTipYwomuSanqREkghRXJh+INZzDybo9Gbtdj0o16cSaqY4NJCVHktTZ
         m/NHwb1siM45YnVF86SwI7YgQKC1EXnmvlqjwH+t758p7AKwDnV4UBOeRvdykumfMMvA
         nVEPm5UO1Onqc9q/lUVgtTpsN1or5c9k3XqaHd1jqQT+5ThlERHpYv7kNNsy74FwSNkI
         EfTA==
X-Forwarded-Encrypted: i=1; AJvYcCXyN/Y4Zo8FDnht3f3kcZdB1ajn/UkwBCcMKCkHquTuy1Pkx6uybfSijmwpqouY9D3r64YxkP2aGdAOEQ9e@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2V2I8IsHcAHBCNVGDALKNq8taazUlYE4nkUIlXJqbjxChOMrW
	sTRqOHd39PJ/oBwsfGQ91hMo0NYsUgpnSjTaVO/18+NNQeuoB8FSf6mQfHIT9JYjNjO8JQatDVI
	MGWAokmc2CdVh7z2rUZ2NvD2liLXM7jz+EpM+s1lTj9O6RSBYbjxsqEiaL9C9+AKs2Kk=
X-Gm-Gg: ASbGncuAxOY2Z34xO3VGYwO6PdUjc12MNa4lXRPnYzT9ogz6JmXN5VT66J1lb7BQgOz
	txiVatmAonATUL9pILQPgZKh74ifVgWiDBhYdU57kCLLlFYaGfccTul7Z+9FwWbUuCPxalSqmlu
	95cNIUf2HzAaHRtM+RntIwPgTI3fK2ZZ7nkUQb8qiPTmSLxVlousxfri4pl9OdZhGEAOJnhRcGE
	GdVlE7PL6VHdiDOalkoHQ/oBS0WTYS8NviKzDaLzpx80Q1l0ERiEVB3T0O3yHw0CG2dwJQdDWrD
	OcJWyXsqmQpd1gbi4p0YZxZYnhnZmxxbg8wFvHu7BQX6M4ewSZR4FZ1Ek4iO
X-Received: by 2002:a05:620a:24d6:b0:7d3:dbed:869b with SMTP id af79cd13be357-7ddecc1d5a2mr17535085a.42.1752164866478;
        Thu, 10 Jul 2025 09:27:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE27LfFDrGnMnfhyfHCbnzrSuLJo3IShFntK9oUyUSQ7N0TE7WAmGfbfKdAyUi+8fKCbP099g==
X-Received: by 2002:a05:620a:24d6:b0:7d3:dbed:869b with SMTP id af79cd13be357-7ddecc1d5a2mr17531485a.42.1752164866037;
        Thu, 10 Jul 2025 09:27:46 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcdc5df99asm113487685a.49.2025.07.10.09.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:27:45 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/7] drm/msm/dsi/phy: convert from clk round_rate() to
 determine_rate()
Date: Thu, 10 Jul 2025 12:27:26 -0400
Message-Id: <20250710-drm-msm-phy-clk-round-rate-v1-0-364b1d9ee3f8@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO7pb2gC/x3MwQqDMAwA0F8pOS+QiuLwV8YOtc00zFZJVRTx3
 1d2fJd3QWYVztCZC5R3yTKnAvsw4EeXBkYJxVBR1VBrCYNGjDniMp7opy/qvKWA6lZG73tLoan
 5STWUYFH+yPHPX+/7/gEq7Uv9bAAAAA==
X-Change-ID: 20250710-drm-msm-phy-clk-round-rate-ccb10d54e804
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752164864; l=5373;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=uByNPn2hW31VVNIAVITQmiBwDw9ZQzuzCS+fE0hn1Ds=;
 b=IyDjRecZ8lmUveDSl1A/ekKcgnVDZWOm0cbVtunJ0Yg60K87JgqJbB99cAFDWIE1Ws5cFuS4G
 SGQmD+wl6KeCcggSryEiIu7SICeBclsasH4oDapkP9eAZ8fGGn/ww3M
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated in the clk framework in favor
of the determine_rate() clk ops, so let's go ahead and convert the
drivers in the drm/msm/dsi/phy subsystem using the Coccinelle semantic
patch posted below. I did a few minor cosmetic cleanups of the code in a
few cases.

Coccinelle semantic patch:

    virtual patch

    // Look up the current name of the round_rate function
    @ has_round_rate @
    identifier round_rate_name =~ ".*_round_rate";
    identifier hw_param, rate_param, parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    	...
    }

    // Rename the route_rate function name to determine_rate()
    @ script:python generate_name depends on has_round_rate @
    round_rate_name << has_round_rate.round_rate_name;
    new_name;
    @@

    coccinelle.new_name = round_rate_name.replace("_round_rate", "_determine_rate")

    // Change rate to req->rate; also change occurrences of 'return XXX'.
    @ chg_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier ERR =~ "E.*";
    expression E;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    -return -ERR;
    +return -ERR;
    |
    - return rate_param;
    + return 0;
    |
    - return E;
    + req->rate = E;
    +
    + return 0;
    |
    - rate_param
    + req->rate
    )
    ...>
    }

    // Coccinelle only transforms the first occurrence of the rate parameter
    // Run a second time. FIXME: Is there a better way to do this?
    @ chg_rate2 depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    - rate_param
    + req->rate
    ...>
    }

    // Change parent_rate to req->best_parent_rate
    @ chg_parent_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    - *parent_rate_param
    + req->best_parent_rate
    |
    - parent_rate_param
    + &req->best_parent_rate
    )
    ...>
    }

    // Convert the function definition from round_rate() to determine_rate()
    @ func_definition depends on chg_rate @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier generate_name.new_name;
    @@

    - long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
    -               unsigned long *parent_rate_param)
    + int new_name(struct clk_hw *hw, struct clk_rate_request *req)
    {
        ...
    }

    // Update the ops from round_rate() to determine_rate()
    @ ops depends on func_definition @
    identifier has_round_rate.round_rate_name;
    identifier generate_name.new_name;
    @@

    {
        ...,
    -   .round_rate = round_rate_name,
    +   .determine_rate = new_name,
        ...,
    }

Note that I used coccinelle 1.2 instead of 1.3 since the newer version
adds unnecessary braces as described in this post.
https://lore.kernel.org/cocci/67642477-5f3e-4b2a-914d-579a54f48cbd@intel.com/

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (7):
      drm/msm/dsi_phy_10nm: convert from round_rate() to determine_rate()
      drm/msm/dsi_phy_14nm: convert from round_rate() to determine_rate()
      drm/msm/dsi_phy_28nm_8960: convert from round_rate() to determine_rate()
      drm/msm/dsi_phy_28nm: convert from round_rate() to determine_rate()
      drm/msm/dsi_phy_7nm: convert from round_rate() to determine_rate()
      drm/msm/hdmi_phy_8996: convert from round_rate() to determine_rate()
      drm/msm/hdmi_phy_8998: convert from round_rate() to determine_rate()

 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c      | 18 ++++++-------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      | 36 +++++++++++++------------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c      | 22 +++++++--------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 34 ++++++++++++-----------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c       | 18 ++++++-------
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c        | 19 +++++++------
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c        | 19 +++++++------
 7 files changed, 84 insertions(+), 82 deletions(-)
---
base-commit: b551c4e2a98a177a06148cf16505643cd2108386
change-id: 20250710-drm-msm-phy-clk-round-rate-ccb10d54e804

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


