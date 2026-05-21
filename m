Return-Path: <linux-arm-msm+bounces-109140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCHtBxtWD2oFJQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 20:59:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2BB5AB4D6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 20:59:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4004F3048AE8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 18:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92E5438E8DE;
	Thu, 21 May 2026 18:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="Eaq5bZTj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCD43FCB1C
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 18:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779389867; cv=none; b=mrUGa+17/WD755dfY401coIfbBf1n4zOgIFwWSAzjlxwLzJtmu4ae1WDyTZAItdMF5jWME+zCaMMsPwnfBWKKExjFQKINYiY70Ez8jVN1EmsXQaX1zvuD+xc/j7PhHtpa6l2RDFDwXSAM+YnRDB7vcDV0x6PtQNl0zJ8GVm6es8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779389867; c=relaxed/simple;
	bh=B3w0i9V5bl97JOa2L1hL8c+h5c7hpZVhnrbgLFPscKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UxQhLidMGCltntFKW8e2ihLgaghwpGxQPIXId1vH6zDy8Af0rniNLi81Ow5bmacYAmvzMHx5jwqw4N+0wduzQdsmEVpRYp6liAEaHxCVkXu9jte8URuxUGpJGRTjm/DnjzsDTcwMOWcwcLrqAVJn087h8G2ECXX79pDnMMOasYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=Eaq5bZTj; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <094b4042-4b5c-4846-bca8-b55a252e2171@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1779389853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0YtpSANnkp2zn2FkS+SFtM5zFsPa8ciMZpk34UyDk2A=;
	b=Eaq5bZTjVpbuR/DkRDD2gYkUoKkDF/Qy3sddisg+ohbkPtuFjcxMKwTRp430tmma46vj2e
	yf2r9SO1hiMdZCKaUS0dbbMKSMlxUAxiTTsYhO7/LngD8SH1TbW5w+gKb+LhzqYXSCE7jp
	rZnZfPo4sUwVSAGZvO2FQDkPnYY3gPgjcellNrG+n66OT9dNQ7RaJRd7IwBazyTJsGPrRY
	lTfoijMAlimpYXL0nXzuRDAQ/27uvUe9xwm/IEeV73WrC7M8w3zppRcI/83cHgdDq0+Wnr
	zyjqt2z12nWQeJ0q+aJ441LPQ59vh5R7N5qbeQhwSVFFlrJK0vKWKJqvu9adtw==
Date: Thu, 21 May 2026 15:57:18 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Configure DP endpoints for
 2-lane operation
To: Saurabh Anand <saurabh.anand@oss.qualcomm.com>, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_riteshk@quicinc.com,
 quic_vproddut@quicinc.com, quic_mkuntuma@quicinc.com,
 mahadevan.p@oss.qualcomm.com
References: <20260521120058.2966709-1-saurabh.anand@oss.qualcomm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <20260521120058.2966709-1-saurabh.anand@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109140-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[packett.cool:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,packett.cool:mid,packett.cool:dkim]
X-Rspamd-Queue-Id: 6B2BB5AB4D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/21/26 9:00 AM, Saurabh Anand wrote:

> Add explicit data-lanes to the MDSS DP output endpoints to enable
> display port in 2 lanes configuration and disable the mode-switch
> property from the USB QMP PHY node.

Why?

4 lane DP has been working great on hamoa and makena for quite a while now..

If there's something missing for now specifically on glymur, please add 
an explanation.


~val


