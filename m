Return-Path: <linux-arm-msm+bounces-60555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A84DDAD15F1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 01:44:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A0BE166373
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jun 2025 23:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 748AB20B1FC;
	Sun,  8 Jun 2025 23:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G5tkuIEz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E7810F1
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jun 2025 23:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749426253; cv=none; b=bbWWXBgOJloxzcZKRhb32F1P3Uss3vIgRE/OX5UTl8poho+YHy9n/EvWdgZ9BChTTGUH3PaQHBomoRmGSFaYbs6/+9oVLfxa6zB5yN6EQiep8kEl1nDt83aXxs0RcRwpa7Xa5kFI1NO7OFj9tODlCn/vq8U+lbGKcA4ZOoKh0Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749426253; c=relaxed/simple;
	bh=KEewk9e5U1qq2kwEdiMoGkLuuuW/JkAzS/DTU1PoK8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZjGHZ25h3C4HJhAhD8FbKGU319LvfEnVdgDld2L6mjOr7qvA6IsgzS8qLgDsq77B9495GXPyJ87MK6/7l2Jr2UpKyHI+l3/DRAb1mcgqlADQFSx3n8mTTphY15Tgck8DBL6mXuuMwXMnAcbCwFL1pQb62N8VhHFK9I8KDZFaITc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G5tkuIEz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749426248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RulDiaiDU+rd4MVUsTg3W37W6/YZMu9uoDiqrxmqIRc=;
	b=G5tkuIEzmtNnCz00iMGrCMRde0S8jK5662AzubJaZOJHW/mZ8Gi9t/zGrnRAmpr+Rhaxy9
	5ETsnyvKQZfKP/M/pUFQJHJuZ7QkpyieGSh5HM6mGg7cDO7PXa0SQOKKexrwUCSAfK4dbE
	fZdMA/Bacpg1ZXVKzJeDFpKz0IabejI=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-mq6HVQLOOmSuXOP9PXaQFg-1; Sun, 08 Jun 2025 19:44:06 -0400
X-MC-Unique: mq6HVQLOOmSuXOP9PXaQFg-1
X-Mimecast-MFC-AGG-ID: mq6HVQLOOmSuXOP9PXaQFg_1749426246
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-747adea6ddbso2385961b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jun 2025 16:44:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749426246; x=1750031046;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RulDiaiDU+rd4MVUsTg3W37W6/YZMu9uoDiqrxmqIRc=;
        b=xDYWrnS9EdCJN8jghNqN5YWQD7qH1hTXy+npo8SZAzBCt5/0/FN0e4zsUfNjxeaboB
         FP36G22xYIe2knZkM1lIZTuiEnih+V1HtM97nYyCr5hiUMFewv8O/dlG3JF8C4ZnPMjV
         wF7g+dxXxkj7upJOq20CLj1Af/bV1Yc6HDRwNuNrUBtk/QWVcSqx0mMOtea36kHx4SUB
         8CUSApGzt8IC82SDdc63BejIGiW7FNgb7kmyVtsY9sXn0JFO95FmMot+LBbxHnxgIEXX
         ViuwpnYTNYmLygOx2txp66lPzr28EmuwKaLaaDjqyshzReoIWUUdiRjNE+WyZqqdlVcJ
         IIxA==
X-Forwarded-Encrypted: i=1; AJvYcCXkkzhZj8Ndxa39GfW5pY8CV2ya8rH8luDwkXCkkNtOzC4foQclF92EBsaaaRczwui9lC9Us1Hf3fdjsOdD@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5AIh56dhg4WJKuSrF8A+aOecoLPKWw2BkUWzZVtjIBO0oZim1
	kvNLOTUGDDatb4MYwGpLd120rLuodPC8PaEU4MzE1FYa4DtlH4E8M0ay+0grIwI7/DJdFzsrADM
	n9ttR+cT0OR1+4IG1p6G+lP5EcRrJ/6zHzTSVfTxAI66hYvsKfB84CY37Du265JJgv8o=
X-Gm-Gg: ASbGncsVoZLaLjBF7RZL1f9ymIW08dhmbRlQcZPcJMO2fqy/ydxpM2t3ra62iuAvwPM
	HXtr/g/cxnsFS5z/K2ZYHOBlnGdO1+OVSdbF7ysBVEC/+/51Hu07gcm7+c4siFiiiGLjQ083YuP
	OJPU7SwaxpfxDU1zC4ufudY7Pv1EgDLKqKF/QvngvOtWjwZj1m0N9ZjogDDb1Nrl3ocyI9VrLW1
	4xXRgIMK8i/woRROrMcnYkIB6YOXeI2/ODiiGdsZaryPuxPFaYw3w1tiFb427Og3spzZ2VpVhys
	wLsRn9juPSidNWfk+7JHT/0iLtX65DSx2ru0ivj/6vagKTxzK79zSI3mm9B3Mw==
X-Received: by 2002:a05:6a21:a344:b0:203:c461:dd36 with SMTP id adf61e73a8af0-21ee257b955mr17179923637.6.1749426245860;
        Sun, 08 Jun 2025 16:44:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSuWxYIxACJhhIZOfyC0tVrvvkBmEX9Mrq9tGz97R7mDt20pYUiPHkPZlAQCJkoa3KcF5ACA==
X-Received: by 2002:a05:6a21:a344:b0:203:c461:dd36 with SMTP id adf61e73a8af0-21ee257b955mr17179903637.6.1749426245541;
        Sun, 08 Jun 2025 16:44:05 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5f782283sm4196986a12.54.2025.06.08.16.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jun 2025 16:44:05 -0700 (PDT)
Message-ID: <df4bfc32-d395-4f0b-8664-5c65e05f5af0@redhat.com>
Date: Mon, 9 Jun 2025 09:43:43 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 18/18] KVM: selftests: guest_memfd mmap() test when
 mapping is allowed
To: Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, kvmarm@lists.linux.dev
Cc: pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au,
 anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org,
 xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com,
 jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com,
 isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz,
 vannapurve@google.com, ackerleytng@google.com, mail@maciej.szmigiero.name,
 david@redhat.com, michael.roth@amd.com, wei.w.wang@intel.com,
 liam.merwick@oracle.com, isaku.yamahata@gmail.com,
 kirill.shutemov@linux.intel.com, suzuki.poulose@arm.com,
 steven.price@arm.com, quic_eberman@quicinc.com, quic_mnalajal@quicinc.com,
 quic_tsoni@quicinc.com, quic_svaddagi@quicinc.com,
 quic_cvanscha@quicinc.com, quic_pderrin@quicinc.com,
 quic_pheragu@quicinc.com, catalin.marinas@arm.com, james.morse@arm.com,
 yuzenghui@huawei.com, oliver.upton@linux.dev, maz@kernel.org,
 will@kernel.org, qperret@google.com, keirf@google.com, roypat@amazon.co.uk,
 shuah@kernel.org, hch@infradead.org, jgg@nvidia.com, rientjes@google.com,
 jhubbard@nvidia.com, fvdl@google.com, hughd@google.com,
 jthoughton@google.com, peterx@redhat.com, pankaj.gupta@amd.com,
 ira.weiny@intel.com
References: <20250605153800.557144-1-tabba@google.com>
 <20250605153800.557144-19-tabba@google.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250605153800.557144-19-tabba@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/6/25 1:38 AM, Fuad Tabba wrote:
> Expand the guest_memfd selftests to include testing mapping guest
> memory for VM types that support it.
> 
> Co-developed-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>   .../testing/selftests/kvm/guest_memfd_test.c  | 201 ++++++++++++++++--
>   1 file changed, 180 insertions(+), 21 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
> index 341ba616cf55..1612d3adcd0d 100644
> --- a/tools/testing/selftests/kvm/guest_memfd_test.c
> +++ b/tools/testing/selftests/kvm/guest_memfd_test.c
> @@ -13,6 +13,8 @@
>   

Reviewed-by: Gavin Shan <gshan@redhat.com>


