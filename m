Return-Path: <linux-arm-msm+bounces-90082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNYZDTpAcWn2fgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 22:08:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4D05DCF8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 22:08:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 077EB809216
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 19:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 076453DA7D8;
	Wed, 21 Jan 2026 19:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="skI1tYE3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EA93D6472;
	Wed, 21 Jan 2026 19:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769025377; cv=none; b=P7Bk3PDBYU+FQj9GUGBnccD5YbPiDUcrRfarnviPbhgQ/pHtGai3+ByTHLfFOn2AT4JNXZplS9kpBgQqUnv1xsYjspScqA87ivP0yyu0GHLMXLaTr7oBA7yvWfdVYEhsQ0uV95KiwuSp2YYB+S3zLwhLNWz+lR5vht/PoOcQ1Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769025377; c=relaxed/simple;
	bh=Betz5XfOLO6UG+O8YBHfKwyxpQcyXgg0f1VUdUuqZg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MtkN5uN+v4CNg0ksSz63o8sYTfQYAspAoeyjYNLi94BOtvtdJw6mvjebBjTZgKdFuTRpMsr2P0ZGFKWlJTC+hs/prVm7c8dlThyVy3qxZnOfVL4tWX2wE20/9e3AtoknFtUcsbUtwQt7B+YdA0PoEPDZSWHiflTAEuLyVZ3l3TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=skI1tYE3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CCC5C16AAE;
	Wed, 21 Jan 2026 19:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769025376;
	bh=Betz5XfOLO6UG+O8YBHfKwyxpQcyXgg0f1VUdUuqZg8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=skI1tYE31E1O4TT0uPqF7BeqX3oJDb0esPs3x/C/4h1R5wvAq+PPSLpfO8pTb/Ph7
	 ScYeKsF/K5ASkTuKAplqhdqsLyEBOeGWX6E+ncOenoHkz/DT88P0FGDDic7wo7/ZC3
	 3g38XLfsEYmSB36EDVgZ5vMKQ/ULr9uSh4c+Flz5Xeqt3m/i8kyJoyOU9HYT3p8n82
	 G1odRRjk3MS40JFgP2vPbCxX2jzbm5DUPP9WvqVLw47uYgFF3XnSxEL2AemVckiPEj
	 VWSovDzdQRNP15VFHvvqHv6MTTkPnhWICOrEYh+fzCrzmgbe1yT3kpyJELz6YlrU/p
	 lLg7s8Hs/fN9A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: agatti: enable FastRPC on the ADSP
Date: Wed, 21 Jan 2026 13:56:06 -0600
Message-ID: <176902536614.1171053.13196410554155908596.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113-agatti-fastrpc-v2-1-b66870213f89@oss.qualcomm.com>
References: <20260113-agatti-fastrpc-v2-1-b66870213f89@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_FROM(0.00)[bounces-90082-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: CE4D05DCF8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 13 Jan 2026 18:41:59 +0200, Dmitry Baryshkov wrote:
> On Agatti platform the ADSP provides FastRPC support. Add corresponding
> device node, in order to be able to utilize the DSP offload from the
> Linux side.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: agatti: enable FastRPC on the ADSP
      commit: 851d5ae6003b6517fb641675c33d4b529765fe14

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

