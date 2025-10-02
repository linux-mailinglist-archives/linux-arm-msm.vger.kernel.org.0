Return-Path: <linux-arm-msm+bounces-75773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF64BB27D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 06:51:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56FBD1C6016
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 04:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC33A1DE8BB;
	Thu,  2 Oct 2025 04:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="cBY64rBY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D764E28FD
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Oct 2025 04:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759380694; cv=none; b=kXqWyf/AZNvbK9pCBVPReHsd2QYuX4mrV9WfF/uJvMuwq4r6wprafl+rCQs6msqNnSOh+1l63iRa/dR0CgCRAFgDDyMgY2wt2TMa61aYT73EQjlo0XtrjhkFkd+oBA4quJIC0m0FH7VxSAmZ3Vj8gp6aRfFMVt3akqYXNQHKZT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759380694; c=relaxed/simple;
	bh=1CQgP5aMSWGhhSH5fFiqTiW/Li/sgKPVb/u09erF5kA=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=XJUnZNuROUSFqdA8V8sklJf9g6JZPWhV52zA9wH0DnCxQydL2NpaZ95NRIg4Uaso2tcidOsWr8EHlMPhVYVfjD1QqDLlw51d4wQuKJUI5a7t3zchBzIrDvqf8wlExgVuI5LLcyPZQaQ0WbpZrEdyeorCvcTCN4wrP90zaY7pKk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=cBY64rBY; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1759380687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1CQgP5aMSWGhhSH5fFiqTiW/Li/sgKPVb/u09erF5kA=;
	b=cBY64rBYLqzVDsC8+pK5mPeL18/ES0QKRnCkrbpBTYYaXRxc5jShNoTK6KeqCwYXwInrdG
	TIh3v2Ps4PnJj8CnhG50qagVIcwMIOIKv5GOjMlpp8mVC49Mc22CnqDDXa0y8lpvx7octe
	nmFQa8ejeS8tx397/3d0VKh6qRNLk082C3OdNqY5pfQycH3wbsRcDWgzZm5ynBiA5Deyaw
	c0/wRv7ygb+FPo7voerrDKzGg9K2CVh7r5xsGhKNYc5BQMtxt3qgcLqm0iP/5sscXN9iET
	nnatLZxVxhokKmqMtqjduMLBFZ1ks4ntBAG432nNRKyJlHeblscIuXj9S0mvJw==
Date: Thu, 02 Oct 2025 04:51:22 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Paul Sajna" <sajattack@postmarketos.org>
Message-ID: <d38801bc77ad00442b1669ea252ae30a5c6af5b4@postmarketos.org>
TLS-Required: No
Subject: Re: [PATCH v3 07/11] arm64: dts: qcom: sdm845-lg-{common, judyln}:
 Add wifi node
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "David Heidelberg" <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, "Amir Dahan"
 <system64fumo@protonmail.com>, "Christopher Brown"
 <crispybrown@gmail.com>
In-Reply-To: <f58493a9-6def-4610-9c3e-d6a877dc23d3@oss.qualcomm.com>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
 <20250928-judyln-dts-v3-7-b14cf9e9a928@postmarketos.org>
 <f58493a9-6def-4610-9c3e-d6a877dc23d3@oss.qualcomm.com>
X-Migadu-Flow: FLOW_OUT

October 1, 2025 at 9:14 AM, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.c=
om mailto:konrad.dybcio@oss.qualcomm.com?to=3D%22Konrad%20Dybcio%22%20%3C=
konrad.dybcio%40oss.qualcomm.com%3E > wrote


>=20
>=20As the dt-checker points out, there is no such property
>=20
>=20If your wi-fi works regardless of that, you probably don't need
> to set the one you intended to
>=20
>=20Konrad
>

Perhaps this only exists in the postmarketos tree, but it definitely exis=
ts, and doesn't work without it. I'll remove it for upstreaming for now b=
ut hopefully someone sorts that out. upstream.

