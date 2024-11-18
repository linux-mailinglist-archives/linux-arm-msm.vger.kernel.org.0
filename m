Return-Path: <linux-arm-msm+bounces-38220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D570B9D0F54
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 12:12:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A7582838B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 11:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44EA91990B5;
	Mon, 18 Nov 2024 11:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tcR6foje"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8494B198E79
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Nov 2024 11:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731928356; cv=none; b=H+ncWzoe/FkewzrURBHIYwgDP8RGOkmDE3lpc+5t4SN0RTFb0DpnfowC7eIPNWEPXWQ6MrHb8xuRrkIS6o6CjDPRI9lyku3XJAOS0a9bp6BsVMPC5yyECDUbIYFTBcZe7k8pLs/r/dTVLV6nOfJ6evD/P0cWBJMH7hErp14XE3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731928356; c=relaxed/simple;
	bh=kf6LlUkHvKfaYWUSRBGDtYSN1GF1H8EH4+zF0AWvGa0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ek1z7nrePJKwTqBsX2diXDe4wmN34mrAkpKmjN1Jh2cwzWCmNyFJrOhzw3AI/WczCnUVQ3ruTNipG+8zSJubq5K/KvDKiZoCqeTFcRf3QnkIWT7C/MPnhCvxsrtcesyJ3zfzrsZTjDJIjVYoegrE2GqYev3RAjhdYdFkTYLwLN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tcR6foje; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e382e549918so1922128276.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Nov 2024 03:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731928353; x=1732533153; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G22RYx+cV9f6HvHq4QtBk4s+ht1Zmmz+PXqgctOpaeM=;
        b=tcR6foje3v6Xz6LC4j5DaKm11DcLChQu3Gp/45ll8TcXqsAD7FE7aycSNxK996zKF/
         QAGRfoRWwQcsZQg919zo1g49Hxu3ryq1k8dd/1oapATGHteahUYG0ohH+SIhzUgJ/phu
         Mrs7th/oOdVbZT3feSPKsN9Eu2KxDcecFjLgFS4kXXRupnwmu3hFiRmKFaV7SIuxpUDg
         YWwtM9Af8aybY/JThhivjIVRObijmIcir53c5Cymkr+kifEknjdZsj9JLl6V9UFmtBnT
         WoxGDlq+E4cto9MDXWGJ0HSgrQeq/BYSB2RHmy84caKdzEJz7rQoFZh1Ora/34v8E72X
         H56w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731928353; x=1732533153;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G22RYx+cV9f6HvHq4QtBk4s+ht1Zmmz+PXqgctOpaeM=;
        b=wFMBDZoBq+xG1a2rdfPXa6HEzifoqDcdw6tJba3lmem4D+fEJhm3M3B9DEy0GBKYuu
         c0UQZ28Jip1DnN0LpjRcB0tgKDWPaXFPV9LrKx2nG6e4kHcXY4UUzTMBLW1NHwOa6e3a
         I5Vyf9XumsRKuAapiCuEX85ztfF1EjP6PqFMEAK909cC6KUI2P2PTLkggS/g/cY1/v2n
         oPuDfORtvT5vaVe9w3Y6uWMTy7fV+9OC+z6Q2+ougkenDwwhgP8eryh+zAfCFfDUqB+9
         TOjro9TXnk2Y3scOL5f+e0HE+e7qxf01ppx9mALJpluMXzfKIG8klC4cbLKlTVAeuzP7
         t83Q==
X-Forwarded-Encrypted: i=1; AJvYcCUlSvYyYMIPbqs9ChAApZjLMQaR5FPuhECgc9hT4nVRYOTRsdicMDDT2lI385xLvokHxP+65oTTQ+twSfeH@vger.kernel.org
X-Gm-Message-State: AOJu0YzfOPqa9dk9yshNxtNI1UUmAPpPCTuQTjqKTVEKBTlUmGqgSkuU
	1pWyOUKn3uNxCjaixScDNO+TbDUfDTttpHPhdcWgwlIrmoVmGoqH8JCGaLolNeQCyfjKYZSlM+L
	Hr6/5wioLhB03ECzfGYXLGYXLXHdNYgEZxG3tag==
X-Google-Smtp-Source: AGHT+IHLY+BrilGuLpgXss8DD+0OdYBfBhz6KB3G2UBFhJs4vHAEcnVQq2ZHDT9bvsudkIPm7u0B5atzMYz3d60CAAw=
X-Received: by 2002:a05:6902:2d05:b0:e2b:e0ba:d50 with SMTP id
 3f1490d57ef6-e3825d34f31mr9904280276.5.1731928353503; Mon, 18 Nov 2024
 03:12:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241112075826.28296-1-quic_rlaggysh@quicinc.com>
 <20241112075826.28296-2-quic_rlaggysh@quicinc.com> <tv7gsceomtdjcymma5ximownsxleg2ujuxcwjgkzj5zhmlscr7@wnyx3bfi2cpo>
 <386f0f4a-b17e-4f0b-90ef-0a960f23b1e4@quicinc.com>
In-Reply-To: <386f0f4a-b17e-4f0b-90ef-0a960f23b1e4@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 18 Nov 2024 13:12:22 +0200
Message-ID: <CAA8EJprotUaKk+H6C+QK8VN4uNWhUrTaoTq7sj+X0x+oJr2qZw@mail.gmail.com>
Subject: Re: [PATCH V4 1/3] dt-bindings: interconnect: Add EPSS L3 compatible
 for SA8775P
To: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Odelu Kukatla <quic_okukatla@quicinc.com>, 
	Mike Tipton <quic_mdtipton@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 18 Nov 2024 at 13:07, Raviteja Laggyshetty
<quic_rlaggysh@quicinc.com> wrote:
>
>
>
> On 11/12/2024 7:20 PM, Dmitry Baryshkov wrote:
> > On Tue, Nov 12, 2024 at 07:58:24AM +0000, Raviteja Laggyshetty wrote:
> >> Add Epoch Subsystem (EPSS) L3 interconnect provider binding on
> >> SA8775P SoCs.
> >>
> >> Signed-off-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
> >> ---
> >>  Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
> >> index 21dae0b92819..94f7f283787a 100644
> >> --- a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
> >> +++ b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
> >> @@ -33,6 +33,7 @@ properties:
> >>                - qcom,sm6375-cpucp-l3
> >>                - qcom,sm8250-epss-l3
> >>                - qcom,sm8350-epss-l3
> >> +              - qcom,sa8775p-epss-l3
> >>            - const: qcom,epss-l3
> >
> > No, sa8775p isn't compatible with qcom,epss-l3. I asked you to split the
> > driver patch, not to change the compatibles.
> >
> >
> Got it, I will split the driver code changes into two patches.
> First patch will contain the SoC-specific compatible change and multi device support.

no ands, just multidev.

> Second patch will contain the generic compatible addition to of_match table.
>


-- 
With best wishes
Dmitry

