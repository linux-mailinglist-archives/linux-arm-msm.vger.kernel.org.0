Return-Path: <linux-arm-msm+bounces-109149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GXegI49vD2o3MQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 22:48:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0427C5ABE63
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 22:48:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B75FA30207F6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 20:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DC853FC5C1;
	Thu, 21 May 2026 20:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M5f5eqGv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1DD36BCDA;
	Thu, 21 May 2026 20:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779396396; cv=none; b=Y4t/u1Lh7ArVfE03IZnva6vBuVULETD+WuaawRrji924Aq44NtZQ9sTTH5JsfjxbJbxhPmkLILO40xwW9Tqt6pmr/JDBTPCtbIBdNgpFjEYp/pP8vR1nysu72hLvaXEfoPhiTfd0K6F/qmezV692G2YcZKsR5tUMGISnDaJQoCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779396396; c=relaxed/simple;
	bh=/3Bmr0HZmOdAPfLMVeKbjGSSPagH7BApDlrMzRI+2XU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=lXiF+NZ2mzf0RKdzGMZFczEIIhh2JD2mAiJDf6dLnoDi6dAQQ3JCWheqHZPLUtVhM89Qk2KHk7ZBtRvybKvrQljNVyeO5IucTcL8k2lG2/pgrdajNmbNMrIoPIvhReqYgmnhpDj5vlBMXxH3Puv7fi/W0X9U8nkxDmhxN5A7ptM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M5f5eqGv; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 949791F000E9;
	Thu, 21 May 2026 20:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779396394;
	bh=gLygPlXA9zpesWB7c3xrHmVnj9UJD76Jx38c6ojWHvw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=M5f5eqGvavsSQMvYmggCSUSdS9W0sW2PKLKo3OkFyr+HqRkZTOUb3QCegTl4qsiDY
	 sRYKRxn0Ppu1fVRtqgdpHK4yHqJT99NBHxkhSQpqyRQQldR0dS2/E7ISazZiRK6aYK
	 SdglK6QHxhUk8ifntU6CksiYATjh6Vd9HX5xhH66egI1nWsiq3s7npcfz9vfvNJgKV
	 jncxIa3thoRvmO1FpgxIUtsrFdVD0oQiqMBIxARkXTQiDAc28sguEX8PRQooHbUyod
	 eC/PWaCFcuObLJmirrz7BkFnxJFy/e66sstx8u8G2ymtCCu1R26H0maGCv07SsyBzZ
	 STc2KEF9caTjw==
Date: Thu, 21 May 2026 15:46:33 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>
To: Jun Nie <jun.nie@linaro.org>
In-Reply-To: <20260521-sm8650-7-1-bonded-dsi-v4-4-a4dd5e0850f1@linaro.org>
References: <20260521-sm8650-7-1-bonded-dsi-v4-0-a4dd5e0850f1@linaro.org>
 <20260521-sm8650-7-1-bonded-dsi-v4-4-a4dd5e0850f1@linaro.org>
Message-Id: <177939639394.2297482.6216353377976107855.robh@kernel.org>
Subject: Re: [PATCH v4 4/5] dt-bindings: display: Add Synaptics R63455
 panel support
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ffwll.ch,suse.de,kernel.org,somainline.org,linaro.org,vger.kernel.org,oss.qualcomm.com,lists.freedesktop.org,linux.intel.com,gmail.com,linux.dev,poorly.run];
	TAGGED_FROM(0.00)[bounces-109149-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 0427C5ABE63
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Thu, 21 May 2026 22:46:06 +0800, Jun Nie wrote:
> Add support for the dual-panel system found in the virtual reality device.
> This system consists of two physical 2160x2160 panels, each connected via
> a MIPI DSI interface. The backlight is managed through DSI link.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  .../bindings/display/panel/synaptics,r63455.yaml   | 125 +++++++++++++++++++++
>  1 file changed, 125 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/display/panel/synaptics,r63455.yaml:26:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/display/panel/synaptics,r63455.yaml:55:14: [error] syntax error: mapping values are not allowed here (syntax)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/synaptics,r63455.yaml: ignoring, error parsing file
./Documentation/devicetree/bindings/display/panel/synaptics,r63455.yaml:55:14: mapping values are not allowed here
make[2]: *** Deleting file 'Documentation/devicetree/bindings/display/panel/synaptics,r63455.example.dts'
Documentation/devicetree/bindings/display/panel/synaptics,r63455.yaml:55:14: mapping values are not allowed here
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/display/panel/synaptics,r63455.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1659: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260521-sm8650-7-1-bonded-dsi-v4-4-a4dd5e0850f1@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


