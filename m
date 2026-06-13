Return-Path: <linux-arm-msm+bounces-113020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RtwBNBG/LWqIjQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 22:35:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A2C67FA57
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 22:35:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=apg+IHY5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113020-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113020-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F1DD63035830
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 20:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F57038E113;
	Sat, 13 Jun 2026 20:35:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023E4331A5B
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 20:35:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781382921; cv=none; b=nt1jngbhHQoiQNt2cGcAnmwqyzl6gJpUpekkdeszrpUPDEipnC4/QXAsFFwPOkyqHEjxeRNWd6iCiT0uGNLZ++h8RDpIrtFkZlSvlBuVeTgnWWsGAXMN2NODhZlqO4YtvIPKfJLu68/pdqcJO+EHSgv/2iBA6L2BcyfzAe5+alI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781382921; c=relaxed/simple;
	bh=jY+5h6BEqTigLHC2QbDztdBxYdYvY/v+aeeg3os3Dn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sGUWRCdVXjmJRPQYpGGT8Js6yE2mw7VdJ8LdaxDSesw32HCSzaF5THVt4AqKQ3pNATCchR9vzfc9eruepmtpO1Wk8xy8Z5TUf+jb0ojDOy3DkNa5oQD7tVFBvwKXHHFvLGunJcNfRyTzmZWj6QmFkJWPFx3DB4yJ2zRf1cOKH7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=apg+IHY5; arc=none smtp.client-ip=209.85.214.177
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2bf2911f93cso50135ad.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 13:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781382918; x=1781987718; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lFug7r9V2IZ6ttYLRSwXSuZdIzMUMmjx+agrhP1KloM=;
        b=apg+IHY5EFWnXL9g1EiX77U0u3H94ggPa3gh7pfv66zbsk/wGcEXkLBDF1x+tuOJbT
         OG9kWhMBf4pRXF9uda/m+Wf/TarWhsEIjVQaZ9T9KArd3A3JpI0/Iv4qfU/VCZjvJPa9
         EnCUPtX9aDVaFD2qbKeVOIjiQ+DEJ0IUoKptnGg4DfwtIoMF7zoAql3n+ABfVZ8kGtux
         MnhSSd2tVIHs2ejfZ0Yq+NWkdKoEbi6hAOJhH17k0OPEhbx6KAoOCfJX3kLPIhGwPpK+
         5YWwyZMdvpvVfGz4wBgst87wGUSpoyNPgWGVc2nDOs4Oi6GI7DG6/Xj3V8U88AwStaeP
         yepg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781382918; x=1781987718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lFug7r9V2IZ6ttYLRSwXSuZdIzMUMmjx+agrhP1KloM=;
        b=ZKDQMmlE7mnNCsM4lJVitxzPoUKrP8kk22VsK0WtISfhJDHgpkVWVt2LxtK04lh0rp
         j512mBDfY9HfwZ6KgQujGzJ74cdtrZ/lCtT2EtDFRENbrEdxySu3wvf9VqkKjoLjROa5
         YyyMBebai5DpSfSR81dGQaNlePJttNwXdEMeJNFeFMWLo2jmlhQCrvBlhYXWeGaKggJu
         tle9JkMaeJ82q4dqVsPBRIMrLpXZ/8AtnD1lPuYqsjqgyM3gQfFDo3Idyhg1uk/a4lDH
         xiug2x+lmQCWN+YdEnH9GoRFbVQXvyLPDywO/eMcoxOY42edtob7nWH+UdDeMR2cz31c
         vWRA==
X-Forwarded-Encrypted: i=1; AFNElJ/iL1cqcplqhTiW6Ge0gm9+eJDlaNGKshjB2EgYiXAgbV44VEwQkgUa2BCB5hQgWYEZrRNeKdqb06IqWFxx@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/EB1khF8H5BKeFHLi2hosojkWH2POhEl2pt9rheWAESoNvySr
	EIo4xw52Na+TTxwT9eugdoNakdUv4ufCJQF0rvWv8XQgulixqyuFhi5NSujf6hpcpA==
X-Gm-Gg: Acq92OHOxl24DbzXYRjS38JSbcC0RDSaYQ58qJQfXgO/NGaue6MCZkVol4lMituLwfv
	bPkgB38FGKTNvsqw+WZD2N+rKTsGH7QvbLgb60JOnRTLdsW6qVdMycJIahnAo4m+Fx01nvVU8nt
	DaBx66Dw1Mtnjllt9smTnxmF5Jm2bo2jxfok1dabH1VqjcNEhpNfBHWgaFeWb9xDmIfr0URbxgh
	0M1DsMyjBRBQkThfWX3DundFxkm2TlqMp1C1dTJZJDaHV0PZA4uXHfJeoCmcBdj0KfJjXXX9tpx
	eWnF3gjaAQeC0qvpT9Zo4MtSWlzzBWzY7eXzl0TowRYNPhUJJvdlNV2jp//LAvA+cCDNhYngcJh
	c3Ykzm17Fw3IdNzxs4jI0c9jrs+Y/JYxK6a/k0jnClhEydszFfe2ExhEzN2gmSMbq8AhS9cFgs5
	l2jW/+FdYEjCN6W4W//tIW+myb8m5Ui1Fmtp8PzJ6ct5bOxokfYVfP9yFM4BW9
X-Received: by 2002:a17:903:24f:b0:2bf:3741:5b76 with SMTP id d9443c01a7336-2c665e34838mr1217385ad.3.1781382917803;
        Sat, 13 Jun 2026 13:35:17 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327ac7fbsm59623015ad.42.2026.06.13.13.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 13:35:16 -0700 (PDT)
Date: Sat, 13 Jun 2026 20:35:10 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Pranjal Arya <pranjal.arya@oss.qualcomm.com>
Cc: Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>,
	David Matlack <dmatlack@google.com>, Shuah Khan <shuah@kernel.org>,
	linux-arm-msm@vger.kernel.org, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH RFC 0/3] vfio/pci: Hide and optionally override the PCIe
 Device Serial Number
Message-ID: <ai2-_nWEXPyHmmLJ@google.com>
References: <20260613-pcie_vfio-v1-0-09168188f3f2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260613-pcie_vfio-v1-0-09168188f3f2@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[google.com:+];
	TAGGED_FROM(0.00)[bounces-113020-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pranjal.arya@oss.qualcomm.com,m:alex@shazbot.org,m:bhelgaas@google.com,m:dmatlack@google.com,m:shuah@kernel.org,m:linux-arm-msm@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:mani@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[praan@google.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praan@google.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 34A2C67FA57

On Sat, Jun 13, 2026 at 11:13:35PM +0530, Pranjal Arya wrote:

Hi Pranjal,

> vfio-pci has no perm_bits entry for the PCIe Device Serial Number (DSN)
> Extended Capability, so guest reads of the serial
> number currently fall through to the physical device.  The DSN is a
> unique, persistent hardware serial number that identifies the physical
> component (the functions of a Multi-Function Device report the same
> value; Root Complex integrated Endpoints may implement it independently),
> so exposing it lets a guest fingerprint the host hardware and correlate
> it across VMs.  For multi-tenant passthrough this is an unnecessary
> host-identifier leak.
>

+ 1 to what Alex said here, QEMU / VMM should be able to trap and present
the desired values here, we shouldn't need this in the vconfig. Thus, I
believe this is better suited to QEMU (maybe this should be a patch to
QEMU?)

> 
> Signed-off-by: Pranjal Arya <pranjal.arya@oss.qualcomm.com>
> ---
> Pranjal Arya (3):
>       vfio/pci: Virtualize and scrub Device Serial Number from guests
>       vfio/pci: Allow userspace to set a virtual Device Serial Number
>       selftests/vfio: Add PCIe Device Serial Number test
> 
>  MAINTAINERS                                      |   6 +
>  drivers/vfio/pci/vfio_pci_config.c               |  98 +++++++++++
>  drivers/vfio/pci/vfio_pci_core.c                 |   2 +
>  drivers/vfio/pci/vfio_pci_priv.h                 |   2 +
>  include/uapi/linux/pci_regs.h                    |   5 +
>  include/uapi/linux/vfio.h                        |  18 ++
>  tools/testing/selftests/vfio/Makefile            |   1 +
>  tools/testing/selftests/vfio/vfio_pci_dsn_test.c | 206 +++++++++++++++++++++++
>  8 files changed, 338 insertions(+)
> ---
> base-commit: c425609d6ac4012c8bbf01ec2e10e801b1923a7b
> change-id: 20260613-pcie_vfio-48506602ec6a

A few minor things, we don't use change-id upstream and no need to add a
MAINTAINERS entry per test, we already have an entry to maintain
tools/testing/selftests/vfio.

Thanks,
Praan

