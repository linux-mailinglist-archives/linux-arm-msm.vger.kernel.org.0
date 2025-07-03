Return-Path: <linux-arm-msm+bounces-63585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31622AF8410
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 01:23:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D99723A7F27
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 23:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AE202DA753;
	Thu,  3 Jul 2025 23:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XazuXfpN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AF92D94B6
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Jul 2025 23:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751584987; cv=none; b=M9H/LgcY6r306SETaHVawBiqLIDKTjVuH5KxWfsJj8ZzmpqF86XqL/W0unyed4KhUCTXb+6D/yOyD7T5JOb4HF9ccYnBHUrgHGWGip95DwGe1xwj3HIu/voGqRJ9i3xMNawhVfumUqYbZjVm+YDET4hTV/N62Wujd1zFFenco2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751584987; c=relaxed/simple;
	bh=ZubPxnRGAAyn5xIgslZ+93JU0NMJn/KqRavgAH8p3gg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EIU9lhXvREc6+nLPUbx7svH0GWES/yfRJ3GJNueDvCDQ41bN38WdvDnFTmMTRIGMumrlshclKVVJtyQQIHN9yg71EA5I/X1ImTMRfT3c2q7Jm9pLeQRcARZ3wVFsPQZVIW/OH5wtJcnJINqxUoG2pfh9HSLftn4N+Mb/hUosLUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XazuXfpN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751584983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3Q6wqAkPgpNZPhvYMhgg8DTrDL7IGLoO4HjSh2P42no=;
	b=XazuXfpNX5FLzxlBnVYkpAdE4cCRKOfM79kpRFpMHzatr/4GFwxXzjz/6HGosIrXGw3UmN
	RzA0q7lEP8WnCWlp/t76p5XWYUqI7C5AxAWE7f83s8VTEkkhYFbCysrPbZOtC4UuzCFT3m
	aI1glmfl+8X9t5Eeo51qYgZaq9pUjYM=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-mYlmoNtZMZicp3Bhi_CqGw-1; Thu, 03 Jul 2025 19:23:01 -0400
X-MC-Unique: mYlmoNtZMZicp3Bhi_CqGw-1
X-Mimecast-MFC-AGG-ID: mYlmoNtZMZicp3Bhi_CqGw_1751584980
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d3cbf784acso87712885a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 16:23:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751584980; x=1752189780;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Q6wqAkPgpNZPhvYMhgg8DTrDL7IGLoO4HjSh2P42no=;
        b=OIq2AIofhndqOAR7Et/7QIoK8J0A6v1qgfeourAlWoh5UAieS4Y4M2lFKIYBYTk+bs
         WciT/Mt6+sUNZo5mznfzG/imfrFO98Rcc5RiaBNPiU6HaPfBdHWuFlXfzYwrOXYWBTl/
         Wkf857YvAuFuCTRlnIk5gD//GBpSXVKcsE3k8yICx/yQfHZ9FM9q50kbvOw0I1lQ+hEm
         DJVAeZ8iFnAQe8JWsSfPpKY+t0tMsd2hiRNNc/ZCjpELOPSGurKJmUS8P9D1I2/NOca6
         kwNpoPexVw3eGKkTp8NJ5layS5JkEFE/Rljg0ouGOT8SAriANoi7pNFwDylh/jIyPOcB
         4U6w==
X-Forwarded-Encrypted: i=1; AJvYcCVQNWF224ZQc/upW6wCFbm20fSykfRYjR+0uT32o2V9NYB5hO4FlaPZ5wSjxRDXxCDSTUpbLzHSvU24L7nj@vger.kernel.org
X-Gm-Message-State: AOJu0YxeFEVhqPgdJ43906OYKjgaqdVmhvcZSXmbzJCW9qdV+AZX+9sE
	0Tc9rTs9IGob6yqX6+TsWU1pGufw9NQ5Zv6KbWaVI4NVSffvmtheC8S5R4QkPkT0vYi+XSLeaFZ
	Yf9VseXYnfRQoi57D0Mh0RH/CSXgJB7gtRSYcqcmnE++R8jBimMZJ/TaoCQpgmVtFGrU=
X-Gm-Gg: ASbGncsXFlRHuA2vWi20h3Bexft2rekfS/YuH5zpaDDeuAdZ2wd3YpVaVg55Obbu21a
	gfa1lxRtWLgdE39HH6YVAZlaM8x3Vr7yLfllDq7R3L4l0WEeNiFQC+L41UFq0jqn0SD2VNYl5O4
	encAMkfdG/bU3RcV5Fw8r3GiJQi/hC09G2V7Kv2fbj5tk960GcT5gK9KvEDjuMhj5hYxAP7TJfB
	aVdfVqTyCadddGrWOB99JBhntMRfflwAthGIdnTIlA7rcl44H/Gvd7glgC9JNGgsicuLgtjPVVq
	0HZFBT/6jSJQ8N/phCX7HsWmmrTQpbVhl7HdW1RHnuILEXeIUY36fMbb+jmPwA==
X-Received: by 2002:a05:620a:2b8c:b0:7c3:c9f4:522 with SMTP id af79cd13be357-7d5ddae44aamr46064185a.14.1751584979986;
        Thu, 03 Jul 2025 16:22:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGR/q2miTvF6gvmsI+7e+iNrCdk0wyNBmWfZUXnHvqUMWXThHnR6m2VVtbns1V7BCNpZ6c+dw==
X-Received: by 2002:a05:620a:2b8c:b0:7c3:c9f4:522 with SMTP id af79cd13be357-7d5ddae44aamr46061285a.14.1751584979556;
        Thu, 03 Jul 2025 16:22:59 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a958sm4469956d6.84.2025.07.03.16.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 16:22:58 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 00/10] clk: convert drivers from deprecated round_rate() to
 determine_rate()
Date: Thu, 03 Jul 2025 19:22:24 -0400
Message-Id: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALAQZ2gC/x3MTQqDMBBA4auEWXcgjW36cxVxkU6mOrQkYVKlI
 N7d4PJbvLdCZRWu8DQrKC9SJaeG88kATSGNjBKbwVl3tTfbIX0/SJlIMGouqHlOETX8GL2j++P
 l4oU8QeuL8lv+x7sftm0HyJxRZmsAAAA=
X-Change-ID: 20250703-clk-cocci-drop-round-rate-62c89b2d4c6c
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751584976; l=6416;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=ZubPxnRGAAyn5xIgslZ+93JU0NMJn/KqRavgAH8p3gg=;
 b=mVjR/1H4Pz8wUXIcqPHs6qoh9Y8tkWR2r6b9NT4k8OscHyiN1L5QE90supKbCmLvSF0f9XJLM
 mlpzbNU+eChA7PKTZOxbNDDQ0IfYgj8n+RZ6NCz8QDVxmVCRk4UvRYI
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated in the clk framework in favor
of the determine_rate() ops, so let's go ahead and convert some of the
outstanding bcm, qcom, and sunxi drivers that have a round_rate()
implementation over to determine_rate() using the Coccinelle semantic
patch posted below.

This Coccinelle semantic patch is able to automatically convert ~95% of
the clk drivers, and I can clean up the remaining ones by hand. I'll
initially post some small changes to get feedback about the approach,
and I can post some larger series by submaintainer once we get
agreement that the approach looks good.

I boot tested this on a Raspberry Pi 4 using Fedora 42, and validated
that the mmc driver still works since it uses the bcm2835 clk driver.
The other drivers were only compile tested.

There are some other cleanups improvements that can be done to some of
these drivers, however given the volume of changes, I'm only focusing
on the migration of the existing code, and making changes in a
deterministic way.

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
Brian Masney (10):
      clk: bcm: bcm2835: convert from round_rate() to determine_rate()
      clk: qcom: gcc-ipq4019: convert from round_rate() to determine_rate()
      clk: qcom: rpm: convert from round_rate() to determine_rate()
      clk: qcom: rpmh: convert from round_rate() to determine_rate()
      clk: qcom: smd-rpm: convert from round_rate() to determine_rate()
      clk: qcom: spmi-pmic-div: convert from round_rate() to determine_rate()
      clk: sunxi-ng: ccu_gate: convert from round_rate() to determine_rate()
      clk: sunxi-ng: ccu_nk: convert from round_rate() to determine_rate()
      clk: sunxi-ng: ccu_nkmp: convert from round_rate() to determine_rate()
      clk: sunxi-ng: ccu_nm: convert from round_rate() to determine_rate()

 drivers/clk/bcm/clk-bcm2835.c        | 17 +++++++++-----
 drivers/clk/qcom/clk-rpm.c           | 10 ++++-----
 drivers/clk/qcom/clk-rpmh.c          |  8 +++----
 drivers/clk/qcom/clk-smd-rpm.c       |  8 +++----
 drivers/clk/qcom/clk-spmi-pmic-div.c | 12 +++++-----
 drivers/clk/qcom/gcc-ipq4019.c       | 14 +++++++-----
 drivers/clk/sunxi-ng/ccu_gate.c      | 14 +++++++-----
 drivers/clk/sunxi-ng/ccu_nk.c        | 14 ++++++------
 drivers/clk/sunxi-ng/ccu_nkmp.c      | 23 ++++++++++---------
 drivers/clk/sunxi-ng/ccu_nm.c        | 43 ++++++++++++++++++------------------
 10 files changed, 88 insertions(+), 75 deletions(-)
---
base-commit: 17bbde2e1716e2ee4b997d476b48ae85c5a47671
change-id: 20250703-clk-cocci-drop-round-rate-62c89b2d4c6c

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


