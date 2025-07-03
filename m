Return-Path: <linux-arm-msm+bounces-63490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F54AF6B75
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 09:25:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A98F11C42CE7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 07:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9714B299930;
	Thu,  3 Jul 2025 07:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kOsaEp1U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C9F2989B5;
	Thu,  3 Jul 2025 07:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751527527; cv=none; b=nGXM+HYI3EdAnqN8rBvfq8X8yKUPHyL1f3rOM9mTWDh1UoSELxkJ9w4GRRR7Nq+aw+B/FO//0aMCqTXDI9wB2wHXX2Y3qivdHC+LDsSlO878tlxdLAd7BSvz5AaxQccIonMm55JX2W632DMT5mCEUcnH4Sh089HKUXVi4gauv6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751527527; c=relaxed/simple;
	bh=aDew+bu1IkMewjxnM3z0eY4e6uUPVQnfaQbO2Pgi9pk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m0JMqoCoNkfdvtpMKYLnYo9k4zSsBTfyXIV+u3+M5lv4M+u9JOBAju07AiI2eXDiXTuv8TqcEvn6cVZ/Lk0EQVee+OmkRsyXJkzV531TQLpMa25aDWqexfrFZzOqpkdtb2aIWoXjUkyd9nbf6iaZPNynLBmO4Hc5RUiggHhIvtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kOsaEp1U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FA64C4CEE3;
	Thu,  3 Jul 2025 07:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751527526;
	bh=aDew+bu1IkMewjxnM3z0eY4e6uUPVQnfaQbO2Pgi9pk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kOsaEp1Ugm3qagB7TkwS5SRuDXoKrUfoXdMhIeZrJZ8RO4GQLg9yNGuuvkvhX0lV+
	 Nhs3G7VMn1+K+0a6+TeXEQTYP5mY1NX9daRBdl/3a0JBharS0SOQAAHqpG2JKm2cgg
	 wYvYpECWuQXl3FN0et3infAqw6gNkFPhOCPDJknZaczIZRhy2++TR9mXm/HHcKRQi9
	 3C7kOVnXhN+NezU+n+OcFcX5txmph7cQRcXxijT0JUVc9pzCr7x5FdaONVznPsMrKb
	 CoMOGS3zGp66TbBY7EPcCYYkVNzL8C9okrm+n8jQh3DAcoK9vzg8L4W+yobPyhZOrb
	 ZygQJaDgQSl0A==
Date: Thu, 3 Jul 2025 09:25:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: qcom,videocc: Add sc8180x
 compatible
Message-ID: <20250703-robust-analytic-hummingbird-88eb3b@krzk-bin>
References: <20250702-sc8180x-videocc-dt-v3-0-916d443d8a38@quicinc.com>
 <20250702-sc8180x-videocc-dt-v3-1-916d443d8a38@quicinc.com>
 <mzmer4g7df7xqhnstpfhyzcm2irpmsk4iwtx6esjksp34lpkk5@76lrsoyb5cp6>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <mzmer4g7df7xqhnstpfhyzcm2irpmsk4iwtx6esjksp34lpkk5@76lrsoyb5cp6>

On Thu, Jul 03, 2025 at 01:29:06AM +0300, Dmitry Baryshkov wrote:
> > -      - qcom,sc7180-videocc
> > -      - qcom,sc7280-videocc
> > -      - qcom,sdm845-videocc
> > -      - qcom,sm6350-videocc
> > -      - qcom,sm8150-videocc
> > -      - qcom,sm8250-videocc
> > +    oneOf:
> > +      - enum:
> > +          - qcom,sc7180-videocc
> > +          - qcom,sc7280-videocc
> > +          - qcom,sdm845-videocc
> > +          - qcom,sm6350-videocc
> > +          - qcom,sm8150-videocc
> > +          - qcom,sm8250-videocc
> > +      - items:
> > +          - const: qcom,sc8180x-videocc
> > +          - const: qcom,sm8150-videocc
> >  
> >    clocks:
> >      minItems: 1
> > @@ -111,6 +115,7 @@ allOf:
> >        properties:
> >          compatible:
> >            enum:
> > +            - qcom,sc8180x-videocc
> 
> Is there a need for this? Isn't it already covered by the SM8150 entry?

Yes and no. Yes - some change here is needed as I explained. No - this
exact change does not work, so it is obviously redundant.

Best regards,
Krzysztof


