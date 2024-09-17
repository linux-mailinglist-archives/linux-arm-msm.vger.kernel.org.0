Return-Path: <linux-arm-msm+bounces-31891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C58BD97AC84
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 10:01:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EF3C2842E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 08:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F201130E27;
	Tue, 17 Sep 2024 08:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B98kdvWp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FA929A0;
	Tue, 17 Sep 2024 08:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726560081; cv=none; b=BQblffU8pJtw1uQNwVxxnblGSw43mwMe2TbIwcXyCzUBq/SxJOzL6H6m1XyzRe7eEvTrUAx1/aVb4tKK2o6xmjvI3L05wCQIgC/vFD/7x4m5+yqi50La7dadrB7vIWEXrI1ANf5oXmFKyaZjK7uxAtzoe0XlEBtTIrEQpqua0oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726560081; c=relaxed/simple;
	bh=tO6Tw7K9c4PjqQEh9NEuL90zC3+LFKl6sE7WNkMEt34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m/IC60OPeaOnZqT5dRU/zYu/r8bNP3f31OhMYBt0xCpvMMJymJfhbMauhdsc2/Kxj9nA1mgLFugSuQPHJawHCdbICu28Gk0eoLwchNkSrKCH1HZeXMzFxXz6/xp1ZwE7XfkVcjAX/aetaw31jQjHEA0DoFktUxWaQzjDRWAfKEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B98kdvWp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5EF3C4CEC6;
	Tue, 17 Sep 2024 08:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726560080;
	bh=tO6Tw7K9c4PjqQEh9NEuL90zC3+LFKl6sE7WNkMEt34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B98kdvWpHvR9LgiEwUGT6oiBjA53BjSiTZZPXfA2wWflYl8MCVvcBECGBsLVKTmtD
	 JL4Oa3CyJiE2j9R7Oq34tMBr5gUsujQp+Wo4HyMcJ/BLdEXTyhmp7xcjok+xuEBrwf
	 bePXQdfJ2bGndDyPXS67kw+b/P1L2NL053dQ/OJbYgjSvn/FIG58ARSziOLPA9HHJC
	 GgOViL8pr3yLrKOb4VPROFhWzYQo5x0IvPD0dB43hZDPbEPsxLFgwGn0rBD5ALlNMl
	 Sd0P/Zgc2jCZ71X4hrjvi8E1WbjNVuvZGRhYj/1cvXTx2oicjPTCEx8kOC74mNti/+
	 buFehd8wLVogw==
Date: Tue, 17 Sep 2024 09:01:15 +0100
From: Lee Jones <lee@kernel.org>
To: Nikunj Kela <quic_nkela@quicinc.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@quicinc.com,
	quic_psodagud@quicinc.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Shazad Hussain <quic_shazhuss@quicinc.com>
Subject: Re: [PATCH v3] dt-bindings: mfd: qcom,tcsr: document support for
 SA8255p
Message-ID: <20240917080115.GA9955@google.com>
References: <20240905194741.3803345-1-quic_nkela@quicinc.com>
 <edb25f16-aa9a-4d44-9eb5-63f509f80fde@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <edb25f16-aa9a-4d44-9eb5-63f509f80fde@quicinc.com>

On Mon, 16 Sep 2024, Nikunj Kela wrote:

> Gentle ping...

Please don't do that!

No top posting, no contentless pings, and be aware of the merge-cycle.

You're on the list (which since it's in reverse chronological order
based on the last message, you've just put yourself at the bottom of the
list).

> On 9/5/2024 12:47 PM, Nikunj Kela wrote:
> > Add compatible for tcsr representing support on SA8255p SoC.
> >
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Shazad Hussain <quic_shazhuss@quicinc.com>
> > Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> > ---
> >
> > Changes in v3:
> > 	- Removed the patch from original series[1]
> >
> > Changes in v2:
> > 	- Added Reviewed-by tag
> >
> > [1]: https://lore.kernel.org/all/20240903220240.2594102-1-quic_nkela@quicinc.com/
> > ---
> >  Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
> > index c6bd14ec5aa0..88f804bd7581 100644
> > --- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
> > @@ -21,6 +21,7 @@ properties:
> >            - qcom,msm8998-tcsr
> >            - qcom,qcm2290-tcsr
> >            - qcom,qcs404-tcsr
> > +          - qcom,sa8255p-tcsr
> >            - qcom,sc7180-tcsr
> >            - qcom,sc7280-tcsr
> >            - qcom,sc8280xp-tcsr

-- 
Lee Jones [李琼斯]

