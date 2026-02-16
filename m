Return-Path: <linux-arm-msm+bounces-92965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODhaMH4kk2kX1wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 15:06:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F841446ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 15:06:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0B25B300C27C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 14:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2CD53002B9;
	Mon, 16 Feb 2026 14:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rDrMv5zV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6831D5AD4;
	Mon, 16 Feb 2026 14:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771250811; cv=none; b=GoOAWAfI30DaTjUL3ru+07W4HAnCUQeWYPjkwZXcrbYIjRTOIQWqE+lNoh5zA/nRHk8aK7L2Iojo9lsCv1ElkaUqHZnio+s+ctW4DvriUpzQuJ3L0uZJ2mOOgwPv6PUTr6QYqDawYF9ftagDUSu5ZIHOTlrdjC9+SXq4LYKe4eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771250811; c=relaxed/simple;
	bh=Wa+q5Ka/oZxZEZmEDtylSpDh3pOBhPLefVw2xrg7skY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dz2H0c0Zr+rTonSDs67BVSeSz2dc+Bk0PY+xOyo2gL4bFUWutR5C7GkHmSIwMBxyR0fKYGyr1RNtbpzKpKEY1B61SXV607yvKse1FoYCbPv5nGcbYMY+eip/vB/XXJdPo8PeR71VNerQRDIDKFAdF+SX6ToY5XU8NKrK9YhE/uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rDrMv5zV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E53FCC116C6;
	Mon, 16 Feb 2026 14:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771250811;
	bh=Wa+q5Ka/oZxZEZmEDtylSpDh3pOBhPLefVw2xrg7skY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rDrMv5zVF44UzuFDOtDGS+D4czr2PgRIKiOzwJMV9OElt5Vl1YMUP6W8M/4ZH9GNw
	 yfiLcgBLQo/F9D8nbNvP4NkCaQqKOUiq6mnrag0+/3tyawxUclXeUpaZj9Gzjbvsff
	 ZWutffrPGF3/eaf7sJ9kh8no8guTdohZJviGCCErOaRDZcB/5Jj+A2wCsF0dea0w6b
	 ebHEBBm5prHIU+41wFpN0k5d3JVIshL1hC9pM44gNkeKu1eXdb7laGaHkghN1OFMDV
	 OlCsjVTqPhlA8GCCwqI7sz9+m/PECWVbBh+AfvZqNRUkjx5MI+oIDP64m/EhbAcC4/
	 Dfb/+YmudFeqw==
Date: Mon, 16 Feb 2026 08:06:47 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Sarthak Garg <sarthak.garg@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com, quic_pragalla@quicinc.com, 
	quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com, 
	kernel@oss.qualcomm.com
Subject: Re: [PATCH V1] arm64: dts: qcom: hamoa-iot-evk: Add SDC2 node for
 hamoa iot evk board
Message-ID: <tq2oh7rqqcturtp64r43sv6stv2pu53v757r5h7zldnnoalhay@mhn7crfc6gca>
References: <20260211093045.2595126-1-sarthak.garg@oss.qualcomm.com>
 <ac78f12a-b10d-46e4-97b2-57d826ebd893@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac78f12a-b10d-46e4-97b2-57d826ebd893@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92965-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 45F841446ED
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 01:53:57PM +0100, Konrad Dybcio wrote:
> On 2/11/26 10:30 AM, Sarthak Garg wrote:
> > Enable SD Card host controller for hamoa iot evk board.
> > 
> > Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
> > ---
> 
> nit: omit "V1" for the v1 in the subject
> 

Also known as, stop doing this manually, use b4!

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

