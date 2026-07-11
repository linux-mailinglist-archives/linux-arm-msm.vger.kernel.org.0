Return-Path: <linux-arm-msm+bounces-118520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A6IAC7qeUmpRRgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 21:51:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF6E742BDE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 21:51:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="TMX327/V";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118520-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118520-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 376D1300D1F0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 19:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F1A433893D;
	Sat, 11 Jul 2026 19:50:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D933368BF;
	Sat, 11 Jul 2026 19:50:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783799409; cv=none; b=pi4tI4JbNjlBBxzGVkH+z38kGs+/ijqTZW8MMESMeTpp5G7Nq2/XFvDYp0S2tcfxvU9gLm/SuHNov/muULe6ePnxD2VGKgw8GZpHq4AW+gDWFe/P2ETMWRU+pHxmLTiGSnap4PVLTrUB0hvqJ44X5nxGyP5cFIYNP/QOtsWiT58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783799409; c=relaxed/simple;
	bh=sWRoGkivI19/9mqiyi+4GfECQ/0PVuZ3sjUrb7ueaqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qh9JHMQsyctgu8zp/F4oHrdEhLLZLlNIAUiWzOqD3Jd6imYcS2T+Qu+/KuuZEZUi1aiG6zR9K16jfHYJmSn4qqmzmmz/P/hknPt0BNTsn6yYawOqFwUIM/62gY7W7UKrT/UlIxs7tMrgKHE3LlvDACYbrRunyh28AjFej7dfeJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TMX327/V; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDB551F00ADB;
	Sat, 11 Jul 2026 19:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783799407;
	bh=wv6D8cyEArFQVvp5s9Mwg8netaicxSm14KRNIPLAUHg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TMX327/VKJDmVS5hHLs/pf65rTU8NB8pnZacUj9ZaHSqhrqAacrdb5OwZvqD+np6/
	 gHYLLF1LkDYwCL4hn2gdSS6S+RnMwL2cQ1iCuELS6AUyv+qw3d/935qT2Ff9ItMM77
	 DpFSHRiTXv0Tu6m5V6bSMy82pY/iY0mmImPma4hTHEB8kIikeof510+7j193JsqhDu
	 dJ3Re/Iw6iBxuZfBSOZANg4M3XuQ+U786uQYL5H5KCeJA1lP07K0Js2H+Rrm96cIW7
	 +0rhVxd/v0/a1rQHChgFA+Dy5B5krYCuPptSroN/mC5f5MCUWcJPTzey1mi7jBsJqc
	 uY3/TkhmFCN+Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] dt-bindings: clock: qcom: camcc and videocc improvements
Date: Sat, 11 Jul 2026 14:49:46 -0500
Message-ID: <178379938603.163099.11379673434084863598.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260708-dt-bindings-camcc-required-opps-v1-0-ae0871774210@oss.qualcomm.com>
References: <20260708-dt-bindings-camcc-required-opps-v1-0-ae0871774210@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118520-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vladimir.zapolskiy@linaro.org,m:quic_jkona@quicinc.com,m:taniya.das@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ECF6E742BDE


On Wed, 08 Jul 2026 11:48:38 +0200, Krzysztof Kozlowski wrote:
> Hardware needs certain levels on rails, thus document it.
> 
> Best regards,
> Krzysztof
> 

Applied, thanks!

[1/3] dt-bindings: clock: qcom,sm8450-camcc: Drop qcom,sc8280xp-camcc from "if" block
      commit: f54ac9a7096bc091813e3ef92021e1acf1e725a9
[2/3] dt-bindings: clock: qcom,sm8450-camcc: Require required-opps on SM8750
      commit: 9b9139d88c1a14535e8fd85e11e15ee3ccda48c9
[3/3] dt-bindings: clock: qcom,sm8450-video: Require required-opps on X1E80100
      commit: ecb42d97c8e143e8d9482e8d7019d06019cd961b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

