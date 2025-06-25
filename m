Return-Path: <linux-arm-msm+bounces-62491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8988AE8751
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 17:01:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F14E189D6E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 15:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E92A25C702;
	Wed, 25 Jun 2025 15:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="1Va061g5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE591A2C25
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 15:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750863698; cv=none; b=k6gi00sR644qTgCmNYgbndt/jWI2cSjmWDYKUMgfB5sakh83yLMS9FQlG851qdLu4rpINgXpajNbRnj7vJjOk3cUbC1fLdHMQksMfIwczSZpsxetWcAwe/I2/8ENFbDGaZEEr6BxJ1O/ldCnaiKtN4+XmUnuDCnPptSkXBrXKho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750863698; c=relaxed/simple;
	bh=mjKGXvYRAeV0j9q55iDsvNYd/AmBtJccQ5OLEaOQmb4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=eBVsk0kL6HE8MVgvtjeNVeheGPCnLFMvFxffe4M3Cp/ceHvyJfs9VQf5JJ2XAkm31hgmi3vn77OyVb8UTTjg2QEIKL0YNcutN/5Assz9tNclZg5fzVbEignnHErOfIJ4VAa7JUGRixwAPDjPtACkyEIAj65WkhFpXH+vMK8UoiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=1Va061g5; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-605b9488c28so11712906a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 08:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750863695; x=1751468495; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OnhUDg+i4p9VBXEoyxzKCCrO1ndShC+avgmK0GaloHg=;
        b=1Va061g5uxi+ZmMR6Z9hmFQna/WcktJ8rSPg/wH1PoaEqOHQwWukTV1BsfVbhioM28
         /mhOd+nA3mqmOCqFuGyK0MmHyIfjzzcfgiH4WQUmR43mDgKOg7oHzEZ6gEEKtSWCwYXT
         aTJIRjR/uPuz1YcTt9V9lE0UHi31zEEoSyPRyVYo/DnZBerSauhto3Ikp3GTQylDJlNs
         PMED0YTT26CW6it/ijeaDvTeRWNgaxQCshJCnKTPQElyUioZ0OVI+qMrfw/k7fS7SSlZ
         A+C701+WL8QHD1xXTOvp/ELXSvuJVDDcRFLD2TJWSgK+++bU2VUT1Tc6i0v4DsoMoNKz
         SzLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750863695; x=1751468495;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OnhUDg+i4p9VBXEoyxzKCCrO1ndShC+avgmK0GaloHg=;
        b=dGiiis84ISdtO4oak65TBjpzV6hNN2HPCjKVFH8zp9YKwD3/KduFDPERc2EMjD8YLi
         SAED+DtZiTwD/M+IlIw+wrqmWX2R3Tl8WEsXuw5cHr4BJL7eoXwLPqm/U+X3O6nyGXlO
         XCg/IFPMitzR+mR99TtI0vnamtQR8r0bxs9z5YJWhHsOCKjwH7waumq0p3PuznAaRrPf
         6GJBDJM0suGkGWk8ErmkkxJXfrOR2qEgeoS4ZJK/BTFn7weBCezrZbx1/vhuXdeGDRm7
         HrwbhV8meVuwlNVew7GsYf4c8EXtXjhK2b0Tj3/AN/BJGAvo+3XsvxhOcsRtVG/z9Ibs
         oTGw==
X-Forwarded-Encrypted: i=1; AJvYcCU4Hc8eu4WvRJES5nYw89DVS2n2viZLVZkfbllJ5XxoJo8nPFll81RHpNOclog1CRxnUApmqzT+dzdGJnuU@vger.kernel.org
X-Gm-Message-State: AOJu0YzxR20B1izcScaf8iH6wGoRupc0cz1pZdBPC5VmQQoG9FVcHcqN
	PvH/X3ksaE5naHtrORXH93nxxsYW4uAIauktmMPhaHVlyYusX1zg/+TQMKU1V7CG1GY=
X-Gm-Gg: ASbGncsgAHnbKk6Ch1+cVuMAXENlJVgZGbtRLR3Njpq1blH688w5mTrFdCMn1N9re1k
	8BeYRvUaDNo0dSBU2LkW/GNtp7y1Ca39gE8rV1nZ/KiavCYjrVNLS50RDkvrRjVvuysHJD4Xgu4
	Ida217M3vRpQKY4EKn5UXaSUar59RjJ9/om5jkINhElWs5CLqnklBe7fR05Unqvr1ii6gubVg0D
	eUylwsNIq2sG8ffyl9jBwnLBSF4aZzemG122xW0XAHEwD7slC0c3Ludbz5gdjcQojk/C7353gb2
	dXGoWj+/fH5sq2PRx/qV6eQY0ENIrXK1O9mPwoJyJ333Quy+xFDXlia6nRdU8T8gseNWyOfFyI9
	EL/9+JFKgx+6AXEde4CsfflLShyxotH4=
X-Google-Smtp-Source: AGHT+IGR7eTLwLr0fdOCYaZCuvWw+/lu8Yn8bZNjsxmvuaS3Yo6hqW5sayVf685GRx2r82h70xi24A==
X-Received: by 2002:a05:6402:84f:b0:605:c057:729 with SMTP id 4fb4d7f45d1cf-60c4de864a1mr2730749a12.34.1750863693017;
        Wed, 25 Jun 2025 08:01:33 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c2f196ab3sm2609163a12.3.2025.06.25.08.01.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 08:01:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Jun 2025 17:01:29 +0200
Message-Id: <DAVPDN4U6FSJ.1MHMT5G04KSKA@fairphone.com>
Cc: "Lee Jones" <lee@kernel.org>, "Pavel Machek" <pavel@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Fenglin Wu"
 <quic_fenglinw@quicinc.com>, "Stephen Boyd" <sboyd@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 <phone-devel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] Add support for PMXR2230 PMIC
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250625-sm7635-pmxr2230-v1-0-25aa94305f31@fairphone.com>
 <zmqkdpmji2uodm3mxcteteyhfkef47kihola6vtxb4mhuynqwz@hvgfd2637mhz>
In-Reply-To: <zmqkdpmji2uodm3mxcteteyhfkef47kihola6vtxb4mhuynqwz@hvgfd2637mhz>

On Wed Jun 25, 2025 at 4:25 PM CEST, Dmitry Baryshkov wrote:
> On Wed, Jun 25, 2025 at 11:18:36AM +0200, Luca Weiss wrote:
>> The PMXR2230 PMIC is used in conjuction with SM7635. Add binding docs
>> and the devicetree description for it.
>
>
> Please use PM7550 instead.

I'm happy to not follow downstream naming conventions if being told, but
do you have any details whether PMXR2230 =3D=3D PM7550, or PM7550 is just
another SW-compatible PMIC as PMXR2230.

Also we already have qcom,pmxr2230-gpio upstream, so that would need to
get updated for the PM7550 name.

Regards
Luca

>
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>> Luca Weiss (3):
>>       dt-bindings: leds: qcom,spmi-flash-led: Add PMXR2230
>>       dt-bindings: mfd: qcom-spmi-pmic: Document PMXR2230 PMIC
>>       arm64: dts: qcom: Add PMXR2230 PMIC
>>=20
>>  .../bindings/leds/qcom,spmi-flash-led.yaml         |  1 +
>>  .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |  1 +
>>  arch/arm64/boot/dts/qcom/pmxr2230.dtsi             | 63 +++++++++++++++=
+++++++
>>  3 files changed, 65 insertions(+)
>> ---
>> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
>> change-id: 20250620-sm7635-pmxr2230-ee55a86a8c2b
>>=20
>> Best regards,
>> --=20
>> Luca Weiss <luca.weiss@fairphone.com>
>>=20


