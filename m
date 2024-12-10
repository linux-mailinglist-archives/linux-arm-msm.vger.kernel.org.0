Return-Path: <linux-arm-msm+bounces-41317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE429EB1F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 14:32:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A442C18898DB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 13:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 692E31A9B2F;
	Tue, 10 Dec 2024 13:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="awaWyo2x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E3F19DF6A
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 13:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733837529; cv=none; b=e0jNTmZoe+kbcjJNlsrJWYPTRRkdBCBet5ixJxkrwU24FnSk1mFaorXIExgAi69kzLW18TZ9OriHaUlzRduWDrfqPj+b+bACRbA9zAY1LHfF07o9xGWYbHos1d1ibARPtUnlIILBFzrq6kSSrMxi+AIk2b/G/z6sju9Ect3eQLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733837529; c=relaxed/simple;
	bh=tpxahU2EMEbtUoO2KLIKrt6Ras5uDKSg0IgF0I2BlhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=saB+id6iPM85OjklcH2bFh0hIl7pP639fM6ECSVGgUUg4D20nt3MeMulfmAUK4oVWjQfK2njGmv21lSH0/TTEJ7ugb06bUpiPdFXNhzlXUR/GO6fzhovgRxuqFQz9X3U5sPbX9VwGyYwKx+k5Ksg2xuij8Z85oAhAtAo/hIi9tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=awaWyo2x; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-434f80457a4so12526975e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 05:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733837526; x=1734442326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+XYf7bwDLYGGQXHqNGMCMwv3MtNzDyFAtjldQ9r+Oyc=;
        b=awaWyo2xbVyYEpv+QlX+DXPRI7qQMD7eUaMgvrLxPl0wtdjx1EjN+JI1akv76LeUai
         VjRgYBH/EFKEdXcTdlJmYrmQE83yNngSJPP1DhAiujCsL7cMwgnunH9OZS/GzNsVOXFl
         NG5gslJxUBOl+79OSmRORxRysIQDzC4RZ2fLcp7zUwxGQztjT3OmxgBq2x5Ss/+bnNMF
         b24H92tIp2l8dlbQg+nQZwpZgIDRoJW7BEf94cBJgMt450g3Tw0IWeXYx6698RJIhZPj
         kLrPe8ODq6H5srHAsKzxPeqmT8Jjf1yE1Yn770/An9C5ULqFLBZv1sB4O2+53B9/SAJU
         yscA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733837526; x=1734442326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+XYf7bwDLYGGQXHqNGMCMwv3MtNzDyFAtjldQ9r+Oyc=;
        b=wiIiHkKTGsXevljuluxwyd0dCwHSAxcZmdfe5XG6qvKHGsRVW5S2kWH6urAR/mc1Az
         FftSC2WB2weJZcr3jVKiUKNwIKd4ELRHkuAmup4+oOjYjp2IQGv9wnWCx9zP3J7FUF3Z
         FPSNolprLQ8HQaMUBTasEKP3k4Va8h2FB7iMRQRUBKjEDgLgPB0a6965SA+fUxz3HBVr
         Vv/KcqfRgZvpn55QJsFDdOO3aFdnlhk+2RAV5pj8mJcntaXWRha0u2XzVIvQ176LLzok
         eGEfJ5DzRKVPC86Rds5hECojQEzZ2LoOlQCh6o0AU/OifIW7dIJjaPDYPiP13kp4FPZu
         edYw==
X-Forwarded-Encrypted: i=1; AJvYcCX+cmSxKYp9IH5Br7026YMtR26V+UH3VozKXdKg7aWqm6+fbrOyMzzmnVWy0Uu2rPyoXhoHsS5zkjm7B80Y@vger.kernel.org
X-Gm-Message-State: AOJu0YyCCox/FtgfECUnO2OnRhl7sqDmMqAEWSRUvuMTLrs/vbU8zdND
	OH7bWUxAB+H/OY1hHqApzjGcHSFuGMKAPuhOwtmoKm7nsFiTgJhe4TXauYPSB6Y=
X-Gm-Gg: ASbGnctifGluFMZY0+H1vgwXNpFgBHt4ciIItNo/FLmWMSYz6kXD0FjOYJCak+bsLhO
	AqJQFWA5CX1npAR5Zmatg3EG0lull55Mx3AH4qDhaAVgord+vBRLr2u4xKrdwdEWHDZ78ypL6pG
	IkeCSIJd+DgUl/F6iMrsMl6JDwwnbAlWD4eIY6nLS7Qq2lPw8UxqUTdGC+0tluVvIkfw7jCafrz
	hVhiQxaZ5RfNublzXKmANO4eaUr6qybt8WjYeY0svNcjzX4/fqRRQ==
X-Google-Smtp-Source: AGHT+IF2eLcwq8DKDelHta8/7SVIEYxjxekiDTZf2TdmNWcwDe+jbysbuh2/9Uh+e7rg5d2e9vNgiA==
X-Received: by 2002:a5d:598d:0:b0:385:e90a:b7de with SMTP id ffacd0b85a97d-386469a0e74mr2361037f8f.5.1733837526062;
        Tue, 10 Dec 2024 05:32:06 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4c2b:c454:658c:f771])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-386367f7c71sm10212405f8f.41.2024.12.10.05.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 05:32:05 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Janaki Ramaiah Thota <quic_janathot@quicinc.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	quic_mohamull@quicinc.com,
	quic_hbandi@quicinc.com,
	quic_anubhavg@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: (subset) [PATCH v5 0/4] Enable Bluetooth on qcs6490-rb3gen2 board
Date: Tue, 10 Dec 2024 14:32:03 +0100
Message-ID: <173383751206.65568.8559892224432754385.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241209103455.9675-1-quic_janathot@quicinc.com>
References: <20241209103455.9675-1-quic_janathot@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 09 Dec 2024 16:04:51 +0530, Janaki Ramaiah Thota wrote:
> - Patch 1/4 Add description of the PMU of the WCN6750 module.
> - Patch 2/4 add and enable BT node for qcs6490-rb3gen board.
> - Patch 3/4 use the power sequencer for wcn6750.
> - Patch 4/4 add support for the WCN6750 PMU.
> 
> ----
> Changes from v4:
> * Added reviewed tag by Krzysztof in p1
> * Updated the p2 commit message with sw_ctrl and wifi-enable are
>   handled in wifi FW.
> * Added blank line between the nodes in p2
> * Placed the structures in proper order in p4
> * Link to v4: https://lore.kernel.org/all/20241204131706.20791-1-quic_janathot@quicinc.com/
> 
> [...]

Applied, thanks!

[4/4] power: sequencing: qcom-wcn: add support for the WCN6750 PMU
      commit: 93e3c990fcd90e578fd23b572a6c89020c7a453e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

