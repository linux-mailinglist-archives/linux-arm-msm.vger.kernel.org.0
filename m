Return-Path: <linux-arm-msm+bounces-106042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPlDNNaW+mk3QAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 03:18:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2AF4D5310
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 03:18:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15A22302AE28
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 01:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EAC8218845;
	Wed,  6 May 2026 01:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I4iWBHiK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A77D1A4F2F;
	Wed,  6 May 2026 01:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778030291; cv=none; b=n5Wh9dZDW9PzHJ4H+b1Ccpokec2a03kDfhhGMdrX0wg2M6qbgXDAfcsz4/plz/tNndpxwyr8EYu43OqSrTKb7I5q6vn466F/+zNN1o2VVzjHz9RIR0tMd7Q6VXIpjRYgbtS8DLH9ykWqn2gXQbB1PCMKeHBTN8FiVt08P66mRoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778030291; c=relaxed/simple;
	bh=ODfRbMr9lMwzQL53zmwabAvWxDyxbCvqTPWR07hv9c0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GZkHMFqpfQM0s3CGYkrNQvb31rEQnEuMh+J9W8H6mp7uQAis+6HaFlyZifp8Jv5s07IwKiRa1oDf3tGhEG84Q2rViYAgzNlZOgKQMUvwvZcfmspdFkEop+2Cs+K3o7Z+U4SCXyOAA1mOkVSk8d/tNhPMEgLFb8ebCYSMRKFmoAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I4iWBHiK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A99C9C2BCB4;
	Wed,  6 May 2026 01:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778030290;
	bh=ODfRbMr9lMwzQL53zmwabAvWxDyxbCvqTPWR07hv9c0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I4iWBHiKOYKlRRx2yxM17PYZFpJq+xV1y9K2yzGYgOEHkBkaC25N+Jg4NtPVQB9D4
	 8xW/f2KUS3Iz0UOkls5uqDsqVNoXohfA8wzoa3VLjZEs49PIgRTxMc63US89NQ3wck
	 3kZsgjkknvfWgeNLeehjK8yVqaPCLMLlYay/yV64DuVg+WMNoKFipnF8+qDPh+jh1k
	 4EFwYzu2CO2gEqqdNSn3crEWd/iWt+qP29GURPudzZ4V1gs1IdkFOnFyZdU7qXq0pj
	 yppFw+EJMeef3ADTpmJgnAgJ2sj9FjEAZLaiCnsDN/cFXvy2zdNfV/Wg+MF+Y2gVHQ
	 diLF4HNrSgT5Q==
Date: Tue, 5 May 2026 20:18:08 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom,sm8550-pas: Add Hawi
 ADSP compatible
Message-ID: <177803028832.243628.11886539807209386320.robh@kernel.org>
References: <20260427190614.3679937-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427190614.3679937-1-mukesh.ojha@oss.qualcomm.com>
X-Rspamd-Queue-Id: 7D2AF4D5310
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106042-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]


On Tue, 28 Apr 2026 00:36:13 +0530, Mukesh Ojha wrote:
> Document compatible string for the ADSP Peripheral Authentication
> Service on the Hawi SoC, which is compatible with the Qualcomm SM8550
> ADSP PAS and can fallback to SM8550 except for the one additional
> interrupt ("shutdown-ack").
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


