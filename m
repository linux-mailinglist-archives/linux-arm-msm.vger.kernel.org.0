Return-Path: <linux-arm-msm+bounces-103537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LhEJgw54ml73gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 15:43:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2959741BC55
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 15:43:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8CAD630F2F45
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 13:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 265E078F2E;
	Fri, 17 Apr 2026 13:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="feJRt25q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AMGu+fsS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FDF2AEE1
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 13:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776433154; cv=none; b=dP+J1S3OGGdxTF8hHcZpHyIuDc2y1RPQDyhUj1EyV7lJiBxJzXmTB9PP2jsr6T7ip7FcR1dAMuhDlkZnBDYoI/21ebpXzI+UPH2rvHOtYkjMuZcfyJmXm8IP61KgT3IC9RSYnRinSgePLdkgj1VSOU4VLejnZLiw1vYTBUjHY7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776433154; c=relaxed/simple;
	bh=t7cDliQXykgBo+DCx8KGKV7xEmgslwFTXM5ZKUO+gQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oof+iz3quyO4aynBUYUjrUCReuJIqDEOJGIOvuwXDwnnYyX+QHJZxjN2T53VsGshYqerlAg3YBo94lNcwiud8UZ0FnJ0SKr372zPp4/kTd6yDf8hRIybDbujopamqSaOkZ6xWHNW5U+Gt3YhOvKrWX0QcS69GFhVx4bNrSlbjH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=feJRt25q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AMGu+fsS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HCgtOx3438518
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 13:39:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LEV3M/S5NAu+rB8Y3D2M+b+TS/8kFcI0Azn+lMsweqQ=; b=feJRt25q4WzgUEAR
	4WVfVvlSKLpGj4hIBWgd77npJcAZOesM2C0bGxw6cH48+tCT7cdrXZYauu0PxP6R
	5ML1I8CQDTs0PfkXSkAvSaQC+8cHvPjbGNBA3tcQjG7kiEKJf2SXSwE+xAsokKM8
	IjltaVzAPTqAF9bgYHCKEwoxE9OCNEDGw8aMQblpiZZ1n3V1fvf4g1dOWApOMM8x
	U6RqtmEADlmseFdu8PBVfLpEhDlprzkyV7Nd1L60ubL52bCZVQ3hroE9PCBEUhAx
	BYVwDsmaQrpjQVtMme91Tx3ley6jpx3EzDo6+TRnYfJD/BCRggRVTNC+LSK7gBT1
	fufFDw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkg88sejp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 13:39:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35fbc53b64bso861093a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 06:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776433143; x=1777037943; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LEV3M/S5NAu+rB8Y3D2M+b+TS/8kFcI0Azn+lMsweqQ=;
        b=AMGu+fsSj4VLP6GK49K/1ye+/9bISx/wTY8/jmDsTQsN1AzojmSUiDj3RJwxklK7A9
         lgdO+hbKyEPe4VC5f97m3MwOjn6CfB4qEx8hfinmpuB5VuZlrtxgl2Bff7s+J0s0x6+W
         LowMngZc/6+/vV29Ov42NwibgX3vZEj4sZ4j9IrP+3DSi/xhBl5OW2Ni97Bp/aboP6QB
         8dueOdUbnuor7LJzOHaFIRdvYNSexN2p1itNxy55SJHbcb7eyP69tqjynVcww6eE9dik
         saz6qYpNMiJTGK5xRWwO1W+FeqWPn22EF2CfG2ImodyE7g2JhUject3v0ybZ6MXj5wIv
         d8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776433143; x=1777037943;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LEV3M/S5NAu+rB8Y3D2M+b+TS/8kFcI0Azn+lMsweqQ=;
        b=YkMKGABSUlKC8YivY8Li2WjRZzWjNh35ifi+TR6/s/e8NZY5q14O+V3pfJKb15jf73
         osEVQ0nEwS7oD8hvYsjNWNtKnZw1yAcsSMimZqHBoJxe1OF9JkV6FJIiL0fXmA9uxuys
         s0ScXHFJxqS/A30MLy8Kit4XzUdoS093s+dY4qWz55W2nMZvjLK0oMGv8jjnCyzwU8Mr
         dHJf6TqvWWWVi3fObB/ap4l4EBxbhajp1+50d+3+XzLaC72Fl2o3FpkJ+bXY1x4XmJMr
         9eVDnxnmE0BJpajmcIbDE0eSOK8NznknGDddyNFNP27ryUE3yMhqYzjX87Gt3rHjl09Z
         mCtg==
X-Forwarded-Encrypted: i=1; AFNElJ+DtbkMikSS9FJlnaY9dZhWVsRjF+eVC0ZGAynaXHKKYX0xYMnuu4JLxK1TlKy6dZTxZZt8qKA4Az9SdTsT@vger.kernel.org
X-Gm-Message-State: AOJu0YxwULsjpc49kqnHKUMSLBJAHKIsDKLDtcjFjCEppjdS3Txoao/v
	4Yxiw+a29dU++Bty+4R2dqciIrSodrNJgD6SFilyDW4z/OdxMcagNt/6dwb7dCNXJbo/X6bRVhC
	OuLdfWfowRMSe0AuY/npm7vExJiaPcU6YTLHFlKoTMYKfKGCqqgQ7QOWse95+00WeE49f
X-Gm-Gg: AeBDievhxW8YMLAMABH6SPYpYXqR+svrG6jVoOZNn+vi0l81g20iMlx/CXrWGPAsF+l
	BMs+ZrKnHs8qtZNRlGpdrWROiIKKjv7KvsMcJcS/QoBiqItnU/sP7g7l5Q580CZqL2wzWAUBkWB
	uqBYLTcpM+E1CM+tNw0O2pSLQIsgYtvlo3UGpgi6gIDRMHlZyu/7J9SkXL+t2M0VCe/Oil5Fw41
	dXZbaTt9pgWcocjvDXp+NCPH2CbMttsTCP392u2yI+a5qzE+UGetLTpTx9eLodG92QGDjYgMiBe
	jIIFPbj1JyTNjAieN3vtvp9XjjDZVED/3cK0Q4ls+DsZ7gwj+i29ZtDDiCvaVPnKA0ihtJIJK1G
	nYrT95zhtc+i+f1KTQRFp0xcJaARN4LMF8iviAYaOJfbJ66xVSHoIW7g8fgPjTQ==
X-Received: by 2002:a17:90b:528c:b0:359:f2e1:5906 with SMTP id 98e67ed59e1d1-361403bdcb1mr2847252a91.4.1776433143223;
        Fri, 17 Apr 2026 06:39:03 -0700 (PDT)
X-Received: by 2002:a17:90b:528c:b0:359:f2e1:5906 with SMTP id 98e67ed59e1d1-361403bdcb1mr2847215a91.4.1776433142753;
        Fri, 17 Apr 2026 06:39:02 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36141990bb6sm2265184a91.17.2026.04.17.06.38.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 06:39:02 -0700 (PDT)
Message-ID: <0d5bf2bd-b90c-4814-bd2e-126a9bcb82ce@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 19:08:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: glymur: Add crypto engine
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <82e0d347-9ac9-497c-bc67-0db9206c5dd2@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <82e0d347-9ac9-497c-bc67-0db9206c5dd2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: C8IJNFn6B9uXYb_Y5NiK7k_x_aLVXAXe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDEzNyBTYWx0ZWRfX/q3BxhUEROlA
 qOTyAu4ldvzt5eASWGmlYHJJAfDHcC2A6XA7uFy0AVfNi0VXzJJuB8ZLLcXtkfXCdIRNENWKvvx
 rL42yD5TW9uP+95eZ4KUDhh7PCEFLbiqQor0WGfukbtWvLGQ7LZXiw9tF1XLCQbC9bhn4XYdjXY
 q3PPgHL/+R6VeBjcp8VqtakuhuCI7/8Rhc/bzWG7gGjd7Yr+hokVXAFy4c5Ri0wXgZd04A8iEqm
 Njxoo4dJeOiOG91cnU/Lo4RIAkICtQ3B5QMO9zWbjRjMfS7aDoISSr+tLEv5o3iLmoGSrujJbWA
 atVVv/HT9nOUdIAH37AyPfZ8RjVA8WQnqIbvKPDI3cQ6P7xfahehB9ASl3CZ0o6806g3w8HYZ3V
 GF1vz7roYU84cDmarBysG/heHuPrrELkikvhhrB6gi9S4WqVTJ/wXw0E3C8Y62yUIqEo9yPN6r1
 YALWwKVRHr0YoCmRH9g==
X-Authority-Analysis: v=2.4 cv=X+Fi7mTe c=1 sm=1 tr=0 ts=69e237f8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=-7XOZWLW2PA2tXdyhFAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: C8IJNFn6B9uXYb_Y5NiK7k_x_aLVXAXe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170137
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103537-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,f10000:email,1dc4000:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,gondor.apana.org.au,davemloft.net,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2959741BC55
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/17/2026 4:36 PM, Konrad Dybcio wrote:
> On 4/17/26 11:22 AM, Harshal Dev wrote:
>> Hi,
>>
>> On 4/16/2026 7:10 PM, Konrad Dybcio wrote:
>>> On 4/16/26 3:07 PM, Harshal Dev wrote:
>>>> On Glymur, there is a crypto engine IP block similar to the ones found on
>>>> SM8x50 platforms.
>>>>
>>>> Describe the crypto engine and its BAM.
>>>>
>>>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 26 ++++++++++++++++++++++++++
>>>>  1 file changed, 26 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>>> index f23cf81ddb77..e8c796f2c572 100644
>>>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>>> @@ -3675,6 +3675,32 @@ pcie3b_phy: phy@f10000 {
>>>>  			status = "disabled";
>>>>  		};
>>>>  
>>>> +		cryptobam: dma-controller@1dc4000 {
>>>> +			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
>>>> +			reg = <0x0 0x01dc4000 0x0 0x28000>;
>>>> +			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
>>>> +			#dma-cells = <1>;
>>>> +			iommus = <&apps_smmu 0x480 0x0>,
>>>> +				 <&apps_smmu 0x481 0x0>;
>>>
>>> It seems like these aren't the right SIDs on this platform.. Have you
>>> tested this patch on hw?
>>
>> Thanks a lot for catching this Konrad. The correct SID pairs are <0x80 0x0> and <0x81 0x0>.
>> (I hope I don't need to pad them?)
> 
> No, you don't

Ack.

> 
>>
>> Unfortunately, I could only validate driver probe on my limited ramdisk environment:
>>
>> [    4.583802] qcrypto 1dfa000.crypto: Crypto device found, version 5.9.1
>>
>> I was waiting for Wenjia to run the full crypto user-space test suite once. I'll update the
>> SIDs and wait for a Tested-by from him.
> 
> Thanks
> 
> I think you should be able to get some life out of the crypto engine
> via CONFIG_EXPERT=y && CONFIG_CRYPTO_SELFTESTS=y (which btw +Hans
> mentioned reports a failure on Hamoa)

Sure, I'll try this, could you also point me to the bug report?

Regards,
Harshal

> 
> Konrad


