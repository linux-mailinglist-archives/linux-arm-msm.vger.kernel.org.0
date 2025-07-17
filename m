Return-Path: <linux-arm-msm+bounces-65437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB881B08A6D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 12:21:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 613661C23A51
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 10:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70AB528FAA8;
	Thu, 17 Jul 2025 10:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nBob1YaS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB14A1E1DE9;
	Thu, 17 Jul 2025 10:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752747689; cv=none; b=r31ZOiLvNDvEkdunCO9Y42mLeSpM2enCX9f9c/VSbDajePqZFprQPO+ouR8EVhrfUqcTzJ1vMqq11+UFkh4A95prZhM5Rz0RKGJW+HO6wajnjUvV0ynmiBVhckCHPKEJ3y7ZXdS6FVwikpWNKojdZzD0J6fKpXTY4bTxCW24iZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752747689; c=relaxed/simple;
	bh=VDEvp4nPa1fTYguPdURxWsEZGCTUTGn8gTFvVXSjEEk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WLaKDBA1r9z/3bEzGd2v/0o+Wh37lZnUr333J/oXMvNnM+zSKtyja3HIRvPEYzsLJeCnMqHl94WwkduMiwrOf+u7dR1aS5n14yjpDEzjRTBWqps+bUgYehJndUpW0M/zIAB3uOkZ3sSbndqBflamAuVdNIsuNZAQc4Ely1uteUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nBob1YaS; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-454f428038eso7264465e9.2;
        Thu, 17 Jul 2025 03:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752747686; x=1753352486; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R0SDQOrTuS1H9lUpxF+kJGVHmuSWWz5UnyQqpeF3N/I=;
        b=nBob1YaSc3ZTAenMoDx6NhsnYxh+/vBrt4imCCpZt4ot79LbaFCJQBmJmR1jk+9ZyP
         Fo9mLivzHSm7OPi8fOnjzbj1mM3Iy2NH+InvqXifsD0JMmd/pZmLwMvG7PFT49xlXHZD
         LLKS2uQ8pLALsNbVStTXuDWDCPFJL+bIP7Ioj9JMu//vkN/88V01EE8d5mgCkCztod3C
         cOf8zdiBALOLTUsDpxPg7PoXhkEF7z1tjovJLxQCbRgy1PYGBLZqTKFSmsWkVFA22i1V
         17HSWizIbdHIa8bT0fQjsVHDIffEF7ubLZyZ40kVY4vpEv/0gFSxA+m3sTmHV6a8W4Fk
         QfEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752747686; x=1753352486;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R0SDQOrTuS1H9lUpxF+kJGVHmuSWWz5UnyQqpeF3N/I=;
        b=GV6fC4Fkdk5Q6hVNif4mTkSTmzzIG3vJVoY7WwrbyuTKsYsAA3B5pZpprRwSw8Busm
         ZcfJHgl/N+S9Mnag6l5AS+6A7QWrvtgGURxI1CXG+qYqFi5PW5kpo2OU/uGVCkst9J00
         sc4KQ6+Xu1VhAWJ6+id79WTu4FhDBtkdPNWWpkTP/HNAtrGqpZC03M5jGQZ78frnMfn/
         OpCY4Cjmr6FKIWhB5Vp+ztqt+rRhLJbYVMqLLoxINENNlY9QH9OMAtROAD6+qAsJbLBG
         WJNAnwGIdN6PsZ8saG0tWFId+gqahEQS1r8y9EUMMwxGEQoG6EgwaifZmbvn1VqrTIvi
         9uFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUi1HQk0uHx0UcQng+/+f3B9zt/X3e1ruVXY2l51yn97QYY9Fvz6slTAgE1L4ziBrpc1MtTfOwMIFFfQ39/fQ==@vger.kernel.org, AJvYcCXCiOtjNyX/HnqL+niZEgxEeTUVUQWE8C2Tv1oasETZAHdm4/6I+sCA8FwPwDTFsuCVSgDcH5Vb0j+UdRNk@vger.kernel.org, AJvYcCXSYJhTrpAwohWwel96wp5YNC7qjBZXS2eQg17MNYwVuZtcDb0gfJ/cJmwyuEqOxd8WW5XdW6zfjXMm@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/P1J76jyxMyJBbhiyEp7g4PAek7kToCLe6jYjXlPzmJNtL2mi
	zX3iIwoWJSfV+rL58IhS4CBLwaz0VFjDfGzAew0go1X0MzAHKZXS1siJUPL1R/PXdMokYRolmyQ
	sJnAWUaoKJ+HhQyphZSX0CH95YjBRVPV45CDYbg==
X-Gm-Gg: ASbGnctpcdoE7edXPhQ80DCmiI99B3EghYxYofnZofuYSjDLmV87+6qbd2AjmgT3Es4
	GK/5VFaF8j2IfDo2zYIsFDHSbMDl4Twcj+HorFBzCVkTAKfLPjyE9qYblJVjMw5Ae3tIRkwkTDy
	3KYvO3pjTfZvTf9K/yojMoFPt7unaXvBbschiy6Vcu+j3TBlpJPAZ7dYAWDf3Oa829ugKTb2HKa
	U3wa4+5qg6kRbhPIQ==
X-Google-Smtp-Source: AGHT+IFv6PBDOX156MvNUaV8Z5aPrBU4/FhLTnO0xFtNzvyAZYCODnCC9mUWUFf0SytFNxDo8Gj6Wf3YhC7QoNI3akg=
X-Received: by 2002:a05:600c:a009:b0:456:13d8:d141 with SMTP id
 5b1f17b1804b1-456389d8690mr7082975e9.27.1752747685756; Thu, 17 Jul 2025
 03:21:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630205514.14022-1-alex.vinarskis@gmail.com>
In-Reply-To: <20250630205514.14022-1-alex.vinarskis@gmail.com>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Thu, 17 Jul 2025 12:21:14 +0200
X-Gm-Features: Ac12FXxvNJ0B0zaGN1T4nR7wK4g-_GSIvgNfz6hKS1s0YPdaG7xpe40EqrOql8w
Message-ID: <CAMcHhXoNFnAhSoOzTQ0quHJd6=CbZYEsozcSxTJaiYXWWQ6Ayw@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] X1E HBR3 fixes
To: Bjorn Andersson <andersson@kernel.org>, Johan Hovold <johan+linaro@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 30 Jun 2025 at 22:55, Aleksandrs Vinarskis
<alex.vinarskis@gmail.com> wrote:
>
> It appears during initial series to enable HBR3 earlier this year [1]
> few devices were left out, add them.
>
> [1] https://lore.kernel.org/all/20250226231436.16138-1-alex.vinarskis@gmail.com/
>
> Aleksandrs Vinarskis (2):
>   arm64: dts: qcom: x1-crd: Enable HBR3 on external DPs
>   arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: Enable HBR3 on
>     external DPs
>
>  arch/arm64/boot/dts/qcom/x1-crd.dtsi                        | 3 +++
>  arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 2 ++
>  2 files changed, 5 insertions(+)
>
> --

Hi,

I've noticed this was reviewed some time ago, but was not included in
for upcoming 6.17. Perhaps it was forgotten?

Thanks in advance,
Alex

> 2.48.1
>

