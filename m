Return-Path: <linux-arm-msm+bounces-85060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F05CB61A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 14:54:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 031F93032FC1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 13:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA6402C08B6;
	Thu, 11 Dec 2025 13:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DN/ClVNK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75D3281508
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 13:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765461245; cv=none; b=O/JN1csOLepVbwFwzgGNraZsyr3aQtie80HSarXKXd1Ipe3tyahXEppHxtwm0iqz13HizNaMT70NnSs9SN67FLkYBvFQY9niy5pIqoq20dCoknOzYFeKZnvZej+qKTjs33P/uYeUVW3BzOZ3hlHEXgBferQ0ULVk4A/NgSUxW3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765461245; c=relaxed/simple;
	bh=LaMjw6WZXgqTfqGi1P4GQQSrO0jGN82EJsNdVi5wyRw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=YAwO/q0XsyUM7QhWxJT3fW06ge/IeMikvFmuDULZil8pk3SaarlIhymO/TaPT9zjxKJOYUziTYOtLupf3Ugh+UoPVAecCDnHIqPu45EkLng9PuWeJFhqeycRl/Os91oCdKuwwh3+kel2F2791GC7+T4LsdGSCnxPUpZ4xav21rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DN/ClVNK; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b73545723ebso20661866b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 05:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765461242; x=1766066042; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CIXIt+IFeFpXZPRj0PX+jv/KP6j4AjZrxFu7fBe+lEU=;
        b=DN/ClVNKRk1BAy7P7ctmfJ7w6xJwFxVfnuxwcmkLkn1OzRidlzxLvF1fQ8ceCtOc3c
         8ksEovZKRkw4voN8+TCUCr2o1On7a2VMvrer5aRkr+IDyY9FEA2cdKqp7XYPovsYNJmU
         MkWLy6YlDQMejE1o75xMNSLJg5HBxrHDsRIfOiqeIQQM9fk3HE1EdXlNsbybBGyt6SXc
         IvCzsg7tvhySCB7J1JMhDQKocoL42ixAaT5FjSkYfluO5KoS4y5xU3vl9wEmoX3ahHPM
         m7AnfAQR9BKVV1Lmv4zSJV6hOTKEML7PIH9VLNwFolIY2AVTax7Cv0fgobGrz0tK5HFC
         ADLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765461242; x=1766066042;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CIXIt+IFeFpXZPRj0PX+jv/KP6j4AjZrxFu7fBe+lEU=;
        b=efmTlHZyeg1hGx55QGxpb9/BgqYzPwlZvXtORBLn4Y1lDUBRAJ/FQfskECKNR2uCoY
         5z74xScV2tc5PbhWTA/jD+e54E/rve+GycwAfDEG+kyUc/n6ROUsXqaYCb5i0Ow0yxHG
         AgcdOOy6z4h3J3i9hNgx9QL7qkSDfVLViBWd5wuLBXGP6bG+tOSjstTaGnOSWm+NioNA
         lYxLYzklhvCAvY5FjoiiP5/qh0yQwYFWtFLiSOJW+PKSQhJgeKWYycUE5szxdCBa0HoU
         GQ3nfBc6qb43KTxIX6qyFXg9UVk1WFKAK/VDxeR+Zgy2ZBS6TgaGQPqwn+/0t7tNUOC7
         XnXA==
X-Forwarded-Encrypted: i=1; AJvYcCVhtxLHajMVbqvOzsWys+Kz8F2NMLPEkm7bRTxecGAXGMWMsGZ5iQHGd4+tZWyP9TWajz5j1efkjN27F8Yj@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj7xkP78Q9yVdS8ioGOmDGVcvk9n/F1Zvj4/cwGofuQZxjS461
	5Xs0DTPyO9rBh1v6/gB2iEAUdtce78cpZ3GBqWFcn0mIUJJ3jtYGiYHrN/QcAzj6kTI=
X-Gm-Gg: ASbGncve4IUMHf9+pQFGzJIm4886iCoxGIUC0wjRAAblyUctzGVaMjopzURJw61epId
	TgzrvinovU7lXO/vrKZUKysYSyOwkZoNiE4NlG3Lo2WRAC49ksEnIvUSP6d2bzSONQLwXutdieb
	2ya8xnBdW1VFW1TY0SSrrChGtr1ePDmuguAGjr48v+pal+1tU4qow7pq1KWAKvIr2xTnDg95DeA
	DSD8ZQjyXtrgG5o2OuTezBFVWQj3fqrNOoqJs5gA7ytIyW9Izp2JMwsQsfMPMVjWCLz68yHhH8P
	CNrg/dxawlJ5/dtt6xqiDHXoaFM+KdqCHOj8GHMGr9eAFsOupf38Q3g14ohp3M2dmNGlGNmDXIz
	VlMYejJ1+GEL2HBUNZ25RZdKIaqBGE0RgyvTthJs9nZ1h6s6qxypijnhbscc0U8S1UaorMbnT+W
	OTjbeGhKJUTxnRxzpe
X-Google-Smtp-Source: AGHT+IGpApL3VVGRNVrShbz2gpArNfF9x0CWWaOzqj6DXl7ZGwWDs4SYfO44oU/8DNb+tdYYpYB3Jg==
X-Received: by 2002:a17:907:3f18:b0:b76:277b:9a5b with SMTP id a640c23a62f3a-b7ce82d3515mr657352366b.6.1765461242068;
        Thu, 11 Dec 2025 05:54:02 -0800 (PST)
Received: from localhost ([2a02:c7c:5e34:8000:c186:ec41:4ac0:f434])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa5c8e59sm278436266b.62.2025.12.11.05.54.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Dec 2025 05:54:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Dec 2025 13:54:01 +0000
Message-Id: <DEVFS1MAP8J6.2263USIPE4Y74@linaro.org>
Cc: "Vivek Aknurwar" <vivek.aknurwar@oss.qualcomm.com>,
 <cristian.marussi@arm.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
 <mike.tipton@oss.qualcomm.com>
Subject: Re: [PATCH 1/1] firmware: arm_scmi: Increase MAX_OPPS to 64
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Sudeep Holla" <sudeep.holla@arm.com>
X-Mailer: aerc 0.20.0
References: <20251014073454.461999-1-vivek.aknurwar@oss.qualcomm.com>
 <6af5945e-7d5c-4596-ac42-c5898b4c49b7@oss.qualcomm.com>
 <DEVEXHI9CEFA.19RL3BXTV8E38@linaro.org>
 <20251211-masterful-caterpillar-of-love-bc2d4c@sudeepholla>
In-Reply-To: <20251211-masterful-caterpillar-of-love-bc2d4c@sudeepholla>

On Thu Dec 11, 2025 at 1:48 PM GMT, Sudeep Holla wrote:
> On Thu, Dec 11, 2025 at 01:14:06PM +0000, Alexey Klimov wrote:
>> > On 10/14/2025 12:34 AM, Vivek Aknurwar wrote:
>> >> Some upcoming SoCs define more than 32 operating performance points (=
OPPs),
>> >> exceeding the current SCMI protocol limit. Increase MAX_OPPS to 64
>> >> (next power of 2) to support these configurations.
>>=20
>> Didn't touch for a while. The way it is stated confuses me a bit.
>> Should the value defined by protocol be updated out of the blue?
>> Should the protocol (defined by spec) be changed first?
>>=20
>
> Ah good point on confusing commit message. I just assumed it is limitatio=
n
> of the implementation. I can update the log when applying. It is not spec
> or protocol limitation for sure.
>
> How about this ?
>
>   | firmware: arm_scmi: Increase performance MAX_OPPS limit to 64
>   |
>   | Some platforms expose more than 32 operating performance points (OPPs=
)
>   | per performance domain via the SCMI performance protocol, but the
>   | driver currently limits the number of OPPs it can handle to 32 via
>   | MAX_OPPS.
>   |
>   | Bump MAX_OPPS to 64 so that these platforms can register all their
>   | performance levels. This is an internal limit in the driver only and
>   | does not affect the SCMI protocol ABI.
>   |
>   | 64 is chosen as the next power of two above the existing limit.

Yeah, that sounds better :)

I also thought that this was a driver limitation, not the protocol/spec one
as stated in the original patch.

I don't mind updating the commit message like this (but I am not the author
of the original patch).

Best regards,
Alexey


