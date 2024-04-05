Return-Path: <linux-arm-msm+bounces-16448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B58C58992A8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 02:40:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6EE78286742
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 00:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBF135258;
	Fri,  5 Apr 2024 00:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TG8yTxgB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1671C02
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Apr 2024 00:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712277645; cv=none; b=l45PsWREsialpBr9fUQ79rhCH1idB0NstWtXdU4Oj9e80uSdbc0oM3NhzK3P8Tw6WF7mq1sGyVfpU/VsuC/2PnffMY19xLVWcfXyPz/mO8Y+50Q6zflZmUPA5e3Mf9jkjRjFOO9+PirGYbtM5+tsU8SULtlk1qHlrkGnlesSkuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712277645; c=relaxed/simple;
	bh=xUOXebN9PIgyrAlelXJzCybocBcjm3YXSPV1PP4/R78=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l28ePKA6YCuHALWSq5ttBEbURqj+aj6BwzF5S9P/xzxcBcDK+DCKJHVFuEGop4CHk0x8DCwLuk5B7G2l+lwJEGrUBQ4HAg6D7XqLPHyeENBPMVC8IdcM/YTt7j5RUYE+9+RfBivQScCxhL7rXCSX7u6gcPdsHbV7vFddmF6OPE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TG8yTxgB; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-516b6e75dc3so2083067e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Apr 2024 17:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712277642; x=1712882442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U0ZuJc28ErERyKuhpZGA2HeS0AKBbpYtRp/f8kkPCaY=;
        b=TG8yTxgB2tQxd7YeNajO+sPPNgdKsIqVQ4exUGwABjUspQXwDWNg/wG/OeuSk7vfgm
         WydmSsTUJ2w1huCDTiADj1HGSqwYTxu8IPHpaBYxGTyT1QskUuBfMbSuv7ju4d5vzOX2
         I/enBAcNV8UghGqWBgOYA1NuuDkMUCnZFfkcSZMA19rQk6HcE7CUYjlWetkCQzq6uV5B
         p6oVKlFRPBbO8pGwZGrjGg4zj8j/cnNtVzJlN9PN1NqnqtrSptQmZIGRMKNhFDtQYrdb
         6uYOwLvqZIPtA7ZEWPVrVmFdJvISdK+4QGuifJCmCXyjazQLSIEcPI3fMOGcW+T+i5NM
         fzpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712277642; x=1712882442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U0ZuJc28ErERyKuhpZGA2HeS0AKBbpYtRp/f8kkPCaY=;
        b=NU9rHaz9VQEQu4Rz8udkFBKNFPEVAtrbMEiwdrbSWQmzCO1L89Jyz6pK8qd1jqho5q
         kVCIpMj03IDPc8gMiYLTdYvt9NU3VeCFS2xVqn68rQ1EQo00r9AimQpZsZ3zvqhwyrUs
         uv9iVM7xFJE9CfblgVfRBgAWzuhpDowAQ5D1nhHPnNZP4flYAY+r+DQ0e0b/HKLSu+rb
         bNZz+xSi6v/XpW2BmIWy5eliD/+EqsRoc5HheTKenI+kzoTFMo8g128y36yhDsa7eVUL
         WcZaRNe7svdLQXZAChNmiQ++O4l5DOYDxXmpwr7C+zIOLhWDEGmyjQi2edoSiaRGZnn/
         xCig==
X-Forwarded-Encrypted: i=1; AJvYcCU6A5Hc4mvXqiBqL1MiXgiUa6ykF40a/Z+AV0wo4odgSD0LtL2iWM47WaHaO+jkNbYN3vbU5nuhqvHeGJCSNKs/OSdPBxAWADf+272CyQ==
X-Gm-Message-State: AOJu0YwlFn5Kd47rVHAh8pyVulPrSTOclH7IOwmns6ylJbadKQqhhly1
	+YlhSpJbVdwFtt+XcnbbwpZTzkA/NTsV5/0l+mkKqq623z3jWRSa
X-Google-Smtp-Source: AGHT+IFcL4t9Ws3i+K7rDr9LtOp9/qOkv0aF4FkRHGNU1Mo/ohErLIQl6woUtRYynvsWOWFuBGf3/g==
X-Received: by 2002:a05:6512:40d:b0:515:d5dc:8fb4 with SMTP id u13-20020a056512040d00b00515d5dc8fb4mr2625005lfk.2.1712277641792;
        Thu, 04 Apr 2024 17:40:41 -0700 (PDT)
Received: from kali.localhost ([193.163.72.181])
        by smtp.gmail.com with ESMTPSA id h23-20020aa7c617000000b0056c1c4b870asm200418edq.16.2024.04.04.17.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 17:40:41 -0700 (PDT)
From: Kiarash Hajian <kiarash8112hajian@gmail.com>
To: tzimmermann@suse.de
Cc: robdclark@gmail.com,
	quic_abhinavk@quicinc.com,
	dmitry.baryshkov@linaro.org,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	linux-arm-msm@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	Kiarash Hajian <kiarash8112hajian@gmail.com>
Subject: [PATCH 0/1] drm/msm: request memory region
Date: Thu,  4 Apr 2024 20:39:33 -0400
Message-ID: <20240405004001.120856-1-kiarash8112hajian@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


Kiarash Hajian (1):
  drm/msm: request memory region

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  5 +++++
 drivers/gpu/drm/msm/msm_io_utils.c    | 10 ++++++++++
 2 files changed, 15 insertions(+)


base-commit: c85af715cac0a951eea97393378e84bb49384734
-- 
2.43.0


