Return-Path: <linux-arm-msm+bounces-66192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E8CB0EC57
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 09:50:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FC553ABB60
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 07:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EF8B278142;
	Wed, 23 Jul 2025 07:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="S6Gj6Muf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6938277815
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 07:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753257016; cv=none; b=ckts4T2LUCToP/p4y5xMmEC7NT+cpBq7kfE9+VGKBBP/O20ywwWyRtjyW7gkM9jcaKj0wMnd9qCUxOTq0HcZX01xn2EjGY9XIfGzUNZWytyU9QP6RHy1CSUkotz0BBZDZJ1Xr2j+L7Cw8Q3N5bzVfNSZ4NQn6A7Qp4hfnLCpObI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753257016; c=relaxed/simple;
	bh=s2qj4W5nR9VUDrxKDMTXYV/rhF67N9Fs+yw/DNr1OSo=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=SXPGOse1ZbHnOWmIvTygG5UEYqd01FcayYXjhF+UJ+c9a7PKtatXZCgZr4IUS28xqvKaQnXS0W7xsRqao/N6tIAF1N1XdTrRbVlKc/D+6JGgzgjNCvZLDG+UDPdOWdt3tuDWNQ8oQrNM03jRnhfj9pIhzIdMB5EsOLADYXg7nNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=S6Gj6Muf; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-ae9c2754a00so1081503366b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 00:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1753257012; x=1753861812; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yXbXFwg+K/BsGGE3U/llO+SOTqkjirp29B31EDd6IJk=;
        b=S6Gj6MufZogpDpLD6OLyGKZX/hTJuAUAJNpsUDAc8SjitpcO7ixApOaV/R6FMUvHST
         xdEfFa7EWx7RzmWJUSUvk25MKqph6eFmU9HuZeaBTdJ19+3/e0h6eG4SWwCJDdGEvMUx
         waiirmurZmFKL0axF8ccNzWmfgeLCuYXpB6SyuMDtEPR2EgE4mWn42dIOnV8V8+AA3ub
         Up3HcipiK5+uiprTVbJma/b4cYsc6QpfGyX2lg9nmOPWc2SY6HLSl660UM8rlVCHTRaL
         NkYe6ttE+iAidnzJLsHG3rTmravT3xMAgeW2ngDEOlGiCHvsVnGcqhHfW4Gy2+jlBaB0
         SoAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753257012; x=1753861812;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yXbXFwg+K/BsGGE3U/llO+SOTqkjirp29B31EDd6IJk=;
        b=DlxuYAbwGz58McroDrn74MfLqEdsSPkb4Dxhr93P3e2WHwr93yv1WYzf+rsey7UeiO
         uw3ckeyqdBjnpcTVG8clRkuDkUjc2f5xRbch4lENz1zSK0Ijwbm8fCXQJ7aqZePLatyB
         UBtnNkfADsyTsubF0hwITTiW8MSHuLc58lz0eHzPW/yR1ynehK6g/3un4efDapW998o6
         lfJ4yAabStZzvJNmEuOL/sWQeeuc1ChobeAwTAsYYnuDA+VOXhKa/saGG5c9kdjRFSJB
         VTgCAoQoEL1Lo8gSCVUTkgYKVTmKKcs6yluPq9VEM2tOUfWlkc8yxBAF1bxYWRF+1cnE
         N4KQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpcsk4RUd2xfhKOgJ0VmtUAt9BfGLM/sUM/5x4l+xCW2mLIrL7b09HL4n3P9VYLt9SVaH4wxmUyTaAIF9A@vger.kernel.org
X-Gm-Message-State: AOJu0YxzZUWcICp75ixKXA2ioPVQ/FzQKS5lra5OqCn3sSYSe50hXTVV
	QRQOJU0uYpXJRvys9AAFKKpOiBSYd1kDoPcA+hxoUmG68zIF2xWPt+xYoMjYeDZ0Zcs=
X-Gm-Gg: ASbGncuSJNGWOFEDVq3FujyaEBe+kMWufHI9Egv4C/IYGrRA/6T241QfVoWLWOsqJAG
	6UeqUjOh98okOQKxNXUaT/iHPeUqrxL3wb1Tu+BdFPz8NNWREdAHzXXEfwrdNULDg8k8WAp2Lg4
	xIDRxVB5AOyxGYtXWGKakYDTa/q/OzVw7euoPTfCi75WIDNdvmZYRPPenWHvZl00kEMCCjTX5f4
	J2jxYi4AfVsQYWBHbf5w7rx2QyqVqCux9unNNawP+ExeQ/NmfPcIJYS0I3//VDDvizjZWJlY7m1
	7nHDL81Rs5Hhbfnh+mZMSLsIofMCVxNk5o0YMgYxbDPWdoToeH8eK/FOGZwQQRtKFaFmFwDmu++
	50nixjXEU7TIezLqJ7tH06ulcMjPFoOWpbUcXtT2bnUPajEwQZ06r8Zqxc/4h4Kkt2GU=
X-Google-Smtp-Source: AGHT+IHwBbnn1eUxlgv795d4NlYs1iTsVyOVnuelCygX33CjO30R0OB3cx1QUaH2Utrn1rESZ1YrZQ==
X-Received: by 2002:a17:907:986:b0:ad8:9e80:6bc3 with SMTP id a640c23a62f3a-af2f66c2165mr184740066b.1.1753257011912;
        Wed, 23 Jul 2025 00:50:11 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca2ee01sm1007709266b.81.2025.07.23.00.50.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 00:50:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Jul 2025 09:50:10 +0200
Message-Id: <DBJ9QNML12CU.1RONWUJAZHQK7@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Georgi Djakov"
 <djakov@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] interconnect: qcom: Add Milos interconnect
 provider driver
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250709-sm7635-icc-v3-0-c446203c3b3a@fairphone.com>
 <20250709-sm7635-icc-v3-2-c446203c3b3a@fairphone.com>
 <d8955532-9a3b-451f-b5c7-549cee7d749e@kernel.org>
 <DBHKBSK14XHM.E3ZUQMEJKEOJ@fairphone.com>
In-Reply-To: <DBHKBSK14XHM.E3ZUQMEJKEOJ@fairphone.com>

Hi Georgi,

On Mon Jul 21, 2025 at 9:42 AM CEST, Luca Weiss wrote:
> Hi Georgi,
>
> On Mon Jul 21, 2025 at 9:36 AM CEST, Georgi Djakov wrote:
>> Hi Luca,
>>
>> On 7/9/25 4:14 PM, Luca Weiss wrote:
>>> Add driver for the Qualcomm interconnect buses found in Milos based
>>> platforms. The topology consists of several NoCs that are controlled by
>>> a remote processor that collects the aggregated bandwidth for each
>>> master-slave pairs.
>>>=20
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>>   drivers/interconnect/qcom/Kconfig  |    9 +
>>>   drivers/interconnect/qcom/Makefile |    2 +
>>>   drivers/interconnect/qcom/milos.c  | 1837 +++++++++++++++++++++++++++=
+++++++++
>>>   3 files changed, 1848 insertions(+)
>>>=20
>> [..]
>>> +
>>> +static struct qcom_icc_node qhm_qup1 =3D {
>>> +	.name =3D "qhm_qup1",
>>> +	.channels =3D 1,
>>> +	.buswidth =3D 4,
>>> +	.qosbox =3D &qhm_qup1_qos,
>>> +	.link_nodes =3D { &qns_a1noc_snoc, NULL },
>>> +};
>>
>> It's very nice that you switched to the dynamic IDs, but please use the
>> current style of links (like in v1), as the the NULL terminated lists
>> are not merged yet. All the rest looks good!
>
> Is what's in todays linux-next a good base? Or what branch should I base
> this on? But correct, I currently have v2 of dynamic ID patches in the
> base for this.
>
> Also If I send the next revision by e.g. Wednesday can it still go into
> 6.17? Just wondering how quick I need to work on this.

In case you didn't receive my message on IRC, your icc-milos branch plus
the following patch works fine:
https://public.lucaweiss.eu/tmp/0001-fixup-interconnect-qcom-Add-Milos-inte=
rconnect-provi.patch

One num_nodes was wrong, and alloc_dyn_id needs to still be set without
the extra patches from the mailing list.

Regards
Luca

>
> Regards
> Luca
>
>>
>> Thanks,
>> Georgi


