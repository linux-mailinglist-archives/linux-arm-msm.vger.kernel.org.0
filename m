Return-Path: <linux-arm-msm+bounces-60118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E061ACC1D4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 10:10:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DE011709CA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 08:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7858C280337;
	Tue,  3 Jun 2025 08:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b="SAsE3CV4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-24421.protonmail.ch (mail-24421.protonmail.ch [109.224.244.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BBD268FFF;
	Tue,  3 Jun 2025 08:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748938199; cv=none; b=jLO1dmfCDe6yV1q2tzVGacMXP/j+S09IvEsfa2bNH1og20FsgJ8+5WvTpKpz59HWQ7srdpyb0WP5H+JZCWe0DyR0nqJe1IWntR+23MmViLGdjPwx8ttDHtufPiZGdVi0RVtPgVm9x9rSOHq5SWOhLUdGJkWjAfZFiGvkjIfFe98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748938199; c=relaxed/simple;
	bh=OCI+PpWASD7sLo2MJgDQvdo2o++17YjCGFcKCFyLdqk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DBt+PtGkYrR8J4bRD2sz6lWfJxzBJfXny14k/Ze2E445Q2etV5QiLH6WByFfFdlmPBuRpXXWPZfsxChwf+mmM1QcJkp0NmUBrhC3F3XTFMiK5++ccqB7LAgmaih6i6Kx3LZkF1pmntJwnW2sMItCNcQrE3rryjCMWlafkmgXsvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie; spf=pass smtp.mailfrom=nxsw.ie; dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b=SAsE3CV4; arc=none smtp.client-ip=109.224.244.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxsw.ie
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail2; t=1748938195; x=1749197395;
	bh=MBcwTN9fNybth9Y9nK84MLeY8D6MbSYYsWdQF3WzHVs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=SAsE3CV4OzDwdospsTtUH7Xwi6u6Uzqyc2Bov2rplKWv7BQQ1IJCYmfuVPJUaIPkU
	 3ooWajezDqDyBOoLp5/L8SHStdylECeXMNzEONyKMO3+Xmdf0YGnosdJpIhpDxoD4t
	 Arghxqe1ixXRDTxIRlTFbHDzyiVD/Yz5z2cJWBrHVYydWvkIOWugp2J38CHADrKZWs
	 aNfbezbcqlz/0wOHbctuLmOl/5xOMeurL4u/3ISOBUe5eGrMp2k4MQZAS8kGt7x634
	 dVrMcIKwg6XifXhkSM6TmWLzvmcRWdH18SDA3Gmd3XNfjRW0wfL6zLzSvymRFB8leS
	 h8WgRsseqO8lw==
Date: Tue, 03 Jun 2025 08:09:49 +0000
To: Jagadeesh Kona <quic_jkona@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 00/18] clk: qcom: Add support to attach multiple power domains in cc probe
Message-ID: <2b44e799-3b15-4dfd-96c6-8bb38a5175de@nxsw.ie>
In-Reply-To: <20250530-videocc-pll-multi-pd-voting-v5-0-02303b3a582d@quicinc.com>
References: <20250530-videocc-pll-multi-pd-voting-v5-0-02303b3a582d@quicinc.com>
Feedback-ID: 136405006:user:proton
X-Pm-Message-ID: 6398c13e0a361bd5342a6606cc523563453aa089
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 30/05/2025 14:20, Jagadeesh Kona wrote:
> In recent QCOM chipsets, PLLs require more than one power domain to be
> kept ON to configure the PLL. But the current code doesn't enable all
> the required power domains while configuring the PLLs, this leads to
> functional issues due to suboptimal settings of PLLs.
>=20
> To address this, add support for handling runtime power management,
> configuring plls and enabling critical clocks from qcom_cc_really_probe.
> The clock controller can specify PLLs, critical clocks, and runtime PM
> requirements using the descriptor data. The code in qcom_cc_really_probe(=
)
> ensures all necessary power domains are enabled before configuring PLLs
> or critical clocks.
>=20
> This series fixes the below warning reported in SM8550 venus testing due
> to video_cc_pll0 not properly getting configured during videocc probe
>=20
> [   46.535132] Lucid PLL latch failed. Output may be unstable!
>=20
> The patch adding support to configure the PLLs from common code is
> picked from below series and updated it.
> https://lore.kernel.org/all/20250113-support-pll-reconfigure-v1-0-1fae6bc=
1062d@quicinc.com/
>=20
> This series is dependent on bindings patch in below Vladimir's series, he=
nce
> included the Vladimir's series patches also in this series and updated th=
em.
> https://lore.kernel.org/all/20250303225521.1780611-1-vladimir.zapolskiy@l=
inaro.org/
>=20
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
> Changes in v5:
> - Reversed order of patches 2 & 3 to add MXC support in SM8450
>    camcc bindings first and then moved SC8280XP camcc to SA8775P
>    camcc to have single power domain support for it.
> - Added return code for qcom_cc_clk_pll_configure() and
>    returned -EINVAL in case if PLL config or registers is
>    NULL in patch 6 [Bryan]
> - Added separate CBCR's list for SM8650 videocc and
>    updated clk_cbcrs list based on compatible in patch 8[Konrad]
> - Added R-By tags received on v4
> - Link to v4: https://lore.kernel.org/r/20250515-videocc-pll-multi-pd-vot=
ing-v4-0-571c63297d01@quicinc.com
>=20
> Changes in v4:
> - Updated the SC8280XP camcc bindings patch to fix the
>    required-opps warning reported by kernel bot
> - Updated the description of power-domains, required-opps of SM8450 camcc
>    bindings as per review comments on v3 [Bryan]
> - Moved the PLL config checks to calling function code [Dmitry]
> - Removed qcom_clk_reg_setting struct and regmap_update_bits() code.
>    Added a .clk_regs_configure() callback that clock drivers can implemen=
t
>    if they require to update some misc register settings [Dmitry]
> - Moved the PLLs and CBCRs data to a separate qcom_cc_driver_data
>    struct to avoid bloating up the CC descriptor structure
> - Updated the videocc and camcc driver patches to incorporate above
>    qcom_cc_driver_data change
> - Updated the commit text of DT patches [Bryan]
> - Added the R-By, T-By tags received on v3
> - Link to v3: https://lore.kernel.org/r/20250327-videocc-pll-multi-pd-vot=
ing-v3-0-895fafd62627@quicinc.com
>=20
> Changes in v3:
>   - Updated the videocc bindings patch to add required-opps for MXC power=
 domain [Dmitry]
>     and added Bryan & Rob R/A-By tags received for this patch on v1.
>   - Included the Vladimir's bindings patch for SM8450 camcc bindings to
>     add multiple PD support and updated them to fix the bot warnings.
>   - Moved SC8280XP camcc bindings to SA8775P camcc since SC8280XP only
>     require single MMCX power domain
>   - Split runtime PM and PLL configuration to separate patches [Dmitry]
>   - Removed direct regmap_update_bits to configure clock CBCR's and
>     using clock helpers to configure the CBCR registers [Dmitry, Bryan]
>   - Added new helpers to configure all PLLs & update misc clock
>     register settings from common code [Dmitry, Bryan]
>   - Updated the name of qcom_clk_cfg structure to qcom_clk_reg_setting [K=
onrad]
>   - Updated the fields in structure from unsigned int to u32 and added
>     val field to this structure [Konrad]
>   - Added a new u32 array for cbcr branch clocks & num_clk_cbcrs fields
>     to maintain the list of critical clock cbcrs in clock controller
>     descriptor [Konrad]
>   - Updated the plls field to alpha_plls in descriptor structure [Konrad]
>   - Added WARN() in PLL configure function if PLL type passed is not
>     supported. The suggestion is to use BUG(), but updated it to
>     WARN() to avoid checkpatch warning. [Bjorn]
>   - Moved the pll configure and helper macros to PLL code from common cod=
e [Bjorn]
>   - Updated camcc drivers for SM8450, SM8550, SM8650 and X1E80100 targets
>     with support to configure PLLs from common code and added MXC power
>     domain in corresponding camcc DT nodes. [Bryan]
>   - Added Dmitry and Bryan R-By tags received on videocc DT node changes =
in v1
>   - Link to v2: https://lore.kernel.org/r/20250306-videocc-pll-multi-pd-v=
oting-v2-0-0cd00612bc0e@quicinc.com
>=20
> Changes in v2:
>   - Added support to handle rpm, PLL configuration and enable critical
>     clocks from qcom_cc_really_probe() in common code as per v1 commments
>     from Bryan, Konrad and Dmitry
>   - Added patches to configure PLLs from common code
>   - Updated the SM8450, SM8550 videocc patches to use the newly
>     added support to handle rpm, configure PLLs from common code
>   - Split the DT change for each target separately as per
>     Dmitry comments
>   - Added R-By and A-By tags received on v1
> - Link to v1: https://lore.kernel.org/r/20250218-videocc-pll-multi-pd-vot=
ing-v1-0-cfe6289ea29b@quicinc.com
>=20
> ---
> Jagadeesh Kona (15):
>        dt-bindings: clock: qcom,sm8450-videocc: Add MXC power domain
>        dt-bindings: clock: qcom,sm8450-camcc: Move sc8280xp camcc to sa87=
75p camcc
>        clk: qcom: common: Handle runtime power management in qcom_cc_real=
ly_probe
>        clk: qcom: common: Add support to configure clk regs in qcom_cc_re=
ally_probe
>        clk: qcom: videocc-sm8450: Move PLL & clk configuration to really =
probe
>        clk: qcom: videocc-sm8550: Move PLL & clk configuration to really =
probe
>        clk: qcom: camcc-sm8450: Move PLL & clk configuration to really pr=
obe
>        clk: qcom: camcc-sm8550: Move PLL & clk configuration to really pr=
obe
>        clk: qcom: camcc-sm8650: Move PLL & clk configuration to really pr=
obe
>        clk: qcom: camcc-x1e80100: Move PLL & clk configuration to really =
probe
>        arm64: dts: qcom: sm8450: Additionally manage MXC power domain in =
videocc
>        arm64: dts: qcom: sm8550: Additionally manage MXC power domain in =
videocc
>        arm64: dts: qcom: sm8650: Additionally manage MXC power domain in =
videocc
>        arm64: dts: qcom: sm8450: Additionally manage MXC power domain in =
camcc
>        arm64: dts: qcom: sm8650: Additionally manage MXC power domain in =
camcc
>=20
> Taniya Das (1):
>        clk: qcom: clk-alpha-pll: Add support for common PLL configuration=
 function
>=20
> Vladimir Zapolskiy (2):
>        dt-bindings: clock: qcom,sm8450-camcc: Allow to specify two power =
domains
>        arm64: dts: qcom: sm8550: Additionally manage MXC power domain in =
camcc
>=20
>   .../bindings/clock/qcom,sa8775p-camcc.yaml         | 15 ++++
>   .../bindings/clock/qcom,sm8450-camcc.yaml          | 20 +++--
>   .../bindings/clock/qcom,sm8450-videocc.yaml        | 18 +++--
>   arch/arm64/boot/dts/qcom/sm8450.dtsi               | 12 ++-
>   arch/arm64/boot/dts/qcom/sm8550.dtsi               | 12 ++-
>   arch/arm64/boot/dts/qcom/sm8650.dtsi               |  6 +-
>   drivers/clk/qcom/camcc-sm8450.c                    | 89 +++++++++++----=
-------
>   drivers/clk/qcom/camcc-sm8550.c                    | 85 +++++++++++----=
------
>   drivers/clk/qcom/camcc-sm8650.c                    | 83 ++++++++++-----=
-----
>   drivers/clk/qcom/camcc-x1e80100.c                  | 67 ++++++++-------=
-
>   drivers/clk/qcom/clk-alpha-pll.c                   | 57 ++++++++++++++
>   drivers/clk/qcom/clk-alpha-pll.h                   |  3 +
>   drivers/clk/qcom/common.c                          | 81 +++++++++++++++=
++---
>   drivers/clk/qcom/common.h                          | 10 +++
>   drivers/clk/qcom/videocc-sm8450.c                  | 58 ++++++--------
>   drivers/clk/qcom/videocc-sm8550.c                  | 66 ++++++++-------=
-
>   16 files changed, 421 insertions(+), 261 deletions(-)
> ---
> base-commit: 138cfc44b3c4a5fb800388c6e27be169970fb9f7
> change-id: 20250218-videocc-pll-multi-pd-voting-d614dce910e7
>=20
> Best regards,
> --
> Jagadeesh Kona <quic_jkona@quicinc.com>
>=20
>=20

Can we merge this series now.

Looks ready.

---
bod


