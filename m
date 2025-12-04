Return-Path: <linux-arm-msm+bounces-84398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AF2CA487F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 17:35:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 810EC315EAA7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 16:28:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32604346A12;
	Thu,  4 Dec 2025 16:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jx1R+rrO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468F5345CCA
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 16:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764865071; cv=none; b=Emew4kdN1yKZz8jFekH0YltPGtbnETBgbgLi3koEzBgWE3bctPW2p41J4wQNYxq7GWOj+oi2ex68uJ9Nc+PQZUE4TWyd9JYZHCD4qHXsekazLGRLO3gW9o66xeaXF/BpV+yG3WmR30hhKgYqiwfVCPTQ7AOrdygrjwXzeESYb8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764865071; c=relaxed/simple;
	bh=f6cXDym/XHWZi3CuqadiD/m2CKUVMYnKrDQ5ZA6ODZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ITIbscw14KC6CEHouY1ISbZnd5VOU67WcvZ9XqFFNw9NxslKLEwwMcyj3D257j3ZRjaIlGmOYETZVh2kRbPDUDR8U6nbPet2q7ZuxLS0vOOEWnao+dXcWt/u/e/zw76WNhEwwjej84dD7TYU/2S/wpHBE/NdB8qH9wDLfCtugHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jx1R+rrO; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-88059c28da1so10043156d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 08:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764865067; x=1765469867; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TcYtubvKcGoSq4YWnqE43T9j+Qij7FD/s8vUU4QGez4=;
        b=Jx1R+rrO8AD7pE2U8YrEGuMCNxgQWTjmvuSPjxXn2QlswgmiiYreS+qk9pdSFFjsJH
         Jq3QCEBFupUKMY58LYzQLIBLUp140oZkR1M8E3nS9ali9uOLM/xSCVH53yBBG2cOvETa
         2usHvSD4ifFmiomOxRxiK53ReTW/ajE1slmOSaOKRD4xub/wfcP1mTKqFLoFlgz0D32R
         +ETXM5IicMvDmF8luCapG3WlvEIFHrf6D+vxneXymUSQvQAWHLNw3M3Fgsjd3IgVR76R
         2lhJzPONZPrTRT75+StXxFRP/2E2m2srjHpslFzduwLTxONyW8NSbO/g6naE/liX6F5u
         XAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764865067; x=1765469867;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TcYtubvKcGoSq4YWnqE43T9j+Qij7FD/s8vUU4QGez4=;
        b=wWprFrN8qW1qrmahjVC+5ve0G2Ju770r9IxXYGBHj+pLcv+JDW2GQY+DBZfIvFV73X
         u3ND+Uwsvpif8W9xqh2VSg92rONjtwyH/w5j47iDDVqnXACTs6BlltIvuVMMqHws0unH
         BaCcdb9basHrqRjG+6RgiwI3hDKTTtwZnR25253dce2muHkvz+Lhabuf/teGr/i69qzk
         Vcdmt1rCre0C0g2EREMlmC/igAJoqtJ1t9n2b/t9swK1P5EEQwP3LowrlXNsJncYguko
         LpTjOUJBh8Vf5ldwAZr0Mvl6I+ohoQ1UyVpr+3lprrKhB9/sB/XQ08pztfnkjsyJ/+wb
         fTEA==
X-Forwarded-Encrypted: i=1; AJvYcCWW9EFcjZ2KTY0HmHeaB2Oe2x7G2n8/bgu47XwYVvL5+DRZcng9EmpLxlJk8jVoJiCwhp0KM6C6uO/kOnnM@vger.kernel.org
X-Gm-Message-State: AOJu0YycdY6SB/MyZBaW8sZ/yY+MxzxhM0MLQ5c8V4GWrFaLtdnSnwRk
	ziBY7yqDQvsiOTqJZjASGRqG5+2RYYr/SHSEG+cjGkwi+IxrXeFWdbB8r1a7WzJW/FCSHAu9o87
	i7iPjOlW6knpEDPmJjD6kQ/imHM5E0HIX2tK7DY2Ic3XqMaolPh1n
X-Gm-Gg: ASbGnct1tX/qgTeIPMv+tIwx0j5PlpKqtQYLUi+tyWNrt5yz9sP+e3i6lV/0W8V8sBW
	ArcUbqda2lXbM1jAk+arXs8O2PTOUb27LYCE1Lq8QjPgCClfuRkAkQLxrMm96st2YnJmOfkcwL5
	RiVQK/Re5mSSpjRcagrLOl2dShVoVYebMwK4tbM7Lw5t5xLimmSOOXGeLg4qh7zD4MDD0Im0nns
	VBD+T37fcf7Cpagq0EvNk762Kkgqnj3dADFl3K69agCQdpFR8aBFQdb5J5vVRsxfZtQydGODAZk
	SGtFnd1XS2kgAMbvb7R27mEO5eU7
X-Google-Smtp-Source: AGHT+IF8z11XLGfYzUm91CMdZf4GezIwYVVnF1KmzD5fxiCI7uZI3auSv7HjayTXTjcC2dCJDroO2z1dhzcB1niqEsc=
X-Received: by 2002:a05:6214:21ee:b0:87c:2360:d404 with SMTP id
 6a1803df08f44-88819483e38mr101446386d6.7.1764865066864; Thu, 04 Dec 2025
 08:17:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251202-extended_cti-v6-0-ab68bb15c4f5@oss.qualcomm.com>
 <20251202-extended_cti-v6-2-ab68bb15c4f5@oss.qualcomm.com>
 <20251203182944.GG724103@e132581.arm.com> <CAJ9a7VjWDBEwdmMf53geACBWGusC8BC3pJuOLETeecw24+N35Q@mail.gmail.com>
 <20251204103151.GK724103@e132581.arm.com>
In-Reply-To: <20251204103151.GK724103@e132581.arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 4 Dec 2025 16:17:35 +0000
X-Gm-Features: AWmQ_blm_2rs2si_vAcMXoW5zZu2s4mytZpslYby8tsAcsAdu9x6GoUJ81x6Q9c
Message-ID: <CAJ9a7VjHHkkTz9XJqjdQ+11_XX9zXuY0ZcQzPtq=Zvi4CN__0A@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] coresight: cti: Add Qualcomm extended CTI support
To: Leo Yan <leo.yan@arm.com>
Cc: Yingchao Deng <yingchao.deng@oss.qualcomm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, quic_yingdeng@quicinc.com, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Mao Jinlong <quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

Hi Leo

On Thu, 4 Dec 2025 at 10:31, Leo Yan <leo.yan@arm.com> wrote:
>
> On Thu, Dec 04, 2025 at 09:07:56AM +0000, Mike Leach wrote:
>
> [...]
>
> > > I saw CTI registers are within 4KiB (0x1000), we can don't convert
> > > standard regiserts and only convert to QCOM register based on the
> > > standard ones.  So you can drop the cti_normal_offset strucuture and
> > > only have a cti_reg_qcom_offset[] struct:
> > >
> > >   static const u32 cti_extended_offset[] = {
> > >         [CTIINTACK]             = QCOM_CTIINTACK,
> > >         [CTIAPPSET]             = QCOM_CTIAPPSET,
> > >         [CTIAPPCLEAR]           = QCOM_CTIAPPCLEAR,
> > >         [CTIAPPPULSE]           = QCOM_CTIAPPPULSE,
> > >         [CTIINEN]               = QCOM_CTIINEN,
> > >         ...
> > >   };
> > >
> >

The tables in the patch are

    [reg_type_array_index] = offset_address;

e.g.

  [INDEX_CTIINTACK]  = QCOM_CTIINTACK

which resolves to

 [1] = 0x020

where index is constant for a given register type,

As far as I can tell what you have suggested above is a table that is

  [std_addr_offset] = qcom_addr_offset;

e.g.

[CTIINTACK]             = QCOM_CTIINTACK,

which resolves to

[0x10]  = 0x020

which does not appear to work correctly?

The registers are sparsely spread across the memory map, so a simple
mapping does not work, even if we divide the original offset by 4 to
create a register number.

The largest standard offset we have is ITTRIGIN = 0xEF8, so assuming
the compiler allows us to sparselly populate the array (which I think
it does, along with some padding), we end up with an array of at least
0xEF8 elements, rather then the indexed 21?

Regards

Mike

> > I suggested the dual offset approach a couple of patchset revisions
> > ago as it actually simplifies the code & makes it more efficient. The
> > offset array in use is set during probe and the remaining code is then
> > common to both without lots of "if qcom else " occurences.
>
> AFAICS, we will handle the QCOM CTI particularly in three cases:
>
>   1) The register access;
>   2) The claim tag;
>   3) Sysfs attr is visible.
>
> Now we are discussing the reigster access.  As suggested, the
> "if qcom / else" is encapsulated (e.g., in cti_reg_addr_with_nr()), it
> will not spread out.
>
> I'd use standard registers by default and convert to non-standard ones
> only when needed.  A new "neutral" index layer seems redundant, as the
> existing standard register indexes already serve this purpose.
>
> For the sysfs attrs, it makes sense to use a central place to decide
> which knobs are only visible for QCOM CTI, otherwise, we also will not
> spread the condition check.
>
> I will reply separately for claim tag issue.
>
> Thanks,
> Leo


--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

