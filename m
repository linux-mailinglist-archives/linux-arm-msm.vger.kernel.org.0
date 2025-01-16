Return-Path: <linux-arm-msm+bounces-45298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18745A13ECB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 17:07:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 923993A99CC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 16:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3227922C9E4;
	Thu, 16 Jan 2025 16:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gOK88vLd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A0522BACD;
	Thu, 16 Jan 2025 16:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737043662; cv=none; b=q5DB9AnMK3dYY2HBf7uBXOkqXV4Et5gi34RaB1RwZX+2QEkKuNmhcXqLxioAsO37Y4e97vlH+FFeMhkLfJVgLZBl6v9FtjSAONY3ZqIH2xaliLU1YWLG6OUNP2ojYIIcPREz33tEc2O7yyryx2acv+0y8B2RLyDKNjKs63H8hpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737043662; c=relaxed/simple;
	bh=WEWZ/z1GZjGBKSToMHClV7mXYrm484LHCBKUzcCt5ss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iFHi7Z7Nt1k6VU0fO6AZBnG81etjYqSLifZ6oE8KlQ2sSDf6clsYIx8WHpAoGOn3YUmC0aR5IEPKrd7cADLBhZx8UCfYVjYVCzjXxDsihfyBNKSKNvR7JhzERlNsUbOWrJjM7jiYyJDgTAUqFmpMJueWu4Sl6jqIqI+OJbaXMGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gOK88vLd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 459D8C4CED6;
	Thu, 16 Jan 2025 16:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737043661;
	bh=WEWZ/z1GZjGBKSToMHClV7mXYrm484LHCBKUzcCt5ss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gOK88vLdkX1G5aYNa6OC4glEybHj5NOsUE2uhT270JsyhlMUbG7p9WaRBw8Xp8Hrl
	 ba8LUQHGkskBurgiS3c27AnnMMSqgSv0KUqkDLrI6zsHx9ZI+ZSF6q7Z/WF75A48ad
	 sr+JPmW3PIXYHWlVTN9FXAlvRcLQz9TWt0Dk1cdVCZi66XH+E2rSYChqsCVjU7GYhC
	 MkoXFGkR6Al8cN2rK8xwgjgOrHE4XzlbqXpvbaSPFdtNbi+0mdIRTtr2ns1wG+pnmx
	 VZUiPMC6HSYtr74os4Lkhg1wRET1rUHNMS8P4BiTHOw1AAkyNiSfMXHqDvGoS8ZX65
	 /5HFyjnsHvnNQ==
Date: Thu, 16 Jan 2025 10:07:40 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
	Jishnu Prakash <quic_jprakash@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: qcom,pmic-glink: Document
 SM8750 compatible
Message-ID: <173704365950.2645134.8017607585171671305.robh@kernel.org>
References: <20250113-sm8750_gpmic_master-v1-0-ef45cf206979@quicinc.com>
 <20250113-sm8750_gpmic_master-v1-1-ef45cf206979@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113-sm8750_gpmic_master-v1-1-ef45cf206979@quicinc.com>


On Mon, 13 Jan 2025 13:22:22 -0800, Melody Olvera wrote:
> From: Jishnu Prakash <quic_jprakash@quicinc.com>
> 
> Document the SM8750 compatible used to describe the PMIC glink
> on this platform.
> 
> Signed-off-by: Jishnu Prakash <quic_jprakash@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


