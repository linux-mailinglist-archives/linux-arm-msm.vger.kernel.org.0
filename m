Return-Path: <linux-arm-msm+bounces-52861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5248AA7617C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 10:24:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 995A37A2892
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 08:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B82D71DDC15;
	Mon, 31 Mar 2025 08:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vhzeHjoR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1CE1D9A49
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Mar 2025 08:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743409424; cv=none; b=n73BVJ8IKB8mHn/bfLP5yn7RwjkZHX/AoDTtMqW/Nmd2OaHWbg1gNAKR6tMdxdKJwJNgo69rtbBc6aKAFIjEgdrSUqNQZESigCq3PDJwVEdWD9DgUpW8cX9dspmI2SJ8VLW60f6dunF83moXHlmmoj914BMopQ4MmnEZhxJf6bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743409424; c=relaxed/simple;
	bh=oLYgg2R3Khu6GTyhp5jk/pgurTV3eKg+D4RFW4sKhF0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sW2+gUXJ9JIjb3Kf012hKAGQcxm7I7b1TUejT7zSk6A44c5FiDmyBOT9ZrV1VQCLfPyjnntoa5dEFSaSOHsjHyB0O/QVmA6M0GhhToEunyucLt1s3IgjpT9iqyELYemGbuyN4xuoBEpPMVgOf/reLOJqd/q7fh6BULNciDxtsI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vhzeHjoR; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso18424335e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Mar 2025 01:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743409421; x=1744014221; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z90mA7CwidsjC7fKWg5OtIg+rrVsIJQMjuYs20zPR4c=;
        b=vhzeHjoRF7/jLwvgiKcmB0Khn8IMqwulukGA65oUFQykphCNE1fUOEuNMg+H0sIWFf
         g2KNeCuK+tYyzimzgpt7PQ0OnxSrSH1gxkzRBHj9a+02XWd69fqBQtjuvfuWPWO5YOc2
         ES9eFWoy7OnbjskiIsHTbTlFgd5Qoa/cLiHrZNeYXtNrL5RFWjx50MCR4Z3f+/8f87ok
         HdQml7SjyifaRunmZSgA0luEiY05in6UypMzmYHqWuhIMD6CptFyim0eEEMW2B3ZI+1M
         vd/v0/7DzZaWZiALrfdHv0p+KiQN5f7oqnjYYGSaYCNGFUeHIL/Qx7UXvc/usw71mCR6
         GLUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743409421; x=1744014221;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z90mA7CwidsjC7fKWg5OtIg+rrVsIJQMjuYs20zPR4c=;
        b=wLt9TcFoooiuS50s01dGZgqIU6NRQUxdxHwTXu4t7KOUw8+7aifJuylW9yxQRMCIlI
         LrnvY2ejGAwXYmeDpjZZJhyag/3Ly15DnZJ8fgBeEqfe9DUdUMtZVp/YAcX3tKz1x4Pi
         Iiv+IFyo3lVEIvG7daXaJy8oH9K25wkb6euQdz7U6x/bvakgZL7KDh3uj0HPNrzaUhQL
         6bN5bcdh2wQ+S/fwX0BeHygbWZe0VSBk58xx8oq4oYCdSPw9b8Ce8Je2zMyfM1Ka/FZi
         RGOYJ3NqHNJiiT2VMd0/1XHqvIRlcqhN1AvexW5Ez6CAKYBwJlfDy/ulEv/lqzqXJfGg
         DYEw==
X-Forwarded-Encrypted: i=1; AJvYcCUQ4PqRvoetfy/4E+f3g3fSkhT5wGb13L2ftHJ2NMm0fhwm4c88a486LIuVVkztwVlcgZJcEOrbd0G4QexL@vger.kernel.org
X-Gm-Message-State: AOJu0YwptXBovYjwQ0PDtiRDpCnpXf/RnHSSrog56wUeiyUrZIOf6n2r
	yesL+MGAW5kNG3lTZ9pbsu5tgErR+GXr5DEPQB8x3y8zxPMiuB5jElhnE35/Dow=
X-Gm-Gg: ASbGncv+CBF5bcoEG/76+2nDzv1WrZmgUVPc63Z2jzv/ga0OcqvxNan95OVh37H5DkM
	ou4WveqG6f+k95w7S8miurh8udZ45Dvk5S9myQBF0w21Uai3G3JtqbdnNDIZy/1b/sSm50tvtcW
	ESJWgyzd/1zjm3wBp6sdxul2THR8YMBQVa56j2RY8ktuCsN29QhNrYBu+JqKKgBd+pNXR0c2MTg
	ZgC63NdCM/l7noF8iiuIjRRQ2IcIQqP5TRePqUnfuYNS3PmeyRORaZMX5CJGks4YaASpC/pEtdl
	Oi9CyCh0h9JIGLsSQaPfiiwg04nvN3cU/nY+oayx5UBa8bedsBC6ZugWk/G+ahvzZwRakitiYNY
	K6ruVERV/jQ==
X-Google-Smtp-Source: AGHT+IHYCZsvLxxSRJILF12M9aB6H5w5fAhHW4arty7ZQG+n7V17Z3Fsr4dbK92tgKAzi47xfntmYQ==
X-Received: by 2002:a05:600c:468c:b0:43c:fa3f:8e5d with SMTP id 5b1f17b1804b1-43db61b52e5mr83031585e9.2.1743409421160;
        Mon, 31 Mar 2025 01:23:41 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a8e0asm10520079f8f.101.2025.03.31.01.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 01:23:40 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v2 0/2] media: MAINTAINERS: Add myself into venus/iris to
 maintain/review
Date: Mon, 31 Mar 2025 09:23:33 +0100
Message-Id: <20250331-b4-25-03-29-media-committers-venus-iris-maintainers-v2-0-036222fa383a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAZR6mcC/6WOQQ6DIBREr2JY9zcIWmtXvUfjAuGrPynQACVtj
 HcveoUuJpk3i5lZWcRAGNmtWlnATJG8KyBOFdOLcjMCmcJMcNFyKXoYGxAtcAnFWzSkQHtrKSU
 METK6dwQKFMEqcqloj3GUV2x6oy/dyErzK+BEn2P1MRReKCYfvseJXO/pf3u5Bg4cdc15NxmU+
 v4kp4I/+zCzYdu2H/N2yHL3AAAA
X-Change-ID: 20250329-b4-25-03-29-media-committers-venus-iris-maintainers-eb38e49dc67b
To: stanimir.k.varbanov@gmail.com, hverkuil@xs4all.nl, 
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2

V2:
- EDITME: Remove Stan from venus +M per his indication he can't continue
  due to lack of appropriate test hardware.
- Apply trailers from Neil on patch #2
- Link to v1: https://lore.kernel.org/r/20250329-b4-25-03-29-media-committers-venus-iris-maintainers-v1-0-0ec1007fde3c@linaro.org

V1:
I'd like to help out getting patches reviewed and merged for both of these
drivers.

+M for venus
+R for iris

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (2):
      media: MAINTAINERS: Switch from venus Reviewer to Maintainer
      media: MAINTAINERS: Add myself to iris Reviewers

 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
---
base-commit: f2151613e040973c868d28c8b00885dfab69eb75
change-id: 20250329-b4-25-03-29-media-committers-venus-iris-maintainers-eb38e49dc67b

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


