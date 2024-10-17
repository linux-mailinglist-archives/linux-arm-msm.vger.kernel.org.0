Return-Path: <linux-arm-msm+bounces-34713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BA99A1E34
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 11:23:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16E801F23A20
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 09:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D81D1D8DEE;
	Thu, 17 Oct 2024 09:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JBnYrPyN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A631D8A14;
	Thu, 17 Oct 2024 09:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729156990; cv=none; b=eJpStUsSUUAIXQpT9LVNOD6BIcC1KgLx3BBP5vCosA3p/ERDiwHHwKND8W4QSDRn1tZpGZTFgiuOCBp4GC7B/IbwhxoBxq0cVNu48VZ0bWESn7tttib5phP2o2eXQ4s+LI7sh1FNKXM/kzNMIFIja+2o/clOL9kqFBCKYB0DD6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729156990; c=relaxed/simple;
	bh=roQk4+wPKL6CoQaJxy8dRC1Ol0Eh/tGU7Px2YnAC39w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R6lRJm5/VVywOpTsIseuEJK8r0eHPhuF4S8kxb0dAgEwtJLKBMGoJyONNCrkzO+PddfRosxgHFAUvrWYz9CVAwW4le+heHwJi1uCiberCQ8IgGmQFHGW6Sp6hG79WoDTTvs0kcL09RV0Fm4sXDKbK6d9OXyn54nKF/js0s0oHCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JBnYrPyN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D072EC4CEC5;
	Thu, 17 Oct 2024 09:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729156989;
	bh=roQk4+wPKL6CoQaJxy8dRC1Ol0Eh/tGU7Px2YnAC39w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JBnYrPyNIbZZnDizykAZRFvRIAyK3Ok1tvA22uQwrpUuhH6Ry6OJN87yzsO3/MiBY
	 WTxtETbnpbyyU31Ri4UNrSz+P5OnM3/KZFQ+SuU8CkePNx+v3f6PScEL1pUKl7eNTN
	 ZxLtCKW+gccfgAnv1UyL8FADLHwg9U61Je96CPR9f1dsYDm0vahDTVio0w++9F7wwj
	 C93vVzV2ge81UlKpHhYj2NvCAJrJubGg5XcgQjEvb8N8elkgerLAJh270I1jqM1aUl
	 loGKV9pavbLbmSJGcyOrCy0bcuE9AtbdYbsZHCq/9GDPKYBlYi/MgfRdnN14XcILod
	 Sr/1vyEn6UIGA==
Date: Thu, 17 Oct 2024 11:23:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xin Liu <quic_liuxin@quicinc.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
	Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, 
	quic_jiegan@quicinc.com, quic_aiquny@quicinc.com, quic_tingweiz@quicinc.com, 
	quic_sayalil@quicinc.com
Subject: Re: [PATCH v1 2/4] dt-bindings: ufs: qcom: Add UFS Host Controller
 for QCS615
Message-ID: <rv3ukz6rhgp3x32s74nbftmoqmdxjxmoii3zsd4wipmhudyq7q@ha4l2svl5lim>
References: <20241017042300.872963-1-quic_liuxin@quicinc.com>
 <20241017042300.872963-3-quic_liuxin@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241017042300.872963-3-quic_liuxin@quicinc.com>

On Thu, Oct 17, 2024 at 12:22:58PM +0800, Xin Liu wrote:
> From: Sayali Lokhande <quic_sayalil@quicinc.com>	
> 	
> Document the Universal Flash Storage(UFS) Host Controller on the Qualcomm
> QCS615 Platform.
> 
> Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
> Co-developed-by: Xin Liu <quic_liuxin@quicinc.com>
> Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


