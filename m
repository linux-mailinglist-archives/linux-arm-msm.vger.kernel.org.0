Return-Path: <linux-arm-msm+bounces-35377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 568C09A9EB0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 11:38:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79F3D1C2434A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 09:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 836E41990AE;
	Tue, 22 Oct 2024 09:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DECCXxuD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06161990A7
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 09:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729589921; cv=none; b=mgUMLcTxy99+Hk8sgzQTg5FC+FvQg912xadNNfu8yOxLFZGh/299g/6D0PLn8hyUmZrol2Irj82z/k3ZorXFGeMhptTzWTn9/WGqZzf91lZR7LmgjGLKt/tbgXunK0x5dJUT9YpAALoQEU5kqqiYvUaWnl/KK/X8SPeb6YvbMes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729589921; c=relaxed/simple;
	bh=jtL+q1k/uNxoSxNFpXI2oLIDpt4U4O6GXFFLuZ2PuzY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P2qPsUucSlDBQkGtUpLraRcz287l4E28zW8IiLU+MTjFZA/xLFFOGAmeQLUZZd7d1YsbyQZF6B58jtIrB61QbVRf9l2CP0+oVbMvUgipU6FMuT3W6o6+TFCz4HglNTiuOXuMZzz4NzPerhV/lcue76nCY0ZCleFLCef6HlNmGVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DECCXxuD; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6e5fadb5e23so20401247b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 02:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729589918; x=1730194718; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N/5Dg47fBjY/YhFPEspJexC0cvl06u9WdqmPSroLAzY=;
        b=DECCXxuDCv12XfhmXec7uJZKwdDohA7QlODHM3tW+ShwMFJRkERBxzTn1h1PgGi/JZ
         4VFxq0toK/NQozgUlEM2Az87dvvIomBmoPMGs/EiE/K1787934h+/5kuINBm+1fFRDbV
         iasRCDHL8i9aVEKror6MxSgKyN/j+NTdG2bZjHXaF6EvvD+rdjik0yKCjmBFmZBhcokd
         38TFHqkHdPuUNPflC7KE2j4oAk5Z9so8+JfjTwQDDhH7N06CANOKtulAA6zyd6vU8io5
         6JLYc4ac7Uv29sK22xodCwQTJoZd8TDbOYYSSOjyH2rSe37kczejuDN4on10Ox/0yEfm
         gGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729589918; x=1730194718;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N/5Dg47fBjY/YhFPEspJexC0cvl06u9WdqmPSroLAzY=;
        b=lUPXlJUhZsqsVJVGTf35Ib5C/LFLAEUu0FG5CVkI3Cx5vDOStjtulBr3TWh0N17YN9
         MUgV2tuK2m6QmIFxvG/ZPsIvZIV/E1wIcR4QvLIgBbpYADUhTCvRki+kp7HuyVPYvaGR
         tZoHwKNDVRjjXpe3kr3KfH0bQOi7uDuhoHLr8eI3zMmGrPi4zzmUDXwAHrXnHutg2bZp
         FBzqlGZ/xvdTiGi5MGnV9X5clcnO+eD3s8sw3wsQyAMG0zaNZ7dbpBzD60FKWyqcWTMp
         uxG2oCXtcJm19TH1ffl29Rt8JEoOmI/TM+UYsW53DZWb9CnTuYUWrsN5TWjHaQakNDaA
         S6xg==
X-Forwarded-Encrypted: i=1; AJvYcCXd6sumVQs8U7nfW57gD3t0ktcUfTkImxfPPK/sDPREdYsH3WLtVzJNPS4nVK2nFlYTav/k7yZGKYCzS3gB@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0xMTqF6djwI7jWafRRK3xzGiasKgr+NjVhmggdRLxuWN2p25n
	eS+DWG20+wsAA9Jw2qUu1Gq3lQlkkStFof35psIokeADAt9F2eEAVWPI2LBoIZym0yxZADSabeK
	k5ga7p4veB0Jqmu+Fx6bif3W6H0pGcn1DbhhRpw==
X-Google-Smtp-Source: AGHT+IFOJm8RAn0EsBkDxk6LqZTnRur9nRUufhWOLHK1CxgpCVThwipByBxtIeBw59Z59ke0ZItxJl9xZjd0Aa6JrTs=
X-Received: by 2002:a05:690c:ecd:b0:6e2:1467:17c0 with SMTP id
 00721157ae682-6e5bf632349mr128695137b3.8.1729589918568; Tue, 22 Oct 2024
 02:38:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014-adds-spmi-pmic-peripherals-for-qcs615-v1-1-8a3c67d894d8@quicinc.com>
 <p7fw7jjfawbnk2vb7zdtr2dp3ni4g2uuiwvt6o4qva53zyrpvd@kokibgaidfzb> <5c23a6bd-e233-4b02-86cf-902d2c57c382@quicinc.com>
In-Reply-To: <5c23a6bd-e233-4b02-86cf-902d2c57c382@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 22 Oct 2024 12:38:27 +0300
Message-ID: <CAA8EJppdQsGe-R5JKRJ9LJs9xGTdhkCGYc5NyzVSLA1bWvvUwQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: qcs615: Adds SPMI bus, PMIC and peripherals
To: Tingguo Cheng <quic_tingguoc@quicinc.com>
Cc: quic_fenglinw@quicinc.com, quic_tingweiz@quicinc.com, kernel@quicinc.com, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Oct 2024 at 11:26, Tingguo Cheng <quic_tingguoc@quicinc.com> wrote:
>
>
>
> On 10/14/2024 6:53 PM, Dmitry Baryshkov wrote:
> > On Mon, Oct 14, 2024 at 06:08:17PM +0800, Tingguo Cheng wrote:
> >> Create a new file qcs615-pmic.dtsi to add on-board PMIC and peripher-
> >> als in the PMIC that controlled by SPMI bus. The peripherals include
> >> GPIO, RTC, PON, power key and resin-key for QCS615 platform. The power
> >> key and volume down key are controlled by PMIC PON hardware on QCS615.
> >
> > Why do you need a separate file? Unless there is a good reason such
> > configuration should be split between the pmic.dtsi and the board file.
> >
> One reason is that I use upstream as
> template(x1ee80100,sc8180x,sa8775p...), they all have
> platform-pmics.dtsi alongside.
>
> On the other hand, qcs615-pmic.dtsi contains only the PMIC's
> peripherals, creating a new file can eliminate duplicate code if there
> are any other new boards with pmm6155au as their PMIC(similar to
> x1e80100-lenovo-xxx/x1e80100-microsoft-xxxx, where "x1e80100-pmics.dtsi"
> has been included).

And this is pretty unique  to those platforms and it exists mostly to
facilitate the case when a platform has several instances of the same
PMIC. In all other cases (mobile, IoT) usually there is just one
instance of the particular PMIC. In such a case pmic definitions go to
"pmABCDEF.dtsi" to be reused by the platform and then board DT can
include that file and wire it up according to the platform needs.

> > BTW, what is the PMIC id for pmm6155au? Is it a real PMIC or a version
> > of some other PMIC?
> >
> pmm6155au is the PMIC id(Silk scree). It's a real PMIC for qcs615.Maybe
> I should use the name qcs615-pmics.dtsi instead of qcs6150-pmic.dtsi to
> align with other platforms.

Is it the same thing as PM6150? Or is it a combo of PM6150 and PM6150L?

> >> Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>

-- 
With best wishes
Dmitry

