Return-Path: <linux-arm-msm+bounces-74127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1589B87FC5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 08:23:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B2A7524389
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 06:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75EBC29B8DB;
	Fri, 19 Sep 2025 06:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=joelselvaraj.com header.i=@joelselvaraj.com header.b="bi8hXDyK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9DB2459CF;
	Fri, 19 Sep 2025 06:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758263023; cv=none; b=UoAb8YhEeqbO/Ol4hd5cRZCTmvsi5lX6FFI3iUbr0FBL+6oOUxjeUD3q1k5wlqfaGymiPRwaJR2OA+gUoJ/zZlKRWLFTXMp12cGsfCqyGmTzPM6NVEGl0AoTBAKkVd7neFmhkuZ0B/q8y1chzhr+Hvzpu5hDdDtkw2LJKkQW4fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758263023; c=relaxed/simple;
	bh=TwTAQuVXEVFkFYrWORbRUDwY2Q1yghMmulafj99jWqQ=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qyGsKdVDdQussSX1oIAOv4DiUUd4XrbqbUDyUwzLZu1Apjhm4P60r9kKO8z6rLRaATv6l6TCcOwiFX+oYJrB3bEvaWfAgP+QTxAyKvuGPKFY53UVU9/wPXiDxA1rvVGvb87zsonQTWhNMI+9UiYUjBuC+bAh67Ewo1gbrJTVCkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=joelselvaraj.com; spf=pass smtp.mailfrom=joelselvaraj.com; dkim=pass (2048-bit key) header.d=joelselvaraj.com header.i=@joelselvaraj.com header.b=bi8hXDyK; arc=none smtp.client-ip=185.70.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=joelselvaraj.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=joelselvaraj.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=joelselvaraj.com;
	s=protonmail3; t=1758263011; x=1758522211;
	bh=TwTAQuVXEVFkFYrWORbRUDwY2Q1yghMmulafj99jWqQ=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=bi8hXDyK0GM08LRJkiq4f+GgcqIKFhIZ1zB3PB3srfy8Nu+sJ8twpHgby5eJ2ALEP
	 Hy3XhD7ffPuVQ1QCQPTKHNjSLA7TBNqaQnG90T1WtdPiZsjYj13X4d1Gc7z99sE7W6
	 WN/WxkJzBUAJWznffB/qlvKixN2GeyEKILz+l+uc38PZK7njorVIdCDG/xOjhStykz
	 t0vWNjOm5QVZjyLPp0K1JpSZGvCtMkDHfSL3bFfYr+RzmgMlKIcu8ierVAWZp4Bwqy
	 UsQ1/A0BWkgZKwRvWKL2WBM/fza1ZULvhrlzQdPFqwQOPChQjfri97F772vhc0JeyN
	 Q/gw1qodT8k3w==
Date: Fri, 19 Sep 2025 06:23:27 +0000
To: Luca Weiss <luca.weiss@fairphone.com>, Tamura Dai <kirinode0@gmail.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Selvaraj <joelselvaraj.oss@gmail.com>
From: Joel Selvaraj <foss@joelselvaraj.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845-shift-axolotl: Fix typo of compatible
Message-ID: <4ae418ec-5b84-40b5-b47f-ee2e988d7e99@joelselvaraj.com>
Feedback-ID: 113812696:user:proton
X-Pm-Message-ID: a1f1f07e497b6e915e4c4d63abc28e3b412d0101
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Luca Weiss and Tamura Dai,

On 9/12/25 02:24, Luca Weiss wrote:
> Hi Tamura,
>=20
> On Fri Sep 12, 2025 at 9:01 AM CEST, Tamura Dai wrote:
>> The bug is a typo in the compatible string for the touchscreen node.
>> According to Documentation/devicetree/bindings/input/touchscreen/edt-ft5=
x06.yaml,
>> the correct compatible is "focaltech,ft8719", but the device tree used
>> "focaltech,fts8719".
>=20
> +Joel
>=20
> I don't think this patch is really correct, in the sdm845-mainline fork
> there's a different commit which has some more changes to make the
> touchscreen work:
>=20
> https://gitlab.com/sdm845-mainline/linux/-/commit/2ca76ac2e046158814b043f=
d4e37949014930d70

Yes, this patch is not correct. My commit from the gitlab repo is the=20
correct one. But I personally don't have the shiftmq6 device to smoke=20
test before sending the patch. That's why I was hesitant to send it=20
upstream. I have now requested someone to confirm if the touchscreen=20
works with my gitlab commit. If if its all good, I will send the correct=20
patch later.

Regards,
Joel


