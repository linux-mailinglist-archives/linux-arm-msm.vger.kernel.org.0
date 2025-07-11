Return-Path: <linux-arm-msm+bounces-64502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7012DB01534
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 09:52:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C4481C40B9E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 07:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEBA01F4621;
	Fri, 11 Jul 2025 07:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pRS+m+lz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FAB1C5F2C
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 07:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752220339; cv=none; b=MrVfjtFmT87Ty7qZg6JRbNZ6QRRcrUrn9GxYuLQsj8R0vAjkH3n+T4qRS04CmfPaQxkynFmOawZ+wqMWQXkRg/aBtIBOswNs7dDfjPuVNl5ZFvPzrWonnG+2vxhhPDRMCnIXCBBnEjR8w2p8nVwkjbDjOxzveDqe9zDHFBN3dV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752220339; c=relaxed/simple;
	bh=xDu1IZi1PzBpLxza0uHTENLwHCwBlGpxlSAJZg1vPeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QH7RvnPyB1r3whDbCcy/lBfJ4ACf4JmQNZroG3GPqqIYX8A5BrRX5j77whSPugLXzzgh3XsN6nZZ6kVVt9Tulgil6b9nKmSgigN5GD0tuOsNruN9H7sbmfJbagvh2kglNyBpEmxpl+yZbfFyp2DhD372r3pP+lV/z5M8SGVWbjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pRS+m+lz; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-553b584ac96so1782959e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 00:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752220335; x=1752825135; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xDu1IZi1PzBpLxza0uHTENLwHCwBlGpxlSAJZg1vPeY=;
        b=pRS+m+lz1XXwhkC2sb+1iRSJtGIA0MSXHi4eEeSEI0U4Kz9IXPuGhHWhW2koGQc2fF
         i0LDdSx7IibeIsJNjwB8jgKawJwqQ2IHp+f9xw5/hWP4Ry/8UeQVa5k44enHQaqGksUE
         q5ucEk6admC9zsDsdfsdbtTNavIqtX2LzxB+a6VCtqCKQcoV9qSUUm2QmOqiy1NzlSvN
         vU+dsKQ87dHDeO0Q8C/LUaDr7l7zFJDLJN1gD172/ZGcW0dkdXurJTq33A2BhjFzw+ER
         Rp7jUnOSDG0sPAIX+JQ02PKwVvIuJcx4Dsl4m2NaOf25uZd9aGqhaPzAc/oVRDBDCluX
         jqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752220335; x=1752825135;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xDu1IZi1PzBpLxza0uHTENLwHCwBlGpxlSAJZg1vPeY=;
        b=J1ZFoI9jI+/sY9S6nRhPZV9atFj2OeNLExsldy1eoZjNpaQak3/RM0jGIc4BTGglDt
         PCvihK+ooZiqqr3BX0AA1iefvkbz+0NMxlxgzv2jdwQ8ZmQJYKDi68NNtrQ8jZJqAtZR
         jCQSBiFHvBHVIBSlJRLMYnGqGCN8Ph9tSXSvuamFgvfKIqi/FECLmySRcAfjeqZpZp5x
         8ADU3I7x1HJ4xRGo3+uHPLc4Y5ADs4DntTjyN3Wfva6ZLfGZ5jAXZat49IwX0GeTDv7z
         GyQEZBwEZah8ZjABTYDVlSjy4mDH9vUkmBgv1iFcrVZo7lt6vE35D9w1YmhNhx0yhCm+
         zkVw==
X-Gm-Message-State: AOJu0YyZfoLbfROggnrGhsQquoCVU0OGK9O+2qD1WjminkkPGQVn0qfL
	b7c27qDxGOLN5HWXWHVLaxacjw5Vf+L4aCYO+g4r1hdR6cFEnvoP+WEX9kSYqoMn7PUDH8IzH+H
	jVN+ecXdzyB4SCv3OOc56atYbPib3TrGBQAMKon3oJQ==
X-Gm-Gg: ASbGncsN92Q7WUKByohsFDKDFjSQoTIpm2iXbZJAV13Qy8Oe2/++HrzD6kPgEqYrls5
	vVp7oQPAMdBrl1SkacqKZERf4bx0SIowCVvjL5YEPb/Ni5ZWlA2wH0nOSaZfNJI6bAu5Escu6rG
	SONn5nQ7W3cwRX6lP9b20lU9MIv9FgfesBeoHbE8FU4xki+v0/FJH9DCmLhFbfU6Ox6cmnN4NZV
	in3ZHG7ga49mBv7ASz7RZh4pekUj5VR/Wr+CA==
X-Google-Smtp-Source: AGHT+IH60ogAfWfbJH3MFwcCvSxOgE0SFBGta4jItgpzjkt70aoyDG8O9/ooBirBJu6L+sORksZUc1FbM71/UwsNZhI=
X-Received: by 2002:a05:6512:3b86:b0:553:2868:635c with SMTP id
 2adb3069b0e04-55a058c3d08mr446259e87.48.1752220335245; Fri, 11 Jul 2025
 00:52:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630-qcom-scm-race-v2-0-fa3851c98611@linaro.org>
In-Reply-To: <20250630-qcom-scm-race-v2-0-fa3851c98611@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 11 Jul 2025 09:52:04 +0200
X-Gm-Features: Ac12FXxQS_ND9R3kc1-JnsO_0EIP7wD7vwZ2iNngV6aFbY7iD-1PGe6GfTZujA0
Message-ID: <CAMRc=MepAV4iHvGbBKmrq1NevC9OBZ1z=JBP-AQWhJzZusK02w@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] firmware: qcom: scm: fix potential race condition
 with tzmem
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Johan Hovold <johan+linaro@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 2:12=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> There's a race condition between the SCM call API consumers and the TZMem
> initialization in the SCM firmware driver. The internal __scm pointer is
> assigned - marking SCM as ready for accepting calls - before the tzmem
> memory pool is fully initialized. While the race is unlikely to be hit
> thanks to the SCM driver being initialized early, it still must be
> addressed.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

We're late into rc5 so gentle ping, any chance we could get this
queued for v6.17?

Bartosz

