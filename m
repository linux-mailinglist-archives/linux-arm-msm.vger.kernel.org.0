Return-Path: <linux-arm-msm+bounces-98333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBLnLLtTumm8UQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 08:26:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B992B6EBB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 08:26:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 603BA3094627
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 07:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02CDF36A03A;
	Wed, 18 Mar 2026 07:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B5MKpL9w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kqkX/5SM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FF7369999
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 07:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773818491; cv=none; b=OL65AnfwlgDjgRqotUPiMFnL5ExfPx1CSfTrG7IS5fszP7qddNG/dQ1h30aQB/A8raixY8gkNukl38EMc/8ld0yAIXkhHsIODTvh7JRcWX5L0M1jq+bo0r2WaZtwRTcojCQSUdA9dmFRuMXTGqI61vLIf4DWn3axcIXKPfUv/fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773818491; c=relaxed/simple;
	bh=Zg5AMgU+Rfbc6lXhdJRs/m90+7lDT7VWHZ0ukmlenNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h9+AB3Izx+xjO0yGY3Ma1fy5prWhA93OcFRKeaZmaMSsVKCLMZenqhamumXIHhUbkIw0ATeRgMNd7BrsyeNwMQaNTT0GJfhmG0kTgXCWaMwuZJ3LETq4hnR3E79jJ6iXS2TpQ+eQX/K3V/Qpkv1NrSGxCuvmj/pK2RaTuT01oRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B5MKpL9w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kqkX/5SM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I37Vkq1632399
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 07:21:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YylNgRIFLdDGow16+9WuHWE7gEEdV3w331tMJHgwFVE=; b=B5MKpL9wxZO1hv95
	3H3e8e8jZSxzeg/GlIrj42LJg5/klTvj6tNtab5vdccOwxbvyCM2N5IvkFD6UNU9
	ukoE4VbvTPk7Ss8bfwi+YiB6P9s1oWWRMmsr/nrtFvR73Kuu4Oouk+P0ba60MRi6
	WW+ToHCyVje0wTWb3+NehMYWM+RmiRWqgHiDHDT1MoAcgo16qHsWy6Xwg5O+LE7O
	rqxTUaBb/mxCfM+otbuZRyVALxArUg/EPzKKDzcWfPrbr0AA8YpfUWyKXlofkrU8
	5sLX8O5ngK5AQ9brOk25h1UORVRj0HssfOsVfs0nWKTv1YMzg+Kgo49c+ptj8hPX
	s1T33Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyapujycx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 07:21:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b0565d77a6so37177735ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 00:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773818488; x=1774423288; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YylNgRIFLdDGow16+9WuHWE7gEEdV3w331tMJHgwFVE=;
        b=kqkX/5SMbd3+jdqaBfIuE5Z/q3C1Vz3F3w8QyRm28b3ZSwTQVt3hEug0PqiIWK11l4
         6HiahNAUMXc/JYRfJT+T2CJUAHJUAMLmG0hQ84GZU8R8RZ8O4EpDan7rv70JVvoNdE61
         a0MrCdx8r388C7cDRIHv18qjbaDToxyw43BOY48dW1jI2R8uduKJxVvxO2ftENexSdF8
         QKzznw4gUSI0LUASqb7gm/9iwcKBv45kIUzLyTwf/47zX5TVnConQYTch9/SIQZV/DbA
         PeNL7dGwjeJ51KvYAQYLg6Yw3wiFKKPBOU6Lgxh8wOS4WeEOVRKBsBgv7xJdEkW3pmSP
         /HDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773818488; x=1774423288;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YylNgRIFLdDGow16+9WuHWE7gEEdV3w331tMJHgwFVE=;
        b=EMp67F9KRxdnsIsEFC9JVCRpxpGJef+w8o6Z84eI5acI6mZRXyAAYREpJqPC6Dqtie
         DqgR91ZkSYVQervziAYVP8HLybhqDF2nku7wpOps25580j3V/kcYsbae617WfCUh7mx5
         xQBgFDBZncoNV3UT0PdtQxOJuJAgvIgDyUzO2W8Zhl840nI/iEBhMjcfyrTWRjTKcpRu
         ohOUTIulf3hY8z6cmPemnAAbCydj9u6WE2gn/rGdjG54yz+VGxdoMnpz14d+zwat0Qq9
         rkQfzI9qOAH0nJJJdjFtvG72JkkbKui4nhrdDf2J+AbnJc/5KxLj7RkWyMknWOMvxOEh
         3J8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXIrx5M+DNyl9UrptdPPkytjT4VuAA1nQE8UpHlQFbDRX4WxMhq4uMB49DiMZtN2MtYp/EdPB9pezb0MHLA@vger.kernel.org
X-Gm-Message-State: AOJu0YwkwD+fOIqULU/Um+2aMXOzjROqwKuyL+xe9sMyF3ZS8jjT9Q4Q
	/bZ0jD3kAHk/wD/kHXnWIR4aX+l3HwqM4J72wcc7tHItpjU4KjT+MbPn2hMRtNSm+VpZusG62EB
	KjMM2MvV2P0Kr85vLsV9sD6lNfoGCwRPauh5UG6uLLF2hwfaOGX9dW3h2JubPSvZ5ZO/i8twHYJ
	5b
X-Gm-Gg: ATEYQzy/6QmHKLbfb6qGh4DI9elhBoGNjm+XjlcSbGwld64zki4DOrNCqmD/BYIkHGD
	Y3/uKCCnsdlzkcRixS+3ZCrvuahz4CiReCVATv9Ppr2nW+aD5gFfTE252RoX6LCK1QKSFN+8ejB
	krXmuJNNOhr4vLsIDChvMmqlGhOJtpN1AioAZJp05zB4C1zXBflNAV19NU7EdPYqcz4e3P61JEE
	VVWxEMlrj/jNB7FSJcKUwSOxSwO7TqKS/ky2uHbfB8Z9aweVotPTYfbHbCwjysroNDQimH1eXTn
	ph9Z3a4MD6uKu1WoiLNyl9+L9JNtD/IJwCUF1I5R/GGTZP3C7KXj+TdJnWbKmcpZwdGscNsEZaD
	HmHlR6CKwhm7FvxNB2D8ClJDQeDh6/H3qT82uVoOJ9FU/mOmsLs8=
X-Received: by 2002:a17:902:e94d:b0:2b0:608d:d8a8 with SMTP id d9443c01a7336-2b06e3230femr23641395ad.1.1773818488375;
        Wed, 18 Mar 2026 00:21:28 -0700 (PDT)
X-Received: by 2002:a17:902:e94d:b0:2b0:608d:d8a8 with SMTP id d9443c01a7336-2b06e3230femr23641015ad.1.1773818487824;
        Wed, 18 Mar 2026 00:21:27 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e619ec3sm17610455ad.69.2026.03.18.00.21.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 00:21:27 -0700 (PDT)
Message-ID: <1b1028b3-22c9-4b00-952f-804f192d8870@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 12:51:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/12] dt-bindings: crypto: qcom,ice: Allow
 power-domain and iface clk
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
References: <20260317-qcom_ice_power_and_clk_vote-v3-0-53371dbabd6a@oss.qualcomm.com>
 <20260317-qcom_ice_power_and_clk_vote-v3-1-53371dbabd6a@oss.qualcomm.com>
 <do62iaopjcahvn576gfcdbyo4yxudf4uit2sbifvjw3pwrlb7j@higm25fdesk3>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <do62iaopjcahvn576gfcdbyo4yxudf4uit2sbifvjw3pwrlb7j@higm25fdesk3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bKIb4f+Z c=1 sm=1 tr=0 ts=69ba5279 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=vZp64IP-UYAUPCcu32UA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA2MSBTYWx0ZWRfXxuGcL/bAYP+R
 sL6Y5Y09DqMvlH+JSPtPqpiFqFeKCDKmr/ofTa8fUMT1epAm+7wOkI4EVZyCI72ZOUmrg/AEOLy
 4QdC5ruijxRnN0zPdTojloExVVs6QnAjtZle4TM73kx2eDHWjAQK+rEDPV8D/N6Rf7fBjbxN40o
 MQimUdV1tl69u1tyyHJinwccd03sRh0hACcoebPC4xwOjrpxN9tDYeQdioiSF7JkQ+EOv1WTMWI
 +5wxppz2zlp3iV1ZkKA6NuyGnG6MmDZBktTImViKbiGqOqgEzhG2sSdc2/x5dJc+USl3GSnHL0V
 Xz76GMho/S7pCK/VxgQ7P751+5Huq03NuktRnsKpIqeZM4jibgKspUyOs2ttiU4pfTVOZciGKb3
 013HqvLd8tzojfRu068c2dZZBT2uq2LroXBoMrDkqfVUQTR5guq4NkADvsCZFGmmcw4sSvVCCN4
 t54MCu+YLDt/jIAwmlg==
X-Proofpoint-GUID: 9md2863zpyKvLxRwlP7J4Ps2FLpNUYtF
X-Proofpoint-ORIG-GUID: 9md2863zpyKvLxRwlP7J4Ps2FLpNUYtF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180061
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me,redhat.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-98333-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 54B992B6EBB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dmitry ,

On 3/17/2026 8:42 PM, Dmitry Baryshkov wrote:
> On Tue, Mar 17, 2026 at 02:50:40PM +0530, Harshal Dev wrote:
>> Update the inline-crypto engine DT binding in a backward compatible manner
>> to allow specifying up to two clocks along with their names and associated
>> power-domain.
> 
> This should come after the "why" part.

Ack.

> 
>>
>> When the 'clk_ignore_unused' flag is not passed on the kernel command line
>> occasional unclocked ICE hardware register access are observed when the
>> kernel disables the unused 'iface' clock before ICE can probe. On the other
>> hand, when the 'pd_ignore_unused' flag is not passed on the command line,
>> clock 'stuck' issues are observed if the power-domain required by ICE
>> hardware is unused and thus disabled before ICE probe could happen.
> 
> You can simply say that ICE requires these clocks and these power
> domains to function. Accessing the hardware can fail if they are
> disabled by the kernel for whater reasons.
>

Ack.

>>
>> To avoid these scenarios, the 'iface' clock and the associated power-domain
>> should be specified in the ICE device tree node and enabled by ICE.
>>
>> Fixes: f6ff91a47ac57 ("dt-bindings: crypto: Add Qualcomm Inline Crypto Engine")
>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>> ---
>>  .../bindings/crypto/qcom,inline-crypto-engine.yaml       | 16 +++++++++++++++-
>>  1 file changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>> index 876bf90ed96e..99c541e7fa8c 100644
>> --- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>> +++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>> @@ -30,6 +30,16 @@ properties:
>>      maxItems: 1
>>  
>>    clocks:
>> +    minItems: 1
>> +    maxItems: 2
>> +
>> +  clock-names:
>> +    minItems: 1
>> +    items:
>> +      - const: core
>> +      - const: iface
>> +
>> +  power-domains:
>>      maxItems: 1
>>  
>>    operating-points-v2: true
>> @@ -52,7 +62,11 @@ examples:
>>        compatible = "qcom,sm8550-inline-crypto-engine",
>>                     "qcom,inline-crypto-engine";
>>        reg = <0x01d88000 0x8000>;
>> -      clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
>> +      clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
>> +               <&gcc GCC_UFS_PHY_AHB_CLK>;
>> +      clock-names = "core",
>> +                    "iface";
> 
> We don't actually need names here. You can use indices instead, making
> the change completely backwards-compatible.
>

I do not have very concrete objections to this. But introducing the clock
names isn't breaking backward compatibility either. I wanted to continue
using the names since the ICE driver has been following the tradition of
referring these clocks via names since it was part of the UFS/EMMC driver.

This also helps me avoid touching the ICE driver source code for specifying
the index of the clocks.

Let me know if continuing to use the names is a no-go from you for some
other reason.

Thanks,
Harshal

 
>> +      power-domains = <&gcc UFS_PHY_GDSC>;
>>  
>>        operating-points-v2 = <&ice_opp_table>;
>>  
>>
>> -- 
>> 2.34.1
>>
> 


