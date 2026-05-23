Return-Path: <linux-arm-msm+bounces-109446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALRdKr8QEWrDgwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:28:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 162EB5BCB0E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:28:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AEB643051C7E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 02:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF4D9363095;
	Sat, 23 May 2026 02:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kryPjsUE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67FF362120;
	Sat, 23 May 2026 02:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779502825; cv=none; b=U2Pfd/Wd3Tdz+mDeLhAhkmpwNB9CDpx8P83sXT06A5mZ75838kh2gjjQOkW5hHJyxmSnGtkv0FiNZE/MdSUt95NC8DQPXTETHrOkVz/YDMaxVFsnAq0PYWrJkUTm55hV7sWl+bXY7tnxGwK5t9efB/vtnf2zMQ8Be7Ct6iblYsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779502825; c=relaxed/simple;
	bh=CzmbEH+pW5vnOpCOT1ebrzWTGSzD6uNJqC0SZ9g9hBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z64ZD430ETKjVc6tUJ7t9Piee6HGWFPuJdrFpk7kDEBNl4pXrpFbdeqlMmQtKpQ3qEk4PL5cE16DI/dH/YqMP6M4YMyau0YlNv7T0TpqH4yxrjyuHGTW4QuX5QWZRW9RqKawcXAIwNEbCKI/eP4IBW3j0sfhCiMzoHqY/v9XLds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kryPjsUE; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E5261F00A3D;
	Sat, 23 May 2026 02:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779502823;
	bh=At1tPVBdUn704UorcE7jl6+0y0XvV1o1VY8w31bdwuE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kryPjsUEPyupvMb9G4PpfLBtJRLLj7MQv/c/feHv4U6B/6lu1A59xuavSGTgnxkCx
	 JNi8tJzeulmaxyBKM830Wz66jswpwThaM4wUU4CgffPD1l9LLCdlLHVQJjFr1Nlqo+
	 dzlm7uCOMMdIbCkpHFHfeu6pB1BsLJuX1BOb/DeSGhtKZJGqWcuqMmgCgmenE1vIpV
	 7eCD6U0kw94DLm5ndh5B8uKEV06nFox7luKpm+oZTzFGoKz1fu2l2iDrvfuBpDoD4Y
	 oNBQIv/6K8vp+r22FYNznG06KTdPDWBi6BJGTwWJz/QmB2brBY2YzaPJwDXB/8DPYe
	 KtKiWfsaflJzA==
From: Bjorn Andersson <andersson@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	cros-qcom-dts-watchers@chromium.org,
	Eric Biggers <ebiggers@google.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	David Wronek <davidwronek@gmail.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Melody Olvera <quic_molvera@quicinc.com>,
	Alexander Koskovich <akoskovich@pm.me>,
	Abel Vesa <abelvesa@kernel.org>,
	Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: Brian Masney <bmasney@redhat.com>,
	Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
	Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: (subset) [PATCH v5 00/13] Add explicit clock vote and enable power-domain for QCOM-ICE
Date: Fri, 22 May 2026 21:19:51 -0500
Message-ID: <177950280331.1097700.1459459079681986298.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com>
References: <20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109446-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[33];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 162EB5BCB0E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Thu, 16 Apr 2026 17:29:17 +0530, Harshal Dev wrote:
> When the kernel is booted without the 'clk_ignore_unused' and
> 'pd_ignore_unused' command‑line flags, votes for unused clocks and power
> domains are dropped by the kernel post late_init and deferred probe
> timeout. Depending on the relative timing between the ICE probe and the
> kernel disabling the unused clocks and power domains occasional unclocked
> register accesses or 'stuck' clocks are observed during QCOM‑ICE probe.
> When the 'iface' clock is not voted on, unclocked register access would
> be observed. On the other hand, if the associated power-domain for ICE
> is not enabled, a 'stuck' clock is observed.
> 
> [...]

Applied, thanks!

[03/13] arm64: dts: qcom: kaanapali: Add power-domain and iface clk for ice node
        commit: 11b48f6d5ed505ced9cd3645d6615279198a7a54
[04/13] arm64: dts: qcom: lemans: Add power-domain and iface clk for ice node
        commit: 04566e287b35fde9fd129db5fdf6a96e336af55c
[05/13] arm64: dts: qcom: monaco: Add power-domain and iface clk for ice node
        commit: 68d5d9701a7ab1b1f9c76feaa3a24ca716f03f0b
[06/13] arm64: dts: qcom: sc7180: Add power-domain and iface clk for ice node
        commit: 7cd7271ac525e4eadd22734f418219f247638f43
[07/13] arm64: dts: qcom: kodiak: Add power-domain and iface clk for ice node
        commit: cca53c338ad87edc4b46d2d82730fd8ca01a164f
[08/13] arm64: dts: qcom: sm8450: Add power-domain and iface clk for ice node
        commit: 3a5cb1ccbfb3141862b28f24cd5050083233aae7
[09/13] arm64: dts: qcom: sm8550: Add power-domain and iface clk for ice node
        commit: 52696dbbe7bbe0c8fc8c17133ffb5133b8cf37a6
[10/13] arm64: dts: qcom: sm8650: Add power-domain and iface clk for ice node
        commit: c62b084d5d1564f808408a2f7d4c514e57cd4106
[11/13] arm64: dts: qcom: sm8750: Add power-domain and iface clk for ice node
        commit: 081ac792f0ea6d27a4b130c70cfd7544efee8137

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

