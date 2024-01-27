Return-Path: <linux-arm-msm+bounces-8632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCB483F107
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jan 2024 23:43:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CC901C214F3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jan 2024 22:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 273CA1DFCA;
	Sat, 27 Jan 2024 22:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tW/hJqkx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1791B954
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jan 2024 22:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706395405; cv=none; b=M9AIO3ivYi4c3n9l3MrW5tB8fdMOpSaAxoIokicGf08mld1fhBdsNabNNcUBTjJwVY0hbgNBTojAV/xJo0E0zf7HPl0VpJ6HXaUxVgbss0oENCNzAURBsEGL/P/F5QFefzFKjOi/UBOiY9JDhsOg5/YbqITN4zJLD4YQKLH07hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706395405; c=relaxed/simple;
	bh=mWjXtlhzxJ0HumO9EQxiUCzJoLvCZ3auqmtfLpgoNWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bpre4fxFKADYRWUAjxGg0QIvlcgVxyKsA58GqRI2X4F4Wyi4LqrD/BkG/rE8Vprfi07s2CI+cgCKIMqgqsSMP67LB4cBgdLiTjEHvdGzBhpUOaAlj39yHnaYHASOltV/80DbULtb+U6b3zHjAX+fP++9PIGL7AZMa3O3sXf+llA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tW/hJqkx; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6dc83674972so923710a34.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jan 2024 14:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706395402; x=1707000202; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mWjXtlhzxJ0HumO9EQxiUCzJoLvCZ3auqmtfLpgoNWU=;
        b=tW/hJqkxhIwsPSPb25FSMkxaJcNfr8wPiN/bfhpt0PoE9+RVCGzFg9t+PkTVJsuThF
         T/JxL/TGDKsnKKXVqHV+aYYiKdLXdtv5dveTI90c+bS/BGs8pzNrsjEy6A2Ond4zMkEZ
         SxRd9UZIdnQ1JuZiiQFoWEas+Z2mtD6sB4IXYw7nc7SYUg/DgS8Xh40oyys4weZpPnek
         iQEKbsWLjsVOUvebYnl6gXunj+FAUGICscDeUm38LIku5YtpLGvD2ced25D0Hg5gyFCE
         LHELpYmqijcA9kHqefgP0XZB4AGDTTH7pyW5TfiYnAfnMh4hBuXpfRfr5ir1U4cWuXHy
         UqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706395402; x=1707000202;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mWjXtlhzxJ0HumO9EQxiUCzJoLvCZ3auqmtfLpgoNWU=;
        b=LuKarw7uq4yApcm+ZLbPvOG1948Wm0lXAsPtJ7OMni9a5wBdC78hHK5/IvYoqWkzYR
         jMCAmMsyejsg1w4yXrbvlLDyrYkb2Tfx5Z3y7BMoWzMsOSxUwtFkPRJx9R5NsgrB6ryR
         oGWFLu69n22i3WIeBp8t42JvrSckebYj7g6Y5Ci3uPNUqA4FkLvywslEOvtrKX7RkZcb
         HR7e90EdxBS8XqABI41EhsNGcDQsdrbiyr4NBgrV5b4Sk94SWvHOk7tgMZMkVRQrbhW3
         zY7HQqUH1vrBsxJZY0Sbb4di29jarZDiwQvcNvRu2CUEwFLE5IDVcc3xQA7Cfg+7zvjt
         fBsA==
X-Gm-Message-State: AOJu0Yxi6nuDld3btEYTaylOfZ6j73CxqYGSjD8OATyXvzSE0l7to0rd
	SEFTnY26D4A1E3RBUN1c0FWqNFoT84yxUBcPUhUn1xKq1P9/vP8hOdXhTgvzdTEKGxbLPtSqyux
	HLq+T2tO0lPUG8gLLeXneBpVzASKesouwlh/yvg==
X-Google-Smtp-Source: AGHT+IFXp7NCE5mHliI2s6UcPGOQOOnMnagfJsrWiYKpFAZOLGMz3u/gyVvCJTLQGIRgnARNlVJtzQilk+9uP9DVKEI=
X-Received: by 2002:a05:6830:10c7:b0:6e1:eb2:aef7 with SMTP id
 z7-20020a05683010c700b006e10eb2aef7mr1371438oto.10.1706395402752; Sat, 27 Jan
 2024 14:43:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231225082305.12343-1-quic_aiquny@quicinc.com>
In-Reply-To: <20231225082305.12343-1-quic_aiquny@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 27 Jan 2024 23:43:12 +0100
Message-ID: <CACRpkdYM5=55m2ywC981VXVzbCg64Opbh4yEw2TLja998cES-w@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: Add lock to ensure the state atomization
To: Maria Yu <quic_aiquny@quicinc.com>
Cc: andersson@kernel.org, kernel@quicinc.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Maria,

I wanted to apply this v3 patch, but I can't figure out what it is based on?

Could you rebase the patch on v6.8-rc1 and resend?

Yours,
Linus Walleij

