Return-Path: <linux-arm-msm+bounces-92565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IC/0L7MJjGn/fAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 05:46:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BBF1213ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 05:46:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6B4F430131E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 04:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB260346FA1;
	Wed, 11 Feb 2026 04:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mHb6FPtb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Izh9ZWn9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5436826059D
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 04:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770785198; cv=none; b=sq/ro2mTBU/v4tVjr+4Qu/XhiA9NnRnEfLXnI4L4W24J7C2HWWUKO6XZ4W41XAe2QP2qI7OTNAIu8eWFk0AOMgiSjQTCLpS125g9pr2H+35ob00PBLsDCyrSIHJ7StEj/AwjSFyLEUDpVx7ctomcEtewCPjvQKwQeWfhXmTjLvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770785198; c=relaxed/simple;
	bh=kWMCs8+srR7SkQIJklQj6U9T3w0o+P3u+mBrDWyWwKY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NDD3RSg/BYlRz/R23wX+zX80Pb5yv/ZAg6ES0Pdls+AQuvHf/MmoF3FJqjLbnS0NrV19ZHTvXmxdRWhj739klJQoAA6mZMhcHxdeMF78eTWOsB5Q6r7P54gbhb7Nefot/uBrlC+KWi7wc8BY5D7tJpRoBtw9JsL9w6BBLqWlB80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mHb6FPtb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Izh9ZWn9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61AMbkqF3919347
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 04:46:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mKLRl72Myq4avuA/EeMiT9OHKtbeC3tXWGoz2xCUjqs=; b=mHb6FPtbgR96Vcqe
	cs3CoSOqBQS6w6MSlv0MCclddwwtThUWnEiVqJ4Uw/mTQjngnaAI1pmcv+EXNM3j
	+MffTax5xtqn8oFIdLK7a19uL457+NcsZ0RQplU6UOfRW3t9IOMxlv9Q/UPOJwJj
	FqCKp/Pg69PVYngds1h+4dlsPhoQjMf1/YoRPrP3QCaztAUdpwerzkJMlYgObUpO
	ENVPscHC1+2r3Ie5K52luzZ8pBbDECrdc6UaMNVC+vnPMYsRnaTjJd3zaK1Kg0lX
	I0yeZ2vc8bLMLB0/GPaF01KmB4kyC06A/WrWtOCexdW79EQ5Y9vgKgxVw+eC/pvZ
	62bC8w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c86akjhg1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 04:46:36 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aad3f8367bso41431475ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 20:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770785195; x=1771389995; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mKLRl72Myq4avuA/EeMiT9OHKtbeC3tXWGoz2xCUjqs=;
        b=Izh9ZWn9DDYFGO/Wl2Isk3SWN7bDkUSkU6M0RxTUXsRit9w1WwGhXosp+x5t6AGsBs
         UcUlOoCj+T2WFAZeA3ttftTt/oiUPTvH1pVLOPGROivHUfqY2yucqwzTksyMPtvULn2I
         xMWZJ8ykQ5rFS77lbk0vpLLnNSgvAiK1bPIJseqdCvwKuOqrPA1IZS89NHEgx7svVDtg
         BRg364j96TNrNGmgQhXLNabS775Hx5SUZk5pzdf9ib5yKbhNBTlct65xr/XVMp7Cjuv9
         2bHFy8WksuzXDJCht2wlN719JDHaTzUedqgbCEU+/9F82UifVlQ9K3WYCYE1N9LHKF2n
         u0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770785195; x=1771389995;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mKLRl72Myq4avuA/EeMiT9OHKtbeC3tXWGoz2xCUjqs=;
        b=TlbzxBuT/Zr/JNvGXYfoe03il64Kx7RrBJe9nxqH9EWHh2AP/BV8EgM3tncLu6DQx5
         HzhQMtC/q/LpquRG0mfCZ3H45EwQraVj1xbibm5znnHePulle7sfZR2S+8BHzMwHNzUx
         EuvkgHYIF70OORkBNOXUxZSI+hFGPWtcM0Z+K9NJ2lClMbIfvhE8dJCdoXs2hfVVTfKL
         RB71lOeWm94gHob3r1QKnyEVIlYSwN4xovuqzS4sUB05bHMwsq9qm4TWZPI+3q8RwwKX
         wI/icKV9JR0f927z/BXBFN8FLz6Pg3vLKBYb01BWbrQdB1YMHth8hKj3f6MaunBrRPzh
         xM7A==
X-Forwarded-Encrypted: i=1; AJvYcCVnQwVod26F1qeHulpenJ3jY0xqEh9DrizNlnfVh2ItnSfwa0kS1Cd1OTu6MR2fWmaWH0wwlfLpyj3+IJHe@vger.kernel.org
X-Gm-Message-State: AOJu0YyYSeF5mz5fsqh9noc/XCcm0cK9fZpe1fjrxwmZX8cVqVuCjG9/
	l6zAcZH4As7rJ2qaOdUl/WtG2SNqayKznlZiKO8qcGBaadvIcxefpBJYdBVoGS/WObOrMb4Upxg
	YZEW4DqdPrGOaTLRHoz8kl7rtgLvuDYS5I5pKUHtZGdMODgGi2ydRnHdbOXDkY9EpX1E0
X-Gm-Gg: AZuq6aKLWL6/kHKZj++0DSpHdZ/nwyzsBeLBdZ+OkjMVTVsFjtJaM9Tp+Pol6AhTmni
	0IQO9+AEHxkBMBkH3cUvbef2dFipY4lfLEY8jrv0SgRugilbszDc4makiTzhp+Dj1jAdJkvKseG
	7U8ZDGCWZFfMplug+4g/lUx1kF5Fu+weOVGbdLZGgwS881KUGx95gR/xL0OlDzwqGLFapUx04yw
	nqnLuVb8fL0ebHSx6wtO4U5PBG/0Y5XQM5ADB1PPAEFtQl8+GnPSwHretTKojOzOwM+YIs3UuMn
	1taZlMM+MhAWDR3ktbyeJ/15s7hQ28BtujTctvUwuuhTdgr2igzoGjBP84HXnBAnTy2bfzxyKxq
	gdYWMBx1zBJPVtrd0QF6qxKdlPG8lN/Ja24OLsqHS5FmET3fJYL0=
X-Received: by 2002:a17:903:2a90:b0:2a0:c1ca:20f7 with SMTP id d9443c01a7336-2ab275f1b56mr15352325ad.15.1770785195142;
        Tue, 10 Feb 2026 20:46:35 -0800 (PST)
X-Received: by 2002:a17:903:2a90:b0:2a0:c1ca:20f7 with SMTP id d9443c01a7336-2ab275f1b56mr15351985ad.15.1770785194561;
        Tue, 10 Feb 2026 20:46:34 -0800 (PST)
Received: from [10.217.219.187] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e197d61a0sm626729a12.19.2026.02.10.20.46.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 20:46:33 -0800 (PST)
Message-ID: <ad294a50-027f-4caa-a9b4-e145f709b50a@oss.qualcomm.com>
Date: Wed, 11 Feb 2026 10:16:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Enable USB2 controller
 Micro-USB OTG
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260210143931.3324647-1-akash.kumar@oss.qualcomm.com>
 <y32g3rpgfjtr6qyic6goj24uw24tucdsenninqqok3r5ofahj2@7cxcwf4cn6cc>
Content-Language: en-US
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
In-Reply-To: <y32g3rpgfjtr6qyic6goj24uw24tucdsenninqqok3r5ofahj2@7cxcwf4cn6cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HI7O14tv c=1 sm=1 tr=0 ts=698c09ac cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=aB85t684Z1S4vwK0cisA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: xmUM4b-jFcLqSzv4QJXUyFehWM-ZvPiW
X-Proofpoint-ORIG-GUID: xmUM4b-jFcLqSzv4QJXUyFehWM-ZvPiW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDAzNiBTYWx0ZWRfX71vrJojZW8jA
 lcZTpjLgaRXgVK8N+Q6ehVvrHq+ZKiIcTfU+Pmoudc/oq4y1KuPnFllgV3lyxCeuOi1fr4gcecw
 XNJs8in3O8p2Phfvq/1tcxtBFa3cWK/Oofl5E/wuhczk3maBFz9l1xgJHHLu8g3AWe8X+0ubaiT
 /fPi+IDcySt2R/cFAp1SlaG/l+85m6T5M3ugR4AVUfsMQlBv2B6mVRLlwMDmqdctNojvHEbNs6t
 2sOSLpbwY5p6SA10q18/pH8qiODknoUI5y/D/P+iB3plSaxQqOyBnhJUJJjOK5fp0ClP9J0zUQs
 fPdCIEXRrnjlLYQEI8zEVhwhQitdpWHeeA3jbMSD9ta0eyHc+Yv6MMLt7SsCmP4+6qGgdcLh94W
 QNahQqHfN1EtRlpVGg0hUtHA5OcDvRc/LtWdfB78/YUyd68uczqX6pTniN9lRZKX90z4z3TJTKw
 t/YgBYDfwApQTB0ut2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110036
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92565-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.0.0.0:email,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akash.kumar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E3BBF1213ED
X-Rspamd-Action: no action

Hi,

On 2/11/2026 2:45 AM, Dmitry Baryshkov wrote:
> On Tue, Feb 10, 2026 at 08:09:26PM +0530, Akash Kumar wrote:
>> Enable the secondary USB controller (USB2) and its High-Speed PHY to
>> support OTG functionality via a Micro-USB connector.
>>
>> Define a dedicated 'usb2-connector' node using the 'gpio-usb-b-connector'
>> compatible to handle ID and VBUS detection. Link this connector to the
>> DWC3 controller via OF graph ports to satisfy schema requirements and
>> enable role switching.
>>
>> Specific hardware configuration:
>> - ID pin: TLMM 61
>> - VBUS detection: PM7325 GPIO 9
>> - VBUS supply: Fixed regulator controlled by TLMM 63
>> - Configure &usb_2 in OTG mode with role switching enabled.
>> - Define a gpio-usb-b-connector node for Micro-USB support, mapping the
>>   ID pin to TLMM 61 and VBUS detection to PM7325 GPIO 9.
>> - Add the 'vdd_micro_usb_vbus' fixed regulator (controlled by TLMM 63) to
>>   supply VBUS to the connector.
>> - Add the 'usb2_id_detect' pinctrl state to configure GPIO 61 for ID
>>   detection.
>> - Enable &usb_2_hsphy and populate necessary voltage supplies (VDDA PLL,
>>   VDDA 1.8V, VDDA 3.3V).
>>
>> Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 68 ++++++++++++++++++++
>>  1 file changed, 68 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> index f29a352b0288..ee472d8b2db1 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> @@ -217,6 +217,16 @@ pmic_glink_sbu_in: endpoint {
>>  		};
>>  	};
>>  
>> +	vdd_micro_usb_vbus: regulator-micro-usb-vbus {
>> +	       compatible = "regulator-fixed";
>> +	       regulator-name = "MICRO_USB_VBUS";
>> +	       gpio = <&tlmm 63 GPIO_ACTIVE_HIGH>;
>> +	       regulator-min-microvolt = <5000000>;
>> +	       regulator-max-microvolt = <5000000>;
>> +	       regulator-boot-on;
>> +	       enable-active-high;
>> +	};
>> +
>>  	vph_pwr: regulator-vph-pwr {
>>  		compatible = "regulator-fixed";
>>  		regulator-name = "vph_pwr";
>> @@ -262,6 +272,30 @@ active-config0 {
>>  		};
>>  	};
>>  
>> +	usb2-connector {
>> +		compatible = "gpio-usb-b-connector",
>> +			     "usb-b-connector";
>> +		label = "micro-USB";
>> +		type = "micro";
>> +		id-gpios = <&tlmm 61 GPIO_ACTIVE_HIGH>;
>> +		vbus-gpios = <&pm7325_gpios 9 GPIO_ACTIVE_HIGH>;
>> +		vbus-supply = <&vdd_micro_usb_vbus>;
>> +		pinctrl-0 = <&usb2_id_detect>;
>> +		pinctrl-names = "default";
>> +
>> +		ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			port@0 {
>> +				reg = <0>;
>> +				usb2_connector_ep: endpoint {
>> +					remote-endpoint = <&usb2_controller_ep>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +
>>  	wcn6750-pmu {
>>  		compatible = "qcom,wcn6750-pmu";
>>  		pinctrl-0 = <&bt_en>;
>> @@ -606,6 +640,7 @@ vreg_bob_3p296: bob {
>>  			regulator-max-microvolt = <3960000>;
>>  		};
>>  	};
>> +
> Stray empty line
will remove.
>>  };
>>  
>>  &gcc {
>> @@ -1137,6 +1172,12 @@ qup_uart7_sleep_tx: qup-uart7-sleep-tx-state {
>>  		 */
>>  		bias-pull-up;
>>  	};
>> +
>> +	usb2_id_detect: usb2-id-detect-state {
>> +		pins = "gpio61";
>> +		function = "gpio";
>> +		bias-pull-up;
>> +	};
>>  };
>>  
>>  &uart5 {
>> @@ -1200,6 +1241,33 @@ &usb_1_qmpphy {
>>  	status = "okay";
>>  };
>>  
>> +&usb_2 {
>> +	dr_mode = "otg";
> This is default and can be dropped
Sure.
>> +	usb-role-switch;
> THis should be moved to the kodiak.dtsi.
Kodiak.dtsi already has this property, so will remove from here.
>> +
>> +	status = "okay";
>> +
>> +	ports {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		port@0 {
>> +			reg = <0>;
>> +			usb2_controller_ep: endpoint {
>> +				remote-endpoint = <&usb2_connector_ep>;
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&usb_2_hsphy {
>> +	vdda-pll-supply = <&vreg_l10c_0p88>;
>> +	vdda18-supply = <&vreg_l1c_1p8>;
>> +	vdda33-supply = <&vreg_l2b_3p072>;
>> +
>> +	status = "okay";
>> +};
>> +
>>  &usb_dp_qmpphy_out {
>>  	remote-endpoint = <&redriver_phy_con_ss>;
>>  };
>> -- 
>> 2.43.0
>>
Thanks for review.

Will send v2 with these minor fixes.

Regards,
Akash.

