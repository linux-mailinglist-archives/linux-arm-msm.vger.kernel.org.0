Return-Path: <linux-arm-msm+bounces-89809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIEUIcpScWkKCQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 23:27:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE235EC8F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 23:27:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4DF7A5E5ADD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 10:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73ECF3ECBD1;
	Tue, 20 Jan 2026 10:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b0+hYcV7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L8o0hKI9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906883ECBF9
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 10:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768906784; cv=none; b=BQRQO5Tx02hKXwtn9OMIIw7sYjuSw0jx5JR833huhYG/E1r+TVUt630DnSyvVxBZpJ3PixaNUkNFoqTQfhBytQWWh/pU416Tb/L8Ch8jnAtO0sc3skoZdBEAIo0DNMHPlpMzAOnumjB+/3DateJyOzmMoJqOILch42JoJ2c6rq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768906784; c=relaxed/simple;
	bh=QFcWsuGU1XbJEMhdiMHYLDk6GYsh6udTdZlWowBZQ58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ANMjZR0blxvIBI9W98rRnJRjwDeoUPPltf8uoikw8vNDwzXwLMVnMwiwcSa40flAGaUWg9P6REw7A5m0LKsgxQ9b2ncoaXKUn47TlDPcVszjjLeeKzLFXgtExWb2uiJIKjXNUv/30slt5hTF15/1lmPoA3EASnv76zKW8zuR/HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b0+hYcV7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L8o0hKI9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KAHuEm3805356
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 10:59:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cGaJ88H80cfxfBrRL86RdWbbJjprUh8y72Uii+8lJUc=; b=b0+hYcV7JzSjnOWA
	j2oD1VGcGn12iSCT/YlGWaVEdWdBOXpJlWVo0sjjKGthKswNbYZFbhUZoydkj1R5
	XQQFvFmDCjKtshw8UxShzGnbM0aYHJEOGOScSyNU+8O5jaClOIZ53RaXaXNhcbhy
	KOAShZxO8TrYpKsVI+MPPhNJ68GkL5AvV71trRoGk8O51apEWtuakT0SOlYvMlv0
	EzQYDa8dxWDTvrSj1b/WzLYlJxm0Vte8m8IjocZslTbSbjUqrPcMJG58K3tNMbR6
	BaKYhbzCXILYS8negaDJ6yC3PSt0YRz/rmg6gTTC0b0VYUFQiPrtZwjVwy538ELf
	AnAEEQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt1f89aq6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 10:59:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c523d611ffso46704585a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 02:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768906779; x=1769511579; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cGaJ88H80cfxfBrRL86RdWbbJjprUh8y72Uii+8lJUc=;
        b=L8o0hKI9NSOAY8UHUEynaC3FbM7YGbHa24EFZSHLs5cU3jUYeTIWBKVZziStbSpvNc
         ab3gVc2Yf5R0tioUKeNKA7bTkWF3Rvf8lYkxrSi9O9upoOBypkgw27Akq8QIn0MU4psK
         /23lTV8xAfjuwH++hYP5etUeXYxzWHVHDiMORWzIfIZuEc8bKiv8JP+f1piIqYw8bFnJ
         4sYmDokUDWeLmrtJJz/O8uzfDKTU1mBScRBGSRIw7FfJpuzkUJSF5AeUUO9Bt4uCMsN3
         HE4Pp0oRBrpslWopEte1YpZ8p7110YbFnCUeIk9Neks24k8L4r6hanuhpXCo/KC+wS50
         iz3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768906779; x=1769511579;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cGaJ88H80cfxfBrRL86RdWbbJjprUh8y72Uii+8lJUc=;
        b=w9ezfa68+rQD++Y/dI3mtXvHK2tZev0uAuc2nLB0CSq/OCr97mUsdEkUGGnCfEXIiq
         i5RvLiEXi1qlVRxVPxx3kKEXbdzICLofW2oTfzHlLx6BNaBPZu0w4A0KLyjQhD96agyB
         Ti+tjNx5uA/8rokrwf4Ue/pJvMuc0cg8FBFUQGgMNXer+Sceb/rlXiTNn/s+7WD/BGTf
         8FeN4u9m5NTNrdLmfLzVnAc+abVyDjlvuXzuaDVxNLdbmesmY2U+AGSbdqYOoMfy5sdi
         +g875mb5jnvzVbBvwmqlm5d6DDrnEe/3SlJsTRrfCiW5BG3x6rdroFlCU1oceWsikyqu
         t8XA==
X-Forwarded-Encrypted: i=1; AJvYcCW7WP1i0vY2sEMPTCKwbv11hO75jaUMdaL4V7/BqIPiue+Qmu1oT4wg2IPJqrGievkiysPvUOE7AfjtQQdi@vger.kernel.org
X-Gm-Message-State: AOJu0YxK6ZsHO1/BVTC3/9ZXtr+XLR2bWOwrFRkKJei8stqn1z1wgT6/
	UGSuUqSCQqnLdn1wAkBrAWfvMzAguDfD0FaPiISuPPQ3wwWmBsj9n1Pr7S/wDTKAPtwOTijdF1u
	MnEvl5ChHHpxbvXe7UCD9SisoDL7Yaue2akV0bTtz2OLPVHmF2v9elp3YTnrnzYDJsoWp
X-Gm-Gg: AY/fxX7p9NGdL4YTx+NFXt2jnuaLRNKhEO0FVtvuZ4oSdO56AYukXmm1TASNpOBLmNP
	xw5kvDSFU6v1cLhSLsVK+TpL/ahLaJ2UPZT45kmgaK2D1Y5Fw/uR69Py9VUDyWH7XUZ3JGVBo0Q
	AI8rrRKbBw3cD2mj/wCW6n/wje2yzc/kSShE8S+KA2cGzX8OpPinPPRwbdAMX1/TG3CZCSOnEl0
	VV82n2EmzvirjOgkRnDHVzj8Gsc7nevuDE1lbTZjRD8nNYZz2ErOntIPrbvGaBH2Iyws673/cUe
	nsDdU89tiOwZI6r8Py65PAdAHJlXHncBZ6X20xJuHFoEGA6gUtp8SvyZaOPcLwuxns1Klnfdp+V
	Gh3xhPbSEuLNWhrfTePG/GFwK+NJdWBjNLTU/u7d85SsC3eulsy1W8VEIx0HcXgbze7w=
X-Received: by 2002:a05:620a:4085:b0:8b2:5af3:7fce with SMTP id af79cd13be357-8c6a678d49cmr1456058085a.7.1768906779236;
        Tue, 20 Jan 2026 02:59:39 -0800 (PST)
X-Received: by 2002:a05:620a:4085:b0:8b2:5af3:7fce with SMTP id af79cd13be357-8c6a678d49cmr1456055585a.7.1768906778763;
        Tue, 20 Jan 2026 02:59:38 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959fc273sm1345590366b.54.2026.01.20.02.59.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 02:59:38 -0800 (PST)
Message-ID: <8f7d6dca-d594-413c-81a9-bf51e0d8fdc0@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 11:59:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: milos: Add CCI busses
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260116-milos-cci-v1-0-28e01128da9c@fairphone.com>
 <20260116-milos-cci-v1-3-28e01128da9c@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260116-milos-cci-v1-3-28e01128da9c@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA5MSBTYWx0ZWRfX+lpxWgM7fjK7
 6DxLWY1+Sh6dZ6B2f80Tw6fxI4APB38J7cUSPvW0aLLtytB8mKwmehWckPqAjs/JlNulqRlrwdW
 SJCdqLpmTWhztlOAoiY3IbMNwGepg+xWZP3qfAYhi6mCjL62Hd0jI9QhW8USL470vvtg1Lvygfc
 k3j4T7/A2eS/+E1ch0xJAxwDmokPoo+0MRI/wW/ieyC3j9nr1A004KHxynoQjDC4abq/jjEWuGK
 zut+YA0StgIpBDrjcxejcYStVHlkf9aKjN9tXbS4pd+hZnF5U6OA1jaJPrhUZMoJU/fTUAH4Uyi
 STIrTaqsEjl2IRerpTQEskN8PEV+USsGbZ5H8Wc0esW8Bs9ijLIZq6gQu0MtmdzkSPE1ykm2LzO
 I3hjLaD/HB+RzAV4pICvugB4CTVnjI3Qk2vF2aSe4dMMvyzfjA2mYhZqlU69RKwZ0mbGfFZWdjn
 RikvDLOSwrlYtDQI83Q==
X-Proofpoint-GUID: 7rCwnG11jgT0TlXQgtd9E84yX55m4ChU
X-Proofpoint-ORIG-GUID: 7rCwnG11jgT0TlXQgtd9E84yX55m4ChU
X-Authority-Analysis: v=2.4 cv=LdQxKzfi c=1 sm=1 tr=0 ts=696f601c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=KdqX6l0VmMaWkiEhp-gA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200091
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DATE_IN_PAST(1.00)[35];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-89809-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[f100000:email,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,fairphone.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EEE235EC8F
X-Rspamd-Action: no action

On 1/16/26 2:38 PM, Luca Weiss wrote:
> Add the nodes and the pinctrl for the CCI I2C busses on the Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 194 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 194 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
> index 58b4c2966df1..c8771beffa9b 100644
> --- a/arch/arm64/boot/dts/qcom/milos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
> @@ -1652,6 +1652,72 @@ videocc: clock-controller@aaf0000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		cci0: cci@ac15000 {
> +			compatible = "qcom,milos-cci", "qcom,msm8996-cci";
> +			reg = <0x0 0x0ac15000 0x0 0x1000>;
> +			interrupts = <GIC_SPI 426 IRQ_TYPE_EDGE_RISING 0>;
> +			power-domains = <&camcc CAM_CC_CAMSS_TOP_GDSC>;
> +			clocks = <&camcc CAM_CC_SOC_AHB_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_0_CLK>;
> +			clock-names = "soc_ahb",
> +				      "cpas_ahb",
> +				      "cci";
> +			pinctrl-0 = <&cci0_0_default &cci0_1_default>;
> +			pinctrl-1 = <&cci0_0_sleep &cci0_1_sleep>;
> +			pinctrl-names = "default", "sleep";
> +			status = "disabled";

With the pins moving to the child nodes, we may as well move the
disablement there, peeking at the code, I think it should handle it
well

[...]

>  		camcc: clock-controller@adb0000 {
>  			compatible = "qcom,milos-camcc";
>  			reg = <0x0 0x0adb0000 0x0 0x40000>;
> @@ -1791,6 +1857,134 @@ tlmm: pinctrl@f100000 {
>  
>  			wakeup-parent = <&pdc>;
>  
> +			cci0_0_default: cci0-0-default-state {
> +				sda-pins {
> +					pins = "gpio88";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-up = <2200>;
> +				};

It would be fantastic if the GPIOs remained sorted by the GPIO num

Konrad

