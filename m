Return-Path: <linux-arm-msm+bounces-43002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8128B9F9760
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 18:06:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C4687A3C0F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 17:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACF5721A423;
	Fri, 20 Dec 2024 17:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IKTWSL72"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1123218E8C
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 17:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734714100; cv=none; b=BhobQ0b9JHrzNJy8MS8qm0hdanF54QXqrfibScZ7P8nb15Oukzd1GMmxZ1911hsTkgOz68m3mLQ1VAxuEFAU3QelOaEbqy23s/S8AqO5mSEvrqsZtfXmq+dd/I/3qHfu3CHuFQosywXMYle/47AtjEECkoVSomm8Xe6xPtKv6/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734714100; c=relaxed/simple;
	bh=0/3O+YP9fVmY0m4oZ8+SL6ozkG8z4ornaf3hd6s5H2A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ki/6EV3WHuRxSVynBcKg0hKn8I360ZRUFiy+vTQG7MKJkyjy7BUyHRZMhkwzDjYVq7wdibAYLNFKiqMIIMzKnEIp/kUHCUI0r+PaP78qO/kD5xlAbA4/8Gx4OMFlpSf9AZtbtd7LM1hg34EqQDvr86BW0m1hbFKOiN5BB7ydBiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IKTWSL72; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so21451895e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 09:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734714097; x=1735318897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NwYwXtAXGqZrv09ePjRhH4qAatV/xDfmXWSb9loRF9A=;
        b=IKTWSL72JpbLhTExk+ItR3tqj2kDtuX2xMo8vJ2+B12SxgUVZ48LvvhWKREjt1yuhY
         h6zwaPZrsNjIUwfh2btUbQRlYBYZcUvR+24L3PaVFhpv4YyPQX5WtqAg/JCOB4XoHjjo
         posSANQbuvIcbdLQRSqS1IDFmwdqiMlQaO68szVKLRh6e2a8Qg20GRyUz09/9uhyq0jq
         8crM/QLgABukqZWXnXnF4e8Z95sGTrAIZuUB3RpkndpFAgBDDUiil8yf1U6ZkIUhu/Dp
         44m2bjYVF6VDCVT9WxG6eKbsanvEZkIZ2j0I9ISixbA/mDxt+q3r06kDthq+v+nYNMy+
         NhtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734714097; x=1735318897;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NwYwXtAXGqZrv09ePjRhH4qAatV/xDfmXWSb9loRF9A=;
        b=XAPuVmmpy6WyWHUJkEIdMuoOfzqhkm8u1auI5hDgvTVlwKbZ/0OYFBB9c9/IVHeEl6
         PyL6XT9oBemk2OjHwF3grXo4w5FYMJnYkN6n53VB9wwzQWy1GZkYT+g25wbIWX3aHIxs
         4spSmItnZ5sL/lgDVAsn9gk0O/cvgfRdO2BDdvo2wYmXkrgQSXQpE9QabOLtOuuihk0Y
         cQQKZJnXaQL+VsEEmdlRxV+YCNAPlj4OVIuPLD8A+U2orf9R77w+PRJaFrdVak12kKKa
         N6Qv81/WcIvLnAn/szglZH04DliM3nRdda209vnsbx5Z4igUG0nmgi7SeD62YerYmaiN
         UMGw==
X-Forwarded-Encrypted: i=1; AJvYcCVSPL1jDrU8MGz+RTIVq6Oof3a6jmPPSV3qAFcX8RYDZnmBj7UxW1ahFxHuH1EyQAE0zjSbwr1JGyFythkg@vger.kernel.org
X-Gm-Message-State: AOJu0YxbDCTOwgMzA1YY9O8RZ0fSaqRoA7KIDxY9lspdPhV6FEg4f5Jt
	juJXTD8qgBEBAPFVRfCc/+9LA6gnaIzJbnXczcuflEaeKyETx2TlFC45T2i48ZQ=
X-Gm-Gg: ASbGncshNX6XADrpbkPauTbNFuQFAR4XYNqjo16EHAl8lTcJ5bKkywyaFtl7dLXusc9
	RJSC0T0IxyIJPHGOk3vL3p2ASmeT0ndLpNDMxC8R3Hf1BOLs9xHbp5gdmXNGF+3+oYhPGVSf0xX
	RRW52nbjuZT8b5JmR3RWSg+IRLkNnPkTk4Y6YtdnU+VNPAN9+Lawj6RJr4GrLPPjnL16Ku8FO8Y
	GHmwvUwxHJZ0jMqnLDZNPhqm9x/LXmqr5t6l49tLUm7H2WT6uB9/jDpTlxZF7PSbHv6lkSz9Sc=
X-Google-Smtp-Source: AGHT+IHd0vR+RC8OFfRpVvbjiLi42KWXeebih+hOpLiD9ItFcNdcQgnkTSg9IGudLlzm1QLtGCrHkg==
X-Received: by 2002:a5d:6d07:0:b0:385:f2a5:ef6a with SMTP id ffacd0b85a97d-38a221eaa5fmr3920087f8f.15.1734714097074;
        Fri, 20 Dec 2024 09:01:37 -0800 (PST)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c828e3fsm4540535f8f.5.2024.12.20.09.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 09:01:36 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jingyi Wang <quic_jingyw@quicinc.com>
Cc: quic_tengfan@quicinc.com, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 quic_tingweiz@quicinc.com, quic_aiquny@quicinc.com
In-Reply-To: <20240911-qcs8300_qfprom_binding-v2-1-d39226887493@quicinc.com>
References: <20240911-qcs8300_qfprom_binding-v2-1-d39226887493@quicinc.com>
Subject: Re: [PATCH v2] dt-bindings: nvmem: qfprom: Add compatible for
 QCS8300
Message-Id: <173471409590.224880.7329202916635453422.b4-ty@linaro.org>
Date: Fri, 20 Dec 2024 17:01:35 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Wed, 11 Sep 2024 15:34:33 +0800, Jingyi Wang wrote:
> Document QFPROM compatible for Qualcomm QCS8300. It provides access
> functions for QFPROM data to rest of the drivers via nvmem interface.
> 
> 

Applied, thanks!

[1/1] dt-bindings: nvmem: qfprom: Add compatible for QCS8300
      commit: 717123d96f7a6e4aaaaa7a62ac8c489e5f7f923c

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


