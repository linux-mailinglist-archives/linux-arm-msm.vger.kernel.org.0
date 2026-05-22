Return-Path: <linux-arm-msm+bounces-109241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBE3Je0tEGrIUgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:20:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAEE5B1EFD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:20:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CAA0030C61B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 10:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05C883C8C47;
	Fri, 22 May 2026 10:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hnwzdTFG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9700B3C818B
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444815; cv=none; b=Qvm1ZtuKWMkLV+2ETuFW2ItMwERgXgARJEYGNv9vlde8lctxCbnOn7hghhJzYVn/F5PvZzf01PP2Obw7KrtoNNNFqzNIh7+At9SNZk0Iru7+czVlIrIJuD9luAZFSOxYLYfRtLonEpqRomJkmzxFtERTIAO/K5Ndfqb3F1AUI2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444815; c=relaxed/simple;
	bh=SRxnNxLvSRz09aoCuYsEnPTx2LdCf1qheDcTlTOHcOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DuKcOE7a4vj176lOInChzRsY4R5Gs4llHPcArY4VN1LoPTd2CQ267rgtms6wTIuq8weWREYKmPIIiMuulTD753e/zrZLkz5ftl8QCfqcMmUNso34GmuJp3EYAHJ8O/X1bCYvD+ryZWGrga6sOObRLP5Z6thWxDG0sw/Ou/QluDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hnwzdTFG; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c8026aa4d53so5367209a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 03:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779444814; x=1780049614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6oxv8UL85VpOX5p+L7n6lxvKWMwkHziHJ65pdN0X0XU=;
        b=hnwzdTFGWKEhsBgPCNxM6qGgBtpr6ezr+y03UwVErnt91dGn2seCPc4GCQMd2OQC21
         RAajZ70CQ5sRMEhwSBXOe7D9tD/fsqQfjw7uj1tA765SEFe+6Q5A8B/G2EMPnkwV2fjb
         Om/DLM5bjk/rkr73guPwicWwJb82qSu/GWTR6MZTvbLJHi1A+UGkuI7WYd/ms7z1InTy
         GWwNrmLnRA8s++0mfKa2jdIfZm/u0Wy/BgdGUekOb1LdeULIedN2iTbAO65T38eiSv3q
         YCMMl+3BAsyZCnNRhSx0xw4eV1agmhvJNIHZrg/rWWvSDs8ivb4tLLHnUtiWkooe7MpI
         k0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444814; x=1780049614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6oxv8UL85VpOX5p+L7n6lxvKWMwkHziHJ65pdN0X0XU=;
        b=iT8TTGpgxXChDcO3Cx2Om+PJUZXVuC7qXxrtVyP5KtdRKA4/9q+HBm3MkB/filMcly
         +2OQxSg2fPfb3Ml/axep53oMZOQPOXtq8Ntwsa15qc9+/qaeRUaSZc5mvGy/dFge9Cob
         Xna9hPZK0o6+ZY2sIRgzlP2ji0wwoOmm4ZHfTBDKLQob3AgkVu2gvqFIQL438zL5uRga
         rEsX994IpEUt/oks2HIzfkMwLAn36rZ6tYTj6s8aJKLFscvIyKLebiAouxuZO3k93FGJ
         tKb+fknnRvlImElst1K5v4hOyaz+RXdDIMtkyh3rQVSKnotoOKhvGzSodvkWyKd0Uqu7
         P03g==
X-Gm-Message-State: AOJu0Yw0ktSxgLAwi4iW6ih/omQiR7MGeo+isYJQcpZue9hSQSR/hSO/
	u+aHeUttpg79WAwp5T/YadvdMtkZGVRoHJ8gWr2q/AtvlRV5iuQWO1kMPY0lGJjJQws=
X-Gm-Gg: Acq92OFSnOWZgJ1aFbTOwsh+8nCbxDTnh4gcmOITScS1Cy8lZgWiuaZdHrGcvKydBS+
	2eDQ0BPkXBJHwjbVXN74UKobNBWzlOXtoocj7VQ2PlP3bnvLDzkk7hvBE52Hn7PVSyJhnacAsbf
	vmyzH9luYC8Zd4IeXJe4HgOG/XxAZ38YGWN7xtIS0WGlODqgNhOghSOnthBG6lB8iBTvSmlOist
	8jsD0Ixna5ECZp3O7cLaJmD+zBr1ZyiNfoFwr15Vx7vrOaBAhLoJKDmIucM86S+ZAu6q9rORCBs
	e7Q+S+P9x2If1QKNv05EPX3p9HyGD9hRdHUSqluHiWoEVUkVNSYLxQ4ZDmsQtbo8JfjP1hMwQhR
	/BUCEGS9xDimXXO/CMFkDYYpt8oL1rrgFZIO46K5VAviYBLGdXiHK9Zo2Qh3k0fTbsA/T81fmO2
	mIcIdRYPZ6LU7INe2c+j38CF4BTO5PGXcW1WiXfruw+VEOpYcKPvmf3PlNrfgLzdIxRg==
X-Received: by 2002:a05:6300:2109:b0:3b3:21f7:15db with SMTP id adf61e73a8af0-3b328f704bcmr3288808637.43.1779444813768;
        Fri, 22 May 2026 03:13:33 -0700 (PDT)
Received: from radxa (122-58-25-162-adsl.sparkbb.co.nz. [122.58.25.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c852054d788sm1047586a12.21.2026.05.22.03.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:13:33 -0700 (PDT)
From: Graham O'Connor <graham.oconnor@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	robin.clark@oss.qualcomm.com,
	lumag@kernel.org,
	abhinav.kumar@linux.dev,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	neil.armstrong@linaro.org
Subject: Re: [PATCH 0/6] arm64: qcom: Enable additional hardware on Radxa Dragon Q6A
Date: Fri, 22 May 2026 22:13:23 +1200
Message-ID: <20260522101323.31911-1-graham.oconnor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522060645.4399-1-graham.oconnor@gmail.com>
References: <20260522060645.4399-1-graham.oconnor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-109241-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[grahamoconnor@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.992];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 4FAEE5B1EFD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you to Konrad, Neil, and others for the very prompt and helpful reviews.

Based on the feedback received, I think it best to withdraw this series to
address the issues raised, most notobly:

1. The DP_TRAIN_LEVEL_MAX change (patch 3) is too broad - it affects all
   devices using the Qualcomm MSM DP driver rather than being specific to
   the RA620 bridge. A proper fix should be implemented at the bridge
   level. This is going to take more investigation.

2. The display DT nodes (patch 5) should use the radxa,ra620 compatible
   string per the existing Radxa upstream series from Xilin Wu, and the
   lane ordering needs correcting.

3. The rpmh-rsc early return (patch 1) needs further review regarding
   the implications of returning before full driver initialization.

4. DTS patch label dependency issue (sorry) 

I'll integrate with the Radxa upstream effort, re-evaluate the other areas
and resubmit corrected patches addressing these concerns at a later date.

Thanks for the feedback.

Cheers

Graham

