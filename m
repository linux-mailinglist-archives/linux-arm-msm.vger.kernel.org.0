Return-Path: <linux-arm-msm+bounces-94376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNdHO2AdoWlhqQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 05:28:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB251B2B1A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 05:28:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A70D731AB788
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 04:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3C9A3542CF;
	Fri, 27 Feb 2026 04:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kOEfn55x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBDB34FF4A;
	Fri, 27 Feb 2026 04:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772166065; cv=none; b=qr9L8uX8p0dBlY5u5SdzMzjVrjvGTPibuU76DYbqFPDK0yOUHa8Y4vGBrErzFEjd1oP07xv8ql5nooYczj970TCF/tDTMpN5Q9LKuEXBhaPDTrkQzyUpAYNZ+tmJ7qDeqPH+vc8vnH3ljjsQUetDKWA65853PiHi6s08YKcEbaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772166065; c=relaxed/simple;
	bh=B6ExLGTaAP8bbpCva+1PGSbqeRuWbSRkbu8GPhj941A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iEnXLYddDu7HhbNQKOKz2jCopW1fTqBydrC0ZZ1opTVwEpxIXsVTeBlVxy0RvZC90Vhph4g9f5HB2BFxpk3tlvZJc+9K9lPFsA3oO2iQ3gFNkoyBHStpaCnAExzFoJuE/wWUEeekLPapipK4RgsLYvj6RPnSzarkAS0bQkKK8ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kOEfn55x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2C0DC19423;
	Fri, 27 Feb 2026 04:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772166065;
	bh=B6ExLGTaAP8bbpCva+1PGSbqeRuWbSRkbu8GPhj941A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kOEfn55xAEduT8VPmcAorswwDQblL6iWQHnSLYWrlJPKEy40COFeCBrJWI9POcEVh
	 q5qWPU9agUh0iyUblMdudA8iO0C1ChdyBTsggJP/NRJsuv+Xu2Y/hz26jwNqt2q9bE
	 lPlBMpe9rstff1VmPGp4ODewoFii9iuPS6RUxvV3NPMQZjyYAnH2JuwrMCcwa7zkBg
	 dd/BVhyRtZjDJgGr12ooMpPvbgqcdMGLDoDmkIVLlrSadho3Nd7LekILiohwxyowX0
	 C4wjpIESOEQ2W43MX5GMS4ZhRTHo+A3Vw4RU0wZTZIojRU2fNlWToa/9zD5Ivqu4O0
	 ilbBI+YRig+KA==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: aiqun.yu@oss.qualcomm.com,
	tingwei.zhang@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com,
	yijie.yang@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/2] Add ADSP and CDSP support for Kaanapali SoC
Date: Thu, 26 Feb 2026 22:20:57 -0600
Message-ID: <177216604983.873660.12112927281969866673.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com>
References: <20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94376-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4AB251B2B1A
X-Rspamd-Action: no action


On Wed, 14 Jan 2026 22:42:54 -0800, Jingyi Wang wrote:
> Add initial support for remoteprocs including ADSP and CDSP on Qualcomm
> Kaanapali platform which are compatible with ealier Platforms with minor
> difference.
> 
> 

Applied, thanks!

[1/2] dt-bindings: remoteproc: qcom,sm8550-pas: Add Kaanapali ADSP
      commit: c3755acd03ea4008bae3facafa38c3cedc391378
[2/2] dt-bindings: remoteproc: qcom,sm8550-pas: Add Kaanapali CDSP
      commit: f1de1c893d0de19ed8c7ab5bb702e8a5b23ad956

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

