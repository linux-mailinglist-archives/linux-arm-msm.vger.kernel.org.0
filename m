Return-Path: <linux-arm-msm+bounces-30949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D0A96DBF6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 16:37:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 430911F298D0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 14:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6B1717557;
	Thu,  5 Sep 2024 14:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="zQvz90zW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF56817C69;
	Thu,  5 Sep 2024 14:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725547021; cv=none; b=MEwRyQTeygDblTCk394DooOKNNZw+lAI+0JL+bLwAeCsSG5ITvXD/46B4CUN+7C8/dNuX7QH4dI7KSWI4kP7NP99VFLEFRHr3CiD5lUIcD/eyzIUfdyd1bCCYkHcP+b6mJ6JWOS//B/roPmkC7rRK33qmFcCpnFSL6eJ9Ua3ShQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725547021; c=relaxed/simple;
	bh=3jMXTiNdWHZiQ7dXI7nYaFZUC0owo1rFk1Gy77YaZK0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=ZE7KpGIFKTIdqM28GKSoa4juBAnV+BBbkUKmPlOGN2gyMOZ7uxz5p1g7MeeOWGXQBY4//EU9ZQGJN1Gv9jSB4fxH1nYNduFl+qJUEwuf9LlV8T8evLzgctLk5/TtWgLdDK77OXEPIE8v0VY3+r4045A+v/BVt2WGDJ2H4i4Gfrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=zQvz90zW; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1725546412; bh=3jMXTiNdWHZiQ7dXI7nYaFZUC0owo1rFk1Gy77YaZK0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References;
	b=zQvz90zWQ8dwrhEe4N+FvPh/rADHV9771Wz97P2S6JCub0LzV62lWnBkLIkoxdbnn
	 EHJfVcZtpoSh4mVQjZvOerP4DVoVjTaoqRkCpyODbi7UJvM//y2AkTp/NKKvwcWDr2
	 9hcdUdv67/HEKV2p66CL/oBHKNf5o/lraNm8A3dE=
Date: Thu, 05 Sep 2024 16:26:49 +0200
From: Luca Weiss <luca@lucaweiss.eu>
To: Konrad Dybcio <konradybcio@kernel.org>,
 Fabien Parent <fabien.parent@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_arm64=3A_dts=3A_qcom=3A_msm89?=
 =?US-ASCII?Q?39=3A_revert_use_of_APCS_mbox_for_RPM?=
In-Reply-To: <2a15105f-67e2-42f6-b624-562485b0bee2@kernel.org>
References: <20240904-msm8939-rpm-apcs-fix-v1-1-b608e7e48fe1@linaro.org> <2a15105f-67e2-42f6-b624-562485b0bee2@kernel.org>
Message-ID: <46D2A6F9-B524-47A3-A61E-5DA910F3A957@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

FWIW msm8226 has a similar problem but there it is enough to provide <&xo_b=
oard> instead of the equivalent &rpmcc reference to gcc, which is what was =
done in a recent patch for msm8226=2Edtsi=2E

But in the end clk and mailbox drivers should probably be split so that th=
is dependency cycle can be broken=2E But I haven't looked into this further=
 yet=2E

Regards
Luca

Konrad Dybcio <konradybcio@kernel=2Eorg> schreef op 5 september 2024 14:38=
:53 CEST:
>On 4=2E09=2E2024 8:26 PM, Fabien Parent wrote:
>> Commit 22e4e43484c4 ("arm64: dts: qcom: msm8939: Use mboxes
>> properties for APCS") broke the boot on msm8939 platforms=2E
>>=20
>> The issue comes from the SMD driver failing to request the mbox
>> channel because of circular dependencies:
>> 	1=2E rpm -> apcs1_mbox -> rpmcc (RPM_SMD_XO_CLK_SRC) -> rpm=2E
>> 	2=2E rpm -> apcs1_mbox -> gcc -> rpmcc (RPM_SMD_XO_CLK_SRC) -> rpm
>> 	3=2E rpm -> apcs1_mbox -> apcs2 -> gcc -> rpmcc (RPM_SMD_XO_CLK_SRC) -=
> rpm
>>=20
>> To fix this issue let's switch back to using the deprecated
>> qcom,ipc property for the RPM node=2E
>>=20
>> Fixes: 22e4e43484c4 ("arm64: dts: qcom: msm8939: Use mboxes properties =
for APCS")
>> Signed-off-by: Fabien Parent <fabien=2Eparent@linaro=2Eorg>
>> ---
>
>This is fine as a stopgap solution, Bjorn can we push it in -fixes?
>
>This platform is admittedly not of top importance=2E=2E but fixing this
>eventually would be nice
>
>#regzbot introduced: 22e4e43484c4
>
>Konrad

