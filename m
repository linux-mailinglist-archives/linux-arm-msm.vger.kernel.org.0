Return-Path: <linux-arm-msm+bounces-90694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOoFC5aReGmirAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:21:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9066092ACA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:21:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C7DC31A2A90
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 10:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47EA42D94B0;
	Tue, 27 Jan 2026 10:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OH13AhpE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F022E1EF8
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 10:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769508921; cv=none; b=Sth9lFVWMgcMcvVBxHej4Vr0DUHqsQEkUJWtM3v6GcBEYJQB6li1RHdYedNbLsEY89cK9t+JoHV9PzQscmA48S9tD2jRyZOjo5mu/D2Bx8hhSgXrHr4eozEZYne4kFT63Ol01bL+q14Dxho49f4kC6kpebtfDqf7oD5T8pAJVmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769508921; c=relaxed/simple;
	bh=bQ3xaa51ZQdVxNW+sMkb28nQ+48svHKlV0RBkNj8eKs=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MEVHJm/O3LaQo9ggrZH7Rjnu+u1zzg25cBKe6ZlAOikjcj+2KoKfbaiQ758bOkR/+YHoWmEXmCh8Msq1YAI8OWaKM8kSnm24dmxXXowYUqgSLCRtMaBvCsrYqKW+T+zFJ0N+Nz8qJkwYHyyeshumE80kOm840QHXZnkEvwuizME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OH13AhpE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2F34C2BCB2
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 10:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769508920;
	bh=bQ3xaa51ZQdVxNW+sMkb28nQ+48svHKlV0RBkNj8eKs=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=OH13AhpETYi4yE15YbaZf3ow/tdCBuLfFfyMtLcXTmTJ9gZXZY8AKjtph8RfJ40WF
	 VdxzlbNqtLWTSLzimgxIigFMlS6yzkkV9e8nA5LUg3wL0CUQ27AZVQFcB+ofpZ66gm
	 61/K52en3F3LOqNrXVGkNX85CvGm6wMwJkU30aZGJhmp4jSsMOgZZ3xMohpgczyVa+
	 nydMSNHC4KDMpGYAy7sKNwizOX5+SA5qGEN65qWNwc7P//R5+nWBQ1lqlEaXtEeeAE
	 MBYMXwrsNgOA1whTwy4BqoFpcg5NJBaIeFrFgQNp/ra+2hTdvlzzH8hyzLWpwfwIJh
	 NheyxYAzVziMw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59dd9aef51eso6210359e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 02:15:20 -0800 (PST)
X-Gm-Message-State: AOJu0Yzf6XQ77tOEvUEjOJT+6PTWqc8qkCdxKcXd2qqb1xHisSq+PXr0
	oL41hUUbLjXk0frZKCJodk0ErxhKc9Ye/lKghf7Ba78/bhozmSCoz6g0Kw33fAAlQgjaYxA33kL
	wOAMp3fUod1Cjf3ojyKBnCPtPNrFQpm7EiSUWyAB8ew==
X-Received: by 2002:a05:6512:3b90:b0:59b:6d49:233f with SMTP id
 2adb3069b0e04-59e0412d009mr560326e87.31.1769508919455; Tue, 27 Jan 2026
 02:15:19 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Jan 2026 02:15:18 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Jan 2026 02:15:18 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260127025423.1418207-2-mengshi.wu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127025423.1418207-1-mengshi.wu@oss.qualcomm.com> <20260127025423.1418207-2-mengshi.wu@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 02:15:18 -0800
X-Gmail-Original-Message-ID: <CAMRc=MeZ49wU+FsQQS8S58N4gObEWhtEqvfo91tpxdY7mmh9pQ@mail.gmail.com>
X-Gm-Features: AZwV_Qj4SzOnq8ZA0FvuOvcJPHa2wbB2nzhgeIGsc7TxA6Xd59iy_PV-jMlz96c
Message-ID: <CAMRc=MeZ49wU+FsQQS8S58N4gObEWhtEqvfo91tpxdY7mmh9pQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] Bluetooth: hci_qca: Refactor HFP hardware offload
 capability handling
To: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, shuai.zhang@oss.qualcomm.com, 
	cheng.jiang@oss.qualcomm.com, chezhou@qti.qualcomm.com, 
	wei.deng@oss.qualcomm.com, yiboz@qti.qualcomm.com, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90694-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,qti.qualcomm.com,kernel.org,holtmann.org,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9066092ACA
X-Rspamd-Action: no action

On Tue, 27 Jan 2026 03:54:22 +0100, Mengshi Wu
<mengshi.wu@oss.qualcomm.com> said:
> Replace SoC-specific check with capability-based approach for HFP
> hardware offload configuration. Add QCA_CAP_HFP_HW_OFFLOAD capability
> flag and support_hfp_hw_offload field to qca_serdev structure. Add
> QCA_CAP_HFP_HW_OFFLOAD capability flag to QCA2066 device data
> structures.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

