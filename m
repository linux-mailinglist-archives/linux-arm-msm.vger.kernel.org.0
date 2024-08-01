Return-Path: <linux-arm-msm+bounces-27700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED5894475D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 11:02:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADEEB1F229A4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 09:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EC63170854;
	Thu,  1 Aug 2024 09:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4WsrT4I0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D02917165E
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Aug 2024 09:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722502908; cv=none; b=fCXXvFKvTj6hWmVMAKIAgcMiFp3ihCGMJBEHkaoKBnmjPOzLoVtk0f7arSMRVwyyRl2ik3/IvrBnstMNfKqey4jYyBCVB3RsR/XFel9hGFcU8QuI/qMZRIWN8s4Gqgh1H0hWxwCHAjiNMe0VdmK7oxINPA2NU1bPVtfLNZxWR9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722502908; c=relaxed/simple;
	bh=7g0DlirT/kYCBVr+9dRDXVKvBiF25jbrjn9HL4AfHFU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MTRlUVHFdMXMivUt4ZlQ7n21RUz6IC9a52gbEZuOFxh2CuXNhkFTOtKOOk9QkONyvJagC2gfWh8AlxjgIvA3nx4KpKv51On/ENH9a+v9H/PnkH9g6QkqFBceSQpLmrSK2k3rQ+Bwx8YDk2JxvuRgddoyjn3JtT2fPVEly7qKzj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4WsrT4I0; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-36835f6ebdcso4080146f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Aug 2024 02:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722502905; x=1723107705; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8IHbq3nRTqO2jYrZNiv7GHjdo//AKiTG6CX0+AzFu78=;
        b=4WsrT4I0qutrM2J00Hx5SwFkHKE2/Yqxxsf/jyyolCuZcKHupiH1NreW4EREe43vQA
         6sMadTeeGwIrdfK/bzLKIpruH9Vn0Pmk//r90gSjoZVGBIZiHHod2GBada5gVznf78/7
         3UwWOaA8eQZelmW5D8T1yFadxYxojWBcXb/6XfiO7rbTDPlcMww54fqUrdJXiu8R/xaV
         d75AllT4LqPgZrejYZmN5cyeH75vZRjN1UJuENhZIVsmczYzFKFtJLt1upmz/SfZX0l1
         5/6Tj13lIzJv10PKUun6oO18WmabQlFvzx6Nympy3VaWzAIRp8zVHa61CIZLWJUbSiZq
         86YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722502905; x=1723107705;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8IHbq3nRTqO2jYrZNiv7GHjdo//AKiTG6CX0+AzFu78=;
        b=BRxB+9CX6jPPeNg276iP//vY1lqCNkCsttYLqiz1yc35MWXsdp53jEL51TGHwL7xN2
         yRIJpOywLD/jygRbykcuKYsH8lBSvYksRMSvsBZtBJk2R7YR36+VFjl9UFa3C8nrKNmS
         gLN5qpYaaYlaAVkMnpB4SaFQgB409jN4bNXuWX5Q3MFlI1a+GhjbL03ZFnd+yFwq8+hJ
         /RUjV4aIEQekrQukvsRKheo5qnwoYtC9iHysdPKdYbqqZ2QCOpiAcObQIblT7yd8U4TW
         AJDZFYO3CVPfbiS1v+zN+kmPV3M6s0gz9tCaYpMPsMHyhO0eIb26yJVdFJG6641HiBrm
         H8Hw==
X-Forwarded-Encrypted: i=1; AJvYcCVgtHk4nwutlO0wDnDTwGJD6JL3Yui2Whf2pgsvDTCZDbP5+lvyByDx0I9TulfOb2CdeRU4cNUgO2RDOgBESxgVl9qOHLQweB9P7Cv00w==
X-Gm-Message-State: AOJu0YxC+uvvFCyNZ75Y+WUGCeIBLE3SnoiPvi68w+U0PPAT5aNTCsLX
	D3EnINSvjktOpl+bdM6SEKGfAS6uW+r4sfcgVEt8K8AycsyEIbnN2UE+poM7318W2zE9H+4IdA=
	=
X-Google-Smtp-Source: AGHT+IEYAOIgImAvC/AtXq27Mfc53Y7PA+fVTX3Rlx+IY0/mIU2S6P/V0TnGwu9UoSydDFeidGnaFL2tvg==
X-Received: from fuad.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:1613])
 (user=tabba job=sendgmr) by 2002:a5d:4569:0:b0:368:5d2:9e5b with SMTP id
 ffacd0b85a97d-36baa9ed838mr3368f8f.0.1722502905208; Thu, 01 Aug 2024 02:01:45
 -0700 (PDT)
Date: Thu,  1 Aug 2024 10:01:17 +0100
In-Reply-To: <20240801090117.3841080-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240801090117.3841080-1-tabba@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240801090117.3841080-11-tabba@google.com>
Subject: [RFC PATCH v2 10/10] KVM: arm64: Enable private memory kconfig for arm64
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org
Cc: pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	yu.c.zhang@linux.intel.com, isaku.yamahata@intel.com, mic@digikod.net, 
	vbabka@suse.cz, vannapurve@google.com, ackerleytng@google.com, 
	mail@maciej.szmigiero.name, david@redhat.com, michael.roth@amd.com, 
	wei.w.wang@intel.com, liam.merwick@oracle.com, isaku.yamahata@gmail.com, 
	kirill.shutemov@linux.intel.com, suzuki.poulose@arm.com, steven.price@arm.com, 
	quic_eberman@quicinc.com, quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, 
	quic_svaddagi@quicinc.com, quic_cvanscha@quicinc.com, 
	quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, catalin.marinas@arm.com, 
	james.morse@arm.com, yuzenghui@huawei.com, oliver.upton@linux.dev, 
	maz@kernel.org, will@kernel.org, qperret@google.com, keirf@google.com, 
	roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, jgg@nvidia.com, 
	rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, hughd@google.com, 
	tabba@google.com
Content-Type: text/plain; charset="UTF-8"

Now that the infrastructure is in place for arm64 to support
guest private memory, enable it in the arm64 kernel
configuration.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index 58f09370d17e..8b166c697930 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -37,6 +37,7 @@ menuconfig KVM
 	select HAVE_KVM_VCPU_RUN_PID_CHANGE
 	select SCHED_INFO
 	select GUEST_PERF_EVENTS if PERF_EVENTS
+	select KVM_PRIVATE_MEM_MAPPABLE
 	help
 	  Support hosting virtualized guest machines.
 
-- 
2.46.0.rc1.232.g9752f9e123-goog


