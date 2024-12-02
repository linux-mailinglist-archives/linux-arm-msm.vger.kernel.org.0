Return-Path: <linux-arm-msm+bounces-39928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7229C9E0937
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 17:59:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54621163471
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 16:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EF401D9A42;
	Mon,  2 Dec 2024 16:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iqetGy2w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731001D86FB;
	Mon,  2 Dec 2024 16:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733158266; cv=none; b=EbJ6oEKhwZtlv1o4Ioda8lQ4FhlsM6crkYmXmui6n4+K436fM+ptZCwZ4fSHgNfKM7hZO98dtI35Coi5gb3F3ZqWONOQwtmLIG6xZ0kiRRH9/rZsWTxAKJVIKWVJmYl+yrY7oACIe26jWnsU544yK7yb6ZAFcf06rOWgG0DcHeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733158266; c=relaxed/simple;
	bh=7SOQpcERUpWNCO6DfB8JnkTi1uPdgkPFL0MjAUUnaKc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=B1Icd6vg5qLRkMh07Vjp/sLIs7M0i2beiFwejcEr4gW+gauaCP1XhNWkPGkK6czpH0o1/9ykOmSwl9Ge7qxneXRH33pbPgsl5JNozA1LLa6tJlUKD6EZw2cjR9JK9fCeDwDnqKAQweup/TKENo+zfNFMYFXBx+VPhxTE4nlfB5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=iqetGy2w; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2A50740005;
	Mon,  2 Dec 2024 16:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733158259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7SOQpcERUpWNCO6DfB8JnkTi1uPdgkPFL0MjAUUnaKc=;
	b=iqetGy2wlWIUvFBZdDt0uwmyZlhxoPXhMpKYn9pyAq2hC3uhUGeWaD5Rld2MDnCnqWeysw
	4qxpoG9cFfAoiuOHvUTSPfsi7tLtMgM+k3CkQ/nXw0NotmOLaPP7/0j/56IpTG/w1T5lGY
	Y00O7BE9e5BEAWqc2t3ouhisBQW8kNY3z1Y4IKb4UxqyUYBlCeKh9OSUPqPJn0E+TQNCWb
	aO+EXdNYnRPgZsZ0UmOEuiopFha27qVeUU1poqelkSqnQW1+VM9zL6q4UvDp+NnD7gfDIV
	YbEtZHBprLTWjWxh0QV8Vxwrd8xF4gcWzzwZNM1WEsfLMLgulxQZHb4Qcx4UfA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: <manivannan.sadhasivam@linaro.org>,  <richard@nod.at>,
  <vigneshr@ti.com>,  <linux-mtd@lists.infradead.org>,
  <linux-arm-msm@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <quic_srichara@quicinc.com>,  <quic_nainmeht@quicinc.com>,
  <quic_laksd@quicinc.com>,  <quic_varada@quicinc.com>
Subject: Re: [PATCH 0/2] QPIC v2 fixes for SDX75
In-Reply-To: <20241119092058.480363-1-quic_mdalam@quicinc.com> (Md Sadre
	Alam's message of "Tue, 19 Nov 2024 14:50:56 +0530")
References: <20241119092058.480363-1-quic_mdalam@quicinc.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 02 Dec 2024 17:50:57 +0100
Message-ID: <877c8i6nbi.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com


Hello,

On 19/11/2024 at 14:50:56 +0530, Md Sadre Alam <quic_mdalam@quicinc.com> wr=
ote:

> These patches will fix the following:
>=20=20
> 1) onfi param page read which was broken by exec_op() patch.
>
> 2) Fixed offset passed to BAM from QPIC base

Would you mind adding Fixes and Cc: stable tags to each patch?

Thanks,
Miqu=C3=A8l

