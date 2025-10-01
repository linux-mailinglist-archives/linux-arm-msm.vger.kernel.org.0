Return-Path: <linux-arm-msm+bounces-75626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBB3BAF0FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 05:48:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 07BBE4E05EA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 03:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C5142D6E59;
	Wed,  1 Oct 2025 03:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kWI70OFa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E3A156F45
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 03:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759290526; cv=none; b=L17a4LmEEbX/McAQDrTXmMC2N5bJ+BnufmrkaZl7owrhzVT/qq7k+QXZEnNAsY9eyqLBshDzBIv6wXr2LT1zdI4GjvYdzCPWBkmz64IQNyfye9hAXvU45NTnJQcq/3xnuLbWJM3Mtm2cv3MWSwqK35mmUvTFZWYHui8OGv8Cg/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759290526; c=relaxed/simple;
	bh=EdNmg14enyeeRuZIuVOC+Qcf5V1I3CceI2oqzht2f5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uVkli86yqx1kFEeNDwlJQMmk2qHX4F4PQWdJ+DA6IPwsRj9VXJl+5iAyG+AYzFNCRykrlldbqKliiYSnHvzfnQvVooRthlCSZu7qTcl4Jup6HvpXt5SzGpMHQdvdSzX8wA3+0hNBpKz4AiSzpaEl8TjRPkBIkhyy8yZFsOfrvbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kWI70OFa; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-57e03279bfeso836542e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 20:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759290521; x=1759895321; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bbDGpgTcV4nPy99Bde42+h9SYqbXF4/JT7azRtjchCw=;
        b=kWI70OFa11lNMwKHkKu1QNCj9EcNG4km6asrQIIQI7Bi0dMjrCVEHMhWHe1MeQv4Fi
         jiEOBcxXiRhqI66us7r6RwQOMgvZgePKYhA/yJGw/XoX1yh0sCfCcdWCCVyt6Mdz9IMt
         ieAj7Fyr127dLOQ2vVDeyJgw36axUIGVZ9B98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759290521; x=1759895321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bbDGpgTcV4nPy99Bde42+h9SYqbXF4/JT7azRtjchCw=;
        b=vuDe0NRybDs0vq3cUcVI5RPpO72TFqTJfZgWZyGwwsd0FOR6TlLS/EBVcAiJUIkNr6
         ET7X20RFfkm4/92GvTOOdGoycGbf/t+XuYeOQNcFI9IpM/2k//tbwLpMIuVfu+LGNUYu
         CUUt1wxv3MWbyTF5Zk2JLYDujXD6ZvKBwM279521uZzcYSBiDS6b8ubOGqqjP/ov9QHf
         uBuWmwpRld1kSbZ6BE4fDOqLNH8S5xLMrgPpOG7blIELV6sATN1idRkxa0X/ZdetY4Uz
         83dS9eYgC6Axcwtc6XZtm3Bo1QadZ5+4ON3VXL+2w7TOM+S8LPl2fslTWj94HbQe2uRz
         WSxg==
X-Forwarded-Encrypted: i=1; AJvYcCUhOyNtsFPHdAF44CIR4aiDj7gSjw/siK0yHjZpGi4g68Emfd9v2fX+xI99LzvVvqrZTZeXr2Phpm92Hyr4@vger.kernel.org
X-Gm-Message-State: AOJu0YyXaZM96NI/wFvVhHDEREoKnHAnmhiPfbpL5n5gKHVagvKoX9aL
	7U/RO64mYypqZpjMsq7i537s2leBzd79pYAXquwn1ZbmJNBcKpEb5FpM4rVP0+IqyelGUO2iW0F
	VdDCaa1j9ikYYXBDctjP61Kzi/9orsXdXujtSycE5
X-Gm-Gg: ASbGncuYhB0CkbTwoiXwQm22fXiJdKRrXjsUXjmL4rGE/38g7IuEo5kUkXUIGkItNEJ
	Qic0rLM5B7KYnME528PMluqDrxPF6I50JKpCjmTFrHryqWG6kVUEzd3q38tSGzJ7kH5qXc5fgos
	77ljfjoRlpp+BxPZoOzmPoJiv5tL5G9RHXsN0XJG9OPgG4SHoWL3xy56tFbm/uW6gSZ0lWI4XAg
	O7y5KtvGFYSzEYk+DkzbWEuuT2Ckl7LJCkJ7Ukv5TzC7Fcr4Y75KAk2gQvltw==
X-Google-Smtp-Source: AGHT+IEt27GdUNuEil1oCZ0SLhwUHChkXL8gmJhktqVVplGqcGKrSSp67qADibM4PY5Cnx6ufacc+rJwkmcCX3eGhbM=
X-Received: by 2002:a05:6512:6181:b0:577:a108:93ca with SMTP id
 2adb3069b0e04-58984e225bbmr1821361e87.28.1759290520880; Tue, 30 Sep 2025
 20:48:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1710418312-6559-1-git-send-email-quic_amrianan@quicinc.com>
In-Reply-To: <1710418312-6559-1-git-send-email-quic_amrianan@quicinc.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 1 Oct 2025 11:48:30 +0800
X-Gm-Features: AS18NWDDl3OS7A4mcJKeQv_2tDSls1y22vmY0gN81pxraCtuEd9IP-mkQAX3bNg
Message-ID: <CAGXv+5FQSETv62FS32=eadBWwZPB_ShaJ3_P0cksnL=sdBwkFQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add board-id support for multiple DT selection
To: Amrit Anand <quic_amrianan@quicinc.com>
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, kernel@quicinc.com, peter.griffin@linaro.org, 
	caleb.connolly@linaro.org, linux-riscv@lists.infradead.org, 
	chrome-platform@lists.linux.dev, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Amrit,

On Thu, Mar 14, 2024 at 8:13=E2=80=AFPM Amrit Anand <quic_amrianan@quicinc.=
com> wrote:
>
> The software packages are shipped with multiple device tree blobs support=
ing
> multiple boards. For instance, suppose we have 3 SoC, each with 4 boards =
supported,
> along with 2 PMIC support for each case which would lead to total of 24 D=
TB files.
> Along with these configurations, OEMs may also add certain additional boa=
rd variants.
> Hence, a mechanism is required to pick the correct DTB for the board on w=
hich the
> software package is deployed. Introduce a unique property for adding boar=
d identifiers
> to device trees. Here, board-id property provides a mechanism for Qualcom=
m based
> bootloaders to select the appropriate DTB.
>
> Isn't that what the compatible property is for?
> -----------------------------------------------
> The compatible property can be used for board matching, but requires
> bootloaders and/or firmware to maintain a database of possible strings
> to match against or have complex compatible string parsing and matching.
> Compatible string matching becomes complicated when there are multiple
> versions of the same board. It becomes difficult for the device tree
> selection mechanism to recognize the right DTB to pick, with minor
> differences in compatible strings.

I plan to revisit this topic, and also include device tree overlay selectio=
n,
at Plumbers this year. I was wondering if there was any progress or changes
on your end?

Thanks
ChenYu

> The solution proposed here is simpler to implement and doesn't require th=
e need
> to update bootloader for every new board.
>
> How is this better than Qualcomm's qcom,msm-id/qcom,board-id?
> -------------------------------------------------------------
> Qualcomm's qcom,msm-id/qcom,board-id are not scalable for other distingui=
shing
> features as we need to add a new property every time. Board-id property p=
rovide
> a solution that the bootloader can use to select appropriate device tree.=
 Board-id
> encapsulates soc, board, pmic and oem identifiers. Qualcomm based bootloa=
der can use
> these key-value pairs to uniquely identify the device tree. This solution=
 scales well
> for cases where additional identifiers would be needed for device tree se=
lection
> criteria. Adding a new tuple in "board-id" along with "board-id-type" wil=
l help support it.
>
> Changes in V2:
>  - Based on comment on V1 related to challenges on designing common bootl=
oader for all
>    the vendors, where different vendors can have different representation=
 of board-id
>    and the best and exact match logic can also be different for different=
 vendors, moving
>    the board-id definition in qcom specific binding.
>  - Adding support for board IDs for all the boards that are in kernel.org=
.
>  - Adding Qualcomm bootloader best/exact match logic for multi DT selecti=
on.
>  - Keeping list of other vendors in CC for comment/awareness related to t=
his requirement
>  - Link to V1: https://lore.kernel.org/all/1705749649-4708-1-git-send-ema=
il-quic_amrianan@quicinc.com/
>
> Amrit Anand (2):
>   dt-bindings: arm: qcom: Update Devicetree identifiers
>   dt-bindings: qcom: Update DT bindings for multiple DT
>
>  Documentation/devicetree/bindings/arm/qcom.yaml | 90 +++++++++++++++++++=
++++++
>  include/dt-bindings/arm/qcom,ids.h              | 86 +++++++++++++++++++=
+---
>  2 files changed, 167 insertions(+), 9 deletions(-)
>
> --
> 2.7.4
>
>

