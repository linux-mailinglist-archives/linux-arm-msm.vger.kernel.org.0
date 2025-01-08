Return-Path: <linux-arm-msm+bounces-44369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C29FA05BE8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 13:46:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00C441649D7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 12:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98DBA1F8F08;
	Wed,  8 Jan 2025 12:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="scSrSRKU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A902F1EA84
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jan 2025 12:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736340393; cv=none; b=n2IZSd9FtOoaZrv/X9qQYJBBBiXCbGXFDYXnxGyhUfc9VvVYvg0+a4x7vTjViyqQX/KzTA5V+uaKB9kU1k2dYylE99AbFhqwVbPvQnvvxuMMTGGkb4vKlu58AQrF5GXQweq0Mn1vBw9AYpRmlwlvpelaqGA7qoDsLAMwah5b25I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736340393; c=relaxed/simple;
	bh=NlybpAVWCIpkP6JX5N5CNjqVnrmIYp4cV7Pqtka74O8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=koqlCeYIZ8T1u7EGWb4Ekw62/WnNp3C0jVsF1iSfFaSF0dV333041wPXweNpm3RkcS/2zQ4rj3hMns8kkEtH4z2AYrUnzipVRcMJXreAF3WGgdvwWJ0Dp4ii1pyGD2bWJNJa/lQfQPFlyOKsxlQBg+N7WWsX0SdJsdoejKoWxH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=scSrSRKU; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5401ab97206so17055299e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2025 04:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736340390; x=1736945190; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IkzZk+BEr28CeX7YNoas3/2G+waAig4e7svpyduzh7Y=;
        b=scSrSRKUVoTMRbcqqV0lqLdEBYXI/1f1ijauoLIu8YRvRX11oWg1g5lgUJ/fswDulN
         LyQu6Khzr/AjaBo0ru8uRJo42GBA5ZurECgHrDz9vnBcOPgj+XbhkeMSBPYsvhLSOHRh
         GaE4egbhmyIF94kgFgRO+9z88hpdVGJQ/LU0pCw6NCPn6d8aUDVQW+83Gh+lTzPk3dR1
         WQrEua191r9ZJILI5650+c+hBBUpJLzD2CNWBVxxv3OmS4KQdUrRa43RE2VqvTF/8dDV
         hFcx0xIVWrahSupKaYyxA00Wv79t7b6yuj/AIdFJc1zsgaYU2r6mtob10htHGZ9bV4b7
         QJ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736340390; x=1736945190;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IkzZk+BEr28CeX7YNoas3/2G+waAig4e7svpyduzh7Y=;
        b=UojrTaks0KObU/poNzz/rzqhu4X8PltN7hgz1gOI3yFPPZimXoq9OIUu1zMA5v/MyR
         z5z0mQEGZT6gdQavSb4bTXESqXMOJT4c4/RmxaIeFhCXMN3ygIUu66aF741GXvwWskju
         TIerD/nJMIbjB7PFwo38iSQJ7ApD7xXn9XmpMa4ZpNj5rksxP5hM2RcrQzMgTlNpmSW2
         vHzGwvDJ9kfkbEKeR6ENt0zBJBI4k6a+u1w+TsQkDu538E9einwXx+HUPB/FNDim+xiH
         zt+1PuZH15Dre8Euvq8iKSoe63gleQebf7hiBhdRvornDfOMKQ4yXm3eW5i4InXe/FuH
         bjtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpYY8ROgZFfTmPN43r6DRNCAkqXFio/Ww8r+ewnZcomN21R6rff+pL2lVriRF3fR7XaEsUqtMmWhnb6qV2@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8yLk8NZ/RezaS69Vc/kc3yZReG1FwsIg+AH3EaqCQGS53yh5Q
	1GLFCYhkexmwe7yKRRjsCsZAbosaBhD4e9kNLtXf28tt0MIPfCv1ehGt1SDg6M8=
X-Gm-Gg: ASbGncu8b+cde62U8D3zYk9kdG8myUl84VakJU30HCpadlLcPJVWympiQ2CTU6ipJSC
	lEC+ppG+6PSXHKJ39nuASHL/csCvSo4U9wtDxl2DH3cziGPC0vdtIA7vZS6YlM8tWPf/rI+0AyV
	ac5DUm6A+rdNX7CH3gEUyIyAYtsljtZDcmRjVS+q+XY3eUH4x12eZQEOLuNW9tnlTRuTCsX0dyb
	0vwRju/lL232zjsz8fivdjn4018EtTD0GKa9Ru+wvvul/+D9BXt0qi9GlEd2K0xdthEzevvFB5u
	itisMZvPb+GKfu4Z8TpjUPaZfBbE+IUpmRzc
X-Google-Smtp-Source: AGHT+IEWfKdjb9hE77a6Jxa1prdXU1QUuTcIu7o1P9VHpcDPdLgN9zk5nzeoDwxT2aKxV3PbC0XcRA==
X-Received: by 2002:a05:6512:23a3:b0:53e:385c:e881 with SMTP id 2adb3069b0e04-54284547e5cmr736113e87.30.1736340389747;
        Wed, 08 Jan 2025 04:46:29 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238214f9sm5326844e87.202.2025.01.08.04.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 04:46:28 -0800 (PST)
Date: Wed, 8 Jan 2025 14:46:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
Cc: Wasim Nazir <quic_wasimn@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@quicinc.com
Subject: Re: [PATCH v5 6/6] arm64: dts: qcom: Enable cpu cooling devices for
 QCS9075 platforms
Message-ID: <sufmykle5inyk73i3qfmy3xqq7plgfr7txiruyahc5wgvvn6uo@kytxtb5zc3tg>
References: <20241229152332.3068172-1-quic_wasimn@quicinc.com>
 <20241229152332.3068172-7-quic_wasimn@quicinc.com>
 <zn4uf3mmlmt3who474hwkr44poycfqtjtidshybbg55a3hr63y@zxefqbhiwkbg>
 <d54c6706-3c6b-211c-6acb-fa3984c30c67@quicinc.com>
 <ubasbsyspn5euygihgphyw3xg4ckveytvgnjpwdiyg4pv7degr@6y44ya4gvaqj>
 <07c41571-28ca-6f9e-bcee-899bbf77f687@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <07c41571-28ca-6f9e-bcee-899bbf77f687@quicinc.com>

On Wed, Jan 08, 2025 at 05:57:06PM +0530, Manaf Meethalavalappu Pallikunhi wrote:
> 
> Hi Dmitry,
> 
> 
> On 1/3/2025 11:21 AM, Dmitry Baryshkov wrote:
> > On Tue, Dec 31, 2024 at 05:31:41PM +0530, Manaf Meethalavalappu Pallikunhi wrote:
> > > Hi Dmitry,
> > > 
> > > On 12/30/2024 9:10 PM, Dmitry Baryshkov wrote:
> > > > On Sun, Dec 29, 2024 at 08:53:32PM +0530, Wasim Nazir wrote:
> > > > > From: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
> > > > > 
> > > > > In QCS9100 SoC, the safety subsystem monitors all thermal sensors and
> > > > > does corrective action for each subsystem based on sensor violation
> > > > > to comply safety standards. But as QCS9075 is non-safe SoC it
> > > > > requires conventional thermal mitigation to control thermal for
> > > > > different subsystems.
> > > > > 
> > > > > The cpu frequency throttling for different cpu tsens is enabled in
> > > > > hardware as first defense for cpu thermal control. But QCS9075 SoC
> > > > > has higher ambient specification. During high ambient condition, even
> > > > > lowest frequency with multi cores can slowly build heat over the time
> > > > > and it can lead to thermal run-away situations. This patch restrict
> > > > > cpu cores during this scenario helps further thermal control and
> > > > > avoids thermal critical violation.
> > > > > 
> > > > > Add cpu idle injection cooling bindings for cpu tsens thermal zones
> > > > > as a mitigation for cpu subsystem prior to thermal shutdown.
> > > > > 
> > > > > Add cpu frequency cooling devices that will be used by userspace
> > > > > thermal governor to mitigate skin thermal management.
> > > > Does anything prevent us from having this config as a part of the basic
> > > > sa8775p.dtsi setup? If HW is present in the base version but it is not
> > > > accessible for whatever reason, please move it the base device config
> > > > and use status "disabled" or "reserved" to the respective board files.
> > > Sure,  I will move idle injection node for each cpu to sa8775p.dtsi and keep
> > > it disabled state. #cooling cells property for CPU, still wanted to keep it
> > > in board files as we don't want to enable any cooling device in base DT.
> > "we don't want" is not a proper justification. So, no.
> 
> As noted in the commit, thermal cooling mitigation is only necessary for
> non-safe SoCs. Adding this cooling cell property to the CPU node in the base
> DT (sa8775p.dtsi), which is shared by both safe and non-safe SoCs, would
> violate the requirements for safe SoCs. Therefore, we will include it only
> in non-safe SoC boards.

"is only necessary" is fine. It means that it is an optional part which
is going to be unused / ignored / duplicate functionality on the "safe"
SoCs. What kind of requirement is going to be violated in this way?


-- 
With best wishes
Dmitry

