Return-Path: <linux-arm-msm+bounces-53036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9837FA78E58
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 14:29:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FFB63B6652
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 12:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C50223A57F;
	Wed,  2 Apr 2025 12:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sGYF0GSe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71630238D33
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Apr 2025 12:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743596660; cv=none; b=EONjIZBYXiT9yeuV9EyRiVfLglLiuGQHIA0dwLK+q1D+8dqeLRsrw2LD16sNwIOt8xJFdyWLSBCItCdPvJ5+HwVgBcgF1YWb0TISsbYdJl6lSeWYL+jZA12xR15dZ8KZyAfii5V4q9e2iin6EbjuvAveISD8dP82Zt281qBz/hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743596660; c=relaxed/simple;
	bh=0v2URiG8esdkRgUTyd3SngcEHuSOj0Zafp4N84xHkg4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hOG1TXg2a++OkFnk/5qKZ28EReqAHQ47Zs1ndAwZz6/iHo5umK8Hd6FcRxLhtvQqmOkmq5ITZqAfGEvaPLYb4WdF5Hsabq2d0uud2cicOqHao/0+oKLrYoMQu3s3xofPGT1kPyRTN/btSgxdxKPy9DFxQ9NuGVbBUebEw3pfV/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sGYF0GSe; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cfe574976so46236635e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Apr 2025 05:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743596657; x=1744201457; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ztK8X1ZBqwTpCQZgzQx75WiIn9I1zX9gTe47p5OjGL8=;
        b=sGYF0GSeNVXXFwNIelq2JcE7p2k9EUARs3S/FzjucEFbRNJDZO+iNusSH6DpNHfUYh
         7Oci/JxglJ/EjAVKagJ1msMF51SxzoM93l9mXOMhlnUDiFOdCVzy2DLbj4tE/zcbe2HU
         5ucqlbzBTmsjUxxIe2eFF6r8A7xIExAr4unP03Uy1Ja9pETHp5Scl4MQaXAFMDz8ww7Z
         pUd1SHOL1rRIB4B1IJK5Jw1DlPP7Qz0DbVEnfrf0bwPixpLK/8Q0RTWyDYTvkrJKHTCW
         SFgHqqiphChv/gBlnTfueNWEB6F4AGrp3qDH6ElaLsaaNyyrqdpLoU4zt2vRgQ3ylyrD
         JuLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743596657; x=1744201457;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ztK8X1ZBqwTpCQZgzQx75WiIn9I1zX9gTe47p5OjGL8=;
        b=kf4UPfTAAMudUFkyKcKPWsUD6Pt9y/ZCForkhFnyNIsI0JDzANv9sqNJS5zNbfR3rf
         YF4nWbN4cE/MMeAjs/e/oWdYkbPcHRMLlNpxX1uqj7SZ8PxkTxTYvfg7/DSZZEEGZRpu
         7+cCgOcyrJnJUu+AFAnLo/sZcRXR+UkMRu4OJK4+IKA8M5iF4O9sve02G2uzY/YCgcFM
         mGZddzEz75pq5EFv64BuUkqYvS4gQqKob+Hy4vLv7/c38XP2D2yvWdFG7MEXjfGjT8Ev
         84FBczbBkcrB2ef0M9TdLonhGPhmRTBfzum92BTyvV9XLneX2fiYVNO4lMrhdKqeLPUW
         iW1w==
X-Forwarded-Encrypted: i=1; AJvYcCW43yX+SnGZUXtPOhjMMi76j2kH3uBYz3x25R9RX1BMHeOuC9Lwj5UB2f9kdykqYJD9aYhFuLiMfaMwcjqd@vger.kernel.org
X-Gm-Message-State: AOJu0YwehB+r25etJXuyGWZBKv8H0K4WPp1hYlUJT5LTSPD8z1w+hTWx
	jcYeKs4Y6TY+0veQE+jbidiAa7KMx0/wgB0mbeo4edF5PHQvm0ZrMnhqnF8pRJU=
X-Gm-Gg: ASbGnctzY9kr5HqSbmiO2U+eGho8dA/O7g6GJrO8yoVvLHkraxKlVcVM9wNX5arAxEF
	ICA6+EIx08CGYo3Hk2RhwkUj9qPvQ1nOne4lo49CTTz/DtT79Z0+2yBYdsNGJzCNftOwBmXNIU8
	7OL/Cabg4uZa6FFNZfQVTHwqPvP7riVvLLCecQYWtMpJ1sDzV3RCzmh5LMLx5ylfJTiVXAQx6Kp
	12J3eDdbX8WQA2ulLSWAFBh6jqUtZAwTUW3MTxgKBQY3Wz9wCzg3hcXQdj2bopmPu3zt7Tib6aH
	yocsJbgZ6tBFvPaxSW17TeWZngb2KYKemv162Ef5iTpVqv4i9zF3ehn3JO2tOGtDnZui1OAwuQx
	Fp1s1MDvxhrlHwzByqBmL
X-Google-Smtp-Source: AGHT+IF40EzUUmGVd0zd7rqUsdkDiAiIczPUOCxpw6qKHK2XBj0/TDqOPqbFk3OkguXZaFpVMQXW9A==
X-Received: by 2002:a05:600c:450a:b0:43d:ed:ad07 with SMTP id 5b1f17b1804b1-43ea7cdfdf8mr50511585e9.29.1743596656675;
        Wed, 02 Apr 2025 05:24:16 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb60ccc66sm19418675e9.24.2025.04.02.05.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 05:24:16 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v3 0/2] media: MAINTAINERS: Update venus/iris reviewers and
 maintainers list
Date: Wed, 02 Apr 2025 13:24:13 +0100
Message-Id: <20250402-b4-25-03-29-media-committers-venus-iris-maintainers-v3-0-2b2434807ece@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG0s7WcC/6XOPQ7CMAwF4KugzBilNv8T90AMaeq2lmiCkhKBq
 t6dhAlWGCz5vcGfJxU5CEd1XEwqcJIo3uVAy4WyvXEdgzQ5K9S40YQHqNeAG9AEeR+4EQPWD4O
 MI4cIid09ggSJMBhxY55Sc017Xh8au93VKl++BW7l8VbPl5x7iaMPz/cTqSrtf16qQINmW2m9a
 xsme7qKM8GvfOhUARN+IFT9hmBBaIuIraE9mS9knucX4+8NGlwBAAA=
X-Change-ID: 20250329-b4-25-03-29-media-committers-venus-iris-maintainers-eb38e49dc67b
To: stanimir.k.varbanov@gmail.com, hverkuil@xs4all.nl, 
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2

V3:
- Was: Add myself into venus/iris to maintain/review
- I'll be helping to pickup patches for camss, venus and iris so
  +R to make sure checkpatch.pl includes me.
- +M Dikshita as she is an expert in this area.
- Link to v2: https://lore.kernel.org/r/20250331-b4-25-03-29-media-committers-venus-iris-maintainers-v2-0-036222fa383a@linaro.org

V2:
- Remove Stan from venus +M per his indication he can't continue
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
      media: MAINTAINERS: Amend venus Maintainers and Reviewers
      media: MAINTAINERS: Add myself to iris Reviewers

 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
---
base-commit: f2151613e040973c868d28c8b00885dfab69eb75
change-id: 20250329-b4-25-03-29-media-committers-venus-iris-maintainers-eb38e49dc67b

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


