Return-Path: <linux-arm-msm+bounces-7655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BA283338A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jan 2024 11:10:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 14276B2177D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jan 2024 10:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D7ED5381;
	Sat, 20 Jan 2024 10:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="Ne8hUva9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-40140.protonmail.ch (mail-40140.protonmail.ch [185.70.40.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2110ADF46
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Jan 2024 10:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705745415; cv=none; b=L1zuKyJZpaEMCiAGxffk8cklbuUw7aILS0Y5/Q9eQuEld+dCBkrIycL57gxYLgYpXuIZI3fpjkcC/lNq+2huIh1cKN2NTjNLQtbsdIcXz3p3uZ60ijcp7g56hS0xCfGj5gYh70GqbXYm9V2XS3vb3N//7MHrFPAvBbUDljwVJOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705745415; c=relaxed/simple;
	bh=4HJ80jjTnWwlgKftFCZ5a709J5SkKOSI4e8M6loxfQE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F0IwZISVmxqgqEoLbGCFvyKKO/WOC2sy4ssfbcM73se/+m6gh1Mib9aLFYtCAsuapCBmSc80eE6huiI5B96vyeq/5lbOIJ4pro9LMCeYzxZFQXbOO2LG+Pvg/8blaSrYMPmX+07/xR6ep+JICimPsl8oWcpVIlwot4ZgjbZOR08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=Ne8hUva9; arc=none smtp.client-ip=185.70.40.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1705745405; x=1706004605;
	bh=4HJ80jjTnWwlgKftFCZ5a709J5SkKOSI4e8M6loxfQE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Ne8hUva9s30xo0vJPMdi1qCD6dl9veXKq8Oac84P3Locnoe/yEYyx133nWEyVvtP1
	 M8aWll5ePA21Ad+M0IctEuK3xnof8q12i4qildjXvjvIWiBUv1zgkIJMPagpRs0Dxw
	 LfoPVVQ+I1DDIFbIR1MW+/jAewKM3GrFeAf8Me327n+eZd7Et++wtNLArBocmE+oXR
	 PTvqNVdKGFuEpiiKYn9S1saXhGwDXVJEd/Jg/yQ29LJ6U4t9FppE3ftVRG7mHoGG69
	 C14WM+1Um0PJX37wbAEWspAGQE91R415LAuie0LRUsnSS2VBUouZ7vE38fsNm7C6wQ
	 WbGdbDqTUAYSw==
Date: Sat, 20 Jan 2024 10:09:52 +0000
To: raymondhackley@protonmail.com
From: Raymond Hackley <raymondhackley@protonmail.com>
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, konrad.dybcio@linaro.org, krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, nikita@trvn.ru, robh+dt@kernel.org, stephan@gerhold.net, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v3 0/3] arm64: dts: qcom: msm8916-samsung-fortuna: Add initial device trees
Message-ID: <20240120100943.13716-1-raymondhackley@protonmail.com>
In-Reply-To: <20240120095715.13689-1-raymondhackley@protonmail.com>
References: <20240120095715.13689-1-raymondhackley@protonmail.com>
Feedback-ID: 49437091:user:proton
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Sorry for confusing in the title of the cover letter. There are only
2 patches in v3.

Regards,
Raymond


