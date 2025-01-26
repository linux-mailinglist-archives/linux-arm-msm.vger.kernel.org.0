Return-Path: <linux-arm-msm+bounces-46138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A79F4A1C6A2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 08:30:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE659188736E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 07:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D29E019D080;
	Sun, 26 Jan 2025 07:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LcGcUO2e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E9D19C575
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jan 2025 07:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737876600; cv=none; b=GeTe8AV818EZAY9/WpxjJtH9JnjCMqU6m8BfbSkd4qfTl9AWd3NA46fwyTBZhF9pA5hL0tZX6TVqSfq+BVCc8JggWnsPhll+Phq2xSjFXM55Ik/dFCIhJ3s6/MTel8LKQd9tHi/5CFiYs9cqJtfQZIzilETEF2GuhxdPvCVzD18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737876600; c=relaxed/simple;
	bh=Cj3am8EY8dyXip8njKWY5dUo1Uu06z/0Iuv1BTsliLM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=R1izZvpK6YpghN2rdHXg/GiyC1A8nE5OSYHQGJt8yiJ7QTfSypFCcBtZ0tXJ0KyKOPPc0iOvB6mMmTzxGowWeSQCw3f0woH+PeTYwyHBPXy4isvjaGzLQCNDD+CPcnQjsINV5DPqsTMh+nA3FnMXWqxUnXSGHKEMwNY0ZONkFxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LcGcUO2e; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-216401de828so60661025ad.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jan 2025 23:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737876598; x=1738481398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lWEYm1Wvugz22VZTmmCSh9dWYssFgpGfT0lCZXzX6jQ=;
        b=LcGcUO2e9+mTI3hvOkjXTMttCUujWo0ylX/oJuGLzmrluT9zZFrFv3PA4yuhXJpuGt
         Fk02yhn1AYhl1z4UUXPhPgoF4spu9eKsP7Q2SCSX1oj5mNqiTbyy7c13rPGf78IoRLBU
         V48mhwYJUt1U3E+bHmOlixyXK8rCdQvxrYklYFSJAXlgUIgW+vIxpwNRFnwYGDVcAyy+
         CHICGq0UesWGb0c21WEgZYuFO+UBguNvEwrCbGtWSbfNU59vzE77z2Pc8dhujrFbKqqL
         4LwAjRsWwBLON0NmvsJPaGoWil6Zv1Sgr81h70JSam6zGA4S7cLjE+kj/xgESTRTyThj
         wTJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737876598; x=1738481398;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lWEYm1Wvugz22VZTmmCSh9dWYssFgpGfT0lCZXzX6jQ=;
        b=WbXo1bnj7pnErHHBNIIqPl5tTdEUBh2uv9W7O5fSeMZ2tRdYprbW7Sdo2LN0kOOoPT
         vaZl1+jznB/bjmWApNsT7iWHDCrWsX7U7u3aI5xEnrg9QISIXwJbZrxdiYvqEoIPYsZk
         UdZfhG7jpVffpdYAAS31qLuOZANSgmq93k54wyuK7ZdsCgZLVznMgvPsEmpSs7Z6lUco
         YRwR19A2+K0KOJRImlRRdGhqGWXM/MC9DSS3341Qvo7y9HVOmSTtpqaa4hz5v1nVnSfT
         l4xpnZI1bQGiZtNnVc10FdTVSqNL+gp2ly1hwDq9ldaFG5pxhnT2IE/ZRr12HQqpMqHb
         FOUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhpptQS2kobGxlGg1ZIffUzAt7tTFcOnKpiSeL210Nm583gdpffyBHnXUfLDHUwh54POS2B4IPvFxxEyHl@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc52a9OgLBpjOLG/KCGU+8AF+YAFeaN8jA1u/uZJ6LBwhPn5dZ
	jmOMsnNLbhUhi76bn3cbSwRPsdSSFcCB8tmdqgVtARI2UKfWV45PabokGqN6xA==
X-Gm-Gg: ASbGncupnzoixMJ/LEzZbTmEHi81uvIXiZOe/uDzJ9I61SyG4G26tyFj4HnGgeCQpmV
	U0Gxts+zJ6eDMp9IyTQCg+Ys1eWsr41NKmWHOfy3e0tZBFk3HUQCEy4Mdnw/+FN97H3upLYLKFI
	LdLfNGGmTkK8bRUb2z+yJ/mPiGPS97PxaeXW8lg8yO2FzQj70tSptcChdz/fxehNjUTe7bAyjlH
	XRUg5SpjPFLkFLRv1UuS8msDTO1gp503ML3q0QSzGJBnZ7HDuXX9NkDEpASEMp+ROpEMalxmSp4
	Xi+B
X-Google-Smtp-Source: AGHT+IFD0g9cKNN5kJkF+EtlX2a/2RSBTYh3J6vZZB5CmCmj+BPQyEJoszp2cnYSPKR9enWkHM+YrQ==
X-Received: by 2002:a05:6a20:9191:b0:1e6:8f10:8ba2 with SMTP id adf61e73a8af0-1eb2145eab3mr55988433637.9.1737876598420;
        Sat, 25 Jan 2025 23:29:58 -0800 (PST)
Received: from ?IPv6:::1? ([2409:40f4:3047:1c2c:8000::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a78ee7bsm4940924b3a.170.2025.01.25.23.29.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jan 2025 23:29:58 -0800 (PST)
Date: Sun, 26 Jan 2025 12:59:52 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/6] phy: qcom: qmp-pcie: Add X1P42100 Gen4x4 PHY
User-Agent: K-9 Mail for Android
In-Reply-To: <h6zfhxkc4dj2ueaxipha6prbvmv7pnqglghtjs7vkhlc2s7ndi@vhbj4uojlzwd>
References: <20250125-topic-x1p4_dts-v1-0-02659a08b044@oss.qualcomm.com> <20250125-topic-x1p4_dts-v1-3-02659a08b044@oss.qualcomm.com> <h6zfhxkc4dj2ueaxipha6prbvmv7pnqglghtjs7vkhlc2s7ndi@vhbj4uojlzwd>
Message-ID: <A64B8332-78F2-4B76-908E-4119E4A54BAE@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On January 25, 2025 11:00:23 PM GMT+05:30, Dmitry Baryshkov <dmitry=2Ebary=
shkov@linaro=2Eorg> wrote:
>On Sat, Jan 25, 2025 at 04:31:19AM +0100, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad=2Edybcio@oss=2Equalcomm=2Ecom>
>>=20
>> Add a new, common configuration for Gen4x4 V6 PHYs without an init
>> sequence=2E
>>=20
>> The bootloader configures the hardware once and the OS retains that
>> configuration by using the NOCSR reset line (which doesn't drop
>> register state on assert) in place of the "full reset" one=2E
>
>I know your opinion, but my 2c would still be for not depending on the
>bootloader=2E I think that was the rule for ages for many possible
>reasons=2E
>

But if Linux or other OS can trust the bootloader, then it makes perfect s=
ense to rely on them=2E Obviously, the question here is that on which platf=
orms this level of trust should be established=2E And the answer I got was =
starting from the compute platforms (atleast X1E)=2E

So let's take it on an experimental basis and see how it goes? If at all a=
ny problem arises, we can always resort to in kernel sequences=2E

- Mani

>>=20
>> Use this new configuration for X1P42100's Gen4x4 PHY=2E
>>=20
>> Signed-off-by: Konrad Dybcio <konrad=2Edybcio@oss=2Equalcomm=2Ecom>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-pcie=2Ec | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>

=E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D

