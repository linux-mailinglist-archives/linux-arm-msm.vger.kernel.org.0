Return-Path: <linux-arm-msm+bounces-66532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E279B10AE8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 15:06:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F0521CE20CC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 13:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08B272D4B7F;
	Thu, 24 Jul 2025 13:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aBZh+X7o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEED2D4B5B;
	Thu, 24 Jul 2025 13:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753362306; cv=none; b=mdYbQ2kHspUK8zgsGKP2Yt1ohXCfi5Mu46ocrpXgurFh78OC66xKJVezoEnm93DYZBkMaWXj5pExJzhOwnjW7+s26u/mFW15yiZ4Oa3+Rkgti2H7PdspAi+1KOOb2O4YGadjansgb54AVfBEBKZPrXDmuUV29NSsanKULoop+GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753362306; c=relaxed/simple;
	bh=Q1M7rUk/zeWhNlVryKPIwglcePBptr3tLbsLHsZs6K0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ogHEhJzM0+3QDlKOUtDLBK26ZxsUIULYMVXnV78EqaF180IH1o0B2eCQWOoPCpgQ4rmiTcRnQSlXVjm33ADWRFcqkr81D3GOh9WHqep4tYfgL4p16p/qOJNE0BSsCrJctJ61Zymu/txVhDXjAEHXPikgRlCo2+DJPljqB4WWHKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aBZh+X7o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFE78C4CEED;
	Thu, 24 Jul 2025 13:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753362306;
	bh=Q1M7rUk/zeWhNlVryKPIwglcePBptr3tLbsLHsZs6K0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aBZh+X7oQ9nXyLU8BjxDHXR512PcxsspoDQ/hBwPJ3HG/5Cp3rc4oRPdIYOHfdTQB
	 JQlrES4CG9W9bAjPBvrZT59C8VL6y+s7qD77yiGlxHZ/u2Te1UXLQl6gXpDrvLIPec
	 c3btQDXbCbnFf8fk4d67KclC4lAD+RKlLYn18fskYaYu1Oc9dukcTV1d+aGDQ705OR
	 ebt5ltum2Vd6FCO6MkFt/ZXX4c6Q4ST5aex60ovaVxMIJ3hO+LdofmYMg4NiN+DZZo
	 mU3gKTYOo38r57tNBY/hX75Qz/A2CLemtZFwOBGJPGwWPkG3e+5KgRxcEjpzJnrTXn
	 W7Aety60KQjmQ==
Date: Thu, 24 Jul 2025 06:05:04 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Mihai Moldovan <ionic@ionic.de>
Cc: linux-arm-msm@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
 Denis Kenzior <denkenz@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Willem de Bruijn <willemb@google.com>, "David S . Miller"
 <davem@davemloft.net>, Simon Horman <horms@kernel.org>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v3 04/11] net: qrtr: support identical node ids
Message-ID: <20250724060504.0cf21669@kernel.org>
In-Reply-To: <8fc53fad3065a9860e3f44cf8853494dd6eb6b47.1753312999.git.ionic@ionic.de>
References: <cover.1753312999.git.ionic@ionic.de>
	<8fc53fad3065a9860e3f44cf8853494dd6eb6b47.1753312999.git.ionic@ionic.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 24 Jul 2025 01:24:01 +0200 Mihai Moldovan wrote:
>  	spin_lock_irqsave(&qrtr_nodes_lock, flags);
> -	radix_tree_insert(&qrtr_nodes, nid, node);
> +
> +	if (node->ep->id > QRTR_INDEX_HALF_UNSIGNED_MAX ||
> +	    nid > QRTR_INDEX_HALF_UNSIGNED_MAX)
> +		return -EINVAL;

missing unlock?
-- 
pw-bot: cr

