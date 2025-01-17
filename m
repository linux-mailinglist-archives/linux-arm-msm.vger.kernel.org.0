Return-Path: <linux-arm-msm+bounces-45391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F09CCA14D63
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 11:17:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1ED2B7A0464
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 10:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 920EE197A92;
	Fri, 17 Jan 2025 10:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cL19o9w+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0A61F63D6
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 10:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737109029; cv=none; b=TqpMw6QM/tpxPE+wOUtQ2xWK78hlyuAzquUk2FUGpBtdKpT3Xwzr7jAlnxQXekgGvQ5akT+vfJZH1WBZaw1c6azlsr4RRS3naqW7p3WTMZaebqztN/6kFiSoNvZ7exn67NF1yVzBUzGT5L53cX7FWf87FePiKBgEUH/rY1Ii7G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737109029; c=relaxed/simple;
	bh=/HEbNf1Ro9YgF4R1T7Nvqh0UP1b8QAiB/ETowmozyXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pgI+KPoo1b3d6cJBkRCL7urkzhMY15ojE6drR9AIdroGhOkdojt6wvO2UX0Vm9mR6j0sb/DtiImUhnUaBiTi7BWw8g3J/dlVpxnnvWwf0lFy2FtHFoNhxB4BOqkjw+Ivx0r4FGLBnlQapDsHsxAz8WR0l7OUvlx1bJNLwxtHe9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cL19o9w+; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3061513d353so19123511fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 02:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737109026; x=1737713826; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UCME0WrlU1H0nyJTDCQLugSxkWOknxDVprqMSMXYaGw=;
        b=cL19o9w+XGzc8/lPWnweD4ln2v7UqJ3n5xU+2pywfIxRkpD0P+Yp4kGF1HnR7rGgsJ
         RsVWEMGS80nYuo0RfaqMqjC9yGTXvqFSzSMM7cHKp2gEO05Ko73eHpHAbWOu90ZgdscT
         tPU9A+dOsqlN6k7q7OlQWbV0zREIAfZvHdbS42wFV6iJLfIPNZZqT6J6UDUrddOTu+2u
         0J0P0AoITCs8Ck6yeB25DmjlSRetHOYnUF80Gd4BuNKiXB43Rncpn3tO2AXMldA0vFM3
         WrD2dE9pWcRrIvdqgmBBmwVd3nt702BBAa8k7CMNySxULuDq15rEs7dC7tkfK0YGqoKW
         LRHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737109026; x=1737713826;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UCME0WrlU1H0nyJTDCQLugSxkWOknxDVprqMSMXYaGw=;
        b=o8QDK9UIntWlWuBzgUltx1nTTeCIzTOQxYpSWoP+tXD9krjPxzlZxlNdjrrd3rdNHB
         vl6wfrV00R5LgDvTWYyzNHkny8cofXPcw5SedqQtBhwFkx/ms+sYLanfaHwzF8ssMPeI
         lI9ys0q8w3vj4AVBKlJf6ikL4gFrtp51uLMw/A1+fHZj2+XBcIDRD8eGjAadF/lznx2n
         8++9oJUZuqwrEqNwg7xXIIrKB2a/8J0UHAuoRq8Q4pffOLGo56eUAFi649T+D99lZ3dH
         9DtcyJcg+OXYGhzcks/gqX7yMC1W8yOgvxyEfCXizgc7MdNqG6LccftE8Qqqi4IaUuza
         K4Fg==
X-Forwarded-Encrypted: i=1; AJvYcCWCqvGakZA7nXqszZ5LcFlSl5Do8Q38MldcSPduHP7PQJePWqQ660rmEKwn+AE936Rt67e6jWL8zRaoO8Wg@vger.kernel.org
X-Gm-Message-State: AOJu0YyR49ifWK/BbmskVzdErYsZvQ6n0rFwr1okN0TSziu1ISSg/ydC
	72Vmz7myHGgeE69cQqJlV0kDBVKMkNmoF0O66VBhNRaPOyf0rdMKnFtmN9e780o=
X-Gm-Gg: ASbGncsYKD4BwuCzDsNoVhzKYQY4TBbsZaBl1fZbG/MQmzk4nQXZrNSRXEl5aNti9vS
	VKU2w3ZfYfQr0C3+pFOaFuAH8zJXAsFUwVn096lRVi2zvptuOK8iZVPeCIlShoIUC5nqsiDHJ8D
	HlPcAvv+kV2cJ7c+o04NqJOrJlkXZOQ5kdCe26e6Fi3HVET2ktqtsKO4WhUtHvDwAUrnusroB8x
	kgqnpOe2SkRUQYuhpd2g7fYSZdcoQT1p8wwHSHmOLWPx3uJotA2RQPAWqd/Zv2rpO5iOEw1XDKl
	3KxpQMYWTG+hRkTwfKRWztZF+9SPrQdHybnd
X-Google-Smtp-Source: AGHT+IF77IBzYQonMfNeuElN1UvWqUjRoXcTNWAo0Nb5IVz/wYH50H38fEarrgL/9qMCoXJ63HVVKg==
X-Received: by 2002:a2e:b5cf:0:b0:2fe:e44d:6162 with SMTP id 38308e7fff4ca-3072cb0def3mr6912161fa.26.1737109025888;
        Fri, 17 Jan 2025 02:17:05 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a35a919sm3625971fa.54.2025.01.17.02.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 02:17:04 -0800 (PST)
Date: Fri, 17 Jan 2025 12:17:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: neil.armstrong@linaro.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, kernel@quicinc.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] arm64: dts: qcom: Add coresight node for SM8650
Message-ID: <cchokycqaigagaoqbfb5bxt6zq5dd4le7bpirl4lu5em7byqv5@cpjgz5dbsdxq>
References: <20250107-sm8650-cs-dt-v4-1-2113b18754ea@quicinc.com>
 <be7b0acc-495b-4bb6-91e1-5db8e301503d@linaro.org>
 <28eec718-2950-40b5-b5b7-b4ecb5699a6b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <28eec718-2950-40b5-b5b7-b4ecb5699a6b@quicinc.com>

On Fri, Jan 17, 2025 at 04:20:01PM +0800, Yuanfang Zhang wrote:
> 
> 
> On 1/16/2025 11:57 PM, neil.armstrong@linaro.org wrote:
> > Hi,
> > 
> > On 07/01/2025 09:48, Yuanfang Zhang wrote:
> >> Add coresight components: Funnel, ETE and ETF for SM8650.
> >>
> >> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> >> ---
> >> Changes in v4:
> >> - Re-sort these nodes by address.
> >> - Link to v3: https://lore.kernel.org/r/20250103-sm8650-cs-dt-v3-1-759a3f6a3cc8@quicinc.com
> >>
> >> Changes in v3:
> >> - Move ete0 and funnel-ete to /.
> >> - Update coding style.
> >> - Link to v2: https://lore.kernel.org/r/20241210-sm8650-cs-dt-v2-1-cf24c6c9bddc@quicinc.com
> >>
> >> Changes in v2:
> >> - Update compatible for funnel and etf.
> >> - remove unnecessary property: reg-names and arm,primecell-periphid.
> >> - Link to v1: https://lore.kernel.org/r/20241210-sm8650-cs-dt-v1-1-269693451584@quicinc.com
> >> ---
> >>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 166 +++++++++++++++++++++++++++++++++++
> >>   1 file changed, 166 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> >> index 25e47505adcb790d09f1d2726386438487255824..49d6567fbd2e68b66b517d8d9180c7443f8bf611 100644
> >> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> >> @@ -365,6 +365,40 @@ cluster_sleep_1: cluster-sleep-1 {
> >>           };
> >>       };
> >>   +    ete0 {
> >> +        compatible = "arm,embedded-trace-extension";
> >> +
> >> +        cpu = <&cpu0>;
> >> +
> >> +        out-ports {
> >> +            port {
> >> +                ete0_out_funnel_ete: endpoint {
> >> +                    remote-endpoint = <&funnel_ete_in_ete0>;
> >> +                };
> >> +            };
> >> +        };
> >> +    };
> > 
> > Why only the cpu0 ete has been added ?
> > 
> > And why are the other components (TPDA, TPDM, STM, CTI...) missing ?
> > 
> > Neil
> > 
> At present, only ete0 is used, and other components can be added later if need.

Please describe the hardware, not the usecase. If there are other trace
cells, please add them.

-- 
With best wishes
Dmitry

