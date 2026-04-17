Return-Path: <linux-arm-msm+bounces-103522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BKcOgUV4mnZ1QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 13:09:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B37A41AB7A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 13:09:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C9C4D302E191
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 11:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C0503B8D76;
	Fri, 17 Apr 2026 11:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fbLJq39r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MUkDHP1x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3131339F18C
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 11:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776423979; cv=none; b=FHFPl5+yn99aIyP/Ptphz0SFpSnh6Gvxw4nnimQkrK89ZTL0VwUXEeDh+eR4QMcIeZEMMNg1cWqMOkeDC/470+Jf0P1kqztizpQC7a0avNq/ilXjqiOCzHRmbZZ7yylQ+yNFkFlgdJjgzxVdAp8SSllgMv81ogenHiRARRfoxXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776423979; c=relaxed/simple;
	bh=gjp214fa0vDqtp2MIeTwFh6cFLkjHcWFV2eE2F+rGpQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QZX/gSRRdiZAMSPy95g2moeop1ELLhEA+xxIFvQvqVeodSdZXR+F/h8AZ2fNBX9g+bNMrug1t9SJTUbg29acDp3Shmukrx5+azgi8ybL/NLDpWm8qVfSuuyBx/7xiApu4hD2iFQdqSEcsjl2yVydCR2HWASw/DtlxdUaSCM6iFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fbLJq39r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MUkDHP1x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H8LJ6T1872475
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 11:06:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q4ixaJYpWyXs0N5c5hlaCDJ1tgjucLUVDje4oD//Jiw=; b=fbLJq39rXjZu1k9E
	fmL5++/HztL1OrhflZnUN00HemA56HmJ5k0Cfvv2E9BwdkpaPbmAoEhTLJO1puaf
	wYRHu2H2U0Qna1ctpxRUDff3RbruQ6nQA8CRQjdAb0fMHzL9edojLELrzugarRsw
	S7nRf0WImd/ceysRcx4o1toOEgnaPOUj9j3KzG2FKTExZnTWiR0XQwJGINT/cFq2
	kvNKaEq44G+E1xJwW399UJC1+cFJv73iX3IF1Mv2Yx9DVMwbNi6i2a2DVueVfLty
	CLQiwvG1K0YVLYS8H6MHovpUdoWnYvMhR59HDrhZ5cghL9KF5CynFlkMxNJ5e/0e
	5hKSBQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dk2knbrwa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 11:06:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d8c183c2eso4883451cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 04:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776423976; x=1777028776; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q4ixaJYpWyXs0N5c5hlaCDJ1tgjucLUVDje4oD//Jiw=;
        b=MUkDHP1xb8WkGwJxQHy5LHnfU0mPoYsVxZPCoLkS3YQCvWc6vheMeizqCHHGb2RtZz
         riOUecVVbLntybC68RFbYljhI8qUV1ce9A24cvn3n0teBkzK3536WHgkCOBsCBww29ek
         syc7SHnZs7NxnH5mBQRQh+I5ioH79vUV2RFgDlCFoZBNf620d3c+wDP2aUlKdF9upmJL
         EMd3BmrugtizfmZ1lcZUw/SSS58b9DGboSg9MSXgNqQXmzcOXJdudCVFWZVyY+pyNWNF
         fuy0TcVlKQup073BJx1E4xSX4R0PKnzT5XnPOfocTpRUijVAvBRgLOLPKhN960XQffom
         7l8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776423976; x=1777028776;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q4ixaJYpWyXs0N5c5hlaCDJ1tgjucLUVDje4oD//Jiw=;
        b=lhkcy3yRU/OmDfQIXtEwgiN1hX+cMT/rrOJMvpL6SlSFvdM7Zc9ITFVlzacvHnpWfY
         nI7QzcqoXyHnexcyld/IxSm/vWh3/RJlmKB2Mo5TRfS4kTqqvTR/Mp3UrKOciU7A9Kd3
         XPTqmb4+2S35ZsgTAT622C78ZPX8C+fXBwuEvOywCG2OLXn/jlgPouI/w72mX5ndJsix
         Skjh9zsa2FpMRAwbIwxG2Pet/1e6dyhdXWg3WazBdvlxGUFIbjGeuNtPH0F1Wo6H4bgU
         3h2bZ3sbMCMdvsj1T4l/zUnGwPR/UEQed46ENeYmqaiZCXfTKKNFdtQpXeqGWDEGSu/j
         HCkw==
X-Forwarded-Encrypted: i=1; AFNElJ/F/nh+sa8W1jMbVEyKoZUKW/9UEH9nDvU22PWZ1kIJWl4v3Rk4DqBpMTLFb+xXesiV5j+UVuE5qmJnariE@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi9m8qM5vNuYZKmZNY3M0rZN71rvoUCZhLvqt5oaD4t7EwvblA
	NZD9ZiWsse495dYRu9ELy2yQRKf2SUJikpZdH1XrJNkh4eAK0g4jdgPtauBu2wjVTh1vG4kEjxI
	UvY+KGq3Hi4NhA9dFjKvDYPPNhzeSDvcFNQMPslUe4itlPDNNCidAmkl+GY6PYqfDCmhg
X-Gm-Gg: AeBDiev2LlH/j95+JqP2yz13LLTLPbBqUvXkeSh8jem8Q5MmwjLku7xIMCilr+DRMgG
	gZAih939MvXGGeesKCuCkikDxXEI2dII8n5ukugnMu9GDhiF3Lu8DclY37CUVl4IERfGGiAUsVy
	aoF3LS68TgrpgGafwHF6ZcmsCsDj8kUHMt8u+SC6+9NVDSTEa4eIOKjtyzFbQEDTaGSx3xHXAsG
	amz6x+Ww7/zdVSHF8qqvkMCyEU/aIOGWYYsa0o6eAqQwWWCDp4juoT+WMjGnNNSXa26p2BTzyXx
	5s5A8R749gqJZe52VIClM7BWs59GBYCL+y1+VS7djCdUPe55zIIDwh7yEO7rZL+xZnZgFg4rPSr
	er+rOGShXFhLeqpY9bCkZCVfKWIPdVK30+jqRFda3Cavqh0uPECEVAZvYzrBIAKJWC5EzrJ1xpg
	aNIUHUwueUmx7R3g==
X-Received: by 2002:a05:622a:15ca:b0:50b:5286:f756 with SMTP id d75a77b69052e-50e36c51b96mr19278521cf.6.1776423976122;
        Fri, 17 Apr 2026 04:06:16 -0700 (PDT)
X-Received: by 2002:a05:622a:15ca:b0:50b:5286:f756 with SMTP id d75a77b69052e-50e36c51b96mr19277961cf.6.1776423975524;
        Fri, 17 Apr 2026 04:06:15 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455043cdbsm43146566b.46.2026.04.17.04.06.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 04:06:14 -0700 (PDT)
Message-ID: <82e0d347-9ac9-497c-bc67-0db9206c5dd2@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 13:06:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: glymur: Add crypto engine
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com
Cc: Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260416-glymur_crypto_enablement-v1-0-75e768c1417c@oss.qualcomm.com>
 <20260416-glymur_crypto_enablement-v1-2-75e768c1417c@oss.qualcomm.com>
 <653fc8bb-295f-4f1d-b9ac-a33e0d8a933b@oss.qualcomm.com>
 <b8f781b0-f7ba-407e-8603-ca504535a894@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b8f781b0-f7ba-407e-8603-ca504535a894@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9QTZwiEq62Z0L9pf_jOuXnodlynCja_w
X-Authority-Analysis: v=2.4 cv=XNoAjwhE c=1 sm=1 tr=0 ts=69e21428 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=PHqvf1VCJBkSuYI76_kA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 9QTZwiEq62Z0L9pf_jOuXnodlynCja_w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDExMCBTYWx0ZWRfX7RLVJvAw/uRU
 c+/uUcFHMU7MNknXk/cotcInjZ1FNLAaU/i9BRvgj/KOAs4X2kyXg1o9JaCT1zJZqtRycSPLewt
 PBd1U8H6iIxLihAk+mGXQZgv+L/6TfX4WctFp0JuTRuZlCUd4OK59jiIuIQOhovRteevBJIGnSS
 bdK8Vqqses/bPYL+ZM6JEkjncwdY+1QxPj5L6QvzJLUMnEAs0UBonHfr2FnYgn763ErNEMR6vmq
 H67qSe7blNnPk3WZRgbEQsPf1b5ACvgAJHCaO3g3Bl7nwYLVSQWyI5Io9WUOuLXl4o64Qvh9E/V
 RM2wJB+mt1J/gebKKZWnaxA+2+TX1mD/tOfGxy4Girdi39BBBfrixXFbN5A3YTIFW0jFn4ex/6k
 EICRYfrORrtwhfE+PVcEAOwYIU5R1My/8ujuvV90WxbepTmcr3FGiqUSb79+J5L6ylIzIUCwOm/
 Axa3KAscGKP9QOMkYIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170110
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103522-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,f10000:email,1dc4000:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,gondor.apana.org.au,davemloft.net,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: 1B37A41AB7A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/17/26 11:22 AM, Harshal Dev wrote:
> Hi,
> 
> On 4/16/2026 7:10 PM, Konrad Dybcio wrote:
>> On 4/16/26 3:07 PM, Harshal Dev wrote:
>>> On Glymur, there is a crypto engine IP block similar to the ones found on
>>> SM8x50 platforms.
>>>
>>> Describe the crypto engine and its BAM.
>>>
>>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 26 ++++++++++++++++++++++++++
>>>  1 file changed, 26 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>> index f23cf81ddb77..e8c796f2c572 100644
>>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>> @@ -3675,6 +3675,32 @@ pcie3b_phy: phy@f10000 {
>>>  			status = "disabled";
>>>  		};
>>>  
>>> +		cryptobam: dma-controller@1dc4000 {
>>> +			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
>>> +			reg = <0x0 0x01dc4000 0x0 0x28000>;
>>> +			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
>>> +			#dma-cells = <1>;
>>> +			iommus = <&apps_smmu 0x480 0x0>,
>>> +				 <&apps_smmu 0x481 0x0>;
>>
>> It seems like these aren't the right SIDs on this platform.. Have you
>> tested this patch on hw?
> 
> Thanks a lot for catching this Konrad. The correct SID pairs are <0x80 0x0> and <0x81 0x0>.
> (I hope I don't need to pad them?)

No, you don't

> 
> Unfortunately, I could only validate driver probe on my limited ramdisk environment:
> 
> [    4.583802] qcrypto 1dfa000.crypto: Crypto device found, version 5.9.1
> 
> I was waiting for Wenjia to run the full crypto user-space test suite once. I'll update the
> SIDs and wait for a Tested-by from him.

Thanks

I think you should be able to get some life out of the crypto engine
via CONFIG_EXPERT=y && CONFIG_CRYPTO_SELFTESTS=y (which btw +Hans
mentioned reports a failure on Hamoa)

Konrad

