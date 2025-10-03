Return-Path: <linux-arm-msm+bounces-75939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E993BB7ED3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 20:52:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3B07E4E25CF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 18:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C42552DCF51;
	Fri,  3 Oct 2025 18:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="YgO7rT7E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F72823AB8B
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Oct 2025 18:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759517529; cv=none; b=WTbzEcBJhfZacEWFVhym8drmfLuG+uoD1LIBDuMIAk24trmBkNAk1mjIxn2Sf6ChFLie1ijQBf6AhSvO2bnefnkytoYNLcSCyT1yo0RxZvylU+PCM4AlgkH0UBLupE8r5VitBEOCqbWFQQWVMtUIYntLgFqMVFN7FbrnZdzdlSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759517529; c=relaxed/simple;
	bh=B15vy4G8yT5+l7Cy5PIAiqSAyyBps0v1UUV+YoW1CDk=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=Zxu/BBpxGZDcap1BF4ZGTYhWnqseuX2Jcr0/zdrv9YRQzspnVzolFw1MIw6Xl4NyZVAatCc+jJSkDSc4lNcRvfVrAMGf2gIBi55TtmcFI1Ru9P2xQRmuyTXQaFKf0rg6pMgr25V8ewTksqCrEoHaKph6ErSocL6zRZjYuAMltQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=YgO7rT7E; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1759517525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B15vy4G8yT5+l7Cy5PIAiqSAyyBps0v1UUV+YoW1CDk=;
	b=YgO7rT7ErOyaf4CxR+vjsT+kvZMhD2sDhOn3Y3BG9FjIAtf4nq/SMF3G8LRRGFvQtcA0Ei
	pgQY2IAQC/n6luIXBj4cTjrz35mNnh+7xXXr5EIbkxQ2CPbQbdgac7TWt16CA6b2qL2EeQ
	WB1UaqKqr8n1Wv52ag0IFf9dmP2azkyjaK34Rj4U3LD3OJB6ZramBrv4vzxSZS1o2zAPaA
	cLp9ckPDccsc5txzbT1/a2e4esAhzQNM9FhIHX/vO/Z1ov/WJ5V9Af0rUZ42wOVThxyuH0
	EMDdFBo0xLbpof9HDqkRtUNbMh0G1UonHqZgd0dvh2c1VNpy0ejgFl/An1VCsA==
Date: Fri, 03 Oct 2025 18:52:03 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Paul Sajna" <sajattack@postmarketos.org>
Message-ID: <b9285a2e81ca992b9fc560c78ae03921000e388e@postmarketos.org>
TLS-Required: No
Subject: Re: [PATCH v3 07/11] arm64: dts: qcom: sdm845-lg-{common, judyln}:
 Add wifi node
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "David Heidelberg" <david@ixit.cz>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, "Amir Dahan"
 <system64fumo@protonmail.com>, "Christopher Brown"
 <crispybrown@gmail.com>
In-Reply-To: <gfbvgsen75w5h7afyo454pvdfslkeprqyuycuok6syinbza7vx@crapzdo33re7>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
 <20250928-judyln-dts-v3-7-b14cf9e9a928@postmarketos.org>
 <f58493a9-6def-4610-9c3e-d6a877dc23d3@oss.qualcomm.com>
 <d38801bc77ad00442b1669ea252ae30a5c6af5b4@postmarketos.org>
 <7661d9d9-eca3-4708-8162-960df0d7f6c7@oss.qualcomm.com>
 <ad721948b83a54eaa34f367e12564fe6acc222a1@postmarketos.org>
 <gfbvgsen75w5h7afyo454pvdfslkeprqyuycuok6syinbza7vx@crapzdo33re7>
X-Migadu-Flow: FLOW_OUT

October 3, 2025 at 5:13 PM, "Dmitry Baryshkov" <dmitry.baryshkov@oss.qual=
comm.com mailto:dmitry.baryshkov@oss.qualcomm.com?to=3D%22Dmitry%20Barysh=
kov%22%20%3Cdmitry.baryshkov%40oss.qualcomm.com%3E > wrote:



> Regarding the MDSS. Is it being solved by adding reset to the MDSS node=
?
> Or are there any other issues?

Yes I'm referring to the reset / pmdomain issue. Joel Selvaraj is looking=
 into it in the sdm845 tree. He said he tried doing what other SOCs did a=
nd it just got stuck in a reboot loop. More investigation required. Curre=
ntly he's reverted the pmdomain commits in our tree.

