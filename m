Return-Path: <linux-arm-msm+bounces-102145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GF/aDVPp1GmeygcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 13:24:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5D53ADA3C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 13:24:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9ACB9300615B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 11:23:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22D873ACA49;
	Tue,  7 Apr 2026 11:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EkO7zyZS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DhBDxpwA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A6C3A5421
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 11:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775561032; cv=none; b=iiI3JEHSZcaP7ydHgawRJ3evAo9eelvPmrgVVl9dZ622NvqqAoS7Q5xLACbmP5YFNcCL9zIxx5x04aBLB5F04vZ+SajxGR7liLRz8ZWo1mNKTuCMO1ItrkeF76cdpaIh9TqM9QhjcPY9xAiHmt45dhlFdD2GlKfwwvmeu7/ax2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775561032; c=relaxed/simple;
	bh=0g2DOWAqxXl3/6VKoIdBmNLTlCMN0Jx8vcKCM1lnED4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lxl1Su5S5t1D+5A/QjKvgn5YdSZWar9YP3baIdNivUtnpwJMW/uxniKxwG1tjeCaZZdb9w+mtat22ofZ6HEB0pq45hNcLZdemCRom12+NuwoeWUCjZj2D0Iveo4kSzkS++Q+O+80bei8G6C2b3dFJU4xlfWtbVtBMk1QPCVzx1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EkO7zyZS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DhBDxpwA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376X38P1405862
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 11:23:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XO/DBEMZjhgTBwIbs6dM7BFKs9J0ENtLy/HrD5FOI1A=; b=EkO7zyZSzb7Q4/gd
	/9jVwAcaIp3a3BmkoSwGZ4UhwHlRZ6ptN2cgIafFpcH1AYr7KiUISg1egz/rOETv
	khw30riJhWnIbHlPQTtyeHvhP85vpa2bhsKO5rPH0bH9AI1c9ClYnXlNXKZI1+sf
	GI1h0UVpOZDD84vPCCqTpPWltxSIF2cssAkm0FHgQQ8aUA4XCuiL9BjWkpCtJ7P4
	wJMiFwteYJWYqrFZLfGPUCihG9uwdda1iCGS3UH2ACHlqaXDcGGU3+bA+YZ5evk8
	+R5sE176WHImUi0Y31JNJCNyllwi879hSZ/akuKGeMFY3hqlFGwy1QsBLqL+Mj5B
	VPo4/w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmratf4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 11:23:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d8c183c2eso18849371cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 04:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775561029; x=1776165829; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XO/DBEMZjhgTBwIbs6dM7BFKs9J0ENtLy/HrD5FOI1A=;
        b=DhBDxpwAvu5DN+keB32w4TR2WKnOfXSSzEXh36xgRPGFkcsmTvfIiaR3QEqX4V4hTA
         RXQf6JlmDHshAOGRoSbFg2KbRazAskiiY80uScw5r9twFSpqPMDoOJNIyXk/ip4FIwIG
         t6V7m6fRQyb4aJz5YCag/MCGY/++3xMg1ASaiuGA9xXsu/sYb/dY/2TSORuJU21RVjcq
         hrE6kGAxapQs0a502kEWt5GG3p/kUxHnhpbsINVQQV7gFXa1xldllRxYHMqmGzGLaO0g
         bSOwJZWS8kh82asFqquMXO73OXNhTYSo/OqiZEG1o9PumeHT3ZgD/E6MAtlOyF3Cfpwa
         C01g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775561029; x=1776165829;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XO/DBEMZjhgTBwIbs6dM7BFKs9J0ENtLy/HrD5FOI1A=;
        b=XpufjbOY2vzWxl/pvSHch5bzl6TfaK3adoZ9ULRGWJtoFqQxfovF4Smcb/7MdxWgIn
         gvKKLAMbJz4e4RtmQ8AzavoBiHY56iq35dVoRvtcnxd1BdH2gDRLiIF+UXBI++y4AXCc
         LddF9Vk1/k/IQc/u+AwA3RuMkz2NzpgkNDg2Xj5gtzEWH4bBs+1s/qHcUNv81v6eaqx2
         TMcfdqCDlHfKv8sAeViU+ewveMECgJcspwXmvFHGytndWxLCrt3zic8O2qyjUlv3CjRH
         mGOhjFh4s5ErqpP87DPcNSlR83emSIW2H1jZZsGmMpIv/YBuPVEEuPtuPeKnTIQsieww
         kDSg==
X-Gm-Message-State: AOJu0YyYSx6/oXjkR2JiKij0e3FF5GMGGNJ89vqw98omZHjwbncAYhML
	2PAYHSyoBW3qi/83TCjiwVnp/3ZmEeRLGpcsUOcvYkO6M6FxppeVOk1z6/jxL63lEubi7cNT1IX
	P1QSlFOw+7AGlzrNOgQl39ZoFusaG3Q1BIlSy7xIqPT9iOSfm2a3DHmyDqjNpH5HD/5Ho
X-Gm-Gg: AeBDieu+HwO2YFQ39aWIFMC6T2NPNSgDh59m0sNceUQsn8p0TjUUkWNqWSADbKnLLED
	FBKB4dcMSTN5OhkPsYLcw2uxfgzZpbrDEYg0W+sSjP1gw3UKafegRMonWV8hgXPThTuhJKi8IGD
	3MEZKcVoDbV5ARACsCmrRcqwCPq8qK3AJDJ6PBTnR8rMp/RtvOXpg7AYJl8ZSP39QStD31irEC7
	h706mAHOl/JZYloZU4SaFc1U9YNdmOl8XqD2kdSvBWrY1sKrXERyl2sTLA5LDjWbUAdiiBKgudr
	40H1kl8ejcQbX85fI3mJdWZHnj/R6bMBe/5mwY+rU16CPXFalc/x3VzjKyx9HrKDaL3J24LFve2
	aBb+BvUSTIJg6CwxxBbBm0iYefv1PL4W/+yKjaW/y/cgjwiB7bXnbJgl9Xv5mAYySK/C9o/k+Un
	6UACM=
X-Received: by 2002:a05:620a:4442:b0:8d2:394a:d3f3 with SMTP id af79cd13be357-8d4184d407fmr1513596985a.2.1775561029149;
        Tue, 07 Apr 2026 04:23:49 -0700 (PDT)
X-Received: by 2002:a05:620a:4442:b0:8d2:394a:d3f3 with SMTP id af79cd13be357-8d4184d407fmr1513593385a.2.1775561028541;
        Tue, 07 Apr 2026 04:23:48 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e033a7800sm4273291a12.18.2026.04.07.04.23.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 04:23:47 -0700 (PDT)
Message-ID: <11ba2f59-809d-4165-b4f8-6497a9ff8f7c@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 13:23:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Add ADSP FastRPC node
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260403120753.105869-1-mitltlatltl@gmail.com>
 <66e25445-e7f8-405e-b208-e69b6b401f90@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <66e25445-e7f8-405e-b208-e69b6b401f90@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qZPGjJGgcHjFXMycQziypRE4yNijeaYz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwNiBTYWx0ZWRfX/OEo7kvIVCp9
 CofXN99pV6r9h1iS/iYkFtvR4pvp3/5A5RdO7Ts2LWtglcPQgGeyEuRCSzclVpX+G/4MaqjdXcw
 IXtpTJGIOcZQ1KnsGAly+V24y7l+I3e41RqBKqXSlorPpjsvKS2xWYgrNb/Y5r3ThO+s9auZGrJ
 OvPj56HHGgw192JW3xvziumaJKd9mqJ7g23ixi1tLWG6gMgtHMUJOuPowPXGH1gAPeXob8nZi3E
 dB85rT+d2Go8PuZjc20UVxqGmLOgorgOGjnXJfemVZK0jdulokfqzGNn1lHCJIh5jcqiTCR/Xxk
 O/S0YOeTTqinxo+pk8k8Z/Fe3YsUxiZpypYbbxNNzMqRu+a6kwkS29aosfW+P078oWHprPo/2ax
 RvfoDP0QNoOseLP17DHvPd/TTapbLgV3xF3EippLU3+m9KVawI+0KVGRla2L3KPFEQ7518LDoWo
 NJL62jLWfuQ8FkuwV6g==
X-Proofpoint-GUID: qZPGjJGgcHjFXMycQziypRE4yNijeaYz
X-Authority-Analysis: v=2.4 cv=D/d37PRj c=1 sm=1 tr=0 ts=69d4e946 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=-RCL7HuMZfIX-v8wKUsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070106
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-102145-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.3:email];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8E5D53ADA3C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/26 1:22 PM, Konrad Dybcio wrote:
> On 4/3/26 2:07 PM, Pengyu Luo wrote:
>> Add the FastRPC node to enable offloading compute tasks to the ADSP
>> via the FastRPC framework.
>>
>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 27 ++++++++++++++++++++++++++
>>  1 file changed, 27 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>> index 761f229e8f47..ee02acd18856 100644
>> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>> @@ -2966,6 +2966,33 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
>>  				label = "lpass";
>>  				qcom,remote-pid = <2>;
>>  
>> +				fastrpc {
>> +					compatible = "qcom,fastrpc";
>> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
>> +					label = "adsp";
>> +					qcom,non-secure-domain;
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
>> +
>> +					compute-cb@3 {
>> +						compatible = "qcom,fastrpc-compute-cb";
>> +						reg = <3>;
>> +						iommus = <&apps_smmu 0x0c03 0x0>;
> 
> These are SIDs destined for the CDSP.. (how) have you tested this
> patch?
> 
> +Srini, Ekansh I can't quite decode which SIDs are "allowed" for FastRPC
> on Hamoa's ADSP.. could you please help here?

As I hit enter, I noticed this is indeed not hamoa and these numbers
were just coincidental..

The patch is alright

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

