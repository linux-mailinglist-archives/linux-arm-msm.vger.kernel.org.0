Return-Path: <linux-arm-msm+bounces-26212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D033C9318A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 18:41:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 868151F227CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 16:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AF9E4643B;
	Mon, 15 Jul 2024 16:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sHqCNBNa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C52481CE
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 16:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721061636; cv=none; b=N2/bTi9C+WZBenEIcUPunL0HWlckXJgM1VXFS0XTBkpmgVq75/NFzYGv7pep/aCnxcokBV9obszhwr7sEklN2wnT8MLL7Gt0KkrFQhnXm5ZKbCN/4wj9bC27aQktkOqND4jGNqPcbQDwR5SXVPyWmaddJC7UIBAJcmJz2tA8SKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721061636; c=relaxed/simple;
	bh=9f8Qe6ie90wo/DDF464tuizO4E1SnfvAfFUf1QUmyUw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BGoRURyI4pAeIJe1AKKmvS7o8BS3UmHQaWFppwso2VBFq28gfJq5ZI68WgCxutndCwMry8MPszMy9faDGx3QUW7TU4nvmsRsW1OBA3Um0sEV0t5lIYcU1/rqnAiIp/1fhGXIJXRIebzVf8Jd+pPPot6/O5f9g6tl+kr3rKqhKdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sHqCNBNa; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-654cf0a069eso37847677b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 09:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721061634; x=1721666434; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=en6+puohAfynQkBKEllMr8eQHTxPNgc5bkI+PFZYQQg=;
        b=sHqCNBNa8O1RqbaNGyAVX4Q28wVhrwLbZRT8aSaCHz7aQuXll2sN5miMFWCC8kCW73
         GIIUBweicQpbB8OX+2h2I8ZRzGHumUs+Bre0aQg7PKil+PjsdowX0vG7zHy6yw/JlRKJ
         BZDm3UPvY6TIKfBP58ksnaHI3S78qSUQMRGGQ3yn5EqkZN2YM50UhzDtMB1NeWBSGf7t
         CwhCKfta5dWORwXgwGR/3UkX86fm+Gbu3kMuN+l6vpzzKW9UZTyLeP2CyJ5i12xxg5Jd
         JVOHHf6DYlvfpw7U8obdQri4H46LGPKPKWQ0rgUwaUAUbdgnh52se+rgykvTZIsxPCpP
         hArw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721061634; x=1721666434;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=en6+puohAfynQkBKEllMr8eQHTxPNgc5bkI+PFZYQQg=;
        b=uE7Jr9qcbgvAyyYnEZ66z4mT4Dr3Z0ka0FkYzCJ5BkMxd4OK9k4PfS5nKPRck4o733
         /OaD4Gl488/rwgEw7MX9mMU6D4mJ2f6NN+iuGSVmirn/47Y0N7BlkAZhGrHPsxTgH0yL
         pn8t2YwLtqfqgL2Ev35B85xBNZ8PgJ2OLmCW5a5Kt9kCnFVfZ2jrSKZs3i5ZK8yBXzb+
         QC8iJPh/G6adJnrexoHQnKAOcJDz0zINiZbND9VzLDMmXgAAR1tDZJ7uJGH6/LazNMpL
         OdpEaSo9JRv51V0rMirfYX18E2x+7HMjhNgdv3BCrmtoN7M1hTux+feQTLwk2R2UEdE9
         /QBw==
X-Forwarded-Encrypted: i=1; AJvYcCWNawaEafkM3Bdt2stm+NG8Zy811HUESzsjfp5HM4V0tUp2wLNljJKUk26XbAMaoFHD79G9+fSS2548zNBdsNmAUkMib8VHRs7E98lSTQ==
X-Gm-Message-State: AOJu0Yyf1WLUeGZHFBTJ0uAUsIuAJDw3Zz8bZQy7yjpJzYMGMkj18LaK
	GE1WuiA0OFxAM2pEiwTbY69tgN11P4JkvdicfbM2Tps1/NY3B4mpVDAnpQdlxaIYYpn7wAG3eRC
	7U0ELIA4Uy0SCmgkj6/hEEsMtky7LaZGpdsYIYdIY4F7+iFe2O+gcEA==
X-Google-Smtp-Source: AGHT+IFv3aNlqZTAbfEk3+SJkAU1VQZMZYGpG/ZTnboW7SE4kuCdio6mZh3pytXItsiGKqcKgm2mh9g14iNQpuvfWas=
X-Received: by 2002:a05:690c:97:b0:63b:f919:2e89 with SMTP id
 00721157ae682-66353dcf097mr646877b3.2.1721061633716; Mon, 15 Jul 2024
 09:40:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240715-x1e8-zap-name-v1-1-b66df09d0b65@linaro.org> <ZpU1vxsYUdVg9VGv@hovoldconsulting.com>
In-Reply-To: <ZpU1vxsYUdVg9VGv@hovoldconsulting.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 15 Jul 2024 19:40:22 +0300
Message-ID: <CAA8EJprKTm-FzDjUFwi9jKaHJ121W2m655-GN3DjzB9rSOpJ=Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: disable GPU on x1e80100 by default
To: Johan Hovold <johan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jul 2024 at 17:44, Johan Hovold <johan@kernel.org> wrote:
>
> On Mon, Jul 15, 2024 at 05:23:58PM +0300, Dmitry Baryshkov wrote:
> > The GPU on X1E80100 requires ZAP 'shader' file to be useful. Since the
> > file is signed by the OEM keys and might be not available by default,
> > disable the GPU node and drop the firmware name from the x1e80100.dtsi
> > file. Devices not being fused to use OEM keys can specify generic
> > location at `qcom/x1e80100/gen70500_zap.mbn` while enabling the GPU.
>
> Please enable the GPU for the CRD as part of this patch (e.g. move the
> fw name property there).

I can not just move the property, as it is going to have a different
value. I think GPU enablement for CRD should come as a separate patch.

-- 
With best wishes
Dmitry

