Return-Path: <linux-arm-msm+bounces-52803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB96A753DB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Mar 2025 02:27:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E39F617558A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Mar 2025 01:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68EBE3594E;
	Sat, 29 Mar 2025 01:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bjiXoT6R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9654314AA9
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Mar 2025 01:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743211617; cv=none; b=os8IO6pL2Opo5x8uKl6OrJnff8Cp4HF/icD9oOQ0zq5lYCJmPC59vUjw/mCh1k61qft49Mv+BJ0d5BHiOqnQ1qfYmk8/REbiOifLHORd6LcBpVmH21Bv1giBZfBW9AokloGhDmVMJFRi5mtgySBOh7YlEyOzoo09B7dzXsAUbQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743211617; c=relaxed/simple;
	bh=8iUkVLiRaFgpf9kgBiXuc+txIqsEZ1pdksC7K1q+D0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=ZUugSVydGoV8z5zW9Huz33TCHOye5a+WT/jOIcGbrhAIrlCZHaib6aoDm8MHpNXmgkl5iS2sWRjPIuUOvf4IyyXloUkH4UDuMaSGAbCnEaPBur6FHOr5q2XCRjuwI5qfMoz0VayquyK4rf9L48BmhjZJ8AgCLkuZld6aak+0W2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bjiXoT6R; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39c14016868so4060f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 18:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743211614; x=1743816414; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OalCYm/Z+qjs2z+PLYtPWK/oaiLf/iOtUZrDjzSPIcM=;
        b=bjiXoT6Rj+tL3xibrlFVssPADTu46rKyN8PksK+p+zKemdpNLiLPa5YZHP7WrAoZ1e
         9rUScCkZtfcEiBgilNVilRpAk1iC+ZwtoIj2CqmC5fp8FdzO/WLR6zRGnu9wcAcxrb51
         oXjZ1EzwJdTjD35aoVVnrRdmIFUrJ9lHhZH4EsQffoIBShKS4KafWwRgdYWiHjM1B6Tl
         ERqV78QecnvCFY8clLwaFWbHqj3QQ09RHbp0ptsBxx8untPyDLjCMcj7cOqy1ucYSqjd
         kj0THMTx5Fv0nPvmwAv8kmikJ0gb64ajQ66zsfXWXGB73w0Kq46DtcnbL5kngHjI09y3
         2vdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743211614; x=1743816414;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OalCYm/Z+qjs2z+PLYtPWK/oaiLf/iOtUZrDjzSPIcM=;
        b=OsyIQSdDhVWVqCeF11ugIRK+thUEkKbYjHIhs+Ep3KAncsVCvxTAmJSedlOSC8AsiX
         Ws8Hn97nMHRWijQ1jZjPqQXapo+MVmwGXVKohZvA5HwUhc6gDjG0BIpq2zsG8uyQ1kix
         Ko7EQ3VXT9VpTEFWAC1JPt53bubsG3F/0uGW8etzxIndrGNK3K7ypTg3cGTmqVLF5nQi
         WyTeRIwUgxw2goe5Q/+Wz2z2QgS5VqCoq+TmvvdJmPRwzk7cZ1iJ6HvCyR1GH8BhZiuv
         C/xL79gkwBzhHNzhCBgz7DSUZXwHFSj753eW5LgzKrKHb4dbTidCjUtga00NWIGdrkWE
         VlRw==
X-Forwarded-Encrypted: i=1; AJvYcCX2u1349hz0DOT2KK8epC9d1I/qf2+4ubu10U5gT+Cg9ZXxWChAgddEk2U37y3C4C3hiS/C2NDtL44gY0Dq@vger.kernel.org
X-Gm-Message-State: AOJu0YyHrtDszz3uXLETFPbtXOxY27bSkq4K2PhzPXjGWhLAgotHvdzt
	0OabRhZI6gBKqaaT0nadz7Lk0CQGixfkM8LU/dpZPcoDDWkfbWG5XW3SFP63npPxMOYnUYhPekE
	wDFQ=
X-Gm-Gg: ASbGncsM6hXzFpLs17mv+Hc/YcHynLOFMYyy1XQUvS0nFQwksqf4rmJmLSPO7lzFAF6
	LRSwaohnqE+OD4V2YP1doH/KFrj8agtv5Nm3sAOFeEO/LkbewpNJ0UA12x8r1tnLfGGoobc6fz8
	nE9wl/r33S64ZITAL+RZd72xvYJPQBOsrWRBr9Wp+9xqEiTtXP14nIGK6md1yrLs5rxpxa7ySr6
	Zv4NnQzCSPgNAYvb1QNZ0Gukweu7mI5/qe4YxhPxOlnlRSBefSQyA2maBqDmI6eJgGAoWUywZsO
	anYEx7QuD2F0ddKPmQzk0vFTr168znvi/nqGfmvOFkmdmzoWB1GoCZT/gKcFclJ2255Rs7QUkb8
	XDw8XQ8WG+w==
X-Google-Smtp-Source: AGHT+IFtPc2WM6pnT8Dub9oo1Ivvz7Q5Lsd3aD5EmVGBQBZ7muWGL+w5LN7xlKXQLJlvsfQ0fc9dLw==
X-Received: by 2002:a05:6000:240b:b0:39c:13fd:ec44 with SMTP id ffacd0b85a97d-39c13fdedd2mr21687f8f.5.1743211613776;
        Fri, 28 Mar 2025 18:26:53 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a4239sm4264655f8f.94.2025.03.28.18.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 18:26:52 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sat, 29 Mar 2025 01:26:50 +0000
Subject: [PATCH 1/2] media: MAINTAINERS: Switch from venus Reviewer to
 Maintainer
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250329-b4-25-03-29-media-committers-venus-iris-maintainers-v1-1-0ec1007fde3c@linaro.org>
References: <20250329-b4-25-03-29-media-committers-venus-iris-maintainers-v1-0-0ec1007fde3c@linaro.org>
In-Reply-To: <20250329-b4-25-03-29-media-committers-venus-iris-maintainers-v1-0-0ec1007fde3c@linaro.org>
To: stanimir.k.varbanov@gmail.com, hverkuil@xs4all.nl, 
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2

I'd like to volunteer my help in keeping venus maintained upstream.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 29b4471574982bf3f8d03158cd5edcb94bc9fab9..5ccddd2030efd96324e53fcee8048120990a85d5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19592,7 +19592,7 @@ F:	drivers/usb/typec/tcpm/qcom/
 QUALCOMM VENUS VIDEO ACCELERATOR DRIVER
 M:	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
 M:	Vikash Garodia <quic_vgarodia@quicinc.com>
-R:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
+M:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
 L:	linux-media@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained

-- 
2.49.0


