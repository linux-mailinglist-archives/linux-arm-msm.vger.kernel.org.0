Return-Path: <linux-arm-msm+bounces-106486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDoDOjC7/Gm6TAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 18:17:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A1D4EC0F3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 18:17:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6CD253046EC8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 16:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFF3044D6BD;
	Thu,  7 May 2026 16:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qwsGN46P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B37C44D68E;
	Thu,  7 May 2026 16:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778170226; cv=none; b=tkNajqOJgmqAAAw50wteE8HLdDfkBk4OAeEMBG320lsPDlMJNpdbjeVyhYX3YxAFL2ahA09MOPPdCJTU/LzLpTFrdTmyf+J2y3OCBiSZZYN0KXiiNrigLTD56QJ69JlHVhgMIRRZGY/sJ9iM2yX7kwpiOcivbt8DqA2g78LcXy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778170226; c=relaxed/simple;
	bh=dgn+jjgJKPGC81JPFtn2yoqRYAjX19lpvF99R30744o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Japx6tWIjUkHO6/62JfXUVHxzMI/4/axm3hwgYAhXGLw5Je41x2/K1JeSrlTjLwRTDC/IU19hy4cQt3pTSr2vtrlBtEvKJcEn2ueXPeAgAUau573CCc5U9IGQhw8xqQ3+EVnS/HUPaBsrAemL0xzX5BcjSSIpHyQ9veCsFhTLq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qwsGN46P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0DB1C2BCFA;
	Thu,  7 May 2026 16:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778170226;
	bh=dgn+jjgJKPGC81JPFtn2yoqRYAjX19lpvF99R30744o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qwsGN46PFRhYO7poMmpih4+1qMa8SFLcZ91atZrJn0+ktmx0WbquPAjVu6dKcwNra
	 9I6UQczo25a9b1tZgTLUf0SP+4S9I6EwDjXEGpPi9SafuKyUy3J/GFuYh2nTvIxPjw
	 fxO5GtfXkyG7mIkn6/on7rCe7fopAB2tpjbHMaHq7sVlHFaVq9aYMXspYNfPHDi4ou
	 17KdqkiDgDZmEkbMA3+AKVkgQOZLgfQlogIHsRZYfXuwyqnPxbj5Wd8TMDYHIghVj9
	 hfZGOawq+wVDLrrZYCyp6CSnLPRYXpLxcSWhjF+7OY6B+asME3Tp8qDwAyUbcnMhnS
	 tA8k/xsv+nR7Q==
Date: Thu, 7 May 2026 21:40:13 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: manivannan.sadhasivam@oss.qualcomm.com, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Shuai Zhang <quic_shuaz@quicinc.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	Wei Deng <wei.deng@oss.qualcomm.com>, Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, 
	stable+noautosel@kernel.org, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH 12/12] Bluetooth: hci_qca: Fix the broken BT_EN GPIO
 detection for Qcom WCN devices
Message-ID: <xinajhircn4zqrap6mqzveettm7q5uhhzt46mocmkckp534gse@ogdvbjleeczy>
References: <20260422-pwrseq-m2-bt-v1-0-720d02545a64@oss.qualcomm.com>
 <20260422-pwrseq-m2-bt-v1-12-720d02545a64@oss.qualcomm.com>
 <klxyhlqwzl6dzk76lrhugxqdsv4hushphlfchuorcmvx5yja7q@pdmp3abepldg>
 <u65dquj6im54rc6w5apmq2a6mcpndvh3slcxbjh2bs5el7epw4@zjovdsjkm6ur>
 <CAMRc=MdvhMBpunaitGv7yv3sTqkTYviaeAJzphTS5dBUOFPpHw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdvhMBpunaitGv7yv3sTqkTYviaeAJzphTS5dBUOFPpHw@mail.gmail.com>
X-Rspamd-Queue-Id: 61A1D4EC0F3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-106486-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,holtmann.org,gmail.com,quicinc.com,vger.kernel.org,intel.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,noautosel];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 09:55:16AM -0500, Bartosz Golaszewski wrote:
> On Thu, May 7, 2026 at 1:59 PM Manivannan Sadhasivam <mani@kernel.org> wrote:
> > >
> > > This will break the case of WCN399x devices without the PMU in device
> > > tree. There is no enable-gpios since BT is not controllable, but if
> > > there is no PMU, then devm_pwrseq_get() will always return
> > > -EPROBE_DEFER.
> > >
> >
> > Hmm. I missed that the pwrseq returns -EPROBE_DEFER even if the client doesn't
> > require power sequencing. It is because, it has no way to figure it out.
> >
> > But I think the client can parse the regulator phandle, reach the regulator
> > parent, then check for the '-pmu' suffix in the compatible to make sure that it
> > has the power sequencing requirement. Then it can call devm_pwrseq_get() only if
> > that check passes.
> >
> 
> I'm wondering if we could maybe provide pwrseq_get_optional() that would only
> really be optional with fw_devlink enabled (where we'd be able to ensure the
> provider is probed before the consumer thus be able to tell right away if the
> device is power-sequenced or not) while with fw_devlink disabled, it would
> just behave like pwrseq_get() and return -EPROBE_DEFER?
> 

But if fw_devlink is disabled, then the consumer drivers cannot rely on this API
to decide whether power sequencing is required or not. IOW, the error handling
would be broken in consumer drivers if fw_devlink is not enabled.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

