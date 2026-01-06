Return-Path: <linux-arm-msm+bounces-87689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FBCCF8705
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 14:14:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6AE50302DB16
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 13:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C36A32F757;
	Tue,  6 Jan 2026 13:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GyNviI+U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DE932ED4E
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 13:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767705250; cv=none; b=STtSX010vVyyHcZf245m7vqOa+dYieykPh+NE0uk1pAkBl1QkTZXiL6Etqu7KRp1TtGRxR1kh+ZxZ/0KwEVXw41QN7M9Z1ZkPOwp2bJKuSUEzhbuAZhzu5h8zBZopKzSszS77ueqtz6kacHA13vOo0wUjDBQmyptGcawhWk6NHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767705250; c=relaxed/simple;
	bh=nC++is+4QXwUI5iSYdNMu1MDD0VLbs8ePEZijbHEydE=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l3pW5D7c9HLW+dVNDQ4couF9pI2p8GQ2R4etnXEtqOH4AV8JT4XNQ6Olnesxr38gpiIEnpzY+SfkwwNtiaY3FSezN6odrlEdKsm3V6X1D97YVRNK9371tKmgZVbLn+JFfqJJ2KLCO4QjovOgqiArpFsMnTzOA4qdcwD+utJGtVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GyNviI+U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 147BAC2BCB1
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 13:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767705250;
	bh=nC++is+4QXwUI5iSYdNMu1MDD0VLbs8ePEZijbHEydE=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=GyNviI+U4IXoI6koWqBInD82Z+s9kh76Bp5OAYR/LJWNO9nZzMMpuknfngBnZuPjK
	 8w8YSamiMehNKkQz3bL/knOXb1KKZm7k8G/vUoBZzbhOKEjfNV6ixmrsstvxXe9rzG
	 ZHFhy4HIlHJ50YxXCSJHNkdfmPLix46NoFIWoNhSoc7GI9jRvjYT3xbUtRGbr6dKaN
	 LlrJaCPn/7gaKIEDqd/0Tf0JfcIpL729uFS/wFea6hjlS/AUalBMunIavcUMzWW8yS
	 sW+5n47Mt0sRS5UXL2A8kNuMjh0g7lKY2CxLhLV3MChZqoQgc/iVL+c3XCsIvw+Mgo
	 +WYL/zwbxvdGQ==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5957db5bdedso1084362e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 05:14:09 -0800 (PST)
X-Gm-Message-State: AOJu0Yw54Xik64xMSqTpJSdunnaghBznLEhlIb4u7bEc52y9/OHGppMl
	3iWBiHk5Ypz9vOlOwJEefNp6SN/KEjzwqu2vEaia/WxqFXCmTmCUtj5aCB/ubddul9/5bZvpxox
	SGZ46i18VBoL63UFgLEPopvI3NhDoI7XAFRuOEA4KFA==
X-Google-Smtp-Source: AGHT+IGcGDA8Llc80iencQs/sCykJmzdRFCipXuPlugybugI0ANGugm+zjLzxWU6J1uC3lSDytaTshHL2dN6RhD6JGY=
X-Received: by 2002:a05:6512:ad3:b0:59b:6bd6:6679 with SMTP id
 2adb3069b0e04-59b6bd6800dmr262890e87.3.1767705248737; Tue, 06 Jan 2026
 05:14:08 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 6 Jan 2026 07:14:07 -0600
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 6 Jan 2026 07:14:07 -0600
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260106031223.499706-3-shuai.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260106031223.499706-1-shuai.zhang@oss.qualcomm.com> <20260106031223.499706-3-shuai.zhang@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 07:14:07 -0600
X-Gmail-Original-Message-ID: <CAMRc=Mc+M97Wuh+TDT4do_NU8n9p3y4G73zMAoFAZ-vAoBtZNA@mail.gmail.com>
X-Gm-Features: AQt7F2rG0mnbLXwReWI7Tw7_xuZKMmb-_StHxrHV038RgsOE0Tt1NStdn7krSug
Message-ID: <CAMRc=Mc+M97Wuh+TDT4do_NU8n9p3y4G73zMAoFAZ-vAoBtZNA@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] Bluetooth: btqca: Add WCN6855 firmware priority
 selection feature
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com, 
	quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com, 
	jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Jan 2026 04:12:23 +0100, Shuai Zhang
<shuai.zhang@oss.qualcomm.com> said:
> Historically, WCN685x and QCA2066 shared the same firmware files.
> Now, changes are planned for the firmware that will make it incompatible
> with QCA2066, so a new firmware name is required for WCN685x.
>
> Test Steps:
>  - Boot device
>  - Check the BTFW loading status via dmesg
>
> Sanity pass and Test Log:
> QCA Downloading qca/wcnhpbftfw21.tlv
> Direct firmware load for qca/wcnhpbftfw21.tlv failed with error -2
> QCA Downloading qca/hpbftfw21.tlv
>
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

