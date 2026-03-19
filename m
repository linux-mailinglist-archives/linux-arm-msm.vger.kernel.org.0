Return-Path: <linux-arm-msm+bounces-98695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cB0DKWjDu2n1ngIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:35:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 370FB2C8C52
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:35:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 15FC43031AE0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 09:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46BCA366576;
	Thu, 19 Mar 2026 09:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fBq50bJe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239D537B3ED
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773912930; cv=none; b=DQxNnBousTW7NtZiKy39i8HSs8bPuTlgEmQh2pPv6I3lZHlrjlSTW1jsakQQiIklYCiDNVAnnVmw3lLckYvHuicLZZX+nd3NVLDUtnAWGawniFwzrpMU5KMvFhTkruyTf8D/tMnFUQNEfc8mYee0KqwXTCbAgaUsNeVuMRzGXCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773912930; c=relaxed/simple;
	bh=g1LWNtK2afsolgGOeq9xwfIE/uPBToXU24tUFiliqEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F/A60pNWyNdvlFsvwkOVtlQJaRP7PM76Jz02b35C8QhXByYOUDMDhTIYEZcLdX+0wpkpQ1Vth9aHOG3hB1RRoxVLPvxn7sx3EstIVWhntpA4DdkzXpCTPms7SbhPghTXA8vdbSHx2tGKw1r3zUF04Q6GVD18FKCa1NTa051vR50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fBq50bJe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1A20C2BCB3
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773912929;
	bh=g1LWNtK2afsolgGOeq9xwfIE/uPBToXU24tUFiliqEY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fBq50bJer10MVsg4hF03FYSa4cfVWRFeOuhSdcPenQpmfKVw8HF0EysCf4clNm1CN
	 8213qZMkWISXl3/UNIYXMOgazuo3NVRYPVDGfyKQWPS/W8KTjoUPAm6uPOj5PRBgwG
	 qOMvfTdHgXIFfvUUxjM2HTg3bzdekTrHo6/LlajRNI1ejroTZ92rE+jia9TcVi/73v
	 CUMYBB4gPIliJPq2O2O7qXZuo0UwGFPuA8Vk2bsTEi0GyM1HhI0gWUNe4qJz4Mg25R
	 CvXS2xiTVdXZkRRQ7NHJQS9Dzj51dFWSRAc8ZMkFNhnTSAg7j/T+UgGLy8kqxvBt/o
	 x32b4LxflyEOQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a12c19affeso1206385e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 02:35:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX9a7h6TDN2UWdrfYKVdJPzp+riAdfDXZOT8NDMOQz2mMpp3ExaWUgDSlCaD/2xd79Gx9AruqvvPE2ncvJq@vger.kernel.org
X-Gm-Message-State: AOJu0YxgzXPmC7zpZOw9xAqQF2b5qI4aJv+dvvEwiOJG4l5pk0zsG6zW
	HN0LJ+KuVMsqEO0R6Ci98klV15AiWRbnfY3yEvb3H+LwZNVWo7VvAKo44PkPW9tF3MVjrGpIsYG
	RNIu64d1fr8IYRGGS+Kpf+nmH3uTyqRTHtkD0tiNUwA==
X-Received: by 2002:a05:6512:79a:b0:5a1:425b:c7c9 with SMTP id
 2adb3069b0e04-5a27de293cemr556765e87.20.1773912928532; Thu, 19 Mar 2026
 02:35:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319075125.76539-1-shuai.zhang@oss.qualcomm.com>
In-Reply-To: <20260319075125.76539-1-shuai.zhang@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 19 Mar 2026 10:35:16 +0100
X-Gmail-Original-Message-ID: <CAMRc=MdRGdR=FyQHWC7yfAgpAFxiK6QGjEQXVr7mavWLOPS14g@mail.gmail.com>
X-Gm-Features: AaiRm51W5vgNLXZhG86rE-1b9a2hDSmG2E6LDcCJVpoZZZP4XJEsSJ03tuKE5hY
Message-ID: <CAMRc=MdRGdR=FyQHWC7yfAgpAFxiK6QGjEQXVr7mavWLOPS14g@mail.gmail.com>
Subject: Re: [PATCH v2] Bluetooth: hci_qca: disable power control for WCN7850
 when bt_en is not defined
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com, 
	quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com, 
	jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[holtmann.org,gmail.com,vger.kernel.org,oss.qualcomm.com,quicinc.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-98695-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.955];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: 370FB2C8C52
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 8:51=E2=80=AFAM Shuai Zhang
<shuai.zhang@oss.qualcomm.com> wrote:
>
> On platforms using an M.2 slot with both UART and USB support, bt_en is
> pulled high by hardware. In this case, software-based power control
> should be disabled. The current platforms are Lemans-EVK and Monaco-EVK.
>
> Add QCA_WCN7850 to the existing condition so that power_ctrl_enabled is
> cleared when bt_en is not software-controlled (or absent), aligning its
> behavior with WCN6750 and WCN6855
>
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> ---

What are the changes in v2?

Bartosz

