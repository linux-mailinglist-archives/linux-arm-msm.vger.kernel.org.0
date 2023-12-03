Return-Path: <linux-arm-msm+bounces-3094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A78208020D1
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 05:52:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9E4F1C208FE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 04:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6CD71C0F;
	Sun,  3 Dec 2023 04:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NpKBXyuF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8226D4419;
	Sun,  3 Dec 2023 04:51:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AAEEC433CB;
	Sun,  3 Dec 2023 04:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701579113;
	bh=1qr6M/RXnieLfllIA8ZsAQ+xSrQC5lGllwk0fEQ0HV8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NpKBXyuFMHCWGT2i0foR1WwEI1eaZR1HqScX4JPA7faYQH9DN6a6H4N2EwaTTie/X
	 TMZXlFhT4Iz8h+EhV4ldBwo/q5fMRYX58Cmwi9G7TsCX+sx58mld3MQhVbNjA3y+Dk
	 P5CnD+jvKuoiRXQ8F7UdqdrKcRJuMcDlCBJDyyWfLCd2WTsWQIm1mbgBnleCzEVc6X
	 EicBJ5QA0R9VDR2pOvpoV5lBVgkkKe3D0fJ7Ix/X9zf1fofPy7azAbBtgdzDhmoP48
	 our8y0CKfw/4JtDtaURI7m0L7ELk+8wf8RKMRChqU19WvF6aVl/vnnh2GxS5waYAui
	 WnpPIFziZR+bg==
From: Bjorn Andersson <andersson@kernel.org>
To: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca@z3ntu.xyz>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v2 0/2] Small dtsi fixes for msm8953 SoC
Date: Sat,  2 Dec 2023 20:54:41 -0800
Message-ID: <170157925829.1717511.13837775951569273459.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231125-msm8953-misc-fixes-v2-0-df86655841d9@z3ntu.xyz>
References: <20231125-msm8953-misc-fixes-v2-0-df86655841d9@z3ntu.xyz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 25 Nov 2023 13:19:26 +0100, Luca Weiss wrote:
> Fix some small things in the qcom/msm8953.dtsi file to make dtbs_check
> happier than before.
> 
> 

Applied, thanks!

[2/2] arm64: dts: qcom: msm8953: Use non-deprecated qcom,domain in LPASS
      commit: 2e0dcbf164fb02d2558bd08b9609a30ef5935912

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

