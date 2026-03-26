Return-Path: <linux-arm-msm+bounces-100010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kP2rAr6nxGmZ1wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 04:27:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AADE32ED0E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 04:27:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE3AC30D8CCF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 03:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93D3439DBF2;
	Thu, 26 Mar 2026 03:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iRkfdznG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873B239D6F6;
	Thu, 26 Mar 2026 03:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774495185; cv=none; b=dJG876bWEFnV5cFt82A05pYqY93xICvc24f3ssG9qyoihliEw9LeAlAgeqnHC+4PHiUTx4G+Lp4S/O0RfjhreIUvShaWRa/KAQ9L7BfXu4mCcbi/FI6adfBSTnV8c9zNaOw7xujzk4djOwSf0AQWNIZXL6tZneVbFUXCbKT5wD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774495185; c=relaxed/simple;
	bh=t2XUoSvh89kqrOozKJYUzWgw4+PCXIyw3r8zSeuwVMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tpRUyLDHX+47kAqzCAjPMOO8mry24KVMapTc1R8YhUKkDcwldIWN9fYNKm8vfwxWGdmgkmQOD9dRnoh3dSL7QOlRCpIWdJVt5I5Hxj5v8diYdFLXEF+QEL8hbydbHsPGTwDomrlTTduR3u4YxQDskCW+3CJ77MJFtzMNu2VwH9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iRkfdznG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58DC9C2BCB3;
	Thu, 26 Mar 2026 03:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774495185;
	bh=t2XUoSvh89kqrOozKJYUzWgw4+PCXIyw3r8zSeuwVMU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iRkfdznG7zqPyad0uVzudin6FHRv7An47mVUdEZ/FvQ2qBaSkWeEZ+7aFbC5EDmgy
	 B/RuLfd+kOCT6Ovk0Jbqnwb3V3j2fFjMscgqHDeVX4v/DQF8RtUZH7z2Kp45ou/OFw
	 9asb0Jjg28yeEVw8k29Ad6JGVM1+rFDCQQgE29aeUoc6E2V0zG7HK8dk/KqU5DBBqH
	 8QQMOSuqh3qlfmkX7XGHgZd1hol8zb51ltmFBx+0F7nYJ+OXl3m7GdllpX3xVV+k2A
	 7C37dfe4qDHfynu53twSeYAGA2wqyISgTBDSQVwh3BE/YqFwWdUpk1yBLsWeDr7zTy
	 NM3+XZ1pVIM9Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Jonathan Marek <jonathan@marek.ca>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/8] drm/msm: Add Qualcomm Eliza SoC support
Date: Wed, 25 Mar 2026 22:19:25 -0500
Message-ID: <177449516604.60308.13612221686206008609.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325-drm-display-eliza-v3-0-dc2b2f0c74a2@oss.qualcomm.com>
References: <20260325-drm-display-eliza-v3-0-dc2b2f0c74a2@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100010-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[28];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8AADE32ED0E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 25 Mar 2026 13:16:41 +0100, Krzysztof Kozlowski wrote:
> Changes in v3:
> - Re-order soc/ubwc patch to be last in the series. Maybe it should be
>   sent separately?
>   Use defines for .ubwc_swizzle value
> - Tags
> - Link to v2: https://patch.msgid.link/20260304-drm-display-eliza-v2-0-ea0579f62358@oss.qualcomm.com
> 
> [...]

Applied, thanks!

[8/8] soc: qcom: ubwc: Add configuration Eliza SoC
      commit: 9a116af73a3c90cbfc78d6b007325539056f83be

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

