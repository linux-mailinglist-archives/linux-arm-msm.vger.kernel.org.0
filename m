Return-Path: <linux-arm-msm+bounces-82612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0FAC7246F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 06:49:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3A21F3500AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 05:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B320126FA77;
	Thu, 20 Nov 2025 05:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dFjt9zeY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EACF13D638;
	Thu, 20 Nov 2025 05:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763617742; cv=none; b=uzLgutJRxcK8p1ADpKu/pp0RE0UiyHnFkBMvy8oi8HmFmiqGYJvBfiVUIc2zJq4yd8vjV+YaW/KOme8CKKl+yUKOQJaG0XhJVQ6z87IIvXEaV3Eviw7p+wcyxtDfA3KgKHFANQ4atlIsO+dWw2UOjUDLuoSPZQOAB5bToAHjGQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763617742; c=relaxed/simple;
	bh=X9dxMK5txjJ4fU165S7CwGVPwWR8yT89uyBkBRwiy9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HjU1v0xb8TqQ90GrQqLx7qQX6BC+WTF/coWmWycqOQsDsMDR7O13eYEzWeG+rq3gCNWPPajkIMRL5gYUJbgxlGm0a7HEjri4VWH2HK24oIU0nfO+8p4n9YnlmUrsxId5LUxhxIeRcK/hNr3k+1dM5JTBoS+l76Kls8mcbMSsqNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dFjt9zeY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBB20C4CEF1;
	Thu, 20 Nov 2025 05:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763617742;
	bh=X9dxMK5txjJ4fU165S7CwGVPwWR8yT89uyBkBRwiy9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dFjt9zeYEc7NhCaHLpFE3lTXIP6iRQOJ0mTOvCYzc5SLdtxKQ2VEqUxD0hG5na3a5
	 Ex4mz00YVgnreWPQdKlbsqz657jon/H9skB0fGuskbCJA+ofrCFGfPnz3KcVszVRAD
	 Mwfm3eqxaGKY8t/Xj6GQzWIHlvFzkf6JcdN5mahcAEBydirLr0mB4GZ2yrZf4dB8pX
	 cLsmXZH+41WNrKfjJIgSV2VCMT2NC+Fl2fNuIL5oJ9WjQRwvDtUnE1yafYKGDmPr2U
	 tXwHoOGwL12Jggv9zd3d/EKU6Z9y7epafx0SyAJp0VfzHJSZtWq/tPdTZhfBaAykl9
	 OKv+aQYutF4mw==
Date: Thu, 20 Nov 2025 11:18:41 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
Cc: alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, quic_ahari@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V1 1/3] MAINTAINERS: broaden UFS Qualcomm binding file
 pattern
Message-ID: <4zvfljjm34e6hjbt73jbqnvvwb3thbbcsz5sowtdcqcnw2ki46@7xm7sk5u2r6o>
References: <20251114145646.2291324-1-ram.dwivedi@oss.qualcomm.com>
 <20251114145646.2291324-2-ram.dwivedi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251114145646.2291324-2-ram.dwivedi@oss.qualcomm.com>

On Fri, Nov 14, 2025 at 08:26:44PM +0530, Ram Kumar Dwivedi wrote:
> From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> 
> Update the file pattern for UFS Qualcomm devicetree bindings to match
> all files under `Documentation/devicetree/bindings/ufs/qcom*` instead
> of only `qcom,ufs.yaml`. This ensures maintainers are correctly
> notified for any related binding changes.
> 
> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 58c7e3f678d8..2d6a4ed4b10c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26574,7 +26574,7 @@ M:	Manivannan Sadhasivam <mani@kernel.org>
>  L:	linux-arm-msm@vger.kernel.org
>  L:	linux-scsi@vger.kernel.org
>  S:	Maintained
> -F:	Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> +F:	Documentation/devicetree/bindings/ufs/qcom*
>  F:	drivers/ufs/host/ufs-qcom*
>  
>  UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER RENESAS HOOKS
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

