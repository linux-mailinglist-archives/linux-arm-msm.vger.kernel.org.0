Return-Path: <linux-arm-msm+bounces-62442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6E2AE8236
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 13:59:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B53E65A524C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBA6B262FC4;
	Wed, 25 Jun 2025 11:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="S7cEZeoT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF67262FC2
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 11:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750852530; cv=none; b=FAGS+NVhEHcu80cM/awnxsUzOXNRFuig8pyHnhkceelIORcZAm9UPVHSkL5h5gLQoez+G2a2E4MGNidT2VKXXLyWU8ZRJInuiD3FFii1s2r2sg6NY1Nm7oUye0I6JtOBwhA/LFBZM+0leaNh9sS/yk0QeKJ9Wvi6uoI3jT5yv30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750852530; c=relaxed/simple;
	bh=Ele4kC/bFjkVABuTlMtPoVal/q9sn4Mx7Xjke1CK0u4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=gUgcIe7SaHTJhzt+t7zUp+oPxT7R5WQAnvLblG+h3VknkA/1DX9Q2fNaO+zGD5yw4UPDugXll3euvcvchShwqizUsgWroqMnFybt9zDG16YBHLGin2PpoRUdaWHwqpZ2qUwL8lbApO+VUVNryIUjKp59CtuN7LSAPubjZLqZcdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=S7cEZeoT; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-adfb562266cso297797266b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 04:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750852527; x=1751457327; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ele4kC/bFjkVABuTlMtPoVal/q9sn4Mx7Xjke1CK0u4=;
        b=S7cEZeoTNrM7BSttg5BZn08LPp7zqpFIqas5TiDr6l1ZWVsv11SDxVRP9VpSQSeCaU
         1m/kQWZ4nQkfek6x3X8gFQNchuw53Ix8TaDxcuXu7645Ku3f47ynEPWXTA/oHTEz8d8o
         McMp9nYfhaB0PA1/B1UPSe094FjCDTElK+Y4dwNtd1LpMoehxCFp2ycIE+iT4sQJUFy7
         viHuhqfaZ1ojXqJ4vKKN7lextfvdgo4nzQZmOeDfCp/zVJ2YLSEBX/Y9pJB/K2lERE6C
         LUSYOX9uu6xj/tDUXW4LXk/aHUrymFAl0nATxbHsr+QvhbMptrSvurx1fbPwwT3KOLMN
         J1pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750852527; x=1751457327;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ele4kC/bFjkVABuTlMtPoVal/q9sn4Mx7Xjke1CK0u4=;
        b=XpHlGII51xv8zD1qbeX+O19/zlZzNFy/tPSZCw6n0pNNgAFyDnvkTNmMJ8xbKaRZGL
         7HhXfTGa/Yz1k4y9b//ySOPEGlmCxrZb3ppLY6yijb5uW2kE9hL7lMOgSeLiT/Svo6PG
         1lPPubz1wkuPeQ4TFRdqe02qeK7YWXaFDH4WZzfnt02jP5J67HUa71N03A+q45OPH3K9
         M09ufnbsl8PgdCjrPy2k9vOw13c1iEArALbPMxfRJAsaaEwro0q4uykwrhKCVBVsUxnz
         UCFQeGXbxNNgUilFx8JkNFFB6YUHudde5bYqWtehfTvIXpcBEH96XQBcT0M7lYYRj1Cp
         i6BQ==
X-Forwarded-Encrypted: i=1; AJvYcCUImqF0gOmmJkrrx2KUKFvJ46KjYZLIWFcMeq1YKCTasfFq49YMCRwACgnpcTLt5OX/anSN+wAofIGXJefU@vger.kernel.org
X-Gm-Message-State: AOJu0YyRdKlf77BOp1DKCdznQvJfttntOD+bbTn57qPUofdyNghogEN6
	OqEWZBzTdLNiMLQ9L/ZZ/IvdShQ5P63pzyh+2fXaBJLdes493tz6icq4/iuteVEWZIE=
X-Gm-Gg: ASbGncvQ1RcEq1zuGOQBFZ6BAWwwRAhrlJxstOd0Kk6HcgFD6CFPKYq1zpsWdy2ih7O
	SwIZDt67xagjQ9sFU/u3XD6KtGYrht+JB3/qR0lHvBmaIwFlA1rA3TpANZK3Avp57DZOaJLpUOG
	h1aVg+X6gQ5tOoSnIc+JYEKS6LDaJ2j8a0pUHNiqhJjZcsGh+A31WXOUZNU5TL+DB6lm6zmG1yr
	4FwFi/nXyzEBkalC0JwYYSH0UhNaRy85/uaH3xDAt31Zng3FuDmEPFDKvmcUp8iNWbS+9h9IGuj
	PwiKmJLKngtNXEuCNGPcUn4IoGMj4l8AePHtZ1pLZ4093YNZv/HWxDKapo6W0XBJHJTgB5qdu4q
	WTR+kl7g13rrMm7rHvyY1EicRnh/DxWY=
X-Google-Smtp-Source: AGHT+IGHwtU2WcLOLeMlMlhviB+W5ro/PgSmY8OoYgsUjPuqlDw7Eu44hCDzY1aMqXqaPDEZvGOrnQ==
X-Received: by 2002:a17:906:d92:b0:adb:4917:3c10 with SMTP id a640c23a62f3a-ae0befc3ac1mr209592966b.60.1750852525989;
        Wed, 25 Jun 2025 04:55:25 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0cb358618sm29256266b.102.2025.06.25.04.55.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 04:55:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Jun 2025 13:55:24 +0200
Message-Id: <DAVLF5WB0IZU.3EZCARZSQO050@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-usb@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-phy@lists.infradead.org>
Subject: Re: [PATCH 3/4] phy: qcom: phy-qcom-snps-eusb2: Add missing write
 from init sequence
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Wesley Cheng" <quic_wcheng@quicinc.com>, "Vinod Koul" <vkoul@kernel.org>,
 "Kishon Vijay Abraham I" <kishon@kernel.org>, "Abel Vesa"
 <abel.vesa@linaro.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250625-sm7635-eusb-phy-v1-0-94d76e0667c1@fairphone.com>
 <20250625-sm7635-eusb-phy-v1-3-94d76e0667c1@fairphone.com>
 <4d215791-35da-4139-9cc8-33da5d46469e@oss.qualcomm.com>
In-Reply-To: <4d215791-35da-4139-9cc8-33da5d46469e@oss.qualcomm.com>

On Wed Jun 25, 2025 at 1:51 PM CEST, Konrad Dybcio wrote:
> On 6/25/25 11:14 AM, Luca Weiss wrote:
>> As per a commit from Qualcomm's downstream 6.1 kernel[0], the init
>> sequence is missing writing 0x00 to USB_PHY_CFG0 at the end, as per the
>> 'latest' HPG revision (as of November 2023).
>>=20
>> [0] https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/b77774a89e3fd=
a3246e09dd39e16e2ab43cd1329
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>
> Both the original and your commit messages are slightly misleading, the
> HPG (and the code which is indeed in sync with it after the change is
> made) only sets the value of 0 to BIT(1), a.k.a. CMN_CTRL_OVERRIDE_EN.
> You most definitely don't want to set the entire register to 0.

After reading your message twice I think I've got it.

Code is correct, but commit message is wrong (it's saying writing 0x00
but it's not actually doing this in the code, just setting the bit to 0).

>
> With that fixed:
>
> Fixes: 80090810f5d3 ("phy: qcom: Add QCOM SNPS eUSB2 driver")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks for taking a look!

Regards
Luca

>
> Konrad


