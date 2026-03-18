Return-Path: <linux-arm-msm+bounces-98494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIolA+avumnkagIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:00:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AC45F2BC837
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:00:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EAEC93235461
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 13:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CADD3E5EC1;
	Wed, 18 Mar 2026 13:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AIuOQj6e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595793E559A;
	Wed, 18 Mar 2026 13:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841873; cv=none; b=sPsab+UZh3EHxDplL9kgx37Uz5N6c3NTgMM1Ak+2IrCfEfMJZpuC8ndtT8WEOu6Pg0RAmyGGFEXW4cgRBcoTmZGMcbWpYOaYNhtaurD0LMYNRZrcp9hPFb2MBKAe+0Bt7Hls3FGRAeiHLZuqm4Y+v+BwuYX+5obXakZQC+1JaTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841873; c=relaxed/simple;
	bh=P7GoDA3PAcoCqpTtJI2uN5KY5brlPDvhy3urTnXQIaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V24k5hhIA1lCZaGqFPnO5k2PTaY5Mni6VwWHig3PPhHK30pwbOqOuVy57ZBvnRw3x1uqv9kbPmznKUHXcSbFp9KCeLPuVECrT8/BrDtHAWXETXVHu8sOSIanmcexCmqbRTLP2KhqXZVExqY+rEFjOgm81abNwebwLr5uIADBdsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AIuOQj6e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 461F5C2BCB0;
	Wed, 18 Mar 2026 13:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773841873;
	bh=P7GoDA3PAcoCqpTtJI2uN5KY5brlPDvhy3urTnXQIaQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AIuOQj6eIDPpIOEVw/CxIFBd5LmeviAHSvluubR1A5ie9HP8woaUTnAdN1VKhzbCs
	 vLYsC75bR3c1LSEJ+CxL7tyy1Q6bhGTvz1RFxBkTtm7u/cPxpftVjc+wDTgPZ2esS+
	 y82oc7ltKdbW1pGm5tC+AtlszfI6iB/HL8sv4nbS+94jS9Mq20rQ5CTcPGYZVUu9zj
	 vIp0tOlQpemoHU8cjpn3uGa+nz6aOIoTJJGvIqyLQv/bG08KlfpFA01VKzNmTv0biK
	 qrd5DOXsRfStjAEeOx0z/fsxlXrwCQzC7HddOa8zLW/b7xugtIG953DvDxBPI8Q31K
	 hvk6+nxTpkMew==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaron Kling <webgeek1234@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xilin Wu <wuxilin123@gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: pmk8550: Add PWM controller
Date: Wed, 18 Mar 2026 08:50:25 -0500
Message-ID: <177384182887.14526.3915265845399891210.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260207-pmk8550-pwm-v1-1-f2b26ab98d8b@gmail.com>
References: <20260207-pmk8550-pwm-v1-1-f2b26ab98d8b@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98494-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AC45F2BC837
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sat, 07 Feb 2026 20:12:11 -0600, Aaron Kling wrote:
> Add the PWM function to the pmk8550 dtsi, which is usually used
> to control PWM backlight on platforms using this PMIC.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: pmk8550: Add PWM controller
      commit: ce26eb2967820eceb60c928bbae63dcd7c05fb68

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

