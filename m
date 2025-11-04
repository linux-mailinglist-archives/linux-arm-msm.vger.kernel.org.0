Return-Path: <linux-arm-msm+bounces-80193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B645AC2F0B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 03:59:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6180334C2D0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 02:59:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09A1926158B;
	Tue,  4 Nov 2025 02:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HTZrmV3L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06A2260583;
	Tue,  4 Nov 2025 02:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762225161; cv=none; b=C8wDlSY7Eem9qrm1P6FXbXYwHBy+G9e/BPavFcJSEgCX8Uy4BhrkfL6wmJeVcUDzXEk+Cevkkush2QUlx8tvOxzLE9JhKZjN0XzqcSdEAlO3dthStgo4tqF8KJxHnF0hrAWV9tuu3Q0WUFgxSAbSYTfDhzH6ul3rfNyTNOJgPGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762225161; c=relaxed/simple;
	bh=pZCOHjj1efJAEnHBeLtvAawr6ePQ+W1jtHPifnCyZmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dN4l/CEWIdW8kLGr7Etv5oiKnxmmmsSPSBt0gj08pm3mq/UjIgU15bJRW9WMlifcNyauZdWVhqwyWbOkTl/xCoxNuFqNYN3CNMp3Q0unhmyhzn2Oh8I759JZv1yS7YF9buCLe40I/Kr+YhsD3vhmaHkR4ePGnc/wvNT6ELLUzh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HTZrmV3L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3C85C4CEE7;
	Tue,  4 Nov 2025 02:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762225161;
	bh=pZCOHjj1efJAEnHBeLtvAawr6ePQ+W1jtHPifnCyZmQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HTZrmV3LuoMWtn5wRl+nAZc8Ui+CYwjc0ji++mQCHmBhT/4919Je1UI8mGq6JIzdz
	 Kfu/MnihENMkvxyS8S8axjeWQfpyxSX8OmQ7Ge2xkDy+3iYrtliY47oupmg9Dyg79O
	 haDvWAL4WvlpftDYpllxVt3tFwrmPxPjHEgMylHAEupqOf77AyFlE/wUirG3fK+UXK
	 ftQpBWENPWiTeU0d/knppi+MBac1X5wjBhy1thHoNQI5g4gMpUTZCww4vwvaRqfUNZ
	 r9okq6LKygLoqIeuPMpV8kwgy77tGilHoFkktpb6AfqirblO+vZ1vQP+9JV1dKFpmK
	 idOG0moT4scRQ==
Date: Mon, 3 Nov 2025 21:02:53 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Connor Abbott <cwabbott0@gmail.com>, Srinivas Kandagatla <srini@kernel.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 2/6] dt-bindings: nvmem: qfprom: Add sa8775p compatible
Message-ID: <bkhjgw4mtfmkatxjl7enn4fqqjbutealhaqgxihdmcvhekyyd4@lsosso5ta74z>
References: <20250910-a663-gpu-support-v6-0-5da15827b249@oss.qualcomm.com>
 <20250910-a663-gpu-support-v6-2-5da15827b249@oss.qualcomm.com>
 <8ff537c9-efa0-4aeb-987d-150bef8b7c00@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ff537c9-efa0-4aeb-987d-150bef8b7c00@oss.qualcomm.com>

On Mon, Sep 22, 2025 at 12:55:36PM +0100, Srinivas Kandagatla wrote:
> Hi Bjorn,
> 
> On 9/10/25 12:25 PM, Akhil P Oommen wrote:
> > Document compatible string for the QFPROM on Lemans platform.
> > 
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > ---
> 
> In case you plan to pick this up.
> 
> 
> Acked-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 

Thanks, it seems though that I missed your reply earlier.

Please pick the binding through the driver branch if you can, then I'll
pick the dts changes.

Regards,
Bjorn

> --srini
> 
> >  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> > index 3f6dc6a3a9f1adc582a28cf71414b0e9d08629ed..7d1612acca48d24c3b54c4d25fa8a210176d3bb5 100644
> > --- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> > +++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> > @@ -39,6 +39,7 @@ properties:
> >            - qcom,qcs404-qfprom
> >            - qcom,qcs615-qfprom
> >            - qcom,qcs8300-qfprom
> > +          - qcom,sa8775p-qfprom 
> >            - qcom,sar2130p-qfprom
> >            - qcom,sc7180-qfprom
> >            - qcom,sc7280-qfprom
> > 
> 

