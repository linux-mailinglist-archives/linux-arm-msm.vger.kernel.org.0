Return-Path: <linux-arm-msm+bounces-91632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIwILTq+gWm7JAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 10:22:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE87D6BCD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 10:22:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DF0A1300981B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 09:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86CC4396D19;
	Tue,  3 Feb 2026 09:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QMMteIUE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ntys7MDY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB023396D27
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 09:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770110502; cv=none; b=p9Xc+JaXs8cxqeyva0lvQNGf0nCIEgi5EWmj1+AP04n9jH2HmSX5AG1j70OsomXjayu9OfhSfx3Y4uFcaFBdvuukzwRfJsXE8W1ABHztD8XV+BVMfKGl6SsusBClXAEUWN+h++Rzf4ANLZ1mYJbz4VJxrofBvwdYUE/VBv7niq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770110502; c=relaxed/simple;
	bh=QbVYNk8ieZxDeZlQka9Svgis9VIJkaJ986RjTtdzstY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WkUE6yW998SGos/NVE4wLl/G025oYtlLkGDRlOpFSx3qzCYWcCYAI5RfhLr9hx7/eiGdE7dVgNPmo6yCz6n1zc92PlJi2u0iXM+btN41v1EGqOva5YZP7GgT3ybM7SOKt29wEKELAyz86lX+Gu88gA8KoVZIa/+3KBA+x8NLtsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QMMteIUE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ntys7MDY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6134PQDt092047
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 09:21:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IHm4dM0QI2K14G4EL0BsDWSd1o09XdFREKzlzEhP/VE=; b=QMMteIUEXlNIrjZo
	xiigf7grTLTI5fxPRfMeZnZvvIbOEeR6ekEmMawxR4dscTk+2yLI+rmqs3Rc/8Nv
	kXcYtVVWYfOXlv8lUh4V1bEukNTlDEpFXCIJ6gXvDPtY8zBIS8OPIJZEJgesPO1i
	1TweAWSAz5TMSbWEDMDzfEWB5Z7I6UaF0/u62Wzl5wpzt3N23FgI4yQHduHGrAOp
	iaqQysABezez/ii0tzJL6Lq+9VpDnWq4eMpOkboEQMGdzZpVnDng582J0BNiTtvR
	tDJj6vdlRg7cGYErySKiMaoZSeNfY7TU+etntI6GdXqHxu5YKbK+WoJnkj3X0aSK
	aBFHzg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2trbkp0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 09:21:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70c91c8b0so151983285a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 01:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770110499; x=1770715299; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IHm4dM0QI2K14G4EL0BsDWSd1o09XdFREKzlzEhP/VE=;
        b=Ntys7MDYGDcncuYDAtOOQ1mWnIdYg33ghQmHqXDtBh2Y61mpVah1gT1U9dqeaXUBXm
         0KcCvpfoHfRCkIQYiWzMLZu7C4tPu/jX4QhmZ6GQcSy8kOOt2/w1B5KXe3n6GEczhcyI
         nAVsMqb6KxIWAg3xAFwPZ8AiN9A3lSfc+pxmFQDRNIBO7wJAHELx3+U0pElgZwVYDJO1
         PzsFUdhbXpUSf8sK+jAec5q3dVH6aESYlRuwq72BkY+QCqc9CbSBNMqbiOmYugWUnzR9
         TvBLZOfyKZIyFit3Srm4oYoo0KMhxp0pNMcUnmhZFnrX/Srt9030QNrbi0McXiKRe0ty
         mVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770110499; x=1770715299;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IHm4dM0QI2K14G4EL0BsDWSd1o09XdFREKzlzEhP/VE=;
        b=o33wRzq/b5G2vbqHhxBLGXgMS3GWx8Pg7c1yFV4yAXw23JnT509ZM626ZS92hn4lRN
         sbKMTA3kUnLbHnbXi2bpcFKmWKlRG187q3N1x7EmzOk0O+jdH5P/KYeWLazr3w5inguo
         OrBiVa6S0P2ANH9PqOLxb3u1nCK0K+gSBSUCFsS0szUdrIho18fUP5VDo0sJ1eAfZ+Mk
         tiaGUtRv5tVerd+7OZZ/UCeppcDB5f9z9tn4dyiAz/PolfOJTUrt5Atz86x66l/jRygF
         ECOphklrrwRS8NnEEZ3Z6+wbILC3FcKg01IjcoPGf8CbzvF2x17ZC/V7gGkMCC+x/1q+
         Yhsg==
X-Gm-Message-State: AOJu0Yy8LJJYlyNzDnwHDnB9FwEWupG2+uFkoRWUIjHfUUFgLmExoK5z
	jH7DZz9fEleEgpPmjWxhZSxGisf0Xd83kV1oJllwDxto4eJ5HHuLSS/tqMdFcUO+CAV5rc59zTQ
	dEyaXkDO7zAq0s5YRIuOrDKT7gebE0ONQCYlTQYacSWGutYfD58TzjyQaNlCDDLT/Ik5v
X-Gm-Gg: AZuq6aJOmxhqdQYcmoCVRAjawyT1rnVqGwReLKXyU2Y4uX2SJj1VacEcOe+TJZmQPZr
	Xr6aj0vqE+39fmAMatG6dx+MCssEULrcbJ388OjWpW2qg3hONdegXKjJfs27fiMcUQJNDIivrZo
	FURlM1OBLiQjwxRc4DYljrH3SD1c0Z3ZOme6NH7Vr9uOp81+IsKoEGrjR8XHAqUkeGDdinWOhiN
	Ma9qeGrGjgR4mZyU3NkK7i2rzvemTNd5OjlJ9aPMfY224uZUg/99/AdRaSI+pxsLZzk4auxvmpC
	szEm72JTsHZyxz2Q5wxByufeX7CGGI7g4id3h8PCCqFcWLGwNdN7wEA428dU4M8GtDm0sTpv11h
	4qqpCQttEFh+mGSbZqjnj9WCSHgT1v8+tWkotKLqMeU2DOXsu7oOEXLLaNdY44cInqAw=
X-Received: by 2002:a05:620a:1908:b0:8c7:17af:7ae with SMTP id af79cd13be357-8c9eb2f98acmr1359477985a.7.1770110499050;
        Tue, 03 Feb 2026 01:21:39 -0800 (PST)
X-Received: by 2002:a05:620a:1908:b0:8c7:17af:7ae with SMTP id af79cd13be357-8c9eb2f98acmr1359476385a.7.1770110498410;
        Tue, 03 Feb 2026 01:21:38 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbefc655csm986203666b.19.2026.02.03.01.21.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 01:21:37 -0800 (PST)
Message-ID: <91e91f5e-93af-466b-92f7-b2e88dc8d73f@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 10:21:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add second TC9563 PCIe switch node for
 PCIe1
To: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260203-industrial-mezzanine-pcie-v2-0-8579ed6bf931@oss.qualcomm.com>
 <20260203-industrial-mezzanine-pcie-v2-2-8579ed6bf931@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260203-industrial-mezzanine-pcie-v2-2-8579ed6bf931@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -R9qko-5Vpq_vFeFiIRtxgCrKe_LyoB7
X-Authority-Analysis: v=2.4 cv=dcmNHHXe c=1 sm=1 tr=0 ts=6981be23 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9kIy5wuRr3uUqB62-wcA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: -R9qko-5Vpq_vFeFiIRtxgCrKe_LyoB7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA3MyBTYWx0ZWRfXy8SBAiVsndWp
 0/1PkkYdpCY+0oO1u0Gtzwv3oVUOsI//2mQmo+kxAj6u9atSVReGMQ/F6qpNVBPGavpQuS/pM77
 N+DK7CUGD29X+7HGKD+sdXVkQh56488zrLQRpNQgrH/UcGe17fJbVDTirOt3VJKVrCDiJtKZHIu
 RkTJ35zAbHMBdlzgdVLX9W64kc2VqrooodpQqWvIUaqJb6bRo+GNwcnwFXQXnOuwmogxg/RpGlF
 +xnucd8tKj0bANZAdNFMj//EfxiZqyQNM64XtnGf0joirf1QcRkNf0flWsjX79sePWIJ6u+F0rB
 zSv81Cr4b6ZwGm1eZyIjJLq+hzWRxQXwwkxP1liKa0t9hfg2kgIeWPafSB1+ibmeVIeYMPego/X
 o+UGUVLjf/FdwvsrREG/9uPlwNs6D4f5+zjRF2vBMVoEWsT90Dzmc8nTcc4x4GDlWhC7BpixvLj
 jqN4E1CdCLTipyjMncg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_02,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030073
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.3:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.0.0.2:email,0.0.0.0:email,0.0.0.1:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91632-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1CE87D6BCD
X-Rspamd-Action: no action

On 2/3/26 5:31 AM, Sushrut Shree Trivedi wrote:
> Add a node for the second TC9563 PCIe switch on PCIe1, which is connected
> in cascade to the first TC9563 switch via the former's downstream port.
> 
> Two embedded Ethernet devices are present on one of the downstream
> ports of this second switch as well. All the ports present in the
> node represent the downstream ports and embedded endpoints.
> 
> The second TC9563 is powered up via the same LDO regulators as the first
> one, and these can be controlled via two GPIOs, which are already present
> as fixed regulators. This TC9563 can also be configured through I2C.
> 
> Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
> ---
>  .../qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso | 96 ++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       | 12 +--
>  2 files changed, 102 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> index 89bbcab0908d..1744c9c8bd50 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> @@ -146,6 +146,91 @@ pcie0_switch0_eth1: pci@0,1 {
>  	};
>  };
>  
> +&pcie1 {
> +	iommu-map = <0x0 &apps_smmu 0x1c80 0x1>,
> +		<0x100 &apps_smmu 0x1c81 0x1>,

Please set your tab width to 8 and align the '<'s

[...]

> +&pcie1_switch0_dsp1 {
> +	pcie1_switch1_usp: pcie@0,0 {

This label is unused

[...]

> +		pcie1_switch1_dsp1: pcie@1,0 {
> +			reg = <0x40800 0x0 0x0 0x0 0x0>;
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +
> +			device_type = "pci";
> +			ranges;
> +		};
> +
> +		pcie1_switch1_dsp2: pcie@2,0 {
> +			reg = <0x41000 0x0 0x0 0x0 0x0>;
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +
> +			device_type = "pci";
> +			ranges;
> +		};
> +
> +	        pcie1_switch1_dsp3: pcie@3,0 {

And so are all three of these

> +			reg = <0x41800 0x0 0x0 0x0 0x0>;
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			device_type = "pci";
> +			ranges;
> +
> +			pcie1_switch1_eth0: pci@0,0 {
> +				#address-cells = <3>;
> +				#size-cells = <2>;
> +				device_type = "pci";
> +				ranges;
> +			};
> +
> +			pcie1_switch1_eth1: pci@0,1 {

These two are unused as well

[...]

> +		pcie1_switch0_dsp1: pcie@1,0 {

This one is in use

>  			reg = <0x20800 0x0 0x0 0x0 0x0>;
>  			#address-cells = <3>;
>  			#size-cells = <2>;
> @@ -862,7 +862,7 @@ pcie@1,0 {
>  			bus-range = <0x3 0xff>;
>  		};
>  
> -		pcie@2,0 {
> +		pcie1_switch0_dsp2: pcie@2,0 {
>  			reg = <0x21000 0x0 0x0 0x0 0x0>;
>  			#address-cells = <3>;
>  			#size-cells = <2>;
> @@ -872,7 +872,7 @@ pcie@2,0 {
>  			bus-range = <0x4 0xff>;
>  		};
>  
> -		pcie@3,0 {
> +		pcie1_switch0_dsp3: pcie@3,0 {

But these two aren't. Plus the DSP3 seems to be hardwired to eth
so it seems like that won't ever change. DSP2 will understandably
be useful, since any derivative of this mezz could attach more
devices



>  			reg = <0x21800 0x0 0x0 0x0 0x0>;
>  			#address-cells = <3>;
>  			#size-cells = <2>;
> @@ -880,7 +880,7 @@ pcie@3,0 {
>  			ranges;
>  			bus-range = <0x5 0xff>;
>  
> -			pci@0,0 {
> +			pcie1_switch0_eth0: pci@0,0 {
>  				reg = <0x50000 0x0 0x0 0x0 0x0>;
>  				#address-cells = <3>;
>  				#size-cells = <2>;
> @@ -888,7 +888,7 @@ pci@0,0 {
>  				ranges;
>  			};
>  
> -			pci@0,1 {
> +			pcie1_switch0_eth1: pci@0,1 {

These two are again unused

Konrad

