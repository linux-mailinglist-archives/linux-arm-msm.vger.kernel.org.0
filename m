Return-Path: <linux-arm-msm+bounces-100829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEPvA1Ohymmx+gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:14:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC5035E8C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:14:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4306B305F068
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77185377543;
	Mon, 30 Mar 2026 16:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d4JbjguK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C1D37702A
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 16:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886511; cv=none; b=mPSY4Ze9fLBG7en0uuMFJZikavbAzChW34+iVo6brY00PB1e6SZEqflYRx2YMpapWrDlkoajWH0BegbDWM/sBDIL8/E8eHuLDRG40rvvQGgmjHjv69HLlg0TiP0Ks0Tt7h2KHQYThCYRb3gt3vBp6i4sHx3AXfR12HLjksbElkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886511; c=relaxed/simple;
	bh=LvrLD+spXmrClwqA+L6Yhr27YNdiZsdQLSgLkhee0Yw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n3xt18i5xb4GrMjG0w4IcolCVX3LyoHOBcT2raiXZ0eY7bh2yN9Z9QF+aoI5UtxPYIojhRDa41G6ymQ1Si3Xeab2xXtNpimhK53WZpllLkledQzvcK3CLGwO0FEJVe2TkjhITxrYxiW2r/3OMp6i27GjOnx47LE44cuyN1NmiMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d4JbjguK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3F13C2BCB5;
	Mon, 30 Mar 2026 16:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774886511;
	bh=LvrLD+spXmrClwqA+L6Yhr27YNdiZsdQLSgLkhee0Yw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d4JbjguK1sTaBB+JyOANkd1plp4LNSAVZC5H+/v0UjFok31jjkXL6cHgMgb/7gevt
	 GsSFhKTpZMjJHf7OdW1Rqax88b9jCcc41bo5czRdK/O1dxQ3garxMqN+I7OSDJas6w
	 k/6LVcK8CTbG4nERiKGHloIvVYWXiR9EopOZP32BxZnB5jO/OuL6SNWjbypN9k36En
	 9lEIQ8ZCEa7kCpzUcfYToFaihPE0IYl0DjAVpHdIBKuBf7iRJsxVkc1TQrYru5cBax
	 Vo0brakSX58Ngd+ykJf5AnHYVNnfCsx6/TJN00PjspA3L0ZEZdYj5k8NCVgyd4WjrI
	 OJhDAn/E0ZzsA==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org,
	Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: alok.a.tiwarilinux@gmail.com
Subject: Re: [PATCH] soc: qcom: aoss: compare against normalized cooling state
Date: Mon, 30 Mar 2026 11:01:10 -0500
Message-ID: <177488647754.633011.17028749657946704781.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260329195333.1478090-1-alok.a.tiwari@oracle.com>
References: <20260329195333.1478090-1-alok.a.tiwari@oracle.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100829-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0AC5035E8C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sun, 29 Mar 2026 12:53:23 -0700, Alok Tiwari wrote:
> qmp_cdev_set_cur_state() normalizes the requested state to a boolean
> (cdev_state = !!state). The existing early-return check compares
> qmp_cdev->state == state, which can be wrong if state is non-boolean
> (any non-zero value). Compare qmp_cdev->state against cdev_state instead,
> so the check matches the effective state and avoids redundant updates.
> 
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: aoss: compare against normalized cooling state
      commit: cd3c4670db3ffe997be9548c7a9db3952563cf14

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

