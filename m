Return-Path: <linux-arm-msm+bounces-90083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDHjKPA8cWnKfQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 21:54:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DF75DA5A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 21:54:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 270CEB4580A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 19:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0F103D7D9F;
	Wed, 21 Jan 2026 19:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SpEgm8Un"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966493E8C6D;
	Wed, 21 Jan 2026 19:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769025379; cv=none; b=herC0LlZtaeV2OyLL31oz1EsD709aj7g2vN09oWvT8Cd/oFGxoEid5L2/52Yy4L4xaTyyZbH9sM9NlMMRgIEsRZkoQWwUBFggzJt3cAAW7tHdiwA0i2aQaWu8u8KR5DvKJ6E08zQPNZb1Knn9xhpUGA4dfNpG+m2v24i/rhiXts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769025379; c=relaxed/simple;
	bh=W+5gFu3JgHDLqSXUjxM6ibvM0s3B72Pq84Z3Z6iiLLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eu2OMKKOVdzO8OUsv9sfVy+hWX4Tz5DeI41kYfDUs5tOtxzdPL24yBhOt4r8HTriWiUse3b+PYlULJ9W6AyfTQQNCw/Psfz+LLDBYB3h7GGDACUKfcYYnXXFnmLoFQwvRpL4qbOi017R3yiC6XzUw2NcHYsj8brd2GlDwmZHA/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SpEgm8Un; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6C96C19422;
	Wed, 21 Jan 2026 19:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769025378;
	bh=W+5gFu3JgHDLqSXUjxM6ibvM0s3B72Pq84Z3Z6iiLLU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SpEgm8Un+pCybSWCtssHK9idnxyWO+8NxxymILl5SctayJVwKTS4o5I/XzVVqIywu
	 AffZwxoIAJnvRqd73D+pPFg6fXE+hN+pUq75yjS+wUZAYLQo2xHJz6jQBwZZtfu/rt
	 5D9IckYXsqGLJJmQcah7hAP2snn8x2wa02hzIcq0gZdT2yiMA3MajZbUpg4co5hU8l
	 CoScTP9ii5VQMpo+JNJ7PYhx/66a28ARx0/Tmk0zKYV20xHOpILw1Wh22ffAczemQy
	 saoSIfcJiH+RFbWaqETp9xSIu9lSmhNhNSKLJx2inAZRcW47qvkz/01Dv4GA1x4I75
	 NJxrdPKjg+hRw==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [RFT PATCH 0/3] Add missing CX_MEM/DBGC GPU regions for SM6115/QCM2290
Date: Wed, 21 Jan 2026 13:56:07 -0600
Message-ID: <176902536628.1171053.16798539408151784925.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229-topic-6115_2290_gpu_dbgc-v1-0-4a24d196389c@oss.qualcomm.com>
References: <20251229-topic-6115_2290_gpu_dbgc-v1-0-4a24d196389c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90083-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 49DF75DA5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 29 Dec 2025 21:47:38 +0100, Konrad Dybcio wrote:
> These regions were previously left undescribed, fix that.
> 
> Compile-tested only, the driver shouldn't break though.
> 
> 

Applied, thanks!

[2/3] arm64: dts: qcom: agatti: Add CX_MEM/DBGC GPU regions
      commit: 0fdcc948929a6d673bd0f90631dd6e42090c3dbd
[3/3] arm64: dts: qcom: sm6115: Add CX_MEM/DBGC GPU regions
      commit: 78c13dac18cf0e6f6cbc6ea85d4f967e6cca9562

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

