Return-Path: <linux-arm-msm+bounces-14479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3FC87FAE2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 10:38:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9109F1F217DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 09:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 281707CF32;
	Tue, 19 Mar 2024 09:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D2TsQOCc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB3565190
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 09:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710841077; cv=none; b=KKhgDxaRuM6m22U8PN/o26owYk2OIlgXT7EgwH/Rffp+dHlamrjJ1tJX75Z/eMWvejcwx9hIyVheMjrMK4pxWUtNqDALATIm1+ud/QgJTop752HNuSdEnYHA3tJL1Q4yfa9OtVgFkFyKJXYNiCUd2+lfsDosNGGlIpmPfg7Oo9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710841077; c=relaxed/simple;
	bh=NYqDOjc4VvlYMBZCPVKTsoR8LL5jTNNjdP6ZtbU+Yik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W61wGp7UHKOrFDTOvRtBIqCd1YDJ569seyqtaa+gteEC51Z+xoF9pN5lpAkkX/RV7voPCOpXUJrXSy7nSM0a2i/IjBerzYRmzwODWUFEo6N9LATSppVOBn76XeBi2uAKq8op+HkhlRHjMyPw3rK1dw6JO1Ki4FG9Zi4oVyaEsL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D2TsQOCc; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dd161eb03afso4587976276.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 02:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710841074; x=1711445874; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qrcvve1Iyn2xTwuhx9XNZ3GNMgVq51TYECbcvo0tzmU=;
        b=D2TsQOCccc6qlq2EKHKHkAYWNp4L8Lyh+XLjJFcsMxRMCW1s2s+MU6hzfcS6eM2yCs
         ZS2jbDTpINaPKHIFF6cg62aW03scB/GCqsU5xOub3egTn3pu28IFdcCqqkno+sT/adqU
         48RQlMvYt/lxXt/wR9WN1nRQEGdbjB600ykk26JnWZL2097lXTB/ToZFB2KRCO/4yuiD
         7oSWlMlmcRGkZ43uq2cwtzi82l7yGnorJK7rdG5kTadP5Y6CZISWkLzSLpGcPYnQsVvu
         PHjZMv2wwq6W+KphfQIGZ4guBUPWvpgz/9vqSmoKcoJ4UG/z7HGnBi8NMc7udeEDsXKQ
         Mm0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710841074; x=1711445874;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qrcvve1Iyn2xTwuhx9XNZ3GNMgVq51TYECbcvo0tzmU=;
        b=TEDsqyVgmufWkc0cLwWVhVMLlHnaaYuXS8j92FW9Ge7AugfcqMiGBMAJtwK0U9U6TG
         cq37/O/GTCpuWJjfX5fS+NqrU1w7KNUqSl/ObHzyeCJlaNlu2TPmT4En4oDwvpEeRH+A
         X23y/f2o2315Rv+a2Fq6hhXlN8vbj8ESQgYsQdlJxJZK2EuiQ62/jwGNp8RewH2yhiBI
         WuSc5B5mbShJABIUyMkNEzzODagO2hDx2S1sxufMw2WX32rj5rTAxGpPTWgKGrnnwUJF
         R9Q3AOXTKkj4FobXgppeL3/+jupmT9Nivwy+wSxfh+r0qrYqpc4NvwNYmiqDdWuUv+2k
         Gv/g==
X-Forwarded-Encrypted: i=1; AJvYcCVZmewIXO/fivGd78Yc/sLuNVKXe+f74159J+zbbceA6bi2kWlG1ZBaL2HJPERdSMYqgh5/6LbnROT8+upeQBJYgm+rRSDYfO+5YDbJ1Q==
X-Gm-Message-State: AOJu0YzZzvDeEF+vnfQQ0T33Q4B/HeGoCO7Srb5NEo/hkOPli7vKpTxo
	vR1xLTap0P59DiOM0vaCs1nBgwiIRJiQmqWF7IB405NbdGjois2O4dfpYbk4EBsPqhRa7x5jFA4
	JHYOw0q5qc0xKgXveSirw2zOBUWTlCiFut3know==
X-Google-Smtp-Source: AGHT+IEjBNpw3ThkU3XrQNHH4xXZJm+TlabCx/A85tg6nsSrtiJltqJOY+O9RuAlTQao9NiQiRx91/ZqpNe8JkwaKpE=
X-Received: by 2002:a5b:6c7:0:b0:dc6:2e29:4262 with SMTP id
 r7-20020a5b06c7000000b00dc62e294262mr11631059ybq.58.1710841074354; Tue, 19
 Mar 2024 02:37:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240319091020.15137-1-quic_kbajaj@quicinc.com>
In-Reply-To: <20240319091020.15137-1-quic_kbajaj@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Mar 2024 11:37:43 +0200
Message-ID: <CAA8EJppnDspUVf_feZnH2w6RY+8PDJ4CiKyDs5yxy7uofCPGCw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add devicetree support of USB for QDU/QRU1000
To: Komal Bajaj <quic_kbajaj@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Mar 2024 at 11:10, Komal Bajaj <quic_kbajaj@quicinc.com> wrote:
>
> This series adds devicetree nodes to support interconnects and usb for qdu/qru1000.
> This is based on previously sent driver series[1].
> [1]
> https://lore.kernel.org/linux-arm-msm/20240319090729.14674-1-quic_kbajaj@quicinc.com/
>
> ------
> Changes in v2:
> * Changes qmpphy node name
> * Changes dr_mode to otg and added USB-B port USB role switch
> * Dropped maximum-speed property from usb dwc3 node
> * Link to v1: https://lore.kernel.org/linux-arm-msm/20240311120859.18489-1-quic_kbajaj@quicinc.com/

Same comment, please version your patches properly.

>
> Komal Bajaj (3):
>   arm64: dts: qcom: qdu1000: Add USB3 and PHY support
>   arm64: dts: qcom: qdu1000-idp: enable USB nodes
>   arm64: dts: qcom: qru1000-idp: enable USB nodes
>
>  arch/arm64/boot/dts/qcom/qdu1000-idp.dts |  65 +++++++++++
>  arch/arm64/boot/dts/qcom/qdu1000.dtsi    | 133 +++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/qru1000-idp.dts |  65 +++++++++++
>  3 files changed, 263 insertions(+)
>
> --
> 2.42.0
>
>


--
With best wishes
Dmitry

