Return-Path: <linux-arm-msm+bounces-43196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CC99FBA2A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 08:24:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B5ED16418C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 07:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C7D917B502;
	Tue, 24 Dec 2024 07:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RuMpON/n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3161156F54
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 07:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735025094; cv=none; b=S4dzUNlp4HbYOW+piC1u+B2V1iEdvkxyduqTlAde4Iqmb0miQL4W8qJt37bSltvqfX+IxTxG6BLtQu/zSV3E6KGDJ18hrNEuhq195Uix2ys4Yj/mDKxUr0UH9ZUkpucNnofPhyrG0p8eYef/S3E6dzPWK7+kEFvvs8+Cqg85KEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735025094; c=relaxed/simple;
	bh=2fMBL8LergDUS72jw7d1JQe/XME08hAJyxHARm7NJZI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bsascHKls6l9jmTlJgObtDtSUGiwBfuiNIIxcR1vspx2VPng5uqqItzkYGoOHcxXBmuktBExMk2nDaAu+o0wEqdD3s52oLGLqhVj8xY61zEIhVeta4Lx8hkiLi9nGRMdZaU9pkyRBTCEj4IeJLDk+NkYQKocsiuR06F9yJp8s1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RuMpON/n; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21675fd60feso62794925ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 23:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1735025092; x=1735629892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rNiCxYDQlXG2RrHwqYY7HaFMfBfk//boKo42ckSc+Ks=;
        b=RuMpON/nVI+YH5ZB+VlF/Bhl18AgCa1ppYCd88Jc/k/bqWIzWEbJymfF/7zaBXLIhR
         ndnpOeIqm29FmqdxW2IOl1+9EUfDVO/lwief547O98KfYzAoaR2ypcG5HC2vf46EmleH
         LMA6KkA5WtCNBs6CZ/aTp9VbcT5DcHMRTiwnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735025092; x=1735629892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rNiCxYDQlXG2RrHwqYY7HaFMfBfk//boKo42ckSc+Ks=;
        b=RMcrtAtWSy/TXXD6J9nW7E8SBPuh8x8vLv7XzDjFgpQ1QQ9HOaIlZsH1+bvjwzT7UJ
         HI6NkN7Kgmj4n41HPhHHhIc2NMPsJAqQKOPEMqpMu459qTkUgHTT8bnPrc915l/piesZ
         F9o1/P2WliZEhutzEqFALFZpFooAIy0TayykdiEH3npb9z5NbPNvZiVSbSe5gItjDEcY
         JVfYlzdFA27Jolo1Nx0dBEIaoRNqd7rwz1GtwX2/uH/dJsdX46qGilCnuwfrRaqS5CS1
         MMjL57IGFHTSrgbPIxqOWWouQvwiaNbZ3CCokNdOP+XAFLhal8KgYlNw83/R91VuwWDv
         OV5w==
X-Forwarded-Encrypted: i=1; AJvYcCXoiBnkquXmWmQPXN/poPNjF00+QnySrLjAPaILXbgBf7YlykX+qYGoxxyKbBfF0PqK0BnwSr2iOls4w6yy@vger.kernel.org
X-Gm-Message-State: AOJu0YxGcqJ5dVkD457EB4hHUl+ziCXAdjuh3eIKQIb3dSqZmsc0GPU6
	rdSzoX1Zs5p567saptkXhNxSzWGgqWFHQV/AGQM1ffH+sXE7AOaqvUMOlGAHKA==
X-Gm-Gg: ASbGnctvvZnenikEQ2PwJ6CHay8lc2HXq0X/xOZw5hG/6ETX+1NxDzyQMP7ksiifWHq
	phbyHK2lEfurveE8Zo/1/EBFU1USmNndH/p2VJ3fmn0jjBRp82/+Im+mVfcAFsE6SEyyQ0Mo89e
	vYb4oms4un7RID1jXNAZBUe8Q59+pRZFhmm52LWQo8+A1CvxFTPF7Z+QX7aWyegJanLWKhi9Tz4
	FsXum7q/Km4U0iA9pBxqLMl3qniI8Uv9XGvoYcaxsMCxAi5AiCIqBq7mcw=
X-Google-Smtp-Source: AGHT+IF3VSAg/jEAbHdgaJeQQunN76AODCbvrDpKXzcn0+KtDeJuP9aGKrPJk1J/J6tEesNxuZR/DQ==
X-Received: by 2002:a17:903:32cb:b0:216:7d7e:c010 with SMTP id d9443c01a7336-219e6f14898mr224820065ad.37.1735025091927;
        Mon, 23 Dec 2024 23:24:51 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:de21:da72:a349:25b2])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-219dca0256dsm84186865ad.258.2024.12.23.23.24.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Dec 2024 23:24:51 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv3 0/2] media: venus: partial revert of 45b1a1b348ec1
Date: Tue, 24 Dec 2024 16:24:04 +0900
Message-ID: <20241224072444.2044956-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts 45b1a1b348ec1 due to regression report [1].  We need
a better fix for the problem in question.

[1] https://lore.kernel.org/linux-media/ltiok5ryos2yh6bvd2md3p7k73rd6eu6fwagn2b4ij7tuljntn@dx6o5ralryui

v3:
-- added Reported-by (Dmitry)
-- added patch that re-shuffles instance creation order to match
   the destruction order (Bryan)

Sergey Senozhatsky (2):
  media: venus: destroy hfi session after m2m_ctx release
  media: venus: match instance creation and destruction order

 drivers/media/platform/qcom/venus/core.c |  8 ++------
 drivers/media/platform/qcom/venus/vdec.c | 18 +++++++++---------
 drivers/media/platform/qcom/venus/venc.c | 18 +++++++++---------
 3 files changed, 20 insertions(+), 24 deletions(-)

-- 
2.47.1.613.gc27f4b7a9f-goog


