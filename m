Return-Path: <linux-arm-msm+bounces-37558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1F39C500B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 08:57:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4D0C1F2246C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 07:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04F8A1CEEB3;
	Tue, 12 Nov 2024 07:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LcAa/IQc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA695234;
	Tue, 12 Nov 2024 07:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731398191; cv=none; b=XMuMnbuIs5QWlsVYFN1cpJylI1QUKPHw2DGlzZs7/oTWipzqHAfJkCoORn6FwhYSuJJa7eTIp9KVAY5P/CLaKizfcBNK04l8x8qWS2gwdMBHB0gyrTA90h47lXP+RJvU2dYTj59txrbx8t+u2rrlGEyLo+phpu73DsPEeieVq7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731398191; c=relaxed/simple;
	bh=25O1AxlRpWs+3gu/vbg8zcYP/wwTZeoTz8rYqGhb2PU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lAK+B8FDlpwKZv0lW+iGyYLkHdVsn8kJmt8BFuFqk3scM9JKBNNw/YEvwvx3fdhMV/L0hx4A7a/Djo8MDAzktRrz4JW+Nu6YgdwESVpzL0OcO55Y+kKRDSD8PlQwkDWb6F4KBY8kVWK8WupM5oc9QUaMPHz9sdXgRbAD8fo/rUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LcAa/IQc; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20cd76c513cso44816515ad.3;
        Mon, 11 Nov 2024 23:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731398190; x=1732002990; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NefPRLN+h9TOgssrrobmBkWbrfPIcMnQcGv5XGBIdzk=;
        b=LcAa/IQcF6s5r78Xa2x1ThRraghDkaRdIWLg0tlxJbsxuZnw7fq3LHOGVDMBDWII7k
         ugOZ1caWr9yfKKosPOuw+Y6PRq3y13Vr/4uBbQKv6DCrd8oduk0+7zoWRvc8podWFrHR
         6ZiyetQWHEZwR15FaF2fV4zSSOfpxvl9oyRRioO4RkL/qvpIrCVRsyehJGPVqiy0/qge
         prL55ZPtGI2zvvtBBPHzmTCubOmxP4KFtscaE/ym0lM+/xeUuLAeW3/G5X/q6BSR+kL4
         kUJc3PCbOYdG8barHwA2hSs95++2rMndWx10JF9PW6+ZIB7RVOmkC6Hv2p/C5DpJsZxq
         LVYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731398190; x=1732002990;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NefPRLN+h9TOgssrrobmBkWbrfPIcMnQcGv5XGBIdzk=;
        b=DW/2Um4wIPpAuqQCXfqXyNTRWoP5op3nNoD0dmNK5IYvbck+RlRyQXYjwGm3uXDJgY
         zKSli6iFHfxlUrELjvZo7KRrZL9AdjhfBLrcFtlKKPDOPOob04Amqguq9+GtJ5G8AYNN
         e6/XsZUuUghGRdA9501U0RVWOu7Q0/nxFz0pA0W+v44mCCCnv/BKXs6QADRAkJm5E0Q2
         4QJT1BglIqxDEIgHUY7OdOASDwv9YIw+FOSb2ZdIjxK6sYzTWqJlRW3DBRWo9f1ztuIE
         AyMK8AhEtTCCgOHQl4wsciqrd7cZBjXNrWhVJORc5M25LUs3oYKFzHs5wIVGfFDCLuVR
         s0HA==
X-Forwarded-Encrypted: i=1; AJvYcCVRAxJmZ0vs6EFuDlUGQnzMPStuteCzz29MLG1gF9mS528Iw2lFw8UHStf/BEDh6OMs3E6k3qMYjdKgM3luQg==@vger.kernel.org, AJvYcCVzIKTXzjN4aeVzX1alUXNh633P2L8NgngA6EaMj/VI9/C0yu4hIr00bS6JRKqWKeIvvgsEL2wSplvo/A==@vger.kernel.org, AJvYcCX3+q8wrwlsKApwocy7WXCNsZIQ/bTqNI+q2UrrXCrnVSpP6DNzDCW4H07E3JHwrffIJeI4W6eXrGGH@vger.kernel.org, AJvYcCXiGqg7flPVbjR5aab+7FSCCJ1zoJYs0J7VDntXp7TnEuGbj/njD+BaGYQFjB+FaNBgOmE9GS7zu5JnaLWu@vger.kernel.org
X-Gm-Message-State: AOJu0YyA5d2fCGAPf3b5e5N+tHQVeW32WQzsJr34BYVYy81p+wTjZ5HP
	M4x/9ICtG05hwPn8H+NTbaIeWCMEH01k/bQxhaPqfsJKZyXKwBpf
X-Google-Smtp-Source: AGHT+IE0KS2NS7V7DN97gZCWihhMgbFp+BwZ71PDpPLPGgxlj/Wy496iueX09Dw83yU62q37vMBjQw==
X-Received: by 2002:a17:902:ce91:b0:20c:da98:d752 with SMTP id d9443c01a7336-211ab929e3fmr18904925ad.16.1731398189634;
        Mon, 11 Nov 2024 23:56:29 -0800 (PST)
Received: from thinkpad ([117.213.103.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e41717sm85733995ad.122.2024.11.11.23.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 23:56:29 -0800 (PST)
Date: Tue, 12 Nov 2024 13:26:19 +0530
From: Manivannan Sadhasivam <manisadhasivam.linux@gmail.com>
To: Xin Liu <quic_liuxin@quicinc.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
	quic_jiegan@quicinc.com, quic_aiquny@quicinc.com,
	quic_tingweiz@quicinc.com, quic_sayalil@quicinc.com
Subject: Re: [PATCH v1 2/4] dt-bindings: ufs: qcom: Add UFS Host Controller
 for QCS615
Message-ID: <20241112075619.2ilsccnnk4leqmdy@thinkpad>
References: <20241017042300.872963-1-quic_liuxin@quicinc.com>
 <20241017042300.872963-3-quic_liuxin@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241017042300.872963-3-quic_liuxin@quicinc.com>

On Thu, Oct 17, 2024 at 12:22:58PM +0800, Xin Liu wrote:
> From: Sayali Lokhande <quic_sayalil@quicinc.com>	
> 	
> Document the Universal Flash Storage(UFS) Host Controller on the Qualcomm
> QCS615 Platform.
> 
> Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
> Co-developed-by: Xin Liu <quic_liuxin@quicinc.com>
> Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> index cde334e3206b..a03fff5df5ef 100644
> --- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> +++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> @@ -26,6 +26,7 @@ properties:
>            - qcom,msm8994-ufshc
>            - qcom,msm8996-ufshc
>            - qcom,msm8998-ufshc
> +          - qcom,qcs615-ufshc
>            - qcom,qcs8300-ufshc
>            - qcom,sa8775p-ufshc
>            - qcom,sc7180-ufshc
> @@ -243,6 +244,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,qcs615-ufshc
>                - qcom,sm6115-ufshc
>                - qcom,sm6125-ufshc
>      then:
> -- 
> 2.34.1
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

