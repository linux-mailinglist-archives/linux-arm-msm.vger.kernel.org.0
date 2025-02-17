Return-Path: <linux-arm-msm+bounces-48178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F183A37FD2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 11:20:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39DB8188232E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 10:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C856216E2A;
	Mon, 17 Feb 2025 10:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="idJ5TLGy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650CA216E23
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 10:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739787468; cv=none; b=YIeQHt26VpfBBr7Npht9DphfWkpethPtPS08rGGfT2Rr9O69X49WfL3lV0Bwm0GyZwKA0GORK94WB6x+ze4AG94PmT5G8hw2r7eHNw5YJ0MnQOrB0oEbIHlO6mURG/mcTKKFjGrZGALxXC2K3PIX2SLAvjf4r7ZtxTYVhc5u+WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739787468; c=relaxed/simple;
	bh=C8oQLmUMWdk/0Uf4pWNBm6gUM2mwuJx5zdQChad1smw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZE6l8KG3BJ3Sbni995z/I6b8jDXIeewbZ5kbnL7hlZlOoe5bOWX3ILYUVHNdDWlt7rEzm8ihvvnT61iKOpbegxNGwGWYBCHznhUZ7greGX455oZSM8Yd3vxoWA3eSo9rwkgH0bWr5JnRQ08rWR6Etw7lbL+f+3HnkKVSbVmI6Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=idJ5TLGy; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38f2f748128so1225801f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 02:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739787465; x=1740392265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sjnizhfij0DxrLOw16h1FTCOX0FfuFrLDYVy7emG8Tk=;
        b=idJ5TLGybWhIQQQ2Jcf7wWlACchNFWnOvazSl9p9uKCiLjVWe32I3BJqpSu9knKpdG
         8T4MQXiPeX+Q5oZOtfQdFsYTCgPZmymSVReeP1lePkKti2LlGPU4U4w5SY6sa8ThRkJN
         5hlE/jrnB6yukzgZZ+QUYZyzoFRMOMda7hopbQU4GFEap2Rc/Czej7yt5AoQwnDXH1yZ
         SnRBjPj7Cf4Hd/xk0w6RII/udMo4dA3/C9RjtePUF7eRx5rpHfeI2qgAv72ChC0URg0t
         qayAskWq3/RTT4WFZrNhxftMLb9ml18w73LqQiw2tGXi7Ln88uYFFrZCLBxNpf/JtLNb
         f+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739787465; x=1740392265;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sjnizhfij0DxrLOw16h1FTCOX0FfuFrLDYVy7emG8Tk=;
        b=sMs7XiFuo3HoM8LEbqEKA/UphIzhXWmbjJmC349bW4SY8GIFgkZYBiUokTu7+8Tx3v
         ttCH5rntEgnPR7Gfk4agmzsEzJEk/y5o9X8CN47IBx0ejE+rnWzJMw4LdkmO13G5AzcN
         Hdq/FChKI2oa2CQ5/joxAet5wLfipOpEXx/Yi9rexCDSq7q7gCDETVJYbfiQmRQ1j8QG
         FFtE9M+GkGpcDb0GtBvVhZJAKeXdNVWQLTzgyYZ6dwa67isHZsw/5kf9XRfqRMwXe3kH
         CBMLpL7DD1GyteE0l6JlB8LQxuBQ0NAT3Kp+Yx9CSXrTgbZYRHnqLmqMQXrDjmKTHzFL
         09Dw==
X-Gm-Message-State: AOJu0YywaXP15eRuVEV8kH2HAxuo9Wi9eoXB6xUKfG3BA+9EVZ9wgiX+
	8ogqkztT96rsG+lTvUzv6FZns8oNulq4Hwm8bOKwIX/Mly1Tz6HoMKK1PZLF/nk=
X-Gm-Gg: ASbGncuxjQUdq2j67WupTRKfBglOyFy0WmJxvLl2u4K2qKLxkGPvMojCofte6XnlxFp
	Wkfh6d7IzcfLRSaN4IQa5a5opBR/oMilyjD4w6H8rQCKdaGstxj3udWRRGCy3JdycVr4aK9BTU3
	foaGR0dkRYZLcUiADjnYb+yYJkV4EEY9SJCmmwVkMPtE4Gpq8oSjXXUSX41S2GcpvQAlnQsOr7J
	JASFe5IdHq+QWWha4TZxyIHAOovQQBLoQZx5Zu/45uWfNl+ytaN+g6pa0xmAZqroYChCUHIY3LX
	t1Cwcv0G+n2I9hhrJeqOiItKozR0K7DCFQ==
X-Google-Smtp-Source: AGHT+IF7XwyAqsyVybUOb+YT3My0TlrSfzZx4U/CaLhTm/XLeIcngPTFZD0Vb4ytwztWX6MVo98cdg==
X-Received: by 2002:a05:6000:402c:b0:38f:3a5d:e62f with SMTP id ffacd0b85a97d-38f3a5dea23mr6895087f8f.33.1739787464671;
        Mon, 17 Feb 2025 02:17:44 -0800 (PST)
Received: from [192.168.68.111] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258dcc50sm12046297f8f.34.2025.02.17.02.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 02:17:44 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20250109-x1e-speedbin-b4-v1-0-009e812b7f2a@quicinc.com>
References: <20250109-x1e-speedbin-b4-v1-0-009e812b7f2a@quicinc.com>
Subject: Re: (subset) [PATCH RFC 0/4] Support for Adreno X1-85 Speedbin
 along with new OPP levels
Message-Id: <173978746391.27110.17465291668859357570.b4-ty@linaro.org>
Date: Mon, 17 Feb 2025 10:17:43 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Thu, 09 Jan 2025 04:12:37 +0530, Akhil P Oommen wrote:
> This series adds gpu speedbin support for Adreno X1-85 GPU along with
> additional OPP levels. Because the higher OPPs require GPU ACD feature,
> this series has dependency on the GPU ACD support series [1]. Also,
> there is dependency on dimtry's series which fixes dword alignment in
> nvmem driver [2]. We need a small fix up on top of that and that is
> being discussed there. Hence, the RFC tag.
> 
> [...]

Applied, thanks!

[3/4] dt-bindings: nvmem: qfprom: Add X1E80100 compatible
      commit: 3419bdfd88e314bc5f80b02fa4651c81a0a85b57

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


