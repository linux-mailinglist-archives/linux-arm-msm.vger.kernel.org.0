Return-Path: <linux-arm-msm+bounces-80212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F95C2F37A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 04:58:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3BABD4E1FC8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 03:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5D9A27E1A1;
	Tue,  4 Nov 2025 03:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rgGGo5hS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C882BB1D;
	Tue,  4 Nov 2025 03:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762228721; cv=none; b=Xaxscu+AMhyWfUq7dfqLBSP7zwJ5szTKN10aGtnBB9MxoGr3EAVEiqPodzAYRqWeJ5K/pyOqezhfgWJgoiPE73gwVhQG7s8S0TT1AX93M6k3KVpIVG412KTCORxXkbctBRDvYIq8t/zjNe513qUWkKGWZvcC6v25c3LwTjpwPME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762228721; c=relaxed/simple;
	bh=+Ki3E1HMECV/Re8mxC5wCaHUywU4kqrtJf6FJykpzRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gOtqmhJG8kAb+RMcXbnkfAoZmqUqDMoklcONWAHSlEwcfM3SuMzRwmYxus3w76I1wUC1lnhic7vVTyofAf4734cV0liputmyc2DnZFBk5blbq0dFMxyxg7xrGtL9NSTqwLbE73xo3SlbfY/APWv4vR4dANoL7tN6eLHlYTDx0Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rgGGo5hS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C9B3C4CEF7;
	Tue,  4 Nov 2025 03:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762228721;
	bh=+Ki3E1HMECV/Re8mxC5wCaHUywU4kqrtJf6FJykpzRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rgGGo5hS1XO6eeJm2hBGkjhgah9Uj5zRun9awk1n3jj+V6UVMi6VJyUC7T4XPS+zP
	 FbfLZoK+KunZ1NLOZtOI1BV/FPbMAojcgXfnTTed/y8gTyp56fTqmatD8e6RB+mC7u
	 7SieDUCeM/zoAvXetPmqQ8/1HeEKSeg6qojLVpUtVHH0J1vtu+tBR+ILWmJrnTZP0V
	 AKYu9d4O8O35GXLRj8sIKfcfbMa4GcLcLkrKXbsbJwNEZb8G/MhqwGh3I8hVyM0lrq
	 facjVHJT/O7ijUd9F8kV9oZIFHCieaQcCmf2ycKUROcYSJ3pEHmmhog44nW+jqMQaS
	 UYduoQg3NvKPQ==
Date: Mon, 3 Nov 2025 22:02:13 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, 
	yijie.yang@oss.qualcomm.com
Subject: Re: [PATCH] dt-bindings: mfd: qcom,tcsr: Add compatible for Kaanapali
Message-ID: <l4mb5pi7kz7uuq6o3eueoxl2ngt2sdd6dv3kyudw6i54co5v5h@w6ya2nuas322>
References: <20250924-knp-mfd-v1-1-6c8a98760e95@oss.qualcomm.com>
 <b623c7f6-f28f-49ba-b6f6-25084117a6b3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b623c7f6-f28f-49ba-b6f6-25084117a6b3@oss.qualcomm.com>

On Tue, Nov 04, 2025 at 11:34:25AM +0800, Aiqun(Maria) Yu wrote:
> On 9/25/2025 7:23 AM, Jingyi Wang wrote:
> > Document the qcom,tcsr-kaanapali compatible, tcsr will provide various
> > control and status functions for their peripherals.
> > 
> > Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > ---
> >  Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
> > index 14ae3f00ef7e..ae55b0a70766 100644
> > --- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
> > @@ -48,6 +48,7 @@ properties:
> >            - qcom,tcsr-ipq8064
> >            - qcom,tcsr-ipq8074
> >            - qcom,tcsr-ipq9574
> > +          - qcom,tcsr-kaanapali
> 
> It looks good to me. Glymur didn't have this functionality verified yet.

You spelled Reviewed-by: Aiqun Yu <..> wrong.

> Remind for review.

No need for that, reviewers will review when they have time.

> 

But that said, most modern additions to this binding follow the common
format of qcom,<soc>-<block>.

So I would prefer this to be qcom,kaanapali-tcsr.

Regards,
Bjorn

> >            - qcom,tcsr-mdm9615
> >            - qcom,tcsr-msm8226
> >            - qcom,tcsr-msm8660
> > 
> > ---
> > base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
> > change-id: 20250917-knp-mfd-4dd3c81e6b9b
> > 
> > Best regards,
> 
> 
> -- 
> Thx and BRs,
> Aiqun(Maria) Yu

