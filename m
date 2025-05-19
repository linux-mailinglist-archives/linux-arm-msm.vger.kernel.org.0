Return-Path: <linux-arm-msm+bounces-58440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32588ABBBD8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 13:02:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD2FE7A3C1E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 11:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63F92274657;
	Mon, 19 May 2025 11:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Wlxapirx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECCA274646;
	Mon, 19 May 2025 11:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652488; cv=none; b=j8vzzVMJUEiDnZ6U06U5L/rx/0zKtioqz0YYmGNEUEUHXgvegV8uzWjniZf01o2bvsT2Dsvang4+M2UPvGrqjRckPWF1UW3sicwgdfJWHvcwP5luTYHQ45x1mSujXiVO3mP6fzta6SrQnE6V0tHEowbgkG7EmucWXuKtfPWYqGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652488; c=relaxed/simple;
	bh=IjYVJR6A5AlcSL7/PYDXKuxygN9nfZh0tJvtn3W041E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=chmN0DpiuFNViBp/3WvC+ZkjtgWGbK1f/lUZ9MpFiwHFS6ESsw9KQyQY505WjP2VXy2bkwcjAjYctY2b3SLqlgaVtoCuZuLyF447I+E37sNF+EUaprbrgOkuy5PioHZyxian4IYBwI6iBLiUULqbsq0rqkuIHzVH2QL8zyvYHe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Wlxapirx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9rXeW013665;
	Mon, 19 May 2025 11:01:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Iah9hrJHCDUP0/MtMapsSsmGJYGXI2S0zdY/TE+1Ja0=; b=WlxapirxKStRQ0CU
	Kqi9chzdNSr9JLBeqR9cD0P7G/sZ8NL5xh0ufXX0k+jHSJCaimC1EDp6Bpy7YSXd
	bFEIRD3hn0voIN0/bWu5GxGEOrFLgtbYuGO2Le0au9wsWA3UO3ozmiauWiNLNYFk
	OyQxDIQljz2DcJ3tM1fnRn3Vh8regrw9rD+jhOui5P4tfaNGZUgq8AJ6+HmfprAZ
	KR/pfR/Kp1pzMdESkFcXOwPh7VP0Ug8ynRagQPxjzr2F7wRw9SOq5hPLgNpJ9EAU
	ftladsXeutJNiYqVTT45LGYoSRzxHJVFiKE432K1Aw8xvVa7hZ7TTH4/j58XOmNY
	afPWCg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkym6yn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 May 2025 11:01:06 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54JB15jA000572
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 May 2025 11:01:05 GMT
Received: from [10.204.66.147] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 19 May
 2025 04:00:58 -0700
Message-ID: <38a94e78-9793-455b-a5ab-6283d397b759@quicinc.com>
Date: Mon, 19 May 2025 16:30:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] arm64: dts: qcom: sa8775p: add Display Serial
 Interface device nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ayushi Makhija
	<amakhija@qti.qualcomm.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <robdclark@gmail.com>,
        <sean@poorly.run>, <marijn.suijten@somainline.org>,
        <andersson@kernel.org>, <robh@kernel.org>, <robh+dt@kernel.org>,
        <krzk+dt@kernel.org>, <konradybcio@kernel.org>, <conor+dt@kernel.org>,
        <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
        <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
        <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
        <quic_abhinavk@quicinc.com>, <quic_rajeevny@quicinc.com>,
        <quic_vproddut@quicinc.com>, <quic_jesszhan@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250513102611.1456868-1-amakhija@qti.qualcomm.com>
 <20250513102611.1456868-2-amakhija@qti.qualcomm.com>
 <tjp2pfescczqikbu2tzylx4ecb3n6trixvhbdwbpz6y4jc52wk@fmkdxrelun3i>
Content-Language: en-US
From: Ayushi Makhija <quic_amakhija@quicinc.com>
In-Reply-To: <tjp2pfescczqikbu2tzylx4ecb3n6trixvhbdwbpz6y4jc52wk@fmkdxrelun3i>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8LTf_VQoCDtmaPxjUq9vX-GUUDl8pAb9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfXxqOg2YalcgRH
 TT03EolMFqjqCg1TbA6QU3dsXbkaEyZsaJVH0UjKoeUBX6IVf8aD02hBw5zRPzpR640ETy5Ncu/
 uaa9zekbZgiwtmI3fVlrGggg057QRStP4q/c4Z7Wi7Oc9WiuQRtKIdlOggQa+IfyYYI3Mr+RtaI
 AoU2rh0C5yHKYucKUXVZF7g3+WNwaaP74cVLzZ9x/KRi76P74g1Tox/8keyzItYn+w4JrolTaOz
 yukIdvQjuU3w1Y8HQ0I0MX3s9PljPmylomL2JZeEsFTG2EqTqP7d/UGTidk1TybC4C8lGVpgp9v
 5YnL6jOEHakQcqFHY+SYZJ+d4L4/zWdtuuUNAd5s3IT5E3VKZv7IHuvKn83JXZhte3LUz/j9ns+
 nPlJOuSJGvWh0iHmERQoj9BT0Ucs8HNmpYYnwId0DRkK4PXx1ETAgzGEc2kpnI1uhBU334gb
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=682b0f72 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=h_Z4th-CkySu1llfNFIA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 8LTf_VQoCDtmaPxjUq9vX-GUUDl8pAb9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190104

On 5/19/2025 6:31 AM, Dmitry Baryshkov wrote:
> On Tue, May 13, 2025 at 03:56:10PM +0530, Ayushi Makhija wrote:
>> From: Ayushi Makhija <quic_amakhija@quicinc.com>
>>
>> Add device tree nodes for the DSI0 and DSI1 controllers
>> with their corresponding PHYs found on Qualcomm SA8775P SoC.
>>
>> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
>> Reviewed-by: Dmitry Baryshkov <lumag@kernel.org>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 186 +++++++++++++++++++++++++-
>>  1 file changed, 185 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> index 5bd0c03476b1..f8777f17d24a 100644
>> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> @@ -6,6 +6,7 @@
>>  
>>  #include <dt-bindings/interconnect/qcom,icc.h>
>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
>>  #include <dt-bindings/clock/qcom,rpmh.h>
>>  #include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
>>  #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
>> @@ -4034,6 +4035,22 @@ dpu_intf4_out: endpoint {
>>  							remote-endpoint = <&mdss0_dp1_in>;
>>  						};
>>  					};
>> +
>> +					port@2 {
>> +						reg = <2>;
>> +
>> +						dpu_intf1_out: endpoint {
>> +							remote-endpoint = <&mdss0_dsi0_in>;
>> +						};
>> +					};
>> +
>> +					port@3 {
>> +						reg = <3>;
>> +
>> +						dpu_intf2_out: endpoint {
>> +							remote-endpoint = <&mdss0_dsi1_in>;
>> +						};
>> +					};
>>  				};
>>  
>>  				mdss0_mdp_opp_table: opp-table {
>> @@ -4061,6 +4078,170 @@ opp-650000000 {
>>  				};
>>  			};
>>  
>> +			mdss0_dsi0: dsi@ae94000 {
>> +				compatible = "qcom,sa8775p-dsi-ctrl", "qcom,mdss-dsi-ctrl";
>> +				reg = <0x0 0x0ae94000 0x0 0x400>;
>> +				reg-names = "dsi_ctrl";
>> +
>> +				interrupt-parent = <&mdss0>;
>> +				interrupts = <4>;
>> +
>> +				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_BYTE0_CLK>,
>> +					 <&dispcc0 MDSS_DISP_CC_MDSS_BYTE0_INTF_CLK>,
>> +					 <&dispcc0 MDSS_DISP_CC_MDSS_PCLK0_CLK>,
>> +					 <&dispcc0 MDSS_DISP_CC_MDSS_ESC0_CLK>,
>> +					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
>> +					 <&gcc GCC_DISP_HF_AXI_CLK>;
>> +				clock-names = "byte",
>> +					      "byte_intf",
>> +					      "pixel",
>> +					      "core",
>> +					      "iface",
>> +					      "bus";
>> +				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_BYTE0_CLK_SRC>,
>> +						  <&dispcc0 MDSS_DISP_CC_MDSS_PCLK0_CLK_SRC>;
>> +				assigned-clock-parents = <&mdss0_dsi0_phy DSI_BYTE_PLL_CLK>,
>> +							 <&mdss0_dsi0_phy DSI_PIXEL_PLL_CLK>;
>> +				phys = <&mdss0_dsi0_phy>;
>> +
>> +				operating-points-v2 = <&dsi0_opp_table>;
>> +				power-domains = <&rpmhpd SA8775P_MMCX>;
>> +
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				status = "disabled";
>> +
>> +				ports {
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
>> +
>> +					port@0 {
>> +						reg = <0>;
>> +
>> +						mdss0_dsi0_in: endpoint {
>> +							remote-endpoint = <&dpu_intf1_out>;
>> +						};
>> +					};
>> +
>> +					port@1 {
>> +						reg = <1>;
>> +
>> +						mdss0_dsi0_out: endpoint{ };
>> +					};
>> +				};
>> +
>> +				dsi0_opp_table: opp-table {
> 
> mdss_dsi_opp_table: opp-table {}
> 
>> +					compatible = "operating-points-v2";
>> +
>> +					opp-358000000 {
> 
> Is there only one entry? Usually there are several.
> 

Hi Dmitry,

Thanks, for the review.

In the IP catalog Clock documentation of SA8775P, the same DSI clock frequency (358Mhz)
is mentioned for all the voltage corners (svs_l1, nom, turbo and turbo_l1).
That's why I kept the single entry opp-358000000 for 358Mhz and selected lowest voltage corner svs_l1.
 
I will address rest of the comments in next version of series.

Thanks,
Ayushi

>> +						opp-hz = /bits/ 64 <358000000>;
>> +						required-opps = <&rpmhpd_opp_svs_l1>;
>> +					};
>> +				};
>> +			};
>> +
>> +			mdss0_dsi0_phy: phy@ae94400 {
>> +				compatible = "qcom,sa8775p-dsi-phy-5nm";
>> +				reg = <0x0 0x0ae94400 0x0 0x200>,
>> +				      <0x0 0x0ae94600 0x0 0x280>,
>> +				      <0x0 0x0ae94900 0x0 0x27c>;
>> +				reg-names = "dsi_phy",
>> +					    "dsi_phy_lane",
>> +					    "dsi_pll";
>> +
>> +				#clock-cells = <1>;
>> +				#phy-cells = <0>;
>> +
>> +				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
>> +					 <&rpmhcc RPMH_CXO_CLK>;
>> +				clock-names = "iface", "ref";
>> +
>> +				status = "disabled";
>> +			};
>> +
>> +			mdss0_dsi1: dsi@ae96000 {
>> +				compatible = "qcom,sa8775p-dsi-ctrl", "qcom,mdss-dsi-ctrl";
>> +				reg = <0x0 0x0ae96000 0x0 0x400>;
>> +				reg-names = "dsi_ctrl";
>> +
>> +				interrupt-parent = <&mdss0>;
>> +				interrupts = <5>;
>> +
>> +				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_BYTE1_CLK>,
>> +					 <&dispcc0 MDSS_DISP_CC_MDSS_BYTE1_INTF_CLK>,
>> +					 <&dispcc0 MDSS_DISP_CC_MDSS_PCLK1_CLK>,
>> +					 <&dispcc0 MDSS_DISP_CC_MDSS_ESC1_CLK>,
>> +					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
>> +					 <&gcc GCC_DISP_HF_AXI_CLK>;
>> +				clock-names = "byte",
>> +					      "byte_intf",
>> +					      "pixel",
>> +					      "core",
>> +					      "iface",
>> +					      "bus";
>> +				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_BYTE1_CLK_SRC>,
>> +						  <&dispcc0 MDSS_DISP_CC_MDSS_PCLK1_CLK_SRC>;
>> +				assigned-clock-parents = <&mdss0_dsi1_phy DSI_BYTE_PLL_CLK>,
>> +							 <&mdss0_dsi1_phy DSI_PIXEL_PLL_CLK>;
>> +				phys = <&mdss0_dsi1_phy>;
>> +
>> +				operating-points-v2 = <&dsi1_opp_table>;
>> +				power-domains = <&rpmhpd SA8775P_MMCX>;
>> +
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				status = "disabled";
>> +
>> +				ports {
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
>> +
>> +					port@0 {
>> +						reg = <0>;
>> +
>> +						mdss0_dsi1_in: endpoint {
>> +							remote-endpoint = <&dpu_intf2_out>;
>> +						};
>> +					};
>> +
>> +					port@1 {
>> +						reg = <1>;
>> +
>> +						mdss0_dsi1_out: endpoint { };
>> +					};
>> +				};
>> +
>> +				dsi1_opp_table: opp-table {
> 
> You don't need a second DSI OPP table.
> 
>> +					compatible = "operating-points-v2";
>> +
>> +					opp-358000000 {
>> +						opp-hz = /bits/ 64 <358000000>;
>> +						required-opps = <&rpmhpd_opp_svs_l1>;
>> +					};
>> +				};
>> +			};
>> +
>> +			mdss0_dsi1_phy: phy@ae96400 {
>> +				compatible = "qcom,sa8775p-dsi-phy-5nm";
>> +				reg = <0x0 0x0ae96400 0x0 0x200>,
>> +				      <0x0 0x0ae96600 0x0 0x280>,
>> +				      <0x0 0x0ae96900 0x0 0x27c>;
>> +				reg-names = "dsi_phy",
>> +					    "dsi_phy_lane",
>> +					    "dsi_pll";
>> +
>> +				#clock-cells = <1>;
>> +				#phy-cells = <0>;
>> +
>> +				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
>> +					 <&rpmhcc RPMH_CXO_CLK>;
>> +				clock-names = "iface", "ref";
>> +
>> +				status = "disabled";
>> +			};
>> +
>>  			mdss0_dp0_phy: phy@aec2a00 {
>>  				compatible = "qcom,sa8775p-edp-phy";
>>  
>> @@ -4267,7 +4448,10 @@ dispcc0: clock-controller@af00000 {
>>  				 <&sleep_clk>,
>>  				 <&mdss0_dp0_phy 0>, <&mdss0_dp0_phy 1>,
>>  				 <&mdss0_dp1_phy 0>, <&mdss0_dp1_phy 1>,
>> -				 <0>, <0>, <0>, <0>;
>> +				 <&mdss0_dsi0_phy DSI_BYTE_PLL_CLK>,
>> +				 <&mdss0_dsi0_phy DSI_PIXEL_PLL_CLK>,
>> +				 <&mdss0_dsi1_phy DSI_BYTE_PLL_CLK>,
>> +				 <&mdss0_dsi1_phy DSI_PIXEL_PLL_CLK>;
>>  			power-domains = <&rpmhpd SA8775P_MMCX>;
>>  			#clock-cells = <1>;
>>  			#reset-cells = <1>;
>> -- 
>> 2.34.1
>>
> 


