Return-Path: <linux-arm-msm+bounces-85331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4507CC27D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 12:58:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 131523068030
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 11:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9858435502A;
	Tue, 16 Dec 2025 11:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="p6r5CWQl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C876C355029
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 11:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765885923; cv=none; b=ktIMp0AnLFqGimyLPmAYRCE0eKQkQ9y5l1wgmtukoJvEqcXmwWODRjsG3iM50gbeaeruGctJT4GUJO6ym2R7TbczYgvY7gFKg+KScNrB8aD/a48asSvdXlpe6fDXTJyziyqiX+FuLwEtw8+ninz1vGj0W9xPfHC7j/58R2GjzdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765885923; c=relaxed/simple;
	bh=p9F4GcFHlAXABUbtPnLKwP+GMx/w/yDy45+0pkPGpuc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s54T4sdqGZMNaHOKSACmEr+fudHksoW9Ppdj7JhDdfvEpaLiKCxJK2dOzjgtY1eP0a54nDhSftIfN5a6rUSPS2p+pCulYaRYorO9Yu8HfGuTXAm2NclgsyxY2EV9AZauyqxTc8ePYasH4EqK9jqnNTTESprI5rEliovl50TD/Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=p6r5CWQl; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1765885914; x=1766145114;
	bh=p9F4GcFHlAXABUbtPnLKwP+GMx/w/yDy45+0pkPGpuc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=p6r5CWQlMV1Dzz8z96/UK09CbRjuDVIg0ro9IQkINDZQg/010iDNnSf/sPmJ7ctRN
	 Ry8ANYNLQIvYW9ZRYZrFmTEEZmSBg3WRoDnmffk1R54iEaHzpqBxmzc/NVoPddoBaD
	 PVoQyjtjFo2DIpy9qFx1ua3hsKDTwApVNaqXLSa9l1DvYtmrFMWHJ+nd8KNEFvT0rG
	 odJF59LYVrc9bB6z3N7q6RIjw9KaV6hWynJuMIusulImXH9iREOij80VNOtVUQUJfr
	 21PvO4QU3UQfieqv1qLtIl2FaJeQZJwLR5Lm4ADW+k1r3u5fCUZ0durcTB3ZGirqJY
	 A7EmWnph53Mjw==
Date: Tue, 16 Dec 2025 11:51:51 +0000
To: Luca Weiss <luca.weiss@fairphone.com>
From: Alexander Koskovich <AKoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: pd-mapper: Add support for SM7635
Message-ID: <Mgqv3VYOWT5axB1qc9YhrLZJtPWCQU8vYPFaT5FSGINrTnPw6fHnaQh6vt4pG_55q1Se9OUD3QOSIGSDVPMP-nKHSx3hvVt9Ag491VLZoD8=@pm.me>
In-Reply-To: <DEZJ21VS5IHE.113Y050QAKJZU@fairphone.com>
References: <20251214074736.2147462-1-akoskovich@pm.me> <DEZJ21VS5IHE.113Y050QAKJZU@fairphone.com>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 6ac0252433db1fad1441d0d9be37848e28719fd5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, December 16th, 2025 at 4:18 AM, Luca Weiss <luca.weiss@fairphon=
e.com> wrote:
> Not sure what tree you're using since milos is not fully upstream yet
> (waiting for maintainers...), but worth checking my tree before
> developing commits in your side.

Sorry about that! Was referencing a stale tree and didn't notice the change=
 already exists elsewhere, will drop this patch.

