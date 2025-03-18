Return-Path: <linux-arm-msm+bounces-51663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E45A6693D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 06:24:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 921F117B447
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 05:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 756341A5BB4;
	Tue, 18 Mar 2025 05:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xnUzQ5w2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5097186A
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 05:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742275433; cv=none; b=sW06W6ABnOuT0qqjEVbBdBCmQ2FXTryQnJoDC6hFYFk8rn1vryfkVIBcEF+uy/ZBcCzbh91VUt4GQKkUDFQ0FCUri2AjwXeqOWb/bWsKwedMVcJmD2vhf80f+q8Je1eamG+AYUQUtTlD/tGVoHP5aEVgIxF9Dzbb7rkc+G6+C6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742275433; c=relaxed/simple;
	bh=+6wTRmmn9IgGWFWLYYBguNMje+VK69ODef720Av4Ie8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L8FyriEts2XIFvj9HS47h58q52Hfz6nVQHbO3xa84AepLF/ev4Ezn9He9UibflMvSSLxoo2C/EKY3DLtny886AN+YRixa+Gu0bQR7l2c/zB+G5eJYPeLskQFIC67XVbI1Acihp7SDyiTcLBiwqi+NasDuhnuXU7FKcYs8tvxqWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xnUzQ5w2; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ff64550991so3457969a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 22:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742275431; x=1742880231; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I3MFhv4iXPFGACGN68O6T+ndaCiilLWF8mxkeGzp5Wk=;
        b=xnUzQ5w26g9qTxz4M1XUQuAxrjLxUyuaaZYWEr65bW+rnePCMj7ClRTayJddL2/wrS
         OYbNm2Vlvk9pylGoC9x/b83k/hNRyy1N+TfhgoMRLwThOeJ2Ex9gR+Hbghe5F+VkHiJi
         pvVqUlpPcxtpxMtNuE0YmR0Jyk5evogSM54spkXlxufBFjBF+HzlYUtbNMsPpnxFEOZG
         bmWL7sGVuW0EFzUfamUcWwp9SOL8z/w68rzsSm6Pks+fl/dptj6iBxzsI2OOTWlNig0m
         yLL2Pd9JDiz7DF6PgGuMqflVRKDuhLZqvoQTokXmRhHTKf8tTpV5DFiggJBatLVoBWZv
         Y0hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742275431; x=1742880231;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I3MFhv4iXPFGACGN68O6T+ndaCiilLWF8mxkeGzp5Wk=;
        b=XNFG3mjHrtO+1YhiR1Jd2fjkVI94SgVzDD/xGmCLu46rmvfeA7NrDtxE9HHD0iq5tD
         vlla60dzROlGRw8dy0jvkWPTQO1Xl2frsOdc/dCP0kbbgowsqD85uEnEf9+Iz7+SDLoM
         wFcHde4rQlKqnsbBIomxEIENKC17NDfK8cJaQzeSG5QNJlRtxqV08J41dWZuy2GqcjbP
         hODN0j9wrM1nMffrbjkdrSzeDQisdFUUFS2QCzeRLisQHCk0mQk5esjxPmosRkQRHcAn
         NZi7QF0dI4FIEztJP7Se75cz/7+znhdZc2nXdXBM545NqdqD7rAydsP6MQQ5CYgAFzg+
         ZVZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUswL+LXo5WL1Rs3bZfxhFg20IW+w4u70DmChIvJFDqcwPQiUGvWiMjPhbs5SfXNnTcdotnCOQ0ZiQbw3ZE@vger.kernel.org
X-Gm-Message-State: AOJu0YzQU7YWNFp5f9uKaxSNCR0kDITpxs7dX9/6h5HBuHCCQpjLCQxu
	OPErpBnRg+vcx7PswOqZx9q+mFHEayAvHFQ6FY7d5oiqDRMpZFEy/RyuGwUOvg==
X-Gm-Gg: ASbGncv/xJ5wudAlFtLzqaMyVDxv75dcl7+M7C9VsBQL/v4sLQ5Irwd1ko0B9OsMLnx
	/4V6qEq4DPqFVCFT6s/io+i4yBSsxS5ILl1/4xX2YrvwTGGuv4zLAuOA9G4UKyEDgW0gdhjLRAH
	rV5OzoFe05pmORNnFaBtwmKdFp/wuaQShfWL5Ho1afJE8CuCEj9FM83HWDFpU4BuDlC8d58fQse
	hZX5cOAQAYJrR7wDtD2ajE/W2d8Gx/l51uemUQ98HVei6+b+Ob0vKPhyN00eJMtvC3HYXoReOxV
	7TJXQ7MZ/D4srNzDTQtR3VvKYPTCY1R2pycvMhbkwY2UmPjnzM55FUdq
X-Google-Smtp-Source: AGHT+IHfQA8coXckUEYvZiBZ+6HlXKMz1xOJjAr8oflE+640yjM8m0J94JHhMX0+3laFnw472xG0Dg==
X-Received: by 2002:a17:90b:1e4b:b0:2fa:15ab:4dff with SMTP id 98e67ed59e1d1-301a5b99192mr1208448a91.31.1742275430993;
        Mon, 17 Mar 2025 22:23:50 -0700 (PDT)
Received: from thinkpad ([120.56.195.170])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301539d3f40sm7168928a91.4.2025.03.17.22.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 22:23:50 -0700 (PDT)
Date: Tue, 18 Mar 2025 10:53:43 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
	Nitin Rawat <quic_nitirawa@quicinc.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 3/6] dt-bindings: ufs: qcom: Document the SM8750 UFS
 Controller
Message-ID: <20250318052343.do36phv6qxhimpab@thinkpad>
References: <20250310-sm8750_ufs_master-v2-0-0dfdd6823161@quicinc.com>
 <20250310-sm8750_ufs_master-v2-3-0dfdd6823161@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250310-sm8750_ufs_master-v2-3-0dfdd6823161@quicinc.com>

On Mon, Mar 10, 2025 at 02:12:31PM -0700, Melody Olvera wrote:
> From: Nitin Rawat <quic_nitirawa@quicinc.com>
> 
> Document the UFS Controller on the SM8750 Platform.
> 
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> index a03fff5df5ef2c70659371bf302c59b5940be984..6c6043d9809e1d6bf489153ab0aea5186d3563cc 100644
> --- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> +++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> @@ -43,6 +43,7 @@ properties:
>            - qcom,sm8450-ufshc
>            - qcom,sm8550-ufshc
>            - qcom,sm8650-ufshc
> +          - qcom,sm8750-ufshc
>        - const: qcom,ufshc
>        - const: jedec,ufs-2.0
>  
> @@ -158,6 +159,7 @@ allOf:
>                - qcom,sm8450-ufshc
>                - qcom,sm8550-ufshc
>                - qcom,sm8650-ufshc
> +              - qcom,sm8750-ufshc
>      then:
>        properties:
>          clocks:
> 
> -- 
> 2.46.1
> 

-- 
மணிவண்ணன் சதாசிவம்

