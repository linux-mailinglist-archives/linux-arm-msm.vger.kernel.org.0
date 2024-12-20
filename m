Return-Path: <linux-arm-msm+bounces-42999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C20C9F96D4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 17:47:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D46A516ADB3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 16:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D99D219A63;
	Fri, 20 Dec 2024 16:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IkQbq0JR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96018218EAC
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 16:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734713221; cv=none; b=XNJSv12y2o1pz3e1+zGnuCFqFOucJWpZFyPGxQH/FIwba/O15pwjcAnN5OZc+Ta5Y6xijZFQAukA+FvQFrGlCqh0XZfdAsLjQhzEBZcr6Q0UTl/9RXzO70+Ms07YevyH1VAtUDNujgyWawv32/g1JC82gsIVqRYDEqREEDrkjTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734713221; c=relaxed/simple;
	bh=/B2hFvPofbZI1fc2VO8E92d2OtYMYvxKg4TvrOTtaAw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MuDgAv8JzjpzhP2FuH+SQluhzxttNdUkYBTbWiWCFnsWCIqdeU+jfUqKobSWECwF+MYDLKstLNDXBM6z8bXyk/zasH7uaCZAmJl0v1nw1KHm2sIx0uR8InZVXgSafo/u3fimoDasvlffxl3jbZUBcGljWJ2wy0g3Tu6rHTt+ptg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IkQbq0JR; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38633b5dbcfso2106541f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 08:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734713218; x=1735318018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pN3NCV0VK/uGJibMQfEcSGLqDK9XIPj1wk3PZ/vmF2U=;
        b=IkQbq0JRWjKA2GALN8m5dAMffjC86Qjc1xJ9WfGsRQHT3FIH8hdJkHeCMg3cUkj+4p
         OBply9sQqML/udXphC3PIRn/Qxr8C4enzLACJIuqesJS7oLlAaa9QThZmkXCDtc651xo
         SurdbjpEiCbXW4ImaJV4kUaDnDUB0IQb9DJeDs0W67U4IvV72jj7TmoGR5nlUUNRUbjw
         kXWC1k2qWhywSkyk1eZvl6jHV/uB8dVjbVFongLfkTgAQaI+aSbIbk2t0n+TG/T5X0VU
         232PWtUYwSYNbAGZ1pTVNGzpeWJoUDWG7Ex7QfKnC6PBULN7qVo30sRCtifNcco2ybC6
         ZOhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734713218; x=1735318018;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pN3NCV0VK/uGJibMQfEcSGLqDK9XIPj1wk3PZ/vmF2U=;
        b=Y784aA+r8oT4p4PKV6UN0X9yu2TXzQNkH7PlpybaalmghKn62FuuSnAJ4WAT+MFSH+
         lc7ukHh3hsSeCzxN2vHBuG08l7l69M6ySH6BE0/UnySnvxULVrTIPx/o2FqrZ0bxBall
         SEwMhwBUTPbFFSwPQIht/JZy+b2H1X5JW3rxgTN/5i4283T6Va1GNbQUmnUrXCZV40d6
         H8d6BZQeRujiuDRwjbQ+Xf8QakXzae8GvAyK3JFTX1pVkTNU9mVX1Y2Plq8tPJLzda3D
         Cg+yC/o56a+l5N+brpz7h/3SpDqPHv2+oXykdfqVHqkADR5wVXEThYdDI5ro5n1w6Zvx
         4fSw==
X-Forwarded-Encrypted: i=1; AJvYcCWbn/0SGp3QnphH8zFH2DnfJBXTJU55hAoSRUSz5s+eLGQC+HHD0BK3MQ5WXWZPiixxgpV10tds1inzH1Js@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ/GHZwX53T5t15Du+agMz1qz44mm+3ITv66ZvtFZl529Jj5MZ
	1z+UNGGHNNoFeF3hv99BwMkvT+C59eI6QHUEtbFgurKhBwVPlNMZJ+06c6LAIRs=
X-Gm-Gg: ASbGncu0shDvx2Ia8Z6+ATguimVVws3NbJVB9OCbKz55cA7QSQtXUSd0YBnggZw3tlG
	Lq9kML5yDFii6sW3ZKFJsnDAWPxeqmIIIREzOZUjuZ/i7BbtOEdt95mANv7n+v+WV3AwDIhsfys
	h/vRimAURiPNg//xcQqZ8z/YYAhakXnklwB8ChNODVNVSckaxMMhXCiYwrjgtggLjn5S/BnRmr5
	s2MhFEGMJKJjSSLbVTtQa7OvQ/+HBhimmeMVZJ5ZIwWaBCV+b7F0G2oLfX4CNeIxX3HHSk0gno=
X-Google-Smtp-Source: AGHT+IF2qOn5DQvkDWQOOGonC75zrI8OJerUlOXhUaC5o56J1R56eQiHy3EN9O2yh86rk+H5NyWy+w==
X-Received: by 2002:a5d:64eb:0:b0:385:fb8d:865b with SMTP id ffacd0b85a97d-38a223ff5bbmr4232823f8f.48.1734713218009;
        Fri, 20 Dec 2024 08:46:58 -0800 (PST)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e2f9sm4546038f8f.81.2024.12.20.08.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 08:46:57 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Shyam Kumar Thella <sthella@codeaurora.org>, 
 Anirudh Ghayal <quic_aghayal@quicinc.com>, 
 Guru Das Srinagesh <quic_gurus@quicinc.com>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20241220-sdam-size-v1-1-17868a8744d3@fairphone.com>
References: <20241220-sdam-size-v1-1-17868a8744d3@fairphone.com>
Subject: Re: [PATCH] nvmem: qcom-spmi-sdam: Set size in struct nvmem_config
Message-Id: <173471321721.223061.15271739555049260433.b4-ty@linaro.org>
Date: Fri, 20 Dec 2024 16:46:57 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Fri, 20 Dec 2024 13:22:07 +0100, Luca Weiss wrote:
> Let the nvmem core know what size the SDAM is, most notably this fixes
> the size of /sys/bus/nvmem/devices/spmi_sdam*/nvmem being '0' and makes
> user space work with that file.
> 
>   ~ # hexdump -C -s 64 /sys/bus/nvmem/devices/spmi_sdam2/nvmem
>   00000040  02 01 00 00 04 00 00 00  00 00 00 00 00 00 00 00  |................|
>   00000050  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
>   *
>   00000080
> 
> [...]

Applied, thanks!

[1/1] nvmem: qcom-spmi-sdam: Set size in struct nvmem_config
      commit: ad71aaa9083a7ca8be9105d30a3eeaf4937234f8

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


