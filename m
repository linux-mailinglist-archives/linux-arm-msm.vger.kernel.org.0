Return-Path: <linux-arm-msm+bounces-32844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E29398B501
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 08:56:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A8EA1C22E53
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 06:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE6AB1BC063;
	Tue,  1 Oct 2024 06:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u3Z7m3OK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0614A27468
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Oct 2024 06:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727765798; cv=none; b=cfXtKMkH5irZOZlj/XdvBbtVNQR/XSt+mgGlsHBDxEhhRZ5yxvx2eC8bCsXX/04MfeMpGeTvg0dtWJKKnKVDpd8fEBxGV+FW944eoho8sG3FTvubpf5hzjc9xo0kpYfmlKgrEb95EWuBkQlv494F0ro9p5QLdpQ/DM3gZjb/AUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727765798; c=relaxed/simple;
	bh=P2iz+8xGuqHWu/q5RowKgPmgCIQJNV10OcVir0GCkb8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=k2b9Lkm/bmRjFT+/lUx4XViE1gJrmDGJdQhlZukurN8WsUnJiGOI7jAXILhYUwQXLnvePx3kzEr1aHWZ+CJvDC08AwCquUxa8lbRBqqqxb4OhNSHXNVJfdwn7CYircp/w2TF6Y+0QsC2FFg/GO+L4/PmuNUCxkqecIKr4IiAed0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u3Z7m3OK; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5398e3f43f3so2834650e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Sep 2024 23:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727765795; x=1728370595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ryx/pMOkdMVMTPBu2h9pcD06K8eaJT9I2qHgxYrkpHU=;
        b=u3Z7m3OKfcGpX8tDingpXUYrr7SDOyZHtqgtfUBfAcZ2nrZQtHSXNgvQMpjUGySsF1
         2uNCThU+Z14/p3VRb89DHfqpqURPUP/sq5dPUfV6UUTl8wP4X5JIRxzfzO+wuV0qm/wE
         JZBLtLPzc4QYOKVLM52+c29g/4sLMzQTFbPHhj7V4jh8BPdSH3rVt0UBmfBV8Zi0QdQN
         iSel9Xe6887hhbNE1TiuxL+indVNXW0XGK/v38iyxW9zx8Ch4kKR2cKPGI0PwgfU8B9o
         RRtzQycK+l5crnx22oA7ztZe26gfnQawsLUVTYAwBe5Lk4ULaNXg2LCaGpA66Ef092PQ
         I6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727765795; x=1728370595;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ryx/pMOkdMVMTPBu2h9pcD06K8eaJT9I2qHgxYrkpHU=;
        b=fjvvJJDqH9qBlLbnBvInUx+oR/lFDHT12L/Tplw1Jpa5VgjQJO1l7pn4Dz24T8uShx
         KdPNP4J5xx4ttTuv//lWPiea58tkSrer++wEG3qjudqTBNFafI6uGHV7+5C9TxuLEZg/
         0HG1KkQ+K8lWOP7GY82FQL2ULTcuet6NsLUIbtsdnXgvN4NrhT2fALkKBKHWz2A0ZW1k
         Z0TDok5vdjD0pc04XkmXOzJz6/4TaH2Om5HwJqdsBbkwnBR1OJspUnEj78q8DXwLcYdl
         eJwJIYMVQGTvIhTsY8Swmaf8mlt8aj2Rtwx2NWAzYIct4TuLd+xd/XRPkjli0ANeYnxB
         yhVw==
X-Forwarded-Encrypted: i=1; AJvYcCVTwNBJkB3LiN9Ky8THatA0uOof+1ZLGNtKOVSx2K382t4Xx+wC2xKelYklS18fwAV9GDMJj1Ok/bMZZEWY@vger.kernel.org
X-Gm-Message-State: AOJu0YzSxXKGmdaqAPTPFaZXwk8gzvjhQ8ZFy0ieWvtYn94MUbQyH+6G
	YtOKvbwU7+KuFf/xdGhPex1lBde8NLtl+AlYad2VF/Ajuy/3qLmJT42AHCkMUWY=
X-Google-Smtp-Source: AGHT+IGmpVzWubILBrr/NVsOGugY2yx5KSFiqaVKZfoYXmMzEejhXHiw9mEnypO4ONCw02IXyohG0A==
X-Received: by 2002:a05:6512:3d93:b0:535:65ce:e901 with SMTP id 2adb3069b0e04-5389fc32b7dmr7801243e87.4.1727765794825;
        Mon, 30 Sep 2024 23:56:34 -0700 (PDT)
Received: from [127.0.0.1] ([37.155.94.96])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c88248af1bsm5618973a12.75.2024.09.30.23.56.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 23:56:34 -0700 (PDT)
Date: Tue, 01 Oct 2024 09:56:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
CC: Sibi Sankar <quic_sibis@quicinc.com>, konradybcio@kernel.org,
 krzk+dt@kernel.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, abel.vesa@linaro.org, srinivas.kandagatla@linaro.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_2/2=5D_arm64=3A_dts=3A_qcom=3A_Add_?=
 =?US-ASCII?Q?X1E001DE_Snapdragon_Devkit_for_Windows?=
User-Agent: K-9 Mail for Android
In-Reply-To: <eqy4yicgeqlgaytgzybnitvbrdr7jmjjk5k2swmadad6scwk77@ubaf7a2kgmdm>
References: <20240911073337.90577-1-quic_sibis@quicinc.com> <20240911073337.90577-3-quic_sibis@quicinc.com> <pt4wtycddqhcvw2iblaojmzsdggmlafft4vu6lg5j2vstbhbqj@acenyi5k3yeq> <eqy4yicgeqlgaytgzybnitvbrdr7jmjjk5k2swmadad6scwk77@ubaf7a2kgmdm>
Message-ID: <1BBC34CC-92D9-4F6E-8DFA-1F2DA36D545A@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On October 1, 2024 5:42:35 AM GMT+03:00, Bjorn Andersson <andersson@kernel=
=2Eorg> wrote:
>On Wed, Sep 11, 2024 at 10:55:05AM GMT, Dmitry Baryshkov wrote:
>> On Wed, Sep 11, 2024 at 01:03:37PM GMT, Sibi Sankar wrote:
>[=2E=2E]
>> > diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit=2Edts b/arch/ar=
m64/boot/dts/qcom/x1e001de-devkit=2Edts
>[=2E=2E]
>> > +
>> > +&pcie5 {
>> > +	perst-gpios =3D <&tlmm 149 GPIO_ACTIVE_LOW>;
>> > +	wake-gpios =3D <&tlmm 151 GPIO_ACTIVE_LOW>;
>> > +
>> > +	vddpe-3v3-supply =3D <&vreg_wwan>;
>>=20
>> Please use pwrseq instead=2E
>>=20
>
>What benefit is there to wrap a single 3=2E3V regulator in pwrseq driver?

First of all, is it really just a 3=2E3V? Second, is it actually powering =
up the host controller (as expressed in the device tree? Is it a power supp=
ly to the slot (in this case, I think, it should be expressed differently)?=
 Or is it a power supply to the card itself?


>
>> > +
>> > +	pinctrl-0 =3D <&pcie5_default>;
>> > +	pinctrl-names =3D "default";
>> > +
>> > +	status =3D "okay";
>> > +};
>> > +
>> > +&pcie5_phy {
>> > +	vdda-phy-supply =3D <&vreg_l3i_0p8>;
>> > +	vdda-pll-supply =3D <&vreg_l3e_1p2>;
>> > +
>> > +	status =3D "okay";
>> > +};
>> > +
>> > +&pcie6a {
>> > +	perst-gpios =3D <&tlmm 152 GPIO_ACTIVE_LOW>;
>> > +	wake-gpios =3D <&tlmm 154 GPIO_ACTIVE_LOW>;
>> > +
>> > +	vddpe-3v3-supply =3D <&vreg_nvme>;
>>=20
>> Please use pwrseq instead=2E
>>=20
>
>Ditto


Same set of questions=2E

>
>Regards,
>Bjorn


--=20
With best wishes
Dmitry

