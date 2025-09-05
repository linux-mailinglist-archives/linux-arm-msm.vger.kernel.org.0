Return-Path: <linux-arm-msm+bounces-72288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A904DB4587C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 15:10:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70B2D17F8B3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 13:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92D8119CCEC;
	Fri,  5 Sep 2025 13:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oE4n1GJj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637D719539F;
	Fri,  5 Sep 2025 13:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757077855; cv=none; b=EsjEon5e8T9qSWSq/hXonMtX9LuWTciiH51MEQ5Ewod34dOrUENAeNWyFwFSJ643xIH9gGf3yxLlp8XAV0DP0MDDiaeDm3LJ3fXYDEZYULZoZW3oFbkTiRgzE1PQu/0z8YwEqEsTHvAp0aCf7ndATNx0v9COgcAMbspUTCV9vYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757077855; c=relaxed/simple;
	bh=ft4wEi6VyINgozYOBpQdzkUfQykWwPhY6o3NSN5KNio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=feD4D/ICHB8Aq/TA4P36eQFMcjCvy3FqNkX+oIWQHmDU9/BJr6smCGiMnFAcfd4/AdPvXljQgIiO2+WI+Y9EHi3NLKCnxOiTybK+mCOI3Dtw4PFYfULwa1e2H8XhYPNNw8TulgbWU/fAozSr6onPHReO1et6xq9/MG+kHpD1AAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oE4n1GJj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6C5FC4CEF1;
	Fri,  5 Sep 2025 13:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757077855;
	bh=ft4wEi6VyINgozYOBpQdzkUfQykWwPhY6o3NSN5KNio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oE4n1GJjewTpgdm9OCKIrFQXuyheM/uk2WN7q9CfXc/VPu0SsGsnXfzyDfVVBQtYJ
	 u1b/ufm3SwemapjdwfBZuQg1IelXE3mzUHdJx6obj6U8wLYjiSWSR2ZePqtq9T6tKt
	 icuqX3j+WceQODHxjcQX7AcQjGWMzBsIIQ9chCYhMKYH0hmzRVIbrgqJOO34ivwdSP
	 H09j00vW+iZOtF73mfjybpQu75SVSuLULd2Ocdu5zxYkW8yi76RrX+P1EfrKtzDyR3
	 +FDgblpuu4DXm3297CV7NPCyDINGkDE+RmyB3Feu3OUXAuBpt2BW7KSde+7hwC+KWo
	 UcCw9yOD3TCLA==
Date: Fri, 5 Sep 2025 18:40:48 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Cc: James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, 
	krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 0/2] Simplify MCQ resource mapping
Message-ID: <zgbquswtxczst62cclo2ybklwmb2stu55k4jkr7k3gkmmqk265@riumztht6kum>
References: <20250903074815.8176-1-nitin.rawat@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250903074815.8176-1-nitin.rawat@oss.qualcomm.com>

On Wed, Sep 03, 2025 at 01:18:13PM GMT, Nitin Rawat wrote:
> The patch series simplifies the UFS MCQ (Multi Circular Queue) resource
> mapping in the Qualcomm UFS host controller driver by replacing the complex
> multi-resource approach with a streamlined single-resource implementation.
> 
> The current MCQ implementation uses multiple separate resource mappings
> (RES_UFS, RES_MCQ, RES_MCQ_SQD, RES_MCQ_VS) with dynamic resource
> allocation, which increases code complexity and potential for resource
> mapping errors. This approach also doesn't align with the device tree
> binding specification that defines a single 'mcq' memory region.
> 
> Replace the multi-resource mapping with a single "mcq" resource that
> encompasses the entire MCQ configuration space. The doorbell registers
> (SQD, CQD, SQIS, CQIS) are accessed using predefined offsets relative
> to the MCQ base address, providing clearer memory layout organization.
> 
> Tested on Qualcomm platforms SM8650 and SM8750 with UFS MCQ enabled.
> 

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> Changes from v3:
> 1. Addressed Krzysztof comment to separate device tree and driver
>    patch independently in different patch series. This series caters
>    driver changes.
> 2. Addressed Manivannan's change to update commit text and remove
>    redundant null check in mcq code.
> 3. Addressed Manivannan's to Update few offsets as fixed definition
>    instead of enum.
> 
> Changes from v2:
> 1. Removed dt-bindings patch as existing binding supports required
>    reg-names format.
> 2. Added patch to refactor MCQ register dump logic for new resource
>    mapping.
> 3. Added patch to remove unused ufshcd_res_info structure from UFS core.
> 4. Changed reg-names from "ufs_mem" to "std" in device tree patches.
> 5. Reordered patches with driver changes first, then device tree changes.
> 6. Updated SM8750 MCQ region size from 0x2000 to 0x15000
> 
> 
> Nitin Rawat (2):
>   ufs: ufs-qcom: Streamline UFS MCQ resource mapping
>   ufs: ufs-qcom: Refactor MCQ register dump logic
> 
>  drivers/ufs/host/ufs-qcom.c | 174 +++++++++++++-----------------------
>  drivers/ufs/host/ufs-qcom.h |  26 +++++-
>  include/ufs/ufshcd.h        |  25 ------
>  3 files changed, 85 insertions(+), 140 deletions(-)
> 
> --
> 2.50.1
> 

-- 
மணிவண்ணன் சதாசிவம்

