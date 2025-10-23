Return-Path: <linux-arm-msm+bounces-78550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D573DC00A4C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 13:11:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B83D3AEE9A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 11:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 993EB2989BC;
	Thu, 23 Oct 2025 11:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sitwatch.net header.i=@sitwatch.net header.b="r4LgdaJV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.sitwatch.net (mail.sitwatch.net [51.75.249.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED1A30C353
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 11:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.75.249.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761217866; cv=none; b=eWSq3IKWkLJpAx924en2UgXsm82oHfyJbEdWhpNHSa10gbQkdB4FBivb19+7RUl44YOdpb8axwGoFHqGFTc/lFPU7t2hhHNHHhLBKRifeQWdKU5cVVRk1JAtT6IUXuX91oLVTUPPjjtqPeGWGWlIoWrTftzZx7sqfCBcjrx/Dlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761217866; c=relaxed/simple;
	bh=rMUTVSk637ibKTMKP3Ow2CyA9i++kVJ6vu6dZF9jR8o=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=niJd0z61czjWh8LuZKSu+HHE6jooCmAOvA57CO05qDg0YAIrLx0N1hZCa2HbQXKDBbaSIVduIEIGK7Xe/U6CoEcJJOzefGUKoTNYbjGzX+25zoJ4CM3nr3IzhAgNRAYYFciGMEJ2URVnIPaxh8JR8Y7EHVBlhYzhKt5GoHM+wiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sitwatch.net; spf=pass smtp.mailfrom=sitwatch.net; dkim=pass (2048-bit key) header.d=sitwatch.net header.i=@sitwatch.net header.b=r4LgdaJV; arc=none smtp.client-ip=51.75.249.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sitwatch.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sitwatch.net
Received: from sitwatch.net (unknown [172.22.1.1])
	by mail.sitwatch.net (Postcow) with ESMTP id 0FBA4B0699
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 11:03:08 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sitwatch.net;
	s=dkim; t=1761206593;
	h=from:reply-to:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding; bh=rMUTVSk637ibKTMKP3Ow2CyA9i++kVJ6vu6dZF9jR8o=;
	b=r4LgdaJVZ396LqLNCOMHptVM4SnBR4nBVGqMzg/VdRCtN+Uhx0Ywjht6822L3VxG70kFms
	/LZNG/D+RImn0mUTXTpbzw8mhayHc/rkKQEH0sme1nTf8Puci22shGKIku/nYmkCSpq/c/
	yfNuh7VS3H9EgIukHtsgicPSqiQ9r+/74xGA1EvMlOHfzy3Rreh3RJ1wLnKuaj1htv6cSL
	aYnwovOylKASHxioZTLWXsQ7U9fypmn6B7yekB/zztRXjSMjxTd9Wo4M7p1gndkGaGEicU
	qlo81LIGpVlJ2tPhMEBP1b6CeYgl55ekoFK0eju/t+acTRaKQCfT6X2i2+2C6g==
Authentication-Results: mail.sitwatch.net;
	none
Reply-To: sooan8pos@yandex.com
From: "Dan Malanko"<test@sitwatch.net>
To: linux-arm-msm@vger.kernel.org
Subject: Hello Good Day,
Date: 23 Oct 2025 01:03:09 -0700
Message-ID: <20251023010307.B1934E5E6C5B0A79@sitwatch.net>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
X-Spamd-Result: default: False [0.90 / 15.00];
	R_NO_SPACE_IN_FROM(1.00)[];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	SURBL_MULTI_FAIL(0.00)[sitwatch.net:server fail,yandex.com:server fail];
	BCC(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[sitwatch.net:s=dkim];
	FREEMAIL_REPLYTO(0.00)[yandex.com];
	RSPAMD_EMAILBL_FAIL(0.00)[sooan8pos.yandex.com:server fail];
	SH_HBL_EMAIL_FAIL(0.00)[sooan8pos@yandex.com:server fail,test@sitwatch.net:server fail];
	RCVD_COUNT_ZERO(0.00)[0];
	URIBL_MULTI_FAIL(0.00)[sitwatch.net:server fail,yandex.com:server fail];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_REPLYTO(0.00)[sooan8pos@yandex.com];
	TO_DN_NONE(0.00)[];
	CLAM_VIRUS_FAIL(0.00)[failed to scan and retransmits exceed];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[sitwatch.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[]
X-Rspamd-Queue-Id: 0FBA4B0699

Hello,

I represent a client seeking investment opportunities in your
country through Joint Venture/Partnership. We have available
funds for the right project.

If interested, kindly contact me to discuss further details.

Best Regards,
Dan Malanko

