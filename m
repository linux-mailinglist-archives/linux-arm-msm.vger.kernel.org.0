Return-Path: <linux-arm-msm+bounces-101839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPrRF3UV0mnmTAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 09:55:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E63C239DB96
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 09:55:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7716E3008787
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2026 07:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A73036B07D;
	Sun,  5 Apr 2026 07:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b16cKHj1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA90733A716;
	Sun,  5 Apr 2026 07:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775375729; cv=none; b=WoW1Ruj4GEzbUodyp/zQxvnbBZJvzizDqW9IZG2DW18AKfpMlQML3XY/wtdTeyQdfdBa5gCdBtouYbNEo1WoLCW77bIuquJHNoSeL2eik4Sb9qR5UP7l43y2eh4omVLtXguXbibRqxQCeH14AAXwfIqgD5ZwJR8xWu2XbgdCnaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775375729; c=relaxed/simple;
	bh=Nj33knzFJ8xhb2ItHkZFFYsvHxXYDRfevSi7RRN6bTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i0sC/apgBl9UtdK6HetKL1UqhKa6EPNtfely/EPI6kB6hnyjZc2xIq13MIWuA9E6wixtnY0W5hpcOVSa83BTC54iGIQkTUCHwoRKB7J+aJJObb4pAIoKQ8kjTu9Fi+tGE5Zjf2Vib0YYOuAd46s549ZPv3UhsKizmX5sDOWhu2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b16cKHj1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0AA5C116C6;
	Sun,  5 Apr 2026 07:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775375729;
	bh=Nj33knzFJ8xhb2ItHkZFFYsvHxXYDRfevSi7RRN6bTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b16cKHj1GxUcOvX3Q38JEcWoO0LythOOs5XOgalA27mb1dlYkNNw36LbEFkXdP2/1
	 YHncm42fsyDtaXvXAt9Cqifbb4OHCpfUxxua1GrYv2jwIQhcpd3fzwmjv7lqI3N/m8
	 /WYNUvPlXAVEllBIrMdpDhLdsukDTnfKn++WptENAs2pvjWx43CU6R0f/ECcC2ztjG
	 MBWcdbs+3nuI85FYWw58YCxFfhNqdrqN//EAX4c0mPkoIj9DlO0X4wmsxJ4GwSdMrC
	 MdNcrG/rekQytLQHAQMRpJUHkI941vFnq6sc9+rGd34O+lEA7hZDyyz7ZzD2GjGZlR
	 pwlbpNbqQoZIA==
Date: Sun, 5 Apr 2026 09:55:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Casey Connolly <casey.connolly@linaro.org>, 
	Joel Selvaraj <joelselvaraj.oss@gmail.com>, Jens Reidel <adrian@travitia.xyz>, 
	Petr Hodina <petr.hodina@protonmail.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Add Xiaomi Poco F1 Tianma
 variant bindings
Message-ID: <20260405-truthful-fat-angelfish-ec3e45@quoll>
References: <20260403-beryllium-compat-string-v1-0-0a6b9cb55a20@ixit.cz>
 <20260403-beryllium-compat-string-v1-1-0a6b9cb55a20@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260403-beryllium-compat-string-v1-1-0a6b9cb55a20@ixit.cz>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101839-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,somainline.org,linaro.org,gmail.com,travitia.xyz,protonmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E63C239DB96
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 06:55:33PM +0200, David Heidelberg wrote:
> Add documentation for Tianma display and touchscreen variant.
> 
> While at it, correct binding documentation expectation.

What expectation? What exactly did you corrected that you claim this is
a fix?

> 
> Fixes: 341fdef8ea49 ("dt-bindings: arm: qcom: Add Xiaomi Poco F1 EBBG variant bindings")


Best regards,
Krzysztof


