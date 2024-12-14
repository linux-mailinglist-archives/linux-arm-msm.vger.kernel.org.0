Return-Path: <linux-arm-msm+bounces-42235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4ADD9F1F70
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 15:49:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD7167A061C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 14:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31F441922E9;
	Sat, 14 Dec 2024 14:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/YGapCg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E087946C;
	Sat, 14 Dec 2024 14:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734187788; cv=none; b=tx5cxxsZmiDYvgpx1b5PpaMiPygtKPCYWr4ett8c3qD/IFJGsPZHIZryo1FbtpgLyVN4Z6bopiO1Kqg/z/qq1kXOuaHbQT7pz43uUtMupqy+2+macZgZ59v96FwT1qxeyh9cDwsuBbepVULVrqfgigicp6TY0XwJAG/FafIYnqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734187788; c=relaxed/simple;
	bh=2WaOYimtK41GSXhFP1ibELg/fvUgx8ajc/IeCENQOCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YQLXYJKm9ifo5RFosNXmAuba+b5xLgC5zC8Ug1jqadhaX+eWFP9OEr0hD4i9IA0j1nWnaEifYIrDVlu/83+yr9eSerX3sbiqOHJds9O2R/pWI8ejM0RiMIa/EAOsDSAsPUYgcjCUZVe36e5kzCXvj6apZQFUk5Ad4CnRwbdchMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z/YGapCg; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-216426b0865so23928285ad.0;
        Sat, 14 Dec 2024 06:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734187786; x=1734792586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LGwPyBPLakV/q2dhnntsvhl1W5GFqJD9tkWsyFepuM4=;
        b=Z/YGapCgZZrKcmsh3Ac7HO1qQ2yMIV3H0V/3k0dzLW3cHmvz2Bo6wHgxLnrnGPYEbr
         iB65EtvGs0wvXqwDP9GYa+AHcWM/VLFUWI7YRpnuKKke9TgmDqbxq1hC0gfJWFPW/eI7
         ETeZgO7l/wC62QSF+rDo9HaF2+kH1k0lJJdEFBJ7ecVP+76WMcI3U2qoBGZlWum33v22
         SEdM11X0oWLL8t053zZL+/Gv7ejGZ7ldv7hk2CIhrMNeubadzoXf8Zucgw14RMcPJOfi
         ZmUdmw3ThuneX6ud1ROdXVAeo8wkHn/Crd1LD6wdEEMSrPhsdly5mqOwgSc1P0M17PoB
         p6uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734187786; x=1734792586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LGwPyBPLakV/q2dhnntsvhl1W5GFqJD9tkWsyFepuM4=;
        b=CwAzB96CZOudxwRmpRpsECwXqDvEAB+6VrgALN2m8bTozXBk5i01i3HyExvomRpK/L
         ysNJojmY3vZT9sTFnL8EG/rZs0AEfTeyPmsFLFD4Jh2E4sAk4RKyc3Ew1A0iXNtA1qn0
         ePeoDvgbkfajff/7G1u/DRT3aIkJ2vzEAj2ris5nUQpRRJnotBQrX9qNd9oKAk05OJr6
         vHYqRW7dNY/Gyl0ASMj30GuJjxbPAxtTCBBVtXo+Zy/tteyLYYW1DqbEC2vOyPNzbkVM
         WrQNGSafIqdd0FyQm81Mo8zdfcUxAk8xudMBdbeV+SZDrR2mZ7ZF/TW2bAcoKo6IDFYJ
         VFbg==
X-Forwarded-Encrypted: i=1; AJvYcCUxSfeDQ6l5Uq0GMnrrhRTult/U9bQb6cxwgVx+YCOlKFL9PivZI3egvQdKbLOCz3wfCvBYkF673bzY@vger.kernel.org, AJvYcCWRRLozrN7F2M1sC8Yr9+C9NfzfPyilFUAB6xA8IZMTnTfGgQb8paSEAbL51MCp+fwrnEi33nXkX07aezkQsw==@vger.kernel.org, AJvYcCWyVT473X2n9WTxVIYOZv7fLLVd53QUG3dkceBjybCbj3ZR0di0lkgQmqjyKg2heQUR1QIZexb46oXwts2f@vger.kernel.org
X-Gm-Message-State: AOJu0YxAPY00FnBSUKLZTuoSBmpCfoA/VCLK37EPMdB12FaV4uNUYLqT
	GAD54h2MR7Ntno9F4jkDPeT2F8ttfmSK156AGBbb8W4+1h0dzVaK
X-Gm-Gg: ASbGncu5gI9FLJOT5fn/j9yUxWZslcVdUqCT7UzuS+cFgtzOXy8u/1duq8pqVzb+mnv
	EdKEHM8aBh6JTaFd99FEOPW/sLtMajgwvSZPsIuTKflv3Y6G5OwGOeJ5TpSKkaKl3MK23QdmkvG
	MYwSzLkbsboU/wci8HKwKiDP1ozYkK50o9lsEidVH/vgAk/ndoGrPHUTddXdvqZ4D4P/n58pkan
	fGIOd5VGbWnebfkQeUJD5dprxI3mC8Fs9FKnq1+QG710TaAW7+WWq0=
X-Google-Smtp-Source: AGHT+IEj9AsOKg+OhCsNjJ9wrzFf+uxH+yOJp8F53v9YGwrVjjxrWCX4ART8JnNDqIawKSyQ0SwXLg==
X-Received: by 2002:a17:902:f60f:b0:216:3889:6f6f with SMTP id d9443c01a7336-218929b7895mr101243285ad.17.1734187785845;
        Sat, 14 Dec 2024 06:49:45 -0800 (PST)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142db5b0esm4877221a91.22.2024.12.14.06.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 06:49:44 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: dmitry.baryshkov@linaro.org
Cc: andersson@kernel.org,
	chenxuecong2009@outlook.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	gty0622@gmail.com,
	johan+linaro@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mitltlatltl@gmail.com,
	robh@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc8280xp: Add Huawei Matebook E Go (sc8280xp)
Date: Sat, 14 Dec 2024 22:48:28 +0800
Message-ID: <20241214144829.670851-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <lwhell4z72srw67gj6gpt2uyqzx4k5dzjw5xs7dab6lbya7soi@tsoh2bcn2gwc>
References: <lwhell4z72srw67gj6gpt2uyqzx4k5dzjw5xs7dab6lbya7soi@tsoh2bcn2gwc>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, Dec 14, 2024 at 9:39 PM Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:

> On Sat, Dec 14, 2024 at 08:23:00PM +0800, Pengyu Luo wrote:
>> On Fri, Dec 13, 2024 at 1:13 AM Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> [...]
>>
>> >> +
>> >> +          /* /lib/firmware/ath11k/WCN6855/hw2.1/board-2.bin
>> >> +           * there is no calibrate data for huawei,
>> >> +           * but they have the same subsystem-device id
>> >> +           */
>> >> +          qcom,ath11k-calibration-variant = "LE_X13S";
>> >
>> > Oh, this can be taken care of! See [2], [3].
>>
>> [...]
>>
>> Hi, Konrad
>>
>> I want to distrub you again.
>>
>> Finally, I found something, after I enabled ath11k boot dbg, I got my
>> id_string='bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=255`
>>
>> With qca-swiss-army-knife (see [1])
>>
>> $ ./ath11k-bdencoder -e board-2.bin | grep -i "$id_string"
>> bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=255.bin created size: 60048
>>
>> It have already been here. So that means I don't need to extract from
>> Windows. I just extract it from linux-firmware then give it a variant
>> name and send patches to ath11k, right?
> 
> No. Usually 255 is an ID that is used by a variety of boards. So,
> basically, you have to extract board data from Windows, add a proper
> calibration variant that is specific to your board and then send the
> resulting data to the ath11k mailing list.
> 

But how? Is it possible that some boards have no  calibration data?
I tried to track the access time of files, the result shows that these
bdwlan* are never touched. According to my observation, these files
should have been accessed, (like BT firmware on windows).

>>
>> Pengyu
>>
>> [1] https://github.com/qca/qca-swiss-army-knife
>
> --
> With best wishes
> Dmitry


Pengyu

