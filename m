Return-Path: <linux-arm-msm+bounces-28264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E532A94DD16
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Aug 2024 15:37:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97DDA1F2156F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Aug 2024 13:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B41D0158532;
	Sat, 10 Aug 2024 13:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="NMm4nnLS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CF81BDC3;
	Sat, 10 Aug 2024 13:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723297052; cv=none; b=KFJPXdQTt5L+M7Lq1iV+HkHfrvA3wvsX6OjEHdWSl5uWfO6F18RRJLpE7XBPrGT691AsbXn194PDAXXvNgBE+yVCTUeDz8GRRm4CGnZFL16Bnm5E9XvCOmwo1RUcoN/gccDpx06wbDxIpue9Qhx9FM9aXT3ENyoqfgWcnfFRNc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723297052; c=relaxed/simple;
	bh=FoMGXcxzmZi6fsVLQcG2de1o9CKISWaGNCi1QFogghg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ww1HKTfmbpOyIpyP2TTtUSjTXT3Pci3RDR2b27nh5OBovDkHM9HY6ry8aShTVfBmDo6V0XCn4+i8w1sCXQlkHs7sNIKNitelgX23TR462lkCaQESJcGKg4EwiRXxLy9la2KUjm3KRbTZ2eQJQ0YzN8HoxifUmeDXrifZSGB0y7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=NMm4nnLS; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1723296602; bh=FoMGXcxzmZi6fsVLQcG2de1o9CKISWaGNCi1QFogghg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NMm4nnLSuRckPGTr6LEmABPa7lLHILGmiOC4ai/zz/aq8AOWf38e31cnej5cgkBKj
	 FRD0HANPayEpxa5OFHMTYrqOAm56dN9iAVyj6OC4wwpIFg1jElKc64tTbo+9j3o+E9
	 S64Gpfq1vuG8yk+Qr9GGeVyE1NidNgmFhtdYUPZM=
From: Luca Weiss <luca@lucaweiss.eu>
To: Luca Weiss <luca.weiss@fairphone.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>
Subject:
 Re: [PATCH 0/3] Add DisplayPort sound support for Fairphone 5 smartphone
Date: Sat, 10 Aug 2024 15:30:01 +0200
Message-ID: <2741308.mvXUDI8C0e@g550jk>
In-Reply-To: <192e3c22-fd63-4891-86b2-89a3383ab76d@kernel.org>
References:
 <20240809-fp5-dp-sound-v1-0-d7ba2c24f6b9@fairphone.com>
 <192e3c22-fd63-4891-86b2-89a3383ab76d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Samstag, 10. August 2024 14:35:00 MESZ Konrad Dybcio wrote:
> On 9.08.2024 10:33 AM, Luca Weiss wrote:
> > Add the necessary sound card bits and some dts additions to enable sound
> > over DisplayPort-over-USB-C, e.g. to a connected TV or monitor.
> > 
> > The UCM files can be found here:
> > https://gitlab.com/postmarketOS/pmaports/-/tree/master/device/testing/
device-fairphone-fp5/ucm
> > 
> > Two extra notes:
> > 
> > 1. I don't quite understand whether the sound driver should have
> >    SoC-specific compatible or device-specific compatible. Some earlier
> >    patches by another author for a QCM6490 board and a QCS6490 board use
> >    device-specific compatible - but from what I can tell this is not how
> >    it's generally done for other sound drivers?
> > 
> > 2. Unfortunately DisplayPort enablement itself for Fairphone 5 is not
> >    upstream yet. This is blocked by DSI display bringup upstream which
> >    is blocked by DSC 1:1:1 not being supported upstream yet and just
> >    working with a hacky patch. Nevertheless, DisplayPort audio was
> >    validated working with no additional sound-related changes so once
> >    DisplayPort gets enabled, sound should also just work upstream.
> 
> You can enable DP and keep DSI disabled for the time being

I need to enable dispcc for DP which breaks simple-fb from my testing?

Maybe I can figure out the correct clocks and power domains to put into the 
simple-fb node? Do you think that would work and be sufficient to make both 
simple-fb and DP work?

> 
> Konrad
> 





