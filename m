Return-Path: <linux-arm-msm+bounces-63842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A99AFA3AE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 10:31:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 788851920563
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 08:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 009F2192B66;
	Sun,  6 Jul 2025 08:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="2ssupT+z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2F5FBF0;
	Sun,  6 Jul 2025 08:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751790702; cv=none; b=SDeq7dKKgFQHn/UrW421tGRBS6aNZ1IETgUR5KX8PpPQYyIxLM/RuxcCwy2YKkZ3gWzztZ1Jry6TyemzcVeP7HRFm/Nbbj3Hr8ACff5cZ7OoJR6jxjzk119rgZaS0s/1FljoNbRwOfHcMt8R97pf/SGznqrlr6rOrvfk1KZ790k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751790702; c=relaxed/simple;
	bh=J362V9HqbGoQd9LWr+mHt5hW3pTQQVMO1t0p9pcy80c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VGww2BMX8CtHejNoqVgGmFtKHobK8Tm2NpavEjgSVlQGwvQcwg7A2O7luL564+qNrR7qMRc0ntBPCzCcXuf0oXs7GOTpTkVF/NHypkkzEziKCPh9ylgC5GdL5klCLFVcJmOXAkmwyAoaoxe1e6miHHmHD3s7fG/9yD0mLCogHXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=2ssupT+z; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1751790699; bh=J362V9HqbGoQd9LWr+mHt5hW3pTQQVMO1t0p9pcy80c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=2ssupT+z2wSVi7hxEZzZHkTr0XYgoBJnmBJak321AeF/APQoi5Rmzb0O9DVtzF+l3
	 YhCpI+9rSN9TQ62MjK2g82T1k/Yw2V5msww2PDtpJ7bcWwhZSO7Xggy4QaLW9d4thV
	 r34b+OfmgI54MfSYeNmIKYAtmoQLVDQCbAZBrMNs=
Message-ID: <226fd16c-8071-43c7-9ecc-9bd95e319aaf@lucaweiss.eu>
Date: Sun, 6 Jul 2025 10:31:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/4] remoteproc: qcom_q6v5_pas: Use resource with CX PD
 for MSM8974
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250621-msm8974-rpmpd-switch-v1-0-0a2cb303c446@lucaweiss.eu>
 <20250621-msm8974-rpmpd-switch-v1-2-0a2cb303c446@lucaweiss.eu>
 <hwewzj4ygfbb22vxrahjfc3b4oxyagh3nkd26bs3p5k2fcxr6m@mkgtyjkxz3d7>
From: Luca Weiss <luca@lucaweiss.eu>
In-Reply-To: <hwewzj4ygfbb22vxrahjfc3b4oxyagh3nkd26bs3p5k2fcxr6m@mkgtyjkxz3d7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05-07-2025 10:57 p.m., Dmitry Baryshkov wrote:
> On Sat, Jun 21, 2025 at 03:19:57PM +0200, Luca Weiss wrote:
>> MSM8974 requires the CX power domain, so use the msm8996_adsp_resource
>> which has cx under proxy_pd_names and is otherwise equivalent.
>>
>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>> ---
>>   drivers/remoteproc/qcom_q6v5_pas.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Hmm. You are modifying the ADSP configuration in the driver, but at the
> same time you've dropped CX supply from the MSS remoteproc.

The qcom_q6v5_mss driver has this support for .fallback_proxy_supply, 
which are used in case the power domain is not specified.

So no driver change is necessary in the mss driver for both old and new 
devicetrees, but the adsp driver does not have this fallback, so that's 
why the adsp config is updated.

Does that make it clear?

Regards
Luca

