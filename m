Return-Path: <linux-arm-msm+bounces-90973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KyVBCfyeWnT1AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:25:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FADBA04B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:25:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1577030072AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A40734CFD4;
	Wed, 28 Jan 2026 11:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eSBO5EHk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Za3fglJs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944F7330640
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 11:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769599501; cv=none; b=JVXQ1eK945J7ifMNajRk3+ZDvNOnXOuzJiEQPGzmikSc4GOyd+cdigFlq6ZrmzcYxUnzGUiPhVkuGem7ne1nEbIXUFVSD3YBJAMhN2YjT5eemQssV5zoHGsxdemSvz4CkmhUtmnTNnw7O+ci8ZzLdMba+lU3BT52vQV5buADB+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769599501; c=relaxed/simple;
	bh=dVaaZ/ts/oUQNOwdJUlK/CE2cyjwYip+mrbrgffsmDY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J7Cmgu+xh8vEFjNtITOfmsvS2LcPzKC6DcTUJWZSKys1a2Ixa2EvXDRWLTS8DvntYmrvbT/7TnHuZsHiaLOpPHn+vaFKfnEQEST7SHoehL36AtZnyxJVJa0PTmvCXmKfOffQ9vIVXRlwIiHXOn2fH2mdkeVko3XzHtds5W7MEJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eSBO5EHk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Za3fglJs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S91oYd3879033
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 11:24:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dhRsJ3EzuUj/2l9fOKYhc3V/t6syCqgQiffXBGPgzVU=; b=eSBO5EHkrk1kKvol
	or1hol6Sg/aspr2AtDwhhY13UR1eIqD9bG3gYLci7B0wSHjWtftBFSGdsPtlBcS0
	gmfF/12HMueS+9JgpEynVntlJQAX3IZHmC53Aw62zLMDKnaEOnZ5sOrLi1eHtUyH
	Ykvt1VM16nyeOAutu3YgEv8lwDvluq2erwKlrDXCusZtEpLw37JoP3mc/2JX5+9p
	urgyjMvOKOHg4uhwcNbnSSajZOeeZu7KmpeWa0lSs7nz3B+icVeL/OM02E68eTo5
	p6Qs6gzBK5OXPo3155SKE3LEKWsu7WxvCuzhwDXeCwO2tQzofTi0SOyubeXWeJYV
	fVl0Mg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bybyv17by-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 11:24:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70cb31bcdso15161385a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 03:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769599497; x=1770204297; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dhRsJ3EzuUj/2l9fOKYhc3V/t6syCqgQiffXBGPgzVU=;
        b=Za3fglJsnNFRQ7a9wwKI1JoJvIB0xrC9PE1O6btR01k9ewhn3pQsM6JNuG5yFYBwxs
         4GkqhoBxCHsjCwYjFebPAZxbUDofYT74n1CCeNJ54OS02skyBZI/XHDxnD/yDpqbg6BD
         pHp+OiNapQs91XX+ltq4mlMtA8Plfg6QmvYIfTSogUWXTApFEmAvASdATJu+1PINJUd4
         Juq9S5NDAIacHWq6A4IpAaz49aweNNvq8Xds1wF1tbLPH9R5XxWzKWEoDf4T/zdyThT4
         Ba1IzXQdF7t/fbtH89fiVytb+LGvrw2hnDwgj9hdBBEaEBs9gr3vCLigcUk0eFaxLnDz
         RDOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769599497; x=1770204297;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dhRsJ3EzuUj/2l9fOKYhc3V/t6syCqgQiffXBGPgzVU=;
        b=aWyIz75hOksD0NSZr0WpDmDfC4wuMqdlfcFUeIIPdrcD2FFBraJeah1FHAlz+LI0Rp
         jjWHsaKJ/KryObTvr/iTLiVPI3db+iU/Ra4EdwyIxiAWOvoR4G0UKs4aa9bDfCbwjWZT
         skwcrnK7Fc09eYLUa57vBmW133URowkA21hxEf823240bKc4W3po+Tv3k/eYSqmoaQSj
         MtdZvsmVtKxaYMyjtV9FsWGVYGQylUNhbEl6Tvn3/3gMzgkShCEjDy10BQFHQ3VeDvQr
         psUkdKf9W50yblWgqAOb9CEOliV+CCLQ+M7+faPTaHJR2x/mvIme9F6oPQDMu9HFPw8h
         eePg==
X-Forwarded-Encrypted: i=1; AJvYcCVtdCh6N1dZJSS/AzpHqD8sOsACYC9IFbRkK7Os4S8nu2M3F/+9R22cqyxpc+h119Y00eVP9H6rD+aDIJBq@vger.kernel.org
X-Gm-Message-State: AOJu0YwJeHy2cYq8c8+NPUfA/Ho8FpRdRQK5tboyvyrfwr56Bg1iHd2m
	eQkbKxG2xMETb79Iog4dRkz9rIMCyW9WAQ0SWUBdacM6nWhZV1veKE525TcmMgVCrGRM1m1j2w3
	YkbCG6TN/mRV7TOKuo4i20Z0K4L7mDPCTqtKxquiWIa/99RMZxvckaG70uU7KulkVjpan
X-Gm-Gg: AZuq6aJEA90DtHOKBEzTZwLq0J/YSRMoN2ChlQXoWQmuVxTCbB1KvMsFyIbjznM5D8c
	PyqDcXN17Qxueu1urEkkg0UHJzhb3r/1QlgZPqKzIkhlOGC4sHbWWOSHwSJYjp0qTwuUNrW3Pm+
	Uzwynk6f4yr8egBt5NwjNzkb2oAPd7r3bSME8CiU17qJ72sDJ4VFW8nsO/isJUabt/QIh2hMN4r
	EKnTuit+9Bw23HtMKJ8LmM/72z7eP1MNWyjYjP5W7qOGfl7eQBlPJyVKHIdRBQU6Xhwdbn2RwjF
	+qj8A9Ng4+jlsXnloc78PqVqjhcwPg0wxPPnLn8Ql6UmRG8yzqK0mRm60ygm8JuVmFszHeAko+e
	JrB+MQKSLpunVZjhmIYV7pCXbTCtojOlZ8Wv7L7wbhpgha2sn6BqkcHbhBIhX3H1/wJc=
X-Received: by 2002:a05:620a:2904:b0:8c6:d3a7:3d1e with SMTP id af79cd13be357-8c714a67607mr122192485a.0.1769599496953;
        Wed, 28 Jan 2026 03:24:56 -0800 (PST)
X-Received: by 2002:a05:620a:2904:b0:8c6:d3a7:3d1e with SMTP id af79cd13be357-8c714a67607mr122190085a.0.1769599496363;
        Wed, 28 Jan 2026 03:24:56 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1847f9sm117534166b.42.2026.01.28.03.24.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 03:24:55 -0800 (PST)
Message-ID: <de10c91b-f6bf-4594-8df2-71395ecaa893@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 12:24:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: add basic devicetree for Ayaneo
 Pocket S2 gaming console
To: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org,
        KancyJoe <kancy2333@outlook.com>
References: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
 <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-7-c55ec1b5d8bf@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-7-c55ec1b5d8bf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: l2xNpRFgzfPAbuVNNKVfoUXc3_FRiLeG
X-Authority-Analysis: v=2.4 cv=ZZ4Q98VA c=1 sm=1 tr=0 ts=6979f209 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=UqCG9HQmAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=rO7Yge3HHgQ4wEOnkrQA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA5MyBTYWx0ZWRfX0vd5DQrUWYeK
 u/SmvFqmTdvoShyAMA3W6Z4WsLHyyjbMoFZj86IqzZfw0n32Frsm70bPgpmyCvrNOaZuzkL+/gc
 vLNTWbcq9cAzCUut7ZWqGFzcgQEuxk4hzSmLFYNnMJ/PfK98ICiSHDFjZ/2isUY9Apj381iAze+
 2dumC2/kgKUgYyXgSAVHSEC6IklDnf3J/vbRACsRowQmTBKmXZd8C2PJFO1mUVCAwpRublS+FA3
 2KtlIt/TQvAGSW5D+R48mDb+UwZeoPsLzfHuKSZ/IMs9sOJqN0oQZR3P5Siw0knsqgeNXxXb6br
 2fciQu7AvkNIxNsyW3CNa4zOD19b4ZT2Bcknti5iXzX+LunEl9mrIfMkGd/pYlkvzYNSGtFC3UB
 rBnQDgrspWk9fTkKsYPagYQ7J3eRpmL0T5byKGqLUrfAY1iMl/hMY7flzw2YKN/69VRWb28ePkT
 tMRufPBXRH6IGtCDUAA==
X-Proofpoint-ORIG-GUID: l2xNpRFgzfPAbuVNNKVfoUXc3_FRiLeG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280093
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90973-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,outlook.com];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:email,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2FADBA04B7
X-Rspamd-Action: no action

On 1/27/26 10:57 AM, Neil Armstrong wrote:
> From: KancyJoe <kancy2333@outlook.com>
> 
> Add initial Device Tree for the Ayaneo Pocket S2 gaming console based
> on the Qualcomm Snapdragon 8 Gen 3 platform.
> 
> The design is similar to a phone without the modem, the game control
> is handled via a standalone controller connected to a PCIe USB
> controller.
> 
> Display panel support will be added in a second time.
> 
> Signed-off-by: KancyJoe <kancy2333@outlook.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

[...]

> +		va-dai-link {
> +			link-name = "VA Capture";
> +
> +			codec {
> +				sound-dai = <&lpass_vamacro 0>;
> +			};
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
> +			};
> +
> +			platform {
> +				sound-dai = <&q6apm>;
> +			};
> +		};
> +
> +		dp-dai-link {

'd'p-dai-link < 'v'a-dai-link

[...]

> +&pm8550_gpios {
> +	volume_up_n: volume-up-n-state {
> +		pins = "gpio6";
> +		function = "normal";
> +		bias-pull-up;
> +		input-enable;
> +		power-source = <1>;
> +	};
> +
> +	pwm_fan_ctrl_active: pwm-fan-ctrl-active-state {
> +		pins = "gpio9";
> +		function = "func1";
> +		output-low;
> +		bias-disable;
> +		power-source = <0>;
> +		qcom,drive-strength = <3>; /* PMIC_GPIO_STRENGTH_LOW */

This is defined in include/dt-bindings/pinctrl/qcom,pmic-gpio.h,
you can just use it

[...]

> +	upd720201_avdd33: upd720201-avdd33-state {
> +		pins = "gpio123";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-low;

You should be able to drop all the output-low/high properties
since the device driver that references these GPIOs already asserts
that

otherwise lgtm

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

