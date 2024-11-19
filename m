Return-Path: <linux-arm-msm+bounces-38395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC85A9D2E58
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 19:49:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB6AEB371D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 18:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECBB41D0E20;
	Tue, 19 Nov 2024 18:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zTKmyAN7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1841990AD
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2024 18:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732041218; cv=none; b=KQTsvPePNmWzaJEpwDJT+CpfHftsGfJiNPL1GFuGY9HxYDx/nnsoZX1kC+pFAARd4dWOHkA58DNZAY+RrFgfC0CwF3MRtISTsZyfLxto1miXgEWF7dJezx6WpdpJhJS8VvYH8W8DYo49oWhH8T7fmoC/S+RvbN7a3BjzV6rY9uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732041218; c=relaxed/simple;
	bh=QxQemEHGZ9KofZh2dhxrC4puyYzWDwPDCmQkhwIKnEE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=j6+WALjZhhqQhkkCgwG2yBp5y6yKd6IioEJB1nJF2yqZUqqxMAy6bWa3XnA/PD+FOTJGR2i4KJAINzkkGIEh6ii7VL9MAwjoJFRPv8eMIafQXmVX1s9ByChIxCL8RRyrgfFdDESvBVwsDh4564i5itFVBrP7H70huRETidm8/mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zTKmyAN7; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4314c006fa4so5618335e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2024 10:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732041215; x=1732646015; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4uxBlhEzCEm273gWZ0Z1r3LrMeos0nChCkSfjPfMnzE=;
        b=zTKmyAN7fypxvTk5uaz+rlVPv9RlilhlA8fhCi0TmaWzEJT/vde2OxU+vE9n389iMN
         egDwjvoWQEH4uUS/2EJ9+s7u9REAEYXp18ecjypAnBHutfsJjLBJr1gWaxgrhuYg7jRP
         MOmD5meE9KIoMFT97/mQLkpesGp+Hglav/GAyPAtn8Pt4dfmplei2txFoAXEfYFpzhwO
         N77KBrM7SgoFeqaotJYAsPiJqK3E7phPss5fonVYamNaiPjz8vfHUBMKNXIEmTyf3vQ3
         iJqrB6BqA5cYubiRhD9SBqyifIso2GxEXkvKB/KaaFru77RHdUGgYXiJF8Xp+FlkDC3y
         v5Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732041215; x=1732646015;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4uxBlhEzCEm273gWZ0Z1r3LrMeos0nChCkSfjPfMnzE=;
        b=oPzYyukUcq0sh3Kxr60cVkT6QGzjPtFNceCjbiEJN1sWzIMzLgL+lBwJH320k3ILW7
         h5s+eFsVdHOLsh3VN3aKLS2QIlgm9UK35vPTTjx2sLmaToyVUS5GJR87spU0nw9znRCp
         uJKSYJD6k1b6mMk+kxt2ShWAeiK+phhgv6Oe8WnKepPJ6rmsmtz/l0kIZMU61t6TBBSH
         YdlVCw/Zo2C12agPDKrrKXmetGCvLIfyIJyTUuiGpj5a+Z/FOqU1Mff66dHfo9+HGp1/
         pHqVuW6wzWlVsZQxilPiphWRhzZw3ngHIHe5e+u3ZUjO16EaYocXwEtYIfg08Z3q1LHc
         Czdw==
X-Gm-Message-State: AOJu0YxqF63gWx9NczK0gcmrJquPVRArJuS3U67u3l3aqsoFxFJ7dNWC
	as6HdxhmjCuHWcFNnwqywV84oY6ldl8zgbv48pV/C5k0/9Gj6cqOEGYZvx0kEKs=
X-Gm-Gg: ASbGncsZEoRnLZq140bTj/9gc4f+Ldh8VqHkSjoPhuoBlaIearrY23Zw5uf332rV8OZ
	FTRCmw0qNHLK3VroXWJZCyYJK+LQuK1ARjcokEhJH/hG5ZGhA3kZGgd60WJEuWs6wK6C2thWVxj
	pwaN4JOiXwa+qUKkcnq0Aj7QJZ7D5B7s3OoMLf6nT2pwNV6fkbJWuVtw5LgxRP9WCWfSeLOJx1d
	o2zzbHaEzac/brlecCgyGGEiVhNy/IApCfFGq81D19+gJhTQTnNqQVXtESxfrA3eA==
X-Google-Smtp-Source: AGHT+IEv8u9mS7b3Hjaj8uwdJ2FGRBK///EN6j4F7a0RsdLD3QQC7qNAwSSPJAVtSHksF/xeUp+riw==
X-Received: by 2002:a05:600c:354b:b0:42c:aeee:80b with SMTP id 5b1f17b1804b1-432df797e02mr64687705e9.8.1732041215219;
        Tue, 19 Nov 2024 10:33:35 -0800 (PST)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dac1fb7asm201566805e9.42.2024.11.19.10.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 10:33:34 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/6] firmware: qcom: scm: Fixes for concurrency
Date: Tue, 19 Nov 2024 19:33:16 +0100
Message-Id: <20241119-qcom-scm-missing-barriers-and-all-sort-of-srap-v1-0-7056127007a7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOzZPGcC/x3NQQqDMBBG4avIrPuDCUq1VyldTE20AyaxM1IK4
 t0bunyb7x1kUSUa3ZqDNH7EpOQa7tLQ9OK8REioTb71nXNuxHsqCTYlJDGTvODJWgU1cA7gdYU
 V3VFmmPIG9n3ox/baDYOnim4aZ/n+h/fHef4AcxNUboAAAAA=
X-Change-ID: 20241119-qcom-scm-missing-barriers-and-all-sort-of-srap-a25d59074882
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Mukesh Ojha <quic_mojha@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Kuldeep Singh <quic_kuldsing@quicinc.com>, 
 Elliot Berman <quic_eberman@quicinc.com>, 
 Andrew Halaney <ahalaney@redhat.com>, 
 Avaneesh Kumar Dwivedi <quic_akdwived@quicinc.com>, 
 Andy Gross <andy.gross@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1525;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=QxQemEHGZ9KofZh2dhxrC4puyYzWDwPDCmQkhwIKnEE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnPNn01sfaeiAILH62481Qc8WKb9yZRN57MIG3r
 9L9KJ+HMaCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZzzZ9AAKCRDBN2bmhouD
 1xpLD/9ct2p3xGbW1rNsPWJVNjot6Qj9SnzyG8S64Q/hbmzt7tFJAWPDyJE3xctWD3W+8CnRS2X
 AWMlCoelvil+5Pg6wy8lPfewFyrt6MwaGI/Ukjd5kZFNUxPzuH9o9WVOFV4cs9TOj7YAGvhUpnz
 E0hMQg7Ms3D6Cmp6ASD2VzPnZOTLfi0Zy/7pLwYkn8c8xOV9kKidw7Kx6VmQEjfvM5L907VIA3x
 aqYbEZ06elWAekwEFwAn+txMpn7Hxr4kD26g0w61FFnfj1B5ewGVPbx/r+nc29pycXivLfjSzg3
 +i07q0GC1MoeHuXxpEIo5jg/jH09ehbNWwjBPK0Nmk8WzkZZBIrM+3EQeUanpyqct+oTyT9XZF9
 0OHA2F6leAAzfb0jKD0y9Pcrg41M0MapiTd/Iv5EL2hM6gqHwXutNPT34xUBer+T8D8sPXgitpx
 yjs+ijos8oUW9Ifo7W7pmIrqYfcjt+e+UzBf3xZU4RXsD3H7P57zwB5uxtYSHongbnGDJK/lX88
 rEwdpnOB50tdHe09FzlPVpGotWw5eIWv1YncfKORspQs9z638n5YvmSe/ffwQ9cP35JQ00v8j+Y
 +z5eh4be6er6mDaEr0vMF6Qm/GlwnCfKqrCgRwNTNG4V9PrwXgUiB10RZr1vq6FVNAPg6picO3C
 bNKWKvA7+WsD+fw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

SCM driver looks messy in terms of handling concurrency of probe.  The
driver exports interface which is guarded by global '__scm' variable
but:
1. Lacks proper read barrier (commit adding write barriers mixed up
   READ_ONCE with a read barrier).
2. Lacks barriers or checks for '__scm' in multiple places.
3. Lacks probe error cleanup.

I fixed here few visible things, but this was not tested extensively.  I
tried only SM8450.

ARM32 and SC8280xp/X1E platforms would be useful for testing as well.

All the issues here are non-urgent, IOW, they were here for some time
(v6.10-rc1 and earlier).

Best regards,
Krzysztof

---
Krzysztof Kozlowski (6):
      firmware: qcom: scm: Fix missing read barrier in qcom_scm_is_available()
      firmware: qcom: scm: Fix missing read barrier in qcom_scm_get_tzmem_pool()
      firmware: qcom: scm: Handle various probe ordering for qcom_scm_assign_mem()
      [RFC/RFT] firmware: qcom: scm: Cleanup global '__scm' on probe failures
      firmware: qcom: scm: smc: Handle missing SCM device
      firmware: qcom: scm: smc: Narrow 'mempool' variable scope

 drivers/firmware/qcom/qcom_scm-smc.c |  6 +++-
 drivers/firmware/qcom/qcom_scm.c     | 55 +++++++++++++++++++++++++-----------
 2 files changed, 44 insertions(+), 17 deletions(-)
---
base-commit: 414c97c966b69e4a6ea7b32970fa166b2f9b9ef0
change-id: 20241119-qcom-scm-missing-barriers-and-all-sort-of-srap-a25d59074882

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


