Return-Path: <linux-arm-msm+bounces-108557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHT/GrmIDGo1iwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 17:58:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16819581DA4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 17:58:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DA3083097B13
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 15:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 188573769E6;
	Tue, 19 May 2026 15:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GXQn6yE3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AEA3546EC;
	Tue, 19 May 2026 15:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779205861; cv=none; b=hkPy2fGetwO1bGRWB/4FWG5Vy5MgzKQfKJda5cp5JJn4Hn7ZfVtMuDn48WvklzK8qnMhWpNTkdla9PzElqyXBJQeJEVw79oP+NoVTZLHhM55Cuxd4GHCeLTOjD0lqGTZ9UHXZlzIzuR3C8et0fMjnJJSaXxjIvq3u5Pok9QDQW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779205861; c=relaxed/simple;
	bh=rsB8iG8H6ybTFu+/PGK/lr8Gvj+Lj72izACK2rGJqtM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bMAO/xf/F7d20aWAY1ztO3LQvoDlp2uLvwaxbEdn4XEjsC2Ce3Pbj0tyhHxWKrSt2jtaTW6x6g3iMvxo+kdgqd+FxDqPOqyv4q7CjBByEF4H9ZN77InFcZO+ipUNuRAce2gwqMMDbIRHtlmi/Uy/HxTlPGTzxvhDkPWBD7bxFTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GXQn6yE3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E132C2BCB3;
	Tue, 19 May 2026 15:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779205860;
	bh=rsB8iG8H6ybTFu+/PGK/lr8Gvj+Lj72izACK2rGJqtM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GXQn6yE38VrsbgNl4qwUtFrTOYvNIcWNw7RYKPoknWAJVtfAGpelknJ1knRwJVWut
	 dVYuemq0TwYRvTLDTzxTfSj5OKHtx5pUrGgS5oEkDxCOB2+Gu1y4P3mpDjyLN+DUgZ
	 0YUWDahVfxvGOvIhhsGDPCa/IwoC382et7QNsQ38Botg0DW5TFKDSCKvwmrn4eIRHZ
	 CceYmdtO+K4pLtTdTPZHqBGzNzHZEUhuijMx1Kn8Zbdjja6k2knEYbbFPwFlEpJUyN
	 mz0/GMf0s/z+y3qICm/OGxzY3N4QszlqhaBquaPtf5eQM8pkNMX2ZN6K1e1sj74XVM
	 mR2oMgo6y/mBA==
From: Srinivas Kandagatla <srini@kernel.org>
To: linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: =Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org
In-Reply-To: <20260427070100.18184-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260427070100.18184-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] nvmem: qcom: Unify user-visible "Qualcomm" name
Message-Id: <177920585939.49676.11567502998717795898.b4-ty@kernel.org>
Date: Tue, 19 May 2026 16:50:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108557-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 16819581DA4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 27 Apr 2026 09:01:01 +0200, Krzysztof Kozlowski wrote:
> Various names for Qualcomm as a company are used in user-visible config
> options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
> "Qualcomm" so it will be easier for users to identify the options when
> for example running menuconfig.
> 
> 

Applied, thanks!

[1/1] nvmem: qcom: Unify user-visible "Qualcomm" name
      commit: c139262efafddeb6f32e0dbe55b61a6ea53a680f

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


