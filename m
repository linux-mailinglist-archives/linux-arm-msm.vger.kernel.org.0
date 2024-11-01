Return-Path: <linux-arm-msm+bounces-36683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A7D9B8C05
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 08:26:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C4B41F2312F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 07:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA914153801;
	Fri,  1 Nov 2024 07:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qzg8WFqP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8F514A4E9;
	Fri,  1 Nov 2024 07:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730446007; cv=none; b=hpg9XUpZMgiVZDCRbk4p8P0k9qV4Mgs1CTcIRCO/faazzrpD5UkeDwHXyCFMQFOL/4aAqnIChj5L+44x6IhiBurqFUliJa9gioWR7YzlQ53E9SutFI/iQIVUv1FzvP2dmSdnM0BSHOqrkv/4kLC9CV7T9jHTllYLNgFgqYR9QMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730446007; c=relaxed/simple;
	bh=Wb1QsSIev6n0zl6P3JKiFxEbw0p6G0Nd0bRgW8dyGcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LNyhkWXIFcUVt4F0mzFZFcTBkhcDJQ6gvRigvKymy1KMBlJRLhCullZTzhiGkns4/V/mML9epd1NTVGNxXJ9c/+PlHkOkBxTc4pNx8c5fOrKgYREEHVW+qk8OoAgCuOuLyWYlnIa9cyJi+aTv9IyKq1HTfgpzFczUTIqrcCgEEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qzg8WFqP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A52D9C4CECD;
	Fri,  1 Nov 2024 07:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730446007;
	bh=Wb1QsSIev6n0zl6P3JKiFxEbw0p6G0Nd0bRgW8dyGcU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qzg8WFqP9oo9NKpFQp6MswlVR9XWv2RZZiM7My6nn2+i8+h7Tvo7Tj/4Ip+UlfTna
	 N2A+bXAsZa0sStdQcUSD5Ma7RnG595Vz/+FMAY8kCcCww5RWnwb1Zwil2lbtTIhAgT
	 RrPWn159v2jfr2DQPWcm0suFL3VUZ3jSw8V+oaZk4rVDlU++TxWdNp8JjXG0o3aqvx
	 mUMbDMRsDSwCLAbF6evfB06J9AC2PFOSQXh0gxIiqnJHk3KP6XmcM9gZQqL+0bes0/
	 gXL4tN3ayRBsAeN8h8OUmpgUFMKFLH8Ulte9+w4L0vm3SgqnYbz2nSB/jkaXRk2Y/Q
	 mKhJxXzZva8Yw==
Date: Fri, 1 Nov 2024 08:26:43 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Kurapati <quic_kriskura@quicinc.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: arm: qcom: add QAR2130P board
Message-ID: <ouyxtvrbsdzl6avuoqn4br3p2yi3m47gpyir4lrmrsvydvdmr3@qj4ojrc5iw4j>
References: <20241101-sar2130p-dt-v3-0-61597eaf0c37@linaro.org>
 <20241101-sar2130p-dt-v3-2-61597eaf0c37@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241101-sar2130p-dt-v3-2-61597eaf0c37@linaro.org>

On Fri, Nov 01, 2024 at 02:49:23AM +0200, Dmitry Baryshkov wrote:
> Add the Qualcomm QAR2130P development board using the Qualcomm AR2 Gen1
> aka SAR2130P platform.
> 
> The qcom-soc.yaml chunks use explicit 'sa|sar' instead of just 'sar?' to
> be more obvious for reviewers and to ease future extensions. Overuse of
> the regular expressions can easily end up with the hard-to-read and
> modify schema.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom-soc.yaml | 4 ++--
>  Documentation/devicetree/bindings/arm/qcom.yaml     | 7 +++++++
>  2 files changed, 9 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


