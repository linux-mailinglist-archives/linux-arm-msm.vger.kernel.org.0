Return-Path: <linux-arm-msm+bounces-54239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 865A4A880D7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 14:52:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCA461898B00
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 12:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15FCC29CB4B;
	Mon, 14 Apr 2025 12:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FYmA2Zd5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE131DFF8;
	Mon, 14 Apr 2025 12:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744635145; cv=none; b=UkLQ0alzF5iidpMzm8ldYqIY5ZkzZ52+BJ8rjQxTpEJd5GTz6e7qHgoLSFEdEjwDE3qqYSYdqwDO/i9srU5gIb7iuV7HBclQ9XQLS+axbZKOLBQAC+qJfWmH32zCQ1Wf/JRDLJxdhIEFQohfqeIN59IlynB+ckZTZQcXQZFKRJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744635145; c=relaxed/simple;
	bh=1ldnkfgixg9bs2RCXFkPmShEZrz8c7D9t/EpDMmr8QM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aGAnQOa4eG7H8fIkMre81Ltlo17rgWDtO3AVRg7cLNFKdBdhfYLEgmja8qGL2Ic1CYhZycBXLy8rlGoS78QWnFGY/ZmzIwtS0GLfQ4qrJDVRoi+GG+mhTbwmqhmjWkRfR5WWxClugw0wZbIfHbhXF8JDUQIfphfCmRrx5S6B8Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FYmA2Zd5; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-523e895dd3dso147381e0c.2;
        Mon, 14 Apr 2025 05:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744635142; x=1745239942; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lxq0k8JECetlMezwpx18zh68KnoK9PWRqalahhyXsYc=;
        b=FYmA2Zd57Hbgj+2fQw0YMypy7D9Ej4zUxA8TSf9b4pcNT10LOoZtuVsh5YbXFmYraZ
         60+3y0WFeuQAab0Hfarafo4p3OQhI9BgS30U5oI9tOM8oYAtpXft98lj1ZakIImENztQ
         wCvtW1GWr/AYW561brvDcIpD2qVobIIdNqIHPIPLSmTjIUGCgh2QhQvF1b2tOkNa8+kR
         o+g66lw7kUBXZnBxhs2KtCFSaMqQymsdEbQKnsMgQS6IZotqJ4+r/vPr2qFcRL1jIe15
         uyaCK/SPPMgA7w556mohzLhiIe2igLDPf3TpO9d/gVWso6Nk8eU7ONQLvEtzEGl18/PA
         lpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744635142; x=1745239942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lxq0k8JECetlMezwpx18zh68KnoK9PWRqalahhyXsYc=;
        b=Ch83JAy+H3wxmS0bqdSkTdx9w0GbUMa5hF5IjzJ/vAmPR0EPGsnsGrvdrXbyk3gdnm
         NU56NESedYmbxvIM2ZYIDi8n0+N1CU3sjvghl3D0R8roSQEyWJBEWAYWwzXp7YOJblDR
         qOvvCaXxnQY4eUYQ9B8f21U/Cf9X9GMS59tw9gEIFHo1eyDt99httkI7zz+PXFy2etqU
         o3Dj8CUmwp/l4u0HBz3Sqd8Ij+lOSeh0TmLX2a3RYW70DvvB3KnG4jZcoNn13R9OqO7s
         IIc1V2kesvFJ6iO43oOwBZAvQvODu2F1Ci+JxyxTQ72zXBxotXoCJiwOVauU8+4GweZn
         7slQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBVs7KqwR+dvgivazSF4FLEe0Pv3ZIjVayT1cSR3zvB2f2A5Mqnnt8C/+CIGm4ncepAAa7/dOxTofSz0ut@vger.kernel.org, AJvYcCWsQ4C7TPsmiAuXdhegQIo7q9g+ByA3hZyDl/gNFT4Nn6D67Lh0vrVI7wHOmWmQQIfGKwOF32KH5W6AUIah@vger.kernel.org
X-Gm-Message-State: AOJu0YwCi0WRADZS3UmdZ0zIiEJsdTIswKSNXRSmtK6RlF5Odkash1EJ
	DhXWi+odNfEgiDXmFEw9nqMgQHeV/8GBAdiqmr2AzRubvPuzF7cQZJ12pHKaKIrkLapGNnABejc
	i0RYEEHdaL04QawWfbipqWHHxcg==
X-Gm-Gg: ASbGncvnhDuPwx8WoScj4tlBZOZBY8W4HyzBJdR6reVqHWJ5N0ZUYUQ1I5+2egB2YNN
	xdFv9pQBEEi71bZF11/Z5xSWdNhlLgfbSpcRX99+8CLWHvza0jFUUijGN3tJ63PrjRnvKBytKj5
	6kISF0AsA7BStZJrC1eJwazSM=
X-Google-Smtp-Source: AGHT+IF/v7mtNxmW/BA3M7zuPV30jB46+QuFqkvXXuoe9h6dKHwUIeEENVSAWHN3prhzK88qFeD9PyaKIbVWCr8a0Gk=
X-Received: by 2002:a05:6122:d90:b0:527:67da:74eb with SMTP id
 71dfb90a1353d-527f7218ae6mr2145470e0c.1.1744635142084; Mon, 14 Apr 2025
 05:52:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250413212518.2625540-1-chenyuan0y@gmail.com>
 <22ec4fc8-9368-4955-ac97-c49b3317d3b3@kernel.org> <Z_y73a5IDO66AzY1@hovoldconsulting.com>
 <f3b77aa4-e7a4-475f-a633-48aab59fa9b1@kernel.org> <Z_zDtfEsgXsFodG9@hovoldconsulting.com>
In-Reply-To: <Z_zDtfEsgXsFodG9@hovoldconsulting.com>
From: Chenyuan Yang <chenyuan0y@gmail.com>
Date: Mon, 14 Apr 2025 07:52:11 -0500
X-Gm-Features: ATxdqUGA6rf8NvPr_QyC7nCQ3KhCb283Qi94-D8xvSbaWhdMjQ7j7Sb5pzG1syg
Message-ID: <CALGdzuo2qn-Eq=UgsSpkEvR4ZZgGKb=ETepWBoeMCf_x0J5kQQ@mail.gmail.com>
Subject: Re: [PATCH] phy: qcom-qmp-usb: Fix an NULL vs IS_ERR() bug
To: Johan Hovold <johan@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, vkoul@kernel.org, kishon@kernel.org, lumag@kernel.org, 
	quic_kriskura@quicinc.com, manivannan.sadhasivam@linaro.org, 
	konrad.dybcio@oss.qualcomm.com, quic_varada@quicinc.com, 
	quic_kbajaj@quicinc.com, johan+linaro@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Johan and Krzysztof,

On Mon, Apr 14, 2025 at 3:13=E2=80=AFAM Johan Hovold <johan@kernel.org> wro=
te:
>
> On Mon, Apr 14, 2025 at 10:08:18AM +0200, Krzysztof Kozlowski wrote:
> > On 14/04/2025 09:40, Johan Hovold wrote:
>
> > > I'm afraid you're mistaken here. See __devm_ioremap() which can retur=
n
> > > NULL.
> > >
> > Uh, you are right, I only checked devm_of_iomap in qmp_usb_iomap().
> > Anyway, the fix should be different - given function should either
> > return ERR or NULL, not both, so devm_ioremap return value needs to be
> > wrapped in ERR_PTR.
>
> Right, I already suggested that:
>
>         https://lore.kernel.org/lkml/Z_yxxoa12N9rNn2z@hovoldconsulting.co=
m/
>
> Johan

I have submitted "[PATCH v2] phy: qcom-qmp-usb: Fix an NULL vs
IS_ERR() bug", which fixes this issue based on your suggestions

-Chenyuan

