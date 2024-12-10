Return-Path: <linux-arm-msm+bounces-41198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B34789EA706
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 05:09:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5CA9188992E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 04:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4BC622489F;
	Tue, 10 Dec 2024 04:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="N3V/kKSU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DE241C6C;
	Tue, 10 Dec 2024 04:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733803760; cv=none; b=XxjES0zE1XFXMlA4GxkZ5h61k++9OAp82u+hcmRoSv4cVy5bRq26hdXyUxV5UtOjN/TjB1IndgbTfJ8vHX326paSNF95bMgonYDAuKU0NsBSKwRPVer+CGW8Ev+E8zj87v3k0poYEn30I+z1xukamhIgQ4PzUwnhqTv4DuKaqGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733803760; c=relaxed/simple;
	bh=UC9488gl9T6A80VUWGtGF6J5sVo17VFJEmTIVqrxb70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q8YzaGq3zLoOFeldGcE9zPdncgw72bl+wOSW2t6lCAXf4dU/zX5gOWtRcpmh5NppZg63fp29B1ozOZi6SfDXoKnV4Y18QVeOMhTTLjT4seExgpNY97aEDZaGbAezz9V134/41OvQ3VV8Jy96oBP8tP9WwkvUQaKUq4BQPZfW/WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=N3V/kKSU; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=CU/ceaeuMg6s5VeGV4bWHaOpATNGJK0FHJF/eoUa5PA=; b=N3V/kKSU/FUHhKITh5qPkAIq2L
	yLkapdBDFcBAJ1sXfuSD9kCS4bPgVOYXuql/AHTZ41R2lwONLMeu6pwdwXLWKzYfbA4cHsjb3h3hc
	Eh+iypQ4ulOV1WzZZY1XfZl+rZ+rJbaBgtKmhCBZJX8dnujmRhbkzGLetblkNadg0H2U=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tKrYe-00Fksr-DN; Tue, 10 Dec 2024 05:09:12 +0100
Date: Tue, 10 Dec 2024 05:09:12 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: qcs615-ride: Enable ethernet
 node
Message-ID: <31a87bd9-4ffb-4d5a-a77b-7411234f1a03@lunn.ch>
References: <ececbbe1-07b3-4050-b3a4-3de9451ac7d7@lunn.ch>
 <89a4f120-6cfd-416d-ab55-f0bdf069d9ce@quicinc.com>
 <c2800557-225d-4fbd-83ee-d4b72eb587ce@oss.qualcomm.com>
 <3c69423e-ba80-487f-b585-1e4ffb4137b6@lunn.ch>
 <2556b02c-f884-40c2-a0d4-0c87da6e5332@quicinc.com>
 <75fb42cc-1cc5-4dd3-924c-e6fda4061f03@quicinc.com>
 <4a6a6697-a476-40f4-b700-09ef18e4ba22@lunn.ch>
 <441f37f5-3c33-4c62-b3fe-728b43669e29@quicinc.com>
 <4287c838-35b2-45bb-b4a2-e128b55ddbaf@lunn.ch>
 <2e518360-be24-45d8-914d-1045c6771620@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e518360-be24-45d8-914d-1045c6771620@quicinc.com>

> As previously mentioned, using 'rgmii' will enable EMAC to provide the delay
> while disabling the delay for EPHY. So there's won't be double delay.
> 
> Additionally, the current implementation of the QCOM driver code exclusively
> supports this mode, with the entire initialization sequence of EMAC designed
> and fixed for this specific mode.

OK. If it is impossible to disable these delays, you need to validate
phy-mode. Only rgmii-id is allowed. Anybody trying to build a board
using extra long clock lines is out of luck. It does not happen very
often, but there are a small number of boards which do this, and the
definitions of phy-mode are designed to support them.

> I'm not sure if there's a disagreement about the definition or a
> misunderstanding with other vendors. From my understanding, 'rgmii' should
> not imply that the delay must be provided by the board, based on both the
> definition in the dt-binding file and the implementations by other EMAC
> vendors. Most EMAC drivers provide the delay in this mode.

Nope. You are wrong. I've been enforcing this meaning for maybe the
last 10 years. You can go search the email archive for netdev. Before
that, we had a bit of a mess, developers were getting it wrong, and
reviewing was not as good. And i don't review everything, so some bad
code does get passed me every so often, e.g. if found out today that
TI AM62 got this wrong, they hard code TX delays in the MAC, and DT
developers have been using rgmii-rxid, not rgmii-id, and the MAC
driver is missing the mask operation before calling phy_connect.

> I confirmed that there is no delay on the qcs615-ride board., and the QCOM
> EMAC driver will adds the delay by shifting the clock after receiving
> PHY_INTERFACE_MODE_RGMII.

Which is wrong. Because you cannot disable the delay,
PHY_INTERFACE_MODE_RGMII should return in EINVAL, or maybe
EOPNOTSUPP. Your hardware only supports PHY_INTERFACE_MODE_RGMII_ID,
and you need to mask what you pass to phylib/phylink to make it clear
the MAC has added the delays.

	Andrew

