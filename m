Return-Path: <linux-arm-msm+bounces-78992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1306C0F6E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 17:47:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AB4A485300
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 16:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DF7D31618B;
	Mon, 27 Oct 2025 16:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cU+30OTS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620EB315765;
	Mon, 27 Oct 2025 16:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761583083; cv=none; b=TO7OxlB2CHkjCffL66IcyP5+Y0TBJ5IIGrNn9GzXYs1p8c5dkjRpgUaQnFKbutnUBNcm1E3W41A9wIpmc6Zi3YqtPRMPeLzMkLvPXuTigi49n0Jk0LxLDEnncIgBVBK5raHioQeBeVfkQZqeGmok1RsqXOp7GMqUZXUgV1gjbBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761583083; c=relaxed/simple;
	bh=Yjzk/NTBFPSiKrJHPjCJmIZDJ89ctofxUn0yuV48q5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c6N6GTEuaQZy5aUAFaPRLBP1ut1zArMQqSivdDm3k+aRzyOlUBCazICBT++SAEGepYAgy+shUimFeOgZ+H6bYvYv6JytAhuyVFbfLZF3mhpJjEm7+5P/3qsfEz3C+ii+HvFyK7NWKTOayNhW9+Q3IMd5vzmWHq5lXWQjDA901Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cU+30OTS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D024C4CEF1;
	Mon, 27 Oct 2025 16:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761583082;
	bh=Yjzk/NTBFPSiKrJHPjCJmIZDJ89ctofxUn0yuV48q5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cU+30OTSExlFaoMXL0UZ/9h+7upa4ODjoeVd2Ew2w8zi6fQ2jQIJ0cMkjKrBoVMmx
	 MT/VoKQPhBDIcXZ0tIv5ZHuXm7ID3+IlgCN3of+IzcqXWZxpgM2buaqQtmJ23ysmio
	 A7vJhzGBp+s37Ji7fko4b6926M0963C7tz1u20cE01y0KqtdHyoTtTnY/MkI0d8x1F
	 b8/FoH5vsMgbpJgVi6d7vGke4sigJbJOV6b/v2TTOGNexHdg/AMuPQrvhsR9p5le5n
	 FhQtz+NJ+yO61j+V/IDjYsqivc9Gt5E5SafeF4UYro/5bf+9ZRPlZ0r4vRJsZd4QfS
	 E886movNKpuPA==
Date: Mon, 27 Oct 2025 11:38:01 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	linux-kernel@vger.kernel.org,
	David Collins <david.collins@oss.qualcomm.com>,
	aiqun.yu@oss.qualcomm.com, devicetree@vger.kernel.org,
	jingyi.wang@oss.qualcomm.com,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org, kamal.wadhwa@oss.qualcomm.com
Subject: Re: [PATCH v3 2/3] dt-bindings: spmi: add support for
 glymur-spmi-pmic-arb (arbiter v8)
Message-ID: <176158307885.1116676.7982216280319178856.robh@kernel.org>
References: <20251024-pmic_arb_v8-v3-0-cad8d6a2cbc0@oss.qualcomm.com>
 <20251024-pmic_arb_v8-v3-2-cad8d6a2cbc0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024-pmic_arb_v8-v3-2-cad8d6a2cbc0@oss.qualcomm.com>


On Fri, 24 Oct 2025 15:03:22 +0530, Jishnu Prakash wrote:
> SPMI PMIC Arbiter version 8 builds upon version 7 with support for
> up to four SPMI buses.  To achieve this, the register map was
> slightly rearranged.  Add a new binding file and compatible string
> for version 8 using the name 'glymur' as the Qualcomm Technologies,
> Inc. Glymur SoC is the first one to use PMIC arbiter version 8.  This
> specifies the new register ranges needed only for version 8.
> 
> Also document SPMI PMIC Arbiter for Qualcomm Kaanapali SoC, by adding
> fallback to Glymur compatible string, as it too has version 8
> functionality.
> 
> Signed-off-by: David Collins <david.collins@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---
>  .../bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml   | 150 +++++++++++++++++++++
>  1 file changed, 150 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


