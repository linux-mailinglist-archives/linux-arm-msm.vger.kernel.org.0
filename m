Return-Path: <linux-arm-msm+bounces-117766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nr32KZ55TmoHNgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 18:23:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F518728A6B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 18:23:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernelci.org header.s=google header.b="jh+x3/Bl";
	dmarc=pass (policy=reject) header.from=kernelci.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117766-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117766-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EFD1F30CDB85
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 15:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 307913F12E1;
	Wed,  8 Jul 2026 15:59:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5223541CB25
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 15:59:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783526347; cv=none; b=CnQi8yoOxHvSOxayBBEc/DIlddORS5t+1wV8ox4zJASImraR/lD+JosFFBVfEUvbgdKHze6zZQsNBMPCIOFRTj0AizM9QaHVPsKK1l/P0ekS1KE3p04yLWBqDvJZ4s3gHyDKKW8NB/KhCwr+LSQ7ZlC0Ey9fcLPl0gr29aPCDQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783526347; c=relaxed/simple;
	bh=sJx+ClAsFm76gAumUHmvwhE334XvNk0xenN5gm5kC+8=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=KN4HUVMzNZpllyLwejHETGGMqBUMoEQ6bDc239sdGkh6VdxaivutkdaHoEvGHpP5gBshQyun+dVec6kMM98H67mISB7YFnMoVE6NFi55KHOSD1qapberLCrcev2A9EzmefTypoDJ4Z+byoyaUGtV7EVsQQPpuJpDOnqxFOwi4Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=jh+x3/Bl; arc=none smtp.client-ip=209.85.210.169
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8478fe07f0fso860516b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 08:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1783526344; x=1784131144; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WkXO66TrzJTp7RGFcJjHSpBNdNk5ACgRuoFcG3f/XZ8=;
        b=jh+x3/Bl7KXKrmGJLpGwYqIbE82j0PqnzwhaMDNJQ1IAq0TKtB11gfYMXZe6+Lwimm
         6NmZGihgyD6NlQFF1GRSwSvOzb+fjBK4D/Qbp8w02IYR5Iz/XIHtE91HnuP/04oPWsVg
         MKJoFt2GtSjRzKXIWrH2g8cnQhzGgaNWlem+8rYg+5vP4svXZxCj4hiTT2ZhuSnE8IAE
         22V7JIUHmvOiWSt3RKyg+vn8HlRhUwkgBPu/MSqaLgKkBb6tK6ERbTcb9jECruRdhNiL
         fDAKWBfYoVLItVSYcP+KA0UlpWWIn8Inow50e2jDpg1m8WfYU1+00XmRTe08OFcf/xdY
         sdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783526344; x=1784131144;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WkXO66TrzJTp7RGFcJjHSpBNdNk5ACgRuoFcG3f/XZ8=;
        b=A9MGxOZNv2qATNRW9hPaEcggKL261HKA6P10RQwyoDMQoE7Tou+VfAcN2798w0Q995
         swwuGeT9iMKWeAS9lkp3Ex4WadhGDMaeauWmn/Fr6d+qVqkxJl/nbE7veZ7OCsyNEJ4i
         RdQ1W/FNV409t+rvx2rahIgNqmagsbCkZQ4olfE7302geIdt9QdJuZE2+Hv4thcnXkYg
         kt0rqqXA0NYflvjoepjoYl+LE1F+sSG3PeTjSqyy1eegflOidcn3H64Wz8T0CkDJz3Iu
         1t5lSWQRZRepCD/Z2v8AuxT2zVKBmqbKFjdwDhPUK2hYO0Hh7PDAwLdiX9K6r2r4r11O
         bQoA==
X-Gm-Message-State: AOJu0YzJqX8eZ0LkGuzEPQhQGzDhk9ySpPmoSCa1mzgvsht6davg5u+h
	tlLzcJKTg/yARZ2g4L7Wz9kj6PY3KvGIaJ5aUd454OjjpJm12o4+54wrxQFAzXa2o+U=
X-Gm-Gg: AfdE7ckCkoY4wEtVGwS00Rs+gfvFVd2LR8OkieqoHzkTiDXPU/eZgTw+GdK5k3vgptL
	7vsATlQieVspidUmypYL2gUTdiXq40zIqcYjS05IPQU+blDu6uqIXD43VTdZZsAg9FQvasQ5kcL
	FW4flYZB5TYJIs/bLfEpzRCvj3SAUZdc950ldfzC6yDdq+duVdtu11vdsCbA0xTUZwYmO1hC7eS
	0n669dJIbmcg2lKhxMUVUc7i+ZejpVLZad7LvgcfgEJFL9x0QNw8syfaeGCum97/MYiQQ2EhBqQ
	ph1NJLf/Jmk8gGeaPsjiQUmQQca3N7lRfI10LI61hCHU5bG22M5P05ClPDwshAxTVqbsrlxUQMg
	14AARrN3iC95mEQMvnBhbNvxtR3YwgE6lUFW27JLMe7R/de6xQ5zkvBzZ4QgUgCpN4e52w5xXSC
	kaETG02sCTTJBGlz2X
X-Received: by 2002:a05:6a20:244f:b0:3bf:77d7:6691 with SMTP id adf61e73a8af0-3c0bccb06e8mr3975898637.27.1783526344530;
        Wed, 08 Jul 2026 08:59:04 -0700 (PDT)
Received: from 963b246bc1b3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ac14f2sm22892882eec.27.2026.07.08.08.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: 
 =?utf-8?q?=5BREGRESSION=5D_qcom/for-next=3A_=28build=29_expected_expression_?=
 =?utf-8?q?before_=E2=80=98=7B=E2=80=99_token_in_drivers/soc/qcom/ubwc=5Fcon?=
 =?utf-8?q?f=2E=2E=2E?=
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>
Reply-To: kernelci@lists.linux.dev
Date: Wed, 08 Jul 2026 15:59:04 -0000
Message-ID: <178352634367.7367.3290610432164523879@kernelci.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernelci.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernelci.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117766-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kernelci-results@groups.io,m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bot@kernelci.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernelci.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bot@kernelci.org,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	HAS_REPLYTO(0.00)[kernelci@lists.linux.dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,lists.linux.dev:replyto,vger.kernel.org:from_smtp,linux.dev:email,kernelci.org:dkim,kernelci.org:mid,kernelci.org:from_mime,kernelci.org:url,kernelci.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1F518728A6B

New build issue found on qcom/for-next:

---
 expected expression before ‘{’ token in drivers/soc/qcom/ubwc_config.o (drivers/soc/qcom/ubwc_config.c) [logspec:kbuild,kbuild.compiler.error]
---

Log excerpt:
=====================================================
/tmp/kci/linux/drivers/soc/qcom/ubwc_config.c:148:9: error: expected expression before ‘{’ token
  148 | +       { .compatible = "qcom,shikra", .data = &ubwc_0_0_hbb15, },
      |         ^

=====================================================

When fixing this issue, please attribute this report according to the
patch submission rules:

Reported-by: kernelci.org bot <bot@kernelci.org>
Link: https://lore.kernel.org/all/178352634367.7367.3290610432164523879@kernelci.org/

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:686076d83905876d11fc32af534dc65d6c0f41ee
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git
- commit HEAD:  3d7933b9ed00caea0291d528caafe1a4c87dc9b8

# Builds where the incident occurred:

## multi_v7_defconfig on (arm):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a4e6d5806fecb7f474e49de

#regzbot introduced: f86573e68e56a7df7d54eb58101ac413ba731996..3d7933b9ed00caea0291d528caafe1a4c87dc9b8
#regzbot link: https://d.kernelci.org/i/maestro:686076d83905876d11fc32af534dc65d6c0f41ee

#kernelci issue maestro:686076d83905876d11fc32af534dc65d6c0f41ee

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

