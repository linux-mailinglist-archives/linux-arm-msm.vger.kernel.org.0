Return-Path: <linux-arm-msm+bounces-44765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1494CA09907
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 19:01:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0748B16B6A1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 18:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BE792144AE;
	Fri, 10 Jan 2025 18:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x3GXUeur"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D4F213E6F
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 18:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736532090; cv=none; b=QSSdoXylWTAoonKZAFBShodulvFw4w5DZBxU6P9o/vIEPTLS0RTaou5qN3nBn3KgXD+49ToDIUR5aZqCN8piH0PSnBh3NLAp90oPZW6AVDGRAaUUcsAwhRyjlnNrn1Tu/DDmURhUEjBiVYDYXSx3z9RouREueW9pbV1LGJKUCMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736532090; c=relaxed/simple;
	bh=X/xJXLWRnZaRfOEQYC73Y9UeYFgKDxpmErxZMkgVd8I=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=i8uw4BuSXokGhsYicxyANJyoJibY3w4jVx/Sbn1C9SCzqb0Pbe5yYEteamrfMI4DkTcXucsSAq/pV6sJ7JFATxu99TFMshVmTNfJ4cMpz2G/KjaXygM1pb3yh5CtiN/etHXIRAseJFBJOGLWSitnjNRrszNdAatxwhNpXlRZmMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x3GXUeur; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53e3c47434eso2247644e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 10:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736532085; x=1737136885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qa098uKBIsYz+nXVCSydWRW4Agd+ejthyj8Yc9INVd4=;
        b=x3GXUeur9xbAI9W+myQfwH8kiePXpYNDzC0jQmUJdcyL5o9jao7bcXE5JrNiXJkZUs
         zw1bIeFYsNvG1NmMuzLV/yVqqhLYNh2zibk0QkGwJmHMcQ9XUKug5JMKXKJRNujxKxxn
         CVLAVK7QZ66x46ORQGG1RhVXv+HfnZceN8SlH1ifwTh7SmbFOCQv0/dGpB5nIYUxhy/L
         KQAb1DVZousajgOlrvHGNowP+siwYhsWVP3o4oxS35pF5rcIxBjYLkkB17EUGTAWDn+G
         9QD6A8BudrimjKuAts93dC1+yWF/mv45tuO+oX2W4sxEkfWs0nsYHJoGm79I/6/ThVSa
         O7ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736532085; x=1737136885;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qa098uKBIsYz+nXVCSydWRW4Agd+ejthyj8Yc9INVd4=;
        b=vx+kji9dHzxlmtYYcoGjioJAb0ZNEt1VXUKiEVYNLZQ9Y7FHULvQt3HzWimWKATEJU
         Yla8LjAZ2Fk1zerrDEUA+ZL+rMn4g522P151uWFh/bxDUHyugiylFpttY0k0rBIR2Wx3
         2e0uXc0u3/wlFGJTU2msd4huARvJ3fzrRyvOxzABv+xdtztoZLwYAZVVD/qXa7F6B02f
         RDlKmeFsPjna0sF1mqXlKXtqKQMI8sSOQe7mZnYCZKlYc9rI7j/qIweazAbzxK72kzk4
         LbVNQphtsUC8QIv6ovKhsfUYaRdVIFJJ6jH990BzXybEWxGes389aDMsUFnb9JMq52pb
         XrLg==
X-Forwarded-Encrypted: i=1; AJvYcCWHZVfIxQ3oUpEoUmXaqUEEsTsDhGzByiJcTLpccOsVX62VwrlTs4wRSXqYXtrkG2UZUakjxAQQ1cTex20l@vger.kernel.org
X-Gm-Message-State: AOJu0YwniA2wqceghsKBUaZNqisjU0uEOCCp/L243kYhihzLBE711Atj
	mosERiDWfjVQg55gb9F6TTJzEAU5625o9630ATStKzXdSY3ifQvJFiX12hRXCZw=
X-Gm-Gg: ASbGncu7zGP5vhJ4zVyH2KPjcW7xLtBvW5ZyHX5fDO/Yp9J6kSMMXz1D1IUjJ1D4Jso
	qGAbC5RuB+AaTtemcmG5GszglPXoB9UR9IBk5T7iO71rM0bhhhCS4KY2TWtgz8gb2+ZJdr+ikfk
	VpXgrY1zeXv4qZTZX9KTR6xL1EXUjdbbPglxPlAFIHiCXyARAyjUFIYhYOeP1h6J2UfOkgmqBF+
	CNVI9W6+gn3oDiLaLOiYd81vvCfyRAuall3FIrZPLf50b5n4ltJIgNRIUsms4mvN5gipZvjJmox
	Eq4jUrFXJ9Y4YjOgXkRFMg0H
X-Google-Smtp-Source: AGHT+IFmu3hd8d6cJUw+lmlf9wdZPpV8V8P9orM1fWUQTJ9Odmo2pI0A05q2IP43SQW5x7AJCVDQTQ==
X-Received: by 2002:a05:6512:2826:b0:540:1e5e:3876 with SMTP id 2adb3069b0e04-54284817b78mr3898054e87.52.1736532085256;
        Fri, 10 Jan 2025 10:01:25 -0800 (PST)
Received: from [127.0.0.1] (85-76-141-224-nat.elisa-mobile.fi. [85.76.141.224])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be54795sm606491e87.101.2025.01.10.10.01.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 10:01:23 -0800 (PST)
Date: Fri, 10 Jan 2025 20:01:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>, Johan Hovold <johan@kernel.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Hans Verkuil <hverkuil@xs4all.nl>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 =?ISO-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 Jianhua Lu <lujianhua000@gmail.com>,
 Stefan Schmidt <stefan.schmidt@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v9_27/28=5D_media=3A_iris=3A_en?=
 =?US-ASCII?Q?able_video_driver_probe_of_SM8250_SoC?=
User-Agent: Thunderbird for Android
In-Reply-To: <24334fb8-4d83-eb06-aee3-dfe1f8e4937b@quicinc.com>
References: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com> <20241212-qcom-video-iris-v9-27-e8c2c6bd4041@quicinc.com> <Z3_nCPk_g8znto4A@hovoldconsulting.com> <64f8bebd-35e1-c743-b212-e1a3292bade2@quicinc.com> <Z4EuiPEw8mvDQ2gv@hovoldconsulting.com> <24334fb8-4d83-eb06-aee3-dfe1f8e4937b@quicinc.com>
Message-ID: <552972B8-1ACA-4243-A8E3-8F48DAF39C5C@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 10 January 2025 19:30:30 EET, Dikshita Agarwal <quic_dikshita@quicinc=2E=
com> wrote:
>
>
>On 1/10/2025 7:58 PM, Johan Hovold wrote:
>> On Thu, Jan 09, 2025 at 11:18:29PM +0530, Vikash Garodia wrote:
>>> On 1/9/2025 8:41 PM, Johan Hovold wrote:
>>>> On Thu, Dec 12, 2024 at 05:21:49PM +0530, Dikshita Agarwal wrote:
>>>>> Initialize the platform data and enable video driver probe of SM8250
>>>>> SoC=2E Add a kernel param to select between venus and iris drivers f=
or
>>>>> platforms supported by both drivers, for ex: SM8250=2E
>>>>
>>>> Why do you want to use a module parameter for this? What would be the
>>>> default configuration? (Module parameters should generally be avoided=
=2E)
>>=20
>>> This was discussed during v4 [1] and implemented as per suggestion
>>>
>>> [1]
>>> https://lore=2Ekernel=2Eorg/linux-media/eea14133-2152-37bb-e2ff-fcc7ed=
4c47f5@quicinc=2Ecom/
>>=20
>> First, the background and motivation for this still needs to go in the
>> commit message (and be mentioned in the cover letter)=2E
>>=20
>> Second, what you implemented here is not even equivalent to what was
>> done in the mdm drm driver since that module parameter is honoured by
>> both drivers so that at most one driver tries to bind to the platform
>> device=2E
>>=20
>> With this patch as it stands, which driver ends up binding depends on
>> things like link order and what driver has been built a module, etc=2E =
(as
>> I pointed out below)=2E
>>=20
>>>> Why not simply switch to the new driver (and make sure that the new
>>>> driver is selected if the old one was enabled in the kernel config)?
>>=20
>>> Its about the platform in migration i=2Ee sm8250=2E Since new driver i=
s not yet
>>> feature parity with old driver, choice is provided to client if it wan=
ts to use
>>> the new driver (default being old driver for sm8250)
>>=20
>> This should be described in the commit message, along with details on
>> what the delta is so that the reasoning can be evaluated=2E
>>=20
>> And I'm still not sure using a module parameter for this is the right
>> thing to do as it is generally something that should be avoided=2E
>>=20
>I understand your concern of using module params=2E
>I will modify it to rely on Kconfig to select the driver (suggested by
>Hans) instead of module param=2E

Please don't=2E This makes it impossible to perform side-by-side compariso=
n=2E Also as venus and iris drivers are not completely equivalent wrt suppo=
rted platforms, distributions will have to select whether to disable suppor=
t for older platforms or for new platforms: Kconfig dependency will make it=
 impossible to enable support for both kinds=2E

>something like:
>config VIDEO_QCOM_IRIS
>        tristate "Qualcomm iris V4L2 decoder driver"
>       =2E=2E=2E
>        depends on VIDEO_QCOM_VENUS=3Dn || COMPILE_TEST
>
>Thanks,
>Dikshita
>>>>>  static int iris_probe(struct platform_device *pdev)
>>>>>  {
>>>>>  	struct device *dev =3D &pdev->dev;
>>>>> @@ -196,6 +224,9 @@ static int iris_probe(struct platform_device *pd=
ev)
>>>>>  	u64 dma_mask;
>>>>>  	int ret;
>>>>> =20
>>>>> +	if (!video_drv_should_bind(&pdev->dev, true))
>>>>> +		return -ENODEV;
>>>>
>>>> AFAICT nothing is preventing venus from binding even when 'prefer_ven=
us'
>>>> is false=2E
>>>>
>>>>> +
>>>>>  	core =3D devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
>>>>>  	if (!core)
>>>>>  		return -ENOMEM;
>>=20
>> Johan


