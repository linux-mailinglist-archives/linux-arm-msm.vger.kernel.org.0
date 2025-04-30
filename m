Return-Path: <linux-arm-msm+bounces-56218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B082FAA476C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 11:40:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DC2E4E5A14
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 09:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84F9F235059;
	Wed, 30 Apr 2025 09:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uO3SaQvM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AC51E51FF
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 09:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746005960; cv=none; b=GV/M3K9/wu+5x+RzsMBgv9ltTgXU8Rn0TAJZNgDteOy7yzJApxGBXtsSGb5gSmv4obf01DuqAiHnjLFSzX5VOYzGnPSiZd32zpCDYQe5qU2rXq2k/4O12pDbooBamZ52pIHWa+McwdsTHFdxYlLUfWigDJvrdcoaz9/d6Qs0dVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746005960; c=relaxed/simple;
	bh=AUDJd4dz5XyC/N6fEGt5cYH/J0DmYOyJCqcdAnsYAcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ig8fUtcYt4brm6WB928TuiBC56KQdOEVMyZH4WoFCBXKs46RkwfXBfxDu0skfZRwzE/k3Tg0pSaZ3CjUFRNvtDcUc2u6GlMEVL2/YYmKfnUA6TFRePkl4zOdbhToJSZKWkPKok7Fc7zPyrnuc+tNhXfS3rVUa905MJMjbAWMlOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uO3SaQvM; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ace3b03c043so1116251266b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 02:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746005956; x=1746610756; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6OGMbcMEkhBmGqs5Z3YtgBQ6Hwa1jUmstb0M0+KK0Nc=;
        b=uO3SaQvMg2uYB5lOtoFBdyDcAipupleaSdHMd14tWmPxYRsMP0RVbfRhnuW7lMa+Jq
         oAmLd2va15V7SUtqz90aKf3EWd/xWqEd0xWoeQsBCy9saIyy44cxEBOe4uhg9rAKzvwV
         qNIXo7Swfnf9PS6tWrptvpRJjL6RizDJw3AR1RlpDPwgB897bn4f8peMWw1963xnxUAr
         HhyrJG+qR/xoMsJ2Hq050qymPzMiuq6ETz1smE+Iwgixdb2vIMSIrlEQza6SnriZQBtz
         IN7dl7qdMbAYFq7MSxSuydv5PgSwjN/w7djsXMs8axi4tOaUajgvJaiZTHgiNP2tAt8R
         nMGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746005956; x=1746610756;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6OGMbcMEkhBmGqs5Z3YtgBQ6Hwa1jUmstb0M0+KK0Nc=;
        b=jcIHLLpj1GEyZ3z94Q2vIBNEB2Q6JzsYFKjlmgnDXFUhP15M8VIH6VSK8Yvrvbdynh
         uTo7FoVyC8sutUB4Z225fjJs7kArUvvzlF66F/0wkGwtzlWkayt9WPbN7hbAdHQZK5h2
         0pCFov+s4bAR1S99+VP3VD+1DEWr45JV6JCAdK3usP1JSDy0ggXUiU9eNn7UqcrdiMNN
         uolORHtoTg/UCRrBBoldf3YxwmaSxAQJHaXTRk5SaTPPpDAfw1iuA0qIakDTm5tCpJrk
         PyrvlC8rZzee+vs381TXGgW+xOD+sf95fjbFDlBwWyTBk98YNd1X1go9L4daGItnz11Z
         Gwcw==
X-Forwarded-Encrypted: i=1; AJvYcCVqx1vzHlwP+od28Q8EPEz2zRQG9WxMrV3D8ZTWhN0ilgijLueObFEKWsR0wp4+NazqseaBNLTFVtcxOBG5@vger.kernel.org
X-Gm-Message-State: AOJu0YxrEuJk05GHbeVKdp9oLgbn0eX8cBkZFAnFcmoY4f5hJABSIJlw
	4YEsJohvWfQe+BPIhdXBpnZucEbaGhpG6s2eRd7zILmgZaZNY3T15CSYGo96NZQ=
X-Gm-Gg: ASbGncuNTQS1xStIcwOYJYnIn7ltaor0qSfmI4rJoSll3TbMr6K0VBLlb7SRBGVSepe
	PEeVJBg/9nAMhhQ9fLVJ+57vcyT/+RjYg8RH+UC1kre77WpEudjif41XJ9mkIcMhm4L414JGTQD
	k3C8c+JO1mGG4uWNpnyrZCymH7kMQF6rXQOMuRxqA7wrvkdPhEHEop5OI7MyjR+Y80AqhWeJaJK
	LTwaD9gBAXBvPqtUCqUYDBOm7deRIR7ZtsDqEy2E8bKJk4eWaj9dPsSbScYvbpsEfWCd6r0czHN
	zSMW2hwl3pksuYTMKRK0+oSyyDbWhxOJutaVVw==
X-Google-Smtp-Source: AGHT+IFdTIvskANcQfZgyrnhvSLOX/uhDZK8XOpbGmgtU0SafrRwMbwRPtiX/Z0dHI+9ZICQQQNkbA==
X-Received: by 2002:a17:907:d17:b0:aca:a347:c050 with SMTP id a640c23a62f3a-acedc029a40mr272914266b.0.1746005955819;
        Wed, 30 Apr 2025 02:39:15 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4f841fsm902286966b.72.2025.04.30.02.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 02:39:15 -0700 (PDT)
Date: Wed, 30 Apr 2025 12:39:13 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Sebastian Reichel <sre@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Xilin Wu <wuxilin123@gmail.com>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Konrad Dybcio <quic_kdybcio@quicinc.com>
Subject: Re: [PATCH 0/7] arm64: dts: qcom: x1e80100-*: Drop useless DP3
 compatible override
Message-ID: <aBHvwUAISo2JhYSz@linaro.org>
References: <20250429-x1e80100-dts-drop-useless-dp-compatible-override-v1-0-058847814d70@linaro.org>
 <wsdhqocld54ygjrnn6etydorcg6j6uko4ner2dawoomflvu3bp@tq5jbqcahip4>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wsdhqocld54ygjrnn6etydorcg6j6uko4ner2dawoomflvu3bp@tq5jbqcahip4>

On 25-04-30 01:26:13, Sebastian Reichel wrote:
> Hi,
> 
> On Tue, Apr 29, 2025 at 10:42:28AM +0300, Abel Vesa wrote:
> > It all started with the support for CRD back when we had different
> > compatibles for eDP and DP. Meanwhile, that has been sorted out and it
> > is now figured out at runtime while using only the DP compatible.
> > 
> > It's almost funny how this got copied over from CRD and spread to all
> > X Elite platforms.
> > 
> > TBH, the best reason to drop it ASAP is to make sure this doesn't spread
> > beyond X Elite to newer platforms.
> > 
> > Functionally nothing changes.
> 
> Looking at the diff I wonder if this part should also be simplified:
> 
> /delete-property/ #sound-dai-cells;
> 
> This is done by all upstream X1E boards, so maybe just drop the
> #sound-dai-cells directly in x1e80100.dtsi?

Yeah, I'm not sure about that.

Though the DP3 PHY is currently used as eDP, I think it could be used
as DP. So I think it makes more sense to keep the DP3 controller as is
in the SoC dtsi and delete the #sound-dai-cells property in each board
specific dts. Don't know if it will ever be the case with this SoC, but
maybe someone will use DP3 with the PHY configured as DP rather than
eDP.

Not sure if I'm 100% right about this though.

Dmitry, Bjorn, do you think that is accurate enough?

> 
> Greetings,
> 
> -- Sebastian



