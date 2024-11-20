Return-Path: <linux-arm-msm+bounces-38533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA82A9D3E64
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 16:02:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F764282357
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 15:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1A511AA787;
	Wed, 20 Nov 2024 14:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Qw8olUjd";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="LVxVwrBT";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="bNMMuUc6";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="3Jn0I07R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60AA1714CD
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 14:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732114404; cv=none; b=lBJJLBJIITPNfdsYW+XTD8ifz7wb9ce2clTY86Q9Lt4Qhf5RasqUcSvG+W5iMhfW9d/QC/Z3sA9KGNhxCJ/NDPO7sF2wSWgUuhAtXqcv2jlyb8iaPaQOuYrMjbFskZghT4246kuuJ6+zQtWYhSG9GPPcdTtPZ5vCuy5OEBnxw0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732114404; c=relaxed/simple;
	bh=U7kjrGCZ9PqAOjimlBmNTH32A5F8SnmOObHpu7MrLa4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aOnnirhiRWASpvP6EK2mlYQKwLq4N4YnB6jbOnlV8Rv0s7gsuqN85JE6ogNPMZ59bvfI2g4yAP0mxA1iGSMqfKzG4FFvo/eHtmVuOkxVqq85G0bKpC+BofsfTIv1UDZIHDnHVN79UEZ8Q88/DxcfHw0XGPXnoSATCKRM+TlzOfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Qw8olUjd; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=LVxVwrBT; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=bNMMuUc6; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=3Jn0I07R; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id ECD561F79B;
	Wed, 20 Nov 2024 14:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1732114401; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=/JtcxRVyojzrhZubTsRcBODGGrGAf4Z+/nH9fUtnHSQ=;
	b=Qw8olUjd7tpX0u7OWWdUmulgsc7IibELTMpkcAmmSdkTUDqNSJRkJeRTa1NCc1ZqMCyLLI
	RPCqznnhE8kxU0x1q+aGpwaif/6B5IC2yZm7suYKUdVr5XWvyjg4dRaGDbKyM3yAXWHv0F
	QIojlwRXaOwBT1+3rGKnTvlaHsnSspA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1732114401;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=/JtcxRVyojzrhZubTsRcBODGGrGAf4Z+/nH9fUtnHSQ=;
	b=LVxVwrBT+9jXQ7qns4e8EREiN7ijKvsMqurEJBIPBESD8AHXMipoUitwYgJqN4GIcNUpaH
	kAOFMTe/SD6aM/Bw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=bNMMuUc6;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=3Jn0I07R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1732114400; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=/JtcxRVyojzrhZubTsRcBODGGrGAf4Z+/nH9fUtnHSQ=;
	b=bNMMuUc6TXOhu988VA+6D6ZM4O2D3Yt8C2kABakBIOYUsllfsAKkdYzbEWIT4XPhSnz8wP
	GZphlL4eA04MRcpxXIQPRZmXJg0PxzM/a6BtFWQYEUzO4ChEIfV/zksNECWvkifOSbe7jM
	GSOsHCv2tHIozfHhkb7U2UYbiafCUO8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1732114400;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=/JtcxRVyojzrhZubTsRcBODGGrGAf4Z+/nH9fUtnHSQ=;
	b=3Jn0I07R5sELbK6JLOd5XoHKLiU57BsdDEJgnMWt60AyrIwaoJh5XawjcXL82D8GFPsK2t
	7uj8IjW/NiwbAUBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AD41D137CF;
	Wed, 20 Nov 2024 14:53:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QeeVKOD3PWfvOQAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Wed, 20 Nov 2024 14:53:20 +0000
From: Petr Vorel <pvorel@suse.cz>
To: linux-arm-msm@vger.kernel.org
Cc: Petr Vorel <pvorel@suse.cz>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	David Heidelberg <david@ixit.cz>,
	Joel Selvaraj <joelselvaraj.oss@gmail.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Dylan Van Assche <me@dylanvanassche.be>,
	Gergo Koteles <soyer@irl.hu>
Subject: [RFC PATCH 1/1] arm64: dts: qcom: sdm845-oneplus-common: enable resin/volume down
Date: Wed, 20 Nov 2024 15:53:16 +0100
Message-ID: <20241120145317.31406-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: ECD561F79B
X-Spam-Level: 
X-Spamd-Result: default: False [-1.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[suse.cz,linaro.org,ixit.cz,gmail.com,dylanvanassche.be,irl.hu];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.cz:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -1.51
X-Spam-Flag: NO

OnePlus 6T (fajita) downstream device tree contains volume down GPIO key
and resin. I suppose it is also in OnePlus 6 (enchilada).

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi

reason for RFC:
* Unfortunately untested on the real device.
* OnePlus 6 (enchilada) is nearly identical, but I haven't compared it's
  device tree.
* Other sdm845 based devices just enable resin/volume down key the same
  way. But what confuses me is "gpios = <0xe7 0x05 0x01>;", does it need
  to enable gpios like sm6375-sony-xperia-murray-pdx225.dts in
  795ee50e55f4 ("arm64: dts: qcom: sm6375-pdx225: Add volume down GPIO key") ?

Below is snipped of the OnePlus 6T (fajita) downstream device tree.

Kind regards,
Petr

gpio_keys {
		compatible = "gpio-keys";
		label = "gpio-keys";
		pinctrl-0 = <0x2f7>;
		pinctrl-names = "default";

		vol_down {
				gpios = <0xe7 0x05 0x01>;
				linux,can-disable;
				debounce-interval = <0x0f>;
				label = "volume_down";
				linux,input-type = <0x01>;
				linux,code = <0x72>;
		};

		vol_up {
				gpios = <0xe7 0x06 0x01>;
				linux,can-disable;
				debounce-interval = <0x0f>;
				label = "volume_up";
				linux,input-type = <0x01>;
				gpio-key,wakeup;
				linux,code = <0x73>;
		};

		cam_focus {
				status = "disabled";
		};

		hallsensor_key {
				gpios = <0x34 0x7c 0x01>;
				debounce-interval = <0x0f>;
				interrupt-parent = <0x34>;
				interrupts = <0x7c 0x00>;
				label = "hallsensor_key";
				linux,input-type = <0x05>;
				gpio-key,wakeup;
				linux,code = <0x00>;
		};

		cam_snapshot {
				status = "disabled";
		};
};

...
qcom,power-on@800 {
		qcom,system-reset;
		compatible = "qcom,qpnp-power-on";
		qcom,pon-dbc-delay = <0x3d09>;
		interrupts = <0x00 0x08 0x00 0x00 0x00 0x08 0x01 0x00 0x00 0x08 0x04 0x00 0x00 0x08 0x05 0x00>;
		qcom,kpdpwr-sw-debounce;
		reg = <0x800 0x100>;
		interrupt-names = "kpdpwr\0resin\0resin-bark\0kpdpwr-resin-bark";
		qcom,store-hard-reset-reason;

		qcom,pon_1 {
				qcom,support-reset = <0x00>;
				qcom,pull-up = <0x01>;
				qcom,pon-type = <0x00>;
				linux,code = <0x74>;
		};

		qcom,pon_2 {
				qcom,pull-up = <0x01>;
				qcom,pon-type = <0x01>;
				linux,code = <0x72>;
		};

 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 46e25c53829a..6cb074de7696 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -847,6 +847,11 @@ speaker_default: speaker-default-state {
 	};
 };
 
+&pm8998_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+	status = "okay";
+};
+
 &venus {
 	status = "okay";
 	firmware-name = "qcom/sdm845/oneplus6/venus.mbn";
-- 
2.45.2


