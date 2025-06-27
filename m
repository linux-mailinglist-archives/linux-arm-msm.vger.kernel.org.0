Return-Path: <linux-arm-msm+bounces-62819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA05FAEBB6F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 17:15:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 458956A0A0F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 15:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DE162E8DE9;
	Fri, 27 Jun 2025 15:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="I2YkeXsc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D457F2E8888
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 15:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751037277; cv=none; b=GtLGEuMqp+6hqsX6XWAo/M6+QCyAm9YlV7O2s6aTh41QEEeeuQt09XKnKnQSNLrqxZALTKHjSAXuyBPy9lNHxO9SNm+cUwa73qa0Ms+l75bVOYxM0UUvLTpmzNNJUXTSwpn2Dy/DUTka3iLLwcD1Sr6T1AeSvl2a3rE2gBHB7z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751037277; c=relaxed/simple;
	bh=9xXvH/B+/8ovxyiaGuMlHCWofUTZqieLqJyknmO4BWc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=g6vrFllj1jktPwBthsAPqBhIhSa6VLxIGlkFgK6gaspV5uj+Va5epzJNO3ZJy+HbeQiaeXwvQpO0Q53BgTSW51YYJG5UCcR9S/GTw488bYY5AaK6zwmy67r3fr+HbQmqhdQt9OBIBbtWc0hqUfz2ir/Hei4m0BqpqnsE43LAsPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=I2YkeXsc; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-607b59b447bso3547736a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 08:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751037274; x=1751642074; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4YdwBq8x/9yTkh9TL6YeeP2ANBhnQ2yJ1UlsY3OJMpQ=;
        b=I2YkeXscYPiN5DOWsol9nyFJ1uwD/uU109bB+OU8zaelyHH2VWoPjPmrhpNIw8Feff
         +TYD95Q4jwbMd8jh5wC+f8tZ4P2kW7cKtHtDq2q3oZW6uLy+i7BC/ihEBlJbPeRWG1YJ
         ZHVr2VXNytYyN3YvjxAKj4+2HJWy+hmsb9qhj1jglrigO40T1ABM8VhfX61Bb/9eowtd
         oNjj3LTj4IdICvQHQ7s40CBDMh8geJsuoT0XTIFV/yflmcZFW/OINt59Ez4JfuAP9CdL
         JjN8CyWCMPYbBHu1VrRPe0UsX4TnPbxGHzjzhzN6P6rD/3E4O88bJslKCmKbf1jp1kUk
         Qn5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751037274; x=1751642074;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4YdwBq8x/9yTkh9TL6YeeP2ANBhnQ2yJ1UlsY3OJMpQ=;
        b=WPLg1XwE1hkEQOmCS3/660AxTbrN9ms3VrqBo0PUoiNVybqd6St0Easti3rrR2/zs2
         oTbslp2zItYSUEIe4xPj80PB1jmTZI6bQT7TtLhe5riAw+mqLM9NyMsty6No70q3GzCi
         xyrvbSNDdQfZucv3EQ+uMO5bZ+TRzOpVV213bptK4PtwnFe+/eDddiIItS+BfoCtglel
         EF1YWo8o8FyqMfulYCEBb/tYVpI9CJOpZnC9/n/eoFhPVC8gH/rVirkbDApw12iCiwk0
         qM9vQR1hVs6neCEvlaE/Jt6WLX7KISUtnbPgLLqKMo0KNI1vsG6PWlhP73Y5DymZ7rf9
         M5cA==
X-Forwarded-Encrypted: i=1; AJvYcCUW0Kx9CnDusNmJkXyb9yZ99kxmohf+E9KDAbrhhQOxFR76qOO47e7stkS0aMamJKmKI3WBEz86LSCi3Xe/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3npTelzH7OlnMxuOfBMWYu3im+4GcakgpLrUPEssWzg9WXHwF
	SWR9nuDp3qpc+jHsuKxVN3s0RKoA9bk2HKL5px2V3rLc6XlEdoXu2ecQwDEUSXambGw=
X-Gm-Gg: ASbGncuBFTekpvbnYixwtSKvMTU6wEngVJI+RQuQpfIKGl1B3V1u573WMlupaSx5c6i
	tBMPYfvpviOqPXzp92KVzdjYKn65vFpo62rm1gjzfgwFo6B63rX9oBhCKV8xS+7WPIr5o65aGIX
	Saa4SZgTaJSOe4ZrdB6QxHKG93taWAYG1yAWrNmKHm9sPe7slz25X8k0fxk5bBUzC3YtFe/VvhF
	Zoki4iX7Nm55/w8VLZnhgzd6wPs/alLVDMEpoudVP0PPhoIXtwOJXv8FieU7rdhHkYtHrhPQXh9
	DwYv8H2csRkygc3PlWE7p1ZzOaW9aj89K+INzE8UqspBedrrAn0c3K13e6qJSeXVAKrEPaLk1VR
	mZuMIcYnHT6s5C/IC7AvMFMiBS9emDIs=
X-Google-Smtp-Source: AGHT+IGXK10sOdRHQiQDlGMMOAu00b6+1HTHgeTGZsSXRorQQ5K4SHjAIMDlViazK5Rw9QI+EWq3mQ==
X-Received: by 2002:a05:6402:2063:b0:602:36ce:d0e7 with SMTP id 4fb4d7f45d1cf-60c88dd63d7mr2289708a12.14.1751037274070;
        Fri, 27 Jun 2025 08:14:34 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c828bbea9sm1617466a12.1.2025.06.27.08.14.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 08:14:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Jun 2025 17:14:33 +0200
Message-Id: <DAXEWQ93VELV.3HJXPNWASYBT7@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/10] Add clock drivers for SM7635
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250625-sm7635-clocks-v1-0-ca3120e3a80e@fairphone.com>
 <68056b4a-b1c3-401f-8720-8e0c3cda6249@oss.qualcomm.com>
In-Reply-To: <68056b4a-b1c3-401f-8720-8e0c3cda6249@oss.qualcomm.com>

On Fri Jun 27, 2025 at 5:10 PM CEST, Konrad Dybcio wrote:
> On 6/25/25 11:12 AM, Luca Weiss wrote:
>> Document and add the clock drivers for GCC, CAMCC, DISPCC, GPUCC and
>> VIDEOCC on the SM7635 SoC.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>> Luca Weiss (10):
>>       dt-bindings: clock: qcom: document the SM7635 Global Clock Control=
ler
>>       clk: qcom: Add Global Clock controller (GCC) driver for SM7635
>>       dt-bindings: clock: qcom: document the SM7635 Camera Clock Control=
ler
>>       clk: qcom: Add Camera Clock controller (CAMCC) driver for SM7635
>>       dt-bindings: clock: qcom: document the SM7635 Display Clock Contro=
ller
>>       clk: qcom: Add Display Clock controller (DISPCC) driver for SM7635
>>       dt-bindings: clock: qcom: document the SM7635 GPU Clock Controller
>>       clk: qcom: Add Graphics Clock controller (GPUCC) driver for SM7635
>>       dt-bindings: clock: qcom: document the SM7635 Video Clock Controll=
er
>>       clk: qcom: Add Video Clock controller (VIDEOCC) driver for SM7635
>
> We had a massive yak shaving patchset go in this season, please move
> the magic settings in .probe to qcom_cc_driver_data {}

Okay cool, I found them
https://lore.kernel.org/linux-arm-msm/174970084192.547582.61230540758298270=
6.b4-ty@kernel.org/

>
> Konrad


