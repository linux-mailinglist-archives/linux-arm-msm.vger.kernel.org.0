Return-Path: <linux-arm-msm+bounces-114867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m9fpLGofQmpr0gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 09:31:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 548B96D7076
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 09:31:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GwKHfml6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fXtms1ng;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114867-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114867-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 714403023FB3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96B563D7D80;
	Mon, 29 Jun 2026 07:25:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1566B3CA4B8
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:25:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782717952; cv=none; b=WYSxxCMHNMQtBbBBACUdMnBPMQg0NyGeeAHTECTWUooSHTPZ8LuacLqsokkt409JBDh3A3bLfUbg+y5FE4LfcHLNwDzY5Fiq0pUv5cJmDuNAEf9SMNongpxb6J9NvOR23cZhNA86M1DFazfuhI79dFTlii8XpyDxVGc5FZi9x2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782717952; c=relaxed/simple;
	bh=5atLXmJiGNptA0nCAYPVcdIamemZWgjIGDmgSZ+vNFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TlTBDo7fkBHDYkNQYOGohOfVnOmqvDxaxwzSc2q4GusfYYv7Iurk+KazidaL/wXxLRPblNbFfpr62ErjmY9aCrrTUjKsVzUUXNNvrQ0ejuYoXVQq/3pMij+MfX/XH2r2xNHQDXE4NLyvkVxfCtqbVob2DaRlMzrKM23yJq2ox3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GwKHfml6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fXtms1ng; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6rQxr2115954
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:25:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gWqYKRPbpU+v7Juw2eWCAbJw3diM4+VtSUICkDNF+Ws=; b=GwKHfml6NFeFC9Sl
	IT9kgUMXf2yRSJ76sBo2n3e/GGTeQGFYmzrqcvLpxy/l/2x7hgwmj7/RwysHbnuX
	xIfQcBYsOl9wkDwhXIB6oGYcIm/HuTd7yKFI7PeSA55HznBLV6tBRwoJ8ck6bouC
	ZKevZGsDtorP0xAl+OlFcsu3ddTGGM0diCnNDgwhkT+fhdj7jaC7X/rBuJ7V9L6I
	4gSX8mr0qQfPN2xM/KcPVu+hzn0typIFJ9IRkcaykE/LYIxCn2uHOXBhtv8GNdIQ
	jVuyAGTMRfVg+xd3XIoSFX4heTCeP6ejmY5uZ+8VxxjT30yliObu4l1fqYnCVH+8
	RTxXNA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f2734d9yy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:25:46 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c804e38c65so33900675ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 00:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782717945; x=1783322745; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gWqYKRPbpU+v7Juw2eWCAbJw3diM4+VtSUICkDNF+Ws=;
        b=fXtms1ngcjhKYC/XXmheDUM90HSSXXu4Jhjl9x6Cp4IKTy9Q8REeyr18WKbalfbXwJ
         eM+t8I2KFxQn5zAXnjZhARzV/cdOUxtgVahz6xUtVjoMQ/tS3URHgK3NN/MZVgxyflry
         5DuyfhHJAieXVt8tEO30cCoOtEw7fuKChIktDkUR5Kt/iTSzq1XqE9AP6Ohb4PKUZWhD
         yRSm3fxoY1UkOL8l1H+tVyy8RHBo0sI6PA+bcWo0vIFqRgrH7x/eJOzC106lfyisJqQV
         eGnPvlMSb1hesSr+6Bz5T4srhW7sGZu69kD8YfvRmzX9EnenQsNV52SsN3yZpixwPigY
         yZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782717945; x=1783322745;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gWqYKRPbpU+v7Juw2eWCAbJw3diM4+VtSUICkDNF+Ws=;
        b=SSlkTJJH16VdYg3GBvQIPy1eE19rKgUpCmBITPmSYLl0QJ89YtSEjpTz2X2LX0J9HW
         NC3kPtfg70L1yc40gH0CC80/mxANpr1TR/q8XWi+4tjCAKxm3Qp/fRMbLnX84WtErDUn
         Jkq7CeUpwHP3Aq3fnYArOjHy+ZixIeEgOs2j6Fa+fh3TeoqDqt0YNJEBpAQhTuMP1XHA
         MAj3vJcm+jcDpW93lGHZh/V2wOGbQGUP8ezlE/jTJb4vtaVxACylbJbl2aWfPIqlBi1n
         /Nd5vQ2JbWWHy37UIM3KNN+o2piz0QKsGUMOYgU6/I5EXh4kNSgyAC/5cnu0H0vWoqNn
         L1Mw==
X-Forwarded-Encrypted: i=1; AFNElJ8qeMH2BWvZXwlNie4H7h8o0XuoAPFTwotEnDLq+4K8BFmAZVq2zijGxl93jpCaCmXY7xBkbHjwAIATdYbl@vger.kernel.org
X-Gm-Message-State: AOJu0YwKt2K/L5/S/Hby5hAT9WzVFuij1gyMb5XIpBDARDE0UqlpIh+Z
	fbX7k1cDCptSNaaB/zzTeXwgcB198LrtQ3m1IMS/8rZz2lJHV3+t5Z1L3tx1G4duIOlWvGjc8rF
	ZX+S6ds7mJKoCrjNEYNtLpGapPserOVKY0mExwQUIw/R9WRs7MYwdKsI2e30ini6K1wQB
X-Gm-Gg: AfdE7cn6eUkDkHZgXrEz9jDiySZ3BuO4MvRT9xx6FN/yGnIYZ/2bKcLq2gNK+ZHyyQg
	yPstBLxbaK8sBVdwgsU9O3412zS1J7MIsPt5oNwmY2ZeA7U8Xi0TOE3JDl0GrVuj6Gp7vWGKTUI
	UNXIDXv13mFWw6MuM8ul7B87nEqLBiSHHcV/8F+2LDpdHwdpi0p7M8vSYlSNimL5/LcZ0Z/aS+v
	8GyKX55pgv1FBGiqNOojnhaOkopNzFbkm0kXBEpUcIZG0uQuwEDaHzrwwW4rVHLZl1DJFVvCYMK
	hlY5reOz+Xlrl06ugps7cSm/dWeBkGOcuqkDzL5cU9qmidjWZlzvdJ3SBQPuPzvZ4M11/zPGjFn
	gZum+Imf1xZXG2+gkJRyPBk9HG6ODqVEyjrceh7M=
X-Received: by 2002:a05:6a21:8cc7:b0:3bb:21ad:40d8 with SMTP id adf61e73a8af0-3bd4afac2acmr16932455637.39.1782717945570;
        Mon, 29 Jun 2026 00:25:45 -0700 (PDT)
X-Received: by 2002:a05:6a21:8cc7:b0:3bb:21ad:40d8 with SMTP id adf61e73a8af0-3bd4afac2acmr16932433637.39.1782717945055;
        Mon, 29 Jun 2026 00:25:45 -0700 (PDT)
Received: from [10.204.78.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c965b30bb75sm2954440a12.26.2026.06.29.00.25.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 00:25:44 -0700 (PDT)
Message-ID: <276e001a-00a4-4822-849c-f1c0879b81d5@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:55:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] arm64: dts: qcom: shikra: Add MDSS display subsystem
Content-Language: en-GB
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arpit.saini@oss.qualcomm.com, mohit.dsor@oss.qualcomm.com
References: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
 <20260627-shikra-dt-changes-v1-1-449a402673d0@oss.qualcomm.com>
 <hwn2kjauk3xt35cwmv3ludr3sxrwklf4n65p2tziox6m7req5o@lldl2cztbqi4>
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
In-Reply-To: <hwn2kjauk3xt35cwmv3ludr3sxrwklf4n65p2tziox6m7req5o@lldl2cztbqi4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OyUgjHQhNUHmzmt_DU4y5q86KGRIs0u5
X-Proofpoint-ORIG-GUID: OyUgjHQhNUHmzmt_DU4y5q86KGRIs0u5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA2MCBTYWx0ZWRfX4qXKFtv90I9I
 AGmBWNeHdX0caJ7+lSxr/2b4o5rvkx09R2yGZE1oOjqGuCJN6zYLuS+IrBoYgQOgQ35qSUKLxng
 vbTyVSved7Qw4lxdJUAOXgWW6lmjBrw=
X-Authority-Analysis: v=2.4 cv=HYokiCE8 c=1 sm=1 tr=0 ts=6a421dfa cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=C4UGVmGH2tmKGqTjtowA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA2MCBTYWx0ZWRfX5PQE1ZwFH0VR
 5c4tmKgrAyUBRb08bIk/Xz3ERtx4JrNcGOOP7UiRtGIck6ZwEynV32sV6N/NuYCSzDh66ggXhuq
 i7jk+43wna88P0cMHbJnaUtCqiCB0rqDsSL3vfmeSOBpZJXtvvcPI8GZg8/ZVykxfR0jt5TuZL7
 YvzO5zqhh3G6/5x7qgT2x8OnBlP9muccaooEji6X6KT1AZx7r9dQq9TYsxFlHRQmfLpVG8AB9wv
 5aUhcgRbJQN85t+QWiaUDWC06Wvg0iZMMzAfGiw6UtI+M7kXhx4tIPIESyEy1hMtr46kbnzksmM
 CYAG6elx/oglq0GK8LbCFuA+hfK2I6gruS59Aw0Fm1TmlC3Z+0TelPzhV7uJku8E2ZytHksTwKh
 SftG7GUznHRpOHDV8a+c7/UFWjRK3EEfAmZxyBMaLrjhbTOWrT6Qmz1s4Wec7VGGbDRyN2lSLgx
 Va/7NqR4fMIqTK0efaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290060
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114867-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:arpit.saini@oss.qualcomm.com,m:mohit.dsor@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 548B96D7076

Hi Dmitry,

you want me to use this generic power domain index ?
=> RPMPD_VDDCX


Thanks,

Nabige

On 6/28/2026 6:05 PM, Dmitry Baryshkov wrote:
> On Sat, Jun 27, 2026 at 03:31:35PM +0530, Nabige Aala wrote:
>> Add the SoC-level display subsystem nodes for Shikra: MDSS wrapper,
>> DPU display controller, DSI host controller, and 14nm DSI PHY.
>>
>> Shikra uses DPU 6.5 hardware (same as QCM2290). Platform-specific
>> compatible strings are used as the primary match with QCM2290 fallbacks
>> to reuse the existing driver support.
>>
>> The dispcc clock inputs for the DSI byte and pixel PLLs are wired
>> from mdss_dsi0_phy.
>>
>> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra.dtsi | 203 ++++++++++++++++++++++++++++++++++-
>>   1 file changed, 201 insertions(+), 2 deletions(-)
>>
>> +
>> +				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
>> +				clock-names = "bus",
>> +					      "iface",
>> +					      "core",
>> +					      "lut",
>> +					      "vsync";
>> +
>> +				operating-points-v2 = <&mdp_opp_table>;
>> +				power-domains = <&rpmpd QCM2290_VDDCX>;
> Don't blindly copy bits and pieces from other platforms. No, its' not
> QCM2290.
>
>> +
>> +				ports {
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
>> +
> [...]
>
>> +
>> +				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
>> +						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
>> +				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
>> +							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
>> +
>> +				operating-points-v2 = <&dsi_opp_table>;
>> +				power-domains = <&rpmpd QCM2290_VDDCX>;
> The same.
>
>> +				phys = <&mdss_dsi0_phy>;
>> +
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				status = "disabled";
>> +

