Return-Path: <linux-arm-msm+bounces-19085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6445D8B900D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2024 21:31:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27EA8283F03
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2024 19:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C498131726;
	Wed,  1 May 2024 19:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dMAnDhpn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A4112FB1A
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 May 2024 19:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714591858; cv=none; b=RrYcYJe846LJ35uLqB2CV2rxw109Q8QUNUBTdvw9I8QxOrgs507q6A8Q/Dev3cT/TnhaqPkF3rviLq17Yuxt3n2tn9CyBk9EM40FtjipNGdOjslJ4bL689Z2zCSBh0P2BktThFulc4cnRKB3c6pFMrgPbhKI5RAQ0P9CFre3o14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714591858; c=relaxed/simple;
	bh=1a8IGgt0atPExNL0kQlcJPYtvH5vrk5eOtxf0vuFGSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G7OSQ1JB3I4nlLza6wWvvBIY0n+tfGZuxQFBLTHIVfq8FOsEfxs9F/KWd8SP5NU0nFtZ3k5eyASC8MqqBlZb2eTBxTY1Jm/SvcY+Ntfei6a/882KZU82H/b1dbwYlq2SudI+co7zr0IkfyPbcU+/zAmVpVfVw/Zkg3ArqvAE2BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dMAnDhpn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714591856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0DpMH3OPKUdeatip9xrDr22zswVgKLvrfLJ6qW8iRrc=;
	b=dMAnDhpnb1wXgklkKWShvpfGGbPYAykJCXOsipGQ/UbDyDX5PgmbmPgP1IKDXiqpykAEW3
	AnCwqgeF3BQOrJH5x0M8tuuNlMoCNFymiG76ZLwisao9q34FCdjdlRtXyPXKf87Smqadvm
	LxMgsCX1igGhpZOHZOnV1YdA2TcxIM0=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-480-vupGt2EHN5O9nxd9K0O5qQ-1; Wed, 01 May 2024 15:30:55 -0400
X-MC-Unique: vupGt2EHN5O9nxd9K0O5qQ-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-69b6fe789e9so78038556d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 May 2024 12:30:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714591854; x=1715196654;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DpMH3OPKUdeatip9xrDr22zswVgKLvrfLJ6qW8iRrc=;
        b=j5WFj2rrLcDwHnxL7yPUy3HGlE0C5dQ8nMbSEDugRmL+pbqiRtWx/6zFiuiHfAh+2N
         G/IrV8iWYHNRBUjRZdsZOcp9fipOm+pvejYRiUCQCT3Rg2AyX1jKrThbJ/745rY2tw4+
         KT+T4vvA5yICSxsRbDz+E4sNxRYzcjmY32LuuwhwB3J+cdan9sI0M1wXihjvLpjkzbw7
         GJLsYObCPlNtTAEbsE9kjFjC9XvJTenMjaEhiMFCnMPq+R14boInp+7asbHdFGt6mgnA
         EFQuEm8xQNjMmn0+ztLDs4aGReuFtm8q/5TmNRnxKiBA0h76brGmRNvZvulYSDlxSPFP
         NHlg==
X-Forwarded-Encrypted: i=1; AJvYcCU03mXO2uM0bzThZy7/Zvm2Pt+7P0D7tqOiYCB+IYj0c6gN7BRikKDD8OOSZmRVLtppTCuv/fFDyekZkVsB9W/S2/MUNDvJErKrBx5GTA==
X-Gm-Message-State: AOJu0YwFS1/RpCIhrRoPC3fS9wLb38MgPiNftbEiusPTNshvV8KY/FC1
	5paJ84jN6EknW4CGhZhMjzO1R3Ic5x2eJeE/L3OLgmwBHDy9o4fKnpFB2m0Bey2u/SraGFZIUyz
	5dF1ViBHD2u45YcCsANs50HWB74BDdFaLiCTARkO0RdG0xK7j1zLdS9PBVnrBrGg=
X-Received: by 2002:ad4:5f86:0:b0:6a0:b2bc:bc86 with SMTP id jp6-20020ad45f86000000b006a0b2bcbc86mr2846290qvb.12.1714591854521;
        Wed, 01 May 2024 12:30:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3bWXYpLEJh92rPxL57n6U+eQww159xQ4NM+NP8YOjyTp+DBAE5EN2Ij8n9qCiPiyz//h92A==
X-Received: by 2002:ad4:5f86:0:b0:6a0:b2bc:bc86 with SMTP id jp6-20020ad45f86000000b006a0b2bcbc86mr2846262qvb.12.1714591853943;
        Wed, 01 May 2024 12:30:53 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
        by smtp.gmail.com with ESMTPSA id kh14-20020a056214514e00b006a0fb776a77sm391077qvb.137.2024.05.01.12.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 12:30:53 -0700 (PDT)
Date: Wed, 1 May 2024 14:30:51 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Mukesh Ojha <quic_mojha@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH] soc: qcom: pmic_glink: Make client-lock non-sleeping
Message-ID: <vhvuux6xxrepe5isqsbqg2hwt7k7vpjikatg27427jwsjxva3n@ywgfiptf4llx>
References: <20240430-pmic-glink-sleep-while-atomic-v1-1-88fb493e8545@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240430-pmic-glink-sleep-while-atomic-v1-1-88fb493e8545@quicinc.com>

On Tue, Apr 30, 2024 at 08:38:57PM -0700, Bjorn Andersson wrote:
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
> 
> The recently introduced commit '635ce0db8956 ("soc: qcom: pmic_glink:
> don't traverse clients list without a lock")' ensured that the clients
> list is not modified while traversed.
> 
> But the callback is made from the GLINK IRQ handler and as such this
> mutual exclusion can not be provided by a (sleepable) mutex.
> 
> Replace the mutex with a spinlock.
> 
> Fixes: 635ce0db8956 ("soc: qcom: pmic_glink: don't traverse clients list without a lock")
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>


