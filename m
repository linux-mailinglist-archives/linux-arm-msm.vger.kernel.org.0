Return-Path: <linux-arm-msm+bounces-10846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A71BA852DDF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 11:30:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 625B0282934
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 10:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB3A122638;
	Tue, 13 Feb 2024 10:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DcNcbdEK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B5322625
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 10:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707820200; cv=none; b=qo+TBC46fFy5JoZ+X6ASNvsRUDpGx6oS7VQvUjh5byZsxVO28mxXio8oLRLD4+fQzSOBZIWSiDYmoTrSiFvhZ/FsggSyVXSdNKK5euLC4gcBoXP1stC+ubCVKo3TELpHUqF4KzOQm6EvrMbZsAqrGLAxsHNnv+9P4cc8OTm8lc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707820200; c=relaxed/simple;
	bh=BAFPNPzJQXtyCWF5XDn1RobzHn1V1SnAs/ZanbUdfKY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NmJp+1zB86PhCr7Efx840bAH0TdWJpSEb/zbEbo+lqlrj6VcrnQXxy1rhKDB+QRqRM11/lqvMT0hEg43nI4erQAQuFgX0Kpx0Z51UmH+CR04uaot5YeDoNAvoIv/hBBE+ud7JiTmB53MT1ecA/AO6oypnY1STIeBQ1DBAKVTaDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DcNcbdEK; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dcc71031680so536636276.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 02:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707820198; x=1708424998; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+EqDonj7KQZLiaPp6D4ZvH1t+lrAEwUNc/fnEAHBEOI=;
        b=DcNcbdEKUxMv4AtS+vABGbgp0+Yl2IvqLbxYGiAwtW96WJ2uzGzFpCsdsJV2NigBmv
         72oKFdlJmEwojo3olVaRTcsMmVIQqI3UDtSzqFSsT9yG/xKR/TEYi4KZCnC2DMtJa7Ng
         4wo18UIcsvKnjuVSq8u65kcNBzl9tMVVVh/2CmdvU59oEky8eWuJ9qC/duiTLnNxmmsf
         7LuOL21lAhH904E+T2V1nJyK6S+7O4+eN4/ua1BZU/JrhGgYBjJBbNyg/KpZsiI6oy1H
         dVcVqa0NoPpvEJOrBjLFSXJMjCIhyOslNq5ot0WEcxMDI3cWy2U6fn148pmJmxIRUMHW
         aBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707820198; x=1708424998;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+EqDonj7KQZLiaPp6D4ZvH1t+lrAEwUNc/fnEAHBEOI=;
        b=BjdWk3hw4ephRQjd1R0H07uUGYazBcEf43aFh3sRcc8hFsx91qKjYttRrlCeENjB7n
         TGglz6x8O10BOT/0ZT1nWdwvU4XjW2r9HdiqH5ig+zODGsL5IvPirR0bwQoP3hlSpX65
         eHVDfjdY+SXWz0huFLQ+rjpHee0alBoOQDsmPfr2sPS3zx4VPhXxf8yexCWi+bVWwb3f
         9Ii3GBEb2OT5gMZGArVKRVWrir/EDRlUMfW695044qS8tZajWhqtBT7aZ3c/wYq7IlpV
         EcxPjrkJVZ7fVs83Fm0YdY0GFnaVlrZPLzpo+3vrtcRoCBS0mdhYMRoUr/DSpq3PLT+r
         NMew==
X-Forwarded-Encrypted: i=1; AJvYcCXAMcsrr86J+GJkpViSq4tYpp6GV+B6xAaS6cn2Dy241845ioth6bnazl1+qr64ZLi3dIw9cWTj5dDIOtqc7+Epip5BHoim/ORNSMWQ7A==
X-Gm-Message-State: AOJu0YxfQvzr2Kny5Pwf5+Psaf+yTLtgyRxvc0ump+dGkAP48pQnWPo9
	FmXgGDtHS6oTEpIq1V2FlDnp2RhQy80MbfjT5Ncy14fChoiFjfaxUT9CwPGW64+f95rolnybPA9
	0xGhJRr7WJfupGOEyTe6mxlu7qHDGxQEo9SraFQ==
X-Google-Smtp-Source: AGHT+IHkdJx+zFat9qPbr3h4Rdcuck1pBATP4FKcmKR8VS5uJISAam7tCEk56SEDoapPdlF1E/YwhM52Daf0RNngWRA=
X-Received: by 2002:a25:ad45:0:b0:dc7:4313:8b6f with SMTP id
 l5-20020a25ad45000000b00dc743138b6fmr7824715ybe.54.1707820198159; Tue, 13 Feb
 2024 02:29:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240121-sm7125-upstream-v4-0-f7d1212c8ebb@gmail.com>
 <20240121-sm7125-upstream-v4-2-f7d1212c8ebb@gmail.com> <20240212222232.GB2655166-robh@kernel.org>
In-Reply-To: <20240212222232.GB2655166-robh@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 13 Feb 2024 12:29:47 +0200
Message-ID: <CAA8EJpoymmOBc3CfNHJKBT8BNje_s2a5uGPde3QHYv3vQ97=-Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/8] dt-bindings: ufs: qcom: Add SC7180 compatible string
To: Rob Herring <robh@kernel.org>
Cc: David Wronek <davidwronek@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, Andy Gross <agross@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, 
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-phy@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Feb 2024 at 00:22, Rob Herring <robh@kernel.org> wrote:
>
> On Sun, Jan 21, 2024 at 05:57:42PM +0100, David Wronek wrote:
> > Document the compatible for the UFS found on SC7180.
> >
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: David Wronek <davidwronek@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
>
> Should have been picked up by SCSI/UFS maintainers, but it
> hasn't, so I applied it.

And it now triggers schema warnings, because sc7180-ufshc has 7 clocks
and 1 reg entries.

>
> Rob
>


-- 
With best wishes
Dmitry

