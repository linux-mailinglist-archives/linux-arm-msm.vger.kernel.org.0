Return-Path: <linux-arm-msm+bounces-47523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 532E8A3057D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 09:15:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BF7C3A7344
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 08:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E79B1EF08D;
	Tue, 11 Feb 2025 08:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=Usama.Anjum@collabora.com header.b="HvnVlaZa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377A21EE031;
	Tue, 11 Feb 2025 08:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739261745; cv=pass; b=cJ5om75DlAaGENb7phIcfEMCaBEKgOqacF7LDznf5Ny+CfeM4vo6oNsO3nWzb/Zfkx81Ie/6YHpP9BOCCxalv7OdEb+gQLjeLAAzsDucOFTd5HwesjFE0ZqVczTNLWrMwUeZVgOgHcHDtP8VdOlFCRPNkxSS3KcfN4J92Fq3ef8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739261745; c=relaxed/simple;
	bh=ml9HCLFnHj3okZfENU5PWNu76H5yibO9VbLtc/Rw0KE=;
	h=Message-ID:Date:MIME-Version:Cc:From:Subject:To:Content-Type; b=sOwr8ROwmwcWGhqD6wzFIxnhtwd2ZCujXDhjeDHTwoUQEFReJn/qYxXYTcv9bDAruGrPkTWiJNUNW1h8PW9nerVXhsbZe4FRIgF2Jf3anIw3gV3y5ncaOudiEJ12VpZ6feesCPwxR2DSMXXu0qlVao7MbMz7uphPnJuWl99XNgA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=Usama.Anjum@collabora.com header.b=HvnVlaZa; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1739261723; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UGPx6GsCZ4qC2x55GioKK9jhZ4XcOAQhBYpk1HPuJcKFfIoQ+CusgVxAZc/n4Ajcr03BfWVFPIBpyEx5OhBzPZbyMsMab/FyMbonI4E/ZiYYnrglITikLTy4/fraTretrYrFQedBKJzJe7LralxjDapL4HPU9mEjor8bb5hOxhE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1739261723; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Jm2+B3dC9Go2CBCBCYErvWv91+CAUXIZB+j0be0w8Fc=; 
	b=GHJIVZsZ7anm0JxHe69Z9GlJJBFfIpDJd24M3kZWYYjdowqg9UMcWn03BqYHtHTFMPHlhZo8XiMOt7S47cRcO0TO68yL9DObmLBhm1pZsb1/Pf0DKSkTPVqQNPWYIU2VxD3Pe7TefJd5DCryl+l1PL4sH3SE7PG1sGcVyikoJeI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=Usama.Anjum@collabora.com;
	dmarc=pass header.from=<Usama.Anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739261723;
	s=zohomail; d=collabora.com; i=Usama.Anjum@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Cc:Cc:From:From:Subject:Subject:To:To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Jm2+B3dC9Go2CBCBCYErvWv91+CAUXIZB+j0be0w8Fc=;
	b=HvnVlaZaABEpZRMUDfS656mZSHd3yqfW/qACeoH9MdwFui+vy9u3FasRnBzOqame
	JE1eP+c1fEdG7RFH3o4ztcm5UpTN9QT2adnfp+SRmGMC8qmyxwwol+/5+PBgzCw89Bb
	lr6rmaS/v+7lAcb2wBG19dn54pNQeGXwa6a+zvFg=
Received: by mx.zohomail.com with SMTPS id 1739261719547543.4080545437324;
	Tue, 11 Feb 2025 00:15:19 -0800 (PST)
Message-ID: <59c036b6-a3d6-403b-8bb0-566a17f72abc@collabora.com>
Date: Tue, 11 Feb 2025 13:15:55 +0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Usama.Anjum@collabora.com, linux-arm-msm@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
 kernel@collabora.com
Content-Language: en-US
From: Muhammad Usama Anjum <Usama.Anjum@collabora.com>
Subject: [BUG REPORT] MHI's resume from hibernate is broken
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Johan Hovold <johan@kernel.org>, Loic Poulain <loic.poulain@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi,

I've been digging in the MHI code to find the reason behind broken
resume from hibernation for MHI. The same resume function is used
for both resume from suspend and resume from hibernation. The resume
from suspend works fine because at resume time the state of MHI is 
MHI_STATE_M3. On the other hand, the state is MHI_STATE_RESET when
we resume from hibernation.

It seems resume from MHI_STATE_RESET state isn't correctly supported.
The channel state is MHI_CH_STATE_ENABLED at this point. We get error
while switching channel state from MHI_CH_STATE_ENABLE to
MHI_CH_STATE_RUNNING. Hence, channel state change fails and later mhi
resume fails as well. 

I've put some debug prints to understand the issue. These may be
helpful:

[  669.032683] mhi_update_channel_state: switch to MHI_CH_STATE_TYPE_START[2] channel state not possible cuzof channel current state[1]. mhi state: [0] Return -EINVAL
[  669.032685] mhi_prepare_channel: mhi_update_channel_state to MHI_CH_STATE_TYPE_START[2] returned -22
[  669.032693] qcom_mhi_qrtr mhi0_IPCR: failed to prepare for autoqueue transfer -22

This same error has been reported on some fix patches [1] [2]. Are there
any patches which I should test? 

Is officially hibernation use case supported at all?

In my view, this path may not have gotten tested and can be fixed easily
as we need to perform, more or less the same steps which were performed
at init time. But I've not found much documentation around MHI protocol
and its state machine, how is mhi state related to mhi channels support.

PS: Just some information, my device has QCNFA765 endpoint and ath11k_pci
is being used. It doesn't seem like the problem is in the driver. The
problem is on the host side which isn't able to communicate correctly with
the endpoint. The resume from hibernation would be broken on all wifi
chips using mhi.

[1] https://lore.kernel.org/all/Z5EKrbXMTK9WBsbq@hovoldconsulting.com 
[2] https://lore.kernel.org/all/Z5ENq9EMPlNvxNOF@hovoldconsulting.com 
-- 
BR,
Muhammad Usama Anjum


