Return-Path: <linux-arm-msm+bounces-105637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EF1aLiEd+GlHqAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 06:14:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D4D4B8512
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 06:14:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9DF3930053BB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 04:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49CC523FC5A;
	Mon,  4 May 2026 04:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ouq84Xb3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F5640DFD1
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 04:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777868052; cv=none; b=sEwLHqX+Su/f2BOOObN0uz6ggGqs0mMCxpqwgWsQQ/nQj5AFkhGmOroXRt/+hetiDurah3fjJyreDb1OEtlvp8E3/Klpawz+ZQoVHZOZ1eDZvgvufFcFz1DMCgsuRsBAqcVBPN7K2nmSsXGAStOKGHtAIBAfTFYOowTURkXH7mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777868052; c=relaxed/simple;
	bh=cXf9bWSY5kzsjnDpmcM/IxoFY116iEGP1RQ+JvHmz90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pEnWX/t1LXH363j+N6m/cztvxu/HhW9HJjFbG7lYaMMTs/Zc7E4erJwqeSxWz1MxwRkTXJfwOrMFu0a97/kBwdYO6KJyvPnUzi/sBKKkIafwWBG24pSvTgGAwVTJYquEKBQuRLLzQlHE2mdEeeBg+t87Y3ABr8mf9hcBSJ8RE/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ouq84Xb3; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-64e87a81639so2982354d50.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 May 2026 21:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777868048; x=1778472848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+hqqG9jQe3h+XNHUssoh+1SAkCF/JItpwxK1tygRUQ=;
        b=Ouq84Xb3u7tPjDwq1ne1OBUUAPNbq+OWjYyXLDt5DMJojGX1GgzDxUbFaxLTCTPeMU
         E9HdTtG2jjnd8N8w28iw4X7aTnmz0mVcR0khAsyvk38zgu3Xef4s0CL/YhK1/K89YfuA
         lDzZO4KlQdqY/9qMcAShF/ntGPfVv0WxCJS3p2XGRCvwrpcrdOlHZQ4DknfHvIep4+tr
         rh7NYeXXepjKKGmmbtV/4IKdJMgKX/BJF56PEGBMCfqzRHwmVEZ4Jh4r1E35iwyeyMug
         dGEd36dUWUEU+HLQSUiGUN3oFPDSCO24tFFGQ4bFtdi250C1z0dA+V0jx8vW4hHS0jZz
         nuOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777868048; x=1778472848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T+hqqG9jQe3h+XNHUssoh+1SAkCF/JItpwxK1tygRUQ=;
        b=FEMOZ0IFCL/zO1dIc1Aln/L+6LiG55oRhjb8OPaDTLWlYScwXFzXt3CNeFstVeKiSX
         mOAJEmzj1r9VZIqhLtBwBeuYpeySDOFpjZ8R895A/z5m2GSQ7up2GfiQKNY450n7t9BA
         p5onPbHextqDMOBsBgdOBXF/LRxK9nx6XgEOA6gIVAqT1qKPKpPZoz9DVez/4dMeWTsy
         XU+mlglfZrRQEDt96ijSKKEpkrc8MfE/ALZ1aOY+RRPVivy7yymETqV6l2HaTcOaUqU7
         aw7RSDP//UAU7X1T4xeufp+rUJi6KORn7ITVQqUJQn7kwFIcs76C0w3u9inU0ZzpZTJL
         t2hg==
X-Forwarded-Encrypted: i=1; AFNElJ9b+ZdwMQQ7Za7uB3cgLF3+TI2OLq+E+wZ3bBoJDwK+/8iOX+9US424eP2ceSiskJ8LqEW7zOM0L8j0jGAN@vger.kernel.org
X-Gm-Message-State: AOJu0YzfCGoOtK04nDBTLm9fcwBW5eTZ/wFzdQmrm19CedQqDWkxTqG7
	X0dOn+/NY3ewW8kg+ZA+oL0Orpwi0FDvOTVdEdWcMyUPuIr/SkRhM7Yu
X-Gm-Gg: AeBDievDErroUgnlABBTa7iLB1FRNt1Ye6lhTxMHFx7V1HW53hrm7L0EXzsPtved7rH
	xJyN6hi+5Oo/SgL6EcmOSyTmmrmHUmaaRMk/43qLJQRZzgxDgROTYOBy9J6LYWv8r9g+uxI+oqS
	PztLIjR906w1rey5hI9d04mofHBM17QFSiC2SIZr51/zEPlwW3kXi/6KzMDJUkkXq80QK3ATnLd
	2WLZSO3Du6fB8U4effe5LTI+v7D7+4rOea/0Cni/HYZAL9lJFS1+gIOmcIheNDaHne3Let/93B6
	BpJV69Q/mng1afFPkBEY6x0ddj9cmeJJQ5e7yWI3hNhb887Pg6PBZmn02xZhvqdRFuDpWb+Q8Gv
	m4fe3vgm7EunD3cZNmVi7DJWthtpUR5PQKtoBzKULOsFbcQx512NQRu1lxiS6vZUiGJsNNF8zUR
	ikUCR/r8ta1thmS7ajVbvUHM9y2z4X//1go7abvwrl1VgYSdik47ee29dF7PNvze1jAWfDtw6dX
	hhfYYY2JQ==
X-Received: by 2002:a05:690e:b41:b0:658:9bfb:602d with SMTP id 956f58d0204a3-65c3dae91aemr7518405d50.38.1777868048551;
        Sun, 03 May 2026 21:14:08 -0700 (PDT)
Received: from localhost (104-48-214-220.lightspeed.snantx.sbcglobal.net. [104.48.214.220])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65c2e8b031dsm4907419d50.18.2026.05.03.21.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 21:14:08 -0700 (PDT)
From: Steev Klimaszewski <threeway@gmail.com>
To: krishna.chundru@oss.qualcomm.com
Cc: bhelgaas@google.com,
	bjorn.andersson@oss.qualcomm.com,
	jingoohan1@gmail.com,
	jonathanh@nvidia.com,
	kwilczynski@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	lpieralisi@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	threeway@gmail.com,
	will@kernel.org
Subject: Re: PCI: qcom: Add D3cold support
Date: Sun,  3 May 2026 23:14:06 -0500
Message-ID: <20260504041407.289464-1-threeway@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <dd4dc11e-338a-4d13-9830-095a93187f4c@oss.qualcomm.com>
References: <dd4dc11e-338a-4d13-9830-095a93187f4c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 38D4D4B8512
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105637-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[google.com,oss.qualcomm.com,gmail.com,nvidia.com,kernel.org,lists.infradead.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[threeway@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.999];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Sun, May 3, 2026 at 10:37 PM Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com> wrote:
>
> >
> > v4 of this patchset *boots* along with Mani's patchset, however, v5 does not,
> > and unfortunately, the machine does not seem to get to a point where I can even
> > get logs from it.  Do you know what I might be missing?  I have *not* attempted
> > to remove the nvme drive and boot off USB to test it.

> This series, will not have any impact on the boot, this series comes in to the
> picture only in case
> of suspend and resume. can you share your platform details and kernel you are
> booting with.

Oddly, it seems to, because if I simply go back to v4, the system boots.  I'm
using a 7.0 kernel on the Thinkpad X13s (SC8280XP).  The sources are at
https://github.com/steev/linux/tree/lenovo-x13s-linux-7.0.y (with the v5
applied).  PCIE_QCOM is built-in to the kernel.  Not sure what other information
is needed.

>
> - Krishna Chaitanya.
> >
> > -- steev


