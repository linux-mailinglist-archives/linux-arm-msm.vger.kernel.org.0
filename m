Return-Path: <linux-arm-msm+bounces-98490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kP4fAbuvumnkagIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:59:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7494C2BC812
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:59:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9152C32209F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 13:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4A7E3E3DA8;
	Wed, 18 Mar 2026 13:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c2HcrWy0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805283E1204;
	Wed, 18 Mar 2026 13:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841867; cv=none; b=VEsskKUSlLeXhIYSOtkCywasvWZCs3P83l6Y/qXbzc2ECLNaeRq/U5AolH2ha76n/qcwqiIDRaBkHYmL1Ux4slkoinelMwPpQD5ZkTjlHaAEJU6mQ+fmFMbPzy+Z5YvlU3T8+07UalUBL/ur+ScfnaWa0YxdaH072tbLyzaANhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841867; c=relaxed/simple;
	bh=syg5SsWEOiP7M8GTSWT5/rZFU+H79Gm5NVUTj5Lz4v8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bOn8KdvTBi7VIr1jz72yh8EKIlv4ZIxGwqWcMZjnwZJlIiec5Kyap5ZIVOH0itciso8q3sQLRz4a95pZTu0zNb9DXJQuuD98z+aFrhzhCoajUC0jNP6FtmiavkoW1TOYRkQcy66PVjeYcKb7JniPaJCNGixj6569xWyV9qfEzzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c2HcrWy0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A343BC19424;
	Wed, 18 Mar 2026 13:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773841867;
	bh=syg5SsWEOiP7M8GTSWT5/rZFU+H79Gm5NVUTj5Lz4v8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c2HcrWy0iyIo98Lxc7dAC0Cnt4gCMKu+UR/MUZTuhxyeFUg/MYps2lq9LAuW99wWh
	 NShcEUVMmfhiYwDUzOvQGJ2unUfBaH3tkGm2D5JszzTx+IvWzrH671+YgReCHC9vVZ
	 HMzJgrKKtkAFNTl/KYvJ1KPNs+UAlIEVg/RbRfCQOYtXNM7PC450vsRV1UKE1zOhEf
	 RUFhgERg4sfxAQXx+exv7BhDSSpEU7uSm9eaRbKp6nQHbbo+5ikduRAEy+I0Pa14B/
	 vbmiAgbSB33MFUZiqQxe2UZg9JrrEI4fQwtezHQEEoxavvnph75YM5JHC24PmlI/wD
	 IvedAf0RAStAQ==
From: Bjorn Andersson <andersson@kernel.org>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	sboyd@kernel.org,
	Riccardo Mereu <r.mereu.kernel@arduino.cc>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alexey.klimov@linaro.org,
	srinivas.kandagatla@oss.qualcomm.com,
	m.facchin@arduino.cc,
	akucheri@qti.qualcomm.com,
	ndechesn@quicinc.com,
	Riccardo Mereu <r.mereu@arduino.cc>
Subject: Re: [PATCH V3] arm64: dts: qcom: arduino-imola: fix faulty spidev node
Date: Wed, 18 Mar 2026 08:50:21 -0500
Message-ID: <177384182903.14526.1151528964231124439.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260213101002.105238-1-r.mereu.kernel@arduino.cc>
References: <20260213101002.105238-1-r.mereu.kernel@arduino.cc>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98490-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7494C2BC812
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 13 Feb 2026 11:10:02 +0100, Riccardo Mereu wrote:
> CS pin added on pinctrl0 property is causing spidev to return -ENODEV
> since that GPIO is already part of spi5 pinmuxing.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: arduino-imola: fix faulty spidev node
      commit: 84d8976426072ea1a559ab1aaeff6bdc16248813

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

