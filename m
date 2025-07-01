Return-Path: <linux-arm-msm+bounces-63243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49443AEFF21
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 18:11:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D8FF3AD0A4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 16:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 385FC27A918;
	Tue,  1 Jul 2025 16:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MhYX+q9n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5181E8338
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 16:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751386170; cv=none; b=DtrQa708gSfcqkiIZS635di8DRfKRZj2JpQf1gAic1waNZdX5LN92M8Sxp+nf/fC2rw1Go6yvo4WBKcTigKHsO4XnziVFDTIaq+BthFvnWwAHmZq0S5R4L2FkCk3YwbhS74Axr8rWV9lJ897v77cNAR9lNvjRgNueJcDAzrKVmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751386170; c=relaxed/simple;
	bh=K+T3bxWVYyQAHRzTQeHYUtnchpuJpUJu3cF0vJ5GJo8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=joT0Yz0rRlK6nBJfuGUzsMjeUE+AJpnUwiVodNQzcoiHuBT3ohy+jr/uLR4ZESvJ7Rn5xqFXNc81onIm9eG5NU72gXZ87wr7Walfkuyr/dOJjGOwmvCbY4bZ6jL+gxj9jXGohzTmuKj2UdiUkcni2AkVTECrqzYR63dkD0/xxXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MhYX+q9n; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-451d54214adso41544665e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 09:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751386167; x=1751990967; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K+T3bxWVYyQAHRzTQeHYUtnchpuJpUJu3cF0vJ5GJo8=;
        b=MhYX+q9np+J49Jz5gXvsgQvnVqbBR77ivy0Bz9ZerHvjDw0M2fB3S4TzhCc0hwXUNR
         MFgCf6ehHYFyN2ryJOGP2TpdAeoTMSbjEtVuiTlj3ftvfsJJ3o5E0A2tkrK4Vd2bHf+x
         Z8X17WX+QBC/piMrfIbmrCOmhVtHAceF5NQKvv2Bwqw6CBczVlaGLHx29XFB2XOk5YyP
         PLZkjAsKcWXczrXia4K/BzrVRoX3kKGARQoiEgkzof1JVOX9sPtZRxZy1Yvcyg+DzwVv
         UzVSDmrzsRmEPjcb+w4Cbdzle0IYOcbBNhfzhGc34Z1/eFscSRvvafdqeIfXHKVS+4nJ
         3dsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751386167; x=1751990967;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K+T3bxWVYyQAHRzTQeHYUtnchpuJpUJu3cF0vJ5GJo8=;
        b=TPhPq2SqvRPmb1Zbk0cZJOyM7j4Wka3fhg1nHy0l1a0jIoMSdLs9Kmjx7BPCJ16Tm9
         Le1K5i60Qtm6RW/QMSoavMKTEL6qty7CnSlNWvcj9ZOs2WWSOjzZRzU7uCXw1YvfXdPv
         HXJFlPgPMp+QOYFJ2ea3AQPCtdCAA3YmZ/+jp/JWppqqPu6aE7Io3ufxOY3RMs68NeLj
         vfljVQqBDGZTm43GVuoD0uk21sSQ7XhJc1oILF8xRgKXyFD9FqtLDdsFRrvy8CPjflez
         xmocW0hgl+nN4m1QIds8IMNoTzpaKaKLiD0TF3aUWSiOgEJ/a1WfYa6hmNEV6Xvfvfjy
         4k8Q==
X-Gm-Message-State: AOJu0Yw0RKEHzbS/d3rI0r7MvujzQbIrLFw0Qox66jwIz9Kw7OUCyhy1
	sUQM0qcUn4jhbQPqwvblYsoLsz0aYNQVeZPdhY28k7tmoX81hi+1KiBbtuh4Q+wD5hY=
X-Gm-Gg: ASbGncvnAglbK61mX17lALQnQ+/0hSlKl1fXRvg6NCaTuMiKOLanbeDIex10rC0jLmf
	71Fy+sSZKsMDVtvyav2XQlPRf4y8BCqQDw/C/p0akltVUNLza4OtRb5JOhXThfbI9RBDozWKn6x
	V5jyc3I//VQdfgvVXeM6OwiQXLAUXkqW1TifyREXbU/8n2R0LDU0gkjoUQjY/TtCyQwvHFqVy7K
	guDJUJlq11TqOyMeaJcxbV6808F5sT4SsLULm79DeURkwwpuu11Xf0xu+1pt0MmrCjKN4NXcxli
	a00R+rO4EmlWic0fVHcko05AE0lUvT79gcYR5+ShOU8mllI/Ln5v9YFo1pTe9B9JxaBr
X-Google-Smtp-Source: AGHT+IHvqdlgw5S2/7qbCQGfsKVz3OrH4Z2eUt1+67soqrLzTtti+1/X6TECdPtw6LHSo1pw9uflxg==
X-Received: by 2002:a05:600c:4e09:b0:450:c210:a01b with SMTP id 5b1f17b1804b1-4538eeb8e0amr212563805e9.17.1751386166493;
        Tue, 01 Jul 2025 09:09:26 -0700 (PDT)
Received: from localhost ([2a02:c7c:7213:c700:4dad:b69a:9c81:2e57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e62211sm13761854f8f.99.2025.07.01.09.09.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 09:09:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Jul 2025 17:09:25 +0100
Message-Id: <DB0UKX1N7VZ5.VYBEG94Q6Z5I@linaro.org>
Cc: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Bartosz Golaszewski"
 <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: qrb2210-rb1: fix GPIO lookup
 flags for i2c SDA and SCL
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.20.0
References: <20250701-qcom-gpio-lookup-open-drain-v1-0-9678c4352f11@linaro.org> <20250701-qcom-gpio-lookup-open-drain-v1-1-9678c4352f11@linaro.org>
In-Reply-To: <20250701-qcom-gpio-lookup-open-drain-v1-1-9678c4352f11@linaro.org>

On Tue Jul 1, 2025 at 10:01 AM BST, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The I2C GPIO bus driver enforces the SDA and SCL pins as open-drain
> outputs but the lookup flags in the DTS don't reflect that triggering
> warnings from GPIO core. Add the appropriate flags.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This works on RB1, thank you!

Tested-by: Alexey Klimov <alexey.klimov@linaro.org>

This also should be:
Reported-by: Alexey Klimov <alexey.klimov@linaro.org>
hence Cc list is not full.

Best regards,
Alexey


