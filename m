Return-Path: <linux-arm-msm+bounces-98169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNAwIMFQuWmuAQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 14:01:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D83422AA59A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 14:01:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09617305B09A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 12:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC8943C6A22;
	Tue, 17 Mar 2026 12:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DyPD2IEm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A2A3C3C1C
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 12:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773752338; cv=none; b=sXDKTckSWwMRWMy8Ze++Xd6SbRdEdZgdTrylnzIZeU5csXx+ZQBpG8nVMTlOOy26fnHFrQf3DKOpbvpaREGxHBuIbnJvi5sDLUVRiUJh324ryK2f/ul8ptZJenB6Hqb/0jjLbu3g0iNwTSlasOAl/Y/rjyUuLcGcAxk/s0qBD9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773752338; c=relaxed/simple;
	bh=c4xAwo5IW0e5wp1m6dG8x6LWc1bZ/a34JAzgjyVUPYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fi5zjKbeZ5RoXLdaJuoTaB3TatqF157IpqJTDEjXLH8FQUtG0Fv60F6VP7sAYzUr0MVL2C5SZN8FU/SjPmqvpbvhkecGL5xhqhMb/zX+Yh22U6Syq2uPePDjn1HMEPxDusZ9iqzZkF31iG1yi1vGUsPcz90eLUqXzgWkwGyNFX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DyPD2IEm; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-823c56765fdso3251402b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 05:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773752337; x=1774357137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c4xAwo5IW0e5wp1m6dG8x6LWc1bZ/a34JAzgjyVUPYc=;
        b=DyPD2IEmtnqFm21rbybnqEfAK2xvR5bOzx3FIXj2P53LxyYZPTbGeq159QE1XK9WwQ
         i1pKRVYH97bLq2VchFvC+Azpy4fpSvm9ctcQHjMEMk4PGISVTyAPidaPU1edhL/gEmqr
         6IeKfm2aGAXc8awVL1fzqKFtJhVEggJtsaCUKxSn/L+Iq/pRKTxZX3CH2QmUQ2FKz6A1
         PB+lg5/cnnNubXUTGyt8p5cxctR3I5HJcp/E84YwAzp+JNzYHKH/kI88uPN1L2Bp6pi5
         dLjjYzDVZ6xNrjyKTmQkfCpS7N7AeVZdxPL0KZbBc3GhIEgqG4rlRM3kmFE5VdDF+UMc
         O8Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773752337; x=1774357137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c4xAwo5IW0e5wp1m6dG8x6LWc1bZ/a34JAzgjyVUPYc=;
        b=d0RZB8Yi+e07vbaNXjP3neUP1kpEKRIwbGvH+IdQC82Xocl8qXSK1Ls0HMcm/sfpqP
         lPfg0FVvTNuEE1ewxwKSKuJdxIlXYy5r8lCxi1XjIbrivA1Olp+oHURZDAiI0kzJ45U7
         TWTJcICn3+1pvCK4Ohea5Btkzk0mF2w2ntsn8MyUD8J/sj+26NJAo/V6/bh+cquUY4ie
         hr/em0/jm89cpW/RDPsiaLz5q3eZ7MMjD9GrEZgjk1JyGCLyK0fVEJseIQMClApA9csp
         X7bSw321Zm0zXfM/mM0M/1o8mC7LCFXR3cE/vMij4sM5odP8BDmehQsFZoJUE4CpHOSv
         9xDg==
X-Gm-Message-State: AOJu0Ywx5FrmVoJ0A+SxoJqyMzdpAT6ygUs7b+9iW3IFDOuGAB2KUzrD
	rCCo/10mf1VEYHN1B+rUejQCEnYajMq94tTatZGzZTo9eELjtgPDWYH9
X-Gm-Gg: ATEYQzxMlwuR27vs8Zp7Np3AZeWgreB2sbwTyaqosVPpNc14e6DLzrf9tMP3ZuyePUC
	JOstEdATiqDeWwOe6X+3xJOjKWCYqKu9BB0kwer0GPnJCv3NoBs2DN6RmCo0wrKDNpaJlHawjTf
	T7IUIoRownaN8hT+Bt4bu3dQbFMyrrs35j3EQncdF1S40PXzHZ7j17xTjctSaZ1hnA5r6CNPcwr
	yqoOsdQEd0I6M0uDSaSvR1gUNhV7/D3JpGcH3cLcbxSYDEKuNrRYJt4vKGThf0geO3j8+cPZvfi
	PNA0TUn33TCc3mFhO7FkqNzJf/Gxng0YpISuKouLekLRyG+lutG2bWaHmfQamkwYRCL5A9ot/at
	kiBks9pwd+w1QTnQ4pJDYaW57eDR5O/yH+ILxx6lKcwjql57elCUl02JV3dO3PFd1YzLyLxIzwQ
	JENeT3RQLUrcj7UjPx6powVSAN1mbPcjHMo2zO3YUYd0E/15SPldNcmjoecA==
X-Received: by 2002:aa7:88d3:0:b0:82a:fc5:fb81 with SMTP id d2e1a72fcca58-82a19702d5emr14986999b3a.5.1773752337122;
        Tue, 17 Mar 2026 05:58:57 -0700 (PDT)
Received: from localhost.localdomain ([2402:a00:163:2ce9:7027:b0d7:e473:38fd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a072418e9sm17574984b3a.3.2026.03.17.05.58.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Mar 2026 05:58:56 -0700 (PDT)
From: Ajit Singh <blfizzyy@gmail.com>
To: quic_vdadhani@quicinc.com
Cc: linux-arm-msm@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: Re: [PATCH v4 6/6] serial: qcom-geni: Load UART qup Firmware from linux side
Date: Tue, 17 Mar 2026 18:28:49 +0530
Message-ID: <20260317125849.5825-1-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250503111029.3583807-6-quic_vdadhani@quicinc.com>
References: <20250503111029.3583807-6-quic_vdadhani@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-98169-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[blfizzyy@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D83422AA59A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,
If Linux (HLOS) owns the SE, allowing it to change the protocol when needed seems like a better usability model than the current design.

