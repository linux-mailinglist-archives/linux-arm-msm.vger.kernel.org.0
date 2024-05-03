Return-Path: <linux-arm-msm+bounces-19156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2A48BA729
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 May 2024 08:36:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE0901C20298
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 May 2024 06:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA5BE1386D7;
	Fri,  3 May 2024 06:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b="JgeKiXLQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E75282EE
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 May 2024 06:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714718165; cv=none; b=ovAc/4IzSRVstTLoLPKUb6Rsjn1I6FJ9TUBWwkAm93h9m91dxXg13a1MpEM1oxkPqr1Ege4vf16N2dwrLOmUuVx6ZXOFrgSr/EoaC9a91xLtpHFjzcO36OcZwebqfk64o7MkmFmWy2nkG0jYsQhHBPWgZeOEJjAx8+4YD63L6U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714718165; c=relaxed/simple;
	bh=cd7yTrt6GWBxWkHwzMQubHiZtWWF/F5VLurzT+aYYRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BbOKFnRMVgwwxLPpScRgIr9zHf+r1YZ1wRduG4YJ1+AhnpoHIZAUzBD+yWWUoAKrGd2pyWV6SKpggf9a/vAztOZch+kdCWgu1iS1DZN1pftyV+P8w23psVw44vtqqp1TRa8FW3ow422rB1DtQN96js3ohudy74kCgoJnP/dfULg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org; spf=pass smtp.mailfrom=kali.org; dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b=JgeKiXLQ; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kali.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a58772187d8so1162837966b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 May 2024 23:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google; t=1714718162; x=1715322962; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKZVfrEnHgDm/tlBdppJQIcDCasqaomHZPpbSKozHVo=;
        b=JgeKiXLQhUseedrl2W/BOeLFvEHyHDnAKbiuloE3Ff4XJ20tRLTQ4nNN/RdCTq/i/G
         Duu2BKrTOMDozCiqaEMbfwjbhpX8ZHOl948Gv7+iHCGr+sau0kIsi7f+VFa3MvcxoAvF
         BhASqNLNdje19IIGObTYqSowqB06gg4Z76u8gNxuZtzrPI4E1SakjhukwljmuCNA9PSf
         CjEaBdKexnVQra+ivvpu2EdWfftXIN/VMt4LSLqA82aBtf0b0CI9GWgz3LFbvgmnEPD4
         MeYx/YQRQblDbYEPvncDtHBRD9Pq9jEUKa+gVG+gpjRwocE2Lk8wnXvG3bPUtNJLTqBL
         +PDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714718162; x=1715322962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HKZVfrEnHgDm/tlBdppJQIcDCasqaomHZPpbSKozHVo=;
        b=uDE9g7p1zemxgxpyD5bOJBQI0tLjvrcmR1mYMHqxgqo+lhdQ/uywvEiUZ2UoCWDZdf
         7K3+ojyNwKdlDdyNFMLpQgOsw/ph6xk/YhksP1iWSAOh1+NNCUe3j7q01S5bA1AtlUT7
         wvIS08xRkaxcNsFCIgvQ+pS9GXs0vwbptaIwQyuFuokoykNDVRnhnR4nWsp0SI/icuBB
         pJScY0wwM2xtiK/azLkLhUpIsJDKxJxwlpxUuqU02oFALeWq/T9HwFw7jzuihsZx6UiO
         5pPZ2oxSF8pw01Ga55umoD4oeOyfOHNJQ15NDt16BOce/ZXdySRb9VB3MQCmL3zB0EtH
         8WAw==
X-Forwarded-Encrypted: i=1; AJvYcCWn6y5qA5RGWe789QALqej6vkLbxIy+xgxvsolIXcp16WrqziXMIsybHQWgH+LIK5PBzxzFMSzhVOaQ5eCUb/CsanzM/EAjgkzBraYY2g==
X-Gm-Message-State: AOJu0YxijvqMvyi/nB4ORIzhmNeo5eEEVFrTPuvtGJSQEz3P7bvs4I67
	HH42MQMV35D5K0Zm2nIXfLui2a50FoBIP40jdYajupwi9SBNssIFUQI021OFc478ynfIQibGd90
	G508UpGEyCQZ6Glu2l1w8GR87QQkc+zeD3CRupQ==
X-Google-Smtp-Source: AGHT+IHJT537wyzxsdoNYXT//WCkrfyVvA5aV6ewIY0e2q5E9nRhCBRhsDywWt1RP69zblCAg3piQ7kt3cTya8BgsNQ=
X-Received: by 2002:a50:8e15:0:b0:56d:fb36:c388 with SMTP id
 21-20020a508e15000000b0056dfb36c388mr1389392edw.9.1714718162420; Thu, 02 May
 2024 23:36:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240307-topic-8280_nodes-v1-0-4eba20e08902@linaro.org>
In-Reply-To: <20240307-topic-8280_nodes-v1-0-4eba20e08902@linaro.org>
From: Steev Klimaszewski <steev@kali.org>
Date: Fri, 3 May 2024 01:35:51 -0500
Message-ID: <CAKXuJqii1FjG64m1=3J_P0LmeV0FKgcxXF3V7Rz4imasVmeDcQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] Random 8280 bits
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 7, 2024 at 2:26=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linaro.=
org> wrote:
>
> As the series title and patch titles say
>
> p1 for Srini/nvmem, rest for qcom
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> Konrad Dybcio (4):
>       dt-bindings: nvmem: Add compatible for SC8280XP
>       arm64: dts: qcom: sc8280xp: Add QFPROM node
>       arm64: dts: qcom: sc8280xp: Add PS_HOLD restart
>       arm64: dts: qcom: sc8280xp: Describe TCSR download mode register
>
>  .../devicetree/bindings/nvmem/qcom,qfprom.yaml         |  1 +
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi                 | 18 ++++++++++++=
++++++
>  2 files changed, 19 insertions(+)
> ---
> base-commit: 1843e16d2df9d98427ef8045589571749d627cf7
> change-id: 20240307-topic-8280_nodes-da70ee866935
>
> Best regards,
> --
> Konrad Dybcio <konrad.dybcio@linaro.org>
>
>

My apologies for sending this so late, since this is now in -next,
but, I'd gotten reports of people with the X13s not shutting down when
using "my kernel" - I finally had the chance to dig through and do
some testing today and it seems that with this patchset applied, is
when the X13s will no longer power off.  Telling the system to
poweroff or shutdown simply causes a reboot instead.

