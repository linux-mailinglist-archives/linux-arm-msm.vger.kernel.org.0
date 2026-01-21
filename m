Return-Path: <linux-arm-msm+bounces-90086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKKVDEA+cWnKfQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 21:59:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A6D5DB94
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 21:59:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2B18B80E490
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 20:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FA8A34A76D;
	Wed, 21 Jan 2026 20:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cPlQvft/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548653161B3
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 20:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769027409; cv=none; b=gInJjVaLCUQFefMQlnyax/myShZTHKUbChwYUw645P3Lunh9I4iWpo/lCwYJhe1aK0I3ICwGhG774Sol9s669PO0WD8fkEvSaalS037oXQAJrpbtmxQdtcjOlnN4IkdA7Jel2OtfEOlj+pD5G6RXR0vOrbtZFc3JtKwL0kos9SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769027409; c=relaxed/simple;
	bh=UrNR0zhNEL2LbU5qqZvVw3LbEcb7Xoh8iARAGOnl8H4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iXBWjHyisDjubh+k8WaLt1mWmCYOa9b4FfYOfAp6gjVQpJl97/X3yysXCLLjpajfg4bVwxr2rmLYC95teZ+vtAb+bwUClSee4kl0oEGKdOmtT6kKUcoWB3iB8Ke0o/avbPN/TamdYlkxhIDT2sXJszpgslRgmJwoeaGpS3SvGV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cPlQvft/; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so2819845e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 12:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769027405; x=1769632205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wWtyhiw5Pw8utX8GmzQbj+h2PZ/f4XjFSExYzPcQ2Ks=;
        b=cPlQvft/TaOORNmf7J0ZAlrHalVaJ4m4EwgynheB3XU5+TOe0YIAjHqpNYaDP7K4AR
         JKhTbIYQ5jxjBm8ermpfkkGAZILA+hP4vuFVWXQ0orzcD/2h2cuzUxqeqA6UJD6W1XOR
         PSkye6mebE+NIYWS6Tpiiw2OTZAoSda363Jx6JL1Qu5oMgD1PUP5uzkoYfS170IVoZbj
         eSZs/sooMq2q1UWgVvwMj1x45LDFqkTQA1rbl3UE2alRNPX3l9KcjPRojb9vr+SAYNuf
         rYQq4wCcVlJPGqwHIokyZx7u868WRcQWsNAa4Kindw3OQg/Ymi1Rv7MOUxpZJrTAOmP2
         QFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769027405; x=1769632205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wWtyhiw5Pw8utX8GmzQbj+h2PZ/f4XjFSExYzPcQ2Ks=;
        b=HpqFU8R8Naw2mRBu7A990+4D1JM0zFN9ZThovTutWnvmc7liSpJi005OWStQd7T1WO
         QZovZ54FryBlbZucftq2KHngxthbHFGg0mFgpVk5Etfgd+Bg6Ho9lJtXKAfLvRsud1OH
         58odO7nda5ewaTIKaQmlj3i3rhlJIJYRv7bf2NBG88N5JK4Rs3NeoT9rwKjG05YSgi0l
         beZ7O79wPJ/0rwOOknqeWMSd5PHcqn7aQKxt/MF+g97BTCSLpF2EI4GNmqxXAemEnH0j
         quHzdFwIwuvjSjf5YRGcTlo91TOBPyUbB6S8IfyWE3NTTtllBQEQy3Py455GPoa9/xc7
         S7/A==
X-Gm-Message-State: AOJu0Yw7QSIJpx/TByCR4wrkKhIJDYqoBvotNTsyMhdxe8Vo8JvXQhsk
	y2cm9PTn63+MzRlLM+2PEuuAJoYnAos1p/Sq6D4flk7tG/Uv0XChhrkt
X-Gm-Gg: AZuq6aIs/S0qoHyvl8fDdPRS8uyfBHnDKfysxVcPLYBL6Z2KxZ09dfwtsAiBPiOuoiG
	Iph7FPGG4gjj8HNKX3hATDVctEmZ8vvEfCztuXNjyIskhAkSiF1LE0UzT6y2JFUK83IQxXVswQH
	tB7ItTfN4GACsRfhnkW4+t98RD6/EOdssOOnQn455Dlc+GALl4NLbubOISNgIaAj+bYeZOEaHGR
	eEdyv33dISiujAM3bhJWLMjFk6oOSZObx3C7BYfsyPfR35Q7ruX7nahwwRypIU2M4wG5osgiZxP
	1JC6kjh/R9s4XTCHIjYEmkqd9bXywMDdOwBxaJsXlMGOcZS/aiiRR0sHwvVZSkSyMY3Yq2ygMqb
	boWV8/kSwSe/tp3H8xfZeFmRjCzES2MLzhk2uHiCEW2M2AhsizJd6DFRNATKd00QrpMIS4o0po1
	Fc+IyTsvXFGqm0laFDIIxQduI8FQ==
X-Received: by 2002:a05:600c:8b09:b0:47e:e4f5:1910 with SMTP id 5b1f17b1804b1-4801e34a14fmr262542585e9.34.1769027405363;
        Wed, 21 Jan 2026 12:30:05 -0800 (PST)
Received: from unknown.tail46804.ts.net ([78.209.12.160])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-480470cf1acsm11819065e9.14.2026.01.21.12.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 12:30:04 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/7] arm64: dts: qcom: sdm660: add common Xiaomi SDM636/SDM660 include file
Date: Wed, 21 Jan 2026 21:30:01 +0100
Message-ID: <20260121203001.13515-1-morf3089@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <a0a227f8-8a5a-42a9-acdf-19c055cbf9db@oss.qualcomm.com>
References: <a0a227f8-8a5a-42a9-acdf-19c055cbf9db@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.46 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90086-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[morf3089@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,riseup.net:email]
X-Rspamd-Queue-Id: 74A6D5DB94
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 21, 2026, Konrad Dybcio wrote:
> Copyright year "2022" is odd for refactored code
> Missing copyright attribution from Dang

You're right, I'll fix the copyright header in v2:

  Copyright (c) 2020, Alexey Minnekhanov <alexey.min@gmail.com>
  Copyright (c) 2021, Dang Huynh <danct12@riseup.net>
  Copyright (c) 2026, Gianluca Boiano <morf3089@gmail.com>

Gianluca

