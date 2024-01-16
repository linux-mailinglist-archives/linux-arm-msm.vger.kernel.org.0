Return-Path: <linux-arm-msm+bounces-7387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB47D82F3FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jan 2024 19:18:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E2E2B22D45
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jan 2024 18:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AFB91CD29;
	Tue, 16 Jan 2024 18:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b="J41U4+BM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1242B1CD2C
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jan 2024 18:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kali.org
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705429116; cv=none; b=CYzrPkCzZwF2H6kTZksaTJWp0WWwbKzRBzLP5ts0ItKKxOlRcf0Hj6iLO9ayOFV2LD3dORBj2ctviNEZrAlexN57iT/XF4THModDslN6DHQqgnSA6SEmwOEZYQdof7+anwQ4UaE9f977XFd+ZAIF4+U0vv5QXkIT2+CdNDcT4cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705429116; c=relaxed/simple;
	bh=PrPV+IPne0K1/ui0ipzGQFRKiSKSX1kc+OfaOcUmtO0=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type; b=JC6ZwaNoCnlH+jZaQEoMTZzBZI+gC1jvj8TCQYHO3D3SRVHxDFq96o+q6fx48olX3MTBlgU5iL61tNkDC5UcjaV0QkF5/HPLZKay5IZONPdTiszF+SL2RAdG4Xbqokp6/6UdPU/mkFReIYRqh1yLUw/5cFYCMkHt5sJqh7na4AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b=J41U4+BM; arc=none smtp.client-ip=209.85.208.52
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-559bf1a3eaeso740013a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jan 2024 10:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google; t=1705429113; x=1706033913; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JQvuYVH+1K16FEdRksTVFQVLm5F7cTOcGjXShSf6Fo8=;
        b=J41U4+BM02C1v72liUVrEk3IVFWk3v4k/09hqLHAtm7ofxncvBlWAnxMYLNvGNddoX
         YPEBD6w2VelMv9oMcqfP6MZ/5U4bgQxPmoq306gzuvSknC0o4DRTy/FpUNGZD6vUvg5i
         XeW3W8Y4pEV5HaVnx+PIJrMcqCovQbytBrheWV8FU9ax3H+SEaH5laKRmG71uvIgjG2k
         jXhbqOvYzSdGB/Lig6yYN2f1PpuD8Gd0LbuUpiRnlvkTcqcYIOIkDR/TvuO7G5xEHqSm
         uWI/23G2OC/JqvJxigj6X25MvmVLbrmwCZiYD88LpI+tFIX0PcCQ+cnRfVWENJ1CNlKL
         cJ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705429113; x=1706033913;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JQvuYVH+1K16FEdRksTVFQVLm5F7cTOcGjXShSf6Fo8=;
        b=eTHANMF4NtxTkuBCSqSAVBXTM7JgGk6tgQeJlSgowQHiaEz+6ColVuI+9SOD4aBAr8
         +SgWu3YEpVdczWJ51/znytm+1ZKSy/AX8DKaoBtPluVVl+7ZDxsluWDLvlgLKk0Vremu
         P3TMeU9U+vfT6CEkvsoKW38aR3hlDwrzTpJX7wquw6TKD0PnHFEOgMB+rviQrvPoNItA
         PdISoZmfLYTdfOL4q/npU6F6HSLnX8+QJgAcbVzBrL9FpA+KOkuRVrSmMnltnpH/jIOG
         vOoINx2Z4lA0rMVfurU9I7MFkuKsT5jqDRHoTRDse1MwHMU2Uuxat6ygsgwXbeYtuE1j
         aUSg==
X-Gm-Message-State: AOJu0YwLWnQSLNd69dF33YmaOJlzSD+3+DKymY0Gf7A4QotgfmI/4f3y
	zrNk8stThlR/26nfz6bDcEqRAMF8zPactQiWlThPuEsVJ/CkjQ==
X-Google-Smtp-Source: AGHT+IGVDGMb6nRHnwkOZipudGexG004cHyDIg6pmFyZVLZUJcJhRb8bBQknt2LAUeCGxUmywSgiyOcE5mWOVnG65lk=
X-Received: by 2002:aa7:c403:0:b0:558:cd07:3d3c with SMTP id
 j3-20020aa7c403000000b00558cd073d3cmr3824295edq.72.1705429112721; Tue, 16 Jan
 2024 10:18:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240116115921.804185-1-daniel.lezcano@linaro.org>
 <CYG4WTCOBTG2.11PA7Q4A3H93H@fairphone.com> <5db88d48-4868-49f0-b702-6eea14400e5b@linaro.org>
 <CYG6QOFYOX79.2ROURJ8FK446C@fairphone.com> <70b359c6-f094-4874-b903-1dca07d0db7c@linaro.org>
In-Reply-To: <70b359c6-f094-4874-b903-1dca07d0db7c@linaro.org>
From: Steev Klimaszewski <steev@kali.org>
Date: Tue, 16 Jan 2024 12:18:21 -0600
Message-ID: <CAKXuJqjgXp1ns4fy11XdxRov0Lp5_=8WqmfCQ0qmZj4hCXKaRQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: Fix wild reboot during Antutu test
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>, andersson@kernel.org, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Amit Pundir <amit.pundir@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi

Shouldn't the patch subject line be changed?  Reading the git log,
"fix wild reboot during antutu test" doesn't tell me that much;  I
would think something like "Enable thermal mitigation for sdm845 gpu"
might be better for someone reading through the logs later

--steev

