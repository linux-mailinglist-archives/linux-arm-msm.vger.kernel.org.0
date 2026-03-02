Return-Path: <linux-arm-msm+bounces-94897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8F6JHUJ3pWkNBgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 12:40:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1F21D7A3F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 12:40:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1FCEF305A6F7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 11:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48CD735DA4E;
	Mon,  2 Mar 2026 11:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RIvAurmb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D6515539A;
	Mon,  2 Mar 2026 11:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772451382; cv=none; b=lL+otZQc/fi6TyTnu1Qhla60P6dLRNfGd8UyQBEHNgpdnBHe2bZwa3v5N9xvXZck2fj2xvh5hxMX5JjEBr82sy8mCltM79gojBg4LQcTh92Q3q6VU1euCYsD5UAQCP1+ZPlzX7Dp5muhSfWbqcRZe6MkPbgbZY637S9SC4ZrYGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772451382; c=relaxed/simple;
	bh=je7AHfZfavvqP+W/PwJsmQocTkj+MwgzQ6Kl9KEtShk=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=XCJFQ5IqUi61PUVoHJOt4wju6BV9R6HjJebgf+qeG9bJ01k0MExKlyIs9fh48LENyj8kOKp3Lg4hhBbSErKDWop41mr3l3BOoeFdDzX7oYP9PKX6W2yqCD4AYZlW9xwxAxp1A3vGZvkeQBZWia8Meouh6VkepkTZcd2BGKSoTbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RIvAurmb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BECAC19423;
	Mon,  2 Mar 2026 11:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772451381;
	bh=je7AHfZfavvqP+W/PwJsmQocTkj+MwgzQ6Kl9KEtShk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=RIvAurmbUy0ZBUYQHZgFZBjnoByxYWjxWDxCsu+qxCUvZIgX7sqVM7aJ9HL7KNoM0
	 WnHBDYluamSmRgAPs2oCAZFbYeq+z/tugyvsCu061dUJg7pmqtLopkJQQWhUZJ5/2L
	 L2EqAXkqd5JSJem2M/+b4hJe8EoM3WfS6DyWbeXg5yLbTJtrYxTK83M2SfUTULw0np
	 Y8j4Vm0QgTsVCoG93DZAoYNn12Rs+Y2liDhyWSgGemDy251XKPJNwYLtjb5p0nPheF
	 rXcqhCwCTisGBz20Z15YzV+DcszlUXCv8HZ9lKsWrCOPYUrjz8WaDxmXWcwl49m+CP
	 3OjcVK7K0/3rw==
Date: Mon, 02 Mar 2026 05:36:20 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, stable@vger.kernel.org, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov <lumag@kernel.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abel Vesa <abelvesa@kernel.org>, David Airlie <airlied@gmail.com>, 
 freedreno@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
In-Reply-To: <20260302-glymur-fix-dp-bindings-reg-clocks-v3-1-8fe49ac1f556@oss.qualcomm.com>
References: <20260302-glymur-fix-dp-bindings-reg-clocks-v3-0-8fe49ac1f556@oss.qualcomm.com>
 <20260302-glymur-fix-dp-bindings-reg-clocks-v3-1-8fe49ac1f556@oss.qualcomm.com>
Message-Id: <177245138068.2323365.8449103832927911049.robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: msm: Fix reg ranges and
 clocks on Glymur
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,somainline.org,quicinc.com,oss.qualcomm.com,ffwll.ch,gmail.com,poorly.run,lists.freedesktop.org,suse.de,linux.dev,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-94897-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ae90000:email,devicetree.org:url,qualcomm.com:email]
X-Rspamd-Queue-Id: 0E1F21D7A3F
X-Rspamd-Action: no action


On Mon, 02 Mar 2026 11:58:35 +0200, Abel Vesa wrote:
> The Glymur platform has four DisplayPort controllers. All the
> controllers support four streams (MST). However, the first three only
> have two streams wired up physically to the display subsystem, while the
> fourth controller has only one stream (SST).
> 
> So add a dedicated clause for Glymur compatible to enforce reg ranges to
> describing all four streams while allowing either one pixel clock, for the
> third DP controller, or two pixel clocks, for the rest of them.
> 
> Cc: <stable@vger.kernel.org> # v6.19
> Fixes: 8f63bf908213 ("dt-bindings: display: msm: Document the Glymur DiplayPort controller")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/dp-controller.yaml         | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,glymur-mdss.example.dtb: displayport-controller@ae90000 (qcom,glymur-dp): reg: [[183042048, 512], [183042560, 512], [183043072, 1536], [183046144, 1024], [183047168, 1024]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260302-glymur-fix-dp-bindings-reg-clocks-v3-1-8fe49ac1f556@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


