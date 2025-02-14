Return-Path: <linux-arm-msm+bounces-48083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 560CAA36885
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 23:42:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FE8E3B3453
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 22:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33434212D65;
	Fri, 14 Feb 2025 22:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tfo5mQ7T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071081FCD02;
	Fri, 14 Feb 2025 22:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739572723; cv=none; b=lFwKCLcf5QGuz8Nrd6IrdSgzCihQ72V4id9hkmhEmzAZlKMaaQ+lM0eEVly3M4v2leOcv1r+oSInFaLPEky5vqKgn/mX7pO/s4tzHO5t6OSWeBNYwm0Kk/B44BDUKMyL/+zmkAnTKE5bO45HYqf3rufkb1unkR4ytkwOxvUv240=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739572723; c=relaxed/simple;
	bh=VzBMLeb5z+KMQPY2zQfZDVg1KR9+EV8WKi5QGYuPy7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KJp8n9/XlobjVowA3IRzkmo/rPFPyhfcpCzn0sLQ4v7SPMxP9YasoWdSnE22cSQEDUN+GVxLDg8XYrthNbpHp+Kq2IWzuhOB3efY38vUQeOt8l+uhoxmttPvalp4pAb7156Amvs7HlmUCQ5Nb1GHgYWXEbvVn8MdTosygSvCoJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tfo5mQ7T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB601C4CEE7;
	Fri, 14 Feb 2025 22:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739572722;
	bh=VzBMLeb5z+KMQPY2zQfZDVg1KR9+EV8WKi5QGYuPy7o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tfo5mQ7TAp0HkVRtX+J2Ts8uFlZINxKZVSQRCrtFnqo+zmfvqyB3w2kOx0eQt+Y0P
	 lsb6lFQOGelYDvuIySzWt14ZoUpZ3OJ/7fI3/4TfA1ESOkP4LME54SFqq1EIayQE6N
	 30jOmX6Yh6eKk9dXDzhPLfE+bQwAQ6L9X/2IIxhIqQrdhrK7/rA8Wq3rwtMZfVRnRj
	 PP1FWxAJRAFFDd3oQCIyGp+yyp0+peJ+NKnrWgdBY7ZpuP9YSEJvEw0VopiAsgvd9x
	 ekJzi8BYPCjUppE2hpHscYCNwIbfpcGjj90D3UFly/b5LgNgfuuAMc00f5zdvafiXt
	 LmT4sQDLm0ZMA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Melody Olvera <quic_molvera@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jishnu Prakash <quic_jprakash@quicinc.com>
Subject: Re: (subset) [PATCH 0/2] arm64: dts: qcom: sm8750: Document and describe PMIC glink
Date: Fri, 14 Feb 2025 16:38:24 -0600
Message-ID: <173957268929.110887.1281779145233312590.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250113-sm8750_gpmic_master-v1-0-ef45cf206979@quicinc.com>
References: <20250113-sm8750_gpmic_master-v1-0-ef45cf206979@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 13 Jan 2025 13:22:21 -0800, Melody Olvera wrote:
> Document and describe the PMIC glink available on the SM8750 SoC.
> 
> 

Applied, thanks!

[1/2] dt-bindings: soc: qcom: qcom,pmic-glink: Document SM8750 compatible
      commit: 707fb1f227aae7df81d658f7898b4284b9b61064

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

