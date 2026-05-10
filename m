Return-Path: <linux-arm-msm+bounces-106797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id zLeCMx09AGr8EgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 10:09:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 621D1503081
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 10:09:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7FE183003833
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 08:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8188435504D;
	Sun, 10 May 2026 08:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="ct9WOJPT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from slategray.cherry.relay.mailchannels.net (slategray.cherry.relay.mailchannels.net [23.83.223.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0372F8EB7;
	Sun, 10 May 2026 08:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778400539; cv=pass; b=BTaOjmikDWN4zHshflFhpMAoeddY7GYMsu7Ct9ZU7HoNLpeHi/SpVU15TaSrU6Sxs+w2STcemyYoZmhQelDRMF+ufYOsQswW8OwbANzT7iwGAQBY0N1ita7mUYHOC6qSZx2CTvcU7JT8r+hlyWBQdcwymlQNpqTENuVeTjaybtA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778400539; c=relaxed/simple;
	bh=P/22JueRT2YcfwST+Ai7cWP0aGRqFirus+R0SB45WMI=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=QUr/0NasPAPnoVxs7ggQuDFOqFnRU5LrEyZNWUeZxbgxA94x0Ut8WFHCSqAFC91zrQDXNoCxEeCo6TfFXiEU2GabxseiURiMNhFwcrtrF56wW58cDcBXyUONqDFhyy5ZcZfLqicJSzjj04zKP1I1deBrFwXhR5YJG9vczgNwf80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=ct9WOJPT; arc=pass smtp.client-ip=23.83.223.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id B727E413B0;
	Sun, 10 May 2026 07:01:46 +0000 (UTC)
Received: from de-fra-smtpout6.hostinger.io (trex-green-3.trex.outbound.svc.cluster.local [100.103.33.89])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id D873F41226;
	Sun, 10 May 2026 07:01:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1778396501;
	b=41XfNHc0jg1FqK9ypanM7oJEOAkRASZzvjzeJ3YQoT5j42i9mWI5/lCudTkPeKTjCKsDI5
	aoCuUnW5HfF8CZYCWp8FeU6N9lnr1YcYb38p92EoK26D0mCPACr3sPf1JVZoQb1S/tGrOB
	xEJtz+/+Jx9ySRiMCqJcEmkN2MMCNr+CBve79bSRt1zADxf3GuoV9ENor3FwoaO0WVt2Ox
	8MeKD/mrzahowNQ8RB4HSid2FZ1CN1yu4WJYXVAOdsFwwKe32TgT/NDEM9FJQ+o3IKP7Wm
	tc9/qj8czDHnAQTifTuLRARFy+Hk/K1oU75BW1TEziA/tkIlZABhYYTVFN6kHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1778396501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=nHTwWN16ekffh0PsCuHvfyu0Z3TUsh+Kl9hX0JiCNZg=;
	b=7KHtAeHbwR3U7e1fN+Sb1qIcX+67BJoEQFzRtdy5ZT1P/REx/i9LNuqC6j2ykBezQetRPF
	nHYUIRKpgy1Cnz0AI0iVxqWiYIAJQOLv7bWZQbtDMVIAEQFApNj3qE6podEq5KhCesXJlS
	TOVVOnQ93NvFNpXMNsXqtugZLkERXeqjvPCXyGvU1yXhPqVygr/9fB+43jpPmkDnI8zhmX
	6yzo+yNOUO4PIfDkaPphfWzHZCZV564SN1wJIuhuuPQ+T5uJxEdSQu6nOBpaEqfZW4WHNp
	oPV0zrCzbcU2KVMavkRZrJyYBHV4ZptJ8ITsiN7bvQ/BeOMki7x5zNpY5r+MKg==
ARC-Authentication-Results: i=1;
	rspamd-79cfc4d687-w9599;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Trade-Bubble: 2a619c8d5bad1f09_1778396506631_2140836899
X-MC-Loop-Signature: 1778396506631:710262432
X-MC-Ingress-Time: 1778396506630
Received: from de-fra-smtpout6.hostinger.io (de-fra-smtpout6.hostinger.io
 [148.222.55.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.103.33.89 (trex/7.1.5);
	Sun, 10 May 2026 07:01:46 +0000
Received: from [172.17.0.2] (unknown [125.163.203.7])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4gCv0Z02fnz3x62;
	Sun, 10 May 2026 07:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1778396497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nHTwWN16ekffh0PsCuHvfyu0Z3TUsh+Kl9hX0JiCNZg=;
	b=ct9WOJPTJmUc7OfF+riApYu0t5jC/5zI/lOYW97HgO9fnFrf/7JyoJ0+uCUJHflOxRgvjU
	1iMbBPKZJNwcnpvCW4ItOQZgCUEMy7l3Xbym3ED3HABmlCVzz2zha4nSfoNLINzJB0EjPS
	Fw4CUEBUnqJ1FW4LcGGVSHzubfyrjnovVt3GzKbjWO5hChfNDoaA3cR6GRFdlehljZh7FJ
	gtOfy326YM5A/QpfMr1pFBiomytAxTd2o+UXrSkTTbsbgUBJ6yxaAWjHaW4Q4vrCPWdtDU
	Y7HeTaGmLlcOoQflxuAYYT3QYaXBa+zDsfuQ+n9FnkYzDoHu83zmyY3LEmVqJw==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH v6 1/4] dt-bindings: iio: adc: qcom,pm8018-adc: add label
 property for ADC channels
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260510-pm8xxx-xoadc-label-v6-1-49700fd03005@smankusors.com>
References: <20260510-pm8xxx-xoadc-label-v6-0-49700fd03005@smankusors.com>
In-Reply-To: <20260510-pm8xxx-xoadc-label-v6-0-49700fd03005@smankusors.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 Antony Kurniawan Soemardi <linux@smankusors.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778396489; l=2438;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=P/22JueRT2YcfwST+Ai7cWP0aGRqFirus+R0SB45WMI=;
 b=6WkbgOkF+FKRgU1dnN25pJchwAv5UfY9nQ/kQupVKFQkDQLfKzk3tsCKQi52LMV5NEQQ7O2t3
 altWw3MiywlDPFmg+RjU32rl+ozgayr4o4L40IEfU+Ue//RcpcyM4eN
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Sun, 10 May 2026 07:01:33 +0000 (UTC)
X-CM-Envelope: MS4xfCPlUJzwSlZL7XgGFiWhQ00b15zlAW70QSrJYjidBWCEeE4w0EdBEqOlU5KTLdbzBLdr/xK4Cd+h++R42fAqCmtakXdYdd3St7Whkdf4IWlBwTuIgAxk 51LgG97bmh9ft9irkKcqcJa2Kgpp8m/4VkSU+0R0ts34mi9UaE1PLylg21kM73nwI1O7umTy0JeapOypYRH4SO7guPw+84Bv6yGWl1JSxwNTaUKzVz0Iy2SA wImJ6RqGPTZffup2FZR433ibL4Hz3JmHFAdcCM2ez+0rTBOOydHD0OurKdKy2UMdz8FjoeM9rdO2Ynh3eNVZMs9APOV6RW6qEBBIiQ+0+sZtwBVzT+RykWOy DDMIuview3DhwSMEEt0Bqm22nLzikYOIFClYHUKRvfW6KbUXz3WuL35QS8cnWbBtY7hkGBZ1J6RFZ/BpYxIJVTR2JUJBQ8NQfrhVEufnVBSJVJSETp3rMUUH uxrANpZ+Q8uP/+v/4vSVTDuUyQBk6WoODVv/TEU1JEVf3h7Ij1cwa18O+dQ0zfFpWhIKjkPCbKHpCpAuFrt7UOwdWswD5+sNSGLOnlUQ1jwf/Tl/EqnQ+80p tPgpsOYNWjCxKMrGy8X0luQgZ58djrEkQ1ElweoQbDTqhKINFr4gijBOC4OMpOUU+1Aesn11HVZ1CGo1lSSn2KAf
X-CM-Analysis: v=2.4 cv=etGNzZpX c=1 sm=1 tr=0 ts=6a002d51 a=aYg++IQuMqL9NhcFIsEovw==:117 a=aYg++IQuMqL9NhcFIsEovw==:17 a=IkcTkHD0fZMA:10 a=wxLWbCv9AAAA:8 a=Y5Iuzig1aeAEnQA3VkkA:9 a=QEXdDO2ut3YA:10 a=vyqAJ5GITisAxiZ2Wwa1:22 a=QJY96suAAestDpCc5Gi9:22
X-AuthUser: linux@smankusors.com
X-Rspamd-Queue-Id: 621D1503081
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[smankusors.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[smankusors.com:s=hostingermail-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106797-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[smankusors.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add a new optional label property for ADC channels to help users
identify each channel when reading values from the sysfs interface.

Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 .../devicetree/bindings/iio/adc/qcom,pm8018-adc.yaml      | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/qcom,pm8018-adc.yaml b/Documentation/devicetree/bindings/iio/adc/qcom,pm8018-adc.yaml
index c978c3a3e31a..63aac8de22ad 100644
--- a/Documentation/devicetree/bindings/iio/adc/qcom,pm8018-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/qcom,pm8018-adc.yaml
@@ -78,6 +78,10 @@ patternProperties:
       reg:
         maxItems: 1
 
+      label:
+        description: |
+          Unique name to identify which channel this is.
+
       qcom,decimation:
         $ref: /schemas/types.yaml#/definitions/uint32
         description: |
@@ -130,36 +134,47 @@ examples:
 
             vcoin: adc-channel@0 {
                 reg = <0x00 0x00>;
+                label = "vcoin";
             };
             vbat: adc-channel@1 {
                 reg = <0x00 0x01>;
+                label = "vbat";
             };
             dcin: adc-channel@2 {
                 reg = <0x00 0x02>;
+                label = "dcin";
             };
             ichg: adc-channel@3 {
                 reg = <0x00 0x03>;
+                label = "ichg";
             };
             vph_pwr: adc-channel@4 {
                 reg = <0x00 0x04>;
+                label = "vph_pwr";
             };
             usb_vbus: adc-channel@a {
                 reg = <0x00 0x0a>;
+                label = "usb_vbus";
             };
             die_temp: adc-channel@b {
                 reg = <0x00 0x0b>;
+                label = "die_temp";
             };
             ref_625mv: adc-channel@c {
                 reg = <0x00 0x0c>;
+                label = "ref_625mv";
             };
             ref_1250mv: adc-channel@d {
                 reg = <0x00 0x0d>;
+                label = "ref_1250mv";
             };
             ref_325mv: adc-channel@e {
                 reg = <0x00 0x0e>;
+                label = "ref_325mv";
             };
             ref_muxoff: adc-channel@f {
                 reg = <0x00 0x0f>;
+                label = "ref_muxoff";
             };
         };
     };

-- 
2.34.1


