Return-Path: <linux-arm-msm+bounces-69408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 50190B28765
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 22:50:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF1C03AEAF6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 20:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 124B62253E9;
	Fri, 15 Aug 2025 20:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oE/u80At"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D797C26AF3;
	Fri, 15 Aug 2025 20:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755291028; cv=none; b=WIY9K44QostXrGF7Ckm+dhmNhh6XTWk/rZ+xweMjr0cZLaoq4CMz6LxWEXtkBq+Ua41Da64PviIHL80rN2Q/3rgcfX0Mttzw/NfnwMcsYpNcrqq5iJjqQa0v3YyrAgvQOarXAsw8xLTK+JU1XF6e288nYat8PC/8vhGyDpRLoFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755291028; c=relaxed/simple;
	bh=kQ/MNknMyEBxL80+GJlpjiBLs8Klx1adKhEFRMdC8Rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DqhtkydiLOQ47uWFgolpmlidLcq3STRWhEMVBnKu3D1CxPGpkQC8PEokhTwWIHRIPVRM7tz7ALvtfEj0Y1uKlApy3ln8l4xQS//yAmYOwMO2ba0KGjOv02+aXNsOm5geHSkwmHqlpKFaYCK0igU+3UhbYs9d6p8UsNNjmC8xi1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oE/u80At; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A492BC4CEEB;
	Fri, 15 Aug 2025 20:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755291027;
	bh=kQ/MNknMyEBxL80+GJlpjiBLs8Klx1adKhEFRMdC8Rw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oE/u80AtTrhTCD7mnU29Ik01JB0iw13f7xTae6zJgqcGnfM85mzeT6x60Crk91738
	 ioy1kcvnTNw01Ukd9AEhN+RcnWY/7gEUn00ZSKZ3LU/c1TA4tAKD0ZI2/2B80PWo3E
	 oEoQFvRRbIHI6NyAzVcilRHGbIPqJDtcC6tdLCANcLw1u+udKbmjRz+RKhN76mjX0v
	 7RjR1zc0jYgwNbwJJrYeYUaBzgOvXW5zrOTm27EasQi4pO+WRtCteHdVC+aF0kI+zI
	 Cwm00O1i2c7Mc58dr+O21JfF9TmxB4E+h3lQ8WbDgJexZXtKBpRa9O0b1p+HhE3+Ms
	 ZWjmcqEsnzpFw==
Date: Fri, 15 Aug 2025 15:50:24 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Gaurav Kohli <quic_gkohli@quicinc.com>, daniel.lezcano@linaro.org
Cc: amitk@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com, 
	robh@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	quic_manafm@quicinc.com
Subject: Re: [PATCH v6 1/2] dt-bindings: thermal: tsens: Add QCS615 compatible
Message-ID: <ozyej4oryyylk7a7jvx2x2jtfz3i7bq6cvcoev2ub2ni6jf2gl@rwldpauze5fw>
References: <20250702082311.4123461-1-quic_gkohli@quicinc.com>
 <20250702082311.4123461-2-quic_gkohli@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702082311.4123461-2-quic_gkohli@quicinc.com>

On Wed, Jul 02, 2025 at 01:53:10PM +0530, Gaurav Kohli wrote:
> Add compatibility string for the thermal sensors on QCS615 platform.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

@Daniel, can you please pick this binding?

Regards,
Bjorn

> ---
>  Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> index 0e653bbe9884..c8cc67b65f73 100644
> --- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> +++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> @@ -53,6 +53,7 @@ properties:
>                - qcom,msm8996-tsens
>                - qcom,msm8998-tsens
>                - qcom,qcm2290-tsens
> +              - qcom,qcs615-tsens
>                - qcom,sa8255p-tsens
>                - qcom,sa8775p-tsens
>                - qcom,sar2130p-tsens
> -- 
> 2.34.1
> 

