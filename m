Return-Path: <linux-arm-msm+bounces-90191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GN/tKVAdcmmPdQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 13:51:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D3666DF0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 13:51:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 823CA728124
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 11:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67C9D43D4F4;
	Thu, 22 Jan 2026 11:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WKFhd6eJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299F0436374;
	Thu, 22 Jan 2026 11:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769082773; cv=none; b=CTHN7Ym3Ytldinlr+qtcKT96t/oOz2n+HM+LiryrKWKqqd/qvoNn1hHdRtXLoWC4S+eS4JdDf1q/Lef1oLVwRxEUwpHFQJruJyf/miNw4x9slDlvOAgIFpa2ROPaaFXWnATlbVGpmMQuIujONrTUK9bKK4/ehwlRONM2GlQpuZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769082773; c=relaxed/simple;
	bh=8bKk78/cUBVMRsGmIHB9eHx8NN7HqTjyj+NpF8y77Vk=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=tVvgyGA5WRpeRF3E4mpjbUEULX3Vx2x8lPy8sLLdKOeFfCT2w97l3KnBPbUeO4f5HJq8F/G2k8SjT/psSrQeKmNBhyHyi0oU6jHTj6lwFPfVUTXWWRamATj0cWeVXr194veRdzVJIrStAPUw1cSdv/HsXqpxzbHxq2JtQS13QOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WKFhd6eJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85833C116C6;
	Thu, 22 Jan 2026 11:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769082771;
	bh=8bKk78/cUBVMRsGmIHB9eHx8NN7HqTjyj+NpF8y77Vk=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=WKFhd6eJG/25Tu4S4NiFeifgs5vRUp2FvhIhO9DOqZHowGyVhBvqgg+aZaszjdrFy
	 n8ifSpsyn0O3b7M/uwQxbFTWBoIGqFRrA0fOKwQmHJfBSJKzPzpjU35UML3nFzwV3d
	 h1HO3UU/PT6kDfE77KwS+bMvGFQe9bACXaz7I9U4odtNTE0CReW60VkX7xP9WENuQq
	 oZejainJFYp9vFSx8K4TusF1lRA37G6EGikufyzZTh33VEHyqTfkDKkn/yRepN++LK
	 kbVe0vhEaP7/NZeO5EYTlnbJr7dV9TGOu02iQc9ozWBuabmlwKqMhPgDHI0Yb/cZLj
	 gaR7SJwmgt8gg==
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 Jan 2026 12:52:46 +0100
Message-Id: <DFV3I3D5UIZP.38TNCAJWQGI3O@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] iommu/arm-smmu-qcom: do not register driver in probe()
Cc: <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <broonie@kernel.org>,
 <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
 <robin.clark@oss.qualcomm.com>, <hanguidong02@gmail.com>,
 <quic_c_gdjako@quicinc.com>, <dmitry.baryshkov@oss.qualcomm.com>,
 <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
 <linux-arm-msm@vger.kernel.org>
To: "Ioana Ciornei" <ioana.ciornei@nxp.com>
References: <20260121141215.29658-1-dakr@kernel.org>
 <6oogrqe3n5sxtpdydjqo4ucwp7n3ipqoupxtekvzbnqd7dae3s@q22wc7fpbtya>
In-Reply-To: <6oogrqe3n5sxtpdydjqo4ucwp7n3ipqoupxtekvzbnqd7dae3s@q22wc7fpbtya>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,arm.com,8bytes.org,oss.qualcomm.com,gmail.com,quicinc.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-90191-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: 82D3666DF0
X-Rspamd-Action: no action

On Thu Jan 22, 2026 at 10:21 AM CET, Ioana Ciornei wrote:
> The boot lockup was visible also on the NXP LX2160ARDB. This patch fixes
> it.

Interesting, this means that qcom_smmu_impl_init() must be called on this
machine, is this expected?

> Tested-by: Ioana Ciornei <ioana.ciornei@nxp.com> #LX2160ARDB

Thanks for testing!

