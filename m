Return-Path: <linux-arm-msm+bounces-27153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E0ED793E8F2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jul 2024 21:00:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CAB71C20EF9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jul 2024 19:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B863745CB;
	Sun, 28 Jul 2024 19:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="ltQDmRo/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6F955886
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jul 2024 19:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722193203; cv=none; b=RA2oQmrF8tL8JhfJrojYgeqIzrBJ5cgCkD12JTQiDRFdSrlyyo8OsG6wwLNmueZrGv2qBxdq3ziwtzVFLYzLixVA3SPehb9ksY2oWQvO8Ae1FvpWdRjlaKu6Xh/nqm+gZ3eliSwqecHGscvHLA9sIm5pgcq9LLkRUz1hlKjDcS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722193203; c=relaxed/simple;
	bh=1MyMmZ97Pppecmq9EM2Z5W/UBgCxk2y+Yc/6WxfOg2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f+scAwToXBRs856vS9G9jQf2g4+PpbCGFVyXTnOqodPojDBcA+HHLdtceub/vnBGyjlSNANI65AqawFqaeBATbjgM87/Ur9xTqhBZGWYwavdlNEB+VulE5/ZrgnmYXzvtyJ5/xF9ngpDErTZ5EKlGOnFnIQFxOdQMmXKbqr/bZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=ltQDmRo/; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 35E0C240101
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jul 2024 21:00:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
	t=1722193200; bh=1MyMmZ97Pppecmq9EM2Z5W/UBgCxk2y+Yc/6WxfOg2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:Autocrypt:OpenPGP:From;
	b=ltQDmRo/FOKt6uTnPiadITldqlg/J4KZf9v3mm93HktGcKKcX3uR4YnogZmaqOTfS
	 qisaX2m79uzJadvXDrSI4XntTB3l/fsTNeENURQ4DjiH9ll3W61qaGHDMI6Hz5U7Gz
	 D2S2JHTml79OnacdEpYrqvlTK4HA52mMJ2O+60MmzFgmIZUP294i1TUrBC+ytQQEDI
	 +dYg2fADYePs31ISzig2ZJhQAMkUmssukSrPdHb9LJTDbb3HC59mbyJ9TGuc3wr4mY
	 2tnuD0ZyX0HqEnpzw8xIcNFSFXMFT31n+4eBjzrmk1m7dmGDVEMtHZoSURNuJu0e8b
	 sTJbihUnCPONA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4WX9ly53pMz9rxL;
	Sun, 28 Jul 2024 20:59:58 +0200 (CEST)
From: Alexander Reimelt <alexander.reimelt@posteo.de>
To: Petr Vorel <petr.vorel@gmail.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: qcom: Add LG G4 (h815)
Date: Sun, 28 Jul 2024 18:59:48 +0000
Message-ID: <5636859.rdbgypaU67@desktop>
In-Reply-To: <20240728151329.GA1196482@pevik>
References:
 <20240727201413.114317-1-alexander.reimelt@posteo.de>
 <20240727201413.114317-2-alexander.reimelt@posteo.de>
 <20240728151329.GA1196482@pevik>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
Autocrypt: addr=alexander.reimelt@posteo.de;
  keydata=xjMEZg0fSRYJKwYBBAHaRw8BAQdAIcaNTdj3NWDe5HQPCUs6oYyQygAJWP9LCzhr+C7RwMrNG2Fs
  ZXhhbmRlci5yZWltZWx0QHBvc3Rlby5kZcKZBBMWCgBBFiEEM+Wy6sI/mP5S0zIFHqi3OKk8uRIF
  AmYNH0kCGwMFCQWjo9cFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQHqi3OKk8uRJ8ogD9
  EVg4zgfmC2SqXCgms6LETAzVX4CrAS8yMhyd7Md921cA/R8lhm9B96RYgA7MvFPFJb1T6JFY75Jg
  QLXrtIE5llwHzjgEZg0fSRIKKwYBBAGXVQEFAQEHQBGDuxZLOTvppxyM4G18fSR6xzT0xkkPOia7
  Bh6L1vAAAwEIB8J+BBgWCgAmFiEEM+Wy6sI/mP5S0zIFHqi3OKk8uRIFAmYNH0kCGwwFCQWjo9cA
  CgkQHqi3OKk8uRIa1wD8CZDdCAKXstgXY96eeSSP7MecEF5TBdmWOiVgjlEIpoEA/RnGuDaj06B1
  F51wyGAjYXSmn5qFoNHu3yXyLUkFz1ME
OpenPGP: url=https://posteo.de/keys/alexander.reimelt@posteo.de.asc

Hello,

> Alexander, others have added their tags in previous versions. IMHO generally
> it'd be worth if you carry others tags in next versions (when nothing
> changes).
I already replied to Krzysztof, but I messed it up and sent it only to him. 
I'm sorry I wasted everyone's time. I didn't fully understand how the system 
behind these tags worked until now. I should have asked earlier, but thanks 
for pointing it out.

Kind regards,
Alexander





