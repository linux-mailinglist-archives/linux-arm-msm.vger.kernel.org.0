Return-Path: <linux-arm-msm+bounces-100838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sG6tLtqgymmx+gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:12:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B34C35E803
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:12:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 884393036054
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4899383C7C;
	Mon, 30 Mar 2026 16:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tCYcIMUw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815A3382380;
	Mon, 30 Mar 2026 16:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886519; cv=none; b=Jyl5M2p9hm1h7T/AbXU/dYAD70pZophIXi5qABAmkR3AQRD67YolBKHyPkuB6haIT9vn0TQJFJKrGT4hdHlJJPt8E4Dkg/2qZMEDsD0XzrcqT3a6GHYq7cg/608FECx5WC2mwvv+Qf5EjybrdrtsN5U2UGFJq9Q7UjuP5yokHa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886519; c=relaxed/simple;
	bh=JBu+KvmN/HrK8txm07i9XQeZ3qrpM6u8FwR8MXU/9o0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ocbx4AKy3ksT4v04027eDu/9ZLNkQZ4wn+iIYpbhYTFTOmoAXg2RW/PEr5DGjiL9uvYQpRba1m5xagM1/uYYR7giVd77LqXSv5V26OQv6jkXVL1FuLPsmgZQVn84PC4BZF2ukClSjn58UUka9IUEntB95BthV0qeDOmgeysW5cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tCYcIMUw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ED13C4CEF7;
	Mon, 30 Mar 2026 16:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774886519;
	bh=JBu+KvmN/HrK8txm07i9XQeZ3qrpM6u8FwR8MXU/9o0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tCYcIMUwPEovu6jgy4PxZJM3MRY+CGpQAWOA8daKUTzZBnsU6CE41ilw9F5apsgTR
	 IJT6X8mRXEBL7xRVzjsCxK4z3TgI+HPmbJDtsqX+GREbYpSwknJ5pW7QcpeMrbLhyM
	 UbIbjmBEqGqRHkzV9HCpBXbgZ8CyqhfDYtO+UJYCQgbPURnQ4n2yfdfwzBxjsfudfL
	 OIYUqjxW3GR90GkOvvDqKog7f5YTXQz/ihEe8bwkwcf8gD7uGj0eXmupdgon06T0GW
	 NDm5W3UH7uYxTGnLkWnUgej19Sg/43eWH5H0HHhHuE77cnVhVpQbO23YDQt1NhssBX
	 J5YxEUz2Xb4PA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: firmware: qcom,scm: Document ipq9650 SCM
Date: Mon, 30 Mar 2026 11:01:19 -0500
Message-ID: <177488647770.633011.3231769376221344633.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325-ipq9650_scm-v1-1-ad6a3fe53f38@oss.qualcomm.com>
References: <20260325-ipq9650_scm-v1-1-ad6a3fe53f38@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-100838-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4B34C35E803
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 25 Mar 2026 17:09:43 +0530, Kathiravan Thirumoorthy wrote:
> Document the scm compatible for ipq9650 SoC.
> 
> 

Applied, thanks!

[1/1] dt-bindings: firmware: qcom,scm: Document ipq9650 SCM
      commit: dc67808832d3a1d337c314a2c950f9bf774a21b2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

