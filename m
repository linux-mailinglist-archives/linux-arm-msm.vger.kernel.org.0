Return-Path: <linux-arm-msm+bounces-65175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 652AFB070A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 10:34:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA898562187
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 08:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1E702EE975;
	Wed, 16 Jul 2025 08:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ykd+c+i0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A072951CB;
	Wed, 16 Jul 2025 08:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752654839; cv=none; b=cHfRfRzSsrrL9xx80F0ugRJAzCrmoB7sEpwNvHyxnZ9Bz4pu2+z4kaO2ykeZCNCVIfM3KGnW4Ix0AZb/JQt3/wuIxtTFXbRdwTHRxSL5LA2JNyBvk3aG4AcJaPiK1v7cxRJRmlgXgs4XgSw/XhsVSEbksCFHnx/5w3+G3LB5wmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752654839; c=relaxed/simple;
	bh=gQCajo6V3qiKVw+aPxI0VqerSi9B9AAulC3YPoNSIMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y/C5HxSnf7UBS6phd4+XnkdweWioXZcXG9+pjGF43Pa0OItinSwGafhPpmQvZC2EZ9ucI+2mF/zhxxz030suRC5VWNSmch83Ut9PPBzaDwuIfE64eSbRsGOxKLb8RLP5TcW0cnY3OTH4jwFq052WtWWGiB9uVBuNhd0QYMudmIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ykd+c+i0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEC53C4CEF0;
	Wed, 16 Jul 2025 08:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752654839;
	bh=gQCajo6V3qiKVw+aPxI0VqerSi9B9AAulC3YPoNSIMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ykd+c+i0RieXzf1p25bkk9iaQhsd1fEnEgo9vUCJHkWsewfZGEMKs/x0RqvNsQips
	 nqKpQWFgVl6wk/Q1Jut5Nttlh3uzjhtR+KVRu04C8CihSmVfmbl0TkhV1wQz8wx3/N
	 FIUVEP3KrBKNn1cciUSj9nlSk5ucxWzjxt16/A6kdlDO0exZzMjxNwLPPTuhp5HXD2
	 AcDQmakg9ZrgKmrr+la2xZTeK4he3nHwgiNJBrij24bEtxI1vesW6geX0xVfOPFmXV
	 WZWf5Qm0DbH6jw9c8hq1h/myR/lUuml7do+Hg8KCslLF/W33gnb4olKecixEaKejXM
	 v496Xkq0fvQhQ==
Date: Wed, 16 Jul 2025 10:33:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: qcom: qcom,pmic-glink: Add
 qcom,subsys-restart property
Message-ID: <20250716-functional-loutish-peccary-dcb4c6@krzk-bin>
References: <20250716004004.311001-1-anjelique.melendez@oss.qualcomm.com>
 <20250716004004.311001-2-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250716004004.311001-2-anjelique.melendez@oss.qualcomm.com>

On Tue, Jul 15, 2025 at 05:40:03PM -0700, Anjelique Melendez wrote:
> Add new "qcom,subsys-restart" property to enable subsystem restart (SSR)
> notifications.
> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml         | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> index 4c9e78f29523..90011096894e 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> @@ -49,6 +49,10 @@ properties:
>    '#size-cells':
>      const: 0
>  
> +  qcom,subsys-restart:
> +    description: If property is specified subsystem restart (SSR) notifications will be enabled.


Please wrap according to Linux coding style... if this stays, because
this all sounds like Linux notificatons, so an OS property.

The commit msg explains nothing - just repeats this. You need to
describe the hardware and the reasons behind this change - WHY you are
doing things - in terms of hardware.

Best regards,
Krzysztof


