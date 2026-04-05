Return-Path: <linux-arm-msm+bounces-101881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NlbAjC70mnGaAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 21:42:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCB739F8CD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 21:42:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD426302DB69
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2026 19:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46FB035B136;
	Sun,  5 Apr 2026 19:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rBPWEVR4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CD3359A9B;
	Sun,  5 Apr 2026 19:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775418039; cv=none; b=QvkLpZLe9qwut7MGduXxPTo8RW4VX6UXBmhJHt3Zt+q9Wq/q0+D/GjXyQ7EbCTNARnOeyziTMi9UAYSkcCCHth/QvI2fkuhplo93gv+XP4hm2je2uG35V1WpcGQkTjtS9CETX7F8IZok0rzk78M9qrtBCmfPL7pHRB5jt/31adQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775418039; c=relaxed/simple;
	bh=Hlw0LUTjviq/mklT94u7seOTsPycpw9Z44Gu+RWieZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cDgI5/xm45/4yhv2SUhsylCXszh3OXuUl6ienElZto//zwEa9xBwYh7AUW2X775qess5v81Zqa+1GKSDmkMl3v3a13Isc+7/YCmmjZRqK0s70gjPGwYnwAWtOR/YVDq90fgSePyou/+gyDw7pHhKcw+ktpYowi0dxp553eg+rKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rBPWEVR4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBB7EC19424;
	Sun,  5 Apr 2026 19:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775418039;
	bh=Hlw0LUTjviq/mklT94u7seOTsPycpw9Z44Gu+RWieZ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rBPWEVR4+m3eXVYmiPr1+lTnyy3+397qqAes+ZHihhEFWsulEd7GdvobZUtW25+1m
	 YYptG7hHjwzbufehSZ/Q8QPpbTSGdphJtr9iKwfWt2fxuhkFPCpFcwMlmm5fzb28Cj
	 51uWBqXhnf6PxUhlNL004iWaKa74zZr72htJzaYfhDAc6pQeuZkC+8dx5dV28gIPWS
	 u2TqldH8+FUPALH2hO/y3MfZcD7mpp3yxZxUAv/iGbw1pa0ztXo835gdQN+tEW5Cle
	 xAqPjrwQIvokm9PUPyaRpgvem/vGtfJRjvuFjE/Ote+BmNbFS+DK3LegtvM7DqVkDc
	 McEFKDafmm55g==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abel Vesa <abelvesa@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2] clk: qcom: gcc-x1e80100: Keep GCC USB QTB clock always ON
Date: Sun,  5 Apr 2026 14:40:18 -0500
Message-ID: <177541802161.2061229.3348847624269031060.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327-hamoa-usb-qtb-clk-always-on-v2-1-7d8a406e650f@oss.qualcomm.com>
References: <20260327-hamoa-usb-qtb-clk-always-on-v2-1-7d8a406e650f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101881-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5BCB739F8CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 27 Mar 2026 20:36:46 +0530, Jagadeesh Kona wrote:
> In Hamoa, SMMU invalidation requires the GCC_AGGRE_USB_NOC_AXI_CLK
> to be on for the USB QTB to be functional. This is currently
> explicitly enabled by the DWC3 glue driver, so an invalidation
> happening while the USB controller is suspended will fault.
> 
> Solve this by voting for the GCC MMU USB QTB clock.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: gcc-x1e80100: Keep GCC USB QTB clock always ON
      commit: 05566ebcc0cd170bd4f50c907ee3ed8e106251e3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

