Return-Path: <linux-arm-msm+bounces-44331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B298AA05568
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 09:32:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFBB4165FEA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 08:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 056651ACDE7;
	Wed,  8 Jan 2025 08:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QtHrPcx6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76B41A0BE0;
	Wed,  8 Jan 2025 08:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736325152; cv=none; b=Kh7Ngmx/AeLsMCyB/Ec20pGOsV04kiSqnXMf785iwdAKXXY4a6aqHXuxfXzVo+TAG/WzY2d3OiKnLj73g2K9KFwN8FjCKyrBomdEyPgS/mZ90qt2jbfiitClHOsbeUzychX9FukPz3wyjRIHagw3TAnk0/tGrreoCA9jANaPFFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736325152; c=relaxed/simple;
	bh=rSwNJmQumvQ6HLnCy914vkABbR1LzlL3b8aJ3wNJL1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZW5N3AOuYgVdjkVx9lalPd7F3dQvR1R1zJU1qiv0BGGTURcXXvhaG2hIoV9L0fEBuVKR6bJ1ajEA2K3rczGjUD6qEBrh+DNZSr3NmA76pJ8sKfHrFonG9ke0jQ5/TETQ6NI9r8SytTaJHaqSGnSr584FvMPX4WmymAh4CDIGfI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QtHrPcx6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FF87C4CEE0;
	Wed,  8 Jan 2025 08:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736325152;
	bh=rSwNJmQumvQ6HLnCy914vkABbR1LzlL3b8aJ3wNJL1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QtHrPcx67CHBswFQZK7LZGPEWrTEepYRUfiw0+86hXNyTwfSG1XX2VmmoippnW9FT
	 mGmUKGAKdSFmxcgzW43BstnNG5zrvdL1OIfdCYKBXU0FaJlqNNau28mp1aodu23enB
	 4i2oSvdYhnI9YxMGvUGm8mveyM8w1E2UoXtsMLEIXb8EB2i3N/noWohX1W0U1GJNcY
	 9I1gMajrBIBFARUnKcT6Rd7YSWT5Zl+hnTSQ0MFG/WN+sHuGFyNfhh5tgnUeobvxm0
	 Yqq6LtF7v3Wt2lK+jv/F7Y+nmroFo2u5/+6gC6LjUfY3Gwgfq2j3k6dse1sCbn1igH
	 1SAMYJUm85Oyg==
Date: Wed, 8 Jan 2025 09:32:28 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
Cc: jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andersson@kernel.org, mathieu.poirier@linaro.org, 
	konradybcio@kernel.org, quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	dmitry.baryshkov@linaro.org, quic_viswanat@quicinc.com, quic_srichara@quicinc.com
Subject: Re: [PATCH V3 3/8] dt-bindings: mailbox: qcom: Add IPQ5424 APCS
 compatible
Message-ID: <q4hetnqlpxivjy7ynse7yyjo2gebslhxuhayzfqtpput2hsa32@io3qpcsyv6es>
References: <20250107101647.2087358-1-quic_gokulsri@quicinc.com>
 <20250107101647.2087358-4-quic_gokulsri@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250107101647.2087358-4-quic_gokulsri@quicinc.com>

On Tue, Jan 07, 2025 at 03:46:42PM +0530, Gokul Sriram Palanisamy wrote:
> Add compatible for the Qualcomm IPQ5424 APCS block.
> 
> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
> ---
>  .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml       | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


