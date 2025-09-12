Return-Path: <linux-arm-msm+bounces-73246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0AAB5456C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 10:31:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93C903B8065
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 08:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89FAD26F2B2;
	Fri, 12 Sep 2025 08:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CK7g8QAB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC41C2AD13
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 08:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757665890; cv=none; b=dm2jeQ2cD79DaLwOmKx+mt5PXVhNSp2kp2ehJYtPxEEz0x5vOv/aEXdNfnmvhMHAWst6K3zYJfahoNi/xTcvSjCJX6CgCFpvF/4XOWuocG1Lpvt7g7rGbna8vO9FtRs/m5vabApsM7jORQ4PmN37WnIPaA0Iv7wlrsIv8qhYIQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757665890; c=relaxed/simple;
	bh=qxDPXfu0D2buR+RRbIJYhumpNTYZbGUZbNv5xeDdGtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pIbTmlVzKoHEpfJKZlD+6hn7zhJjA2ECc24b222QVP1J/6E2PWLbe02CWehXpe4RgUkX1oT6t6py2cWk/nT8nAqNnss85+F2Mtkmze8vHSaO9YeC8j/QLDkP3Zxao3yrKDHaXgsblINo5kXOtMY80YJzNazJzU/v7YnJ8JqWsIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CK7g8QAB; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-b0415e03e25so208528466b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 01:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757665886; x=1758270686; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ppyqoh+Iw0PqJAwUNY4Ho0HDTTkAPt60vzkSPtE9aMY=;
        b=CK7g8QABQj2cvFfH+iBCciCe6r77uFwU/Ta/PYwD0y0dFTYaAio6PDdAAsve5zjkWq
         hwlTvm2RgPmK1BrcSHJCPV7JCadzMwtYGLhrrSf4bFI14MGAL6kUIk2Wt5Qtx6FgtOJN
         algt32Q4GwwvdUqCIn0tzIcC+Ch6v1Pm7txApJjnaLfb7nmryGgRzpGwHOondEIy06sf
         gm6HTpkgWVVKbceJvEH56LOYZZknT8xgeUn2U5L0yYjur/UrhMfGpESFH8fJ3eflwZmb
         XIqi2z5uOCUiFq8NGxJLU8jkHuy1eLunaVc+vc8y2+oMgu6xOXYynC5XZkT8bDQW0pQP
         7pwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757665886; x=1758270686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ppyqoh+Iw0PqJAwUNY4Ho0HDTTkAPt60vzkSPtE9aMY=;
        b=JbX58hbH9eC6U7LyP9vkwwzm1EEtIGvKKBvKreR1ach1oZZO98S7hH2FEmlxWjb0Cx
         2Or5Jkw3hxBzZjDeoZjbwT/vFnEchK5bqZQqqeUZySKyNbwf2u5vMiWTZYbVuuIrRGff
         y/np48Ei7ojUG0QSdXrDLFMrOK92lmTNj5zlzGEYJO1r1t0H9S9Bta7bmhhYjj1cHfZX
         rLw3pyyE+OCMfKCk1lCzXreAfrqXYPPOeDyaL4qWDkex27yqXcW6CfXe5iN5PSRNOCPZ
         t/fsscJgzDVY8TqYWPwjSepf8Dr7nkv5wcn8DinMhl09WpaeFoxOLoikXcI83Kw4MYCG
         nBhg==
X-Forwarded-Encrypted: i=1; AJvYcCUfP/04nU70kERLxhzFYk5BWFt0xfroLkvI1af4ImLSttjhWYb2CDG0KAdSQ2V60iQG2wJVgNUehPeIaOBz@vger.kernel.org
X-Gm-Message-State: AOJu0YyMidM5KymsAShYI/5TvjLrssTY7X3xxG+VhST6mMAD5rrQOFKB
	Z6sbghjE+dNuC1bzIRTYA9kRPNMRA8vvduAR1xaXsuHy7Y7yUFRBJPpUZePXVxo414s=
X-Gm-Gg: ASbGnctwL57loIQFg0vPcnuFfIYdwDTeKwdFX5ClEWE2sTXMvrIezMIi6obxAjQMU8g
	0Cm+xzMk/lHbrOp8Htl20ukVa9uEspkLheZ6Ft1kC8513ChLshnh4XCULdzZMFlRPYrJtkvg7yq
	KWq+hF1XTfb29iRKq/lgNNOjBCqlAJRaiJyhMORNfR8TWhtkDQJw7u+Nj0wsF7VbU2on9KEKUM/
	MY/YDGy9D5OrvQcJJjSpBaeEydnSJjBKMtsOMpbTZ9RbYl8GyQq2jlthpnCNybOUofE9/DGk9cY
	vUMJM8XC7lOPkLMmetVC5DkNUjBIDfjLFQ6t1VSnF3GfCbiaHkB9n8cb/3uJAmnD85UKD249XJ+
	riHhO1tLq4YxxDzw2pgWCtTwSxeE90k2Kgn13tJX7E/c=
X-Google-Smtp-Source: AGHT+IGK4F+WV3rm3atyzmeXXAtBgSxVX6KmGkgnNVbx+PqUaJlvPMOJRphX7MOVOAdtjlZGKPWKlw==
X-Received: by 2002:a17:906:9f84:b0:b04:ba4:8610 with SMTP id a640c23a62f3a-b07c3ab96damr205770166b.62.1757665886221;
        Fri, 12 Sep 2025 01:31:26 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:30:5fc2:ee41:2050:2d49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32f20dcsm318941966b.90.2025.09.12.01.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 01:31:25 -0700 (PDT)
Date: Fri, 12 Sep 2025 10:31:21 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/4] arm64: dts: qcom: x1e80100: Add IRIS video codec
Message-ID: <aMPaWSN8EXCEOuoz@linaro.org>
References: <20250911-x1e-iris-dt-v1-0-63caf0fd202c@linaro.org>
 <20250911-x1e-iris-dt-v1-1-63caf0fd202c@linaro.org>
 <1beb1e15-cafd-408a-96bf-7f749b3499fd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1beb1e15-cafd-408a-96bf-7f749b3499fd@kernel.org>

On Fri, Sep 12, 2025 at 09:23:45AM +0200, Krzysztof Kozlowski wrote:
> On 11/09/2025 20:38, Stephan Gerhold wrote:
> > Add the IRIS video codec to accelerate video decoding/encoding. Copied
> > mostly from sm8550.dtsi, only the opp-table is slightly different for X1E.
> > For opp-240000000, we need to vote for a higher OPP on one of the power
> > domains, because the voltage requirements for the PLL and the derived
> > clocks differ (sm8550.dtsi has the same).
> > 
> > Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 87 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 87 insertions(+)
> 
> Feels like duplicating this:
> 
> https://lore.kernel.org/all/20250910-hamoa_initial-v11-2-38ed7f2015f7@oss.qualcomm.com/
> 

Oh, yeah you're right. I haven't looked at that patch series for a while
because it went through so many revisions. Wouldn't have expected to
find that patch in there, especially without an indication in the cover
title...

But we can keep this short: The opp-table in that patch is wrong, they
don't have the correct required-opps for opp-240000000 like I described
in the commit message above. They could have easily known that if they
had asked the video team internally for review, because we had a pretty
long discussion with them if this is also needed for X1E. :-(

I'll comment there.

Thanks,
Stephan

