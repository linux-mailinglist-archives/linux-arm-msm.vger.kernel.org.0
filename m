Return-Path: <linux-arm-msm+bounces-95005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOanBzy7pWnNFQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 17:30:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0661DCD48
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 17:30:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8344D3083DED
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 16:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 436543002DC;
	Mon,  2 Mar 2026 16:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N4Z9U6Pn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IWGpTkY8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57786337BB8
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 16:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772468353; cv=none; b=h1ootqEOf0CY3gEWSLf4xwDO3jocxs6idMyXE3jEDD9IAEGTaZBB+AL95jQpGwTypdd4MQI4D+s9waLcI8qfCtlHoVFB/g0j8L0nmZ0ml6n2ldS5FDXna4uvzjIsZNg0Fq+PE1v4eChmGBl8kzAleiu6VYe1YRrc5hqrL+4ieD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772468353; c=relaxed/simple;
	bh=sYvyd0Zm5Ga2JIOjj5miURFzXTnvIdotwsCvsCSNo8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JuHk77vfHs5MN3oljHQcIr0EJoSLU3pwIuPGiB6ykRKsX9Ml5zVY65o7GP1a0PpWJIEZTQ2tZPExj2HDhYQZRnQTjD8p/LO3n6FZz4kmrjZXlY5KC2+t627HF7/II6f2wB1uLohciYFv6+U1iRg6745PWXHoRUtgvIEGVHulHL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N4Z9U6Pn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IWGpTkY8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622ElpPl2048865
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 16:19:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vhjju8BOnGn4NgWCoflGT14vT5s6pSmdtD5C3RVGsmI=; b=N4Z9U6PnJAiI+Oc4
	Cr1dp0Twmmqj2RQn7Ja6QIgvgMnaM7cCtExRrbjIMbBQoOWHieUFJJOGdXvtUJD6
	Xx8hRmOvawnN30Wty/0IZpaajVBdc0TGDoagW9pXCcPJ8xGZpsR3iSSrf/HuvgGP
	eBK7DdF8LbFJDGQFjPf9o3Q7riwPac7uhu2vQns4UMTjJ9pgtLcCdawYYF+R5N9q
	13d7eRK+yZ+kKG4II9b62zlv89BNXCYMhWDJCWgDswz37VvcsKTEOaFFE64kBlri
	jGHUvA324UiEYZl2fSkHsH/c11+4nchSiFWFNk2U0MnLA9kaGrtAOKiCBZ2EZ322
	STYfBg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cncmfrd5r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 16:19:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70cb31bcdso427191485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 08:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772468347; x=1773073147; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vhjju8BOnGn4NgWCoflGT14vT5s6pSmdtD5C3RVGsmI=;
        b=IWGpTkY8r0Xxd8wieMvwQrOrMXhVzlavSkj3D3fVzeum8m8RM66awRlXCRzaIslQWF
         g/aOWGgcQ4TTL2h1tFe5UdQJ9aAbBI39U752wwRRt1+tO1InU1hE0eqr2e4rURX3rMag
         fBGnUdL6gOV1r+Gptwm1L+KAe9IjOwwL3dZkn5s8QV7tuYRIRD9h2kV3yhrCtO96Y4F/
         DIxL9mig1ZoU9DD1JfiQlMoKUQn01w1ABGJAhn3gO2Lv2Mcs9uR6JObNCpFIhd9BnY7/
         H93Szhc59AlDlA+LH98auzk+FsGnan+hfIMUC3ygxSG9eT9e97BzIjTTknGcF5aZOlvR
         aMBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772468347; x=1773073147;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vhjju8BOnGn4NgWCoflGT14vT5s6pSmdtD5C3RVGsmI=;
        b=HbX62AIp7eAo0XsrCOd6ix0PrfXoAQoRr/JgkfpUC8OYdVtDytt8opH/VWZ7ew3l2g
         yEry3TDGYZoTlQqgLcb4iwug17ZGgGUorsp+T+SiBDcN747GIOmRvfZtnjkyG3Ow2ceq
         QdXVzaifItt40GRnPsph3ks09H/9/HTHpXDoEkljWwiZl9mPw1qfy2/l3dp8JQthLUYe
         1P2GZje8TkiKaVA1VAhnWnjSoug1TMrmjywCE9TQpeeXL9BKK5YQ8B35f29bCynp1lE0
         fGRCuda3Kjqf2a+g/tOHzCwZ2yzaMkRoM6SVCTCihUgUpZAaIM7urcbLo6ci+vK05tsI
         Fudw==
X-Gm-Message-State: AOJu0YxK7y1GokxTd/tgF1h6uP8eYDpf1TOa1e0dD4j4PjIAG1gw3Slt
	xl9HGCXLvsdUjdjPV+QwM2PiiRQJna9YPsc5fhdwXVrW/FZVuuSmNizhcdbQkqMQhpBQDpp23Mv
	nN/Q0x6aGxIT1p1TZbhc7msSousFOt+ap0a/hC7qtFNIr1MxV32c6CodAzMV8/3Vqxzbx
X-Gm-Gg: ATEYQzzZupGxjrc6VSKwdohlNPtr25IomKiGz93qGtzi2SB23p1GndJIvPzEbM7sFMK
	au0g+CPZBVuLObR3nVHEBzueSyrLaOlYAVo+YkMelK/XYPOHZeR4ewemr5IiGfJ73Gas1TqFvj9
	QCRQ+35rzeWjD+x42g+BrzN2ITC/ROkB0THalTEywY3nxUTnTiz6q9pDhKCaw+6MUId5msydrqO
	1ksbnoNGN2Lig1SJWKbPX87V7j9lNzHX369DGriOrUyi0EQHjnL8UpIDJ0J88MryPNsx9gzpc+x
	1G94FI8uxlvb/mtiKPnIn9pXsNDzD9l3BYnK0QKDqVw1yWqPWdymyfIRuEqScCQbwnrFukdGDVC
	WwXcBghP9UrPWNELe65mcQQzGH2mOFd9PuoW+fHusft1AkS1O9EcbBu2fV7uRqdHkoa1v0UVnLi
	GsPxk=
X-Received: by 2002:a05:620a:d8a:b0:8b2:e177:fb18 with SMTP id af79cd13be357-8cbc8f5c8afmr1174065385a.9.1772468347113;
        Mon, 02 Mar 2026 08:19:07 -0800 (PST)
X-Received: by 2002:a05:620a:d8a:b0:8b2:e177:fb18 with SMTP id af79cd13be357-8cbc8f5c8afmr1174060985a.9.1772468346539;
        Mon, 02 Mar 2026 08:19:06 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabd36224sm3743718a12.7.2026.03.02.08.19.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 08:19:05 -0800 (PST)
Message-ID: <4fab8e64-8251-4424-974c-19434ee04c76@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 17:19:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/18] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-8-95517393bcb2@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-8-95517393bcb2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Br+QAIX5 c=1 sm=1 tr=0 ts=69a5b87b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=72T5t8mROkFztkF13RwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: gf8m_1-jIhzTwCVgYFc9aHCXK2urZIhV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEzNSBTYWx0ZWRfX4f4v7TnKbxl+
 HczIOfyyo0BWTheNB/Q2qAdqxOqxc0GGTzqa6ZI14HgahfsY70oVEKC+3myT8xfGfWuOKeuytq3
 izmw2ZQFXd3ctU3iT5rK9vcNaCCPAt8u8NUCuKXQUUf2a9ipyKPeRpQS526lEyP4ZPVFCWODUiF
 u2Mp4VriGNuQX1ZvcjfalEMG+QGtoJlE025po8CIVBbfh7IabZHRLjsTxAJ3Q82Ce+9tz4yJzwG
 lXfo5hNu7B0hZVKufccCPQ7n9ClNksEKH15PTpHKm3jx5vO1qEbyV5DSMPgvvNwXtfCQ9B2pLAX
 zZJwfDWgp83JqtChB1xXKhpO5B3zlFouJODv6e37buIdrBO6rGaTBsi+nCZBiqdwDzLSiCzKRj1
 zXb6fZj+9HBbxYSB2XXdJcALb0I6nSZ0n5PawCRmDo9OmdzrgQx8suYvhRqLwwCxVcs36F+ruYM
 zKOHLcOzRN1Uh8WjorQ==
X-Proofpoint-GUID: gf8m_1-jIhzTwCVgYFc9aHCXK2urZIhV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020135
X-Rspamd-Queue-Id: 7C0661DCD48
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95005-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,aaf0000:email,ade0000:email,linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,baylibre.com,gmail.com,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 2/25/26 4:11 PM, Bryan O'Donoghue wrote:
> Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
> of previous CAMCC blocks with the exception of having two required
> power-domains not just one.
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index db65c392e6189..f96411f481305 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -6,6 +6,7 @@
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
>  #include <dt-bindings/clock/qcom,sm8450-videocc.h>
> +#include <dt-bindings/clock/qcom,x1e80100-camcc.h>
>  #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
>  #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
>  #include <dt-bindings/clock/qcom,x1e80100-gpucc.h>
> @@ -5464,6 +5465,23 @@ videocc: clock-controller@aaf0000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +
> +		camcc: clock-controller@ade0000 {
> +			compatible = "qcom,x1e80100-camcc";
> +			reg = <0 0x0ade0000 0 0x20000>;
> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
> +				 <&bi_tcxo_div2>,
> +				 <&bi_tcxo_ao_div2>,
> +				 <&sleep_clk>;
> +			power-domains = <&rpmhpd RPMHPD_MXC>,
> +					<&rpmhpd RPMHPD_MMCX>;
> +			required-opps = <&rpmhpd_opp_low_svs>,
> +					<&rpmhpd_opp_low_svs>;

Taniya, in light of the recent discoveries on other platforms, does x1
need a performance vote on MXA here?

Konrad

