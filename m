Return-Path: <linux-arm-msm+bounces-103309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHOgGo3132kTbAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 22:31:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1317C407A32
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 22:31:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AAD7C3046532
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 20:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F022E388E57;
	Wed, 15 Apr 2026 20:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DUI4YCGT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF0E3845D9;
	Wed, 15 Apr 2026 20:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776285062; cv=none; b=nPWcXtaJflMSr+rBpx6pCyVzGPjMk+UvdZgNJveNlGKiMZr2SwE2ot4AHN1XOtTRa2p/kkORkjFDnCmnOMx0ZBX3ha6YW/0jrrdPbwZismzoL5EXw62OBazDFcsvh9sO0jTnqHlrOBWr7KcSCPN063JvO0N0OyCoGOaU+UEwKPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776285062; c=relaxed/simple;
	bh=kSkVvCrypTVjGIHk24m88WQYxs0zTFu3KPl8xD6npOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r4D2vjBXv4DC7CbPrHAJuEQujyTQfsib3odt8wvdvu+D/2aCAJjRk/2XoGoyQHxsEALoaF/gNN7rEpG+egHYufyS+HXcMt9Qzlu+qwP4rrdhfAQOD8l8dWriK/buWsiToBnd2A1Ju+1Vhwsl79lmuNEhqRKsiAavovIsKr1jj3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DUI4YCGT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35903C19424;
	Wed, 15 Apr 2026 20:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776285062;
	bh=kSkVvCrypTVjGIHk24m88WQYxs0zTFu3KPl8xD6npOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DUI4YCGTs9joWv2MKM98Wp6WDQUOKf5KHK4Swi+oXz/UkesI/JrH/WNvnK6A4Briq
	 G1+MoPHAhqe3a4ckmSLj9TykF7vjoh6abZs2We1Lsex0VQTcof+Wnqmb6UYhEb5E7B
	 Q3p/zmg3j++wjpSeg1TIUjyujydoke9qVRIyqQ30hzha8WCHTbjkY5EVXMMOd3hIZv
	 nd+RRU0SfA770t/SV5YWPN6VLSoxVOPbCE+7qN3300Fuqwx6QAzrd0YpeBlrZhgtbf
	 caAlzmdHyfYp0JHoUpnRyEmW8KW6R1xbH/VJFo9i7Z7kyCufIYGNqv/DRoVBonC5v0
	 L45nGzZ/3nSBA==
Date: Wed, 15 Apr 2026 15:30:59 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Guru Das Srinagesh <linux@gurudas.dev>, linux-kernel@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: firmware: qcom,scm: Document SCM on Hawi SoC
Message-ID: <177628505923.329362.13192293937197613654.robh@kernel.org>
References: <20260401123825.589452-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401123825.589452-1-mukesh.ojha@oss.qualcomm.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gurudas.dev,vger.kernel.org,kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-103309-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 1317C407A32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 01 Apr 2026 18:08:25 +0530, Mukesh Ojha wrote:
> Document SCM compatible for the Qualcomm Hawi SoC.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


