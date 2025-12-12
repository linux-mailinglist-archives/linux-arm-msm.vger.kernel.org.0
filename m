Return-Path: <linux-arm-msm+bounces-85093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A8405CB792D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Dec 2025 02:48:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C008F301F25F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Dec 2025 01:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51020212542;
	Fri, 12 Dec 2025 01:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b="gEYeossp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-10625.protonmail.ch (mail-10625.protonmail.ch [79.135.106.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18A71CD15;
	Fri, 12 Dec 2025 01:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765503963; cv=none; b=o3X1OJ/gesB/8l/dRtEKgno1WqrKM6YA1pjIehsuDCVK/anLvh2vLj0zQCk/PZ924Dsv2IE2E3GIpZhrat2aHskgEgmihrYMuhfbjLeTdCcQxeafyQZG9EyIDL066lsnCbA5766Cfp3JxiO27xkSdd5Il88rvQ/X1p/K0/+aFvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765503963; c=relaxed/simple;
	bh=InMO6pnEBjCfOXZazRrMTr+pDArq4FjExoqAg+8HQ4I=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aGUt0/kYK1tdea9O3yTmM+PduIlvyWWYJUXW4GLBIkoZ3QbPPcHrkmU5eLy7dC/pAOqxcGjJeGQ4rR+/V7rXJK74Y4AwsAleG1zPkBcQTELadG8EfUdISAtAHufKmAMXab1zdX7Awa4l/w3+2nDLW8nPzIeS9622M0nSq7LI+/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie; spf=pass smtp.mailfrom=nxsw.ie; dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b=gEYeossp; arc=none smtp.client-ip=79.135.106.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxsw.ie
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail3; t=1765503957; x=1765763157;
	bh=xhgUvVCy4gPJIOWglUXBQSh4o7xlyoMQxTXXo8XPXeY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=gEYeosspAiw3ILVrR0x85Y2FNY75yRCieCHRX7SsxCBTcmdPdPostYAb5lEzeTFrV
	 lCA8CBhOlSjZ9Eaq+PtLUZ3XWuCASLFEt9fVu+I9PsvPxf8+Dji6srJeuJmoUJySWe
	 2+1cSnwShceZyufeesHCmszHdxdvKFP/mV8UbSlVGs5kzZIDzbVT718I3aF2s8oJ4O
	 MIoii7l5yGkTc54K8hDiGZvJROs9EroQ2K0sqrLgRLvzpLifYR+a5VeJwj1VoxeQwd
	 DpQFN6VhA59ZzMR2hpJnXaYwZeQde2bQuTYIYn4MLQr5KHtB0xjhmvwxOMFm9Cn/6A
	 315oL3lwWaBIQ==
Date: Fri, 12 Dec 2025 01:45:52 +0000
To: Richard Acayan <mailingradian@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-media@vger.kernel.org, Robert Mader <robert.mader@collabora.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: sdm670-google-sargo: add imx355 front camera
Message-ID: <2fff55c6-aea5-4019-bcb9-eaff3b44474e@nxsw.ie>
In-Reply-To: <aTtkwQb2gOeWAFuv@rdacayan>
References: <20251211014846.16602-1-mailingradian@gmail.com> <20251211014846.16602-6-mailingradian@gmail.com> <wwpqaecvz42jopgaboasbh353ieelctpvgo3yj6y5tnxoem5oz@j5sbx3yxntot> <aTtkwQb2gOeWAFuv@rdacayan>
Feedback-ID: 136405006:user:proton
X-Pm-Message-ID: 35b0511de7759413e883358851a4f31971ef1dee
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/12/2025 00:41, Richard Acayan wrote:
>> This would be much better:
>>
>>    &camss_endpoint1: {
>>        clock-lanes, data-lanes, remote-endpoint here
>>    };
> I'm not sure what you mean, there might be some typo.

At least for me the endpoint name could be improved see:

Take arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts

Also since you likely have more than one sensor I'd suggest endpoint@0

---
bod


