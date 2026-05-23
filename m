Return-Path: <linux-arm-msm+bounces-109442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2L8WOFIPEWq0gwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:22:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4125BC942
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:22:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4DD3630234DC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 02:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA8D2342C88;
	Sat, 23 May 2026 02:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WyJPKb/b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908EC330668;
	Sat, 23 May 2026 02:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779502818; cv=none; b=cyfZzXNdeAfZmnb4VelIiBnOgckOfAUePu5m1tmBro0vJPSM4wY9LHrLK0DQzPAgUdQvJkTrXqgyS/co0Qw+Ht9LJ6FYkUfO7J4K5EdRu3yeDzNRJroUtwpPn5hdgUu/fqCS6ssE+tGZloYdZOPek+9GhuS+Wj5JSAEwTRRAHGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779502818; c=relaxed/simple;
	bh=FjVq5aFYJiJeIVsPmOlnpBmEl7Q4ZGpxQMFjR1CHSes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XwwWhoAEhPL36EgM748uVvtP4Kl1bpVfSEk/EkASKe5H8qjpxlDbohP3S+YkPH6wxV+ytaDhO2S6s9CIZ3yH73wVEgFlx1LA2j+Z+fIiD9HVFSyD8t08h71H3VFip68frJ1ua/PUyZkNz+bU4zegOsg0F38Rb5sh6oK0GgGeKnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WyJPKb/b; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 183FF1F00A3A;
	Sat, 23 May 2026 02:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779502817;
	bh=5rpOI8X0sF78jTPksvrn5cpqMBg+ZvkcId9tD/CuWNw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WyJPKb/bujqUpfVGA9tshYe/kU8ZV/XhyLd30YFX2OcQdHMKpGRfEXyjaLICvRUxl
	 SipXutt/YJNhppaIjIuhD2wYV1HVWhd3bOQQPY9/AZd580gkPKDg3kExBWRHx+a0B8
	 8ZofJ6liloD5pzujqSVUqwVT2SOyHhiYJm5+w/U2VjvFQdZDbYdF3mH+TwXJAd3Z91
	 FIwe5ccH/Q/MOhtZEeyuLxemCH0+5b9XNHfgA+S3VEKPb7VwySqTgf6Li36U4UjT+x
	 BKneaFBDAS1QlAm89cnVFetSPQ4BVoMXI6+DVxW5EWBBFpGTIHgichTTRseUKEn0Wp
	 LaCv1tT1nvSbw==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: brgl@kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] clk: qcom: nord: add defines for the USB2 PHY reset
Date: Fri, 22 May 2026 21:19:46 -0500
Message-ID: <177950280345.1097700.6842260464124911528.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260518-nord-clk-usb2-phy-v2-0-17a86cb307c3@oss.qualcomm.com>
References: <20260518-nord-clk-usb2-phy-v2-0-17a86cb307c3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109442-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[15];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 5E4125BC942
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 18 May 2026 12:34:31 +0200, Bartosz Golaszewski wrote:
> Update the bindings and driver code with the definition for the USB2 PHY
> reset.
> 
> 

Applied, thanks!

[1/2] dt-bindings: clock: qcom: add the definition for the USB2 PHY reset
      commit: d62b0e3104cfd2171281867196cb1365098a25e0
[2/2] clk: qcom: nord: negcc: add support for the USB2 PHY reset
      commit: 9bee0a0a33e56122834a18e865fa83fdd2c99ebd

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

