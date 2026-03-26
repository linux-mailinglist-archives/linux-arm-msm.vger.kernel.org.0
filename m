Return-Path: <linux-arm-msm+bounces-100002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFBUMDCnxGmZ1wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 04:25:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B5C32EC6F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 04:25:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99AAB305CDF3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 03:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29EA8395241;
	Thu, 26 Mar 2026 03:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SJvMXY0s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C06392821;
	Thu, 26 Mar 2026 03:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774495177; cv=none; b=MKGS/d4MKWUai0NQs9IwbHGrU+cfhm07uHoBEh1KMm77Q9Ku9KWGlgeNOjVBgdEmsp30SeEsikdF1uXV7gP7WN4go+6bROPWXB+PwjkFcK95FI2A3PuPvf/XGogAbQZcB+x1BnTyNZw61HkpmdtG9UAHqMJ1rtRuRFwmfJCFi38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774495177; c=relaxed/simple;
	bh=vtHxCLH8ZfQgXXOJlTwkAfj6jzb7JaPb4yBw42BEyB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cGPlsUSTepXEEv9EiLGSKYkrppXG6jd8vukGkNnr7ulFuatu/H81LME+zeqHq0Qr0uC6Ve16xJvLOqenor+i8O+oGl3VT+/jZCJq33N+CszHc6boijMmN9iERXlmk/ONydFf0VYU+FmNSpoiZ/9oRpidY/CdXrW4IPmeqAFXVrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SJvMXY0s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5001C2BC9E;
	Thu, 26 Mar 2026 03:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774495176;
	bh=vtHxCLH8ZfQgXXOJlTwkAfj6jzb7JaPb4yBw42BEyB8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SJvMXY0s3bwBG4FAbrhY3uOT9GbqxgZTvgbyNzefKgGcX37UjDZPhBrydd0NdPjtW
	 P80cqid8WhSjDrASr6kXHnD3LwSyk5VmMUvoOk53JHLMDjer5GrVN4qf0CWoEOhB2l
	 1+IG9xiXsqQKcQNq14gmCLgXB50ncS5Y9aAtjVhe6cQwl9GTSIl0iCa0BWez1//pck
	 hP6EwuC1INekwlHeFiaS0zt0zb7vIsdQzeE8mAl7ETzNdSXzbGLgs2mjnxj5l4gvgs
	 mnCR5GOxIeqCY5C9KkkqeYaxK9IAX03SM/C32w4NwPwRtz+G6VOEWxrxDqeRGamF85
	 Ryk6Ng83L2TOg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: purwa: deduplicate thermal sensors with Hamoa
Date: Wed, 25 Mar 2026 22:19:18 -0500
Message-ID: <177449516614.60308.14605392054501274878.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320-purwa-drop-thermals-v1-1-2c9fe046cd02@oss.qualcomm.com>
References: <20260320-purwa-drop-thermals-v1-1-2c9fe046cd02@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100002-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 63B5C32EC6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 20 Mar 2026 04:33:15 +0200, Dmitry Baryshkov wrote:
> Hamoa and Purwa have pretty close thermal zones definitions. The major
> difference is that several zones are absent (because of the lack of the
> CPU cluster) and several zones use tsens2 instead of tsens3.
> 
> Instead of completely duplicating thermal zones for Purwa, reuse themal
> zones from Hamoa, patching them where required.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: purwa: deduplicate thermal sensors with Hamoa
      commit: 12b9fae5293e64022e0c09a4c106216fdfa308a2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

