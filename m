Return-Path: <linux-arm-msm+bounces-36905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E90A99BB150
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 11:39:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 189A01C21392
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 10:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F3EC1B21B0;
	Mon,  4 Nov 2024 10:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Un0vtX8r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A291B21A0
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Nov 2024 10:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730716736; cv=none; b=TNcoqxToPQFNGv035r36JRd+xrXA4mVD2XTF2AY5Qxu59SVYByii6hB4wuzR8f15js4sT89O2K7k3vwd9eu7qfcY/dwXna+P/6Ma9j+qRWR43UV9LJPAzbrgcAQAVhATtyFIZkfXpqi44PKMfFsiqCl6o7a+Ypdz0EIEqboa+yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730716736; c=relaxed/simple;
	bh=51jGYEqZUKc37O1/8L+bDqAHylGHsKjpsXE/LC0WEuw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hwIiqD3ig5brWYI26E5MqxxpDxnHKa2C8FrF6AoZyaCkFPJgntlHYzLUJ1llviy7XIYM9HCqx1gJ49p5rzw2AFzuwm8EJcLvifhxR6rTzAJ/HSUOtQ/+X0vDTs0c9nHA/N7fn6/A1eUUVMUAlJFxs8sxbIQomgfQE2B6DUwaWxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Un0vtX8r; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6ea15a72087so31142807b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2024 02:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730716734; x=1731321534; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZN3UQU6if0WOIwavnpYZdgDUX74h839maXyGtWEijfg=;
        b=Un0vtX8rg/bHDap+NrcOsAB2vMg4Z7qOGiN9reRgjX7vidxf6jpqGTqfpdMdf4wzRF
         okXSi3wxoqBevvHNFv+fEP+yLLWxe7+8OK9rEtDXtuVj6Pf4NsGhW5NSzSWY6Wa17Z0G
         LA7PzHg4i9xy6TZHZIHAxUQcjoJ8tTSWSkUWQNMpg/7ze/jwLgCWkx2QSfzjsccSoHCU
         7uU41V/HE4rARlADwXuHIBUMJckKM0dDlUphTH4oHAcimEOq7Ioz4hCdJufmBRUr97yz
         5ZGiZuCHe0hAJdsJ8hNtrRGObzNII0/tFeZ3gPaQO9LiAH//3GwPLF5zQYwMB5eW23n2
         Dv4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730716734; x=1731321534;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZN3UQU6if0WOIwavnpYZdgDUX74h839maXyGtWEijfg=;
        b=PqXgj81DucOwpTAV89n7l5oXKBRklqVXGJY142NgUfPoPBlxwxCBjunkmSv0VZg2sk
         yiQJiuPC4b6oB+MKG2cN1lAa9WyDC00JM+Y4yXNRQs7sUyPAyWR+CqN83cu9xTKUvCP5
         66h8/1VwR6Cm7Z/lx9zAXsf3L08whMZ5qxSeex0kLJyFARttsv4qkEj4XIEct2kwQfoa
         v28MOHYPoia8sRlpw65yg65ecOzcECkZptoqk3jj2bw/zcJjybnXXuOrqGfp6Z4j1TWQ
         Brh7sx+afvKAEvF2YDweC3RbaFJ4Cc8wG7YhRvr8yIZhcaaSTXoHvh7ZQjLCb3xDEOO6
         Vo4g==
X-Forwarded-Encrypted: i=1; AJvYcCWMnSQRXDn4GAaSMcMGKiqlD6kGu2X3nQ7xPYyq77DsWQ9BiAyUt+pbHoQgnmlAhiYmhKhprOVY+yn0tzvG@vger.kernel.org
X-Gm-Message-State: AOJu0YxfF9zIN6D44q4Git0frnPdMsoS0Ng3fajBu42kx5UkCta2aZIN
	EudPKcTf0PxHm9W0hzNs24rQwB8Y6W01twu9DrMjGKWjxODWx1tVA9WFUdWacmbN8aimQhJa3uG
	iyPR80jAPUXotHS929JrXidTTbOgqhUHOOAk9wg==
X-Google-Smtp-Source: AGHT+IFdRXydCGcijxNpGwkhtTu/Ey+5ZFUBDuy7gb/66fDYNrtaMYmwYk2H7LPNBv6Ol0r0lwRj2f4zoyALIvyZzV0=
X-Received: by 2002:a05:690c:380f:b0:6e5:de2d:39b1 with SMTP id
 00721157ae682-6ea523215demr144706667b3.5.1730716734041; Mon, 04 Nov 2024
 02:38:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241026123058.28258-1-quic_rlaggysh@quicinc.com>
 <20241026123058.28258-2-quic_rlaggysh@quicinc.com> <7k2vnjop6xyshquqlbe22gm7o5empeluvsohfmq5ulnaas3keb@yzomhzi4w7vf>
 <2ac4604c-a765-48b1-84b2-8979f18c29a7@quicinc.com> <vljb7wwqaaqgdcm6whf5ymhnh4jbtswyibto4qpqmbgwvshudy@unh3jhbyeac6>
 <00c9feac-722a-481a-9c57-36463fe0b3ff@quicinc.com> <925202f0-7fd1-4422-88fb-138c9027ac2c@oss.qualcomm.com>
In-Reply-To: <925202f0-7fd1-4422-88fb-138c9027ac2c@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Nov 2024 10:38:41 +0000
Message-ID: <CAA8EJpqM0vQZR5yEbGeBBPbog4KoEiTp1kWRwrjuwO4wo_umaw@mail.gmail.com>
Subject: Re: [PATCH V2 1/3] dt-bindings: interconnect: Add EPSS L3 compatible
 for SA8775P
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>, Georgi Djakov <djakov@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Odelu Kukatla <quic_okukatla@quicinc.com>, 
	Mike Tipton <quic_mdtipton@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 Nov 2024 at 09:35, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4.11.2024 7:40 AM, Raviteja Laggyshetty wrote:
> >
> >
> > On 11/1/2024 12:26 AM, Dmitry Baryshkov wrote:
> >> On Wed, Oct 30, 2024 at 12:23:57PM +0530, Raviteja Laggyshetty wrote:
> >>>
> >>>
> >>> On 10/26/2024 8:15 PM, Dmitry Baryshkov wrote:
> >>>> On Sat, Oct 26, 2024 at 12:30:56PM +0000, Raviteja Laggyshetty wrote:
> >>>>> Add Epoch Subsystem (EPSS) L3 interconnect provider binding on
> >>>>> SA8775P SoCs.
> >>>>>
> >>>>> Signed-off-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
> >>>>> ---
> >>>>>  .../devicetree/bindings/interconnect/qcom,osm-l3.yaml         | 4 ++++
> >>>>>  1 file changed, 4 insertions(+)
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
> >>>>> index 21dae0b92819..042ca44c32ec 100644
> >>>>> --- a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
> >>>>> +++ b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
> >>>>> @@ -34,6 +34,10 @@ properties:
> >>>>>                - qcom,sm8250-epss-l3
> >>>>>                - qcom,sm8350-epss-l3
> >>>>>            - const: qcom,epss-l3
> >>>>> +      - items:
> >>>>> +          - enum:
> >>>>> +              - qcom,sa8775p-epss-l3
> >>>>> +          - const: qcom,epss-l3-perf
> >>>>
> >>>> Why is it -perf? What's so different about it?
> >>>
> >>> The EPSS instance in SA8775P uses PERF_STATE register instead of REG_L3_VOTE to scale L3 clocks.
> >>> So adding new generic compatible "qcom,epss-l3-perf" for PERF_STATE register based l3 scaling.
> >>
> >> Neither sm8250 nor sc7280 use this compatible, while they also use
> >> PERF_STATE register.
> >>
> > That is correct, both sm8250 and sc7280 use perf state register.
> > The intention for adding "qcom,epss-l3-perf" generic compatible is to use it for the chipsets which use perf state register for l3 scaling.
> > Using generic compatible avoids the need for adding chipset specific compatible in match table.
>
> That is exactly what bindings guidelines forbid.
>
> You need a SoC-specific compatible so that you can address platform-
> specific quirks that may arise in the future while keeping backwards
> compatibility with older device trees

The proposed bindings have SoC-specific compat. If that's not against
the current rules, I'd prefer to have qcom,epss-l3-perf to be added to
sc7280 and sm8250 too.


-- 
With best wishes
Dmitry

