Return-Path: <linux-arm-msm+bounces-17374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A55A8A3C22
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Apr 2024 12:11:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15D211F21119
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Apr 2024 10:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A13F33D57A;
	Sat, 13 Apr 2024 10:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MAev4S6o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181462576B
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Apr 2024 10:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713003077; cv=none; b=VP4tYmCm1tnbhQY7t1wkOjy15E3HTfFUA3roE7yZxO4Pfqxqw8Ww21xAwpWABchmdMi0bX3RkdKdmOGdkfb4eyKsjN13HPWfScgh/HRNWw3b5NQgSnRZIdHe5yrDbi/2QgET9hBUdHeUfmb1gcIfTOP5c38HLNKQmcKYeK+OUBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713003077; c=relaxed/simple;
	bh=GTnx26jyD576A9spBEofCrW+259pzNhlga+m/yDLy54=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=p8CfXNg36vuE+1w32v7N+dh5Hqa9PHLBou/PLl4tDpMgBjYbw1MmXPNO+madxnTAUE8bACcy/9AVdQ243qmkufc18kdGO1QiZyN2bEkBY0sGF+p9zoDJVQziRqpnmwKkuoUJx7FoVGdjAsqLcVArY7qIVhQ/UsDjfHxL4pkNOwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MAev4S6o; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-41822e2497cso2122395e9.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Apr 2024 03:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713003074; x=1713607874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oCfWmtiLGf5Dk/iFf/fqzadXNsrCvt07/+qhRgK3ZMs=;
        b=MAev4S6oFM+U6IIAyXDPR/JciWkN4602CCssZ597vQPx19ylQA+BHcveHa+MQO80cm
         hBoikERzB24VHaWvqKzGXKKXVLjT452rQLZ6SOqLSl9I1GwPc8Rz0wLovJU1NZkjbgVA
         jdZst2PgvLLd6EgbA0pSs5lXh+GQaomH2TZ1QH6VkaYFfU5VYV8kKLb2LL6eUnFrgF8F
         s9/1smFO6roIV7U4/e0EghQfTP7eYPc17FQI69c+WQSa591l1aOSB9p0U9weK8j+t0nZ
         Y+vEzfmYyH3VhB4SIZA5NmlzKZslIAUgP+lJ1U+ocv6x1teqcmhfYebiyaQAGbE1jEel
         VytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713003074; x=1713607874;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oCfWmtiLGf5Dk/iFf/fqzadXNsrCvt07/+qhRgK3ZMs=;
        b=WaloFEllpxyjxqCtffFEiMr1E3WyTc52a0XfD2uq83crJAyn4d6nxrl5bP0+DlkWmz
         gbefJ7Mj5mK0hnBPYCbMMbGJV1PPxtWgy8f2Hz2sxje/QGUdqupmcTY586dz1Unypnej
         da7EZDsKAw+7YlsNHNAOBXvRgO9BU7ufPpXI9Sof1XIJ+Rnejf+SHsK6mmzTZtbF8w+X
         wtwqImoIaN9kl0TunFOPoqJ2z0SzpqpOLKnUIoxei6HLmJJ8zwRZQXSe3RRq8n3JWBgK
         dpSYPYS6Q7HCUmnkglzqGdPu1SUjg+UDehPX1tExyhjJh7O96Y1aoRU6b7HCZxvuG7N/
         kvGg==
X-Gm-Message-State: AOJu0YyFxVUJJuITLZZOHgbMs+hOluBuvZ/9eCQZtb4YZL/mnkdyM+LI
	iSa3O9VmQZ6/snHUSlxlxRUwHm3QvYG9HmtBBJcPTyHBfL2YNuDDQw95oTdy1IY=
X-Google-Smtp-Source: AGHT+IHnEx7mY83f6FxHfhh8wbkbgUNNlUcijZBsKkq2m9fO6al3hltka+gyqoXoSe0DdGsWQED7jw==
X-Received: by 2002:a05:600c:35d5:b0:417:d4f6:1aa0 with SMTP id r21-20020a05600c35d500b00417d4f61aa0mr3363740wmq.6.1713003074305;
        Sat, 13 Apr 2024 03:11:14 -0700 (PDT)
Received: from [172.20.10.4] (82-132-212-30.dab.02.net. [82.132.212.30])
        by smtp.gmail.com with ESMTPSA id gw7-20020a05600c850700b004146e58cc35sm11773696wmb.46.2024.04.13.03.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Apr 2024 03:11:13 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: andersson@kernel.org, konrad.dybcio@linaro.org, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 Mukesh Ojha <quic_mojha@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <1709662869-10569-1-git-send-email-quic_mojha@quicinc.com>
References: <1709662869-10569-1-git-send-email-quic_mojha@quicinc.com>
Subject: Re: [PATCH] dt-bindings: nvmem: Add compatible for sm8450, sm8550
 and sm8650
Message-Id: <171300307263.22846.5421120272134098432.b4-ty@linaro.org>
Date: Sat, 13 Apr 2024 11:11:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Tue, 05 Mar 2024 23:51:09 +0530, Mukesh Ojha wrote:
> Document QFPROM compatible for sm8450, sm8550 and sm8650 SoCs.
> 
> 

Applied, thanks!

[1/1] dt-bindings: nvmem: Add compatible for sm8450, sm8550 and sm8650
      commit: e5630036dab1a99720b129360dd398bd0f19d1bc

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


