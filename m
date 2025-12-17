Return-Path: <linux-arm-msm+bounces-85492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B841CC775C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 12:59:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BF4E3011A59
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 11:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 505A033A03D;
	Wed, 17 Dec 2025 11:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xFX8OLs0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4841337BA1
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 11:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765972601; cv=none; b=AZ2qgq7322Bc70pNSFaUunE9NOa4bbYKwi/E+3KuM8HSnWOUN7ayWs0GLMhjSIZ4OuQButs8mlIWkTgrGCniH+UUpeonKRLdJ0y+dBhBbIpO5SDIqCDeCrm6kt1KqSaccIWZlh/4+8zw3tKYZiK0DtK1RVTMkNERu+hV62cQpOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765972601; c=relaxed/simple;
	bh=LCsPsMthhRhWdpniYOj1raGpGSTOo0RdpLYwMzUCIwc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=HxYzeSoNwWxPIULpHIVCG3lkht6nXydbyrmsT7kurP7AxQZMokHUY8pEY2/e5jFR5BM48b/15k1BaoZRKw2suHu+sa1qTg0LyKVr+37sRDRd2seIri13GnVULg6lhAV3RbnQM80Q/hPFYIFAHntW1scXXQJbWsLS0nKcO4BI7JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xFX8OLs0; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4775ae77516so67205205e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 03:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765972595; x=1766577395; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8twQrn9oWP06T/YrQb7aZd3MfFftG78xy47TZzvNgo=;
        b=xFX8OLs0nli5+HbQh+Yw+T4GxLaCJbra21I4Xg7mXV0ME1ESq0oRTaLYdVz1vy/h6X
         lyvkZMUlqPSfrd0UOe6sHBtBrg1BuvfuC8Lu+wAdTUhjfUOZDZ9EfZsBq48mUhby/q7V
         mfBjzzRERMcucUDmxFN4ZTOH+e/PffyVxuFriMjTOKaPpjN/u4XVI/4/DAbLqWj31SKR
         NiaEEJAypztdYV+KYZlKc+yvHJpVk/Savo4mnp58VbVquW4xib/d/s+y1z8GQhFqncm3
         Ghjlhc0GJH73dnc7P5eOh5Gg73FCkgv38PJS6Y53hrA2SGUU7JpYKIJdOvfI1f8iiQvL
         f6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765972595; x=1766577395;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c8twQrn9oWP06T/YrQb7aZd3MfFftG78xy47TZzvNgo=;
        b=GsSdS0vVFkoYfq3Y0OHFkEInt4mnt2gca04UpbIgWMXtjq1ITmHeNgfcZ9jHNKuRgc
         RT5EYmY0iTuMMy3YX1a7/qpqTB4vBoMiLXYjRSpq7NQcFIL6pp0VlLQAYkOVbbivkBlN
         yo2IthkLMQxb8NMiNnknJ19xtYd8leK5FUA80LUlW09Zbt3PW5iclbioOKZ/ZkLhHGp+
         8VHSpWPiYD5J+9mM2QaPbtNnO2hyd6vrX64md0Zi/th73coX61e8urjNnY8+KOhF3/3a
         CylKiOqMkhSIk1FUkUGANny0SxbkPGOYAzwmwQF4atkwqGyxWOd00PJmBC66kqOJAajO
         dt0w==
X-Gm-Message-State: AOJu0YwOrw0kGL+ZLqgsezU8sBy0Rh2k6V3RCvgp/R/IL0DHa3z40Ea0
	tnPanA1bqANs4m1sywmOAuBPjGqybt2hNsWaVyY0l0PeIUgbZn5Ti5XCcNYfr+y/Rz4=
X-Gm-Gg: AY/fxX7oMuAVGKu7TbbymBTLJEylA2b1qY5mopwZTIMhx0H16NUw/Gy9hRsdLD/55Kb
	54QUJywp9upOs1+RcNKv0b177x7SUjJ6b643p7K5CTDoelmMosw5jHhgkpT+qACqvStW0tH1Q7E
	suEy4p1ijirlSmlVLdTa9PmUJp1uZ36CUzYvjaY9HuRVOtGjGo0oerSNlmhFxNXAXDXiEJ+LHgy
	aTxIXtU1axpJqje0+IvD4ujtmSc5vC/ur9WoPJrV8gcyqQOSFa3VeBOjWWK6p5B54DikLEIjUMn
	um8KHwlvsJe1AOV5QWlBbWaJP+ucyKs/PiVJkTkQiE/XQC/DnMDzSOXXDGENEeRvHyLhBBMGvrW
	hCRSlhdZk0ltajQNVatHSmwGiAZNSkeCQZAZZUi5zf2hNfOuSDmPkwA1AldIPnWKl1VTPq+2TC+
	kMsZ9oj0E85u5vbiZpsCNzqOtZy7Y=
X-Google-Smtp-Source: AGHT+IFX1xK5g0aYAzZgLBSaGqkKv/wF08JTgmfJ7rKpn2/gRhVTWMpfVN3s96F1hmGc0zqqANlL3Q==
X-Received: by 2002:a05:600c:c0d1:20b0:47a:9560:5944 with SMTP id 5b1f17b1804b1-47a95605a79mr101572855e9.34.1765972595622;
        Wed, 17 Dec 2025 03:56:35 -0800 (PST)
Received: from localhost ([2a02:c7c:5e34:8000:95b6:94a5:9a2e:e813])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4310ade8063sm4395318f8f.23.2025.12.17.03.56.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 03:56:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 11:56:34 +0000
Message-Id: <DF0H1E4RAH0K.16WZ8A8TJF9WV@linaro.org>
Cc: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>
Subject: Re: [RFT PATCH v3 0/2] Adsp fastrpc support for sm8750
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Ekansh Gupta" <quic_ekangupt@quicinc.com>,
 <vkatoch@qti.qualcomm.com>, <ekansh.gupta@oss.qualcomm.com>,
 <chennak@qti.qualcomm.com>, <srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: aerc 0.20.0
References: <20251209-sm8750-fastrpc-adsp-v3-0-ccfff49a8af9@linaro.org>
 <DEWCVSWNA1MN.10IT82HICKO8K@linaro.org>
 <be83a344-4345-4417-aabd-39565f76dc00@oss.qualcomm.com>
In-Reply-To: <be83a344-4345-4417-aabd-39565f76dc00@oss.qualcomm.com>

On Tue Dec 16, 2025 at 12:51 PM GMT, Konrad Dybcio wrote:
> On 12/12/25 4:50 PM, Alexey Klimov wrote:
>> (adding more Qcom folks to To: header, who asked to send this as soon
>> as possible)
>>=20
>> On Tue Dec 9, 2025 at 7:37 AM GMT, Alexey Klimov wrote:
>>> Please test these changes therefore RFT tag. The fastrpc testing
>>> application under linux doesn't work for me but I was told there
>>> is a setup available somewhere in Qualcomm where this can be tested
>>> (perhaps android?).
>
> [...]
>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> Test Summary:
>>   Total tests run:    3
>>   Passed:             2
>>   Failed:             1
>>   Skipped:            0
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>=20
>> RESULT: 1 test(s) FAILED
>>=20
>> But the result is the same for CDSP (was it tested prior merging?).
>> The same results are for v75.
>>=20
>> Adsprpcd works with audio_pd though. Maybe Qualcomm can help with this?
>> I don't think I will have enough time to debug this and narrow it down,
>> also very soon I will lose access to the device.
>
> Please open an issue in the repo with the above details so the FastRPC
> folks can hopefully help sort this out
>
> https://github.com/qualcomm/fastrpc/issues

Good idea. Thanks. Done.

Best regards,
Alexey

