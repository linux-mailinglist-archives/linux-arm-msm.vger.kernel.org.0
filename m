Return-Path: <linux-arm-msm+bounces-103470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6A9XBkHF4WkmyAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 07:29:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6906E41719D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 07:29:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4BF28304A6EA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 05:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EA0536492A;
	Fri, 17 Apr 2026 05:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sber4iGJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O8n7NT3D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8FF3624B2
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 05:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776403653; cv=none; b=pw9LMm3IZ9+2xgh4Qs7kB25qV5iliOIrfhjPBqGoADQYxRrraYzxTA7UElJunqwVSMSgy97EvfegawNLsOpeZgwlGv4PbLPpwzLBLOZtT482iyFCAgwnM6XUK/9WP7OmO0tUJLuHhg0qMx8/umuYI5cfL4mCftQSAmSym2CZrwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776403653; c=relaxed/simple;
	bh=sQPJITnR9Z5bXhAk0RqJv/sWN1Hn17ijSRTOEukN5yk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZlXGUeZJEMsNwIgZqacUJDUMxl11x1Ipbcu77VQZndrXIR9Ts4mK67EXqLts8CuW/JI0CdCYYfLoL0z1m+Q1W3nBqDJiev5jEnhiOorU1D6CRRvPzwWKlTZni6ELThprCoV24c7Pn+gM+Jg2GxsEz60FajQFWm+L19mWrE50ss4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sber4iGJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O8n7NT3D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H18DJ8667679
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 05:27:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PbQedCTMon0+ok3F72vFycxrfJmoF2dQzAk6fHch7uE=; b=Sber4iGJ/CjVKzEU
	lS+qmhjlPsh1R1DNND2++f/cBYipwmZcl0hjTEaYAQcWV3p3E3oVAb2ivEAP9xUF
	J6lEvHMKPv9E+x4ZCUR34mE3/EEZfdwMQmnPkBEsarLb8Z4jsWGvRE885zbFW3rg
	e5nXsG9ILUgYN7ynyx4+TLgrsChzmhbjlKvn1kWBkPExB+d6A7Eooxn2pqQk8n8W
	e9GYMgwEyT5i0m1Kkbg+eYXt7cwPsCNVcijwZUvWJYEfD7UpiArPbU5T05hxa79l
	Ckd5JwylGHdCfaJ+s0EGa5eg0k+e5VhjIEJavFaVaGNdh/O3P6qWmmAnkTu4VTMH
	cBUrBw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkaxcrmau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 05:27:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35da1c703d1so438853a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 22:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776403650; x=1777008450; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PbQedCTMon0+ok3F72vFycxrfJmoF2dQzAk6fHch7uE=;
        b=O8n7NT3DHsmILnZEQI/KC/68WD3GStbCeYLwkO9SgID9H+slQKTKUks5Pj/xQL852S
         8JGxkrqh0+vQIJ9VBcijeNCc8yabGkn1/Aaxd7vAnbtPOqIAH2ToVDCfmX7+eXIsl44c
         3gyC7kBV8FmP5rzwGquM6+Y1rUhg1VSA561PsZkBLWFnPQVIw5YHGfjTV1YJeBi+XEWI
         4hpVkW3bKk7tn2DdazWMZTij5qA1r5/uqHCu4EAVW+DBZtdXEbmtIFuDDeg5Sfhfd1I+
         pPa4u4dZlSMSD+nhmFUZEOWWfa5ODJhMZCIXJCcPp/WwhVcVf4oDdtjF1EOyBpyHPXo9
         KazQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776403650; x=1777008450;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PbQedCTMon0+ok3F72vFycxrfJmoF2dQzAk6fHch7uE=;
        b=i3uxJn+6Y+TDO8TOkoIYIevReg+9kZSipUPupuIZI7UqziccJIJs9bsXs3m46vo/f4
         4jpfOA6EiM/kYUwC5DPer2rnsTrim00tbPuWXaKAsQLYxSejYsK5Y5HeWdJrdwTRPlRH
         jT9nusDDm3nBE/xHWiIJ26q2ink687Y4SqKGexYCY621uCY2gPVkYYdzod0E5T7WuTch
         r2GLtFfXFaok8Dwa76DzjN4VuNZ4Ggc+adcpScrMyC70iRO6hsXnUbCfxPBi3qeKhSAi
         hlBCNFDY9Ypo0N8vNnA1ImS5x3+lYzl5nm/j/UHLdw4Ztklq0bbuZTVMCPb4QdfwDs68
         w94A==
X-Gm-Message-State: AOJu0YyFzLKfdr7BjgAzYlw4jOlBiHMxkscyGSy8WZmZ0lqipwBCPtlM
	OEmdJg+vIaCUIIrV0KIwziZ1DvfCnm/x7jh4Fc0Av3cjXtAdq4wd0CtVsCIn4UX+5GWRy3nik7J
	jjMFZte4hopVR9UQ4CtG1zu+PW2q44aRss88fVlwjPVK4AqEXwVMT9KbpJEovoRA9xQjn
X-Gm-Gg: AeBDiesyIlydUBxF1DzClw3AN7vtwGD4Sm2DgDKRpcjhkrnWRjQIO3yHoSC18jDVO2A
	5NQ9+4Vvsc0AepfvY06PleqXuuI0tjYPRdVKqKHH6HCm08NQJKL+AOC53ws8uXDBHxATOObf1eG
	4k3eTOsaQ0cmD9lq7w+oO2YdmfqDaxW2GjAOrHoxbPnWg/LgZTjy3SxzuYOSzwizlgOYY6C78c4
	CCFSx6RbfEdrrV1aCTzCbeZ9drCBY7BX0YMS23E9Wm/o8A8UOAdCx3FWVmRgs5eC/vuweaxEC7V
	OGYx8a6zwe+m28579CP7N5kNHXhfAFQTpaXX0dG7yWqkuM5dhD36Ap87PFNRJGbI1egH/mTeXJ7
	dwmoN9sFJaBh8AfRQlxMAoZiom9z8oo6EGPMMShwVrBrrRuDofavkU1hL2SCEhN2j
X-Received: by 2002:a17:90a:ec8b:b0:35e:5b19:234d with SMTP id 98e67ed59e1d1-361403f0aefmr1476925a91.7.1776403650101;
        Thu, 16 Apr 2026 22:27:30 -0700 (PDT)
X-Received: by 2002:a17:90a:ec8b:b0:35e:5b19:234d with SMTP id 98e67ed59e1d1-361403f0aefmr1476902a91.7.1776403649639;
        Thu, 16 Apr 2026 22:27:29 -0700 (PDT)
Received: from [10.217.217.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3613fabeccesm341061a91.6.2026.04.16.22.27.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 22:27:29 -0700 (PDT)
Message-ID: <c7cd7cf8-6f2b-4db8-a51a-04e7aad07863@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 10:57:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: hamoa-pmics: define VADC for
 pmk8550
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Tobias Heider <tobias.heider@canonical.com>,
        Val Packett <val@packett.cool>
References: <20260404-dell-xps-9345-ec-v2-0-c977c3caa81f@vinarskis.com>
 <20260404-dell-xps-9345-ec-v2-3-c977c3caa81f@vinarskis.com>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20260404-dell-xps-9345-ec-v2-3-c977c3caa81f@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JcqMa0KV c=1 sm=1 tr=0 ts=69e1c4c3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=I76Qk8w-AAAA:8 a=n3mQhmZCFyheae90VUUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA1MSBTYWx0ZWRfXywbImt7g7/Zl
 m+tcYFgmHanC/zSCkngdxOKXOGiyrG2HvXSzXyc/UjHs8j25UEmzBjFs5E1JUMPJxJMr5WQDYRU
 1RljnJz1w5qoQZWUuI44d9sulOevf6N4TPe9sPzLS2lA1RA/iSklO1PO9XK/wU5NLHEjPxhYrjC
 2jawNdPLpCJ8dU4i5kzCxeWXR1CxGqPX8MdFw8wNT3dd4QVf/NUsSbLMn6FbLvbBZ2rlDRr1W+A
 AvpI1oqLMWUgvaDDqh7X67Kjbr8dnO5YegInPMD65Waow1ooDFqjyRyp+oKaCsfu6cVy0N1SVwF
 M6xm4vH/CTBXV+07ca/XW5yWjhqLo8ypFecIvxAYAzlD8gzX/RkY/o0VvgaXNgeb1Au0+WWkju3
 UId13cIwood8sD+Wocd0nG60JrCkq9NkC8x6quzzE08AFcGisjuTDH3I749xbeVj0LlQ0PK2KDU
 vLWWPR/jQU92W3MDXxA==
X-Proofpoint-GUID: sr0hEEQAgsl_xh6Ni8KU9dg-QtXAskCv
X-Proofpoint-ORIG-GUID: sr0hEEQAgsl_xh6Ni8KU9dg-QtXAskCv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170051
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103470-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.35.40:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.23.212:email,qualcomm.com:dkim,vinarskis.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.44:email,0.0.0.3:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6906E41719D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/4/2026 6:25 PM, Aleksandrs Vinarskis wrote:
> Follow pattern of pmk8350 to add missing pmk8550 VADC to hamoa.
> Register address of 0x9000 matches example schema for spmi-adc5-gen3.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
> index 6a31a0adf8be472badea502a916cdbc9477e9f2b..cc69d299bc356d90aa1483f347f5eee43b853e45 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
> @@ -218,6 +218,32 @@ pon_resin: resin {
>  			};
>  		};
>  
> +		pmk8550_vadc: adc@9000 {
> +			compatible = "qcom,spmi-adc5-gen3";
> +			reg = <0x9000>, <0x9100>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			interrupts = <0x0 0x90 0x1 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x91 0x1 IRQ_TYPE_EDGE_RISING>;
> +			#io-channel-cells = <1>;
> +			#thermal-sensor-cells = <1>;
> +
> +			channel@3 {
> +				reg = <0x3>;
> +				label = "pmk8550_die_temp";
> +				qcom,pre-scaling = <1 1>;
> +			};
> +
> +			channel@44 {
> +				reg = <0x44>;
> +				label = "pmk8550_xo_therm";
> +				qcom,pre-scaling = <1 1>;
> +				qcom,ratiometric;
> +				qcom,hw-settle-time = <200>;
> +				qcom,adc-tm;

There's a small problem here - if you add the "qcom,adc-tm" property
under any channels, the auxiliary TM driver will be loaded to handle
this functionality and it will attempt to register such channels as
thermal devices. Since there is no thermal-zone node added for this
channel, you will get an error from here.

If you intend this channel to be used for ADC_TM functionality, a
thermal zone node for this channel has to be added. If this functionality
is not needed, it's better to remove the "qcom,adc-tm" property.

Thanks,
Jishnu

> +			};
> +		};
> +
>  		pmk8550_rtc: rtc@6100 {
>  			compatible = "qcom,pmk8350-rtc";
>  			reg = <0x6100>, <0x6200>;
> 


