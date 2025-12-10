Return-Path: <linux-arm-msm+bounces-84907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 57442CB31C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 15:11:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6135F310BA91
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 14:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2249978F4A;
	Wed, 10 Dec 2025 14:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d11e3VS+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B57F1B423B
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 14:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765375614; cv=none; b=X4IshnpxRuBpxvgmDi+UFuRiKwmkMftU5pJThK+iqZ1lPhc+qdFMbc5bdlDNp++eDqrEQgoeXJqGfu7k1+tQXGboqwZPWckPCsGwBRSrEt4kmizrioHrsBmzog//0vz5cSY7TfqNkwZQMJLoPdahKYv8jywPJY3m10PZhlRQwv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765375614; c=relaxed/simple;
	bh=9e/kA6oIOyhPzKZ7ArQO0A4zv907CzD/WHILb6v+0H4=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=fkHwbGMv1K91gomLdPLwbn4PJ2z8pC1UHqcJJD/GWJNVIxmfITXnU3SjJrqq4IQrYVf3irmX2ckV35ThXbLBDEj3fYy4LVVwDLl7WGw/dhxWEK7EIKCESBVZ3xfxSyGvfWIgaqTTK6+Wn1Mq3YxKfKdlizt7K0zc0tx3+/tLuHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d11e3VS+; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4775ae77516so83639465e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 06:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765375610; x=1765980410; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9e/kA6oIOyhPzKZ7ArQO0A4zv907CzD/WHILb6v+0H4=;
        b=d11e3VS+FuWCQmjJv/8VQ8uuTBLoF5smnVZA//5pGzIjMGoj/uzPgMncQWXgYdB9fA
         oOkeKNttBAO6qqgP+JzypXmYk16GJeiYNPCBramlfrI7YMnAzK+Thr7D1DsjKndJ90bJ
         oH+v7zC68EIwhVEM/Xc65r9ZdeLH3Quc4q1bl4hSjy9sTPtauL0gC0bF2BoUx44pMIwa
         0vms6K//kwSY8Ln9eRn82u6MWhhP51Sx3COSx5Ht/AL3ARsdsJGqjoHRcrHLvHXuSi/k
         08wNF2gf+azIacw+tWzB4wMTxgl9jSTRwX+1y6s+7Z/ZlQ3JujtvovkWrleF8h3depy0
         lnmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765375610; x=1765980410;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9e/kA6oIOyhPzKZ7ArQO0A4zv907CzD/WHILb6v+0H4=;
        b=KxQ+wiI3Wg+7BxMA4fvitpGynE3QQsxVTRZU7O+9qwgHG0XsRDseK/lR0QlW0ZdlCW
         ulq7wJNSEjbycJ+5dezOUaUe+t1vaSQROEnagab+yacOPf952xOfv/27T5lnU1f6NV/N
         n/kOHQqc/1KINYDdPJSCDRmrgspyXL2VJgQQuvm7WxS/vaIhhlY/VZENzcPZK32wQ6fj
         cxIkZBjCi4HGGtrx3bEhkmL6nrKltapnHiiq3zCPjaUnVxT5jKsnTWwhDIyiKqIBuRsA
         4xT0tYPAToE4c7MntySwtLP31gPHpgpHMIUmlZmtf0umHib5NYKfOAvee6lpOC/osSLo
         AM3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWYN0pwr+XxIi21paxf9Ezxtw3ZQYrpVQUsyFYOl8YNO2uve0w2RC5V81DzeryeVZFKyUuIYjyi+sR7JoIe@vger.kernel.org
X-Gm-Message-State: AOJu0YzRTIlYceqwh6CXQq5m4A1FwJHXyA1YzKZGuHvMX5vafSa2NTk7
	5OtqB9R2LIFR8x8zvGG7m+l9oeNCy1Lz/8TtskB97MtXR8+V6NVaRtRpMYbxlYHHUKE=
X-Gm-Gg: ASbGncsBJNJcQdfDMqXsBcNCMmbhDoZxC3ZDxdJDxLsV9QikvamCmGYgZjt3fO4ZdOL
	WvsoYaAkfgyrv5iVPaJYFCXsAiW6coBFPTYUSaObuBGUzXB0Pw5G1uzQEhOf+/hQP4zZTh6sv2m
	f+EQaI4V1lCxIpqLuDOx026pZ+9ha5WDiHy4Vtseq4dN4/xuK4FcY3kno9l1rhXI8YoXkZHHMP1
	NaE4v3iEO1qCHYxwwPKyfWlxdyi2o2R8hzCGG1jwqYrf/irqoIUV7AcRfGW6nq7F1Xn0nQRPz2L
	lKBVotFZfvsLHrkPQZjlpWT/ZeuHw+t42gCpXR39dWSQp8j4WPjz8rQjaZQGaZ6zcMhAS/A2ad+
	xVD5BsADCj5jkFYu6bfIo18t193lzc9ReiOvpOx9eITT+hjM+h3AzKQ2jS6XVoVfmjfb/2FkOtS
	sKhVJ8qCgQlAAGSEwW
X-Google-Smtp-Source: AGHT+IGxMmlCENm65g/khz8an0IvkSqbfpyWL3jSQKULfpF/64kGTl6NlqmP7uQSZpTUXP2PqVLfcg==
X-Received: by 2002:a05:600c:a086:b0:477:5ad9:6df1 with SMTP id 5b1f17b1804b1-47a8374dd5bmr25998775e9.3.1765375610609;
        Wed, 10 Dec 2025 06:06:50 -0800 (PST)
Received: from localhost ([2a02:c7c:5e34:8000:6c67:affc:583e:e754])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a82d20247sm44814375e9.5.2025.12.10.06.06.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Dec 2025 06:06:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Dec 2025 14:06:49 +0000
Message-Id: <DEULFB0XJ883.3CHFIXANX1FTH@linaro.org>
To: <david@ixit.cz>, "Srinivas Kandagatla" <srini@kernel.org>, "Liam
 Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>
Cc: <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <phone-devel@vger.kernel.org>, "Robert
 Oscilowski" <drgitx@gmail.com>, "Casey Connolly"
 <casey.connolly@linaro.org>
Subject: Re: [PATCH v3] ASoC: qcom: sdm845: set quaternary MI2S codec DAI to
 I2S format
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.20.0
References: <20251115-sdm845-quaternary-v3-1-c16bf19128ac@ixit.cz>
In-Reply-To: <20251115-sdm845-quaternary-v3-1-c16bf19128ac@ixit.cz>

On Sat Nov 15, 2025 at 6:43 PM GMT, David Heidelberg via B4 Relay wrote:
> From: Robert Oscilowski <drgitx@gmail.com>
>
> We configure the codec DAI format for primary and secondary but not the
> quaternery MI2S path. Add the missing configuration to enable speaker
> codecs on the quaternary MI2S like the MAX9827 found on the OnePlus 6.
>
> Signed-off-by: Robert Oscilowski <drgitx@gmail.com>
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Alexey Klimov <alexey.klimov@linaro.org>

Best regards,
Alexey


