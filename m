Return-Path: <linux-arm-msm+bounces-107190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHTrL1uOA2pN7AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:32:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC015293CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:32:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D8FA314A169
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 20:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 555B53CF68C;
	Tue, 12 May 2026 20:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j1QfeG99"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F05C3C09FF;
	Tue, 12 May 2026 20:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617426; cv=none; b=BfPb3faPcynuC24JW81SsYLMPL9H9TNcNfVmStG4uwi+adYaHeKKeAB69F+Xnbgutbqo4ECMmWuqhpyUddLJSKmwgyf8dHFM0RbcBWwO3SQ3yCecRDTsFZI+WBA1MTR4J4Jqh8WpRt99nynZCoxZO3KvbejiOl6gza44IqHpZOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617426; c=relaxed/simple;
	bh=D319QEG+olVaUvJn93cenq9kEFlVZX56VtrvxaCnlDs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tZQf4QL/w9Wa1Q0nw+gmObtGUPAKKBPuOF2U/efX2qVwpiWmFyVSJz66JbOXjPh1dK5c26qRRCsNhjUOMZ/lWM3q9FwAj5gjxmhCpf90yc/QnS2SWa0Q13tRT0XILyXgmrEIQ22aUqdWiyM3L1k8odq5dShhQAE9hy9FB9m9An8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j1QfeG99; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B425C2BCB0;
	Tue, 12 May 2026 20:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778617426;
	bh=D319QEG+olVaUvJn93cenq9kEFlVZX56VtrvxaCnlDs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=j1QfeG99PlT4WQ0KANtZb5sUmtq3MxbYHyFRb+AVRzq2d09V99qtV+dNC2iv9hDnb
	 oYp0uyqknkeiASOTgZsYn8IHrn+Rliu9atx5OmTFD6xja6kw3U2aKm1mszW8uqcOco
	 ikU72XL4HTXRNfhKkYkc+MGzXlVCsKfSK6+rm1unhQzPjBhpTV7LgMlhxM3ybNyx6b
	 ihWPS2AUPbtNYo5HuhHLa5nhYno7essVO6ZH8HOWP0rVzMgx38TPCYUmRDlcv2VFzv
	 lsK4WkUGhQ/VHXlVh5S/6QquBpOHqehndhrgYuf7UivIsnRxIuG35EANSrF0r4sL8h
	 qK+mj9y8Ef0OA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: clock: qcom,kaanapali-gxclkctl: Correctly use additionalProperties
Date: Tue, 12 May 2026 15:22:57 -0500
Message-ID: <177861739392.1242344.16530268271307335667.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260404105436.138110-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260404105436.138110-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6DC015293CC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107190-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Sat, 04 Apr 2026 12:54:37 +0200, Krzysztof Kozlowski wrote:
> The binding does not reference any other schema, thus should use
> "additionalProperties: false" to disallow any undocumented properties.
> 
> 

Applied, thanks!

[1/1] dt-bindings: clock: qcom,kaanapali-gxclkctl: Correctly use additionalProperties
      commit: 3357509593d2d7b1aa04bd2cf188477df7af447b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

