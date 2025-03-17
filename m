Return-Path: <linux-arm-msm+bounces-51587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D21D0A6441A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 08:45:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 499393A6DE5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 07:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 703868F5C;
	Mon, 17 Mar 2025 07:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="SKEvc+fa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3478664C6
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 07:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742197551; cv=none; b=kFKZGBqxn42jxkyqW3uwaugS8TuA4aBUZagphJLJ6dmB8CfJwItOJMFnl8bub+b9MVxkipuHE4maxF230gMbtuH/Dy9d7p54aDnY69OAvjunz3lyUWylmQGH+iIQ3n9wocymQgIAzWXghX+JnkR3KRSN+iokRmLnxGXf1fj87cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742197551; c=relaxed/simple;
	bh=z/35C6OncKImSrzwCMGsv4v7SHuEIwjIRKaGVCMngMk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=JOxxMqbmVRSMV3I2NNRA1QMgsSFnIZID4CPYQqELD4BjQUGlzyYviKyIAS5hMH1co5saozzv9Gmo84/sLkaoByebO1ZzdWGyRY+ymmVcCLVNOkcXgmsBbhh/Np5A9S8LkT6uM6pCp2lJZjRAFU7FzK9f6fA7ohqjwl3Qyceusmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=SKEvc+fa; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e61d91a087so6223383a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 00:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1742197547; x=1742802347; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gl7H7yZOIWFrlEzxdHx2ScaCc87hpAhwNF8CQ1QYBik=;
        b=SKEvc+faLEJJIRTvnn7nJyhuqtSC91fYhPUaM4EqY2EHC+FV2cPcLnlBagyvmEnv3W
         dG69pcspGSax0w4/OXWmYqyo3Oh+qD1h+n8MCf3k2daVrm5Jh82vxgkpgHFAPokeq3Js
         CaoqeTH4hS1KfpGm2CYmIaK8qiisMHd4FwCp4U0823sGqc8UgkDF41QiveiFD+zo4bPf
         04zWvXBLP8z8wVzIKds/n1A77x9A9SGZgB7UEvgWmEX9Sea0lYdFQkOTnkonRi3wNZvw
         51KUI07RWyW+Kct/edAQq/TuyYm3PvALwuZkI09dbcWRzXOBA9X3fDHyC8BrwBRtuZf1
         JEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742197547; x=1742802347;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gl7H7yZOIWFrlEzxdHx2ScaCc87hpAhwNF8CQ1QYBik=;
        b=nuxXXPWIKyX0NNq4YxrTW1GMeZyeHgUJLMmfskTx4GO3SgowOUVNdCZg8acSiLYsq4
         PBRptQtax4teW/018pwAAK6BydsscgSTYYhh7gFqlHZMc/2nIVliMIC35nQEEnRVTfmH
         trGT/ybGFk3Y5e60fOm/rRlaVcZcDFlcpEsxxpF8J+k0oNU/+ZzE0ua4f/jY4hbesuX7
         2BOKUUhagfJ0PGx+4gsFmg/ugOtbPJqp1yNs3wHg6yfpZg9TN0itCnjK/NS+bQJlfTeD
         Qj9TdPvxHczOUDbTavJ/xTALFa60q/I4O0LNNJCRUHQYSj5KzeFgZBm2QMzgA2AXadqX
         UyXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwvbj64nEHB+Ikpo9n2zVQzR6bMX4CidDdxV3+1TQND0t2tHjr3ZWgBuVEST2E6auvEDJEgVqNtEb0/lIn@vger.kernel.org
X-Gm-Message-State: AOJu0YwQybfn+c2gLU3i53rs8UXGtEz7/pD+dW4ZAcgQmTMkVRFBGCxr
	66G9fUcnXtd0CNJZZ9QWNe0UJTt804qdXc2pL8/Me4bxLm0pBdJrfG5izlbOT3w=
X-Gm-Gg: ASbGncvKxPoZh6pLrI8dJc0A/NcRZghUOrKHy17+3BfGBdlP+H2X8ejZL+F0StA0aWV
	VvRrzQHKfH/BrKc3J37eCi9VzFnafsqwkA6LPSghQsqZ/ikzTFX6mDOdUsnsqcLWokB9OT6vpMi
	pqYZA+h6uCRB3a6Anhc7S11hpB1W50O4xqQkveDc2sd+3vd398FStjdRKBrfrUQphu2gWB7vprY
	bcGNTLVrP2oO1Lqandd3fqP79Mh+39tEykbCLhedIG0evH5tw34GoCeK4EPw5k4vp2abjd3aWvg
	0j3vNw0iq/OwspX7u3ZNKNRDq9tRJT9YOEAmsKAShyZWg2tG9g98e6hMsfcMLE0WSXeegApjJ+c
	a5tbF+/JfEKbubg==
X-Google-Smtp-Source: AGHT+IGmNMHuunVdQSgHrKnOfe/ERZGsvr0xj7JwdS+NX5aLfGQnW8CH56uoLVrH9JWD/35XdRKpyA==
X-Received: by 2002:a17:907:2d92:b0:abf:6b14:6d00 with SMTP id a640c23a62f3a-ac3301e1e64mr1158441066b.5.1742197546956;
        Mon, 17 Mar 2025 00:45:46 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3147ed1e4sm623996666b.66.2025.03.17.00.45.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 00:45:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Mar 2025 08:45:45 +0100
Message-Id: <D8IDHJAC4BJ1.WNTMQEJXD2R2@fairphone.com>
Subject: Re: [PATCH 0/2] Some small preparations around CAMSS D-PHY / C-PHY
 support
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, "Robert Foss"
 <rfoss@kernel.org>, "Todor Tomov" <todor.too@gmail.com>, "Mauro Carvalho
 Chehab" <mchehab@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Barnabas Czeman" <barnabas.czeman@mainlining.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@somainline.org>, "Caleb Connolly"
 <caleb.connolly@linaro.org>, "David Heidelberg" <david@ixit.cz>, "Hans
 Verkuil" <hverkuil@xs4all.nl>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20241209-camss-dphy-v1-0-5f1b6f25ed92@fairphone.com>
 <D82FU3SIX5RZ.1Y525GJO0UOAA@fairphone.com>
 <eb06daf1-3cc3-4b31-a0bf-bc450cd0f041@linaro.org>
In-Reply-To: <eb06daf1-3cc3-4b31-a0bf-bc450cd0f041@linaro.org>

On Wed Feb 26, 2025 at 3:47 PM CET, Bryan O'Donoghue wrote:
> On 26/02/2025 14:13, Luca Weiss wrote:
>> Hi all,
>>=20
>> On Mon Dec 9, 2024 at 1:01 PM CET, Luca Weiss wrote:
>>> Since the hardware blocks on the SoCs generally support both D-PHY and
>>> C-PHY standards for camera, but the camss driver currently is only
>>> supporting D-PHY, do some preparations in order to add C-PHY support at
>>> some point.
>>>
>>> Make the dt bindings explicit that the hardware supports both (except
>>> for MSM8916) but also add a check to the driver that errors out in case
>>> a dt tries to use C-PHY since that's not supported yet.
>>>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>> Luca Weiss (2):
>>>        media: dt-bindings: media: camss: Restrict bus-type property
>>>        media: qcom: camss: Restrict endpoint bus-type to D-PHY
>>=20
>> This series is still pending, both patches got reviews and no pending
>> comments from what I can see.
>>=20
>> Would be nice to get it in for 6.15.
>>=20
> Yes this should be merged.
>
> Thanks for following up.

Hi Bryan, hi Hans,

6.15 merge window is approaching fast, I wonder if this series was
missed still.

Regards
Luca

>
> ---
> bod


