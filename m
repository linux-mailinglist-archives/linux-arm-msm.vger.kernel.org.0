Return-Path: <linux-arm-msm+bounces-10929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D124E8539AD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 19:14:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E0148B2C261
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 18:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CBF7605C2;
	Tue, 13 Feb 2024 18:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t/+ScJC2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA7B605C3
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 18:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707847800; cv=none; b=S1l+46Lo//9jSd4UsVVcs7fq35a9O6BliHPX2uq9z+EDOyONrmkDuudXOtQd/vz5C0QgHSXX17qg0FF+VYKychBumZC9gPhqILh8Bd/uEkVIGyRB6w2d4uJkAwVp6iAqhdQCqI9PAWULWnsa6P3kbftHSlazH4MOjZvZCj9FdgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707847800; c=relaxed/simple;
	bh=Y6o1Lji1Q8/hQyG4UJ4sM5x73l/Dpj78gVauywLn6mU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rpRV10Cp5ONoMBZdDqZB5R8ibZicFJa3pDb/XjcIgLfktJNUahsgGo93/LZL98oGkhIjQEbNKrLmR4KVmYH+z3Jz4TdGkUiDEX5Bkaj1npBIby+ovL9U6TgYCjjdmj2EFXWo6l12OZ106qbxQMJQoR9AqNtEsMUq+Jni26hs5C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t/+ScJC2; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a28a6cef709so631007566b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 10:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707847797; x=1708452597; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mh0Ixr9X//q92qq2wBm6KwNXwHZwG0zZGkn/hz3Mm7g=;
        b=t/+ScJC2T0YIB6BEjPrXgfiVwaxcuNG2RpuQizPJ+wQz0//MakuAHmvd7aTgno8j17
         iy+CilySMmBe4hBD2dg5I+Vpe+aXoDSbE5Lm8B9q7NsQip8jtKqMlEbfgByK/80eT6qw
         MjjmXOHDspVFFgzcSiz+/oaMrihzOmwDQ6ZhrupOAvWa1j64q+/w0hpJv4uTeKW6b5Bh
         oyxKu2yRizk86/Q5GLo8xGNiwcy5UPvzX0qsP//VV9XFsesFbg1UJvFEKR8VrGegufpo
         uGhPw/WVvQITOyZB/T/u+t/H39oa1HJDvA0qso5vpi3XH2bvRpa+Rdf0Hh2SW2ffDT5h
         Y+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707847797; x=1708452597;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mh0Ixr9X//q92qq2wBm6KwNXwHZwG0zZGkn/hz3Mm7g=;
        b=VxHidJS6SmhHeZl8pn1YdDzk+SKKHGKtEKMb4p4DFYjGnlpUSzpA19Gpkg0FrMOFfW
         3ogfqPAmtOC30ZJOm2pyhXwIa+nC1of8Dk+QWCQYf3lDPZli7fsx6CF4ilKtjr0IGgSp
         F2igKLM46MuvYqrCshuyEUUXiX7+0YlJ3a2XrANN6ecAsJCAq4dukG+SN4t5JbnGUwfD
         Kymi8udMxuaBnCSi9kcsQ4WqyvaNSy+iol9bbcUek6Yw8yyr/6pLAx95KUcrRSxl6fyB
         4Rg7QCjeKygDA4eUy+5kyZxYHl2XcGmFQYH9ffA4ZSCJIZ1/FtAa6NtpWD3IjUtoFb/e
         nzHQ==
X-Gm-Message-State: AOJu0YxogNZzz+/mmi5AJ9nv5cw09C5IU14huQ5g6hWgnbT1jckZO6xm
	znhDrLz8zuJKksaaD98XVCwjdLVgaNFXytkW0C71HbZ2PD9rSu+FyLTf7kulJBQ=
X-Google-Smtp-Source: AGHT+IHJykz+k2He7BaCvsqj2dWYamq7K+/vZc2T32yxyQ1CbMYSDNaCJBGbFY4K/6Dc76v2ecseew==
X-Received: by 2002:a17:906:749:b0:a37:b8fb:50e0 with SMTP id z9-20020a170906074900b00a37b8fb50e0mr68785ejb.52.1707847795826;
        Tue, 13 Feb 2024 10:09:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUqS8Y4lHY/ySiiu1ZIPjBRsbWFJEQdE6Na2j3TjyYBJqKdSqsQrt+HEJLaWsfOi8mF/jy9gPvQgwbbJH5ZjQAco9oqBQBsY9M=
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id vw3-20020a170907a70300b00a36c5b01ef3sm1518830ejc.225.2024.02.13.10.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 10:09:55 -0800 (PST)
Date: Tue, 13 Feb 2024 21:09:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: dmitry.baryshkov@linaro.org
Cc: linux-arm-msm@vger.kernel.org
Subject: [bug report] drm/msm/dpu: drop dpu_encoder_phys_ops.atomic_mode_set
Message-ID: <ef7bf5e6-3ac5-4dac-8e2b-4ed52a9cc0d8@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Dmitry Baryshkov,

This is a semi-automatic email about new static checker warnings.

    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c:746 dpu_encoder_phys_cmd_init()
    warn: variable dereferenced before check 'phys_enc->hw_intf' (see line 742)

drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
   741		phys_enc->intf_mode = INTF_MODE_CMD;
   742		phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
                                                   ^^^^^^^^^^^^^^^^^
The patch adds an unchecked dereference

   743	
   744		cmd_enc->stream_sel = 0;
   745	
   746		if (!phys_enc->hw_intf) {
                    ^^^^^^^^^^^^^^^^^^
Too late

   747			DPU_ERROR_CMDENC(cmd_enc, "no INTF provided\n");
   748			return ERR_PTR(-EINVAL);

regards,
dan carpenter

