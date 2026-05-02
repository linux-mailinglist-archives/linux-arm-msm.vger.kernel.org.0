Return-Path: <linux-arm-msm+bounces-105564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCW/M2+c9WmSNAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 02 May 2026 08:40:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6384B12BB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 02 May 2026 08:40:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 710B4300B3E6
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 May 2026 06:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 165AA2D6409;
	Sat,  2 May 2026 06:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="d5ihMMXS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B581EFFA1
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 May 2026 06:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777704043; cv=pass; b=SZ+YwurviEXIv5GdhLGhHV5yxe+43huR6PWQN++6fnWxseEfICiw+ft+ppJfCQR3dj4mi+3tXQ9L1o1/PszIv3RbbnR+LYayjUCi0HeCjct3vH0bOhn04T3T0vH9PHnD9uyV3AaL0PgBdNW0T2jrgyE7rN9TfptWPDPvctvgktA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777704043; c=relaxed/simple;
	bh=QnUGDy9vOmiW6AGUw5tco79uLy1dgFjJxw7sFBwnGP0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=cK41/ntMzNH5F2yDn0DdMUtjaGixqPtGsmEuyese7bbSBYuWirePT6mzkB3Sti+q385IlHWSmrV1uYCHsxqs6iAE8Bo+iwUvnJZXzTVPfiosTDeTv5EoMr7JyMStTOouX6kQbvSeXjPynN9XtFEKLj0T+Y8daQUWzSyzdc2VhtM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=d5ihMMXS; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2b941cd869cso15120525ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 23:40:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777704041; cv=none;
        d=google.com; s=arc-20240605;
        b=lDII88OPY8gF9/o+COmb1EO8HEdOFJbG3PTw2tMkrHT6HfIo34FMPQ2PeygHxkG6TA
         7V4nHiXX5/IFhstV5xDblk8A5nh9EnLwhHWClhaZ95J8XuF4JeomwWNSLmANNsf8XDQO
         L1GtI6SYFeeXRUvVWh7wItTszTet3BvK82i3l2bRpR6RbRTbRQxu7G2ISeUBB6RUDzw4
         t9SsqEosRf7bzrU1DBf8XG+PWYi9kELAE0ODA4Pf4Hv3Qmyi+4Azx8LY4wU/lZf5AE3r
         NFMUSsXWFQ8VQN0x2RIYVWTlpacWGxua0sQkHNhU1P7LZo6aaTJdlOe1ydRzwFaUkAAJ
         WxGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=6P9sTgt6bNnGgSvDZzNunjjig+XiK5tMd74kW3KCPl4=;
        fh=LcG/ztp7blF/eFNbWLok/nv4lenB+BBpM046gST5EnU=;
        b=VeK57r4WQO1MDtYd+WXzWSTn/nso05uoAP3OHySqpBk+LbYgIBeNdjv2SDE5KQcKGw
         MlPcXA5MctlGB3m/0juOhptasLPsk1v6gzIBzb5KJmJ02Hqfi+7oDKSem3G+YipKBtLS
         z5Ib43P8ThIq84/W/eq87MC+wYsEKU0gRpT9AIOuyoE4PeXPyDigJtt2vzEISFsse0OS
         yzm0KFS3kirxnLQp3b7vYM5j6S646VkguniHdpLkJjXs6m8bS16sTPN5JI7w0Ty/jygm
         DJAc2dHKs0xyamagiYsXuNH4PqP/JsLI9Y2bVe30I+I6rpdB4r99DsXVl4N2qMGmxMFi
         ke+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1777704041; x=1778308841; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6P9sTgt6bNnGgSvDZzNunjjig+XiK5tMd74kW3KCPl4=;
        b=d5ihMMXSVcoc4fV7W0uNsSAAo/KkY+tRqbd7ir3Q61ILJJDyprpefpEhQ5t3j40xGI
         sTZnWWcBc71E6b2zf2/vs0bI1pyKb9+l2Gk5T9SXWHU/v0E+vzt2WGHXjHE6thLcYTbw
         MzEI5yGhVE15fUY+PBSzhZN8Bcvy23nH3UTS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777704041; x=1778308841;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6P9sTgt6bNnGgSvDZzNunjjig+XiK5tMd74kW3KCPl4=;
        b=bDGo94xzX1YMP27ecztg+EisYyYsflJVltmeTP7Pe/hDtnYCVGnVIP1blxS1hN2jSV
         wVg52r8RAuhL933h00H/KreIjHN8ceg6dmVHYF1wroWUDUjnw08uFcGGfGbSwy2zFsqg
         eWMvv0+ws0+R5ppBY1VqokPN1I2qw13ISnM0GQnbOKPzpHvulsYvF09+gMLwC+noHv9c
         XFmiBrNOEshDUgCkWY4gcaJ4bw1cUK2oj4WlMpPhII5d0Xl++55excvctaway8dASDa8
         lUFselh/TNz3feotVKipvBwpMQ/JVHElm0CdB5Dktm8Qo1A7GsmiUeWAZj9nmUwrhFHO
         g2kg==
X-Forwarded-Encrypted: i=1; AFNElJ9hlq/xEJGU8VG5zd4tDVmzinaDPmYyB01hgq9NNMclKzyf1qktYLhxpSXKIPiAnWO4QClXgtxHjkNc2+Ea@vger.kernel.org
X-Gm-Message-State: AOJu0Yya2Unq38PwSUjLBBXeApIeVyzlzM5zquRAs0Y3AIekBcjV7C3T
	Tr25dhoQcTmNrF0M10FKca0HSxkwm0SNNIvl7fYN1aXb3bJxIL4y//ohCb7t+ENxEIVOs8wEyuD
	9QVSSR06RRRlX7GwwEw/rJxtAVLsn96zd0gcPPpqjPw==
X-Gm-Gg: AeBDieuQDiI0MB0nq04tSKOlfI67G51boFRARfZ4YI71GHdpNKIWFZQJ+SWFmM8no14
	xhAfhwSvHM2foOIIxHxhnr39UEsuk6rfll45hmrasQ81pVRzSu+LVSfj/33FgKamaySmtU2VLIh
	XYz7yT53pbBcxY5Dxgg5PTBCja8F1yjGHiQJfCMDrpcKF+D1tfMlazumxO54qK4/2yiCVfUqphc
	ufoUUUUxfzKLv3pzNfqZNb4SydGPizXjjHf+QYbc6kQLv+drooyDoo/NMQ3AI7AMx2RMJKvhGFi
	np7ymeMzDFOUyTpcGk48NH9POt61lUHHAnMWKMtaxq8wwWY4K/MdopUFFjtAgggjs7D+wkN96YA
	IeAUOFEIvLNUPoQHUnXxAYQ2PIZeCpCbqDopxFb+Ux6L/ZBzcnaHspzrJ5oveiIv9stK9V5rdSw
	sZrcHqbyMoDUkPikYrh4ba5v8/+ve86P2aPq/J5CyZGpovD4gLkw+tnzZ1X3v41ODiqbhgwcc0S
	EgWx2g3/zpYpPWyYsqH
X-Received: by 2002:a17:902:f087:b0:2b2:ebed:7af8 with SMTP id
 d9443c01a7336-2b9f252f63amr14597745ad.1.1777704041251; Fri, 01 May 2026
 23:40:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Daniel J Blueman <daniel@quora.org>
Date: Sat, 2 May 2026 14:40:30 +0800
X-Gm-Features: AVHnY4KG0MAC71QfRSpCx26yLu5YPmowJSH5TFquWMsTeiQuLtPwKy0Qi0Yfg28
Message-ID: <CAMVG2su+V5fcZ9LOC0Qm3bpfnhpbmQdJackc7-RvfztDL_dajw@mail.gmail.com>
Subject: [7.1-rc1 BUG] System hang when reading clock controller sysfs
 'registers' files
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 4C6384B12BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[quora.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[quora.org];
	TAGGED_FROM(0.00)[bounces-105564-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[quora.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@quora.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,quora.org:dkim,1.252.0.0:email]

On a Qualcomm X1 Hamoa-based Lenovo Slim7x with upstream 7.1-rc1, when
reading any of the /sys/kernel/debug/regmap/*clock*/registers files
[1] (which could happen inadvertently with grep), we see a complete
and immediate system hang.

If this relates to clock/power gating, it could be avoided by
inhibiting that prior to the read. It also reproduces when booted with
"clk_ignore_unused pd_ignore_unused".

Thanks,
  Dan

-- [1]

/sys/kernel/debug/regmap/100000.clock-controller/registers
/sys/kernel/debug/regmap/1fc0000.clock-controller/registers
/sys/kernel/debug/regmap/3d90000.clock-controller/registers
/sys/kernel/debug/regmap/6b6c000.clock-controller-lpass-audio-csr/registers
/sys/kernel/debug/regmap/6ea0000.clock-controller-lpass-tcsr/registers
/sys/kernel/debug/regmap/aaf0000.clock-controller/registers
/sys/kernel/debug/regmap/af00000.clock-controller/registers
/sys/kernel/debug/regmap/dummy-clock-controller@0x0000000001fc0000/registers
--
Daniel J Blueman

