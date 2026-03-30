Return-Path: <linux-arm-msm+bounces-100836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJbLKKKfymmg+QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:06:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A31035E615
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:06:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F22D53014916
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9A973793C5;
	Mon, 30 Mar 2026 16:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iMm8kYQE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CCD37B00F;
	Mon, 30 Mar 2026 16:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886517; cv=none; b=Pm62WZ3rxKnRPe0bmP6srRxSEzTs7V7y2b9IsRiEIHi4p1KuoJip20swLJ5r1FWU3iQscoL0VTXc7HmAQ6BE3EmadpHL202/tk+ARmM7Fd9J+PuxQwOJp3kZOU/nx/ICFhuni33vc8ehLOgjDazc2bDr7Hiw7STWKN3sI+pvecY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886517; c=relaxed/simple;
	bh=NDkMBMMjMw6meGOlpzhgyKoyiUw513qgplxqDRLvVm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qzc0ufb5R1sgONd6JDSLDyfK74AeU3F0U8ByFIJbCzH8i7NxqSnuY+On+p5V2Mbc+B0KuWcInXxbrhOkWVQdchTWgaZ8VT+/8w540i+bU5gdLoEl78RbyvMZ34ZXhAmWMdXvGa1sW+vF8qRriGEvZvZLDztn3yLqhH11oY9FtAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iMm8kYQE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB568C4CEF7;
	Mon, 30 Mar 2026 16:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774886517;
	bh=NDkMBMMjMw6meGOlpzhgyKoyiUw513qgplxqDRLvVm4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iMm8kYQExubfolbx8aKJdkDR6jcnX2nH2Hxo6XWPGEACjD9RJRUCmtj8iy1gw+jaj
	 C4H5VZ6vksDciTzLOTgy2jr6wNPTmGq+gJAIsQ42axSvWCKPAKOlDiHWw58xh6LkXY
	 TuiOC5rbeOiKOjICE/dHCcfD3SJyoKwmZQwZwD9SRIxcXigqDVfLnpd/vgkOFj+9DR
	 udMsYWDEHDNrDay6xyRDTIiyDs2rkel8qT5VfPhRZVTcm7Dka+RPPKVo5Pio+TOVFH
	 Aa3FraCWSGfZJltRI60cRHUhlnDzXdMoz3Tlwh0FZWHgiuYk8VIwy6olTD+sgMlelU
	 sZh6Ayin1kkIQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sibi.sankar@oss.qualcomm.com,
	rajendra.nayak@oss.qualcomm.com
Subject: Re: [PATCH] firmware: qcom: scm: Allow QSEECOM on Mahua CRD
Date: Mon, 30 Mar 2026 11:01:17 -0500
Message-ID: <177488647772.633011.7362316199176740554.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260322-mahua-qcom_scm-support-v1-1-00c50db332ee@oss.qualcomm.com>
References: <20260322-mahua-qcom_scm-support-v1-1-00c50db332ee@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100836-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3A31035E615
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sun, 22 Mar 2026 23:27:39 -0700, Gopikrishna Garmidi wrote:
> Add Mahua CRD board to the QSEECOM allowlist for enabling access to
> efivars and uefi bootloader.
> 
> 

Applied, thanks!

[1/1] firmware: qcom: scm: Allow QSEECOM on Mahua CRD
      commit: 0ff62b7f1b355d4cc0568d73e5911683bdcfe1e7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

