Return-Path: <linux-arm-msm+bounces-20472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F538CF130
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 22:10:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66C6E28178D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 20:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64D51127B6A;
	Sat, 25 May 2024 20:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bMoZnpY9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFA0127B5C
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 May 2024 20:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716667853; cv=none; b=R8OrDweiz4AMqQytgKEixhel86tnRk58dEJIY9jQODyCoOWNQtC7awKjSk/Vj1Ua1NLxfKoqfu0vkSaAXbj7+sPz6tA83It0kugdn8AZBb5gYS+h8W+TrmIu4Myb7SDYyc4zo7rIIc9CJijcgxD59q/Ejj0AmRf1Xna4FbCbC5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716667853; c=relaxed/simple;
	bh=e/SqsMrQ9q0SfIyPEwKs25/TzKjlnC/zHcUIC17p6aI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fxXUHtFBFglaaMhmVGddrtVWAzbFhFdEGjL7rhI+TTf2TluLXTA/TdmEjPUuGXK2fPb4FX9JsSFkpxq6Qo7ogl8RW2ZPK8XQHLr1KmRfrVtDb74xvu0/gdf7ugAySK9kLhGZVjQdEQPYovRezfqjG3L1f3BwuG1IraW4Ovnq9uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bMoZnpY9; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2e6f2534e41so86577181fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 May 2024 13:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716667850; x=1717272650; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hay1dQxWlyajud/Uox2lrtdjKK8bbHNkgB0DvkOyyo4=;
        b=bMoZnpY9R671hsx3NlQGiK9jXGw+I/LKb54rwwpOktCtoRjQ1nP38fzHrBXHKitO5a
         LXNO5hVYlAkqty0UujD3aBjnBaCfu6ko1vJLXy7OvyKXsbvujIpH/BhIUc7EA/C8cA5y
         7CdGhqx/0Z8aKX7+ZdY/IjrJ9pjxMj+CEG/qc8uzttvevcEjw59irkCGJMRLyonE6vFI
         ze4tB+Q2bfvVHHk3c55oxkKK5cgTeiMW7J2h8CLDiiwPfwQpPhhM3Qs/dl+Jy3dHAnDp
         JZZ+2he5X+lOKAMMt+QvDSHsKbwyaN5vZ5e0jvAIvrYjDEt6QN33NF4Bvcox3JRRSzqp
         vZ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716667850; x=1717272650;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hay1dQxWlyajud/Uox2lrtdjKK8bbHNkgB0DvkOyyo4=;
        b=lENZBqujeEBbYApdMYMV7U6fG1Yjc4DQpz52V0BQHKiZaFX7XhdUgH1l1h0ME4v0n7
         STMmeojvLaTBBf7YRL+RUZvYgYVqFeSK2HX6uIdP660PgAsYlzJOdBH84BX3kCkbLaw6
         AFLhFCDqG7uLXS7rlzLO4KadFops/fsUIkPOEfVgGIgq4HfErhBRhCNrntW992cOkjnF
         r1ylI4UGH+goQMQQtK35gXp2tBpOitAj+7RbTi9liaa35ywYsTdBak3eZ70COC0u7bmy
         cxgGwLczuzNqHToZH3AI24zV6NBDWvgK0aACM6y9sBYKOKuTSBkwjCaits1Znypejeav
         Fw9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUth8AQ6gGd/4DisZbC/PRNbqomCAiCmNUVhX+U8TChKTQRsal+o9ePG2oXSe4WCCdNNYzbJKRp1PUsZJ/VT7EXiDHJUT8Z9yzQ7x/ZnQ==
X-Gm-Message-State: AOJu0YwPneDzCKxOFpeJ4kP3Wbnfn4aRp01xmtG+tiMNdwtMeYYOODYI
	ed1RoknYFGKA3Z0a+JycNin+dEkhzLGK/TxWuPlFA/JoFxMrplM06FIw//F4D+k=
X-Google-Smtp-Source: AGHT+IGTic3xlNUhfOJl2SaWSAmP8JtysqkrRSUBGy/UQ+3NdA+Ph+fMfzB/slWuwtwSwhMgkJOMZQ==
X-Received: by 2002:a2e:a9ac:0:b0:2e9:5b89:dc6a with SMTP id 38308e7fff4ca-2e95b89de87mr40099391fa.39.1716667849736;
        Sat, 25 May 2024 13:10:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95be009d3sm8493621fa.102.2024.05.25.13.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 May 2024 13:10:49 -0700 (PDT)
Date: Sat, 25 May 2024 23:10:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc8180x: Fix LLCC reg property again
Message-ID: <chsvdomhzn3zsncjk4v6inwign4tjzooaxoto2lriltu6pqfb7@vrvqwwe3fsrh>
References: <20240525-sc8180x-llcc-reg-fixup-v1-1-0c13d4ea94f2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240525-sc8180x-llcc-reg-fixup-v1-1-0c13d4ea94f2@quicinc.com>

On Sat, May 25, 2024 at 10:44:11AM -0700, Bjorn Andersson wrote:
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
> 
> Commit '74cf6675c35e ("arm64: dts: qcom: sc8180x: Fix LLCC reg
> property")' transitioned the SC8180X LLCC node to describe each memory
> region individually, but did not include all the regions.
> 
> The result is that Linux fails to find the last regions, so extend the
> definition to cover all the blocks.
> 
> This also corrects the related DeviceTree validation error.
> 
> Fixes: 74cf6675c35e ("arm64: dts: qcom: sc8180x: Fix LLCC reg property")
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8180x.dtsi | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

