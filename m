Return-Path: <linux-arm-msm+bounces-72683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB6FB4A2C6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 09:01:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27CAC4E1C54
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 07:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DA062EBBAD;
	Tue,  9 Sep 2025 07:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kvkw1g5F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0D4315D43;
	Tue,  9 Sep 2025 07:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757401257; cv=none; b=XNWqcAeZy9R0PfH88uoQA0cGVA8DacDXkoaIocmPpb7No5FQF7Us0VS/3NckUdc/s0l7mdiGxMnI7xtjavv3NwcGZ29VK7Q8Baby/tV22rkZwuF/uQ0OtW6o6d7toLMIwvzHnVzjDk+0nsR6puAC2vIP9Se5pGkj+Q1KUVyKK8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757401257; c=relaxed/simple;
	bh=OJ2A3hS+Hfqs4PqlBoUm97j23nUDMRLt7shjDK+BqGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RVO8OGit/DdRR4JUg5dHWzo3kLZeGjnEX8OPhhWZ3n3hEPjTQP/BZgkh8FSvWcb49FoEzi5ldEEfMBBdm3TQ5+sqLeLhRG7mP6YwW/NDH7F90XjSNrHlYPe7Iah0LEFjqkG+o90nypHLBq9bH5pcJ4ru5o1J/PmeUwSEaj7CrmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kvkw1g5F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98887C4CEF5;
	Tue,  9 Sep 2025 07:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757401257;
	bh=OJ2A3hS+Hfqs4PqlBoUm97j23nUDMRLt7shjDK+BqGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kvkw1g5FzWJ6I0hfJixs69zI4Km28+9/BzI2eoCWBDvTex3y6C/FTAP/vSQdMZeai
	 +VF2WlCJs+SsBNl938GkuED0UP8ogYzlWGEWIQAYdC6phmQyJcgfQVhP2tG4Gj9S6B
	 HEM11URGsZRf8YvADnSzalsMjC6NtGmWO5iX2dH8QTPNCnPXkNGkjmMJDDiZzXf/so
	 X8sjR+3biFQcX5g0RhOsC476sTl+QcgVf30F4qftH9fNbufj3pY9k6uZO8jxnT5q7x
	 8k1/ltLfAsW6Wm1mK39HINQDhtKJRxGABP7mV7MvJaZs2d8+oRKnktXOXAAeVV2Zve
	 ZfdWkOsliHQDA==
Date: Tue, 9 Sep 2025 09:00:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sarthak Garg <quic_sartgarg@quicinc.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, quic_nguyenb@quicinc.com, 
	quic_rampraka@quicinc.com, quic_pragalla@quicinc.com, quic_sayalil@quicinc.com, 
	quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com
Subject: Re: [PATCH V6 2/4] dt-bindings: mmc: controller: Add max-sd-hs-hz
 property
Message-ID: <20250909-wise-calculating-poodle-89fb8e@kuoka>
References: <20250908104122.2062653-1-quic_sartgarg@quicinc.com>
 <20250908104122.2062653-3-quic_sartgarg@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250908104122.2062653-3-quic_sartgarg@quicinc.com>

On Mon, Sep 08, 2025 at 04:11:20PM +0530, Sarthak Garg wrote:
> Introduce a new optional device tree property max-sd-hs-hz to
> limit the maximum frequency (in Hz) used for SD cards operating in
> High-Speed (HS) mode due to any board electrical limitations.
> 
> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
> ---
>  .../devicetree/bindings/mmc/mmc-controller-common.yaml    | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


