Return-Path: <linux-arm-msm+bounces-52761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40914A74990
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 12:57:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 708133AB5FC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 11:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 317A421ABDB;
	Fri, 28 Mar 2025 11:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t9FkWAyP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72961E3DD7
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 11:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743163052; cv=none; b=hnlh/9a6P1+sm7vFBIkXzeuzeJd2vz351F/gWwsuESoEyNRMY7JISHSF9x3/NjsO6tz0ITlozrWky4uLtoHgDeLlxgdTsFntmgVvbgvyPLw0kqrp5Lqfq1K7rfbpEi9NpnSsxdmIMHSbEgB+qNNTiE8cPMn8SxAyvOTkdb7zUrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743163052; c=relaxed/simple;
	bh=5GDfzUJ0O1UJv+6AsGBK+HNuTYhMO6vdvgxFzmpti90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PZXNKm9qGmLs6V8cV+/yG1W6P4ccS+XYav7edr/duEQDcIWIhGOzH0kgDtE6BdK1ftq/xSyOJDzzT5tu7pckkQ1C1cdwTQuR59Wa8wLFKBX7cU6S+UAzVo5x5TzffpdT8PSUcdEAlAuLiPGFkZHc0Yf7kt7PamJBi6Gk4iNoD7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t9FkWAyP; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22928d629faso4636855ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 04:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743163050; x=1743767850; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2WSTXYuPuJrQiD3WS1ovJqKrZZeFszs51P1tbuSXoqo=;
        b=t9FkWAyP+1JEHEV8vVmmkUceqVQlsPT3ZsDhNgEGeb68VBOcXKgsmlIw8+aR0+5Q2a
         ugIDshbTcscA7ndDcD8KW39izKuf2mPOcRF/zyVaEhZuZL3PLi0VGoOXNjabgBq2k9Gp
         U2Zf7kEa/MO1FcJf8dorWlXwPR75ccHhWVs6qmBxkWTiIn7dnlnMxNV5eZRYxGe4bMYX
         /ZziiGTvso803MXwl5H5oJGLtf4hUVV0/PCuJdhLaTPNRPbA7OkAdwZAalAz9RMi22eK
         XqMjcH5dD+15UQpM+n72KTHZnQPu3sALTrj3YIWMvtXVtInEvtd65uz+HtI2Ak8hE7zr
         KvEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743163050; x=1743767850;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2WSTXYuPuJrQiD3WS1ovJqKrZZeFszs51P1tbuSXoqo=;
        b=HLAnZx5YbrslqgnTgt6tFz9MYbh/zl2Bui7JOSFUCdu61KoSxhQmEJ15BlKsJpc4Pe
         OlY7WrWJ7ShbOfEV2DHqVBz/Yv9kNBgJD20xWwFPjdh8SLEpPm35vu1NwS6VSwVZmemY
         o6XgD9Uf0F7GDQcsZEbb9oU63Y3p5jDoL4IHdLRIG2mpM8YdqZXOwBwDHEwtd1ECDYJn
         q9iJ/+quIZwB7mVTu3tGU4eBspc/ONk+6oPl0f3HEMGx8/F59z1LV6e+cE5sEO5+XmyE
         njsYD9a4dDJeEuPGJ04ylH5v1Uj/Kf+NPxpzcN3Yqy26xJjqRpqmC7Uw6qSYFSj4J88X
         Ak8Q==
X-Forwarded-Encrypted: i=1; AJvYcCU5/dCUTjlctmP9q6soENQhI12WAFhmqTS8rs2Zz6fi0HwRDZE2dNqDobSaYU9Hies8+rIrFZ5em7dKM2fY@vger.kernel.org
X-Gm-Message-State: AOJu0YylCL/8XZsy+l6aOywGS2XvgfEzNSCl0UP4WRYQBUFka87qEkDl
	OOjVYsN5uTabPhNrF/2IYhU6bMS/83x/hc+eSH9VKhhx5tKyikiU7MhkQ34C3Q==
X-Gm-Gg: ASbGncsurruCb8rviS/9vN9WuA0B6xT58N15xW6DZwPtieR81W2jzbtHXORUGne5ruJ
	XrDxiFio6KYE9Ne/ErIuBJnUz25dX43R9IWCilYX4mX1509dYqK820Z254m9nQZt236rvHwRrsq
	BPOth952WlEwewK0a2jG3vK27Qo8l+nmq8nvZ1rPplijBJZXBxOyH2iwaGkuulaH3C7/F+Bp+lT
	9VAI2s4uJk+Y/Sm5HfpeERpugXNwPVltWsnYO3jkbpiYxdn8RPLJkLcKfLJcdchYxDaRNJpNP7r
	zTiIj/a3hgWlzuGpslce48tbAaV/wu97HlLosRLhDvSbzuxVFodC4wY=
X-Google-Smtp-Source: AGHT+IFdD+HV+lVgnf7AEQHBGqiVj/X5kE9O+NyRDYWYelqL9118SJPkXyhWPFS6cffYjzlGTjWgXQ==
X-Received: by 2002:a17:902:d2d0:b0:224:1eab:97b5 with SMTP id d9443c01a7336-2280482a729mr114984625ad.1.1743163049794;
        Fri, 28 Mar 2025 04:57:29 -0700 (PDT)
Received: from thinkpad ([120.60.68.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1cf131sm15861545ad.134.2025.03.28.04.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 04:57:29 -0700 (PDT)
Date: Fri, 28 Mar 2025 17:27:22 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: cros-qcom-dts-watchers@chromium.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Jingoo Han <jingoohan1@gmail.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, quic_vbadigan@quicinc.com, 
	quic_mrana@quicinc.com, quic_vpernami@quicinc.com, mmareddy@quicinc.com
Subject: Re: [PATCH v5 5/7] PCI: dwc: qcom: Switch to dwc ELBI resource
 mapping
Message-ID: <kaesp6i5n5bocpp7m3i5qzsw7amyy4nw5f7bspe5zpxjeu4m3h@m3eg66rkxjhi>
References: <20250309-ecam_v4-v5-0-8eff4b59790d@oss.qualcomm.com>
 <20250309-ecam_v4-v5-5-8eff4b59790d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250309-ecam_v4-v5-5-8eff4b59790d@oss.qualcomm.com>

On Sun, Mar 09, 2025 at 11:15:27AM +0530, Krishna Chaitanya Chundru wrote:
> Instead of using qcom ELBI resources mapping use dwc mapping as this

s/use dwc mapping/let the DWC core map it

> ELBI is dwc specific.
> 

s/dwc/DWC

> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

One comment below.

> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index e4d3366ead1f..258b2d615080 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -265,7 +265,6 @@ struct qcom_pcie_cfg {
>  struct qcom_pcie {
>  	struct dw_pcie *pci;
>  	void __iomem *parf;			/* DT parf */
> -	void __iomem *elbi;			/* DT elbi */
>  	void __iomem *mhi;
>  	union qcom_pcie_resources res;
>  	struct phy *phy;
> @@ -390,12 +389,13 @@ static void qcom_pcie_configure_dbi_atu_base(struct qcom_pcie *pcie)
>  
>  static void qcom_pcie_2_1_0_ltssm_enable(struct qcom_pcie *pcie)
>  {
> +	struct dw_pcie *pci = pcie->pci;
>  	u32 val;
>  
>  	/* enable link training */
> -	val = readl(pcie->elbi + ELBI_SYS_CTRL);
> +	val = readl(pci->elbi_base + ELBI_SYS_CTRL);
>  	val |= ELBI_SYS_CTRL_LT_ENABLE;
> -	writel(val, pcie->elbi + ELBI_SYS_CTRL);
> +	writel(val, pci->elbi_base + ELBI_SYS_CTRL);

Since the driver was checking for the ELBI presence always and the DWC core is
handling it optionally now, you could add a check here to make sure that the
'elbi_base' is pointing to a valid memory.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

