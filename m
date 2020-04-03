Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8990C19DD4C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2020 20:00:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728329AbgDCSAe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Apr 2020 14:00:34 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.162]:13396 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727989AbgDCSAd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Apr 2020 14:00:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1585936831;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=nBCuX7REzDwz4iqmUhXnbY65cVvRnb7jf20gvzeR2U4=;
        b=lg+afOc11gfmXPp6H/oM76trtB5byLXv7w2Ozl3X9dMaGQvwzwIdSolHozaqnAzu9U
        NcfSVZGAnxLPavbF9Nhrape2bvgrgvttiqhW3BSTwuWr3xjeIrtNKET04q1IV2Afo78h
        OVaZWtTO+WxbocTXEWYCKwWFhZe1lAVY6hHS4bdsIqlF6DH3GlMVx6OM2bHCNZ+PCbIk
        VPX8OKZ+JzV9AFzz/K5K6pbPaomXsjKdfi3HIgQXkKGmuz49xXDHjwvTWWbqxczq+l8l
        ki/RmLxZIrutnOUk2b4hlQjqBzP1SQAP/o/dAkLG3f5WHnEMl5fgi3jGcXoIEyxmeDHI
        Mryw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j9Ic/NBg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 46.2.1 DYNA|AUTH)
        with ESMTPSA id u043b8w33I0VqcB
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Fri, 3 Apr 2020 20:00:31 +0200 (CEST)
Date:   Fri, 3 Apr 2020 20:00:27 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>, agross@kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arch: arm64: dts: apq8016-dbc: Add missing cpu opps
Message-ID: <20200403175934.GA96064@gerhold.net>
References: <1585763459-21484-1-git-send-email-loic.poulain@linaro.org>
 <20200402081349.GA932@gerhold.net>
 <20200403013119.GB20625@builder.lan>
 <20200403100923.GB2652@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200403100923.GB2652@gerhold.net>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Apr 03, 2020 at 12:09:25PM +0200, Stephan Gerhold wrote:
> On Thu, Apr 02, 2020 at 06:31:19PM -0700, Bjorn Andersson wrote:
> > On Thu 02 Apr 01:13 PDT 2020, Stephan Gerhold wrote:
> > 
> > > Hi,
> > > 
> > > On Wed, Apr 01, 2020 at 07:50:59PM +0200, Loic Poulain wrote:
> > > > The highest cpu frequency opps have been dropped because CPR is not
> > > > supported. However, we can simply specify operating voltage so that
> > > > they match the max corner voltages for each freq. With that, we can
> > > > support up to 1.36Ghz. Ideally, msm8916 CPR should be implemented to
> > > > fine tune operating voltages and optimize power consumption.
> > > 
> > > Thanks for the patch! I was wondering how to enable the higher CPU
> > > frequencies for a while now...
> > > 
> > > I was actually quite excited to see CPR being mainlined for QCS404.
> > > If we are trying to add such a workaround (rather than CPR) for MSM8916
> > > now, does that mean it's unlikely to see CPR working for MSM8916
> > > anytime soon?
> > > 
> > > AFAICT, there is a WIP branch from Niklas Cassel here:
> > > https://git.linaro.org/people/nicolas.dechesne/niklas.cassel/kernel.git/log/?h=cpr-msm8916-mainline
> > > but it hasn't been updated for a while. (Not sure if it was working
> > > already...)
> > > 
> > > Can someone explain what is missing to make CPR work for MSM8916?
> > > 
> > 
> > CPR needs to control 3 things; VDD_APC, VDD_MX and MEMACC. On QCS404 it
> > seems we don't have to adjust VDD_MX, so the code for this is missing
> > from the driver.
> > 
> > So, afaict, what's missing is that rpmpd.c needs to gain support for
> > 8916, then the CPR driver needs to gain a cpr_acc_desc and compatible
> > for 8916, it needs to reference the VDDMX power domain and before/after
> > we're adjusting the corner of the CPR we need to adjust the MX according
> > to the mapping specified in the downstream kernel (i.e.  1->4, 2->5 and
> > 3->7).
> > 
> > 
> > Unfortunately, the requirement that VDDMX (VDD_MEM I presume) must be
> > higher than VDD_APC most likely needs to be taken into consideration for
> > Loic's proposed static voltage scaling as well. Unless VDD_MEM is left
> > in Turbo mode from the boot loader I think we need to take VDDMX to
> > corner 7 for speeds 998MHz and above (i.e. where we pull VDD_APC to
> > 1.35V).
> > 
> 
> I see! I wonder how hard it would be to add MSM8916 to rpmpd,
> looking at previous commits it's mainly setting up a few defines?
> 
> If I understand it correctly, the OPPs from rpmpd could then be
> referenced as "required-opps" in the CPU OPP table so that VDD_MX is
> scaled together with the CPU frequency, and doesn't need to stay at
> turbo mode (like in v3 from Loic) the whole time.
> 

I have been thinking about this some more and I think I came up with
some changes that make sense (but not entirely sure).

Based on the available downstream sources I guessed the defines to add
for MSM8916 to the rpmpd driver. Then I added the VDD_MX OPPs as
"required-opps" to the CPU OPP table so it would vote for the appopriate
corners (with the mapping you mentioned above).

I haven't tested it yet, maybe I can get some feedback first if the code
seems reasonable or if I'm missing something obvious? :)

Also: Is there a good way to validate these changes?
I suppose I could check the genpd state but that wouldn't tell me if the
corner was applied correctly. Maybe I can check the actual voltage
through the SPMI interface, hm...

If this seems like a good approach I can split up the changes in
reasonable patches and post it separately. For now the full diff below.

Stephan

 arch/arm64/boot/dts/qcom/msm8916.dtsi  | 65 +++++++++++++++++++++++++++++-----
 drivers/cpufreq/cpufreq-dt-platdev.c   |  1 +
 drivers/cpufreq/qcom-cpufreq-nvmem.c   | 11 ++++++
 drivers/soc/qcom/rpmpd.c               | 21 +++++++++++
 include/dt-bindings/power/qcom-rpmpd.h |  7 ++++
 5 files changed, 96 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index b0a82447976a..5b8fce8609d0 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/thermal/thermal.h>
+#include <dt-bindings/power/qcom-rpmpd.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -108,8 +109,8 @@ CPU0: cpu@0 {
 			cpu-supply = <&pm8916_spmi_s2>;
 			operating-points-v2 = <&cpu_opp_table>;
 			#cooling-cells = <2>;
-			power-domains = <&CPU_PD0>;
-			power-domain-names = "psci";
+			power-domains = <&CPU_PD0>, <&rpmpd MSM8916_VDDMX_AO>;
+			power-domain-names = "psci", "mx";
 		};
 
 		CPU1: cpu@1 {
@@ -122,8 +123,8 @@ CPU1: cpu@1 {
 			cpu-supply = <&pm8916_spmi_s2>;
 			operating-points-v2 = <&cpu_opp_table>;
 			#cooling-cells = <2>;
-			power-domains = <&CPU_PD1>;
-			power-domain-names = "psci";
+			power-domains = <&CPU_PD1>, <&rpmpd MSM8916_VDDMX_AO>;
+			power-domain-names = "psci", "mx";
 		};
 
 		CPU2: cpu@2 {
@@ -136,8 +137,8 @@ CPU2: cpu@2 {
 			cpu-supply = <&pm8916_spmi_s2>;
 			operating-points-v2 = <&cpu_opp_table>;
 			#cooling-cells = <2>;
-			power-domains = <&CPU_PD2>;
-			power-domain-names = "psci";
+			power-domains = <&CPU_PD2>, <&rpmpd MSM8916_VDDMX_AO>;
+			power-domain-names = "psci", "mx";
 		};
 
 		CPU3: cpu@3 {
@@ -150,8 +151,8 @@ CPU3: cpu@3 {
 			cpu-supply = <&pm8916_spmi_s2>;
 			operating-points-v2 = <&cpu_opp_table>;
 			#cooling-cells = <2>;
-			power-domains = <&CPU_PD3>;
-			power-domain-names = "psci";
+			power-domains = <&CPU_PD3>, <&rpmpd MSM8916_VDDMX_AO>;
+			power-domain-names = "psci", "mx";
 		};
 
 		L2_0: l2-cache {
@@ -343,40 +344,52 @@ modem_alert0: trip-point@0 {
 	};
 
 	cpu_opp_table: cpu_opp_table {
-		compatible = "operating-points-v2";
+		/*
+		 * FIXME: The naming here is really weird, since MSM8916 does
+		 * not have kyro. Maybe we should add a more generic compatible?
+		 */
+		compatible = "operating-points-v2-kryo-cpu";
 		opp-shared;
 
 		opp-200000000 {
 			opp-hz = /bits/ 64 <200000000>;
 			opp-microvolt = <1050000>;
+			required-opps = <&rpmpd_opp_svs_soc>;
 		};
 		opp-400000000 {
 			opp-hz = /bits/ 64 <400000000>;
 			opp-microvolt = <1050000>;
+			required-opps = <&rpmpd_opp_svs_soc>;
 		};
 		opp-533330000 {
 			opp-hz = /bits/ 64 <533330000>;
 			opp-microvolt = <1150000>;
+			required-opps = <&rpmpd_opp_nom>;
 		};
 		opp-800000000 {
 			opp-hz = /bits/ 64 <800000000>;
 			opp-microvolt = <1150000>;
+			required-opps = <&rpmpd_opp_nom>;
 		};
 		opp-998400000 {
 			opp-hz = /bits/ 64 <998400000>;
 			opp-microvolt = <1350000>;
+			required-opps = <&rpmpd_opp_super_turbo>;
 		};
 		opp-1094400000 {
 			opp-hz = /bits/ 64 <1094400000>;
 			opp-microvolt = <1350000>;
+			required-opps = <&rpmpd_opp_super_turbo>;
 		};
 		opp-1152000000 {
 			opp-hz = /bits/ 64 <1152000000>;
 			opp-microvolt = <1350000>;
+			required-opps = <&rpmpd_opp_super_turbo>;
 		};
 		opp-1209600000 {
 			opp-hz = /bits/ 64 <1209600000>;
 			opp-microvolt = <1350000>;
+			required-opps = <&rpmpd_opp_super_turbo>;
 		};
 	};
 
@@ -1710,6 +1723,40 @@ rpmcc: qcom,rpmcc {
 					#clock-cells = <1>;
 				};
 
+				rpmpd: power-controller {
+					compatible = "qcom,msm8916-rpmpd";
+					#power-domain-cells = <1>;
+					operating-points-v2 = <&rpmpd_opp_table>;
+
+					rpmpd_opp_table: opp-table {
+						compatible = "operating-points-v2";
+
+						rpmpd_opp_ret: opp1 {
+							opp-level = <1>;
+						};
+
+						rpmpd_opp_svs: opp2 {
+							opp-level = <2>;
+						};
+
+						rpmpd_opp_svs_soc: opp3 {
+							opp-level = <3>;
+						};
+
+						rpmpd_opp_nom: opp4 {
+							opp-level = <4>;
+						};
+
+						rpmpd_opp_turbo: opp5 {
+							opp-level = <5>;
+						};
+
+						rpmpd_opp_super_turbo: opp6 {
+							opp-level = <6>;
+						};
+					};
+				};
+
 				smd_rpm_regulators: pm8916-regulators {
 					compatible = "qcom,rpm-pm8916-regulators";
 
diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index f2ae9cd455c1..b0f6bd0fffc1 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -128,6 +128,7 @@ static const struct of_device_id blacklist[] __initconst = {
 	{ .compatible = "nvidia,tegra210", },
 
 	{ .compatible = "qcom,apq8096", },
+	{ .compatible = "qcom,msm8916", },
 	{ .compatible = "qcom,msm8996", },
 	{ .compatible = "qcom,qcs404", },
 
diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
index f0d2d5035413..c77a30349d08 100644
--- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
+++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
@@ -129,6 +129,16 @@ static const struct qcom_cpufreq_match_data match_data_kryo = {
 	.get_version = qcom_cpufreq_kryo_name_version,
 };
 
+static const char *msm8916_genpd_names[] = { "mx", NULL };
+
+static const struct qcom_cpufreq_match_data match_data_msm8916 = {
+	/*
+	 * FIXME: Might need to implement .get_version here to handle
+	 * different frequencies depending on speedbin/pvs version.
+	 */
+	.genpd_names = msm8916_genpd_names,
+};
+
 static const char *qcs404_genpd_names[] = { "cpr", NULL };
 
 static const struct qcom_cpufreq_match_data match_data_qcs404 = {
@@ -301,6 +311,7 @@ static struct platform_driver qcom_cpufreq_driver = {
 
 static const struct of_device_id qcom_cpufreq_match_list[] __initconst = {
 	{ .compatible = "qcom,apq8096", .data = &match_data_kryo },
+	{ .compatible = "qcom,msm8916", .data = &match_data_msm8916 },
 	{ .compatible = "qcom,msm8996", .data = &match_data_kryo },
 	{ .compatible = "qcom,qcs404", .data = &match_data_qcs404 },
 	{},
diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
index 2b1834c5609a..192ba9099964 100644
--- a/drivers/soc/qcom/rpmpd.c
+++ b/drivers/soc/qcom/rpmpd.c
@@ -115,6 +115,26 @@ struct rpmpd_desc {
 
 static DEFINE_MUTEX(rpmpd_lock);
 
+/* msm8916 RPM Power Domains */
+DEFINE_RPMPD_PAIR(msm8916, vddcx, vddcx_ao, SMPA, CORNER, 1);
+DEFINE_RPMPD_PAIR(msm8916, vddmx, vddmx_ao, LDOA, CORNER, 3);
+
+DEFINE_RPMPD_VFC(msm8916, vddcx_vfc, SMPA, 1);
+
+static struct rpmpd *msm8916_rpmpds[] = {
+	[MSM8916_VDDCX] =	&msm8916_vddcx,
+	[MSM8916_VDDCX_AO] =	&msm8916_vddcx_ao,
+	[MSM8916_VDDCX_VFC] =	&msm8916_vddcx_vfc,
+	[MSM8916_VDDMX] =	&msm8916_vddmx,
+	[MSM8916_VDDMX_AO] =	&msm8916_vddmx_ao,
+};
+
+static const struct rpmpd_desc msm8916_desc = {
+	.rpmpds = msm8916_rpmpds,
+	.num_pds = ARRAY_SIZE(msm8916_rpmpds),
+	.max_state = MAX_8996_RPMPD_STATE,
+};
+
 /* msm8976 RPM Power Domains */
 DEFINE_RPMPD_PAIR(msm8976, vddcx, vddcx_ao, SMPA, LEVEL, 2);
 DEFINE_RPMPD_PAIR(msm8976, vddmx, vddmx_ao, SMPA, LEVEL, 6);
@@ -220,6 +240,7 @@ static const struct rpmpd_desc qcs404_desc = {
 };
 
 static const struct of_device_id rpmpd_match_table[] = {
+	{ .compatible = "qcom,msm8916-rpmpd", .data = &msm8916_desc },
 	{ .compatible = "qcom,msm8976-rpmpd", .data = &msm8976_desc },
 	{ .compatible = "qcom,msm8996-rpmpd", .data = &msm8996_desc },
 	{ .compatible = "qcom,msm8998-rpmpd", .data = &msm8998_desc },
diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index 3f74096d5a7c..70d304a2deae 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -51,6 +51,13 @@
 #define RPMH_REGULATOR_LEVEL_TURBO	384
 #define RPMH_REGULATOR_LEVEL_TURBO_L1	416
 
+/* MSM8916 Power Domain Indexes */
+#define MSM8916_VDDCX		0
+#define MSM8916_VDDCX_AO	1
+#define MSM8916_VDDCX_VFC	2
+#define MSM8916_VDDMX		3
+#define MSM8916_VDDMX_AO	4
+
 /* MSM8976 Power Domain Indexes */
 #define MSM8976_VDDCX		0
 #define MSM8976_VDDCX_AO	1
