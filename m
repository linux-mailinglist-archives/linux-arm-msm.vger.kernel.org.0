Return-Path: <linux-arm-msm+bounces-28378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2C69504F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 14:31:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1EA72B268E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 12:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87BD319AD6C;
	Tue, 13 Aug 2024 12:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MnOiMhYC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9685119412F
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Aug 2024 12:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723552290; cv=none; b=A+zVXCbScTX27G2W3ReZsVQgfXPOStSDY/UWayNq0DYd/P17AKUVL8yqUa62Oepos0IgaL24n5IGsl69+PcU3nWAHcpLU9uePQIgHwyXnGqv6fxKvlazcOk4FgfLWLPKU+rHMgALPL4VuFueF2smdnSpkPvv8yEi+EUGNMbdbHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723552290; c=relaxed/simple;
	bh=D46mnIY05bLlJLderz5nA93RqoBFIU6rfQGGg4rdj9Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mN5nTnnaw7THh88Exgk09zcr7WHswjSW5SPyHTNo3uuJv/vEnDJ9007DZk0ziMlUQ6JwkyRgqYTUSpt5qtx6jdTNE8lxlB5Va/91sf86IuEwxefwQShQ7hJx2jnEewLrmbQM/1Ge/kaYU96EAKpSb7nV4FrBWIeFch1L0uFJ8i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MnOiMhYC; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7a1e31bc1efso329446885a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Aug 2024 05:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723552286; x=1724157086; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ad/UsD/zD6NURBrzmTO0bADHZ1bo0+n8OWAPnHCmhL4=;
        b=MnOiMhYCrtweHQCmJCOr2bymMLkoCi5FJl7rU2E47LU5p1nzUb3Nk9LV63ILyTigls
         iFkSW2y5b7d9+OZwWd5pNOex7Uv8cwx+U4y0MCaZSeMHbyE0X4O/5JNHWcusVxDZA4Dv
         J4cutNoBADXWS0Ub4b8fvc/DizOts3VO+eI3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723552286; x=1724157086;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ad/UsD/zD6NURBrzmTO0bADHZ1bo0+n8OWAPnHCmhL4=;
        b=X/ZL6Ku9B/FjkAH3UyfkB4T1zXnNbWHG8+fGvDzdLiFryWFty9mf+XRKed/HXD3ABa
         FjObswd2CrWUeXgZBMxWkLemrh4TlNf5Af+ic2Jis9Opl8eWQ0/bWHXfjfhdX/Utkhmz
         lByg/bW8k1SYk/Q8LtjqZU2Ay3fwU+WrR/cjlMV7VHW5+nVYhmT3iLy89ukOkzGNlBIG
         idCQyaQvQ5bpG1fpwftw3oPDkQ7bxUJTh22/lfYI3DW6VWI1Ui2m0d6JMYcaK0zP3PDJ
         YEKSfOm9N5QX8vMI9/iJUMj3rrqkv81oa7f3kLiTx6X4KNj+SJn2XlnhVlD0Vts8Ox12
         CZdA==
X-Forwarded-Encrypted: i=1; AJvYcCV5FMPQA4nF3+Yqam4WdhgZ1S/ojfrNSQ07Tc6jUeWReeiBncqBiHv6rninQlzuu30uZqisCO3k9O6Bhp3Cg/X0gRa/5monSPVzzjUsyQ==
X-Gm-Message-State: AOJu0Yxed3iwLRGznRhIcYml7LYuka4kZSpkro4XRwh0Z+HsMVO9ePVv
	Djpthj85UVyirCUpfeCRKpaAXOFgakx386pj1Zj1yJbgZhl7jL0Uenk6/sKulA==
X-Google-Smtp-Source: AGHT+IGm2SIiezQ97zlmfRJwUB2Qa8OnBFZT9eLqo0k+qF2gvugaUClmqGHKLwhCwmjaOU2v6shxlg==
X-Received: by 2002:a05:620a:3724:b0:7a1:c431:3bc2 with SMTP id af79cd13be357-7a4e15b8e5emr428421185a.44.1723552286470;
        Tue, 13 Aug 2024 05:31:26 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7d66093sm337126685a.12.2024.08.13.05.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:31:26 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v6 00/10] media: Fix the last set of coccinelle warnings
Date: Tue, 13 Aug 2024 12:31:20 +0000
Message-Id: <20240813-cocci-flexarray-v6-0-de903fd8d988@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABhSu2YC/4XOzW7CMAzA8VdBOS+T43w03Yn3QBws16WRBkHpq
 ECo777AZRMUcfxb8s++qlFKklF9ra6qyJTGlA81wsdK8UCHnejU1VYI6MBDozkzJ91/y5lKoYt
 uKUJDUQxEUXXrWKRP57u42dYe0viTy+V+YDK36WtrMhq0I4eG0fQdhDUPJe/Taf+Zy07duAnfE
 FiJhoQwIPcQ/AJh/xG4QNhKcEfQsrc+mqUv3B8RIDwTrhLWNq2IF+kwPhDzPP8ClThafXoBAAA
 =
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

With this patchset we are done with all the cocci warning/errors.

To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Changes in v6: Thanks Bryan
- Rebase
- Instead of removing the unsused structures convert them to flex arrays
- Link to v5: https://lore.kernel.org/r/20240618-cocci-flexarray-v5-0-6a8294942f48@chromium.org

Changes in v5: Thanks Vikash
- Remove patches already merged
- Fix typos and remove hfi_resource_ocmem_requirement
- Link to v4: https://lore.kernel.org/r/20240606-cocci-flexarray-v4-0-3379ee5eed28@chromium.org

Changes in v4:
- Remove patches already merged
- Combine dvb-frontend/mxl5xx patches and use flex on both (Thanks Hans)
- Link to v3: https://lore.kernel.org/r/20240527-cocci-flexarray-v3-0-cda09c535816@chromium.org

Changes in v3:
- Do not rename structure fields. (Thanks Bryan)
- Link to v2: https://lore.kernel.org/r/20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org

Changes in v2:
- allegro: Replace hard coded 1 with a define. (Thanks Michael)
- Link to v1: https://lore.kernel.org/r/20240507-cocci-flexarray-v1-0-4a421c21fd06@chromium.org

---
Ricardo Ribalda (10):
      media: venus: Use flex array for hfi_session_release_buffer_pkt
      media: venus: Refactor struct hfi_uncompressed_plane_info
      media: venus: Refactor struct hfi_session_get_property_pkt
      media: venus: Refactor struct hfi_uncompressed_format_supported
      media: venus: Refactor hfi_session_empty_buffer_uncompressed_plane0_pkt
      media: venus: Refactor hfi_session_empty_buffer_compressed_pkt
      media: venus: Refactor hfi_sys_get_property_pkt
      media: venus: Refactor hfi_session_fill_buffer_pkt
      media: venus: Refactor hfi_buffer_alloc_mode_supported
      media: venus: Convert one-element-arrays to flex-arrays

 drivers/media/platform/qcom/venus/hfi_cmds.c   |  8 ++++----
 drivers/media/platform/qcom/venus/hfi_cmds.h   | 18 +++++++++---------
 drivers/media/platform/qcom/venus/hfi_helper.h | 20 ++++++++++----------
 drivers/media/platform/qcom/venus/hfi_parser.c |  2 +-
 4 files changed, 24 insertions(+), 24 deletions(-)
---
base-commit: c80bfa4f9e0ebfce6ac909488d412347acbcb4f9
change-id: 20240507-cocci-flexarray-9a807a8e108e

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


