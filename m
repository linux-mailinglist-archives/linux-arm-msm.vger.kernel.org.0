Return-Path: <linux-arm-msm+bounces-45266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE23A138F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 12:30:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACCA7165D8F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 11:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF3CE1DE3C0;
	Thu, 16 Jan 2025 11:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S5PRRw1E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F360E1990C7
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 11:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737027048; cv=none; b=trmcksY09US91S4WCrk62EHR39KsTH3iSzzDERhtiBDUmKsJhZ8XbleO/FQlcfTN/NFmOeoSR+EIN5wSvVpi2a3AotDfZSMIW6dpjQMKC5FnSb3V0gbZHmg8T5B1A152R6EQJmisPETq1MiOoU0UGrlhSt4Bll9W+9fRKkt/PlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737027048; c=relaxed/simple;
	bh=kzDN9dmdAK48wXWx0awduq7CrBP6vYP35O8PwR+e9qk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=U4ypsAIFb7TH8segbQEjZbazCnW/1lZb6PNCg4Q8J3vQ7h4dRxWoiHjFj6T6d7N3zkMjWjOwr87W1dzuDcVZlzAQdGa+GDFI8Q5axnpD1wklMHkbRyQhdTc0m8KqHJ502z5AQeNuWBJbpUGD7bl0+VOEMBHhrGV4iSr2FKOC3HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S5PRRw1E; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-385e06af753so435070f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 03:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737027045; x=1737631845; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kzDN9dmdAK48wXWx0awduq7CrBP6vYP35O8PwR+e9qk=;
        b=S5PRRw1En8G+21KOJC9ZD6IqUHXgz4xQLsvIBxr/XWZPdIgRHRo/eicNlgEHSbm1kb
         1GSs0FuwZkJWhSTbI8sRnjw4lqGhGVOHWmzZ0yxkZ199QjpJ48qSkyfwlh0J7t2cDH16
         5O+UvF7PGwbTxzl8xtZQjUu2yIhdNvIjWZaX7uFfOqe4w24yiEAkdt1+OoG+UHZ0ii6u
         4l9rBpEwm0MJgnEvnBvLGqAb2KXZ1W7WasebdcT1tz8uneIWS4mZcpNqQUbB3A6WCvIU
         VaO0n04kdHOCGitjn0dYqnYnHbSiJdKfZFG5DzRhNNd9oYOuRAVQuWsx2j0NfW/la/bm
         m4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737027045; x=1737631845;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kzDN9dmdAK48wXWx0awduq7CrBP6vYP35O8PwR+e9qk=;
        b=S/pkiytsp8r+tJEmilZSe/IaG27EJiMg7qldXi6mJxjfF3rtpOMbFfxWmQwn85ipj4
         n01q5uB2ZX9tLDeL112aODNmSAegbh+y6JJ6Zl7oTAdmgBMiGV7hDJjZS3sFrz3BcBho
         SoYwqQeiSkhmYdQueOUCNgjifIEsM45AlWupr9XWgdSM0J+DprOCIbvyDjx8WL44dXpG
         p9eIssl1/y46Rl2Zr8nGOpS3KODMSht82AXoZs6U+JnN0j0P/TFZQKKBzGZA5J+pwwrb
         GP5txTo68bhjMWN46VYPgGjJet+dn7jmx/zRBsAUCPyZ1kkFFghUSaQZrx6vcCMQwmy6
         mf/A==
X-Forwarded-Encrypted: i=1; AJvYcCUmjy+je07l/CPByGITn3r5XHKPVdk+DAWZFd5X97SU4ro3239AgIBZoXd54RGbEUrtBwITwWWHFwNfN+Rl@vger.kernel.org
X-Gm-Message-State: AOJu0YyiLy/F2obHrMW7Hcg3qlbtyE0TsdDp6v8M8ZZDaZd/YuUID4Yg
	++WQFYMg1nY5910oTbBOvBUL2KThEluh+DbzH+FI6vbolqN74rP8HJbzlPKqffU=
X-Gm-Gg: ASbGncvhPHEkC4I8Tl6015pEsW7D0yGQV0/+OJ6FXcjZwDZOpfyP19izqaGGHlralz+
	3LUCstGQjfcN+3UI5Ri3JjV0IccVlqgNjc4WIgFVme3IKwA36HFOkLbGb3/m5P+DuIOI+JDzmYG
	SEXgMaJlYS5Kyk7nJCpnxEp+IUf178Y4NPQqUslMDiGObPNoawC7yAqmDbX2w5x92AQJMinbXfj
	MPFyFVhGCR2N5V5SEkjRMHohr0dsbtdq7XRA0TDBdzTezoBLKoCa9bRk28FDA==
X-Google-Smtp-Source: AGHT+IGsW7R8SXZiI21rLVry2LB3/IZkmamq2Z2hj3KPYHeT5ENtm5n56n32F1wCYQ4Tz4sR0OmrNQ==
X-Received: by 2002:a5d:648b:0:b0:386:3e3c:ef1 with SMTP id ffacd0b85a97d-38a87312f36mr34852486f8f.35.1737027045345;
        Thu, 16 Jan 2025 03:30:45 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74ac707sm55516355e9.15.2025.01.16.03.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 03:30:44 -0800 (PST)
Message-ID: <941c7920a7d07496222e6e93cb338ca6df38dc33.camel@linaro.org>
Subject: Re: [PATCH v3] scsi: ufs: fix use-after free in init error and
 remove paths
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman
 <avri.altman@wdc.com>,  Bart Van Assche <bvanassche@acm.org>, "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Peter Griffin <peter.griffin@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>,  Mike Snitzer <snitzer@redhat.com>,
 Jens Axboe <axboe@kernel.dk>, Ulf Hansson <ulf.hansson@linaro.org>,  Eric
 Biggers <ebiggers@google.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker
 <willmcvicker@google.com>, kernel-team@android.com,
 linux-scsi@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org,  stable@vger.kernel.org
Date: Thu, 16 Jan 2025 11:30:43 +0000
In-Reply-To: <20250116-ufshcd-fix-v3-1-6a83004ea85c@linaro.org>
References: <20250116-ufshcd-fix-v3-1-6a83004ea85c@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-01-16 at 11:18 +0000, Andr=C3=A9 Draszik wrote:
> Changes in v2:
> - completely new approach using devres action for Scsi_host cleanup, to
> =C2=A0 ensure ordering

Just repeating this again due to updated recipients list:

This new approach now means that Scsi_host cleanup (scsi_host_put)
happens after ufshcd's hba->dev cleanup and I am not sure if this
approach has wider implications (in particular if there is any
underlying assumption or requirement for the Scsi_host device to
clean up before the ufshcd device).

Simple testing using a few iteration of manual module bind/unbind
worked, as did the error handling / cleanup during init. But I'm
not sure if that is sufficient testing for the changed release
ordering.

Cheers,
Andre'


