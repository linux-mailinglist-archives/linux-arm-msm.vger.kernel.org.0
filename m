Return-Path: <linux-arm-msm+bounces-65852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D67B0BDED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 09:42:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75A1B3A369B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 07:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01A6A284696;
	Mon, 21 Jul 2025 07:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ZHmo0Ofm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD7C28468D
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 07:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753083762; cv=none; b=p0Js7CmqO798jjti2mENYdlbPyek94xB/ba/S6JcXT+R18TBDPCoKQ3KKPpuzxvgLMrb696E/uZbS31NvumMMy/02jQ95t4jtbepu9wjlmICd6LrQxF4wny2nKE7NKiiNnJq54n//C+dZx+2XZQEmD/H0V5HoQyjL3mi3ogX2J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753083762; c=relaxed/simple;
	bh=chzQDhpRR0KkFFSvGWLDbsXZDi/1ZGpp4j7nqK/5mxo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=gkrEYZxh2lIYZJLsiTy1OUCsPUnGceeRTdYF1JpgJiPafrDSpDeCZCSxXRvp5upriwG+rciDsgaxYzFrU7BovihP/PuVHuokLt3WZ8caJkeUCHXP8d0932vufkHa0Kww3vBYRYedhkmqMEnNHKK2CpBhqYCwsab7cdSOS/t0YWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ZHmo0Ofm; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ae3be3eabd8so768795266b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 00:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1753083759; x=1753688559; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Jn2uM1C1hodxQz3Up00DI8ehhdUTfz2Vy9NLN+SJQA=;
        b=ZHmo0Ofmh0GkYtbtnBrkBXAph6ck5S93mdvYHgMT1Cne2rvnNOQkE27CEbOH1xWS/7
         NhgvCVGwAxxwAxh22dRuKuoulqNM/d/FsUKcb1VemcCWyMYH6QgERk6Q5tOpz62rJ3QC
         zIhQHa5gKeToe3Un+4ndbomLZDjnQMxtXkTO5MWnxxlbEnNeq+td2/Ll52U7KBTMz+Sc
         +aVIqO0NTLIbMfJVE6AyOWI25bcEen6y3VcNIEKh58NRUzqIG5si1ez5wHVgcp2YseYr
         vXxugd/AKgiPEnver6TieHzQH8MHdowWSrW/lf842esl8Y/aPjTuhRbtFzirf+5gDuRd
         nZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753083759; x=1753688559;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/Jn2uM1C1hodxQz3Up00DI8ehhdUTfz2Vy9NLN+SJQA=;
        b=MxE9AdCpKxzJjZJyQT0laLG20WbtFTOA1J/p2OY7EqWeb++E+IzGwsygsN0kHllV5U
         c0DhLSD1LzJdjmeD7ExDcPQqVUvO5IK05fsnQbVBE18kjumKP4QWiQpyqLf6RPVb5eVy
         DHg55GFQwLToVGD3TeHHL1pM5oS0WoPoW1Vzq3mlk7HCwPdE1Fefo4s4A8hY0jPUqeSe
         A0TC+3HPXU5dwjgC5sdWipaaNkg12QAm+MRvFkXnOmo6KofHBsLY2O8/eTFz8kQTUbcc
         tC0ppgEMQueIDc88SiYCD59NjR3Dg++kMVD5FrrTiuHZ6+QzWefz66/fy/zS1Os1K7J2
         4kvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfFuGuge9XGSmLmiYRPedHwdDTmyoZKWZYaO2G8RkXM8Z1iBMlIqISzBRMGSAbock7yTULm/rNcKNjnmKv@vger.kernel.org
X-Gm-Message-State: AOJu0YyABUhY6j42Mqk/3EDzpRVIn5SoA9eNT1MkIICxE7id0UlHUGlC
	E0+gNzUtJ+IX4Rlf1XAAptm6WOJ6f+lCFQJoQpObmdN3Xf5KQii0u/3BP3v60OAkW4U=
X-Gm-Gg: ASbGncus/LdNxKij4Z0Da3/FFW5ZgFGU0cmqM3XtA3QgBAF924jS5NFPsTKLPBzuKqQ
	/f1IvvXmd7XGe7GzLGPabvVw+qOAvRnZyQ40iDK91SE2qh4Ss2E+DvBMbXKfXBYpNL+uNM2VMqn
	tt1X3IszrUS+SudnqSPeHNWUA+Cikg9LT3v0n97hNYcXEaWuGg3V2mFuE46lCcw3WorEHMQQJ1F
	NjZ9YsMtImcIXDX5NvkrZlhD2TFPOp9vynREzMZXf8nZCOtNENCVnOzJ45q8Xp6m3dOyYbXSwsa
	fbEs1W34M8mwMpSCPw1RCxISfBBvrEQZbUi/fB7Y7OmG4FrVN2QL70rD/gP0MjuYfwZkQ+F8TrW
	P85y8QnEPT+P8JfZsbMVwfUEY3DBkVNoYyMk5KBqwVSXhyQ5jFN38NzG+Z9tL4NmAkYxInLzvr4
	jrmLa93VgSM5fw/Cw1gFwwXNQkxHP7tCA=
X-Google-Smtp-Source: AGHT+IHojokpIKOVzO2mTGfd8U+xB3sxarTMHuXH9C3us/pGvkjTIHvaL7YhUPwGxvFGX/BiGyYmDg==
X-Received: by 2002:a17:907:a901:b0:ae0:a465:1c20 with SMTP id a640c23a62f3a-aec4de61a29mr1564976266b.14.1753083759251;
        Mon, 21 Jul 2025 00:42:39 -0700 (PDT)
Received: from localhost (2001-1c00-3b8a-ea00-c4de-d39d-05f4-c77a.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b8a:ea00:c4de:d39d:5f4:c77a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6daf4579sm615655866b.77.2025.07.21.00.42.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 00:42:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Jul 2025 09:42:38 +0200
Message-Id: <DBHKBSK14XHM.E3ZUQMEJKEOJ@fairphone.com>
Subject: Re: [PATCH v3 2/2] interconnect: qcom: Add Milos interconnect
 provider driver
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Georgi Djakov" <djakov@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250709-sm7635-icc-v3-0-c446203c3b3a@fairphone.com>
 <20250709-sm7635-icc-v3-2-c446203c3b3a@fairphone.com>
 <d8955532-9a3b-451f-b5c7-549cee7d749e@kernel.org>
In-Reply-To: <d8955532-9a3b-451f-b5c7-549cee7d749e@kernel.org>

Hi Georgi,

On Mon Jul 21, 2025 at 9:36 AM CEST, Georgi Djakov wrote:
> Hi Luca,
>
> On 7/9/25 4:14 PM, Luca Weiss wrote:
>> Add driver for the Qualcomm interconnect buses found in Milos based
>> platforms. The topology consists of several NoCs that are controlled by
>> a remote processor that collects the aggregated bandwidth for each
>> master-slave pairs.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>   drivers/interconnect/qcom/Kconfig  |    9 +
>>   drivers/interconnect/qcom/Makefile |    2 +
>>   drivers/interconnect/qcom/milos.c  | 1837 ++++++++++++++++++++++++++++=
++++++++
>>   3 files changed, 1848 insertions(+)
>>=20
> [..]
>> +
>> +static struct qcom_icc_qosbox qhm_qup1_qos =3D {
>> +	.num_ports =3D 1,
>> +	.port_offsets =3D { 0xc000 },
>> +	.prio =3D 2,
>> +	.urg_fwd =3D 0,
>> +	.prio_fwd_disable =3D 1,
>> +};
>
> Thanks for adding QoS!
>
>> +
>> +static struct qcom_icc_node qhm_qup1 =3D {
>> +	.name =3D "qhm_qup1",
>> +	.channels =3D 1,
>> +	.buswidth =3D 4,
>> +	.qosbox =3D &qhm_qup1_qos,
>> +	.link_nodes =3D { &qns_a1noc_snoc, NULL },
>> +};
>
> It's very nice that you switched to the dynamic IDs, but please use the
> current style of links (like in v1), as the the NULL terminated lists
> are not merged yet. All the rest looks good!

Is what's in todays linux-next a good base? Or what branch should I base
this on? But correct, I currently have v2 of dynamic ID patches in the
base for this.

Also If I send the next revision by e.g. Wednesday can it still go into
6.17? Just wondering how quick I need to work on this.

Regards
Luca

>
> Thanks,
> Georgi


