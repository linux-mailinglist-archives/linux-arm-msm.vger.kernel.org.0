Return-Path: <linux-arm-msm+bounces-26259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF96931EBD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 04:18:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99C79281A0C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 02:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CDF81078B;
	Tue, 16 Jul 2024 02:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="WZTrapg3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AED101CA
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 02:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721096335; cv=none; b=JjwW6Mr2z40wJIYzbBZb9QHRprTqiYrky5swY0+slNuP9kr5mFtzocd6xVGPPD0nsmdKz3qALy7CpgdAm5kEx4LftlpGwCP3eBxYY76F0ANBiSvxOV3EKezpvhbG180Gdf1c8iGBixfmJIXGBjvJe++OYZKrHYCAhFN2uvEPp/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721096335; c=relaxed/simple;
	bh=pyKsuwqVIboN9EwThCz5EI7HZB3JIVS86qz5vkpAtLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K038sa4vEARrnNnqc3cBIRleGie/QBf1IvQ3GqMbGBxnxDhq2k92A5k30d+byjyvCabathSL0cZd9+4fyaHOeKG77XKjFLLHMPD1PNkndvfe9PnQxgz31fjvDpO4sp3Jn1sjyLN77vfvkWNpwXp3THoJWDbHbyuBoEXa879elc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=WZTrapg3; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52ea2f58448so6630074e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 19:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1721096332; x=1721701132; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c+l4WKIaaq5577Hbze0C2fWBRy2R2qvbUGhdaCCzWQY=;
        b=WZTrapg34Dbp03FU43bq4kj6Hx51l/zqXX0MqKNRp+56sBM8tI86sPnvKraGXehBLQ
         D+XqCv6PKvqYPzff/SEPWzrXFlwm4OXso3TlSF4NbFYATJN5hgPOFfCSYFJ0go8U76Nj
         ZWlnu+JvimAQywFcBRc5ijuGaPNKgpQ+vPRcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721096332; x=1721701132;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c+l4WKIaaq5577Hbze0C2fWBRy2R2qvbUGhdaCCzWQY=;
        b=O31Gh6Ugqkdu0icqerAQPz0HHLDn0x0J5vooK04GubhJbphiQJmsdRBZY9/OdQXbtK
         igzm5HYU7Go3GcdZAw0z3Nj7yNWSC5VXUp0xYtVHB9JHR9l/4xHl3A/ET/LTx8dGmGnG
         ILUNoZU8Vp0daQAwLqXKzGVn5xNm0bc8LNhj5ZSWZaqTistkSH/QfEPsftsIJjTTt1as
         z5FUKAS/KBuh5JOoti6KlaOHT1hswC84Qz7OBGbhmcV7fGvuzSQwLIDIsg63JAat1vuJ
         rEU7kGQzMbj6mwYO1p+xpWXRNEmu6/C7EUdCnjfr0ZaKENJaTNO6MYXryaRg240Ybz1z
         aUyg==
X-Forwarded-Encrypted: i=1; AJvYcCUiWwhk+rqNyK+LTItMhpwzhtHu56a/wesQKYui2UFURGMOxkdL9FfkF7xY0d/7iKI0QP5t6oR+YJcHicVZiowdK2AA6P0+uAW5BWxEWw==
X-Gm-Message-State: AOJu0Yy/3TOVmJlQkvVhzzMbxwhJH7zGjmc5MAc2mULAcAX/XskO+G6/
	YtRl5hqMsE+EDf/yogcNtWtMH5Iz9d/rRFrYnySYm9HQfuhsHxKkzru7+wta6Ou/OLCNRWAheUA
	rM+g=
X-Google-Smtp-Source: AGHT+IFkkbuvvNmleS6i9F9sqIJftJe3ku2RebznxJ8l+RoJru0xpkPqm6UzK4t5G/aXsmnCzNWQKQ==
X-Received: by 2002:a05:6512:3b83:b0:52c:836c:9ce8 with SMTP id 2adb3069b0e04-52edef0eb2cmr423283e87.4.1721096331643;
        Mon, 15 Jul 2024 19:18:51 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ed2532732sm1015493e87.220.2024.07.15.19.18.51
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jul 2024 19:18:51 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52ea2f58448so6630052e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 19:18:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUTMHGY2md3WwXOedgX1byRC02idtWZnAgtrZcBluMZjKO/lxz/yh60h86c/4PnWhPFWhn9Kl/2XaSQ6NUzW35s9pAKTtyGbca45wUQkw==
X-Received: by 2002:a05:6512:280d:b0:52e:9905:eb98 with SMTP id
 2adb3069b0e04-52edf018688mr350932e87.35.1721096330887; Mon, 15 Jul 2024
 19:18:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240712091008.14815-1-brgl@bgdev.pl> <CAHk-=wjWc5dzcj2O1tEgNHY1rnQW63JwtuZi_vAZPqy6wqpoUQ@mail.gmail.com>
In-Reply-To: <CAHk-=wjWc5dzcj2O1tEgNHY1rnQW63JwtuZi_vAZPqy6wqpoUQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 15 Jul 2024 19:18:34 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgiVHdEX5i5kuNLewy9OUvYaWX_DYiRmOS1Fcj1pJ+QPQ@mail.gmail.com>
Message-ID: <CAHk-=wgiVHdEX5i5kuNLewy9OUvYaWX_DYiRmOS1Fcj1pJ+QPQ@mail.gmail.com>
Subject: Re: [GIT PULL] power sequencing updates for v6.11-rc1
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jul 2024 at 19:17, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> But asking *twice* is definitely not kosher.

.. and obviously it's only "twice" right now.

If every driver continues this pattern, we'll have "n+1" questions.

        Linus

