Return-Path: <linux-arm-msm+bounces-118523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T8VYF0CfUmqbRgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 21:53:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A142742C3B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 21:53:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=cfB7H5Bj;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118523-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118523-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E1BBF3022458
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 19:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E734033F5AA;
	Sat, 11 Jul 2026 19:50:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C504D33D4E9;
	Sat, 11 Jul 2026 19:50:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783799411; cv=none; b=qdEsuayCoJtjVUVO2vOcY8VdF3+N+ue3d6YYIjaPEviXLw+q6UQUe66QApKzpqGiaMJMOrhAz5nxlzv9NvQW+oJC5Joj28ct7klDZDsaO+I3bN/rrtAwOiviozAHkMBA9OQAGwvCnpTNqHeObs8YbWZmSwemC3qr6Ri5X82ne/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783799411; c=relaxed/simple;
	bh=8oQPQVnJddvgmOir/IrpLUhyHF0QPl0JQlg07XxVGvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iYNHRnKbzUoywfeZw6UBtcSoAOBr5iLl35FJw92uCL9SHs8pikHw97OFCIC65kflFyKdm5rvnaIGcOlvrd7+2lBygBwNZNA1Zc51ajZRibhT1wATUp2ENYr2+20I6DsilsjGaEqOuCHvLjyqfL87LdIL1EkQtJ1vu5RGhM9B/Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cfB7H5Bj; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D26801F00ADB;
	Sat, 11 Jul 2026 19:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783799410;
	bh=7QZ/DIqU84BpOcq/4tStsXRPrlGDQUvWWKu/RTg2ny4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cfB7H5BjLQ//Pxhhpawawnnnex8VxlFR2JxmfpnMIHUgx6cZnishvpBeQajvYUi8h
	 2GW73lGq1Pj8Q+L3aQKND02oplWd1KElItixJEEQlF2Z6DGxg0qlOAq/mAz5oM7hxD
	 CwT+TNvc+2WBRLAF4yU9BBFlWvBJhNJ1rpk+BZARUvtIDoVZFOK/qgJohnBbCtEzR2
	 6yRJeJgTN/ktMSxErFPXUGlr/PDbuuWl0Q13b0xZTTrqVZ14oq1/YSx8dDhFB/vRmy
	 KNGqrdClrFatRx9cOCG4GA7GUlTm07mC12ibm2ZO6ZSKT6563ItraaDDMoGzY1bKGn
	 9j0iHBxpyB8fw==
From: Bjorn Andersson <andersson@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Martino Facchin <m.facchin@arduino.cc>
Subject: Re: (subset) [PATCH v2 0/3] Add INA232 power monitor support for Arduino VENTUNO Q
Date: Sat, 11 Jul 2026 14:49:49 -0500
Message-ID: <178379938622.163099.151146029185011959.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260611-monza-ina232-v2-0-e4375ce652d0@oss.qualcomm.com>
References: <20260611-monza-ina232-v2-0-e4375ce652d0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118523-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:krzk@kernel.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:m.facchin@arduino.cc,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4A142742C3B


On Thu, 11 Jun 2026 16:05:23 +0200, Loic Poulain wrote:
> Add support for the TI INA232 current/power monitor to the ina2xx
> hwmon driver, and enable it on the Arduino Monza board.
> 
> The INA232 is a bidirectional current/power monitor that shares the
> same I2C register layout as the INA226, but has different electrical
> characteristics.
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: qcom: monaco-arduino-monza: add ina232 power sensor
      commit: d1a0ecc10621e8daa1ecb3feaf4747224e71d61c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

