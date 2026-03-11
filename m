Return-Path: <linux-arm-msm+bounces-96895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAqlEnMesWmOqwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 08:49:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BED25E339
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 08:49:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D74B231A7BDB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 07:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 665D93B27D1;
	Wed, 11 Mar 2026 07:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dby6+HGl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDF3349B02;
	Wed, 11 Mar 2026 07:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773214524; cv=none; b=tRia2eJTOSNaxFNSHs/BozhKJrHjGQ1voikgfiqZRQMozFxtnRJKLjQTfIhWEWc/AzetQcEhD0ki2xe0TOpUPMTUtL4bvipbjqyK67vsAY/o+zEovdnZGOtilvHaGPkvoIXtPD1399mHlS3BEJSE5IKnrA0FqaAH5dWGwwhCUqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773214524; c=relaxed/simple;
	bh=ixQo9krEZjci4qTh1k5LncNTDsdcPKMdZMOC0CyFYuQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Zmh5/JuqCg+RmDo5UjwgxCEXRYl7gdO3FwKiSenwDWMUHMCDOUw49zljVAb+i61yi5wIE3OAxsMcSGY1vOUDCF7gberQcEy6bXwRppGRlwRZMX3JA7iIho2ByIVzCfLMK0G78Bp7KWeCSfO/USEd7PX003wdG902AMQVI9g3stc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dby6+HGl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AB62C4CEF7;
	Wed, 11 Mar 2026 07:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773214523;
	bh=ixQo9krEZjci4qTh1k5LncNTDsdcPKMdZMOC0CyFYuQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Dby6+HGljg5Oo44GmtvPtRHAKzZj1RaiS7QmMO3dBgUoXc2Fb0rqlQhJhBlRnuyiK
	 FAuBM3Eer3m88du4NtdykgrcCvl9UamyDCd+YIBjtKJdiQwdfyva2PSSQfpbIaeC2F
	 kOVrGKW4WFlYu1qfWPU+aUYPqcgkGq6JFs/YgCs4qMrtpABvQH3bE+vLRvVYQtisJw
	 +X/uu+ClZvr0TFmcjx4YxvQYhTv02OGwknS9DMwM5y7qnIHr27SdOYT3c4zh0uonRc
	 4/0+dIJp/9dOCRwTKIephaW8X8lfAsF5hYgmBzIkj8HcVjn2QpLA5k9+/+SiyUb4FQ
	 4H9rU6OxJbSow==
From: Srinivas Kandagatla <srini@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
 trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260305-knp-qfprom-binding-v1-1-1b3effb09cad@oss.qualcomm.com>
References: <20260305-knp-qfprom-binding-v1-1-1b3effb09cad@oss.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: nvmem: qfprom: Add Kaanapali compatible
Message-Id: <177321452118.2124521.16811807774475821620.b4-ty@kernel.org>
Date: Wed, 11 Mar 2026 07:35:21 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Rspamd-Queue-Id: 12BED25E339
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96895-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action


On Thu, 05 Mar 2026 22:40:41 -0800, Jingyi Wang wrote:
> Document compatible string for the QFPROM on Kaanapali platform.
> 
> 

Applied, thanks!

[1/1] dt-bindings: nvmem: qfprom: Add Kaanapali compatible
      commit: c693038ce48b93f73294f158e8b26b1119d226d4

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


