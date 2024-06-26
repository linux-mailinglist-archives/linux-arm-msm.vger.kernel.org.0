Return-Path: <linux-arm-msm+bounces-24245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCDA917C4B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 11:18:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 140971F274CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 09:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20B3416EB4A;
	Wed, 26 Jun 2024 09:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xwoP9CJb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0C416A949
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 09:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719393463; cv=none; b=MF6WzlMP8iFLt64D2ncoY9OG/CVksDwuwdnI7cW5UU4DtghSxFu5Z0UmEPFi/GhDF2tqn9exDd8JFEEWvkz/cMGYm21Yd2m0EGL0qB+QeM0QOCqzcL/hinuYC5PFa1mQrd+QZMmop/GZCxBr/ov7BG44t/ZNP2fMRJInAKM3ziE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719393463; c=relaxed/simple;
	bh=TdR+0h5pgv6sf68bp9AYfIlXpF2fRPqacyemVdw5/HI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NFLb42viwQbUfaYSP3jtztD3Q+cVfUouoSG2YppmLr64NZXkYBpuLPvaH459QDETfnlQ7rFhVocSMGrV752QvUzTZZFn0nfYSp/WHh+iNH/3MxoG17JJzYhM9F1gZivh1ik3JGTR/6bNX1wxEUFl4qG3eRZV+VSS9LwfbWZTb2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xwoP9CJb; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52ce6a9fd5cso3050554e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 02:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719393460; x=1719998260; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lIqsgUc0qUv8b+n84AsHvKArD60z2TYKJpqdlsOonTI=;
        b=xwoP9CJbzxfI8Jlx4ekbMSAI+6D7sjvrlMESsM9+HUpm4wnXOQI+J+eGOsePOb+bJp
         gOwzAbLqys9IOODbYyAyDEMr74t6oWvCZ+w37Bh4B27HzWFaeIHErO/NNjte2GYmWImR
         1LuG+DTulTQMZ4XOoBOLfdm9gF+v4+c5K77w19fOJm2e3DTqPbsO8trMneIAdOYcihgT
         1BCxvmbXsaYq/Lblj+leI5oQms2exA6SXx6kUSVfbAIe5qJAfSxGht6ilorEI+kuiaRH
         fTJhB5EOjV2m3CSV+ydgORRksyzL+NVSnpGo4vK9kHlQYt65DwVz/OwZF0QIyhFhQYTu
         mRMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719393460; x=1719998260;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lIqsgUc0qUv8b+n84AsHvKArD60z2TYKJpqdlsOonTI=;
        b=NMMSNgw+MKuGBUx+HWQChJi2bcK2L/CRMKWml8B+mgEkW9lDC8HGGPm1X/Z5iMuJkW
         vVd1GNSuuBTsGlvQnGMV3kWqiy9z0vONiSSjknVuOTnlPgMclWuWyLsleUU5ivYcZQGt
         bpkBNfgfE7/Fmj+r2MdDWnolcyTgS1LuNeAfXZpKv1b6FtwgqOL3CMMRlvmirZwKY/tO
         i2Wmkeo/+2psKh4Dc72WrJR8V/r8hA7sxOOC4THuqiM2KHNksXJDQxYEmcBvUuGYGn1Z
         +bl21podUqD9oruqnlo7XypFBeyldaO4zGYpCqy7QwWH68GetTAzl24R65S9t+fVxFob
         zSYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgnOwjrH6cO0OaS87TNkS4B1VmXf8N7azxGVrNIgqpI8VJLtyuasuaj1JZUbZhN1sZ0h0KZQpVbzN5GpGqCOI0ulsVzsEjdw/9NtZJLw==
X-Gm-Message-State: AOJu0YxPKkTyzhgHWvJecYF2n6RglIUJ7beHh+5lZTgItzpRlUm3RKU4
	oFs2PJ9lPNyxFgc499TkFqSXGeYxOdjqPKJtscLOp/lXc8O2s7VC4t5Bco+OJG4=
X-Google-Smtp-Source: AGHT+IGUcuxRMZ/d4v953UhQb7EFPCTahiRnNum885ExgEqYymNBwBcHbYy9/YkcMVUlc/gGhu888Q==
X-Received: by 2002:a05:6512:138e:b0:52c:890e:e8e7 with SMTP id 2adb3069b0e04-52ce185cfecmr8024194e87.50.1719393458662;
        Wed, 26 Jun 2024 02:17:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52db233f5e4sm144142e87.69.2024.06.26.02.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 02:17:38 -0700 (PDT)
Date: Wed, 26 Jun 2024 12:17:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: george chan <gchan9527@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Robert Foss <rfoss@kernel.org>, 
	Todor Tomov <todor.too@gmail.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT v3 1/5] dt-bindings: media: camss: Add
 qcom,sc7180-camss
Message-ID: <xtnamlbshpfw4vhixdvvlbg5qwosx4xfiwys3kjrnnvpdegejl@2lq45llo7twy>
References: <20240624-b4-sc7180-camss-v3-0-89ece6471431@gmail.com>
 <20240624-b4-sc7180-camss-v3-1-89ece6471431@gmail.com>
 <c33dde93-2c3a-4a00-93ee-e4de303c9057@kernel.org>
 <CADgMGSvN=uAW7z1dpETGVRewzDG=K2MAtzOkhK7xAcskU_oeZg@mail.gmail.com>
 <0a35f0bd-ceec-487f-b9fd-ae9698b74048@kernel.org>
 <CADgMGSt9Hu5Ciq=ndMTaVK23Y_ixTVtTuSfy4hJkJooFH2uv9Q@mail.gmail.com>
 <CADgMGSv+x2Z9FsWTHW0auttvpdfNDnOPxiJhXnUaW3yQczN_Ag@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADgMGSv+x2Z9FsWTHW0auttvpdfNDnOPxiJhXnUaW3yQczN_Ag@mail.gmail.com>

On Wed, Jun 26, 2024 at 04:38:48PM GMT, george chan wrote:
> On Wed, Jun 26, 2024 at 4:17 PM george chan <gchan9527@gmail.com> wrote:
> >
> > On Wed, Jun 26, 2024 at 3:15 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > Keep the list in "required:" in the same order as the list in "properties:".
> >
> > ok gotcha
> btw, i checked  "required:" and "properties:" are aligned, both of
> them are in ascending order. I am wondering if you are talking about
> two things, 1st one is to align both property, and 2nd is having the
> ordering like below. Plz confirm.
> 
> required:
>   - compatible
>   - reg
>   - reg-names
>   - interrupt-names
>   - interrupts
>   - clock-names
>   - clocks
>   - iommus
>   - power-domains
>   - power-domain-names
>   - vdda-phy-supply
>   - vdda-pll-supply

Yes, now this looks like a correct order.

-- 
With best wishes
Dmitry

