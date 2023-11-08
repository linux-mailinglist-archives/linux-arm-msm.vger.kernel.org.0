Return-Path: <linux-arm-msm+bounces-143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A29AC7E5012
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Nov 2023 06:38:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDFE12813C1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Nov 2023 05:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B3C6C8C4;
	Wed,  8 Nov 2023 05:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="n2r7PWWH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85CB8F7E;
	Wed,  8 Nov 2023 05:38:19 +0000 (UTC)
X-Greylist: delayed 149365 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 07 Nov 2023 21:38:19 PST
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 177E7D79;
	Tue,  7 Nov 2023 21:38:19 -0800 (PST)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4SQDQL0D30z9sZl;
	Wed,  8 Nov 2023 05:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1699421898; bh=hnp+MRetZIeRthwcZt8YAw+DaHaqqmUcyacYecXNAWY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n2r7PWWHSYKLXYEP0X9fa4eP3tTl0mFt7+N/KzSU0pJINQt5nJO6wMP7pfj8o393B
	 UVjnbftZbdJ5JYpVmL+rAWeEHXdrtWt+W1Z/EdzkW/5gH4Tr8PVEB9km+hxyp+3ri1
	 JKEjcA5leBDjDdcez/nguaIBKgg4kmRPZUfU7ZMo=
X-Riseup-User-ID: 4F845E5C8472CAF32BD62747F514CB998E4B9C350F494338EE95BEACC9A4466E
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4SQDQG6LQczJmtY;
	Wed,  8 Nov 2023 05:38:14 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Robert Marko <robimarko@gmail.com>, Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 8/8] soc: qcom: socinfo: Add PM8937 Power IC
Date: Wed, 08 Nov 2023 05:38:02 +0000
Message-ID: <6027616.lOV4Wx5bFT@melttower>
In-Reply-To: <6715dfd5-acf5-434c-a9bd-0a5bcdd72010@linaro.org>
References:
 <20231106-pm8937-v1-0-ec51d9eeec53@riseup.net>
 <20231106-pm8937-v1-8-ec51d9eeec53@riseup.net>
 <6715dfd5-acf5-434c-a9bd-0a5bcdd72010@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, November 7, 2023 9:30:34 PM UTC Konrad Dybcio wrote:
> On 11/6/23 13:08, Dang Huynh wrote:
> > The PM8917 and PM8937 uses the same SUBTYPE ID.
> > 
> > The PM8937 is found in boards with MSM8917, MSM8937 and MSM8940
> > and APQ variants.
> > 
> > Signed-off-by: Dang Huynh <danct12@riseup.net>
> > ---
> 
> Are they secretly the same thing? Do you know somebody with a PM8917-
> equipped device to check that theory out?
> 
> Konrad

I don't know anyone with a PM8917 device, but I did check with downstream 
source and all the reference to pm8917 are either not used in any dts or point 
towards pm8937.

Dang



