Return-Path: <linux-arm-msm+bounces-94880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKGmGgdvpWlXAgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 12:05:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BB94F1D72BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 12:05:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D094A305DBB6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 11:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E5FB33A014;
	Mon,  2 Mar 2026 11:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dT9+aq/x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB80F2C237E;
	Mon,  2 Mar 2026 11:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772449410; cv=none; b=ux30QrLGcHgoygTniglvF8IM1hUdj6SARuIYYqJqEs2sPifBcKQb02FJVwd+wf9B0Cu3bMvcQvkB01DeihZvJI26srX8/ru/0ul0CXgCoWHsuEEEMDPS2aoxvGxlaf/VC/Ypm6QpfCNCbKAMQNALfchr/ezKxNS5ZY5+1jl7NwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772449410; c=relaxed/simple;
	bh=kOyJOiCu/+NOZEhi66J9pDw3bBb8BcGGEu+Ej7b/mZg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ISsKTBpRKBGq8GPQz1/nlKupIRBrm1FX95HTLPkMiHsLAqlTKiVOIOGBbTpRT9RUh6l/Oa0iX1qsxjYyRVbMJPnxI8InfSIXVlUky1Mxx7eWFxrG+ubSy+5Jh3U95gXi+50/fpRjvanpcZVNN5nw1klretLVAFQrE7i57JaTL48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dT9+aq/x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DF60C19423;
	Mon,  2 Mar 2026 11:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772449409;
	bh=kOyJOiCu/+NOZEhi66J9pDw3bBb8BcGGEu+Ej7b/mZg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=dT9+aq/xI4R7mOd3snx1p/1NDVVIVeFCXqp/MmHJYZ/SjPXsd4YejR8oRs1bJEJnr
	 ZZWZoRiGzrcg6WtG3GpY8sHXbcVqN+dg2uJKerAZsmTj7KFg8slo9GSpjEmGiXK3Ln
	 UUT8LNF3fERdKle9o6dxFGnpZRCbowX76o3J7U4erYF2yUP4gl7+//No9Gdu1QtTHU
	 qMV8ZDqpwZojZLEqamNf2ZL6Oz1fK5Pw2rPX3A8RafJ49IWiHam49qSXrPPah3aW0z
	 7I2TUhch1TiKQfpfYQ2tt0lQE3QJJ0//mHZgH8JSqZtENadsarFKhIC2VCt5p1O3vS
	 HhBAMg4+yabfA==
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 12:03:24 +0100
Message-Id: <DGS8VJHUIGBK.ONPEXSDJJKPP@kernel.org>
Subject: Re: [PATCH 1/3] driver core: generalize driver_override in struct
 device
Cc: <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <hanguidong02@gmail.com>, <ysato@users.sourceforge.jp>, <dalias@libc.org>,
 <glaubitz@physik.fu-berlin.de>, <abelvesa@kernel.org>, <srini@kernel.org>,
 <s.nawrocki@samsung.com>, <nuno.sa@analog.com>,
 <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-hwmon@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-sound@vger.kernel.org>,
 <linux-sh@vger.kernel.org>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260302002729.19438-1-dakr@kernel.org>
 <20260302002729.19438-2-dakr@kernel.org>
 <CAMuHMdUi3uNoDJ67WkNSKn=BD1F7D1Ot=gz4TwFPvaaYmKaNcg@mail.gmail.com>
 <DGS82WWLXPJ0.2EH4VJSF30UR5@kernel.org>
 <CAMuHMdVe7Z3k1sz2dEYqfpp7uqdYjrqL-gRbUE7CPBpOA+-RfA@mail.gmail.com>
In-Reply-To: <CAMuHMdVe7Z3k1sz2dEYqfpp7uqdYjrqL-gRbUE7CPBpOA+-RfA@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,gmail.com,users.sourceforge.jp,libc.org,physik.fu-berlin.de,samsung.com,analog.com,lists.linux.dev,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-94880-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BB94F1D72BA
X-Rspamd-Action: no action

On Mon Mar 2, 2026 at 11:38 AM CET, Geert Uytterhoeven wrote:
> So I will have two to fix? ;-)

No, once all busses have been migrated driver_set_override() will be remove=
d. :)

