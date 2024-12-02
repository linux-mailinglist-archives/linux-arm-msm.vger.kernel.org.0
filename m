Return-Path: <linux-arm-msm+bounces-39884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFC79E0351
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 14:25:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D345280FD4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 13:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 988A21FE469;
	Mon,  2 Dec 2024 13:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WKzZBmvu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BA28F6B;
	Mon,  2 Dec 2024 13:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733145951; cv=none; b=jEvBGTRVecI1gT8QkQ66BJFtyClgVMKVzy4FOfHx9R1XCXgB26Glv5ZNujRdh2gZ1AlBZk7azuFMi4D9E3nqZ0G6wLOlQIM7vFBXwQKya8b9S5RVan1g4wEKEXBrMiFHx4oxAz1YRJbhnEYw92BQ1jCi9Dqin1hVqCc6KAHAcOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733145951; c=relaxed/simple;
	bh=JzAfREBlzGyxMfq2M3UIkfA3PLTZmhEwa6RuZHSJ35g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RY/k6QISo5WXPojumpQokJNuDHdYOf6doZoiFmFKyhYCM6SrO2cDEF9Xtq7w8qaLsQKEBmII36YVevso8kUEIfe6tARpnn0RUBvQ5SZ00n392MaBw0mUTDOLJxWNHAQxm2QLbtRub0lA75DhV4vMCVrkXwQm2nB5pG1XK/rH3Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WKzZBmvu; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-29e71d653fbso217434fac.3;
        Mon, 02 Dec 2024 05:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733145949; x=1733750749; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JzAfREBlzGyxMfq2M3UIkfA3PLTZmhEwa6RuZHSJ35g=;
        b=WKzZBmvuhdw02o69LehtlaP0H5WnrKT6YCMs11ilof82dA7tBaxzPvAZf+jrX9t02i
         4dYcsh1W8SS+cHTur/SCmedhI11n+OXYHtXZVOn+x/WLuor9qs0xmgUyUdOMEnhYfwFd
         1dRhfc3sg5TIJVw5fQPU/kVSX7VhfrJnxLZuangVX/ifzcGKPZKHV60193TFXdmA6dFx
         mFfp5K6RJqFhDljmIsjjrCl4PfNfu+QwIjxGRpm40hiQuN2TwKgetEWOn7UeMKBv7j3o
         NpUibk1v/iLEb2EfikUQtLHBr+/zpIARewz8LVljrrXvCWmJ3NJsYhayozl2QNB+ArtJ
         ktVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145949; x=1733750749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JzAfREBlzGyxMfq2M3UIkfA3PLTZmhEwa6RuZHSJ35g=;
        b=S5K2MO9FwaIPA/lHkWyxVeqIDEVI4Bb+N8WWAm5s+lkDintbPSPKzS4+3lmvZarnjE
         bJo4oHlCYhF92ppwOO4ULXHKbTo4cIMWCaFBqYHiAeVxcHglAIm95Hv/ewL0GKs+TwdU
         lU1i17DaYMbJcqsVCgG4X5L4JpSmg19bSiKkVNhb/bvJ0EVV0Jw47AmnvN5rfKmU4u2n
         pjGfmWYnjqPTpZ+sxiGTa6dstvRLCgq98m/jzKcJ8xDVvyfGZJ0fLt7KVVvgX96b5g9L
         aKj+Oljo4gRqz+WgpKu16VgvG/l5pGarSqo+RPNj6Vi3BV04JI4mcvufZvmiVI/SWPaM
         yxsA==
X-Forwarded-Encrypted: i=1; AJvYcCVbtihUtEq9xQOJ6djXGQ+4uWHTGHLKwndvz7tsFRaIG32V2p/L3h6z611lzdZ1Yqxr2Xi9aFAUjGap0YUKHg==@vger.kernel.org, AJvYcCWUxBXuGVnlqE+cTIJLmZ/oDbhkwo8t/E/AK5Zg+E85eGp5B3XdbHy13JnE6FDCSPihVO8hQKsDJxHAtEWy@vger.kernel.org, AJvYcCXl/+3h/x7CQ5jlBP/t7d8mkVXGUyivICU+L+2wfTYk4kQdHDyUUqDXl8RrH1BV9Qos0eNLepDxr04N@vger.kernel.org
X-Gm-Message-State: AOJu0YwlizZ9Yq7yd/1p3q48UbhF2qJcrWdJJGMByRVM/n3t0s365bfh
	POb85lTr55U4n70LsOH2mUfy/NWnshIy5z4/WSGm0pP+N6bBvoBe3hUgSRN7FGAJ8yB0riGGLyi
	+5IhXzbGNj3fd7vNdiWWD8A7A8wA=
X-Gm-Gg: ASbGncs2KTi4Tkei4v3Z48JXNvH1AgjL2fage4r1xpcGOu8t8Z1CXJo2l79eJIE3xn8
	E5o4ZJfqJP0Lc+fiQIvR/t5NKG40bgA==
X-Google-Smtp-Source: AGHT+IEunf9HVnSmilfUsSj/yqIgpyQyjJyUhDfSWV570fxCrjjkJ0fUDzssd3DZMUWvaGkF/Ze3nmoehiVW0J9D7+w=
X-Received: by 2002:a05:6358:6f18:b0:1ca:a296:f6fe with SMTP id
 e5c5f4694b2df-1cab15cff10mr826643055d.6.1733145949084; Mon, 02 Dec 2024
 05:25:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008-starqltechn_integration_upstream-v6-0-5445365d3052@gmail.com>
 <20241008-starqltechn_integration_upstream-v6-8-5445365d3052@gmail.com> <ee668cbf-54e0-4c0a-b690-8606cb3785b7@oss.qualcomm.com>
In-Reply-To: <ee668cbf-54e0-4c0a-b690-8606cb3785b7@oss.qualcomm.com>
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Mon, 2 Dec 2024 16:25:38 +0300
Message-ID: <CABTCjFDMFTJCBm3o+5HVd5DiNF7HJETc=Lc2b=fqmKZM9Mz1gA@mail.gmail.com>
Subject: Re: [PATCH v6 08/12] arm64: dts: qcom: sdm845-starqltechn: add
 display PMIC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: cros-qcom-dts-watchers@chromium.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 4 =D0=BD=D0=BE=D1=8F=D0=B1. 2024=E2=80=AF=D0=B3. =D0=B2 17:15=
, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>:
>
> On 8.10.2024 6:51 PM, Dzmitry Sankouski wrote:
> > Add support for s2dos05 display / touchscreen PMIC
> >
> > Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> > ---
> > Changes in v6:
> > - refactor: s/starqltechn/sdm845-starqltechn in subject
> > - refactor: 'i' < 'm', so put tlmm i2c node before motor*
>
> Now you have 'i'2c21 before 'g'pio-regulator :/
>
WIll move i2c21 node before gpio-keys, too


--
Best regards and thanks for review,
Dzmitry

