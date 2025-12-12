Return-Path: <linux-arm-msm+bounces-85112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F70CB9303
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Dec 2025 16:50:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A1A4301D670
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Dec 2025 15:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19A0D2BD035;
	Fri, 12 Dec 2025 15:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lrzv641n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B4C2BCF43
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Dec 2025 15:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765554637; cv=none; b=WoBTB9AHJi5k5HVvO8HCPt+kQ3vphnL8rjChqeR+6ieVdxPpRMUJBM6jq5Pv2br9rld0om/8kzAbxJIGBEAqIFS3kOhRiodieqMOi6Gzvh5c3iPCfqD5jy0m90v3oxHmcXNMTU6RsxprUVrwxf0rZUACmVujKDfEIHitPoNsKGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765554637; c=relaxed/simple;
	bh=xidLXrNa10nnExBVsh244pTe4JLAL7pUNNuqAQh1B+s=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=aGpWg8yZlt/x1iSbdWEPQpJLba6+3XP93VoZhWLA6IjrMISUkm0McQtHWhilrBArI8SQUI3ZViPU++2zfN5SEztpkheJYWNHqTOu6o/HR6/F0RqlS2OLPeW2/LfOUF3G9hptsMwzmaEk3Zc/WiVjCOOF5EgiilJxGVtFQ3o432I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lrzv641n; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47789cd2083so8113775e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Dec 2025 07:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765554633; x=1766159433; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cnX0JUa95FLcaYhHWNtkfg7XDY9jpTe5UGPxP4s3pY=;
        b=Lrzv641ntsVsANySf4CGLJ+nq/wOMZVcpWp/Hx3TfA7oQ/flPsEZ4ccvHXOt9c5QLz
         BsY9DGLYGK8aiAZlSnvL08ToRj+ZB0/663kgEbXh0BQ6wNd6iJRwpXcOZqgOx7Ck7DKl
         rEx2LSNwG8u8Yo7fRU7FccwnU4goEBiZ3an0SVGnFq0dhs5CRhH5geqQrK6dExJtgLBT
         WgQLfOmLIORZTp4iw45DWbBoDTUZKS8VLmLZY9OsycVcJTfhDc5brKuyhA+GLs9Jmg+t
         8lc1mfC8tb7322G56gsBA7EhLDWsbFUbnVaY1pEiBHIRIiylQffiGTHrn/HU2S+qbvyL
         oJtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765554633; x=1766159433;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2cnX0JUa95FLcaYhHWNtkfg7XDY9jpTe5UGPxP4s3pY=;
        b=ZMob4rxne+1wz0iUdBtyUCYGzwrWZGkuP+Q4iB8q1If3+4CxVq4OKGcRrHwROyy7B2
         84L7udbGdfdXee7W7k2D7pu7kJhqpP2XJODfIhGhZyaKaDpNpqfqMKqJdFxouN48x5HZ
         rZ773LOxKs0sV6Bj9MJFoimedk1sEsPBjG4VEBOb6a6KzIbirlKEqM799ubLZeaJ5UZa
         AGl6Y/guGkKVr1EXe4e7SpMUiIDeKcu76jIH97wxUoGnwMRLmPgib9efuoZYib3BpIY6
         KiSJ3AnEHrgAIzQ12mDtT7gHGP8Imt5JotiXmK+k6dto/yXOfd62OQMCyfMcJKw8XqUR
         t8MQ==
X-Gm-Message-State: AOJu0Yyl3vMKZipskRS8AZ9FuI2+gj/L0/GHGveT0ac02ENPc1uRboKC
	JOBgKEWNfWlyl5YDB5scwV05Od7fDJZ5motI8O2i4sDtP97n137knH5cbRWc5qOg8i4=
X-Gm-Gg: AY/fxX7IO8MLJ4qv3pqJKhS+fMNaORWZ9RVp0MqcB4bbl9iwgrf9/AhFHNq4ystDNLR
	uB3j2eXvgDPkFpxB8O5PfTjrIElPgjCKRnWt9c3VGirPJtLlXKUecyy/DXm775I2DpbFROGAqrF
	dKvle85IH+Qr6ULRGCnmqCDhbITUyJhQh2HayTRb6+Qcja1nZgU3HyOUUkyD/6QrFa7Qf9UNuw9
	5p2WwfvlOUoaeIYQxXnr4MhI1q9YITudKAPUFPs9DpQ/nfXAP6Ek8wc5fZC3DHTKkNci5H7EF/X
	6pNMB3ZJ7reTAO8KdY0lBfCcF6kG1YMjdtFWB3fFeZ7tpFmrGZnEwzyoJYoQfuF3dEKO1V9r4iD
	BFP9jPV7Z3hZb6HceVOeK5/hZkoZ3LsiyPL3JapICBFt2+Mq9qrgnyVSagHjxwuo9+2hLsaywV5
	T2x9k7JMiQMrppnXGm
X-Google-Smtp-Source: AGHT+IGUrxu+irDcADrK5/MU4ibUgqq1smXSNe2wq3NuGG1J4xPo6RgE6cmVyk8cYeI2BK0AXvmmWA==
X-Received: by 2002:a05:600c:83cd:b0:477:7af8:c8ad with SMTP id 5b1f17b1804b1-47a8f90eed3mr29356995e9.31.1765554633376;
        Fri, 12 Dec 2025 07:50:33 -0800 (PST)
Received: from localhost ([2a02:c7c:5e34:8000:2e63:1f69:14f0:7314])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f8f3894sm37853785e9.15.2025.12.12.07.50.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Dec 2025 07:50:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Dec 2025 15:50:32 +0000
Message-Id: <DEWCVSWNA1MN.10IT82HICKO8K@linaro.org>
Cc: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>
Subject: Re: [RFT PATCH v3 0/2] Adsp fastrpc support for sm8750
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Srinivas Kandagatla" <srini@kernel.org>, "Ekansh Gupta"
 <quic_ekangupt@quicinc.com>, <vkatoch@qti.qualcomm.com>,
 <ekansh.gupta@oss.qualcomm.com>, <chennak@qti.qualcomm.com>,
 <srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: aerc 0.20.0
References: <20251209-sm8750-fastrpc-adsp-v3-0-ccfff49a8af9@linaro.org>
In-Reply-To: <20251209-sm8750-fastrpc-adsp-v3-0-ccfff49a8af9@linaro.org>

(adding more Qcom folks to To: header, who asked to send this as soon
as possible)

On Tue Dec 9, 2025 at 7:37 AM GMT, Alexey Klimov wrote:
> Please test these changes therefore RFT tag. The fastrpc testing
> application under linux doesn't work for me but I was told there
> is a setup available somewhere in Qualcomm where this can be tested
> (perhaps android?).

I found time to compile and run the testing application. Currently it
seems to be untested under Linux (mainly strlcpy thingy and no manual
where files are expected to be found), there are also a lot of compilation
warnings.

https://github.com/qualcomm/fastrpc/tree/development/test

root@linaro-developer:~/github/fastrpc/test# fastrpc_test -d 0 -U 0 -t linu=
x -a v68
Test PASSED
Please look at the mini-dm logs or the adb logcat logs for DSP output
[PASS] libmultithreading.so


Allocate 4000 bytes from ION heap
Creating sequence of numbers from 0 to 999
Compute sum on domain 0

Call calculator_sum on the DSP
Sum =3D 499500

Call calculator_max on the DSP
Max value =3D 999
[PASS] libcalculator.so


Demonstrating FARF run-time logging

hap_example function PASSED
Please look at the mini-dm logs or the adb logcat logs for DSP output

Demonstrating HAP_mem.h APIs
Error Code 0x4e : returned from hap_example_mem_dmahandle(handle, fd, offse=
t, buffer_length)

hap_example function FAILED
Please look at the mini-dm logs or the adb logcat logs for DSP output
Error occurred with selector MEM (id: 1): 78

Demonstrating HAP_perf.h APIs

hap_example function PASSED
Please look at the mini-dm logs or the adb logcat logs for DSP output
[FAIL] libhap_example.so (error code: 0x4e)


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Test Summary:
  Total tests run:    3
  Passed:             2
  Failed:             1
  Skipped:            0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

RESULT: 1 test(s) FAILED

But the result is the same for CDSP (was it tested prior merging?).
The same results are for v75.

Adsprpcd works with audio_pd though. Maybe Qualcomm can help with this?
I don't think I will have enough time to debug this and narrow it down,
also very soon I will lose access to the device.

Best regards,
Alexey



