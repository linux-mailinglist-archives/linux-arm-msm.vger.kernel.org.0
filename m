Return-Path: <linux-arm-msm+bounces-93803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIP6C5mxnGmxJwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 20:59:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B5117C9E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 20:59:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 23BCC309B23B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 19:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEDBC37647B;
	Mon, 23 Feb 2026 19:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iLSwiXZ9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB68E165F16;
	Mon, 23 Feb 2026 19:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771876600; cv=none; b=WB8uCdJcUeNU5hGszc48PE+wsKaRzEGt7BtJnr5k1EAhFhdERJK34voW85BUXyj0SxeCXF6tfYJKu89LiA2/XoirvUh3xgez1hZm0ru4PrCBRY+hKLxyJrPjWkyqTGADLQGrVoyjSAZvyIo5owgBZBmd1fpuU3ZfQaMe3x0tn88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771876600; c=relaxed/simple;
	bh=A855/dpKFvUjwqc9Jfg2uqDlMPksGTfn/qdNgb5ibxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hJBHjl4JKBXS2COx2H+pv3mlSbnnAAEdI2FkWjiZ7eNso9ycRy0oy+nWYUBIXhT5GRHxACusCcq0CbZLZQLTFcO1q3iCNzNr4G2BRB2rcwycq788AyuH5/x+E6wz1UohHZksakFDebI9Pn0dgN5dbYNvaI91H66y9cjAmDcrxaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iLSwiXZ9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 919E4C116D0;
	Mon, 23 Feb 2026 19:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771876596;
	bh=A855/dpKFvUjwqc9Jfg2uqDlMPksGTfn/qdNgb5ibxA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iLSwiXZ9M2pxPFVV42g0F6Gloax3PeDduGUh7fOGYrRs62SN2biwiuIpB4hbkraoH
	 PMbWmo8f0SojgE3OIH6CPuyItNAMQo3nX1Xd4J2E2yPv8hnXxbEmPkjA78bwTLcHdl
	 0XtVRTeg0PjF2OKTIMYxmOGr32OtgYI8Z+D2KJJFOQjdLP4K4PUuzg26vGT8278BeD
	 u7oPTvg0rI8THSowFTT4B5RiKOWFbEWpjRpXeayszMeys6ywEfjiPtENupW56V62GJ
	 fMt9oktAAKV7r0kk4w8rhMhO+bQT5vByttY8H/6pjEKYpejIwZD2e6+aRuUCi8Lh8n
	 6awXD8w5zl+Cg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Enable SM8750 clock controllers
Date: Mon, 23 Feb 2026 13:56:14 -0600
Message-ID: <177187657306.166046.16876864784529414360.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260220-sm8750_defconfig_cc-v1-1-666aa922b392@oss.qualcomm.com>
References: <20260220-sm8750_defconfig_cc-v1-1-666aa922b392@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93803-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B9B5117C9E8
X-Rspamd-Action: no action


On Fri, 20 Feb 2026 11:55:08 +0530, Taniya Das wrote:
> Enable the SM8750 video, camera and gpu clock controller for their
> respective functionalities on the Qualcomm SM8750 MTP boards.
> 
> 

Applied, thanks!

[1/1] arm64: defconfig: Enable SM8750 clock controllers
      commit: 63931aa0d96203a7e656485dd31bd5528d3202ad

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

