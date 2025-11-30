Return-Path: <linux-arm-msm+bounces-83908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DD06CC95446
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Nov 2025 21:02:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A85304E0245
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Nov 2025 20:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AD5923A994;
	Sun, 30 Nov 2025 20:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ke4KROZZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BA81A2C0B;
	Sun, 30 Nov 2025 20:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764532922; cv=none; b=qHmEwsrwCy3XyNZTfObbnCvcugfwkVdybEX7b7QcMHprjiWm1H5kTz5kNAeLFZPlOr6FknJBnqyvMwsNlOM6cXy/Q5WKKFE+Inno1Ka64Zt2WgkAm+2OZI24+tyZJ7DrWV9wkyHCBASztvdKgZYCjGtXwfz13WRfgeNRD0fa5Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764532922; c=relaxed/simple;
	bh=GQeTafnOimj+SHBm4UuQqXcgzbjRJYkDWL0p2vAkIrQ=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=HYXQSC5ouKqdIZ663gd5nJmxfzIREt9naUmG2TvbZdLJ4Z9HGQLwr66gi2qWKqUCR01G6AdbLhWRz3uy4qy7QQIaYLxwliaVYLinwsGPT2MIOVAlYRhyjJ+w7j3OCYL05jn6p08i00WkLwKsuc0giy9hiM72g0KF76iPB7oyPgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ke4KROZZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DC3EC4CEF8;
	Sun, 30 Nov 2025 20:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764532921;
	bh=GQeTafnOimj+SHBm4UuQqXcgzbjRJYkDWL0p2vAkIrQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ke4KROZZUJGyqDTHZ7OXeybILhA2G3+aeruNIrHBMdP/SeLfraILK5dBkcJRqUeWY
	 yFtTz7mB39fbcZlZaZ95rN/ebw8mF4RtQK8vBlnci70PkpPC07VjpkmpF5PyVKp5m1
	 Yb8+m07Ji800a57LjPvJ4hV6mYd3x19sU4OZEAm3DgVwULTaUzNAD5gukq4zwR80YC
	 PH4GIrvH9ZVDnYI39aWw4HPX7JoSj1cJe5QcKpEOmlWEzpfe8S98+d4QaIjiP6C2Ns
	 Flubn06xCnc1MIi0ceXZh2u29n79ZO9nQatDaPmpUf6boP6od5ffJDAj3K/PcR0HUw
	 CIe956fqini3w==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251126173430.1556604-1-andersson@kernel.org>
References: <20251126173430.1556604-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock updates for v6.19
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Taniya Das <taniya.das@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Luo Jie <quic_luoj@quicinc.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Luca Weiss <luca.weiss@fairphone.com>, Jens Reidel <adrian@mainlining.org>, Alexey Minnekhanov <alexeymin@postmarketos.org>, Gabor Juhos <j4g8y7@gmail.com>, Nathan Chancellor <nathan@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date: Sun, 30 Nov 2025 12:01:59 -0800
Message-ID: <176453291936.11952.7135169229831586011@lazor>
User-Agent: alot/0.11

Quoting Bjorn Andersson (2025-11-26 09:34:30)
>=20
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df567=
87:
>=20
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-for-6.19
>=20
> for you to fetch changes up to 3664282f3345fdfa6a154feb6ed6c3217a8b3b0d:
>=20
>   clk: qcom: x1e80100-dispcc: Add USB4 router link resets (2025-11-18 16:=
11:37 -0600)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

drivers/clk/qcom/camcc-sm7150.c:1898:15: warning: symbol 'camcc_sm7150_hws'=
 was not declared. Should it be static?

