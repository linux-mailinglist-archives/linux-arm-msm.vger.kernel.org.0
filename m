Return-Path: <linux-arm-msm+bounces-90187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MlWAXcNcmksawAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 12:43:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3D6662C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 12:43:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1FE588E5F1C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 11:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1723E37B402;
	Thu, 22 Jan 2026 11:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eTJts5RR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB2BDDAB;
	Thu, 22 Jan 2026 11:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769081535; cv=none; b=prfeIpfHxucAuHLniyCCU/koYr13Pn9IvMXaAeOBYCoAaF1BjVmeykTIdAGJ6xzBjgzkFqDm88dgjlOUwtcoOmZQNv/jGU1o+xUjvQhRiP6HuLOuUqwJ4Cgv8JcJ0lWBi2CmiTGkbr98IUN+P3M8fIYa4asdSVFLnS9KYqaYark=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769081535; c=relaxed/simple;
	bh=8paF0zUoqwb1gyg5wOFm0X1F4c78RI1i8BLQw6i2/MQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iFToiKRmcVca9w4vt5X/mWqqIUhISCQGt8+Uyxqdj/VMc/wAKoaZK9tqHK2iX2Gz2oISqUYCeSgtqP5Bgvpd7aXiLNV39ju0hIocedB5NSVhbJBlQB1/MOqGtkW8uQrHbJ2SpQ6SiQe1TWyEYRQ+CzLNCfJ5faN124ft9MRxbfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eTJts5RR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE060C116D0;
	Thu, 22 Jan 2026 11:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769081533;
	bh=8paF0zUoqwb1gyg5wOFm0X1F4c78RI1i8BLQw6i2/MQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eTJts5RRBusk/gPRx4lF7XxbBEaNn4/3Gvg8ywBVhxDoZKu3r7LlAOHALByvudu5c
	 YqeVClH06Gpmw7/GZ1g6nK3eIefoI+HjqPjkp+mj/h3gW9BC4AzI87a67czW8jwnDm
	 DXqbJC7xxbr6IpacIHBZnZXUVpdqnGPBsA82sikEQtgfo6pT5kbf+nVpx4O2QRoRKI
	 tUWt8UqoTTC4RZkgdKwOnFvzSGTg9aP60mG8WnHbjeoRY1OtZgV5OAdyvV5uv2jFxv
	 V/6V6t0JOlcbjICNxkzldzQb2XcZEjp6QQWNWmggg6b8mWPLMTsZuwfSbdmrdqpit4
	 HS3aR9xcmQRDQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com, 
 kamal.wadhwa@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, 
 jingyi.wang@oss.qualcomm.com
In-Reply-To: <20251216-knp-pmic-mfd-v3-1-9d0cd62676d9@oss.qualcomm.com>
References: <20251216-knp-pmic-mfd-v3-1-9d0cd62676d9@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3] dt-bindings: mfd: qcom,spmi-pmic: Document
 PMICs present on Glymur and Kaanapali
Message-Id: <176908153064.3852668.17071454311954418009.b4-ty@kernel.org>
Date: Thu, 22 Jan 2026 11:32:10 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-90187-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: AD3D6662C3
X-Rspamd-Action: no action

On Tue, 16 Dec 2025 15:44:12 +0530, Jishnu Prakash wrote:
> Document compatibles for the pmcx0102, pmh0101, pmh0104, pmh0110, pmk8850
> and smb2370 SPMI PMICs.
> 
> 

Applied, thanks!

[1/1] dt-bindings: mfd: qcom,spmi-pmic: Document PMICs present on Glymur and Kaanapali
      commit: 581b04179dba347f1fa51065557303a070f001e5

--
Lee Jones [李琼斯]


