Return-Path: <linux-arm-msm+bounces-104452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PVXAkJW62nkKwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 13:38:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8020345DDB0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 13:38:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9741300DDCE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 11:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D78943BC68E;
	Fri, 24 Apr 2026 11:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OLx4MBQV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T/Ngsdjp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE533BBA1B
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 11:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777030590; cv=none; b=q9lJQJ6ljpLUsiyic9EtLGWoe2jBaH7ovWjtYsaf5NK6uKmZ1f2mOechVoIZHcmFEg9uLCSplYY9SsVJSeqAdLwLvS4XWDvppSIlCZHLoojvwUxvFh44A+wRjQosOMm1VoyLkmm3a6XPpSRAT454zfWkCN7rPSC/TBHxTTiGABU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777030590; c=relaxed/simple;
	bh=kPMGUNNSmroYSsiqLoYTt4gz7zVsODQoZrsEYXDMkX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kC/gQI+3+ctuMSqYeBOTXQqAi2bCQZtfk7Qm5r2lobkDBxw30GiRIFUKMK2O1FNByReeG6W0WMen+T2hxqQOFssD54gknogzRVOLP+0OSCsBzaeddLw8U5qsIwLscdr3boXdjaRnxjlSfGLSpJmF7ZZh2uPBQZKahFW6GPWcNEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OLx4MBQV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T/Ngsdjp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O9RT0o518387
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 11:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	szb/C/NuDvGqRRu1u78P1sc9wQPhVPl5cH0BZflLHds=; b=OLx4MBQVZcIfvtqp
	EyXnMunn34PmO6FdZqwrOQ5eJ7VdohfMBqrt1DIAgMr2uE8R3t9hM7eaLq2z72eo
	YipG+oORIKgtnonaVXYLPwHnQX3/gaAImzkd8WBfO4S9Oq0M1/zeMi6pBgzWRqvY
	wj0oPjcg3Xle7KGsaJt+w+smHfOrNCWSKTMu1i4CA51wtbDO6x7DWl9jBeW3+hF8
	mcrSBlcOojvz1YkxZZWCh6e4sMZxg6xXe6z3XnF6M7i0Il2qdAw9u2SOT2dt6KRT
	hIEgI4TMaxO5QOruwTXU4tLt/KEddekZOcaugBsK/PDF2nTLE7mkOXePdNEpfPvW
	lV83gA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr0fnhv3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 11:36:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fad7b0ae2so16641661cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 04:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777030588; x=1777635388; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=szb/C/NuDvGqRRu1u78P1sc9wQPhVPl5cH0BZflLHds=;
        b=T/NgsdjppkTMSp11a9U6JVNm4ynwClbtt+qmBTanaFnXqQizUrI7EaBBfkCZWhM2yC
         1rRH5fqrDEKMZ8qp77aCRIGt2HJ+BeY2I8flCVgAJPgObjsW6TymW+Qdsx/NPJo6Yde3
         pC/ZeGg/pqA5c5yhF5vCjjeKIzq9PjlsIC////+hKtTHQBE6b6NKYX9PCJH4+TQoxEMd
         9AmOctokE4pIF56on5KqBcWeOxOfJCiuB9TIAvr+2cHcBaM9SPtuRdxQW5PyNJtqG90N
         QxQWTNSI3kWaSsh3wgGSHsIqscdTFLViQYBnJ+wMCMiPNBzxT2OfciWMUQuuwa8ZNM0w
         /J9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777030588; x=1777635388;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=szb/C/NuDvGqRRu1u78P1sc9wQPhVPl5cH0BZflLHds=;
        b=c+5C87KB7bkHOoj0D3KCmcSLcjQKWyHmaw2Zz+59SIuIKasypZpNE2Rx4thMbMltj8
         2e+v4ho4wqFhWcxvdYTVIsf0GcPxJfffhRG82uUokJTEF+LtZSQpUsOV9v8v7fGaaoVE
         tY5DmMK5sUp0TZEycr32x1w3R+/yYcZ3m9FgpMsOtDXPDDBfYJc7x9ogzZhYWTihjYg+
         NGWE8yFzf3BE5P1O3t3Z3FGjlJLINSf9CEoHq2VgS41cJl61QgtbjUqVcTPBbPe4OS/x
         dca35Fms8mkrXKSGkMDEJlYUZhjnmI7WLdXEdxILHIa7i6sUfAPwUfEeISz7H0r1NwgH
         ST7Q==
X-Forwarded-Encrypted: i=1; AFNElJ+NZzBaZC6YoUe3KelGSGosu6uMOASBXC/IUns+JT14FtGk3Jj8xO9fewKnJQpcRTvHHQY0b7yjVsYbeuCd@vger.kernel.org
X-Gm-Message-State: AOJu0YxFzJw2CBqtiksA3YEoWQWVWcfnSYS6ic4Fjj+IbHB7bXotObTy
	PWG9Jw9y1z9+XkZKS2kubXkaRifySnQPOoeLjxVEJnVL4oW4vf5HYh7zJVC1g3k1UUEgrLkWFcC
	9GGyDowCcYRxLdrnrcvVGHCUglgUVnaRDX/3CZWlIbnmHVMVz6Ih2z4JxE5hdiu4D6mol
X-Gm-Gg: AeBDietBul5z5objA8wC5/36gzDshZxd706pBwgOHvoE3cUiiZL5VKAufkxVqB1LLIC
	AiOX37EfvcHbeF0n4ypcHLNOkvWWc8IOJz/Wrw7ftFHMl3fd7Sj99iG2zhASF+YFBbN4TOM6to/
	A7oPdlqgCK9f8kkxSqzd6oYtSz4uLJFvnnJhLSsUdqskxN7CkE3Ikq6mWF3CqpCdBDpQ+dOk/xh
	KsFLZiG2QUWvjiQdsCWI02fqoJ1YemVWjVCjsFm1BtkAYpyl3JfZWB61tCXU25HRxo7SEBOBzGV
	m2s6yPbV9osawSN10GG0+fmPdBN3BSnSixrC4jCjD8AKGzuUsP6KRdYMoFsDqf07P/O627r6rJO
	YwpwB5FYtidjKn14thvJZK7pc+PViz3uSRjFZlrOI/V/3q6+Kz2hsn4Ij7OauI84IxLqVEf/ZM6
	Yq9L4Ia7nYSCiJNg==
X-Received: by 2002:a05:622a:1f88:b0:50f:bfe3:a04e with SMTP id d75a77b69052e-50fbfe3a765mr119513611cf.7.1777030587695;
        Fri, 24 Apr 2026 04:36:27 -0700 (PDT)
X-Received: by 2002:a05:622a:1f88:b0:50f:bfe3:a04e with SMTP id d75a77b69052e-50fbfe3a765mr119513231cf.7.1777030587197;
        Fri, 24 Apr 2026 04:36:27 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c47fe836sm4924815a12.3.2026.04.24.04.36.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 04:36:25 -0700 (PDT)
Message-ID: <cb1a8f75-2161-4273-8ee0-6d36058fb2f6@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 13:36:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 04/10] arm64: dts: qcom: msm8939: Add venus node
To: Erikas Bitovtas <xerikasxx@gmail.com>, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
 <KV8KCGTrLcQnaBrdbcO-8yqIObRcqYTBQgEYv3TaeT9dT0e9phTPowW1fza6BV9LfqNc6ZORybdss4WGdvnUTA==@protonmail.internalid>
 <20260416-msm8939-venus-rfc-v1-4-a09fcf2c23df@gmail.com>
 <ac54d018-78e2-4f8d-97f5-3cfdb5151aa0@kernel.org>
 <717459db-479a-4a68-84d1-a718c8ba5a54@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <717459db-479a-4a68-84d1-a718c8ba5a54@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LfYMLDfi c=1 sm=1 tr=0 ts=69eb55bc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bAtGagR5AAAA:20 a=KePjsaevwCBX4e1EH2wA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExMSBTYWx0ZWRfXz1Sjjuj4Qs/c
 uTHUN1rAECGozFuonQnn3LU1/7axXZZsOTted7PmJ17Kd/J7vbi+lz1lxsVjvWtMhRD02qQ70eB
 oVffr5P1hy1mcCgJ6B7zenM3PZswfncOvjK83oK5rXVNM3yzRb68WQkXbKJzXC2rhhAgamLQ/0T
 j2s2255L2qZ46hEghWim4IaXsPKga8Em8Esp+jHD5NrXZ5UKy7g8OOXr+OIhdrsbszko6Xnkv7o
 ZtvyulAduHD8rzOqK5+GstrZ4CDUObd+W33nIB0wDP9Car+QUZK2jKLbr4+oL/B6mDA85C4Nbg3
 vgIOks54nhTC/OFMKWVVimPa49740eK+94RGsGZdfqT164840iaG0rzL2R6IolBoDhFtwTQGORT
 8UBrBP0OC5oCST1EtArd/y5AlxTbDtrLsCu2hgfOyC9PE3ERQAvPah0nWra1N9qZG8HzmNoqxiD
 tIASkVPGwnVQAiZ8hSg==
X-Proofpoint-ORIG-GUID: dTbNZUgvWqTkhPDAPXn08W4l3BuvSOd4
X-Proofpoint-GUID: dTbNZUgvWqTkhPDAPXn08W4l3BuvSOd4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240111
X-Rspamd-Queue-Id: 8020345DDB0
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-104452-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,1d00000:email];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,oss.qualcomm.com,apitzsch.eu,baylibre.com,gerhold.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/18/26 5:34 PM, Erikas Bitovtas wrote:
> 
> 
> On 4/16/26 5:31 PM, Bryan O'Donoghue wrote:
>> On 16/04/2026 14:43, Erikas Bitovtas wrote:
>>> +            video-decoder {
>>> +                compatible = "venus-decoder";
>>> +                clocks = <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
>>> +                     <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
>>> +                clock-names = "core0", "core1";
>>> +                power-domains = <&gcc VENUS_CORE0_GDSC>,
>>> +                        <&gcc VENUS_CORE1_GDSC>;
>>
>> This doesn't make sense.
>>
>> You have two cores => assign one to encoder and the other to decoder.
>>
> 
> This way during decode only one of the cores gets powered up instead of
> both, resulting in power collapse fails.
> Core clocks and power domains can be moved into Venus node instead of
> sub-nodes, like this:
> venus: video-codec@1d00000 {
> 	compatible = "qcom,msm8939-venus";
> 	reg = <0x01d00000 0xff000>;
> 	interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> 	clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
> 		 <&gcc GCC_VENUS0_AHB_CLK>,
> 		 <&gcc GCC_VENUS0_AXI_CLK>,
> 		 <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
> 		 <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
> 	clock-names = "core",
> 		      "iface",
> 		      "bus",
> 		      "core0",
> 		      "core1";
> 	power-domains = <&gcc VENUS_GDSC>,
> 			<&gcc VENUS_C0RE0_GDSC>,
> 			<&gcc VENUS_CORE1_GDSC>;
> 	power-domain-names = "venus", "core0", "core1";
> };
> 
> And then they can be powered up regardless if the session is for
> encoding or decoding.
> My first question was actually about this - whether these cores should
> be powered up only decoding or for encoding as well. Bus configs
> downstream signify they are only for decoding:
> https://github.com/msm8916-mainline/linux-downstream/blob/b20608408caff817ec874f325127b07609fbaeb8/arch/arm/boot/dts/qcom/msm8939-common.dtsi#L1589
> https://github.com/msm8916-mainline/linux-downstream/blob/b20608408caff817ec874f325127b07609fbaeb8/Documentation/devicetree/bindings/media/video/msm-vidc.txt#L35
> Unfortunately, I couldn't test encoding on my device. It appears to be
> broken.

Do we know whether it works on msm8916? (+Stephan)

Konrad

