Return-Path: <linux-arm-msm+bounces-107203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DKcC9iNA2pN7AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:30:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C55D75292E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:30:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B3915309DDAC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 20:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B8C33D7D98;
	Tue, 12 May 2026 20:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jwhI2IP5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF383D7D76;
	Tue, 12 May 2026 20:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617438; cv=none; b=dmXtnQ53gsYVcWflXdv3kayM4A+0iDi9B5/bZgGaGvYqlwMNSzr+rgCwEbf5lBu+VdoF7oXzf64JZqxq8q7iKQYUIKKdeHmPkfVZeWIiApgh5/c5s7N/ISr0w9fzCRYLPyzHsqMdYr3vv3TeyVjRk0yhIRjuBCJetlxsswhYFns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617438; c=relaxed/simple;
	bh=V5pxRavQXhQiieBOCZ+r7S051a3NAJpBgPWkNOf6QJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bz0VagghAHy2Kd/X7AnMJA6qZKAX5NFknsK86s01RY/ztKVt0J+d2T7MmmcdA7PGICktUC5k+Efhx5GOqanVA+AI+kP4hSBSvnbbC5XEG56l2O3M8/KaeUdjJC1a8WOVzm7LGVrOmDywg7lDSfCcV8vE9Rz7obiP5gh4pKbbfQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jwhI2IP5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6979C2BCF6;
	Tue, 12 May 2026 20:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778617437;
	bh=V5pxRavQXhQiieBOCZ+r7S051a3NAJpBgPWkNOf6QJM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jwhI2IP5Lrr/mpaRyEwlyEyUo2bhoo0nQ8vJX5sNvX7CIxthKb5qHqYavhLrUApwj
	 zLGGYQTYG+bfEdA4WffbfYia+lhOL3PaU8CKgpQP+4H+1JxNsf6iIgPkHLmyhsi3RY
	 2kngULM47qCAswQFq8keo+w7ia+6NLnjEBfdKDhEdUhr9IEm9y9Vl8LT6nPxLjzNBB
	 PSxIRaK7z5sXiGOB1M3XLBs+ujfM+Hs31Pw1YWZIPz+iqVt7PhENTuOFhMDYDujKh5
	 Y+2CHyYCYO+nciMdVXe3N8gekTEU/Z/UW6IKcuugQNZ1+fdxG19qh1E4G/Eu6j0JMR
	 HzBHGvRalNu7w==
From: Bjorn Andersson <andersson@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Praveen Talari <quic_ptalari@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: qcom: geni-se-qup: Add compatible for SA8797P SoC
Date: Tue, 12 May 2026 15:23:10 -0500
Message-ID: <177861739377.1242344.15173839569832124812.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260427005901.230237-1-shengchao.guo@oss.qualcomm.com>
References: <20260427005901.230237-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C55D75292E6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107203-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Mon, 27 Apr 2026 08:59:01 +0800, Shawn Guo wrote:
> Document GENI Serial Engine QUP Wrapper Controller on Nord SA8797P SoC
> which is compatible with SA8255P one.
> 
> 

Applied, thanks!

[1/1] dt-bindings: qcom: geni-se-qup: Add compatible for SA8797P SoC
      commit: 35466ef5db1fbdff49c4142026c4c56514d5ff47

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

