Return-Path: <linux-arm-msm+bounces-92472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPY9AXgEi2kMPQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 11:12:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CCB1197D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 11:12:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7037030474E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC800346A1D;
	Tue, 10 Feb 2026 10:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cHMMe5qk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cPQoS5/1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A810B342C8E
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 10:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770718047; cv=none; b=YMPf5bzpQTr60ZKKI57CJa38esSXvTvogugXIuDWXO785Pf8c0aqVYqJU7RYD4SYxmOKB+5jTCrt2mXFKM4Rr5oZNjdwsOc1YiywWdvHEY6h7M2Pv4ZSu47GRqNWqKX34Gtu6xCyu8SzYHwweq4kpEAiTyv1cvFMNXzNyLhPt6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770718047; c=relaxed/simple;
	bh=Sp5g7iczPQSO2eEmLtQowStHzo4+oOtdjTtRhLFcO6w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fpRoP9ukM02AD6xOvSe4n8oCKjS+NPoyI/Mrp77VgcZ6YwjagscoyJaPWZwnBAfSg9e5KZXQhm8Vuzkprvm32+MdfRxlrZp9Cmh3DiTYjEDqOnpR75zvVOUtfYKz+DYI9Zn2G4aCG/NnB08vEWB8cw0gWUE1GEgyTsaRL3VHI40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cHMMe5qk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cPQoS5/1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A54C5S802038
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 10:07:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t1MyP1WlhF/FuRwsNjhGxpgHK8XMkJMZf+LQu7a5qZY=; b=cHMMe5qk6s3hS0F+
	xGvrqut1bpvhv7/1UPL+5pZ0kz1+hjrrS4lLXKc2kRV/So7sBEuDewXVGMlWIpDS
	yRhupQ3tugmcPccpn0dEDV95WOOF1rYeH2uW4bY640FnjIfGp4Gz7QVFg6bQWlz8
	6PUfAZp3RIypklsvStoiCet+b61bY2GbgLJ+9a/9Qc6Hs3v98OHNzxkauSwXNJkR
	6wLipPYilIJDqj4ZTIyelNLoGeF7V9M9l/0zcqBoqhA5lUhUGNsEmlSGAyQIvwg0
	hWa9pcAmYCG7V90nqioXvvPnXKSN0AKNYrknYt7/OruiGg1z1ND53DmjGE9gCtIO
	ygIUVw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7x6u108a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 10:07:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c536c9d2f7so194473885a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 02:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770718045; x=1771322845; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t1MyP1WlhF/FuRwsNjhGxpgHK8XMkJMZf+LQu7a5qZY=;
        b=cPQoS5/1e0rrEPg4crOEuelCBPSswbftLq5aXVWSpb7uOFZMZhtvROOAlkUqJir1OK
         tVLFH8chW52R5RoT88JUKG1Zpt6pCuq83lZzNYXO44O0gRslCKxsMu6Sb1CmMLnwCI40
         YmZbU1pCSEn+HmCiPSqpzoeYDpkxiF0W3JWtaJEtQWteTkYdzJORKbykCApyt8Yc71we
         tkMWN/nD550gl1mmYjlLH/PlS9CGyjSEeOJ4deBCr4+ZJPa9TqsHm99mKSADF0vcru9E
         SV4W7/Mg+H71GGtmeMidPvQbXwvLWw5ycx6bFXIGG+g0zQgrizXwyjmfg3Le/ZxwYVu3
         HzpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770718045; x=1771322845;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t1MyP1WlhF/FuRwsNjhGxpgHK8XMkJMZf+LQu7a5qZY=;
        b=HavAX52DDRPGcJR6twf/+R0FF+kl6TeuzSJHUbYbR4qak/cmarjNGL0kweStc5OZQV
         U6G5Glx2eE1cds4KlpYJfOofk6SJADf8l8yOuUi7/EORRWC5dAGfWaMs2ndmLTDJ6AZy
         sGD+FEX62TVHNmRY3XApnjGRz8k3r7G4ngyBLiS4JKk6h6ksdtUjRUolvWL4tCa+Fjjw
         E256LwC65wbHLwbRQiewpswbkAepHe/U4GM9/YF5G+mh17RwEcKYOXaNsaIIMBwwdkn5
         wxw8tetdHyheNdyNtGV9Ju9qex6oSZVJJ4ZED1/b0S5epJBq60MTLIqxlGjvJ4iocOI8
         tFnw==
X-Gm-Message-State: AOJu0YzcdUS7y1hBoXgPf5wJ4J6789hHxFkcyz6TDRL8aBvsqlPeFd0u
	Ga0B2NXVbW8Zbq0ByAZLtABD3id1sLaHVDM9BN9t+Zn8TWKkgP4ghMJS7UYmob4l5ugRSZJl7Do
	I9oNcef8KfcCL5dcM3y/rjwPPiSsVku2ZyJ0bewLYeMFQGt8+OMoXg2kvMs+qyTVLai802bTizl
	rx
X-Gm-Gg: AZuq6aLDgtLFpOkRsNG+xVZyGEG1+YBnYkQlubRyHp/0PfC+R8pOO+00K7VPPhSDngr
	wCv+W3M6LTKFpCsiSzmHwFxrRogwvTnVoKtcXnw+cP5eIp5UMl2YaKVXkTHEtM4q6GsUdChIXT6
	BnUDl5o6K44AkHqdutiVHAmGt4Qgj8xGS46I53pFUmjBPoGI6VjLvzNU+fqfm/oTmGa7KiEhJMQ
	7tEeKuaC7qiY5ISli3A6SruXnK7j1w7vkFgV6kigSdxn6bPHHZWVM3y9MfnD5XAlo62tHEoxXVM
	2pJPCfhwxBsRbj28jnfbWRiUJqoXaIzQyBYJOamYlCR/noVepqJqGOfPh25jE3684rEUnJ9VqiA
	wJnqQ4VYh7HgyZicE0/P5Pjxzn2eaQo9yqb7TmLzZbCbWqBh29wXWToHsOtBoWSiAP7kC/26HYY
	OHfCA=
X-Received: by 2002:a05:620a:4727:b0:8b2:df32:b900 with SMTP id af79cd13be357-8cb1feecfe0mr113645685a.4.1770718044957;
        Tue, 10 Feb 2026 02:07:24 -0800 (PST)
X-Received: by 2002:a05:620a:4727:b0:8b2:df32:b900 with SMTP id af79cd13be357-8cb1feecfe0mr113642985a.4.1770718044454;
        Tue, 10 Feb 2026 02:07:24 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8edacf1532sm501908266b.55.2026.02.10.02.07.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 02:07:23 -0800 (PST)
Message-ID: <230d5d49-b86e-4696-937a-a6faaa9e45e0@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 11:07:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: arduino-imola: add support for sound
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, lee@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alexey.klimov@linaro.org,
        r.mereu@arduino.cc
References: <20260209142428.214428-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260209142428.214428-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260209142428.214428-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: apBdm0fo36SXljT-bUs1S6si6c_WQ83Q
X-Proofpoint-ORIG-GUID: apBdm0fo36SXljT-bUs1S6si6c_WQ83Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA4NCBTYWx0ZWRfX1G9JWzRzdyme
 fcSqL6ttrbPNmBHXwvA+mRA2ecJSOZuIi2IsANYEvnAHTeFx0RdM49hJ1rB/ZjhZT/VfyIYWN5S
 /ax6/PTgPTakwHdTFqnMkrnlN25YywZovdmOpKkWbrUyjigsquFxmG5Oa86UpvQxjfEH2QyB+Fj
 PuUgy/ks+XhCmHI/oGMqOPcvOnIVULMzjwMZ3eR0hZPva8U2RUOAto1bP6l3gixvBaUMOsZa8CR
 scPYb/WDBgEFRgxFtvMNCRleL3lkxdYUxLX3Ncaj/hX/venergNdmDwPrqhdztGB7C68VDfHP7O
 Cif6B/MJvJz12NcKW+PGMWmdutAy/70dXVWUDHt9oBaueIXEJm+aZoAoBlUGA0WhfzfNBp7vJns
 0Xt0ELSmkz9CZr27CI7w/OyV54OfJVl6NF/gpm2489oqHVQbagItfGgZUBey3oueeJFlt4fDudO
 9LBoaYheEKOTCdAWCJw==
X-Authority-Analysis: v=2.4 cv=YfmwJgRf c=1 sm=1 tr=0 ts=698b035d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=Ar_5JxPjAAAA:8 a=F7e8yVbe-yCWslLG1CcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602100084
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
	TAGGED_FROM(0.00)[bounces-92472-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 64CCB1197D8
X-Rspamd-Action: no action

On 2/9/26 3:24 PM, Srinivas Kandagatla wrote:
> Add support for sound on Arduino UNO Q board, which includes
> - Headset playback and record.
> - Lineout

Looking at the images, I can't see a speaker there..

And looking at https://docs.arduino.cc/resources/pinouts/ABX00162-full-pinout.pdf
I *thiiink* there's no I2S out (which is a little surprising)

[...]

> +		hph-playback-dai-link {
> +			link-name = "HPH Playback";
> +			cpu {
> +				sound-dai = <&q6afedai RX_CODEC_DMA_RX_0>;
> +			};
> +
> +			platform {
> +				sound-dai = <&q6routing>;
> +			};
> +
> +			codec {
> +				sound-dai = <&pmic4125_codec 0>, <&swr1 0>, <&rxmacro 0>;
> +			};
> +		};
> +
> +		lo-playback-dai-link {
> +			link-name = "LO Playback";

"Line Out", "Headphones", etc.? I know if it's user-visible..

> +			cpu {
> +				sound-dai = <&q6afedai RX_CODEC_DMA_RX_0>;
> +			};
> +
> +			platform {
> +				sound-dai = <&q6routing>;
> +			};
> +
> +			codec {
> +				sound-dai = <&pmic4125_codec 0>, <&swr1 0>, <&rxmacro 0>;
> +			};
> +		};
> +
> +		ear-playback-dai-link {
> +			link-name = "Ear Playback";
> +			cpu {

Let's uniformly keep a newline between the last property and the following
subnodes, and let's sort all these nodes alphabetically (i.e. both under
/sound and codec/cpu/platform within them)

[...]

> +&spmi_bus {
> +	pmic@0 {
> +		pmic4125_codec: audio-codec@f000{

This definition should definitely live in pm4125.dtsi!

missing space before '{'

> +			compatible = "qcom,pm4125-codec";
> +			reg =<0xf000>;

missing space after '='

> +			vdd-io-supply = <&pm4125_l15>;
> +			vdd-cp-supply = <&pm4125_s4>;
> +			vdd-pa-vpos-supply = <&pm4125_s4>;
> +
> +			vdd-mic-bias-supply = <&pm4125_l22>;
> +			qcom,micbias1-microvolt = <1800000>;
> +			qcom,micbias2-microvolt = <1800000>;
> +			qcom,micbias3-microvolt = <1800000>;
> +
> +			qcom,rx-device = <&pm4125_rx>;
> +			qcom,tx-device = <&pm4125_tx>;
> +			#sound-dai-cells = <1>;
> +		};
> +	};
> +};
> +
> +&swr0 {
> +	pinctrl-0 = <&lpass_tx_swr_active>;
> +	pinctrl-names = "default";
> +	status = "okay";

Please add a \n before status

otherwise this looks ok

Konrad

