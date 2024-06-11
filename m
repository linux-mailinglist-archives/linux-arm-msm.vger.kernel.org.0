Return-Path: <linux-arm-msm+bounces-22297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0A3903B30
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 13:54:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24633B27E30
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 11:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83210176233;
	Tue, 11 Jun 2024 11:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mHkTfwXy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4039176AA9
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jun 2024 11:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718106837; cv=none; b=QGff6khADJ5NMu1Fsswu9T5c1LqnPqtYVlzh0+gcgNMCS5pMrD0lM/FF9qvsadYeODdg2QmQP8hCfQSfa+NHHKDrC/RY/84L/y73uyMsV2RuZ45vIrM+fM3ZpDBgyBxxiryEJwX5Fya4/JGMWCt1HdzvhtdCtYNU3T7HTfvS0Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718106837; c=relaxed/simple;
	bh=a9wEMYMLhPik5Iha8GD0lGDvxK/fpNcpfivXFPvkQT0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YXyqV5jQLAPkhUM/Z0oAqp/REQez1OuhpsAsBRE5y20/TsHoPuAhFI+7Jqbc+nleIXjhEZzSQpFHADuNM4Rb/j5I57Qs0onajkdS8FLLTX/xD+U6BSGmGiclzZeaR+roqHOrJ+Pt6rZkmb0qRcQnFULQYfiwoIARyBBVdOkjp/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mHkTfwXy; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a6269885572so1132116666b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jun 2024 04:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718106834; x=1718711634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u0y6b4gZFGCud80AmP9t2bvPpeH4+hki8K6zxSKyNa0=;
        b=mHkTfwXyB8HMILBOaHFqKY0viLoSyWo7q+s4fBHTqzHq8xfhZoibuRi9zfBZmuD6t4
         ghzTwOUZuHF02EGr8p+Ef0249TNF6jqDpadN26XyC4jeAJ/SFs/gbEMfqVKhOXEAapPF
         Tai84SPzeiOOANrWAzMf0vlUULwA0Kvr22YqGB9o85jYjAK+FoRjf1vQlyYPbymqjaLr
         KU/GK5ykRz6AvA1scABZJXEQnKB9DNiM/TOMaR8RIqXZbBnMa1EG7vYtmy+3Bd8ND+a4
         3+WaDHquxulefSBQ19NCSYspqXLJnM5p5n/iRYAm9ihQNP174/Sd0k2DrZjpu1leE8YJ
         MUmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718106834; x=1718711634;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u0y6b4gZFGCud80AmP9t2bvPpeH4+hki8K6zxSKyNa0=;
        b=ADXcm6VnwO5uZeCLWl7PCWxnotCXT7CxHSsEnS6lMsA10SBVzxQvDP9M0h3Da0aH7T
         ckYoAPNH1IiZ2yFNDmlorN61mPa+YeISDovfNUsCLn/8XE1SW6xm2HWOz7h+wixWp8JW
         RikZyQhGbVQ+o1VQN0ysBEkGIHWEBnl6Pwpy5JTKSAyHwEwSiHLe3ej1L5yMDT47Z3be
         hnaapO3DfTAHQ8qCCLF+SSUTebmrTkM5SAxrK/Oel5fRXmZOXkQoFiKm11/1nHFGhY3F
         0I86dGnEzKRsH9moEcHrbfR6njFLNX6NbKfCIpKTQFKpT5lrEQYFG54Ya7SPG/18VguL
         wLHA==
X-Gm-Message-State: AOJu0YzIaofzUWosxZntX2FVJZryus6Xr73C/+QYvSX2PKHBbdp1RbXB
	FEp3yYRNtPYVM3YeNyu1rc19uPDtdmtdC9k70R4GPEIIU/ZMn6LacmVCkH82qBSsNnouZi3gEap
	NJkc=
X-Google-Smtp-Source: AGHT+IGp+ZH4BEY69xpRaz+jLd45lkNkemrYFPhxsTjCwIw9D9bZcBF1aj2i0QYXU+k5xe4xVJFGcw==
X-Received: by 2002:a17:906:4ed4:b0:a6e:f53c:8da0 with SMTP id a640c23a62f3a-a6f34c7d40bmr184942166b.8.1718106833865;
        Tue, 11 Jun 2024 04:53:53 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6ef83ac0c4sm505225366b.74.2024.06.11.04.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 04:53:53 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: linux-arm-msm@vger.kernel.org, Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, 
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
In-Reply-To: <20240611103442.27198-1-quic_ekangupt@quicinc.com>
References: <20240611103442.27198-1-quic_ekangupt@quicinc.com>
Subject: Re: (subset) [PATCH v5 0/7] Add missing fixes to FastRPC driver
Message-Id: <171810683302.68152.7087367565963378291.b4-ty@linaro.org>
Date: Tue, 11 Jun 2024 12:53:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Tue, 11 Jun 2024 16:04:33 +0530, Ekansh Gupta wrote:
> This patch series adds the listed bug fixes that have been missing
> in upstream fastRPC driver.
> - Fix DSP capabilities request.
> - Fix issues in audio daemon attach operation.
> - Restrict untrusted app to attach to privilegeded PD.
> 
> Changes in v2:
> - Added separate patch to add newlines in dev_err.
> - Added a bug fix in fastrpc capability function.
> - Added a new patch to save and restore interrupted context.
> - Fixed config dependency for PDR support.
> 
> [...]

Applied, thanks!

[2/7] misc: fastrpc: Fix DSP capabilities request
      commit: 8bac43bb507f1fe6e56762ca350c8b6f41096959
[3/7] misc: fastrpc: Copy the complete capability structure to user
      commit: 552244bb57914612f4db79f0f52c6130af45c50b
[4/7] misc: fastrpc: Avoid updating PD type for capability request
      commit: 7718647366694bf1821a87e08a2ee4ef62012270
[5/7] misc: fastrpc: Fix memory leak in audio daemon attach operation
      commit: f3080b096933b6633d71e5345f72a79ec25faaa9
[6/7] misc: fastrpc: Fix ownership reassignment of remote heap
      commit: 2a732868df39b717046a4f03c40f84db8be9c687
[7/7] misc: fastrpc: Restrict untrusted app to attach to privileged PD
      commit: 435f39b8991cd719fbbceb6872602629417c9272

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


