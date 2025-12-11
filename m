Return-Path: <linux-arm-msm+bounces-85050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D93CB5FC8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 14:14:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C19083018995
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 13:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D21131282A;
	Thu, 11 Dec 2025 13:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TTGHjlrb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DA726FDBD
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 13:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765458851; cv=none; b=hDCN3DVI/PrMqpuiqdlCO+nsv8yNiYE7aBZndFOSkknQTvGxLV9XPbEpHIQIcV2epLeL9ekG6N+xTVKlzi2daQEDEbsdI+3MLObQ+Qgkd92Zn3xOs5TnO+Pwmg5jwLqEHPvfVWw2SUWiIF3OBc1T8YTHyLzocFgYNGSzMy+vchc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765458851; c=relaxed/simple;
	bh=XIqiZt60uLQglTTo5Pq+ym7qDtMv5j4vzyppbp2/0t0=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=h/p9aP4ayE4u5dAhOFo6UQcFzSIMI8QYOw+u800tSXrhmdm8wsj1+LZOpsI3JunQrT5wPkCMnDdXvtu+vGBq3SKWclEdH5DmQzuLP+AXAZH8PYSvxe/Knr0IlwJ8mXoQ6koIkjE7yk0i7VbdBgsr4tYUMgmg4T038GjOZEhSuL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TTGHjlrb; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so602205e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 05:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765458847; x=1766063647; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cF0nCy3K8ZLd3O9dxWEhMzL6K3i/vuZmXtZs4+t9Dxw=;
        b=TTGHjlrbxPPfSc/q2pzcTVQNTtBju/RrnmMkjAa9kEWZtK3wemL0csefDXvHZIpuKg
         5euXS5wJfy470Iafdwb7lPc7bfq25lBCqn1rWeD+wvOEVAm0IdB4P5vlbjMemZMLlO6C
         niI3GHYR6O02i+S1ytNfaLKTyLKXE/fdmJrqXWOQf1Yl6wSdcdGdYHU28GU3dE3is+k5
         G9Z+YaTjp8SiSgU8/jsEaXN4v1QZITJA4ggYVmT7kmFoItxlEZizXMXwGqdJC+heDjOC
         +PZBkW7qI5uSxFYkGP2yQwOnm5PVNjzy5V3VX08DaQdeGdn1XYAL0M885+I/DRIktZSI
         JdjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765458847; x=1766063647;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cF0nCy3K8ZLd3O9dxWEhMzL6K3i/vuZmXtZs4+t9Dxw=;
        b=d+1RXQVvYnNoE5iskiC7fK9YIWx3/PSgtc2ix/WyUTmYpP0ft5tpL6OSJw8QZA3Rko
         oe0HgUTyNV4i91mAKDPKeZeQNFspIoqYGUlgXTSaDgb1v0Bcn2uQoBCD6GO8TJAts+RD
         eQzuhneBLqb2nSDE2oQrSt2GCWoCZJ3RR9jN5FHGR+HUFWWPV9919IzS8Q8pCMYXsmsH
         lg82NvFCWDvztvK/C3M2eOgZ1o7VdQ5p/quEMjNMuknHcMhHLbGMvz84qFYdr16ayHWJ
         PUwBF3ZtIw4oFE8ohWp5NYRl3K6m7zYds2BzzuUfc9+s+/YAOiXVnLWdwF/EYnrlizs6
         axSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUn+Of68pXSUuidqR1oQPv6K8qrxARHUW/d6mf+b1fGZDzCx3TQn3KWH+mhqPSKLjKSUa/WlZEan8bFE7Jd@vger.kernel.org
X-Gm-Message-State: AOJu0YxYYQqTb7ASOw2w53Gzp0Ki1SDEWjKJT50rOxWVz5SUejaMq2ds
	GmvvM/8DRpZwzfPwLC+29aYr7VhmggyCl7EvKRcBatiU9GWO3/j7te6XZAh3B6WBsbM=
X-Gm-Gg: AY/fxX4i8RXzg0OXOTQPtrMI2I4Jyd/wd7dFqxdD+uoRg2carK+4N/DZmT5VYeyOfUa
	XGTL8yVdwQlLTseL+pVXkscj2zTCWmZ/lMWSR86d50RwwhUpQwoox8oH7fbXpyYOuONWJ7gGrN2
	0XAprm7zk3kzTUepsvx/Tdj29p6J8EoEUn6TfAQjjAL/nkU5hb3KsFxfjld+VhI4CheF6m914m+
	oAVDGyxL3SjNt7dddA0vTvEkHGTqBR+vLyukP9uYTcuCcFCf0Wyuymi0x14dQhrv/FT/UJ7aqFC
	6ef1ntU/SO13gVzLmtXcme/NMvGE6StOys+MHtrUkmtkuROQpDlr8Mi687sfttUQ1gu+Egb79V7
	6QYd6EB3REPUDgxMJPzsbZvtb+Pfp3T/fL04we3inthdFYN1ja84VFm098vlRaZ1PmCqfJslXfr
	NVIYlivllViW8PAJok
X-Google-Smtp-Source: AGHT+IFuFpTFsvxTJRwslx5ZMVgnCZWiNXSiHVXO7iLSyGUOA6ovHk2vIf/10hdCpVsmTmaoDOpjWQ==
X-Received: by 2002:a05:6000:25c5:b0:42b:43cc:9827 with SMTP id ffacd0b85a97d-42fa3af896dmr7158361f8f.38.1765458847497;
        Thu, 11 Dec 2025 05:14:07 -0800 (PST)
Received: from localhost ([2a02:c7c:5e34:8000:c186:ec41:4ac0:f434])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8a702a1sm6260871f8f.13.2025.12.11.05.14.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Dec 2025 05:14:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Dec 2025 13:14:06 +0000
Message-Id: <DEVEXHI9CEFA.19RL3BXTV8E38@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Vivek Aknurwar" <vivek.aknurwar@oss.qualcomm.com>,
 <sudeep.holla@arm.com>, <cristian.marussi@arm.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-arm-msm@vger.kernel.org>, <mike.tipton@oss.qualcomm.com>
Subject: Re: [PATCH 1/1] firmware: arm_scmi: Increase MAX_OPPS to 64
X-Mailer: aerc 0.20.0
References: <20251014073454.461999-1-vivek.aknurwar@oss.qualcomm.com>
 <6af5945e-7d5c-4596-ac42-c5898b4c49b7@oss.qualcomm.com>
In-Reply-To: <6af5945e-7d5c-4596-ac42-c5898b4c49b7@oss.qualcomm.com>

On Wed Dec 10, 2025 at 11:28 PM GMT, Vivek Aknurwar wrote:
> Hello Sudeep/Cristian,
>
> Just following up on this patch. If there=E2=80=99s anything missing or
> needs adjustment, please let me know.

Vivek, please avoid top-posting.

> On 10/14/2025 12:34 AM, Vivek Aknurwar wrote:
>> Some upcoming SoCs define more than 32 operating performance points (OPP=
s),
>> exceeding the current SCMI protocol limit. Increase MAX_OPPS to 64
>> (next power of 2) to support these configurations.

Didn't touch for a while. The way it is stated confuses me a bit.
Should the value defined by protocol be updated out of the blue?
Should the protocol (defined by spec) be changed first?

If protocol changes, then should the version/minor version be
updated/added?

Thanks,
Alexey


>> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
>> ---
>>  drivers/firmware/arm_scmi/perf.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scm=
i/perf.c
>> index 683fd9b85c5c..2249ef7fe790 100644
>> --- a/drivers/firmware/arm_scmi/perf.c
>> +++ b/drivers/firmware/arm_scmi/perf.c
>> @@ -27,7 +27,7 @@
>>  /* Updated only after ALL the mandatory features for that version are m=
erged */
>>  #define SCMI_PROTOCOL_SUPPORTED_VERSION		0x40000
>> =20
>> -#define MAX_OPPS		32
>> +#define MAX_OPPS		64
>> =20
>>  enum scmi_performance_protocol_cmd {
>>  	PERF_DOMAIN_ATTRIBUTES =3D 0x3,


