Return-Path: <linux-arm-msm+bounces-77499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 736B6BE105B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 01:21:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6E741A20F27
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 23:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20DDE315D39;
	Wed, 15 Oct 2025 23:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sxstRAqA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFAD301473
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 23:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760570493; cv=none; b=aQgGxwl7FT7Z+tBiED8c4VaVqvbkFVFi28Mz5dQYzY0eBhmNIzzNiacR3fMwe/VpvWPQ5lFERm76Wka6klq4p8L0vztRQB/5HkDZTgTwD/7yiriJvW0A9ZfclU7w3ZKjt4G6pZIBAyY77OZWjsBhllbqn59mqiW0T/6KToBc7FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760570493; c=relaxed/simple;
	bh=YkyMyirxMHvG2HWlK1FfdBUp1DFrDKhIPiRlbbKh6XQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=syGi+Li3dL224V+NmOlY2+PpWHSdULmIfISBPR75t2Awmyzz1nOgZXjzvjQ2x2x7r6m/iUPSwqwpvXtc524k8IikmrFLU0dUCx3phAIzXhFpmUj4c76a3nV99mVyjdTnWlfCMl/ETqpk856Yw0/e9C2BkIZ7SF7CuaVaRkdSE0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sxstRAqA; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-57a8b00108fso26228e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 16:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760570489; x=1761175289; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0B0q4BGZ2XC9IpC6Pjd+pwzTY4I/KdNTGZZcgGIVD2s=;
        b=sxstRAqAblfFYJaynrAU+4p8dvJEYPpEpONe9AIS9BiWsyHEfFg6pwKhURS2EgkxMI
         wmEAXA739rRZtL7fn20jUBdobDp+8YM5Mdi911shWn8eWTg1xEvU6FGNItHA7mZkkmlD
         grlj11hBO31Hrw/NH37rDFW6VqG6rC/ddpLfsu017JCHnipsA+hxLIAlKBVnV6vCR2xN
         D3INQTaWO2PLPKMJQc4hVlivp0Nf54FQlIT0JsZhG0g9NpOfEOq6dUYPlyTUVA2fh4Yn
         incFA7PJeDgrttH2mKZld0dkKsJJCAz/lxPHV+8CLmEtL6W0MNwlVGdIBF9YmFGt8gnG
         2E5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760570489; x=1761175289;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0B0q4BGZ2XC9IpC6Pjd+pwzTY4I/KdNTGZZcgGIVD2s=;
        b=Z2DsvYb/0qVMHswOsdkzY7ahZ72WI4UQhj/e/Mzsq/gWQQ9eEcAMg/EDwTw+HiyLxX
         ugGvMNSqTGPOGntlOQuqxzsIxL2WN10CANn7RRIxwILbjBB9EZcgT68LamngqOsF1JnS
         8ShmbnGOuLCyY81twrK+2TJ+ytWH91aLAJno39Sm0PBWLfAtRLMLwrfP8Dyu+jDxqGlK
         VgPyQ5TPwPMVtMUWbImxwNoO2HNxsaP6crA+nbcpSNsf3lHfkwVMSYr//nGV5eWSOqcp
         p8u2eEyJBHTi2lk16EimCAx2+jr4cjOhQRcxl+ye12puXlve37uDYUTGRTVBpVHpW9Ad
         7ulg==
X-Forwarded-Encrypted: i=1; AJvYcCX3RATU+ONZFIG+r3mbAW1VurqhwZuEeIQv1qeOTH8ym/8cHudrEdumaM2mOgubBdarnFJ+ouZDkDgmL1vu@vger.kernel.org
X-Gm-Message-State: AOJu0YzAF+YLwAxPP27OdFmsBa/jSAKQe3XpU46UIzPh5k+NL7dNFJ6P
	0083Gi8uA9rdW17gVmxibUhpA9PieMCqc+QSrbNZTiX/2fXRy3gHU3RdMTSLtNcwJaI=
X-Gm-Gg: ASbGncuJOxT2aZGk1ja4CV+43OV7Rh+7eC2JbaMzCbdXoZkjkQ3PJrWXcmNFX8DFWud
	uBvIMqTYEGLefyM/GfIbN/1orFHV2+hSOHhiMX9miu7WaSaW0Bk6RcQjecqSoZP0ljEvhBbGtS9
	T8dxS7bdRqS3PA5ccyWCElk1t3qNXMeD+KS+gts3Lneh+FINQFHvOO7ovY+D4OlpiFr9INRmc2/
	oUsYdVMD84K2gFbbvCnHJnvl6wBjuHnOlTLsUbuR20LQKolISsiMSBmFkHzL2/10Up1Bgs0EWNB
	BV3Ihzi6HNKvwmE5kXlsvh+LhZXXh7NB/+x2CwQHXZnYeCCtdo2h+IGueddSqNJLhdwaJllSIyO
	V+2qaeoeHrADTdMNkrzinrJyS9NaVsLNrBj/NgWj6EiElIuxpz0QHqI79e+DeIYu83hRfkECwGT
	zkUpmshqUqNJYk3VwP7YXEgRMejJjOwG1SLI96Vfzu90odZwhaOME1IPwlwjw=
X-Google-Smtp-Source: AGHT+IFsezevTFX7VRsMPmvaC7e3rUHL6zRBQobMDgZpbCMrsMUto/Rrsx7K6ihOpaTOS8S2VJhQLA==
X-Received: by 2002:a2e:a543:0:b0:372:79e8:ea7f with SMTP id 38308e7fff4ca-37779707285mr8426581fa.7.1760570489271;
        Wed, 15 Oct 2025 16:21:29 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762e77ca04sm51213281fa.4.2025.10.15.16.21.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 16:21:28 -0700 (PDT)
Message-ID: <47b4dc34-ae75-437f-84ce-84558226cdeb@linaro.org>
Date: Thu, 16 Oct 2025 02:21:26 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: qcs8300: Add support for camss
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20251015130130.2790829-1-quic_vikramsa@quicinc.com>
 <20251015130130.2790829-3-quic_vikramsa@quicinc.com>
 <b4207e22-8d9c-4223-8b28-272d2650661f@linaro.org>
 <ca8189d0-a518-4716-8b28-e36571cbba5a@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <ca8189d0-a518-4716-8b28-e36571cbba5a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/15/25 22:58, Bryan O'Donoghue wrote:
> On 15/10/2025 19:49, Vladimir Zapolskiy wrote:
>>> +            power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
>>> +            power-domain-names = "top";
>>
>> 'power-domain-names' property is redundant, since there is just one
>> power domain.
> 
> Its a required property of the yaml.
> 

Technically it is not a property of the yaml, but I think I understand
what you mean here.

As usual since there is no users of the previously written device tree
node rules, I believe the documentation is still flexible to be updated
to a better shape.

-- 
Best wishes,
Vladimir

