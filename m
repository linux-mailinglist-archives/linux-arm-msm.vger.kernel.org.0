Return-Path: <linux-arm-msm+bounces-51673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A9BA66AB9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 07:44:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 754743BA3C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 06:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3BE21DE4C9;
	Tue, 18 Mar 2025 06:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aPvUm0i9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272751DE2D4
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 06:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742280268; cv=none; b=hzNJwlX5iwi5ayybm4/pY5vE6Q+Lb4jperswUDNNWSq+nfsareQCdQVqFMCg0hd2WraJdMUWAzBEHAuPv5O55Di4Cen69McEZCzA0GliJ2p/rQcbNIM3w7BTP35obrI8M3BDAPprAS6tnKqa/3XD+JgSa3Arb6IZ8h1jf8dlf0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742280268; c=relaxed/simple;
	bh=SV9DG6e6mgA/lOSmt6NefQ8XUMo16/bUKqUU1uGTEag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=epb1J/Uhmiif0xHEmp7k67hybmn123Y4dNiACiQaCaYK46OELDaBSTCyPzIzp8QfDN3GWCPzRyXOAjniXSnX4pwMdnDIB+1vUCIcKbVZaNQvbeyTjkX6MPqJ4X9RXyU0vRzlfnny1sKXv1QWDDvnvp659+HyHRk0w3Kx2TNYyc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aPvUm0i9; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22438c356c8so90641935ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 23:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742280266; x=1742885066; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AXbeE+q9B8uny1O22+JXIAcL6hxd+XvgftLgch9dqZ4=;
        b=aPvUm0i9qEkd4ObL0B9xJC1M6DGa8vxK2pAqRj41rHCnSiv+XCqIs2HJsQPrhoue22
         KHMPOGwrqJC9oYP1liNOrukg0txEZV2nmbe8tgsyyLLKDcc4wzCBbjHTu+ABQM/XuAkF
         RiQDYV5ouBcsGxUVXKLIh44RJK3bbnhUPSOI1ayeia5YhLHxLvSuaPfP4T4PokFIfsNs
         Nvjczk3yLsNZxpsBC22a1Nq0LyytLX5f4Q1B5zVf25v3zDcESUxTAUy8FZMTubGraEnN
         Np4x0X/UudeauO6H6EtOqErJagNTutlI4gd7g9mrfp65BDdz+Wm20bn5OD8PMjmhOPjd
         gegg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742280266; x=1742885066;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AXbeE+q9B8uny1O22+JXIAcL6hxd+XvgftLgch9dqZ4=;
        b=AkZa/KDQFu3JCFn4XxRwxIJ953cNLEUVL2+rIcJ/UtiC5aTV1RhQwOVzGt2PoL87wc
         0Ep2/mqs9+Sg2V8NIjEcdiH3qQ8Zgrmnqio8A/cwijsoQeajP5zvXTLJn9NWeiwp+Qjk
         OrF5ivl1cEp1MrNQnE0msEdAhdJf/0jlXFYSrDV3WZrAkU00MGqEXHZ4eJPcR9Jmi9M6
         N2pckT651WD0NRY2RZZjFiKb0FxAM3bIjjqHRd7M0el1GreA0BMZnfhpYcDoVstm1n1d
         PmW8o9PR3ID5Jf3wFokWQAtGt7D34qc4LHyjy9ZSL22G0XN2XU2xzj7XiQCc8RK/b1f2
         Na0w==
X-Forwarded-Encrypted: i=1; AJvYcCXjtUN/0fbko7m+R+MZF2eerwi80TWHKq3nhkMc2ffELp7jpMsdCusXfzwZMvADvviC1sRjmfY9yllS9M2Y@vger.kernel.org
X-Gm-Message-State: AOJu0YzIMaefG7iuzxCLwNYVNe1iWn2wpy/CMAZFqX8W7IKmDsT01RuM
	QHqFc0zxni75hNmutktCKfQKO6UneZJ7np1oXJM6AhAAK/Me2epyFctIYipLTA==
X-Gm-Gg: ASbGncu2yG/VoP6e4e1exxvJBv7wKWWGwnTgWH2BEN/OCnwWpuw2SvX1iXiru1ui0Cx
	tIz8x5XqN1d4vGlzhBX7kCZpf3xY8PeWz8G9uZVowIzu8WdWdL6Xfd/E8qjQ+9AQW2tzLIEyibb
	utwR9qrIy4N3TW2DDLf4p4+irNmUd0wVfe2/pez+wx7lGJRO++3D/dj4TH4kt1Qv5XCsB9wmeNc
	XQ/Pcy3rmdsHZxSXhLVihpoX5m6FG0X7+yn1Sgp761b7BNx58x4Orvx3akMoufAc6B+WGlWEEuG
	FXmKFd9e5JFJ3v8jh3JBOAf+tVqpR46Q4oV04U6f1r2u1lNYIeAvIC56
X-Google-Smtp-Source: AGHT+IGUoUDJ5vTYdSQ2RELO/IbV2/iGzzF3b1wNuHTa0nhz/p/MbaSJgXtRU6hyx2Anrag4ph7yJw==
X-Received: by 2002:a17:902:f545:b0:223:635d:3e2a with SMTP id d9443c01a7336-225e0a8f4a7mr180304005ad.23.1742280266436;
        Mon, 17 Mar 2025 23:44:26 -0700 (PDT)
Received: from thinkpad ([120.56.195.170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbebebsm86560405ad.201.2025.03.17.23.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 23:44:26 -0700 (PDT)
Date: Tue, 18 Mar 2025 12:14:21 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Manish Pandey <quic_mapa@quicinc.com>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_nitirawa@quicinc.com,
	quic_cang@quicinc.com, quic_nguyenb@quicinc.com
Subject: Re: [PATCH V3 2/3] scsi: ufs-qcom: Add support for dumping MCQ
 registers
Message-ID: <20250318064421.bvlv2xz7libxikk5@thinkpad>
References: <20250313051635.22073-1-quic_mapa@quicinc.com>
 <20250313051635.22073-3-quic_mapa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250313051635.22073-3-quic_mapa@quicinc.com>

On Thu, Mar 13, 2025 at 10:46:34AM +0530, Manish Pandey wrote:
> This patch adds functionality to dump MCQ registers.
> This will help in diagnosing issues related to MCQ
> operations by providing detailed register dumps.
> 

Same comment as previous patch. Also, make use of 75 column width.

> Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
> ---
> 
> Changes in v3:
> - Addressed Bart's review comments by adding explanations for the
>   in_task() and usleep_range() calls.
> Changes in v2:
> - Rebased patchsets.
> - Link to v1: https://lore.kernel.org/linux-arm-msm/20241025055054.23170-1-quic_mapa@quicinc.com/
> ---
>  drivers/ufs/host/ufs-qcom.c | 60 +++++++++++++++++++++++++++++++++++++
>  drivers/ufs/host/ufs-qcom.h |  2 ++
>  2 files changed, 62 insertions(+)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index f5181773c0e5..fb9da04c0d35 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -1566,6 +1566,54 @@ int ufs_qcom_testbus_config(struct ufs_qcom_host *host)
>  	return 0;
>  }
>  
> +static void ufs_qcom_dump_mcq_hci_regs(struct ufs_hba *hba)
> +{
> +	/* sleep intermittently to prevent CPU hog during data dumps. */
> +	/* RES_MCQ_1 */
> +	ufshcd_dump_regs(hba, 0x0, 256 * 4, "MCQ HCI 1da0000-1da03f0 ");
> +	usleep_range(1000, 1100);

If your motivation is just to not hog the CPU, use cond_resched().

- Mani

-- 
மணிவண்ணன் சதாசிவம்

