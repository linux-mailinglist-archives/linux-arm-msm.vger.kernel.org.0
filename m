Return-Path: <linux-arm-msm+bounces-22806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F59090A711
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 09:28:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30CFA1C21F96
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 07:28:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 441A818FC76;
	Mon, 17 Jun 2024 07:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Cn6yD3BX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9952E18C326
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 07:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718609318; cv=none; b=RTec/hsGifop15kKNJUaCIPIo6ON6b6tbLOvkio2KPgwUv1P1QDMBlMlbcD+mB0XdztDYv/2D4e8UldIwqBbJHjKq9uy7c1QGlStiUr3MgxcJ2ktXBZH1bp2gCwHdbDGITPnvNT3ssXA19WO5upLbF44fAM+T4sJcEqzpuFnnP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718609318; c=relaxed/simple;
	bh=LbcaeO7g+XXyhIaUIw2LMzHvMLsMS1SLl4XS875bxSQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=AQAvc1+jvdBqhrQgSKPXTaA2k+N7dHKhAZ/1HTKqSweJiygaq1KDA1HazYiUglm6HJBNFUv4DE2ndJnuCkklgjgXgS6GsIRn51sXu8lXKdswHmKlIou7qgGHSXvKI7YLUFAZZrRYqwCQ09FLNwQkfRtYFLF0GNqk6pQLDLlfSVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Cn6yD3BX; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-57c923e03caso4549851a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 00:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1718609314; x=1719214114; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tHyISATt+WJttxke6EIQCpnTGfj4Yi4w9h5lYCsDGOA=;
        b=Cn6yD3BXNbUHuD6e8UeUFwPued5uoqrTSdRLwLV5djzNp37k3xsuocbuXKhvnDbA5s
         tQdheveSiI/PGMn1LiNJKKbdUniLY3wbu89tMrMmzqcG2DQWmPrVeLv26GvY4yWS3IhA
         yByf7bwqOWlCIKujKZOwEUaCcv67kCoX5HBEvVJkbSUM2fRR3ut/pv4UPJBMEctNvyPn
         RjgZYKjosxuAKp+FdnFlmkItY8F3VTDePg3GP604BBDpHAEW6WV0Zbr/3/2DE6VtLi1f
         GS6jP0IehEUZUKpy27BaDfQtrYhqOG2oXwKAYruKLFGqo0ou75MWmWmfUWBJoj/UIfDy
         8LjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718609314; x=1719214114;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tHyISATt+WJttxke6EIQCpnTGfj4Yi4w9h5lYCsDGOA=;
        b=wPMZ0XgbYueEBG6G/vQuDNz1qtpyygiCEgcYw8Qwa5ObLAD2xPV3LXo6QlCvqKNQa5
         WPAp1TUoZ+hlCgyx4bLrhNvS9O5W4HztnSLJza0IMcDK7SiVu1wVl6KC3t2iC6l/zR6o
         fjUc1et4EAv/cbj0uycZQyKsPt0bRYxnEKonLTlcPzsFMp4duCztL2AXYsyrCzYx9nu3
         OkhWDBNu+eJFkUvFwT+rmfevfgrBgBPamgFnTB1Vhg1Pe+3jOWyRbjjZh4H5RS5Jg+qL
         ZVsMxqfqgJfviJ8oWKMHuVw5Z7KVtV6VWlSLfgZNeSUBX88juYEvIuL0MrLr8ZSwFzcr
         FMfg==
X-Forwarded-Encrypted: i=1; AJvYcCX+nLYshaOFV139WNDdKeBX7USouYKVI2rEmfQ00kfvCPjyYQee9iXRApFI+ErZPjrqcKoEOg3T8lzUDQkLt7x2razH5p5Cp089+EGACA==
X-Gm-Message-State: AOJu0Yw5MdzR7gD7ATTbQ26rjX7Cyi3ZG5Jk9zfMRnWpx8l9q33V1il0
	Tf2NBSodwZu4MuleRZ1DV0eBsfnrxRUYJP9MtvKOZM/15yoO9CPf1Aw5HMEt7uo=
X-Google-Smtp-Source: AGHT+IE/Y4LqXgdNZ0zcQVhr3sQUeAw8IWyATC1u6ONvFcRL9KXrD7KEcyjfA0ImOde2Km0XLQNqxA==
X-Received: by 2002:a17:907:c081:b0:a6f:77bb:1713 with SMTP id a640c23a62f3a-a6f77bb1889mr294286966b.9.1718609313862;
        Mon, 17 Jun 2024 00:28:33 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56da328csm494948466b.12.2024.06.17.00.28.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 00:28:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Jun 2024 09:28:32 +0200
Message-Id: <D2245MXG8CS1.11EGKFJQLYPTI@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konrad.dybcio@linaro.org>,
 "Stanimir Varbanov" <stanimir.k.varbanov@gmail.com>, "Vikash Garodia"
 <quic_vgarodia@quicinc.com>, "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>, "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2] media: dt-bindings: qcom,sc7280-venus: Allow one
 IOMMU entry
X-Mailer: aerc 0.17.0
References: <20240412-sc7280-venus-bindings-v2-1-48ca8c2ec532@fairphone.com>
 <D1Q6CMZM78VI.ABYGRRV5E61B@fairphone.com>
In-Reply-To: <D1Q6CMZM78VI.ABYGRRV5E61B@fairphone.com>

On Mon Jun 3, 2024 at 8:39 AM CEST, Luca Weiss wrote:
> On Fri Apr 12, 2024 at 4:19 PM CEST, Luca Weiss wrote:
> > Some SC7280-based boards crash when providing the "secure_non_pixel"
> > context bank, so allow only one iommu in the bindings also.
>
> Hi all,
>
> This patch is still pending and not having it causes dt validation
> warnings for some qcom-sc7280 boards.

Hi Rob,

Could you please pick up this patch? Mauro seems to ignore this patch
either on purpose or by accident and I'd like for this dtbs_check
failure to finally be fixed.

Regards
Luca

>
> Regards
> Luca
>
> >
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> > Reference:
> > https://lore.kernel.org/linux-arm-msm/20231201-sc7280-venus-pas-v3-2-bc=
132dc5fc30@fairphone.com/
> > ---
> > Changes in v2:
> > - Pick up tags
> > - Otherwise just a resend, v1 was sent in January
> > - Link to v1: https://lore.kernel.org/r/20240129-sc7280-venus-bindings-=
v1-1-20a9ba194c60@fairphone.com
> > ---
> >  Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.=
yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
> > index 8f9b6433aeb8..10c334e6b3dc 100644
> > --- a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
> > +++ b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
> > @@ -43,6 +43,7 @@ properties:
> >        - const: vcodec_bus
> > =20
> >    iommus:
> > +    minItems: 1
> >      maxItems: 2
> > =20
> >    interconnects:
> >
> > ---
> > base-commit: 9ed46da14b9b9b2ad4edb3b0c545b6dbe5c00d39
> > change-id: 20240129-sc7280-venus-bindings-6e62a99620de
> >
> > Best regards,


