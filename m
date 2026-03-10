Return-Path: <linux-arm-msm+bounces-96440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEAOBT2Gr2lvaAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:47:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 474F52445CD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:47:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 076FB301CEFB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 02:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CC3E3A9D9B;
	Tue, 10 Mar 2026 02:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dRoG13QS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0957C1A9F96;
	Tue, 10 Mar 2026 02:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773110811; cv=none; b=YRTxWqOETATmtT2iqja2+8Par6wBT6Lfmib+7KcvxSKE6L8Q1mFSlqsPduq0BF4M6lCpnYshomFZI48I/JcRjGJzGIRh8Xg4LOTE/KZiB5njMwOJrBoFygajxRynY+kdEqTiWMGJyK1NDPbL3tmO+crW9pbRlwtuqZDXAhzNfIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773110811; c=relaxed/simple;
	bh=a92MzXAdMXyO4XbztfoZrxrlzO72ORS4fRIXFICSvUc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F/g7B3I7RCiSldpAP8c7EJDWe7bBgBBXaczrKzb7tGIltiKpgt7e0Znyafk7KZNXe2k99bmDkrNZYyxfUwsOFAM97InS4cZ9GBQDMUcXyV1qVPOD2sxkiVrMehSokllO8umW8Af+tjhBxZdHj+9tV81oKZhhSr6Q33qMfQQt5B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dRoG13QS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4596AC19423;
	Tue, 10 Mar 2026 02:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773110810;
	bh=a92MzXAdMXyO4XbztfoZrxrlzO72ORS4fRIXFICSvUc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dRoG13QSLxMvEsKpV8fyP2fCKu7evI4e8J95iZat1Gyp2iZDUP6mcgHFp5lLYsnzi
	 UyBPThuh2MIj8Jzx6O+XiHvJM4v/VdTZAwieV58qudWt9lNEBVsOQEMQZLlsICoHSr
	 kc7efoH3GZLf15wtOaivUuw2Z5qLmSTKkSR+CqplgXhA+fQ7dvZMKlpqcNyRuQPJu0
	 L5nx+y/xORFQqe8mg7Y51UEaVqQIc+IRhpRb89ZJvogre/4mwOUo/+oCnKP5KDRaC9
	 wO1Q/1W3Cth5mPJ5MAIWVRFXMqLyLAGxTiMjx15+Ha2I9Wb2ROczyCglk3k22IltWK
	 tD9u975EYNGeQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Janaki Ramaiah Thota <janaki.thota@oss.qualcomm.com>
Cc: quic_mohamull@quicinc.com,
	quic_hbandi@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: qcom: qcm6490-idp: add and enable BT node
Date: Mon,  9 Mar 2026 21:45:29 -0500
Message-ID: <177311073322.23763.11856988225421793675.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203071807.764036-1-janaki.thota@oss.qualcomm.com>
References: <20260203071807.764036-1-janaki.thota@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 474F52445CD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-96440-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action


On Tue, 03 Feb 2026 12:48:07 +0530, Janaki Ramaiah Thota wrote:
> Add the PMU node for WCN6750 present on the qcm6490-idp
> board and assign its power outputs to the Bluetooth module.
> 
> In WCN6750 module sw_ctrl and wifi-enable pins are handled
> in the wifi controller firmware. Therefore, it is not required
> to have those pins' entries in the PMU node.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: qcm6490-idp: add and enable BT node
      commit: af2385d532c3457e08e8431f27d5771d7a686ef5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

