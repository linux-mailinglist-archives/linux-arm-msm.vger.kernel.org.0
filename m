Return-Path: <linux-arm-msm+bounces-41117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AE69E997B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 15:54:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52A1B1883B23
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 14:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 248081B425E;
	Mon,  9 Dec 2024 14:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vWxH0/h+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3911B424D
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 14:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733756061; cv=none; b=VMOiccd3ByFkYoTa7s3vJmIYB4aUtrtpaeBxkC4qAgtX4BCPbHBxe/kLji3VJ+2QGpLJxyp4kShp9V/q2pEfbsuvXR0ejCh20+qv+ReuNWff0nTOz2aoiFD+JMNwB+CxxQ6/TwG3tMAPSzl+1aFDfAGjW9QsoGXQAyrt+b9tpOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733756061; c=relaxed/simple;
	bh=L3uPqYvqbgHQKbRYysjnG8NJRJoMHAJpo1X5a/nsGbw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jmoOV05ydsBvRVJtSDZ6Z8FwFPCJNLmoq+ZTpVMy5DEkF6ea5J8PFMxgscn55apOevZJUeH53r+60kRleaWkr5tOgR8WvIKAxjSAMGbE3U6sPAYXAU3U1Ivd38NgXXuthuTxQWKW6VRwOs6aviRg7D6sjXRY7ihGkaSwPfKvZ5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vWxH0/h+; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5401c68b89eso1279397e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 06:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733756057; x=1734360857; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3uPqYvqbgHQKbRYysjnG8NJRJoMHAJpo1X5a/nsGbw=;
        b=vWxH0/h+qrNQJBz4YdxyKiuKZte7A0qFI+1Js97zehJPYd4oKZoCWjMGIfJ6gB1PnF
         n/jDM81eeDWT6XzeGAIEWi2dOef+8L6VnveKxrtK2FB8SG9ATFLuAlquW3Et5+e54cEY
         1d6rAvEzT/EJrSAwrhAu6qgv0Ah5bDw4cwW0PQvqI/TTbdHUJ/vGOyzE2mjjXDUeUgp0
         L3TpyaZpz22PvnnnZHDgjTsAmgTulnKC7RygtmKnD0XJd/jMbg+abLJNridYhbONFOTZ
         qLFRUUp7xtIJBAjKrUTy2TIuPB1g5zj6HON2vKgZmQY73hENXpk9K4wdJHa24lSMFXMS
         lqUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733756057; x=1734360857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L3uPqYvqbgHQKbRYysjnG8NJRJoMHAJpo1X5a/nsGbw=;
        b=J65szbkdSHEZYPM40Yg0/gJLIKCloGzCVO4C3fEMjUCWEj4z/g+JO4UYlG2T3BufuH
         helexueX0zqPlzVW344yxZdczXkChwvh7eO82xrgHGABalo9zBehn5CDb8VIA4CDIQ77
         1RonH8Ob1xLX7iatP8m00CHEhYu3J7zX315PQbyCAObSDuWFzWxYi1BSS3JI02XGrt09
         3zGyz+COYu6tpek11ryPo9OEBF7Z7ANQhJw9fLeOHrpppZctp5QruaLs5KIcMAnvdB5A
         Iquiif6Rg9YfJJDxArrMkJl6IkIzfQdq5MTeQYkv2yylH4oRQ6sfLb6tPqvJ2t5bQnSF
         1Lng==
X-Forwarded-Encrypted: i=1; AJvYcCX9K0pYL83Eqj7oWIf/aMz5Vqc+0dBb7cJC1HeiEBdPlnq6j1G6PprSNQqpb91PfJ9ZFnH250MFBB8tIvTm@vger.kernel.org
X-Gm-Message-State: AOJu0YygG0e5h+NOdmInnjpGtB4LiIiCYrJ5COAUrtzx9MbAKgsLJNMj
	xosaOV314i5O1ioUB9VxV9KyPxKDeexP4zNxksX/NaYgPgx2Q9Zb590ooG8zEObgLk7Z9YuB9wI
	ojxT/Vm4Leng+olcDI98+JjhxEAS0Lur/BYUWWw==
X-Gm-Gg: ASbGncvRrvomUz3VbeTA5Wdm8rSbiE4eBaRHYUcwgIfOdnTEYXFYx56iRzWbqYm/Xx6
	MUTxUCxxws5S3V7O8EJ1JVg3/qWKPbKp3ef9LbsTgxvqoLiVO/1+AQOuDAvM8lqk=
X-Google-Smtp-Source: AGHT+IEznO0uqtPL1COzvxGwq+VZpn4uiLON1EYzg8NJIKAdwzxMATkws3UccavvSGGamvwnW6zKLVEwbVjxpooMKJo=
X-Received: by 2002:a05:6512:6d2:b0:53e:16eb:d845 with SMTP id
 2adb3069b0e04-53e2b7328d9mr4535052e87.18.1733756057474; Mon, 09 Dec 2024
 06:54:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241209103455.9675-1-quic_janathot@quicinc.com> <20241209103455.9675-2-quic_janathot@quicinc.com>
In-Reply-To: <20241209103455.9675-2-quic_janathot@quicinc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 9 Dec 2024 15:54:06 +0100
Message-ID: <CAMRc=MeA7vFiWFN6RExmiBFhrcRwfVdz07YdQJ=c0trTbeztNQ@mail.gmail.com>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2NSAxLzRdIHJlZ3VsYXRvcjrCt2R0LWJpbmRpbmdzOsK3cWNvbSxxYw==?=
	=?UTF-8?B?YTYzOTAtcG11OsK3ZG9jdW1lbnQgd2NuNjc1MC1wbXU=?=
To: Janaki Ramaiah Thota <quic_janathot@quicinc.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, quic_mohamull@quicinc.com, 
	quic_hbandi@quicinc.com, quic_anubhavg@quicinc.com, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 9, 2024 at 11:35=E2=80=AFAM Janaki Ramaiah Thota
<quic_janathot@quicinc.com> wrote:
>
> Add description of the PMU node for the WCN6750B module.
>
> Signed-off-by: Janaki Ramaiah Thota <quic_janathot@quicinc.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

