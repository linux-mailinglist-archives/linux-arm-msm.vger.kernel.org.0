Return-Path: <linux-arm-msm+bounces-108464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2K3AMfdDDGrQcQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:05:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8611857D297
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:05:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4C7AF30A83EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87CE23F1AB7;
	Tue, 19 May 2026 10:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l0rxXUDu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D441032B107;
	Tue, 19 May 2026 10:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187908; cv=none; b=t+ODc8AaXmYqwizOlRBYc8VIt7cm9VvsAyMK8UkmrUqHqtfBx+XnZjolACTNajvzV/6i7cQGsLXejtlEthtdGUHwnu3ubl8H9sJV4AsH10v857SzYETtG6r9dEUILZ/wBT3rXNWxWvqUo1SfpAo5MTmO5IRr8U7OBkjTme3jEq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187908; c=relaxed/simple;
	bh=+f/VsvcvDGarTr6mOhk+WMyELgLXSSutUe7AMovdBhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VlPIO0yIDIWEFSODuJCP5PRYtXLaVgw4BlGLqLgbff62IxFJ8aHFkRXEylZCKqN8xGHHKzKJTTd89VK5sF2v0IhVSHdplDENoz70kpPj5q77yDsLysc1mifrg8nT75RUYH2TQm1/nDBSo+nysrYVQUcJcwV2S8KOrrpJ559FhYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l0rxXUDu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE59BC2BCB8;
	Tue, 19 May 2026 10:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779187907;
	bh=+f/VsvcvDGarTr6mOhk+WMyELgLXSSutUe7AMovdBhU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l0rxXUDuOsUSbU+QlYvPudkg/DArq5zNpx9nSWrdFVclNGaiIsqcmy6FtDeIG63zw
	 pxEoqA5u6er2jC6qAp1OVAQL7gUJXS7ROYf6H0qQn7RsxgbgW20X5JDM9FAJf3Vc+a
	 v3cbZu67ZOFQVmjAtW3/QtK3cK+RPCJ5HB+N6tDqTOvghBE7ftlJsWDKgbBNOwZqXA
	 zb8GGNInVS7jmiILnPIJ8Yg4E5vfSkSQp3cvlLXpheXKRvmPVvsQjiexhKR2F26DsZ
	 6ZsXGhQFqzDKnQ/rnNASQcKWzd2O/uITzZ3rwx4XbOK5i+dzCiZUSadswjb5IUYKFb
	 ImdwQ8lH0mkpQ==
Date: Tue, 19 May 2026 11:51:42 +0100
From: Will Deacon <will@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: robin.murphy@arm.com, joro@8bytes.org, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] iommu/arm-smmu: Use FIELD_MODIFY() for bitfield
 operations
Message-ID: <agxAvl02rcPoEHaq@willie-the-truck>
References: <20260430164545.49637-1-18255117159@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430164545.49637-1-18255117159@163.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[163.com];
	TAGGED_FROM(0.00)[bounces-108464-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[will@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 8611857D297
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 01, 2026 at 12:45:43AM +0800, Hans Zhang wrote:
> Replace open-coded bitfield modifications with the standard FIELD_MODIFY()
> macro. This improves code readability and adds type/range checking without
> functional changes.

Does it _really_ improve the readability? '&=' and '|=' patterns are
pretty idiomatic C code, if you ask me.

> FIELD_MODIFY() internally performs the same mask-clear + set operation but
> eliminates repetitive boilerplate.
> 
> ---
> Hi, If the Maintainers think it's not necessary, please ignore it.

I don't really mind the code either way, so I think I'd prefer to leave
it as-is unless somebody wants to convince me otherwise...

Will

