Return-Path: <linux-arm-msm+bounces-109455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIJoCQkQEWrggwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:25:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 621055BCA6B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:25:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4AD31302946F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 02:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77283376497;
	Sat, 23 May 2026 02:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I5Ghav2B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43809328616;
	Sat, 23 May 2026 02:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779502833; cv=none; b=iObJzicT5rAQCE6LkkGrLMRKUYdQ5rivT4O3F2JZDWWHOvJYX+oC6ZZ6LiTHimWVvXuUrQRlXLshoyMnLEDdOnDO4U8Bd1ezFcq33r9nc9nNy2n7y7Ai91/s1o5kqm215kfhXk7oIxW6uA2c6n4E/yPY3z/7bzFMaCbRnMaSj4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779502833; c=relaxed/simple;
	bh=IsFx/UzfFEL91DlrZCbhbNMeQ9zaOccC5V9Myinmkls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z8PNoCRSnX8qbbUv+6s3UwITJlwKcZciO/gZwTIZ9TGgLa8SdDJnxNQsgQIRlYKokOjCetDBr5vUcPiVytOo0fFv5mq8Er1puh5VQP83Szfm9eYbOxQErrS5MIQZu/Xfj+BRi59dezTS2c2AwvDPjBR4LXah7jlXvNOfA+aPN6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I5Ghav2B; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60F171F000E9;
	Sat, 23 May 2026 02:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779502832;
	bh=E6EdiflXV89oDZblwYwy21BMC3JqaFQGrQBkL/Esg+U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=I5Ghav2BaNyl+XqRJwo3rwYn9AQsAfsBoMwUQSem5TN1kwcx3LlDt+CQvu894VMxh
	 kKfEsXgyD+x3XvJV+XXMui6vO0Qy2bSAy8JPvzFLhlZQLwLe8ZDkz4v7HL45UFIrli
	 E79wYysxLi5/VVWiN8BCojIJGG8dC5uS7x7qIDGMgPxB2AE/v289kEWQ7m+h9TF3g3
	 +z7JPkFtkC3p+CRK1BsmtOTZ3ehvqfz1CzXq9bvXg7UFNuT4PlNyz5KoeotfWdgSTe
	 kk49vJAjHlUCqn7eBCYJqW/Au78hrWtb9ZbOwwdV2lNXXcby5yVk5WBLQa1alLCMX0
	 XBfO/YHQ1BuUg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Drop unused remoteproc_adsp_glink label
Date: Fri, 22 May 2026 21:19:59 -0500
Message-ID: <177950280342.1097700.9955902215543211212.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409181329.556899-1-mukesh.ojha@oss.qualcomm.com>
References: <20260409181329.556899-1-mukesh.ojha@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-109455-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 621055BCA6B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Thu, 09 Apr 2026 23:43:29 +0530, Mukesh Ojha wrote:
> The remoteproc_adsp_glink label on the ADSP glink-edge node has no
> users in the upstream tree across all affected SoCs. The only user
> of this label is qcs6490-audioreach.dtsi which references the label
> defined in its own SoC dtsi and is left untouched.
> 
> Remove the label from kaanapali, kodiak, lemans, monaco,
> sar2130p, sc8180x, sc8280xp, sm8450, sm8550, sm8650 and sm8750.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: Drop unused remoteproc_adsp_glink label
      commit: 85abff1549515c453dd113c4a4e3dd75ef3cd30d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

