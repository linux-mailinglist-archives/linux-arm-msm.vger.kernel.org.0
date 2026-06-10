Return-Path: <linux-arm-msm+bounces-112328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FCp2MmEVKWqIQAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 09:42:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B514666B41
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 09:42:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=W6LRUUiy;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112328-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112328-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F0755301FB31
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 07:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AA463932F7;
	Wed, 10 Jun 2026 07:41:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE046391E5C
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 07:41:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781077314; cv=none; b=aizp97qI4b5lUqr3VInHN8J2EfkjGIQ2iBgudAm9zOcAau7KoIeNfVaSi902fpxm0rr6WTuTjSFUd5wz01THzmZak9sIIs20EPt73ZX15WXnn1E6qLBhHDEY4NVmMdlxkUi5R+THHABq9kAODPBIgvM17DqobvfUwPEh8GpS0gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781077314; c=relaxed/simple;
	bh=6m2M19WQ9ZB1jbnViPAEMFv3Bu7qYS7v74KK6JM2laE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rfRoO8LJIfiL8P1sAdE+MOAFAH5Kc/5t/+EIAVsvZWfphIkiapJea7Y1KsbCu9gaRvTeTRdVMiIAwwSzfQhOLJdr704WpcX34hq9ccUSRxzoi+sYtyzTLd8zX2LKn1UMhyq0YIE362Iq0npJo4X3OSUBAs1J0CxOhweuHazij1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W6LRUUiy; arc=none smtp.client-ip=209.85.221.49
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45eedc94d37so3250297f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 00:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781077311; x=1781682111; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QT7hmcIZOxd/xtnUIe7SCN6JWFg63IatYmcGsjK/NhU=;
        b=W6LRUUiyIT+E+2F9ROcKYFSKbrZWyKJDd3VfYxjOa5HvAYJ4CEge+xLT5RnV/bBssF
         sVi1ES4HgZ1EoHk1pajbuZUQkAz9//kSyvezftabBW3mBLa1E+dvNNbcDn3fIadIT7s/
         k+sBltBnq6mfw7TQ4Kvdyl1+li22f+htOMgHku3ukAth2351pJRYCHKFdLzJHfF+Ij8x
         kGz5RFDu0tO4BMnkcyorm9idm9jDbBPW9fAzjnkFYe6sceifStI2hWi7IXFhAUnfMWqm
         2UrVkuFbiQWaeuluaev9ZE3Z0mNuJPKvEF97pE/rMrsCYNSErujDzXgnwyb4Md10/MZx
         0RuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781077311; x=1781682111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QT7hmcIZOxd/xtnUIe7SCN6JWFg63IatYmcGsjK/NhU=;
        b=ZmF9Slx8jhrcb8cQlrgamyJaM4prBP1oVER4jYPI+sE/4D0SMdo0/dvX+ehMz7x3Bf
         n2IZlzYEy/yxj7LB5p7wnr6VqqHn7x5lZn/ox4fz5mbAipQzKRDCvaX/Ca6U7cLpObpR
         0HVoNgdtJFsNOVlu19q+MClbTiCo4n7Dun0KSwDjboC9kwdGKtJtcTMrMxmOD3zaObQz
         AunZoBa+DGgSXaytnagw55gjfPK9SOeNzep9CrZs/ROtitPVC4Fck37At1Tb7soAAcj8
         VEtruY8BF2woGQjkRfe+kH24JyKr7/LZtUXoAlTGQQF/BM0ajBRyhG/BClXar0fdaiof
         Lucg==
X-Forwarded-Encrypted: i=1; AFNElJ9/sCoJDBRrKsUqo9gzpwI+dt5fRrDVTluVRoN/dVYuXw0tpU982LwDJjtVUWzdDcarRMDIq5zFKj7QHh6l@vger.kernel.org
X-Gm-Message-State: AOJu0YzqOe+T0hMArckbaQ61WbVzfzH0kgGT5rOx8Ysx1Fw8Ga8sHC8Q
	ScJkHWNMAz8lgqVkcyQQvGKKSce+sDD0EW2Uut2oXo0mz3ZJqLNKMYwr6L5Af7JxhZs=
X-Gm-Gg: Acq92OGI5oiJzsBtaT1p+M4AwGvBJXgBBgKZ/ccRgJXu7p0k0YDKEl0dIZI5w20nO0Z
	KY4B4YxyAoiH2rzumk/bKeuiv6fzE8S6+/5mpv8pSRwHofTOMrTkmlDq4YaA4CT+ftJLtaALBGJ
	gIHYyseGtYfximgjvi9Q1VJgOR9G9q1Cbsxark/VVtc1xwiDodTNUYcSymVMAWhUQGb65QvayWu
	i3tG8DzuFXb89c/hj6JrptvBJYh8be0MQoGRcvQIDkqy+qlBHNABGIMRII/oCyhRCDgnmqJhhEY
	NCsJciUR5GIajXAxVZ38TaRyg84vYti+Yo7hNoO/fyCdOga5rRqgEqnhr3FSkzmaDh0SmbuH3zP
	3vnnHYGcCFjrtIjDoES/0iJa+ajsP7F0Bc52x9ujSFqsPuB4K5kZxuL60jw4oEe+8HzMUysfRtO
	cjhbmK599YwSe0joDjCdEqlDP7TXTLqQ4XD+ZImBTafNurrPjLF7W3dks=
X-Received: by 2002:a05:6000:22c5:b0:45e:ef4a:8192 with SMTP id ffacd0b85a97d-460566d9bd6mr7676414f8f.38.1781077311192;
        Wed, 10 Jun 2026 00:41:51 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm69161344f8f.20.2026.06.10.00.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 00:41:50 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 10 Jun 2026 09:41:45 +0200
Subject: [PATCH 1/4] ASoC: qcom: audioreach: compute active channel maps
 from channel_map
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-1-18bb19c5ca22@linaro.org>
References: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-0-18bb19c5ca22@linaro.org>
In-Reply-To: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-0-18bb19c5ca22@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kancy2333@outlook.com, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7360;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=6m2M19WQ9ZB1jbnViPAEMFv3Bu7qYS7v74KK6JM2laE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqKRU7HPL2eYdbYSyE3wOvBNVCFwzMJMWOtKeQjXXf
 gD/2aWeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaikVOwAKCRB33NvayMhJ0cqyD/
 9omKDa9RjH9KTIjVUBAj1jNBVZuuAwj4riG8MBK7+3cOy84tRIxT1TiDKosuyh7p/kYTGpdFPHL7/w
 cQSPHyQBTPWmqjTwOEe65rELu4peh+Nvk4OarPRcYCMIG5Mvmp7Z8kIhwKwdoAx1NSn0hvrk6Ljy2c
 scHbQZJDoF4ywoWqwEEGX55P8EcRYMSpNCu9AtLO1uX+UPuBQAZQDYi4KCShLqnAA60YFFDC/oOXnd
 t0AVhZ62/jQ3qLNWY/coFL1Q+5T8iT/FtE0Py6OrIe+OK48YBXFsaO7AxDsGG5Wl4Jrl1QejrlzaVZ
 KwYJnrTXGV4GImZK8sG9FUAYbpboTFqv5T19DCjH7u6EI38j2W59kbO9kGoQMWim+gF98g8qz/cPR+
 QIpyveupAJaSAe9vYfP8kufgTAIF+UGgjOUc0KPxNb5WPLCwkDriTlC5uQOOzEKUKy39/eQ4LIC/7z
 kVSmi5Cd4rsUh22C2qbCm9qcR1OT0o8CNkYaIXhq77IGc6VbzkR19DHpowLR5p3OK08uvEgsF+ieEx
 NGn4QvYHe38RTL19zOxSERHJaynfnOXGbhN2rOxDPmGj7uZOVxG3sH8EETsX9qrp5V+wl0U1bG8BB+
 jFjD5BfNk/RfnzwvQgrULRZQTnrgLTQSoIO2OYsJ3K4JyT3TVfsOW5+18XPA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112328-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kancy2333@outlook.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:neil.armstrong@linaro.org,m:srinivas.kandagatla@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[outlook.com,vger.kernel.org,linaro.org,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,vger.kernel.org:from_smtp,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3B514666B41

The Qualcom SM8650 based Ayaneo Pocket S2 gaming device has a set
of 2 WSA speakers connected on the WSA2 lines.

But the Audioreach DSP only handles WSA2 in pair with the WSA
interface by using the upper bits of the active_channels_mask
for WSA2 and the lower bits for WSA:

/-------------------------------------------------\
| Bits  |     3    |     2    |   1     |     0   |
|-------------------------------------------------|
| Line  | WSA2 Ch2 | WSA2 Ch1 | WSA Ch2 | WSA Ch1 |
\-------------------------------------------------/

Setting only the WSA2 upper bits is perfectly valid and
functional but the current Audioreach code builds the bitmask
from the channels count with:
	active_channels_mask = (1 << num_channels) - 1;

In order to enable the WSA2 bits the channel count should be 4,
but the lower WSA bits are then also enabled and the DSP errors
out when trying to play on the disabled WSA interface.

A solution would've been to add a fake WSA2 topology element which
would be translated into the top bits only, but it's not clean and
add some special exceptions in the generic Audioreach code.

The solution suggested by Srinivas is to use the channel mapping to
set this bitmask.

This works but makes all the other calls using the channel mapping fail
because the DSP requires the channel_mapping table to start from index 0
and using num_channel length in order to apply the mapping on the
active_channels_mask bits in order.

So we need to skip the empty channel mapping entries in all other
users of the channel_map to build valid channel_mapping tables.

This should not break any other usecases since the default channel
mapping always start from index 0, and will add flexibilty to allow
some special non linear mapping for other interfaces as well.

Suggested-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/qdsp6/audioreach.c | 47 ++++++++++++++++++++++++++++++---------
 1 file changed, 37 insertions(+), 10 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index a13f753eff98..9b80cfa56e8a 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -703,6 +703,7 @@ static int audioreach_codec_dma_set_media_format(struct q6apm_graph *graph,
 	int pm_sz = APM_HW_EP_PMODE_CFG_PSIZE;
 	int size = ic_sz + ep_sz + fs_sz + pm_sz;
 	void *p;
+	int i;
 
 	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(size, APM_CMD_SET_CFG, 0);
 	if (IS_ERR(pkt))
@@ -741,7 +742,12 @@ static int audioreach_codec_dma_set_media_format(struct q6apm_graph *graph,
 
 	intf_cfg->cfg.lpaif_type = module->hw_interface_type;
 	intf_cfg->cfg.intf_index = module->hw_interface_idx;
-	intf_cfg->cfg.active_channels_mask = (1 << cfg->num_channels) - 1;
+	intf_cfg->cfg.active_channels_mask = 0;
+	/* Convert the physical channel mapping into a bit field */
+	for (i = 0; i < AR_PCM_MAX_NUM_CHANNEL; i++)
+		if (cfg->channel_map[i])
+			intf_cfg->cfg.active_channels_mask |= BIT(i);
+
 	p += ic_sz;
 
 	pm_cfg = p;
@@ -840,7 +846,7 @@ static int audioreach_mfc_set_media_format(struct q6apm_graph *graph,
 	uint32_t num_channels = cfg->num_channels;
 	int payload_size = APM_MFC_CFG_PSIZE(media_format, num_channels) +
 				APM_MODULE_PARAM_DATA_SIZE;
-	int i;
+	int i, j;
 	void *p;
 
 	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
@@ -860,8 +866,12 @@ static int audioreach_mfc_set_media_format(struct q6apm_graph *graph,
 	media_format->sample_rate = cfg->sample_rate;
 	media_format->bit_width = cfg->bit_width;
 	media_format->num_channels = cfg->num_channels;
-	for (i = 0; i < num_channels; i++)
-		media_format->channel_mapping[i] = cfg->channel_map[i];
+	/* Convert the physical mapping to a logical mapping of the channels */
+	for (i = 0, j = 0; i < AR_PCM_MAX_NUM_CHANNEL && j < cfg->num_channels; i++) {
+		if (!cfg->channel_map[i])
+			continue;
+		media_format->channel_mapping[j++] = cfg->channel_map[i];
+	}
 
 	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
 }
@@ -1080,6 +1090,7 @@ static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
 	struct apm_pcm_module_media_fmt_cmd *cfg;
 	struct apm_module_param_data *param_data;
 	int payload_size;
+	int i, j;
 
 	if (num_channels > 4) {
 		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
@@ -1113,7 +1124,12 @@ static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
 	media_cfg->num_channels = mcfg->num_channels;
 	media_cfg->q_factor = mcfg->bit_width - 1;
 	media_cfg->bits_per_sample = mcfg->bit_width;
-	memcpy(media_cfg->channel_mapping, mcfg->channel_map, mcfg->num_channels);
+	/* Convert the physical mapping to a logical mapping of the channels */
+	for (i = 0, j = 0; i < AR_PCM_MAX_NUM_CHANNEL && j < mcfg->num_channels; i++) {
+		if (!mcfg->channel_map[i])
+			continue;
+		media_cfg->channel_mapping[j++] = mcfg->channel_map[i];
+	}
 
 	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
 }
@@ -1127,6 +1143,7 @@ static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
 	struct payload_media_fmt_pcm *cfg;
 	struct media_format *header;
 	int rc, payload_size;
+	int i, j;
 	void *p;
 
 	if (num_channels > 4) {
@@ -1166,7 +1183,12 @@ static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
 		cfg->q_factor = mcfg->bit_width - 1;
 		cfg->endianness = PCM_LITTLE_ENDIAN;
 		cfg->num_channels = mcfg->num_channels;
-		memcpy(cfg->channel_mapping, mcfg->channel_map, mcfg->num_channels);
+		/* Convert the physical mapping to a logical mapping of the channels */
+		for (i = 0, j = 0; i < AR_PCM_MAX_NUM_CHANNEL && j < cfg->num_channels; i++) {
+			if (!mcfg->channel_map[i])
+				continue;
+			cfg->channel_mapping[j++] = mcfg->channel_map[i];
+		}
 	} else {
 		rc = audioreach_set_compr_media_format(header, p, mcfg);
 		if (rc)
@@ -1243,7 +1265,7 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 	struct apm_module_sp_vi_ex_mode_cfg *ex_cfg;
 	int op_sz, cm_sz, ex_sz;
 	struct apm_module_param_data *param_data;
-	int rc, i, payload_size;
+	int rc, i, payload_size, j;
 	struct gpr_pkt *pkt;
 	void *p;
 
@@ -1284,14 +1306,19 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 	param_data->param_size = cm_sz - APM_MODULE_PARAM_DATA_SIZE;
 
 	cm_cfg->cfg.num_channels = num_channels * 2;
-	for (i = 0; i < num_channels; i++) {
+	/* Convert the physical mapping to a logical mapping of the channels */
+	for (i = 0, j = 0; i < AR_PCM_MAX_NUM_CHANNEL && j < num_channels; i++) {
+		if (!mcfg->channel_map[i])
+			continue;
 		/*
 		 * Map speakers into Vsense and then Isense of each channel.
 		 * E.g. for PCM_CHANNEL_FL and PCM_CHANNEL_FR to:
 		 * [1, 2, 3, 4]
 		 */
-		cm_cfg->cfg.channel_mapping[2 * i] = (mcfg->channel_map[i] - 1) * 2 + 1;
-		cm_cfg->cfg.channel_mapping[2 * i + 1] = (mcfg->channel_map[i] - 1) * 2 + 2;
+		cm_cfg->cfg.channel_mapping[2 * j] = (mcfg->channel_map[i] - 1) * 2 + 1;
+		cm_cfg->cfg.channel_mapping[2 * j + 1] = (mcfg->channel_map[i] - 1) * 2 + 2;
+
+		++j;
 	}
 
 	p += cm_sz;

-- 
2.34.1


