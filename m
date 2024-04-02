Return-Path: <linux-arm-msm+bounces-16166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40208895EAC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 23:23:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 710291C216D4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 21:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E609715E809;
	Tue,  2 Apr 2024 21:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bR7Fj3w2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53ECF15E7F4
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Apr 2024 21:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712092959; cv=none; b=PaQ9O2RTs6wB6moset7CUjPB7mdeHTIdx8K1q3d6b/cAXXITmyGM/9mycJJGKKHXdS/+aFBYZ7QizdJO5HbILjVFFd5vO2StIux3GGTzgOjiNW0rTvVwOc6fq+kr7AD6il2m7OJrp1RFTyVOh8IpOGWcDnHaoxeAG0OQvHk+XpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712092959; c=relaxed/simple;
	bh=q3S2mnJx+F4UQixEHJqph9CgI4kKyg6Ln+k0xeSrGWM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UUsklHX/YfKz0bcjqUJ5mpv3KwapzrSbC2IhD68XR/pQjHaE0s3gTM0sXe82FsemZTBIBKAF6TWeh+DsYRUEzKNaEDgE4GV6Zfr/s3ZWqB31kgf2jauP4gBKeoODAK2+Rv9DGdMwT1UF9V9t+JiJcyU5U9aT24TzdRFrvACG3tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bR7Fj3w2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712092957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=8hNfivdEHncz+gXdoBc2TvCcxwRvihYErqITo3fHY+Y=;
	b=bR7Fj3w2QZZ/UhxCkSZj2Eh7OLJfZDF0A0I6lU0euWOk9o2fMkM0qcMk/Q6ZCCzOn0CxRQ
	XoeAzFGpkq/QlNaBqBCYHnk4K2CW9XEDt0Hd84zZcN2DzRUuo1/1Vm/PB7QNVKWmfQeiU6
	BcYgGZeujdboE9a+kLHu63ZV5nuhWsA=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-3ByyIPmHPmGc6AtT78EKew-1; Tue, 02 Apr 2024 17:22:36 -0400
X-MC-Unique: 3ByyIPmHPmGc6AtT78EKew-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6968a5b3557so59400476d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Apr 2024 14:22:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712092954; x=1712697754;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8hNfivdEHncz+gXdoBc2TvCcxwRvihYErqITo3fHY+Y=;
        b=AkbB9t3jpNTpnjpFOPm0HG5SXbe6sSaW6DqJRkSFIKCciIsf9OwZH9B4trPP3H82Ei
         KfP3IGikZSKT+Z6ozGGPV7BkggXEivHqkOq7niflw6lGf+oxGf0plyeNWBXpo52lW3Cx
         0VZz+j/bTIG36tYQFRy037H3tX2gMlRBKFSKeOnFO9eOKJKzsIeY01GTnz/i7qkl39iR
         dW9EJ6S46MxD3FGKlIOcO8kgfc8ki3xoZ02uRXtvpZWCKS8WLDbGyZq9NWpgAeQg2SRx
         Bk8I07y3NnrSkl0PQDHtu29AX9W4MyDhwaorIIBO/fDjgr5aBoecu+dZcqkjVYNbLolg
         G45Q==
X-Gm-Message-State: AOJu0YzHSkLjQ0LjgIcp8B5ENnwWNzrp7qTncR7n/FXxAaoDmlQ1bemC
	aBt2yXGLKZpBQuFj45MzJZdjU23wCxTZByslfaJvdS/FsmbRnXL/7sVIiECXscz8ti0Lkx36k0B
	ihTId3+q+6AemGye30gLIyMJCWlxbN+Gm7HrWWebWntidZ7aD3dvvQ2reD3rvxoPz9cMKcVs0Zl
	F4YszhtAuVYjcVDO/OWxR9E5jZEqCi25pC0VHlSi+cXdB/jVI=
X-Received: by 2002:a05:6214:5641:b0:696:70a0:207f with SMTP id mh1-20020a056214564100b0069670a0207fmr13472836qvb.47.1712092954540;
        Tue, 02 Apr 2024 14:22:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNxjYHmkw3DNwM015sO8CT5ni9l4MnhSrijQA1HDNB2Asce/Cml84DxWTD1ZKs/VhptXKAJw==
X-Received: by 2002:a05:6214:5641:b0:696:70a0:207f with SMTP id mh1-20020a056214564100b0069670a0207fmr13472804qvb.47.1712092953962;
        Tue, 02 Apr 2024 14:22:33 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
        by smtp.gmail.com with ESMTPSA id s15-20020a0562140caf00b00698fd63d167sm3591259qvs.123.2024.04.02.14.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 14:22:33 -0700 (PDT)
Date: Tue, 2 Apr 2024 16:22:31 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: linux-arm-msm@vger.kernel.org
Cc: robdclark@gmail.com, will@kernel.org, iommu@lists.linux.dev, 
	joro@8bytes.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, quic_c_gdjako@quicinc.com, quic_cgoldswo@quicinc.com, 
	quic_sukadev@quicinc.com, quic_pdaly@quicinc.com, quic_sudaraja@quicinc.com
Subject: sa8775p-ride: What's a normal SMMU TLB sync time?
Message-ID: <kord5qq6mywc7rbkzeoliz2cklrlljxm74qmrfwwjf6irx4fp7@6f5wsonafstt>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey,

Sorry for the wide email, but I figured someone recently contributing
to / maintaining the Qualcomm SMMU driver may have some proper insights
into this.

Recently I remembered that performance on some Qualcomm platforms
takes a major hit when you use iommu.strict=1/CONFIG_IOMMU_DEFAULT_DMA_STRICT.

On the sa8775p-ride, I see most TLB sync calls to be about 150 us long,
with some spiking to 500 us, etc:

    [root@qti-snapdragon-ride4-sa8775p-09 ~]# trace-cmd start -p function_graph -g qcom_smmu_tlb_sync --max-graph-depth 1
      plugin 'function_graph'
    [root@qti-snapdragon-ride4-sa8775p-09 ~]# trace-cmd show
    # tracer: function_graph
    #
    # CPU  DURATION                  FUNCTION CALLS
    # |     |   |                     |   |   |   |
     0) ! 144.062 us  |  qcom_smmu_tlb_sync();

On my sc8280xp-lenovo-thinkpad-x13s (only other Qualcomm platform I can compare
with) I see around 2-15 us with spikes up to 20-30 us. That's thanks to this
patch[0], which I guess improved the platform from 1-2 ms to the ~10 us number.

It's not entirely clear to me how a DPU specific programming affects system
wide SMMU performance, but I'm curious if this is the only way to achieve this?
sa8775p doesn't have the DPU described even right now, so that's a bummer
as there's no way to make a similar immediate optimization, but I'm still struggling
to understand what that patch really did to improve things so maybe I'm missing
something.

I'm honestly not even sure what a "typical" range for TLB sync time would be,
but on sa8775p-ride its bad enough that some IRQs like UFS can cause RCU stalls
(pretty easy to reproduce with fio basic-verify.fio for example on the platform).
It also makes running with iommu.strict=1 impractical as performance for UFS,
ethernet, etc drops 75-80%.

Does anyone have any bright ideas on how to improve this, or if I'm even in
the right for assuming that time is suspiciously long?

Thanks,
Andrew

[0] https://lore.kernel.org/linux-arm-msm/CAF6AEGs9PLiCZdJ-g42-bE6f9yMR6cMyKRdWOY5m799vF9o4SQ@mail.gmail.com/


