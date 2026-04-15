Return-Path: <linux-arm-msm+bounces-103313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OkKO68M4GmzcAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 00:09:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 983DA408725
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 00:09:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C3E1830DBCB0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 22:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 688CF329C57;
	Wed, 15 Apr 2026 22:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dyq3bdwE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423252DEA6B;
	Wed, 15 Apr 2026 22:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776290754; cv=none; b=jKEM7EmOZ+Tw/Xk4Nb3yEjuQYta7pZKV2+YNpHB0j2dZLSlD1UalnPZ9F26itYEWa4gNJphABKs0dRyQ/3+TvDcUDEjxzkXk4EvqEy5/OJAuqFSI2DpvSQIJDl5QrrDAYW3/nuXqzO4xaJQzkAhrN2OXJnJN9xA64Sm3Jpp/xfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776290754; c=relaxed/simple;
	bh=mLhAH1+qugv1Sjri+ehdqjCtiHWhDQZg0i8/wQtcuss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nw4SIdwVVJ3E79K0jX+b84zcmJa8ZTALQcaTywm/gclIVZ11VQX4+jccVltvZJJ8NzjpXeYUBkmUe9TdR/rl/7eq9KyZeMjmjc1dD3t0YO8QWI58+c43PQS/QOkqUpllbaQ6bMY1CRGCyTon9RjixRU7lK6sqbkG85+kWpnaZhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dyq3bdwE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5E9AC19424;
	Wed, 15 Apr 2026 22:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776290754;
	bh=mLhAH1+qugv1Sjri+ehdqjCtiHWhDQZg0i8/wQtcuss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dyq3bdwEVhqrapGRkeC1slHrlvaOFocWB2Y400KUIDJJwiEI/99IYsNEpDjSTHxw7
	 fu05FN2hFQrfOTD6rP06XhyB3p+rxtSbzqA1LHDunb9iLtS5l0Z1Sg1sAe2kKn9RuH
	 DN2f4no+jojDj/td8r/T78bGhTH4nUfdBT39iFQwLuHcqgtwbcQhTznhI0+eZtN2f1
	 5dRuWJkyzqeB9dwjVoqUe0QTBp+NLOZ73AIn95v8qJ/nsX+8dZeEB0NocrDY7j1H9W
	 A3tBXrFFdXumPRlemFQOFDQSZ4DSzxUbo/wj8KNuZezMt9J5ww3m8F6rEYNqPgddIL
	 4PcL3dgVnranw==
Date: Wed, 15 Apr 2026 17:05:51 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Dmitry Baryshkov <lumag@kernel.org>,
	freedreno@lists.freedesktop.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>, devicetree@vger.kernel.org,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>, Sean Paul <sean@poorly.run>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/8] dt-bindings: display/msm: dp-controller: Correct
 SM8650 IO range
Message-ID: <177629075131.744309.15655011124361064388.robh@kernel.org>
References: <20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com>
 <20260405-dts-qcom-display-regs-v2-1-34f4024c65dc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260405-dts-qcom-display-regs-v2-1-34f4024c65dc@oss.qualcomm.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[somainline.org,linux.dev,kernel.org,lists.freedesktop.org,oss.qualcomm.com,linux.intel.com,vger.kernel.org,suse.de,ffwll.ch,gmail.com,quicinc.com,linaro.org,poorly.run];
	TAGGED_FROM(0.00)[bounces-103313-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 983DA408725
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sun, 05 Apr 2026 16:33:57 +0200, Krzysztof Kozlowski wrote:
> DP on Qualcomm SM8650 come with nine address ranges, so describe the
> remaining ones as optional to keep ABI backwards compatible.  Driver
> also does not need them to operate correctly.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/dp-controller.yaml           | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


