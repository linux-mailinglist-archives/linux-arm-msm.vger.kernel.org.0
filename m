Return-Path: <linux-arm-msm+bounces-44128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C5FA03EFC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 13:22:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BD4A1645EB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 12:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FB7E1E25FE;
	Tue,  7 Jan 2025 12:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OUsJZvtk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1061A1DF986
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jan 2025 12:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736252523; cv=none; b=I0gKJW7fZ03Vqhuy7hkSyshZ1HVhd/27nUB54AUe0b34kc3HkxMN+qCh4mI+pTEZV7XXXdyHbRUuCBVWj7DOyHd1BCOSg5J29Zu1ZvHMdEwYzZ+saM4ZVwWBXVKz9lD5vLURyAN8/3IzZtL+MnHJlV8ND6XaRbU3D0gd0bKIBQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736252523; c=relaxed/simple;
	bh=1tXML+DqArbNQcM5iHDtMwJQHGdw0eE0Ilz2jJAf2Pg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Swv1/oCTuigjaKbArqNOkbQovQHCYblVlIF7lSZ4QWbqlFg2fWubPiW2peHhc1Jkzg8Xnw2bLxNpyILfpNe/dPV0B5jDDTJ52IHHoLNCGqmPZ3DOrzkk+jj1Ehkw3EDz0iDInrblJOrGFaa2nUpvRY+v+m2W9vemPHBAVO9YWZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OUsJZvtk; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30229d5b21cso85838971fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2025 04:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736252517; x=1736857317; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q7WHqrbNCsXH9lx2ZZlw8KhRZ8OlQCctj3WmpLhtiwM=;
        b=OUsJZvtkFAQQKJp6NDlvsztDpw86mas56oPQfG8ixV05G+swtYZEXOEyYWv68E5NXV
         wqIuSC1TBneW0IaW+Pvx+JSM/O8qSOCNJlS/1hIwsVO9QXkkw9W4jIIZ9rcx5UQB4BT+
         VvIIMRfT/dRveuCqRT5DMA84PEnrXzEdjwTNLOZ0C02sQtaCyVkFuym9CbE3NHr7d6H4
         C+unNYyk6g9BgOTXwobNpidv6No5Y5Q2daYf7bLrafqYtS9qYfBvjzFkeWcv2YxbQdxi
         okKICKFRK14QD9nEOnYuCbM3No1TYXkEX3HcZFsBN4FKCqcQoofxZ5MBrmDHy/8KRk/c
         rweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736252517; x=1736857317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q7WHqrbNCsXH9lx2ZZlw8KhRZ8OlQCctj3WmpLhtiwM=;
        b=X2N+e27jITTYGgKEuChjRCsGkbjtR/HkltGUodXLhMjCrHCvcD6ZAuJ29xqFw/4Us2
         h248MEo61fqTZrDjdqKwAg87hRY5e0Sz+F8tojBIixvlIAgTtxMKik9WTzqwg28GOhIo
         NtUghdP9P/dssqYq61CSIpfC7ewbyDfovSokTAR3cq93QuJTdoY/0e3eGbm5tGCiIHY5
         zTcx3ou8nljzGXaJmih6BXRDRKlggpyBI+o/hI+5rBfGi7h5c24NROki0zMbTae6TVjY
         dxFyY87RnQEpeQnTkg/oNkTFCPHFV+kjiBWG0u5y/Inygr0lvCK9Jrf1vh0HsWMEC5e6
         RcMw==
X-Forwarded-Encrypted: i=1; AJvYcCUV4WIoxIjOQgB6oS0pn1x3vifq9q5UmJPh/szanAQwY094XpKP/tHUEpY2E/6a+xbruq6VGIGg/+9ZMJ1K@vger.kernel.org
X-Gm-Message-State: AOJu0YyX6K+K72xq5tdRlvRpN2O8WZ0DeGoNmHGRjW22eA7fhXD3U0/+
	cpZF0eTdIPuWrzyekgoZyxtwBJE7BH7uuMiC60uscsJ4BQh/nxCCSBdybQ9NaZo=
X-Gm-Gg: ASbGnctMUyPUmfdWSDAlSvuoq8LPcerdx+KqAWjv9qruz2VWGXj5c906Va3XMOesmKZ
	BSKcNaMdil6iTY+DUCj96Np4VKWi8hUJ3VEM0fzcfgB+dBTscsT3LY3P40xtIXkNRhdwilf1es4
	w+GUon9dXXKmlbpVa+Dmvp29TL30PKkSptR4HD2eNhsnUJ4GWLPJdJ2gGvfPL4uA6t03HlYKB+Z
	kAKeibhYarGlCujBARUgGuUSm/qSFXBbjiogqVEb5jswRis4dHC3NSTfTZWXeMbB7/w/IjTx0au
	pYQcF2lta48HdEtbvXofPjYO4jUwCeaLTce8
X-Google-Smtp-Source: AGHT+IGz2+dh2vxy8nlD1Uzcmc8AaD/p2yo1ruK2qzEoXxjO0xfTBqejpwfhh77FPHjT/ewS7KI7BQ==
X-Received: by 2002:a2e:b888:0:b0:302:4115:190 with SMTP id 38308e7fff4ca-3046850a29amr188778881fa.6.1736252517203;
        Tue, 07 Jan 2025 04:21:57 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad99d29sm57886811fa.36.2025.01.07.04.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 04:21:55 -0800 (PST)
Date: Tue, 7 Jan 2025 14:21:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
Cc: jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andersson@kernel.org, mathieu.poirier@linaro.org, 
	konradybcio@kernel.org, quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	quic_viswanat@quicinc.com, quic_srichara@quicinc.com
Subject: Re: [PATCH V3 2/8] dt-bindings: remoteproc: qcom: document hexagon
 based WCSS secure PIL
Message-ID: <pjm5wrxnfutixopeeqzgb6q75z6cilpgfcd2maigqlu4i34mta@2k6trubvrkp2>
References: <20250107101647.2087358-1-quic_gokulsri@quicinc.com>
 <20250107101647.2087358-3-quic_gokulsri@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107101647.2087358-3-quic_gokulsri@quicinc.com>

On Tue, Jan 07, 2025 at 03:46:41PM +0530, Gokul Sriram Palanisamy wrote:
> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> 
> Add new binding document for hexagon based WCSS secure PIL remoteproc.
> IPQ5332, IPQ5424 and IPQ9574 follows secure PIL remoteproc.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../remoteproc/qcom,wcss-sec-pil.yaml         | 131 ++++++++++++++++++
>  1 file changed, 131 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,ipq5332-gcc.h>
> +    remoteproc@d100000 {
> +      compatible = "qcom,ipq5332-wcss-sec-pil";
> +      reg = <0xd100000 0x4040>;
> +      firmware-name = "ath12k/IPQ5332/hw1.0/q6_fw0.mdt";

Nit: .mbn


-- 
With best wishes
Dmitry

