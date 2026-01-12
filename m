Return-Path: <linux-arm-msm+bounces-88573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B77CD12E1C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 14:46:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5BA43011EDE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 13:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F01C35971B;
	Mon, 12 Jan 2026 13:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="e0JTEjnJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72F2330339
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 13:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768225496; cv=none; b=b3qPECqmXeSZJcG1LeCXinJJ0smcmFNlq6/YmL3cGU+uBuoLamdZ6KkK8W57UaQfATic4hFrVRv2o6hBVFIqBVF/h+gn3xMcEvEN63DSM7A/zVyOAi3bd4GArruX3K1Qs79v+kJOMUVlBJz+VI1QVCwfSPlRek8uHocWNE4WHck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768225496; c=relaxed/simple;
	bh=jyOlQPaEAbxKJQPNNE2x1fQ6zeWwS8Egul3icukJIFA=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rgU128WEydJbXPRsYER2FlPyqZSxecF5sTdUalVmF0QG4enk75fA3rTgQj0x+N/KUKtq+SVzrn8ob095SAhl/QH22GALEScNlqpdwUd0Y7yWvvhfmk/xpFZMsYEmoh5TtmsQTR57QArycGIucap+i6SRJy1mCSiYNB23OlRAWSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=e0JTEjnJ; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1768225486; x=1768484686;
	bh=jyOlQPaEAbxKJQPNNE2x1fQ6zeWwS8Egul3icukJIFA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=e0JTEjnJjvcXY8YjYFrJFkAz59n4OnO5/6vlN05GjWbWR1UYIoyiEQZoCC1unLD6g
	 B2aZpyav+R7WbcV86W82XD6nedqkHyo18jgZE+pwBEQs4oxUyXVVjvLwOcxVtBfqsu
	 oP5rkfsJX1oZRwyZzyELfxJNm/rp2gLeupLpnBVM6RWF4twoGlnwc8Hu6kw5nE6xGh
	 CkqFgDGit6FciocnFgTEn6GG/+QMUJxvq4szX6ILq2TjaSBMMHNrDRtYTq5/uq8Wsy
	 eRtj6qrUR4SyWYXrDO9hHfH8anTZVljzMFBZL63lf2un9eSu6ApnnT/8xry+yB2CDM
	 rIgVGxQf4G9+g==
Date: Mon, 12 Jan 2026 13:44:42 +0000
To: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
From: Alexander Koskovich <AKoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>
Subject: Re: ath11k WiFi bringup on Milos SoC
Message-ID: <GaAXo-kja7_AolEgL2WpSAHlmV31nfKF1eSZT3MxICsKqQ4tBZFfzLhNB3-DmTHsTH_e-bwVR69U2Mo0OBbu96NDZYSAPXFDkZBOEUz0S-o=@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 09b0fbf707bf035f27c0fe50a26945130519c9d0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

In-Reply-To: <DBF7OWAWQ94M.FSCP4DPF8ZJY@fairphone.com>

Running into the same firmware assert on another Milos device w/WCN6755 tha=
t is running WPSS version WLAN.MSL.3.0.1-00156-QCAMSLSWPLZ-1.122511.2.12736=
3.2.

Would anyone from QCOM be able to provide more context on what situations f=
irmware would assert whal_wmac_transition_to_fw_control, or is it a catch a=
ll?

Thanks,
Alex

