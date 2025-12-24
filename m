Return-Path: <linux-arm-msm+bounces-86530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DADBACDBD1F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 10:39:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2233D300D4DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 09:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94E1A3346A5;
	Wed, 24 Dec 2025 09:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jC5YlRCD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC6433469F;
	Wed, 24 Dec 2025 09:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766569170; cv=none; b=ao8xvMY/MZQ66dUOHCdC/P5BDYJgpV8XiFfQXaWVGj/LMCpRJS1h8irK2QrfAWPhnNPVp4y7t/Bt6VNx3hR66N7j+iRHfVJpqMnBVheA7u7x/r55bGSkiiy718ei/9SWU7KdiBNAzgFo/K1Xm2HwKQiwlchA+0Rr4ofjao8LUZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766569170; c=relaxed/simple;
	bh=XTv2qlMyC0ohRJj/nW7GhRyn3CHdHat7GiQHo+rf9HE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y/wHnklncLatOd36miv90RZWl8aljsnenNbWglDfnAPXHdjK55f/qGqAkha3boUKaW82gFvi9Xa4XlBQgZ5gP5ok3srNfSBzSMBLHLYyPj6N6YI6E6RzhXX7FABSfpvoXupawMYcP/M47LitmgEEXlahFxJcHr7iTvTOCK1CMuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jC5YlRCD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB549C16AAE;
	Wed, 24 Dec 2025 09:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766569169;
	bh=XTv2qlMyC0ohRJj/nW7GhRyn3CHdHat7GiQHo+rf9HE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jC5YlRCD2v0O0qCk4x2W/x5/e6JMZ9GK1ReZ4m/T3SH9GhpaYIN9EEH1zT/NPeajH
	 cVkWxKDYdY+i989hhzxDDh9JIrD5zmnAWsfYfTDLvQK1249zj7M1r1z9D5DbVRp8bQ
	 GUIiJtBpIdEm4gilByXRPYBTBVamAYYJ16jIqYySfF1Q3KRJBJdLDtfWx50u2JA3U3
	 H82FU1r9a+N9GTsa8KrhvW9KrpdDm0rMAItjBx0AhP0w6+ahnWmH2ogc3DGmxLj7Ih
	 hSUV5+eXNsZjYWEhzHvPbudxcswkL82T/ch0QGO0gdzILOJwgqotWfsCVe2uYSNeqI
	 q+1FFjm/3m8gw==
Date: Wed, 24 Dec 2025 10:39:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com, 
	sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com, 
	yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH v4 04/11] dt-bindings: display/msm: qcom,kaanapali-mdss:
 Add Kaanapali
Message-ID: <20251224-shaggy-brass-dinosaur-4da3d2@quoll>
References: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
 <20251222102400.1109-5-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251222102400.1109-5-yuanjie.yang@oss.qualcomm.com>

On Mon, Dec 22, 2025 at 06:23:53PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Kaanapali introduces DPU 13.0.0 and DSI 2.10. Compared to SM8750,
> Kaanapali has significant register changes, making it incompatible
> with SM8750. So add MDSS/MDP display subsystem for Qualcomm Kaanapali.
> 
> Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  .../display/msm/qcom,kaanapali-mdss.yaml      | 297 ++++++++++++++++++
>  1 file changed, 297 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


