Return-Path: <linux-arm-msm+bounces-43421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8B69FCD7F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 20:57:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33E5F1880A45
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 19:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74A4C14600D;
	Thu, 26 Dec 2024 19:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KQr2T6He"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7828143C7E
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Dec 2024 19:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735243064; cv=none; b=tM5biNmH0sYa9wYMf1o5VtXSASyzv/mlDJ9lhJKG7G90L79DvU7VUAcIWsLbawrZorGQordE6pRu+VSHydSDTPMil1x1VvRqQuyuciJWQ2yhJjev2XkGj7PA2y6wZJZFeLttxOagGJkwvs05Jm4+5KEk8xUn7+sDbyXOGUrrt7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735243064; c=relaxed/simple;
	bh=LX+NUXc/lOfreOg6BsFdwPMLchdyZ48efUwMS4lnopk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PBHGQRN5haf4vtCM65+re4RyNHW/GOJxThtAlk2Y38dk6YzMmCLHqP1Hfrmdu+20eOWeiagw2JUNagfF8MLUw61fCkN/xSJaxMjUupW9VB5KEgOQ9LFlWikT6rc/a/qQ5vArj2oCk+B+b+XzMn3SqzIbd0aAVxXGIXchoj3bHbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KQr2T6He; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30229d5b229so70180421fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Dec 2024 11:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735243061; x=1735847861; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MM8NrokOqIcenNMJtZO5Dg+wXB80iCg+m37JrcgrDmI=;
        b=KQr2T6He5Z93OZnKeEYsaUSeDDJCqpIzapgQ5z6/GF6zkKkgdc0Q/0r0o4R5P+Yexs
         eABWIEYUVqeXqg2D//FThPWB1z4/66xEbli64HOQ+wAaZaX29f4oo1pho0E45idYaAWq
         v2MgH7mrFfLidK2q1RS2gfbJ9Ee8+j5f4rEhwYBoXKiJhYSdm2O2QtQj/4efctAyKTyq
         ZJ8tceKeozm5rrmPWfpkqz9PTc6Y2OxCsd7XI0PbzPpGsFt0IhLfpugDdxR5Uke+qR+y
         O+lruR0fptKr689nbZauea3cbLjAoEVL79TAVztompR9MCHUr+vpmqOn5p0yTsDGt57U
         cTJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735243061; x=1735847861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MM8NrokOqIcenNMJtZO5Dg+wXB80iCg+m37JrcgrDmI=;
        b=fxFDfPmDFo6nVbf75CQMSQm7kE08seHD7z87dSZmdBIn93eR7+E5Hg25kWmlz33NoX
         kpzEYD3VwZNJdsXjZFGyXISDNjfg67qJh8OEcPfOGjsLqUp9o02E1qvGZjpyo5ePVTDP
         kBA5t/xLvV0ja0MrayfQeeKBKhRAu63XR/szApJbT2vQxuxSWgceVEk3VElGcS0kSbjC
         YstsE7QLCT2MROMnbczm7dK5vXHDnZoruxOhRUTv+PsBA4D4voS8vjh1/HjdTqsOAurD
         +qM3VCIdDyXZkrNi9dmQAOOlOoYQK5vXiij/uY90ArtgGsmDh65KvMp7HYQdYX/dwJs7
         R3fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSM9gd7KRolbAasD7FnTFFw1Qbb5Xp34SWeAD/oq06EClrtJpwlYTL/BD/fuw/+OEsbUaXK1TF2tWUB4XG@vger.kernel.org
X-Gm-Message-State: AOJu0YzIgzZNW374pqLTwudNQyxhU8VnsE7ehdMRdl7s3eaJp/MNSURv
	HODaztDkUFsVQJiJsB6bDa62KAbsEWxJpov1GqY4MXTLKvWugLrwRKqiChUawK4=
X-Gm-Gg: ASbGncsUWCdi2zGqZBrGfBMto748dSUpPertiCpcD5eT505XMXamoItNJ7DGB8EOs3y
	3AP/YENihmKlsuoeiLL0yJ3xtE1bmSbfNk4XECKBE4q9O1ExHn2x+kE47TNADfWd72y7fp3+zMJ
	Vgkr4zppctFrMQWaKEfhxGfjvKCu4lZJDGsOgzEGwXzyhwTRAVPAfiLU2+z8C6A55iiYrYC01fH
	ocDvX4rgMHaRdIozyxd+NNe3Uy8VJyEWRCKilZfNuzQag2EA5+Xm4qERkT3n6zXWL60WScPZlk4
	t82yRF80tK1YDgCHDpgZsU+WLS0rnt9Fp3Uu
X-Google-Smtp-Source: AGHT+IHkvBmRpIKHeCAoX/Z+sP/3+AX7saXt9A4Oym1qKh/OXbeqO1hadgMz/vRU3MOPcrtWuz2aoA==
X-Received: by 2002:a05:651c:4ca:b0:302:3355:f756 with SMTP id 38308e7fff4ca-304685de7e4mr67062151fa.35.1735243060723;
        Thu, 26 Dec 2024 11:57:40 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad9c093sm23424591fa.49.2024.12.26.11.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 11:57:40 -0800 (PST)
Date: Thu, 26 Dec 2024 21:57:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ritesh Kumar <quic_riteshk@quicinc.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: qcs8300: add DisplayPort device
 nodes
Message-ID: <fcio2ikemgmvy636vpyvhth7qbzp43x2nebbo2qh7roalxjlvw@ssgsc5cfh4w3>
References: <20241127-dp_dts_qcs8300-v1-0-e3d13dec4233@quicinc.com>
 <20241127-dp_dts_qcs8300-v1-1-e3d13dec4233@quicinc.com>
 <45643708-c138-4c77-85ce-fa7d49f2aa72@oss.qualcomm.com>
 <d536bbf0-4e8a-424b-b885-a22870bfbf31@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d536bbf0-4e8a-424b-b885-a22870bfbf31@quicinc.com>

On Thu, Dec 26, 2024 at 03:03:46PM +0800, Yongxing Mou wrote:
> 
> 
> On 2024/12/6 5:36, Konrad Dybcio wrote:
> > On 27.11.2024 11:45 AM, Yongxing Mou wrote:
> > 
> > > +
> > > +				clocks = <&dispcc MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
> > > +					 <&dispcc MDSS_DISP_CC_MDSS_AHB_CLK>;
> > > +				clock-names = "aux",
> > > +					      "cfg_ahb";
> > 
> > power-domains = <&rpmhpd RPMHPD_MX>;
> > 
> emm,we use RPMHPD_MMCX in qcs8300 mdss and dpu..
> > (or maybe even MXC?)

But it is a DP PHY, not a MDSS or DPU. Is the PLL being sourced by MMCX
or by MX?

-- 
With best wishes
Dmitry

