Return-Path: <linux-arm-msm+bounces-95170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBRZHD4Fp2k7bgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 16:58:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A601F318E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 16:58:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ACB5E308541E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 15:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05A1C492501;
	Tue,  3 Mar 2026 15:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZzdtIyth"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54503B4E8F;
	Tue,  3 Mar 2026 15:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772553380; cv=none; b=iF4IKfS/tgUoKL6j0Wrgor3EHxDedSHpQiUwSbgr7UWxIbB/QnJK6HC12F9ZcuHp+aK6Tfo63bdFwjQ/mbc+gwxgdFSW/MIbfVlN0NT5lZkkX+u4mbOWo0JwumpZRlb+G5Rt/RwKKkeX+uFYL5zEWwB97K4+pN9C6Ca5htGk2ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772553380; c=relaxed/simple;
	bh=docXN/j7MOnJzfbztgBR+4k4s7H02SISB2RKfeW0qo0=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=fYSSoKlLKrZfEU396AOQ1S+OM4iUp4MxsBQQmDHEGwfs64fp5Y5N3ocp6rNR5n2uO6zjbUQrj5ZmwDIjQBmWAU8Qvxg1y8HcVd1JcZOYqMmaPBlGl+jMPDgHRNpTU0s+Z0aA8cWUvgBsTcONESPfzdJ3hRSvpzF+mKaZKpKViQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZzdtIyth; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49097C116C6;
	Tue,  3 Mar 2026 15:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772553380;
	bh=docXN/j7MOnJzfbztgBR+4k4s7H02SISB2RKfeW0qo0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ZzdtIyth46gErNXR0r6WhugMyRnjR7EEDJuMNo9h7G9w+7AchH7hWiJnVWefCzQdz
	 5s2+sEECu4jHA+OlZbWLFjC0wdfWl6KbINixJjxirQpfzraKjmrgafAQ6DIUhYgcI3
	 WBhfJOgNHSGoJ09+qA7SV55zofbwcauceVwEPyYqovYNoB0E9/BWu9vZWtGAOuqEZH
	 lS17j3XPfsJlcwRHaTt4cYwFa5+ALpTsPcIvb6v9Lc3BrH/t6Sdj3mqDMvepRPUaDi
	 pZqRXL4toSYN8jUmMxa7WZYMBsm9jhWxkMS/q09O4Ov1f89MhtH1eAexJVMjx8FX/B
	 GElQVoakP4Vjg==
Date: Tue, 03 Mar 2026 09:56:19 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Sean Paul <sean@poorly.run>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org, 
 Bjorn Andersson <andersson@kernel.org>, freedreno@lists.freedesktop.org, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Maxime Ripard <mripard@kernel.org>, 
 linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Jonathan Marek <jonathan@marek.ca>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260303-drm-display-eliza-v1-5-814121dbb2bf@oss.qualcomm.com>
References: <20260303-drm-display-eliza-v1-0-814121dbb2bf@oss.qualcomm.com>
 <20260303-drm-display-eliza-v1-5-814121dbb2bf@oss.qualcomm.com>
Message-Id: <177255337948.3355290.6523186852223801021.robh@kernel.org>
Subject: Re: [PATCH 5/8] dt-bindings: display/msm: qcom,eliza-mdss: Add
 Eliza SoC
X-Rspamd-Queue-Id: E0A601F318E
X-Rspamd-Server: lfdr
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
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[poorly.run,kernel.org,suse.de,gmail.com,vger.kernel.org,quicinc.com,ffwll.ch,linux.intel.com,linux.dev,linaro.org,lists.freedesktop.org,marek.ca,oss.qualcomm.com,somainline.org];
	TAGGED_FROM(0.00)[bounces-95170-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action


On Tue, 03 Mar 2026 14:07:55 +0100, Krzysztof Kozlowski wrote:
> Add MDSS/MDP display subsystem for Qualcomm Eliza SoC, being overall a
> minor revision change against SM8750, but coming with few different
> components, like different DSI PHY and added HDMI.
> 
> The binding does not include HDMI description yet.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/qcom,eliza-mdss.yaml      | 496 +++++++++++++++++++++
>  1 file changed, 496 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/msm/qcom,eliza-mdss.example.dts:25:18: fatal error: dt-bindings/clock/qcom,eliza-gcc.h: No such file or directory
   25 |         #include <dt-bindings/clock/qcom,eliza-gcc.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:140: Documentation/devicetree/bindings/display/msm/qcom,eliza-mdss.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1597: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260303-drm-display-eliza-v1-5-814121dbb2bf@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


