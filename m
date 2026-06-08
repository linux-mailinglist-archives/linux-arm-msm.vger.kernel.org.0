Return-Path: <linux-arm-msm+bounces-111894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bukhGSXGJmprkQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 15:39:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DD07B656B94
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 15:39:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="i/Hhfx+5";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111894-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111894-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 595D6300E021
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 13:39:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAF1A37D11A;
	Mon,  8 Jun 2026 13:39:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5739712F585
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 13:39:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780925985; cv=none; b=Mna8YHY4XLbvC1aeICusJThjAJIrBZRDcPyUVIc7NgSUODCJM3GFkV5k2n+UeW1nhpWHEHvhIu0fHm99Uf/VQTIjjL0cS3GMM23AK322xTCutbwVgYVh+nnKcHzgblgzUIRQuvGTMGlw5Wq6lL3ntgc4xeFfpDcddM1/J5C1zYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780925985; c=relaxed/simple;
	bh=C7dxKdcgfrcYjsHEoKJuUHkSmi5vz3fglU2QYjaF3mU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GXO3wiI7y3zAYIT2UR2Uw19J2B0nvnroewuh2y1Ph5cEc2QuiNfozGMvLTvlDVWHjpHJ97U3eCEfS5JC2xRmST76yYaOYxhLRdlO0qXwXdvQMGlaqBpwcflVe2w3DsLKVbgXgTo3np3xsNaCKtU3w9snlkrECyjtX1Swmdxd8z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/Hhfx+5; arc=none smtp.client-ip=74.125.82.175
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-304c520fe9aso6887867eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 06:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780925982; x=1781530782; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cnPr0God56443aVBHA2GEm21wYZNNjULBNiCWm5g3cg=;
        b=i/Hhfx+5RnNHlTRYf2EW5qjCH77f3dxchZZ8PDi449of7KDyD+BYCjJshJhpvo5UtT
         Obwf/y0CtWUKwcMnQme0oWwyxsSSa2kUvMV+qcOTPTijMD4XQ7HTMPKh0vOMWqBQphBK
         7jyjlxJwrhxiSbI5/YNVUhC4gLe/fU6YKqD9/0lONrBaG+DwvQMTrDzEjoTqvsy8mPeS
         3GKyuIHVJyIhnL5GzXnwT1I2kV6gvXJrdpTOzw23ZPesKka1eNSIg6dZNpMTL5q3z7Bk
         SsnSw8KRXqXSZTLT4WQQLwxfRutxkPBvWLS6/JAt7nOBp21/RgMWG/D2UKKyJ2PknAzm
         9Zvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780925982; x=1781530782;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cnPr0God56443aVBHA2GEm21wYZNNjULBNiCWm5g3cg=;
        b=i54AyKq93xJ3CJHf8qjOjpHB30pSaLo3Ab/lzCJsH1VP/FT2JgKIbF0F8X4rFOdMex
         IxHEQHSDJzog0vdghloTAHkdElv3RlkfFXe2oOB0zi5EGOrUZWlgi8qFfqW9u6MiKIlk
         PZ/UpnQUkOW/UYmx9MpXVyy576DBGvZ+H5yqHlZyhcOY/Ah4BKq6apmtuvmnPzTAfS27
         GJwL7aROh8Q/0Kuq/1uXgSA/dSy02S4EuiUhZVO3W0MxaB/CYhPCMBmcGL7d8Pxkv5p8
         G3gszse/uCH/D4OGBr4zJdg5kW0QbE9C6bi5X5mVTOH2xKXzPPdpP5rZoNOA5xHVosLB
         djTw==
X-Forwarded-Encrypted: i=1; AFNElJ92jwEzgL+27EuBNxc/BkhfKzd9M+VD08OFoRmT9Le44seu2E78YEEsyduo9+NvB2mGc7TOzGnoYtMblxZ8@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp4HNdQdmsoCLzJIumMw2y+s2xVfQut8yeqhTuB+PD3HLxrWWv
	Z1dua4o89dqZDQt/gaxMYA0mo8WR+jSu3n8i9UOMrjMs13Mmdq0S1LJ6
X-Gm-Gg: Acq92OGf5oKyQI+JWheFhBIO+m1i/v9yLQnHFDk6RJxSomDHdB0vxj8VFyIT2cO3p7Y
	71OtSUkIv8NzytIMOTngKMHwiD2tAaRbc7o1QrH886hY2ioq8ytagX7P73yFalai+rN9FZlofbp
	XLrMIgNuq5tQewOmta5x1F5eT6sRBJoD4qLOI8oZsBCPQJJvUwnv8Li29ELQCCFfhCtEWpn0VQw
	kNifN+vi/QTAACMnhoxeZA2yLuevnT20w2DgkMLgr63lFEeRC1lZDi4qvrn3i6aNhAmpju+D3vs
	tXYYqnynne+QR6ZWcsTvkHcHPc4Sd9k2zwXIsm3LvBMoKGmLiHAMVP6eLT4CnJGXD488X8XDKl2
	APK2N5qJXI2zyQCn06cBpYmF0eyiEX+6o/F9uDwNFdEg3+jSNQXTm5twDsZsP2Gh0vlH8sgidpV
	jTHis0CTjBEU77uN2kyehTkXTF6IKPl/hQi4sExE3owy/CeDnmszncc1QhfMzyV3vJdI7ePPKbH
	NNWOIVapudPA1W1qLd+zWY=
X-Received: by 2002:a05:7300:134a:b0:2de:cc07:e99 with SMTP id 5a478bee46e88-3077b357e08mr8719405eec.7.1780925982244;
        Mon, 08 Jun 2026 06:39:42 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-23.user3p.v-tal.net.br. [177.4.161.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db560d7sm23893449eec.5.2026.06.08.06.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:39:41 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Subject: [PATCH 0/3] ASoC: use scoped OF node handling in manual cleanup
 paths
Date: Mon, 08 Jun 2026 10:39:10 -0300
Message-Id: <20260608-asoc-of-node-scoped-cleanup-v1-0-9e3ac518dc2e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBAF0KuUWTuQphLRq4iLdPKrEUlCxkqh9
 O6Nunybt5KiRihdupUqPlFjTg39oSN5+HQHx9BM1lhnnOnZaxbOE6ccwCq5ILC84NNcOAwjhnC
 2J7gjtaFUTHH57dfb3zqPT8j7W9K27fe7jI5/AAAA
X-Change-ID: 20260601-asoc-of-node-scoped-cleanup-d3be3d927e64
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Herve Codina <herve.codina@bootlin.com>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1305;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=C7dxKdcgfrcYjsHEoKJuUHkSmi5vz3fglU2QYjaF3mU=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFlqxwQnzt4WfWDffoev+vtuCZqdWzUp9H6gV9CW54d/7
 FH14zsU2FHKwiDGxSArpsiyOmmR5Z6uB1fr41Z4wMxhZQIZwsDFKQATufyH4b9jiF7l3Ih1zPta
 2D3jXs60qw3Yw7HjVMCsY3eufWo4pa7H8M9g56/tC5oEE5myWILa59V1Oebwxm7e8PT34faaH0u
 MtjAAAA==
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-111894-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:broonie@kernel.org,m:tiwai@suse.com,m:lgirdwood@gmail.com,m:perex@perex.cz,m:herve.codina@bootlin.com,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:rjui@broadcom.com,m:sbranden@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:notify@kernel.org,m:cassiogabrielcontato@gmail.com,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[cassiogabrielcontato@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,suse.com,gmail.com,perex.cz,bootlin.com,broadcom.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.ozlabs.org,lists.infradead.org,kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cassiogabrielcontato@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DD07B656B94

Some ASoC drivers still manually release child OF nodes
when leaving child-node iteration loops early.

Convert these focused cases to scoped OF node cleanup
so early returns and normal loop exits keep the same node
lifetime handling without explicit of_node_put() calls.

- Patch 1 updates qcom_snd_parse_of() to use
  for_each_available_child_of_node_scoped() for link nodes and
  __free(device_node) for temporary cpu/platform/codec child nodes.
- Patch 2 updates fsl_qmc_audio to use
  for_each_available_child_of_node_scoped() for DAI child-node parsing.
- Patch 3 updates cygnus-ssp to use
  for_each_available_child_of_node_scoped() for SSP child-node parsing.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
Cássio Gabriel (3):
      ASoC: qcom: common: use scoped OF node handling
      ASoC: fsl: fsl_qmc_audio: use scoped child node loop
      ASoC: bcm: cygnus: use scoped child node loop

 sound/soc/bcm/cygnus-ssp.c    | 10 ++++-----
 sound/soc/fsl/fsl_qmc_audio.c |  7 ++-----
 sound/soc/qcom/common.c       | 47 ++++++++++++++-----------------------------
 3 files changed, 21 insertions(+), 43 deletions(-)

---
base-commit: 112b3b39550d94f94eb7e44fd865716835d9aab2

Best regards,
--
Cássio Gabriel <cassiogabrielcontato@gmail.com>


