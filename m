Return-Path: <linux-arm-msm+bounces-45744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2F0A18719
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 22:16:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E18FB1887C8E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 21:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C99241F8EF5;
	Tue, 21 Jan 2025 21:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="P9UAqqsx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0722F1F8EEA
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2025 21:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737493702; cv=none; b=KDaOiLVGrvHs9ggXAGur26ovXStzaMCO0f35wugY2pN3QabTG5bue7f8HcoRsu2ZgsW/DPSLrtW3D3bXpM+VB5loiIcIKis8Y4ElhtYWeo/YNitV+oqvL7EhPkmPP7kYxt2VAajRzO1OG2EsG/pu47NxIijEroO0lUGKje43lJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737493702; c=relaxed/simple;
	bh=uluMxOufkVTyf9lJfEzbWc5BVYqo/uuD+oDGx4hL5jk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LVqaFV7wnLCrpifkA4dziS9P5I48reFCeaxBll0k6YrlUDoeaLJlRRxhH64n5Hlt/u7qhhWy3qS9vlH2zFFM0xhh0gIgdNqP1K2G6+jqc7KEbzRWe9lTpyUU280KH6VM90G+XKaYujZWv3LpZUwmiUYcwhkAGi33/+nIDVqDehs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=P9UAqqsx; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4678cd314b6so59037621cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2025 13:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1737493700; x=1738098500; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uluMxOufkVTyf9lJfEzbWc5BVYqo/uuD+oDGx4hL5jk=;
        b=P9UAqqsx929O48pkdyzInhP9x8hQ6NlNEfFQqMcsEbKybCUVS+zkeNX37q1+basIov
         aqwPJU2r9ODmxIg+7wdBOaPvAJyitbuqPilZB8KdGwGXgZHf2DlIjbxsalpzlV9mvoG4
         biOv+SMA3Atci/wVjHOMIZKLRm7ney6QDaF77o8W9O2TKnbJie2+pxfTffhU+Smp4ZXk
         xoYlaKRf7lUeqvDGnFds0Y6EHsaiDMxYAP7JCgxnxik3cwhMpZUFWMqNZAJSJMcGVFiV
         MIdXUGCsWfxnX9x7PHHI5FU/iqdRuDkizdycJ/6cXAc9liHe4Ut4DZhbQLB1z76wogf9
         JnkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737493700; x=1738098500;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uluMxOufkVTyf9lJfEzbWc5BVYqo/uuD+oDGx4hL5jk=;
        b=p+iBHBhLkUVX3UbZ6HdMA2zwYWkIDJcCZ10VQa1UomHQE08YFKpsZARIBGFdm28JFy
         EzVxiF/rQrxowIqe2wjuZZKw1ruGEFzE66dmMiN7Adzq5gVRlZXizAy+qilWasJMfu4x
         Yby5WGUbpD4a/MGjhLZcBjVe+vqyB1WGc7quKi98kpOelY5dyp/n/QKQxUt/KUo24qfn
         rIrBSfcQUiq+RMuOaEYCnxdR2etFiW9H6n39iUgBeOYi+eV0eQ8blsdlpg9tynQgBzQt
         9SvR0LJ2MtYTyo/lJCcKZt1VyAWm10Pb6G+44GXxwLm8lm0sDsBVOHErxHlNpOiJQKCS
         VybQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUrJz0O2/Y7LOp0/7riy3No4eQ2BEeNUdR0RYFR9rTP4j8zOEZkOJp+DPST6a9+LWJnJ8Earm7cUBYncxF@vger.kernel.org
X-Gm-Message-State: AOJu0YyUI+V0NoeeW5FhFVRMazBH5IXcHjwMBvGaieQkKf3TTIVBIIfj
	EineKiNcoYBHe6aGsmsLWQe0EKlNHA4Om0SwK2eEXVzhLHcCBn66DNY0BDJkVfY=
X-Gm-Gg: ASbGncso2nJ/cs5NQEB/KqOeGPmol7AtVmqGLlWIw04lH1hLyVckJA9CmEHKWsQV62N
	zjgLQuYlZIrxV3aMOoIvlAX7bg584EiHyYyVV/falXyCmm2re22om1zojwFzJJZwyVluYY+76Tf
	qDDIeD9pi+6Lnxd2xKnRGaN2zO6DvvmMzqEHF2d8fp3hTQX6ObSDJh043dwXcKruykqwSszSGfT
	3djegyD1vMHJXZtLKQBI9AVgKwu+d4i5/5xJRPn4ZCL
X-Google-Smtp-Source: AGHT+IG5YP9eNd9K/tULkbOh+15rO6VP7dx9Kko33NgE7yfMs5pyEbUR5KFZXToPZd7tel5NdyHGag==
X-Received: by 2002:a05:622a:20d:b0:467:5910:255f with SMTP id d75a77b69052e-46e12b75c5cmr309673581cf.30.1737493699799;
        Tue, 21 Jan 2025 13:08:19 -0800 (PST)
Received: from ziepe.ca ([130.41.10.206])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46e1043468esm56871721cf.75.2025.01.21.13.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 13:08:19 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1taLTu-00000003kDx-1Y7y;
	Tue, 21 Jan 2025 17:08:18 -0400
Date: Tue, 21 Jan 2025 17:08:18 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 3/3] drm/msm: Temporarily disable stall-on-fault after
 a page fault
Message-ID: <20250121210818.GS674319@ziepe.ca>
References: <20250120-msm-gpu-fault-fixes-next-v2-0-d636c4027042@gmail.com>
 <20250120-msm-gpu-fault-fixes-next-v2-3-d636c4027042@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120-msm-gpu-fault-fixes-next-v2-3-d636c4027042@gmail.com>

On Mon, Jan 20, 2025 at 10:46:47AM -0500, Connor Abbott wrote:

> To work around these problem, disable stall-on-fault as soon as we get a
> page fault until a cooldown period after pagefaults stop. This allows
> the GMU some guaranteed time to continue working. We also keep it
> disabled so long as the current devcoredump hasn't been deleted, because
> in that case we likely won't capture another one if there's a fault.

I don't have any particular interest here, but I'm surprised to read
this paragraph, maybe you could explain this some more in the commit
message?

I would think terminating transactions and returning a failure to the
GPU would be fatal to the GPU operating model when the entire point of
stall and fault handling is to make OS paging transparent to the GPU??

What happens on the GPU side when it gets this spurious failure?

Jason

