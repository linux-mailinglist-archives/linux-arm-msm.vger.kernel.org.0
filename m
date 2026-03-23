Return-Path: <linux-arm-msm+bounces-99317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNMOOUJVwWlTSQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 15:59:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A11D22F593A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 15:59:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C97EA305D4E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 522F33B19C6;
	Mon, 23 Mar 2026 14:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FOaDly/p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2899E3AF679;
	Mon, 23 Mar 2026 14:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774277449; cv=none; b=f8hzTlcNgQwsZm+LVNUPd6wITNft2WxrqF5iSf5YL+/ffE41Cv3+KZtt7BnCy2esP1Iaq4yF9eaxgH3J/otZvJEnb1oeoNWI3mR4bh4vYmrLuk8LgZwjthO9oNVQPDRHJmzM3e0O219+7pYEyRcf2T/N8c3KsiHoQ1NzlgRvv7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774277449; c=relaxed/simple;
	bh=4f9AlNnvt1H1wntRZn7D84y90Dv7pzJJe2ZUYbDXEHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gsdh/vF6f5Uz9yHX707+2OuWpw4adIqv1xBf4K6I0VGuaH+FB8E6W72rX36haPjVhE+jAR5HSk8bzUKIVHCNcSuveUSDSgKFfo9VKilPgxm7rA915dTLlFfZT0o4uqhP5EAOJq4GMbxpLb8TfQ9FzqZqoLu7Wl876wjz9UwfjZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FOaDly/p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED885C4CEF7;
	Mon, 23 Mar 2026 14:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774277448;
	bh=4f9AlNnvt1H1wntRZn7D84y90Dv7pzJJe2ZUYbDXEHM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FOaDly/pqt/70MZIhJMoawJx76IEihEHmZB1Ce+Y5f6I8d/wxrvQPxgDDnzXM0ZQK
	 Merm8QOne1mkGi8lCRYK4bmQyrR555HqK49t3LE/DwKK/o2zXdD83yfs4Py5Gc53u3
	 gnE3Fv7dX4u5h9EISNvxniACL61WTnS/suvEhuPrpF2l2gm09PBtT0CSzrly0RJkPO
	 kq2b5ZiGV1zmF2hCVIxL2z1ql+6OD439tLE59xZ/BSkB24sLfvDTOdhE+wvEzYcOBE
	 N0/Tk3Bn8RU8cRwJeoQSvAfFma+GIGjJ7FHRRTmkiwFTbxC5OSotDW/EmbrVjtyD1O
	 gsNjbK6+DMb2g==
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Casey Connolly <casey.connolly@linaro.org>,
	=?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
	David Heidelberg <david@ixit.cz>
Cc: linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	Gergo Koteles <soyer@irl.hu>,
	Casey Connolly <casey@connolly.tech>
Subject: Re: (subset) [PATCH v8 0/2] Add support for sound profile switching and leverage for OnePlus slider
Date: Mon, 23 Mar 2026 09:50:42 -0500
Message-ID: <177427743912.13372.18307860238374412246.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20251113-op6-tri-state-v8-0-54073f3874bc@ixit.cz>
References: <20251113-op6-tri-state-v8-0-54073f3874bc@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99317-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lwn.net,kernel.org,linaro.org,sigxcpu.org,ixit.cz];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[19];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A11D22F593A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Thu, 13 Nov 2025 17:02:57 +0100, David Heidelberg wrote:
> This series add initial support for OnePlus 6 and 6T, but other OnePlus
> phones contains same mechanism to switch sound profiles.
> 
> This code was tested for two years within the downstream Snapdragon 845 tree.
> It is now perfectly integrated with feedbackd in the Phosh environment.
> 
> The series is also available (until merged) at
>   https://gitlab.com/sdm845/sdm845-next/-/commits/b4/op6-tri-state
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: qcom: sdm845-oneplus: Add alert-slider
      commit: ca5adb26c5927f28016c6b1778622dee9ada5ca0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

