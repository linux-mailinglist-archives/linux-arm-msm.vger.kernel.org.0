Return-Path: <linux-arm-msm+bounces-11921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D86285C799
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 22:14:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48A4F283543
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 21:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 884AF1509AC;
	Tue, 20 Feb 2024 21:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="Q535Xm4t";
	dkim=permerror (0-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="pBreeP0U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E8D14AD12;
	Tue, 20 Feb 2024 21:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708463675; cv=pass; b=RK8o9Z15Z49A8PCiJOPAK7AaXueHpMypg1jE3l/g6b5QS8Dh35zQS+ER3eah1NKz1qyvYp6CrKo14TW7XhXxQ7uTDPz4qlMh5fV8l2dbiHPElLLFH9OU1+6RknPPA+NLsM6k/uX3hEOytwRhybyekl8s5SnLFW9oWGwnOL/hvTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708463675; c=relaxed/simple;
	bh=X3J4ARYDuq8zRwmpQAaANCvJXxo+4umvAejM38B22Hw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rwccNXiDebGLfp7kEpasBy2n9C9M5kBPp9yv51vsMCgmQ8rzlRRGJRLEobCv/oJL8GKZ5uc2YMje/ztXe8RODTOP30983eQPSphhob18QBKNha6dJVeyxUI79i8UReIbaU1/d1WgSWmoyKrmEgH6X3x3LrVuXbKmgH/JbUHoPAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gerhold.net; spf=none smtp.mailfrom=gerhold.net; dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b=Q535Xm4t; dkim=permerror (0-bit key) header.d=gerhold.net header.i=@gerhold.net header.b=pBreeP0U; arc=pass smtp.client-ip=81.169.146.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gerhold.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=gerhold.net
ARC-Seal: i=1; a=rsa-sha256; t=1708463490; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=LPGn+YhJnYqJbBnUG87PLh08wsn72zSTaPXIRALL8/uuKYce5vybDt1IEBQURoHoSN
    vxqkMIt0Nk8BeG53iWgdlMJ7tAnC6YJ1VoGvIhdJ3wLHDFv/Hw7Ha7wyF/vHxYa/ATRc
    osmUr7iNBzu2aJRPEL6mAOTBcX2gZEckolDfZH6wn6vigLSonjTOwy6zpVKEFmYBii0M
    81XpcJOCzQcVGUOzR8Bv+0FDzi49lsFFR85HsJLH+MIw06NkQgzj5qxscLyFL9/Ajf1R
    wdfeIld2J1vuQ4vTGyfSWxXavjXH05TmFWqAlijsEmUHk2DOvS06l79Q/02TI1rSVCiF
    7Y4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1708463490;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=+KeCXYbcuLeR/MEjiDTunidvdG+aFAeAfY2cXn0dLD4=;
    b=d+mLUoTEtX9GuY66VzTpvwFN+DEp92+ApZeXC7cEOBZJ/kBFGU2PaYvS6BcRcIcBH9
    eTVONOXMuTtoACl8OWi2nLWmmZNuTVwNL/hhORdGDWro3JDK6NUQLPe9l4JA2wIUmFxf
    FXE0s8ZLhyeCT2vZzzbllaxYJkONd0P5MqqQSlq6NN0WoDG57LWlqCTwHU2xjdfKFlrt
    v5NehSwCLqiJN6ryyXMGu/1LGrpUGT6MclfQC9+0lbAAAY+w81R8Y113/zhKZx+OrdEc
    yzWe6niEBeLcazv31LzsSafWUHObwsq0fXc0bIHvKLbfeyk6URWcp+5+cxdcCBC27SgD
    IHKQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1708463490;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=+KeCXYbcuLeR/MEjiDTunidvdG+aFAeAfY2cXn0dLD4=;
    b=Q535Xm4tqxL5UiiUdicDzNHhW4Jp2gpmLfOqUjpz6V9YYP+aUzXFrs5GXCUi6A2i2O
    Sf0tdRHfi98xFtnvKeXx0rNRYpoJ1dvSufU5jGav/Kgx3hXp51TH5MoyC0wT0gStK8rJ
    fmxQj7lS1JrxboM9YrxNKUFPZoiO4D1vvBimk3YJ/wpNU3yNg47N8wRlJHHiQ1TISQJK
    I2W/Ql5cZHHLb1HkvTYvRX/UxVGfNmckD2fuzPYWolrFWTe8e+645pOATi0a7sHqrx2y
    u3e7rrmJtLjZqs/P5ryUNu7R2uxM9wZAPWQytSlT82Ag9xtXMPE0jpvo60NAX4dlPOoM
    n/5A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1708463490;
    s=strato-dkim-0003; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=+KeCXYbcuLeR/MEjiDTunidvdG+aFAeAfY2cXn0dLD4=;
    b=pBreeP0UmPbOTbT5viwl4/qYwt075u/hHtscbgzbwiC9X0qiVquJzGkVdCHLItHgQi
    hmtN06ZhfTqN9/r9nLBw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u261EJF5OxJD4peA8Z+P1A=="
Received: from gerhold.net
    by smtp.strato.de (RZmta 49.11.2 SBL|AUTH)
    with ESMTPSA id ze34f101KLBTSLu
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 20 Feb 2024 22:11:29 +0100 (CET)
Date: Tue, 20 Feb 2024 22:11:24 +0100
From: Stephan Gerhold <stephan@gerhold.net>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: qcom: drop the superfluous device
 compatibility schema
Message-ID: <ZdUVfHa5SvoWbc-Z@gerhold.net>
References: <20240204-qcom-drop-compat-v1-1-69d6cd92aa0e@linaro.org>
 <ZcijFk9GcgtVoXoV@gerhold.net>
 <CAA8EJprKfMGTAtaMm1YoioRLDOtjXQ4XGm8geURB5WVXdYUK0A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJprKfMGTAtaMm1YoioRLDOtjXQ4XGm8geURB5WVXdYUK0A@mail.gmail.com>
Content-Transfer-Encoding: 7bit

On Tue, Feb 20, 2024 at 11:11:15AM +0200, Dmitry Baryshkov wrote:
> On Sun, 11 Feb 2024 at 12:36, Stephan Gerhold <stephan@gerhold.net> wrote:
> > On Sun, Feb 04, 2024 at 06:56:35PM +0200, Dmitry Baryshkov wrote:
> > > The idea impressed in the commit b32e592d3c28 ("devicetree: bindings:
> > > Document qcom board compatible format") never got actually adopted. As
> > > can be seen from the existing board DT files, no device actually used
> > > the PMIC / foundry / version parts of the compatible string. Drop this
> > > compatibility string description to avoid possible confusion and keep
> > > just the generic terms and the SoC list.
> > >
> > > Fixes: b32e592d3c28 ("devicetree: bindings: Document qcom board compatible format")
> >
> > FWIW: It's not correct that no device uses the version parts of the
> > compatible string. There are actually two boards documented in qcom.yaml
> > that follow this scheme:
> >
> >   compatible = "qcom,msm8916-mtp", "qcom,msm8916-mtp/1", "qcom,msm8916";
> >   compatible = "longcheer,l8150", "qcom,msm8916-v1-qrd/9-v1", "qcom,msm8916";
> >
> > I don't think anyone is actively relying on those, though. I guess we
> > can just ignore them or even remove them.
> 
> Excuse me for the long delay. As it was you who added the
> longcheer-l8150 support, does it require any of the msm-id options or
> dtbTool (original or modified) processing?
> If it can work with no additional tags, we can drop these compatibility strings.
> 

I think we added it back then to allow booting mainline with the
original bootloader. Together with the "skales" dtbTool (used to be at
https://source.codeaurora.org/quic/kernel/skales) the compatible does
result in a correct QCDT that is accepted by the bootloader.

I doubt anyone still uses this way of booting nowadays. In postmarketOS
we strongly recommend everyone to boot MSM8916 devices using lk2nd [1]
which supports plain appended DTB without special properties and other
more reliable forms of DTB selection. I have not tested booting mainline
with the original bootloader for many years.

Dropping the extra compatible would be fine for me. Personally I don't
consider booting via weird/broken bootloaders worth supporting (at least
if better workarounds exist). Having to boot with "custom" bootloaders
tends to be a somewhat subjective topic though so others might disagree.

Thanks,
Stephan

[1]: https://github.com/msm8916-mainline/lk2nd

