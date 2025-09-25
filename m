Return-Path: <linux-arm-msm+bounces-75116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C4BB9F72F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 15:12:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0ACB3B3F68
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 13:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C411220F38;
	Thu, 25 Sep 2025 13:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oAnizgjI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1198721CA13;
	Thu, 25 Sep 2025 13:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758805928; cv=none; b=h9DtGU6lAhewr1HMd0e4CDJQnR6PvQBJSaWAMcJXremkzpt975A+9Pd53ZwQsk5QbrYyOBuUr71HKQvamsCH4RmLHc5EBSVzsUwNpXBBJ92lXrfWVjOTzOv3ipsoQIkrmTwmmva/RHMnU0LRXTrQmfCM8bf56ftswlj+a5WiFFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758805928; c=relaxed/simple;
	bh=hCbg+xH0PAFSHq/z2bdjQ4pq3+Cnx9PLmBUG/OA2ris=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a/EwxcNcO0Swac8FSlS2rAQpgkewADLNnLxDgb9V3trdvDSEhE2Z1410cse685TdtVgsIKt5vTDp8WpcpQbtff6KEmuU73OnG8FuX9KkHOqP04y/7gPYFrCIsWZ9Fc6Bvjoh6HvdK+HoKZYdWMkYnNcUson8XNbTDKB8CIC8u1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oAnizgjI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D07E6C4CEF0;
	Thu, 25 Sep 2025 13:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758805927;
	bh=hCbg+xH0PAFSHq/z2bdjQ4pq3+Cnx9PLmBUG/OA2ris=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oAnizgjI5yWSwS247xUL1Al1T++xVE+5Ckc0md+K/OeloABVWqUpTznDhQP7Ha4FM
	 z6iyGrVpaWU+VYgcG/8rsA1gQWAmWIyq4dgY7brtt1Vl5h16cutxxXRt+VAH90oVHq
	 Hjt/xHdyJxnU770UqWU+ioF2kPwvCUU27LEDHkhTTaLf5x67Mzg80k4F30/nvaC5yy
	 OWMFV0jXJYaKYDbfzzLesYN9ITDeHa7prYLFuwb587YSwMc40+UCxnx2w2t8scpj7t
	 Ql0bdQc+wIHIAjbDCva1q0rEMfDeM1zWPquSqLTpDRARLjAUVUr3+sZrcQJPy0WTJO
	 Mnwluuq3UnhrA==
Date: Thu, 25 Sep 2025 08:12:04 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
Subject: Re: [PATCH 2/9] dt-bindings: clock: sm8450-camcc: Remove sc8280xp
 camcc to from sm8450 camcc
Message-ID: <g2e5ejykf6nteipzsybbjjjcdvko4yg664uxh57bi3ty3cljh4@5mv5ki2cqyg3>
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
 <20250924-knp-mmclk-v1-2-d7ea96b4784a@oss.qualcomm.com>
 <a8ebec72-eee2-4a02-ac6b-57678aa7c50f@kernel.org>
 <1c90a127-4b39-4cad-9805-d4449990baa7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1c90a127-4b39-4cad-9805-d4449990baa7@oss.qualcomm.com>

On Thu, Sep 25, 2025 at 02:14:01PM +0530, Taniya Das wrote:
> 
> 
> On 9/25/2025 1:59 PM, Bryan O'Donoghue wrote:
> > On 25/09/2025 00:56, Jingyi Wang wrote:
> >> From: Taniya Das <taniya.das@oss.qualcomm.com>
> >>
> >> SC8280XP camcc only requires the MMCX power domain, unlike SM8450 camcc
> >> which now supports both MMCX and MXC power domains. Hence move SC8280XP
> >> camcc from SM8450.
> >>
> >> Fixes: 842fa7482915 ("dt-bindings: clock: qcom,sm8450-camcc: Move
> >> sc8280xp camcc to sa8775p camcc")
> >> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> >> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> >> ---
> >>   Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml | 1 -
> >>   1 file changed, 1 deletion(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-
> >> camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-
> >> camcc.yaml
> >> index c1e06f39431e..dbfcc399f10b 100644
> >> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> >> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> >> @@ -63,7 +63,6 @@ allOf:
> >>           compatible:
> >>             contains:
> >>               enum:
> >> -              - qcom,sc8280xp-camcc
> >>                 - qcom,sm8450-camcc
> >>                 - qcom,sm8550-camcc
> >>       then:
> >>
> > 
> > This is not a revert.
> > 
> > Where does the compat string go ?
> > 
> 
> The compat is now part of
> Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml as part
> of this commit "842fa7482915".
> 
> > You are missing the part where you move the compat string to where you
> > think it should be...
> > 
> 
> It was already moved as mentioned above.
> 

I'm sorry, but I don't see where you say this. 

The commit message is a verbatim copy of the first paragraph of commit
'842fa7482915 ("dt-bindings: clock: qcom,sm8450-camcc: Move sc8280xp
camcc to sa8775p camcc")', where that comment makes sense. But here's
you're no longer moving something.

Please help me understand what I'm missing.

> > Also why is this patch appearing in a series about _adding_ Kanaapali to
> > CAMCC ?
> > 
> 
> This was to reduce less dependency on the series.
> 

Had you sent this patch last week, I would have merged it into v6.18 and
there wouldn't have been any dependency.

Regards,
Bjorn

> > NAK
> > 
> > ---
> > bod
> > 
> 
> -- 
> Thanks,
> Taniya Das
> 

