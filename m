Return-Path: <linux-arm-msm+bounces-107468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGNiBYjNBGrMPAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:14:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD70539B81
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:14:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F40E2302E97B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 19:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDA9C3BB11D;
	Wed, 13 May 2026 19:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RM00sv0f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D9C3B9923;
	Wed, 13 May 2026 19:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778699390; cv=none; b=sXP4Q25ufkgSARai2Bm5svOLQy8J8Bldx8z2NZZ2l0/maFtyQU8mFicYA42U1p9UFDlNqTOIg2jcIi0cVo7db19/7psZhbbFyFCd6VYxyUhU9OXmlykX7r8nLu7hndFM/qBg08enmzgq9x5DRjtYLTdHvmQt+HVUZO+r1Q92DoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778699390; c=relaxed/simple;
	bh=3NdldGtqog0JxqkuNYE3JXKsnKnLqZThga8HCNv24M0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T7w9Myqo8cf4VxF62YO2grHWPR0TN4Uf+4TogTgMZyMXrQOxnKYBu3kQCSckyxB9MKWa3BhTmnkl1S7V1yqLT+vFhlr1Wml3sBemEdfY0BDH0bjZYxYk3Z/1SfNL4Xns5dtcDqarTC1DxtiTMqo+1juUgyjDVY/vylVdvuJhBjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RM00sv0f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCD3CC19425;
	Wed, 13 May 2026 19:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778699390;
	bh=3NdldGtqog0JxqkuNYE3JXKsnKnLqZThga8HCNv24M0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RM00sv0fAGVdkyuJtuiKwlBriIjRSxfEvVqGOLIwWFWTUmiIBYNZ/7WP1ubC6XsoK
	 ZarBkQAI7vDf5KpFF5Xi9aqRzvbaCxhdG9X3JESNCBcvEStcew0TG1sdULA+YxZ6g8
	 NIOwxYc369NkvmCNyQnP62qmgBDCOxN3/spDPl9iyQokzN2uu9WD2tIDmU6HLLwMtF
	 goka7SFkt5o+TJohifoOkga+e2Mf7OuYsgpU0t54NbGozXOp6vt5As3N6JfXsZHms1
	 LGDRs2d74dTXDzCxnJr9cxLvxeKQunYw2bTFtBAMX2TWjMztse5Db2hSNFhDG7efzx
	 2B3JZr+T6LYmQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Georgi Djakov <djakov@kernel.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Aaron Kling <webgeek1234@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/2] arm64: qcom: sm8550: add DDR, LLCC & L3 CPU bandwidth scaling
Date: Wed, 13 May 2026 14:09:27 -0500
Message-ID: <177869936428.1496622.16380520003909597184.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260219-sm8550-ddr-bw-scaling-v3-0-75c19152e921@gmail.com>
References: <20260219-sm8550-ddr-bw-scaling-v3-0-75c19152e921@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AFD70539B81
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
	TAGGED_FROM(0.00)[bounces-107468-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Thu, 19 Feb 2026 22:07:38 -0600, Aaron Kling wrote:
> Add the OSM L3 controller node then add the necessary interconnect
> properties with the appropriate OPP table for each CPU cluster to
> allow the DDR, LLCC & L3 CPU bandwidth to scale along the CPU
> cluster operating point.
> 
> 

Applied, thanks!

[2/2] arm64: dts: qcom: sm8550: add cpu OPP table with DDR, LLCC & L3 bandwidths
      commit: 3f5dcc05cd33e85e897571b4e44feb06f5399b68

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

