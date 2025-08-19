Return-Path: <linux-arm-msm+bounces-69743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3895EB2C08D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 13:34:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FD02725916
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 11:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1CBE23D29A;
	Tue, 19 Aug 2025 11:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I9T4dDTq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2507A1990C7
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 11:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755603060; cv=none; b=l2J4Fs3pr3RfxgWILHaotGhJ2B1oeDlDQixAAacV9qBhTo5axDs0bTxA/mdSi9uc6psY7QfDcnq7V6MDnAJkiiVS2fYj7U3sVUKG3idVPHUv3/L93ErsKVHv25YxdsNsZ2bMfQ3p4koqx4OdUkDBmOzq1CLawdYvkiK4ng3uirM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755603060; c=relaxed/simple;
	bh=RS+DDBsenDMGRVRuo5OpJ0by6/pE8abc8eGvwv3Szfk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qb8FhIc7+Mje+d2jgGlbd34T+f3S28J/CwuhZe0RULk9qID4BFU/R0/RdwhVDKzFGxzWkJ7Y2OEbX79Oqt+nuTZNNCHolreTjCfsHRuynzMVYekUO995uREsyLX95cTbNfCNFjORsk4h6GFhG/YjHgixv0ohxk+2nuGNaq1I3m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I9T4dDTq; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-afcb7a3b3a9so749395266b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 04:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755603057; x=1756207857; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MlZSqNXnF5cFT3EKTsD5C3uA+ixCm4MLZap6H11YwJU=;
        b=I9T4dDTqJjS4jq0QjdwoeWQRXmAWQvbPFYS0e2u8VTGBYdjWEzZ/5mLK0pq8JSOmzG
         lXFYAAjqgvVOUUFneeHZQHh59gCz6bx4698RZzv8hIilHrQdFIVDIq+LWklvPojeneh/
         TwXkl86vCC386iFAX5MRIBOWge8IF5SSdTWrtvVGmcbzn2u8jjG5OHetpuj6OR6y3MSW
         op9kDqoS3OsCu0iHBQQkaXfVQI9DKBVfvlbUFu8v5SAQuikPE/V+/VZ+orSALcdatqPe
         MpISU+2sKowBpbhlDX1wYbmrLMunlSudUJykGUdotRdFbm8q2IawSVyMEhTqags7Tyzg
         Ocrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755603057; x=1756207857;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MlZSqNXnF5cFT3EKTsD5C3uA+ixCm4MLZap6H11YwJU=;
        b=JQkaZvKBqmbMrkYTfByPfH0qYmV02So6v52GF5p9ffTdLtiVr8vJnEEDYGHdPPraUB
         W39QzBt42QecX53ERxGLDn9PrxMSPfx7ca3K5y6GOoFRngw1QHEL1FDkmTl1Q3/SpTXw
         V5q3/V4HdAjKDmi6DmXbSEdf4sbfKD6BnbGIGVypDdiX0kjoIdBKWgK1I8vGIgmeCtFz
         Ul+0aajruCCEfEe83TyZA2mAKeuDbBOFJjyBrCUmDtkc6AYzf5utoFSAqWUUGHdbvb6U
         IIi7R0A128TyJ/Z8JTCIfDGGZOMexh9kIlGNBRA4hEh2ZOVXG4aXru4Yp3UGNU3etuwC
         UP5w==
X-Forwarded-Encrypted: i=1; AJvYcCX66TXMoep0RjAAjzOLQ2baEr41hRN2qFC7h+4CViUsa/UgY0Ja4C6mySKhUaAO4IP3PedxNMfA8gbNseGI@vger.kernel.org
X-Gm-Message-State: AOJu0YyXlhbphj94AhD1ksSTozU0093UKf21M3bpBjbJyYFU874BqnKu
	fVGbe+DUvDx4jCV9OZiQzexTqxyX4Eb82cTZggUw6fFcuiDmI40Y3W0jlOn/8dNR4sS+7TizRQp
	1AViSkOoOHkyGPL5wNWfnZ9gE4h5NRFsCb2YHIrUAcw==
X-Gm-Gg: ASbGncux1PrLx64RBB9a1TQWa0cyKKW0VQUbeQQjKPkgnoTjYSlmiM6eHrb/lMMJx4v
	uxHPm+hyvaGS2m/1RobLwVgH3SnJ8AZZ+IF1I+ucQLLIkjI7SEYGosbD4n8DQupd/RTzJKuv0q7
	8W+Gs5b0fgKe3s1N3SNz/0h0+Beb6zdEQfjv1i02CHGDJ2I+rpZSoKFXTbsOq/ErnEkARRFkLfG
	MZ8
X-Google-Smtp-Source: AGHT+IFc1qeOeB8SEpfLr5OOLAFUUqEj6GU45bLARYtHghlfX/crq9PpWhn+VH6PLkjxDEuyGteYvZKpflusqa5M/Ig=
X-Received: by 2002:a17:906:c115:b0:af9:57ae:dbb3 with SMTP id
 a640c23a62f3a-afddcb81908mr192322866b.22.1755603057341; Tue, 19 Aug 2025
 04:30:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250818124458.334548733@linuxfoundation.org> <CA+G9fYt5sknJ3jbebYZrqMRhbcLZKLCvTDHfg5feNnOpj-j9Wg@mail.gmail.com>
 <CA+G9fYt6SAsPo6TvfgtnDWHPHO2q7xfppGbCaW0JxpL50zqWew@mail.gmail.com>
In-Reply-To: <CA+G9fYt6SAsPo6TvfgtnDWHPHO2q7xfppGbCaW0JxpL50zqWew@mail.gmail.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Tue, 19 Aug 2025 13:30:46 +0200
X-Gm-Features: Ac12FXyaJepFNIeos9w4tdtDWEq_utvLUQ4wMo0fo8sqlMNsdeJO5hMNv6oFTrY
Message-ID: <CACMJSeu_DTVK=XtvaSD3Fj3aTXBJ5d-MpQMuysJYEFBNwznDqQ@mail.gmail.com>
Subject: Re: [PATCH 6.15 000/515] 6.15.11-rc1 review
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, 
	patches@lists.linux.dev, linux-kernel@vger.kernel.org, 
	torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, 
	shuah@kernel.org, patches@kernelci.org, lkft-triage@lists.linaro.org, 
	pavel@denx.de, jonathanh@nvidia.com, f.fainelli@gmail.com, 
	sudipm.mukherjee@gmail.com, srw@sladewatkins.net, rwarsow@gmx.de, 
	conor@kernel.org, hargar@microsoft.com, broonie@kernel.org, achill@achill.org, 
	Ben Copeland <benjamin.copeland@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, srinivas.kandagatla@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Aug 2025 at 12:02, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> On Tue, 19 Aug 2025 at 00:18, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> >
> >
> > Boot regression: stable-rc 6.15.11-rc1 arm64 Qualcomm Dragonboard 410c
> > Unable to handle kernel NULL pointer dereference
> > qcom_scm_shm_bridge_enable
>
> I have reverted the following patch and the regression got fixed.
>
> firmware: qcom: scm: initialize tzmem before marking SCM as available
>     [ Upstream commit 87be3e7a2d0030cda6314d2ec96b37991f636ccd ]
>

Hi! I'm on vacation, I will look into this next week. I expect there
to be a fix on top of this commit.

Bart

