Return-Path: <linux-arm-msm+bounces-100835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJHXI8Ggymmx+gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:11:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DD535E7ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:11:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F5BD301F33E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6341379EE1;
	Mon, 30 Mar 2026 16:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UBzphakb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92ECE378814;
	Mon, 30 Mar 2026 16:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886516; cv=none; b=iC17+lOg9s+R8F5UU1Ul+62E2CsKf5OLaoZghlhWoOK22PsGJ1XNiULy6jVA/QZd+epYj4DY7L6WTFHWLVrYB1bqhvY+LZdqmFt/5CLUZ3scnnPRX+laqDFPE+w0xRc8Ldu3MyrKA+jeAyK1xdQdaGnypcMaBkMMrb+8Pej4k+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886516; c=relaxed/simple;
	bh=AbCbN2HNtIUC+vs6VbI+ViYZBM6w+8QVXUAVP4TdkAo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mkRc7nnBztPgdEDl8F9axATFaKk/+7FNWx/mawPniWLulEXMj8m9XzcNrNb3ve9cGAD/yPB0TqfhLNbpkoeA9/G/87E2h7lxX5DVn877szZlJXAGLgq+NVAQaJP1pEqfD2wJwYKj1mOzF+KD46M2vi5wPg0kYzR/x3fXioBtUF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UBzphakb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8763C2BCB3;
	Mon, 30 Mar 2026 16:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774886516;
	bh=AbCbN2HNtIUC+vs6VbI+ViYZBM6w+8QVXUAVP4TdkAo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UBzphakbh1vNohf61I9KzKPT2bzoGQ2kBRtwG/CR3MBILF4B+X0WRT2CjpujqnPDI
	 F8JfWvJfHx58BJlt5/IpXQbdUJKj00CONw353H2QWKd7MFMtoCM71NYN3wu6c5fifI
	 AlKuB884gebvu65k/LGI4Z9UpRp4rJCN2E7G94G5F3R27itQLcAjB7j81Kktv1KYmN
	 JscyYMWaIoVx4v1+rb9a5R1yY7jZ+9rFByqdi4XK5pE6QQTnJhlcirG03HhOoN5S8+
	 CfSNF9tJTuQ4Z/qz1P6QJH6vusQnhyRNNHXNd8yyC289MIMZ6L7NGdWZozknPMUNL6
	 DgIUM9dEvbK6g==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Heidelberg <david@ixit.cz>
Cc: Paul Sajna <sajattack@postmarketos.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 0/2] sdm845: describe the Wi-Fi hardware properly
Date: Mon, 30 Mar 2026 11:01:16 -0500
Message-ID: <177488647763.633011.11795865171145683746.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327-wcn3990-pwrctl-sdm845-v1-0-3f5c34e3fdd0@ixit.cz>
References: <20260327-wcn3990-pwrctl-sdm845-v1-0-3f5c34e3fdd0@ixit.cz>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100835-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 10DD535E7ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 27 Mar 2026 14:07:07 +0100, David Heidelberg wrote:
> Question here is, if the most of the wcn3990-pmu shouldn't rather go to
> sdm845.dtsi? At least the regulators seems to be same.
> 
> When agreed, I'll sent include all other sdm845 phones in the patchset.
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: sdm845-google: Describe Wi-Fi/BT properly
      commit: 0a9c8715663998dc4d8eaa8f1a40440214906d96
[2/2] arm64: dts: qcom: sdm845-oneplus: Describe Wi-Fi/BT properly
      commit: 7a4790b1a2c9ff66bd7a95d8761d5e9fc9334ba9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

