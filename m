Return-Path: <linux-arm-msm+bounces-29670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 506CD961853
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 22:08:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C1F328510B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 20:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 853181D2795;
	Tue, 27 Aug 2024 20:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="FO43gIRl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0742EAE6;
	Tue, 27 Aug 2024 20:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724789316; cv=none; b=Jtl/7YOaCCO+k0AYk0r4SFaM/FzVcXvUXh+tatDX80X4q7fgYMnmA+O7UXPHfXYkHBpVBWQ8Kot4HaOCkl//iLIcYmzm318Ld6H+5PT0IyY2hmRSLGWgYfNbGi/uGHd+JGd6ety9IQOhsdtirtE1d0Fbek3Bj1i4zBvA+DRlOsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724789316; c=relaxed/simple;
	bh=RVrdDN9Tyh7WCtixWnieltPq0wOo2Fo5P+6+skiGUuY=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=M2wM/NwufxV5a46znmtkBLes3xWkuKfDCsFcz0bLB5BfkqoQrv2295/SvpinVJBDD4WZ5ZJMMESPZX21t1Zj4FOYGjC9v/y3GAXZ550xTilOhBiFRnp/NV29BSAvD6w1KVjQpW8GR4K9OAgdx/UWl7MEzGc/IlXXi82Zgx7YsHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=FO43gIRl; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1724789290; x=1725394090; i=markus.elfring@web.de;
	bh=m2bnqP0azyyJIJfrx8N/GoNEEILIi2RttBG+GZKNrvA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=FO43gIRlPK3viR+8FvRc2gxKidFfV9fj2huiFmdyu8SrMIxuVozNOa6OS+P21uDR
	 HFuzqPp9msOqau+xGPBXOzKEYAFLE/Qu+qyj5N4AnApmAB7TVmo85QpP4PTX0+9A0
	 1NNPPogz86sq6tuG7tfWbbSIorlh3J7rndzQC5vIGGNWRLCVLs6wtqMQ7vOxxH86o
	 llzn7fxpV7oOCIf79mfHtBgFDPN9GadpgaIiTZvkkxw52MPsjzHG5iU5fV+3CJDdc
	 hwrJO796ChzwaLhIV65I3Khg9iEDOYNtE7nRPtDyLAwW5ZYgwcW3nxD7Hb2bP2vZ0
	 vzM7DNuQOXd6hblaGw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MUCz1-1sZzwX2lVr-00ITpR; Tue, 27
 Aug 2024 22:08:10 +0200
Message-ID: <abd2fd90-7ff3-48df-ad6d-64796000059f@web.de>
Date: Tue, 27 Aug 2024 22:08:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, opensource.kernel@vivo.com,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Yan Zhen <yanzhen@vivo.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <9ce5d7b09b5358c9190d8a999d79de23.sboyd@kernel.org>
Subject: Re: [PATCH v3] clk: qcom: Fix error checking for
 devm_clk_hw_get_clk()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <9ce5d7b09b5358c9190d8a999d79de23.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8CDQWoGneOrPi3wjoxxsmEAuim5JjvaBBWaVQPM3uSU/olYBLAQ
 FgbUkF1nYaQ1t9z8GN99vli1fdt8ov54tKml6Khdd1T4BADIA5oaB4bHNUUS1T2mHAy2X4x
 XcP2kq5T52vwdks+SFGcZUKslaKCqMEpOF8jcZNJW3iKuUpJgs8BuZj6XgS8flPazjeE3NS
 pYlhqjLsQ263LNF6sEFyw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jfeVxQjqUVQ=;OiCjB/Nyl5VxCTn38djVbFJJsgT
 4Bz8lpg8axuLGbC574zd2BUVeKNeSkypi5fsN8ql3gTmWg25N8l4P2WvuihVzAP06JFvYbAtJ
 U14gEpVWhZhUop9YqL4kTJo/a/Q3IQPgWxV7mwkTEZdFq2mHJInaBVS3Ji9jwQnqMpYhgDuMh
 D6lm47QDe03D95wUUoFQKd4wsGrjAXbsRz65Qv5wPgY6wP6/FJpaDam7T27LDLy1eN8xtt//W
 vlieOLtZyA1EYu6QU2tpenqFqly+Ak/xoIgPCLZjJIr1hJxa8I9AIp/OhYrT7bhIqK3vxKE5s
 k4XCbA1YrT7/7KgIzVTkZLPmkbkxEzy8Hg2oeX5vAUdBluhHcUMSyXDRayF7y2p5xLafWM3Jd
 yUSkCK2Mu+HRPjD0PSQc9l5ZfBdwhkM8b/lcjHitCoC+5q7Lx0io70c6KCp0AuVpiyK2LV4Zs
 pXkjixmHNAl6O380VnEtJx4AkiAhey9uvL/N82bDweFftH3glHFWY9GtglsFDIISyp/AFyqbA
 +K6fGavQ1KdFd+nKuK8moTTx++IxXaQD4/Tt1xnqhecg3vYk5VVZlFsc6wL/siEMlRocNXtqR
 JT+XY59lHyELuaSgNQdTd6yRwjZCnBy4KhOik6LYeRYg+AuTnqddCtk6Vjz/LqRpBDMlPEjG4
 eyc3C/yl6Yj5+U8ed9VGEtWpVlBDz+FXSn8l4RRUKRgPOQJSsaWuVPDwxhY7F8b1uemg2b2Nu
 1Uz3nma80Cwwl/gTsffWkv+rDRutYtxpSgX3WzYDkwurQO0wnwjMPTywJBTLq08zBpca20Eag
 K044vcUM69YLBU5gJYCB3DEQ==

> > The devm_clk_hw_get_clk() function returns error pointers.
> > It never returns NULL.  Update the check accordingly.
>
> It can return NULL if the 'hw' pointer passed in is NULL.

How does this view fit to a published function implementation?
https://elixir.bootlin.com/linux/v6.11-rc5/source/drivers/clk/clk.c#L4703

Regards,
Markus

