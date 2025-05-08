Return-Path: <linux-arm-msm+bounces-57296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3604AB00D1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 19:01:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6C183A5D80
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 17:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DA71221294;
	Thu,  8 May 2025 17:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="k6v9v6wV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E6D17A2E2;
	Thu,  8 May 2025 17:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746723681; cv=none; b=mY7LCqpPfZN+85Q8H4oI4RFh5FVvRbIEXaLyIn4OIFpp6aFBSVzq3z8wJqBm16vADj1eKH/sHBwJGC15HdDIA/DxKvy/Tgi6SiL9tMom3yJ45NuyQh61OVNBbNNQzak3J39YxVoxT5rs0O8sq5mSa0cUG75j1FFgcYjQzbDr5Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746723681; c=relaxed/simple;
	bh=5g5sNjmEbICuTiKl8J/PU1T+NoezNWvdYbd2+Uq4lsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FznavX5VdAw4peDeC8XhhrtoE9NLzE3Fm+EAWA6KmaQM7LwtCZvdWR178LN/kjYs6u5P+3IvcOKeuIPC0KNN2/pggrAk8Kl+9Pe8sirllUSNEzwGZfk+ixJqoM5mlDoPrrpBpxZJFluVDV14a7nM6E6GFEPD0XL8A9CVw/uvCfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=k6v9v6wV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548DAEmR002489;
	Thu, 8 May 2025 17:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MX55mfn5ivAMl1yMEqz1iGMbuw3wI94Ny0zOyMZOhIo=; b=k6v9v6wV4odXR9WN
	mPDlasT2QSG50I2NRlN4yEV4XJCReOqMf33mzRZQLmCkpzmtpU9gP2q3Sf8TBAU6
	mIPmKZtWmguJaftk3hGyBgsJ/slNm92lL2gS+2e5fLIn+VuIzWia6uo9rqlU4/TR
	0Fj6XnDpe/UKro/wUbbSAHZqx9yTfRoq25kfqf7cc2ctj8+9dvIIzYh/mCdWZfCi
	e8jnOOudIOax0pFnnOs5htlboneKi0vKJn02KOcVlm1QzEzKPloWlDr5ebOmaAeR
	1jUCEtimLjXXENciLyhIGXLNIiWRfanQeZ9iwZEEGtEG/ylVxIGElmYRHCoqJf9J
	bAv8Jg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp5a0rw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 17:01:11 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 548H1BxE013320
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 May 2025 17:01:11 GMT
Received: from [10.216.33.253] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 8 May 2025
 10:01:06 -0700
Message-ID: <c8097899-42f6-4fa6-bee1-6af9208283d7@quicinc.com>
Date: Thu, 8 May 2025 22:31:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: qcm6490-idp: Add WSA8830
 speakers and WCD9370 headset codec
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@oss.qualcomm.com>, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250429092430.21477-1-quic_pkumpatl@quicinc.com>
 <20250429092430.21477-7-quic_pkumpatl@quicinc.com>
 <7322bb2c-5778-48cd-8661-91308ea8cfc8@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
In-Reply-To: <7322bb2c-5778-48cd-8661-91308ea8cfc8@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=XL0wSRhE c=1 sm=1 tr=0 ts=681ce358 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=P-IC7800AAAA:8
 a=COk6AnOGAAAA:8 a=iqUyA3GN4URQhEV_7bsA:9 a=QEXdDO2ut3YA:10
 a=d3PnA9EDa4IxuAV0gXij:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: kzJXbIsxnCYeLcGUX3cKM0n_Nn9pnWBq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDE0OSBTYWx0ZWRfX7JIL0ILTdcQj
 h7g9qDCI7+amV/C0RC/3iB8ywINwZGH9uc/QUpnKme/Cfq+aHzoqCauqaEFA+cz9Q2kLezRgra1
 2mwAvYG6xN3EWelwj+qyjXYTHk1BzA5e/k4OWMWOBu7HqOV1OxslKq/Hc5+1p9PAU/nchoKJucm
 A3+QSh6ZNYZUqtxPkmHYBC09DLWgyVxSw2L0KEYSTHwZBznAq42WbGk2lrDgU73BcWm9wV6Vdy3
 aVX5y3XOZg2aveqZ/lXPx1BX41jXFcks7Wc+WxrLC66OEYLzxD1BlIb2UxiGhD43MtKVBotoYzo
 t7eSKyGcwmfQSbHKb5z9LBnvVmjZyWxwTrZLfk7A/nvaKX8o540SuNl7dpC76aGm6Awe9ot9iyp
 W+Sr+4kSEDpyHC6ouvH8GAMIUM26q1Clr94auvXhNsrTHYg7oBw74mt5fQzR8fCaMjjKe5rY
X-Proofpoint-ORIG-GUID: kzJXbIsxnCYeLcGUX3cKM0n_Nn9pnWBq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-08_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080149



On 4/29/2025 4:31 PM, Konrad Dybcio wrote:
> On 4/29/25 11:24 AM, Prasad Kumpatla wrote:
>> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>>
>> Add nodes for WSA8830 speakers and WCD9370 headset codec
>> on qcm6490-idp board.
>>
>> Enable lpass macros along with audio support pin controls.
>>
>> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 162 +++++++++++++++++++++++
>>   1 file changed, 162 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
>> index 7a155ef6492e..1a59080cbfaf 100644
>> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
>> @@ -18,6 +18,7 @@
>>   #include "pm7325.dtsi"
>>   #include "pm8350c.dtsi"
>>   #include "pmk8350.dtsi"
>> +#include "qcs6490-audioreach.dtsi"
>>   
>>   /delete-node/ &ipa_fw_mem;
>>   /delete-node/ &rmtfs_mem;
>> @@ -169,6 +170,30 @@
>>   		regulator-min-microvolt = <3700000>;
>>   		regulator-max-microvolt = <3700000>;
>>   	};
>> +
>> +	wcd9370: audio-codec-0 {
>> +		compatible = "qcom,wcd9370-codec";
>> +
>> +		pinctrl-0 = <&wcd_reset_n>;
>> +		pinctrl-1 = <&wcd_reset_n_sleep>;
>> +		pinctrl-names = "default", "sleep";
> 
> Does audio work for you? For inexplicable reasons, it didn't for me
> on rb2 when the sleep state was defined
> 
For Qcm6490-IDP board Audio is working fine, Not sure about rb2, Could 
you please provide more details about rb2 ?>> +
>> +		reset-gpios = <&tlmm 83 GPIO_ACTIVE_HIGH>;
>> +
>> +		vdd-buck-supply = <&vreg_l17b_1p7>;
>> +		vdd-rxtx-supply = <&vreg_l18b_1p8>;
>> +		vdd-px-supply = <&vreg_l18b_1p8>;
>> +		vdd-mic-bias-supply = <&vreg_bob_3p296>;
>> +
>> +		qcom,micbias1-microvolt = <1800000>;
>> +		qcom,micbias2-microvolt = <1800000>;
>> +		qcom,micbias3-microvolt = <1800000>;
>> +
>> +		qcom,rx-device = <&wcd937x_rx>;
>> +		qcom,tx-device = <&wcd937x_tx>;
>> +
>> +		#sound-dai-cells = <1>;
>> +	};
>>   };
>>   
>>   &apps_rsc {
>> @@ -536,6 +561,76 @@
>>   	firmware-name = "qcom/qcm6490/a660_zap.mbn";
>>   };
>>   
>> +&lpass_dmic01_clk {
>> +	drive-strength = <8>;
>> +	bias-disable;
>> +};
>> +
>> +&lpass_dmic01_data {
>> +	bias-pull-down;
> 
> As a testament to these definitions belonging in the soc dtsi, you
> added them in the file you included already.
> 
> [...]
Ack, Will move to soc dtsi file.>
>>   &tlmm {
>>   	gpio-reserved-ranges = <32 2>, /* ADSP */
>>   			       <48 4>; /* NFC */
>> @@ -725,6 +868,25 @@
>>   		function = "gpio";
>>   		bias-pull-up;
>>   	};
>> +
>> +	sw_ctrl: sw-ctrl-state {
>> +		pins = "gpio86";
>> +		function = "gpio";
>> +		bias-pull-down;
>> +	};
> 
> Again, unused
Ack>
>> +
>> +	wcd_reset_n: wcd-reset-n-state {
>> +		pins = "gpio83";
>> +		function = "gpio";
>> +		drive-strength = <8>;
> 
> Since the definition is otherwise identical to the sleep state,
> you should define the (other) bias type that should be set when
> active.
> 
Taken the reference from sc7280, which is working fine.
Link for reference : 
https://elixir.bootlin.com/linux/v6.15-rc5/source/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi#L841

Will cross check and modify if required.

Thanks,
Prasad> Konrad
>   > +	};
>> +
>> +	wcd_reset_n_sleep: wcd-reset-n-sleep-state {
>> +		pins = "gpio83";
>> +		function = "gpio";
>> +		drive-strength = <8>;
>> +		bias-disable;
>> +	};
>>   };
>>   
>>   &uart5 {


