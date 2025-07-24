Return-Path: <linux-arm-msm+bounces-66639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C4BB114DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 01:46:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95E241C27250
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 23:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A51A23C8A4;
	Thu, 24 Jul 2025 23:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yOevUUJk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2E523505F
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 23:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753400814; cv=none; b=pBJAaylQD8so7j5xBxHDS1VFA0+Kmjfn3QXU60N5JARebl9MO0LUHYc5u8KbVyRqWOmr43ZUFIacmkcB3JT1I6z5zoVnyhHfX4+sSrdzZH8rbzjYLE9uhAJ1zGJpfiLbs9I80yn/U/g5rESH2J459VwafwRCiGNcOvm9kAM9H0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753400814; c=relaxed/simple;
	bh=Rq+CCcHnbrLIieKNkCZNAlk2vPBrV5d4uE0b045YV0c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SfRpeF/eug/Zf5CG3jDUkIyVvCcfoImzlwfBt58d3LHQU1Hr8o9ORaHIzwJiQBSDR3C/2o9lNbwOYR2hbmssmPqQGe6cnA+fWXeTqzmBly/leH3dtFWoBNzcUrgFyvBZWbpSCG0MJoitnvoTXGpSlX8aYCFndGMFpUV33Q5rJow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yOevUUJk; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-311ef4fb5fdso1680947a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 16:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753400812; x=1754005612; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rq+CCcHnbrLIieKNkCZNAlk2vPBrV5d4uE0b045YV0c=;
        b=yOevUUJkQJL0/UTmc46+y0+LvntCbiZdfdzlPlDPLb5LAwOxygFPsrc2WarJ+JtDB2
         y+oWZuPoj0Z8OiFQHc4u0Tf3pJS/gCZoU5gNmPt53E4VgcRMq4g8I+tbnDx7x/yOY4ve
         +b8Ns91Ms7K8ZHOUeIkyv1Mxmx65fqhmqONZvMN3op0so/GfeKVyrbDApGFSEm4/FOp9
         bMcu6WQl5ZnyLAuBsVCc90DC0IbL9qq1rA63T7M0bLq9Zdc5MLmcQriwhZQiPlK8BWHM
         Pi8ZOhkzoJIDVXuP21jHAvL7rvywNEUNGerI3DYKqlx+1Du04wpNr5Iy9Oh6AlWPvE96
         mo1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753400812; x=1754005612;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rq+CCcHnbrLIieKNkCZNAlk2vPBrV5d4uE0b045YV0c=;
        b=DVveJ/vt9eOvQZC3Epprrn0kh49wxphS9QlmW6TInUrPLyLYSTbTmIeq6r/JvzNsv6
         Lw3OxKe0MNHrHywn4SaoXQ9HX5qFcM4uuX8UwwiO4gGqPVweYEyu+ncLorv8WZ92/Udp
         V2/zFq9B+6czKW4/+B7sP9OBqBqJ4FMaVhaVSFygFTTOwnU2kWSIK0eE2SySEmoQ/JIV
         YI+O7S91J4t8X8n1fomDD9V0VlFoFpkkRHQbJOYcV7AYNKNXciYSevEI54g0ckl533jw
         Cd6kcRZotXSgnSW2+hHXW0Th/reH/mDASDfOfOKIl602ao0F01IOtG6Qd4RfvG9sqXxQ
         uQmQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2sovnXqeUGIIXAY14MjRPku1H1AQt+Wn1NZOUqs+LC6h9/jwjEbfRY1DTit75ZnXk8HgruWdIN2qlPNKo@vger.kernel.org
X-Gm-Message-State: AOJu0YzVYmj22NI7kG36cgubkmHARjiOfyU07uerrc6g8PAzYdWSR9nv
	9USVrPa/OBoO2vR+uWskO4FTRLj9sGcAqusPkT3f2fNX/ggycQUgW77c7nTPBuGHPT53zcxPY+C
	Xs2gbW4jLfENtpZBDSlw9DntUXA==
X-Google-Smtp-Source: AGHT+IHBbNLrQlITZTUEwJZc7PPMBuWUPvVh41ATm80JrPARR6vxu6fTSW3zd2GzVR7d4WnT1Q219CCX9tRIUbCxQw==
X-Received: from pji14.prod.google.com ([2002:a17:90b:3fce:b0:313:1c10:3595])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3c90:b0:311:d3a5:572a with SMTP id 98e67ed59e1d1-31e5071cc94mr12799088a91.8.1753400812263;
 Thu, 24 Jul 2025 16:46:52 -0700 (PDT)
Date: Thu, 24 Jul 2025 16:46:50 -0700
In-Reply-To: <20250723104714.1674617-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250723104714.1674617-1-tabba@google.com>
Message-ID: <diqz4iv1dudx.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [PATCH v16 00/22] KVM: Enable host userspace mapping for
 guest_memfd-backed memory for non-CoCo VMs
From: Ackerley Tng <ackerleytng@google.com>
To: Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mm@kvack.org, kvmarm@lists.linux.dev
Cc: pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz, 
	vannapurve@google.com, mail@maciej.szmigiero.name, david@redhat.com, 
	michael.roth@amd.com, wei.w.wang@intel.com, liam.merwick@oracle.com, 
	isaku.yamahata@gmail.com, kirill.shutemov@linux.intel.com, 
	suzuki.poulose@arm.com, steven.price@arm.com, quic_eberman@quicinc.com, 
	quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, quic_svaddagi@quicinc.com, 
	quic_cvanscha@quicinc.com, quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, 
	catalin.marinas@arm.com, james.morse@arm.com, yuzenghui@huawei.com, 
	oliver.upton@linux.dev, maz@kernel.org, will@kernel.org, qperret@google.com, 
	keirf@google.com, roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, 
	jgg@nvidia.com, rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, 
	hughd@google.com, jthoughton@google.com, peterx@redhat.com, 
	pankaj.gupta@amd.com, ira.weiny@intel.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"

Fuad Tabba <tabba@google.com> writes:

[snip]

Did the patch [1] for x86/mmu that actually allows faulting when
kvm_memslot_is_gmem_only() get dropped by accident?

[1] https://lore.kernel.org/all/20250717162731.446579-14-tabba@google.com/

