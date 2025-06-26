Return-Path: <linux-arm-msm+bounces-62680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E44DCAEA23E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 17:18:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D23CE166DA4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 15:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FC7F2EB5C7;
	Thu, 26 Jun 2025 15:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QAWT5a6/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B3B220F33
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 15:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750950607; cv=none; b=Tm4xQoIb6XiT5Cyz3JLZjT9KerLBiTKhsPJbEW3CTaE4d+cCeYtOP59G7gQhiq6qyZQiNW53Iy/YVtA0n1VDF/iJbzVpjTPKLXB1aTAL42VLXScXw9NbeyV5hL+mM7a/he7bosK0hc0DDzMVJyZ7EzznHeAtZZdTFxXitEIndMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750950607; c=relaxed/simple;
	bh=0wFpFSNBlPSYKrWJWlVZXFjfkWtDUfucxIxKm4CrwNk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=FsMieb7YQZ5RC1lOz2YCtSNHWynsfb22jAM/BGBz/Sp3gT5LrluRsl6lsZr2HDD/Lh8Hnk0lCakx8YaJUrQm4z05aSjcjzTHn2M04We0auPpBTOCy+iRrhXVVTUJtihyzajEDe/05OF9dKZ42ZCS7fRIq5B7ch7ON1ljlix1N9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QAWT5a6/; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so1522001f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 08:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750950604; x=1751555404; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wFpFSNBlPSYKrWJWlVZXFjfkWtDUfucxIxKm4CrwNk=;
        b=QAWT5a6/igObVgigB92UjDAi1Wm16NbjH6ZtSH+ZwUCO5n8JGBcihq+FUXsiB0Xf+K
         PL1s/Ycv47QRN3cTrVLuAA8Or5jDHgO9s4jLpgdGZfu6qy9fNx0rlMjarp1CxMqQH1Rg
         gzEgAwMsvijx6M6PQLbS5ct35DKKEYPzZc3gdXmCnHE7KQtgQUvtdYKz7oNzUJ7g4ZPx
         yLR+OqWux70xjNdL8FTXAdF5jZ6f+R9zVH11q0vfCWz9VD2u0yIHFggcwImaLYwnKQO0
         EIrxcliyKQj3ovC3O0lpMzCNvTbc5Dep5M9uYejC5gLK5VRqNOh5j+MFWDp0LGxFnXuH
         WJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750950604; x=1751555404;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0wFpFSNBlPSYKrWJWlVZXFjfkWtDUfucxIxKm4CrwNk=;
        b=fEUv+2NT4RFkJ0XvPqKczpncPB2wZyVbM2HMPPJgiSZPipmljaBvSpHhB8gzApUAE1
         8ouq9utj1j7hVcowWSBCTJIzQiZLiBXz9UQ0QyGP7ATJFSGevXcsHeB2RbghYHxaa/cy
         bk8VJyyEKjbIg/7i485nuks6PqwUjD10MBrAWk28gOdXJZZxQalQDFAkzTlFWP/9JXZM
         7mh+CjtnOcG62U2LtViJvHDr22o8rIwIBNTSvlvoHnPKiu2uu19xY7ii3GkXdLVs9R0g
         ibGNP/h93SwXWVIuGzsQEpjORMg4P4tYkjR9ymgVEurQpfIc8/2U/42P7v6rEQlGzLP6
         fKMA==
X-Forwarded-Encrypted: i=1; AJvYcCUuZxzJ66DOiys60cl7dkiYfY+vG40WaE8M3amh6nbQhAZlNi2pS7gH9g95fCuWBXSjOzxFMdHuANuiFCyq@vger.kernel.org
X-Gm-Message-State: AOJu0YxiX/U2GuZjiEmERNmL0lmPRhmyyDzxrb1YE2bYgfKhJDKrfHqn
	GF+Kypd1XKP94JTYwqRJ28UHCYKFhMwCbVQErOMhfUAVO09TH8Wh5o5GJWKuTb7mCUE=
X-Gm-Gg: ASbGncusmu4jMTdHFXclE3ongwgyQNbrxnRmLzh8lEknyKK3evcws+pE7jQ2y7WWF0Y
	G6NvrEwKhZEtgSbJDNXtOk2JCb49HvjwMXe4VOx+JSj+1D+d5l7tRXioFTy+K+Uv/EMCcMVejT1
	1SJx61zblvfl8a9acmjJL7v0rMjvnAATVLAoMaT/LHVLjW0lpAUCRHw2xPPc0h0tps669yWJuyg
	xNzrLgRy2BO30TLM6Be4SkVxmxmIECaZ1kmcIJSzC56yukPQ4SqFntk91BY50uhHErOP0LGo/Cj
	RVWWlVltwI/GI6wahP5nBYtnKl0m2veNrJ9ZTMk6wzZuFoIF8mnrdra5wFxDAEJpo8I=
X-Google-Smtp-Source: AGHT+IHVOJ5MNC7ERblDoBGa73QVpPtUVJ5JmIUJbTGb7y/4g0eYkLl3QwmmIgJKkXreAEOr/ujfsA==
X-Received: by 2002:a05:6000:288e:b0:3a4:f7ae:77c9 with SMTP id ffacd0b85a97d-3a6f30ffaa0mr3613832f8f.5.1750950603610;
        Thu, 26 Jun 2025 08:10:03 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52af3sm134620f8f.50.2025.06.26.08.10.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 08:10:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Jun 2025 16:10:02 +0100
Message-Id: <DAWK6QA1G5A5.354ABXPS2F2HQ@linaro.org>
Cc: <linux-wireless@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [question, bug] regularly disconnecting wifi on RB1 and RB2
 boards, ath10
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Jeff Johnson" <jeff.johnson@oss.qualcomm.com>, <jjohnson@kernel.org>,
 <ath10k@lists.infradead.org>
X-Mailer: aerc 0.20.0
References: <DAWJQ2NIKY28.1XOG35E4A682G@linaro.org>
 <3f6c106f-cbd3-4f9a-8e7c-e43b51457bfb@oss.qualcomm.com>
In-Reply-To: <3f6c106f-cbd3-4f9a-8e7c-e43b51457bfb@oss.qualcomm.com>

On Thu Jun 26, 2025 at 4:02 PM BST, Jeff Johnson wrote:
> On 6/26/2025 7:48 AM, Alexey Klimov wrote:
> ...
>> Any hints on how to debug this? Any debug switches I can toggle to debug=
 this?
>> I am happy to provide more info or test changes/patches if any.
>
> https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath10k/debug.=
html

Thanks! Let me try.

BR,
Alexey

