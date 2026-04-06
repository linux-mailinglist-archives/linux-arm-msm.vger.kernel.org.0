Return-Path: <linux-arm-msm+bounces-101929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODOIJR9u02mjiAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 10:26:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F373A232B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 10:26:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2CB4B30055D0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 08:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B08862F7AAB;
	Mon,  6 Apr 2026 08:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fsDUwhot";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PBWL1pLm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6762031196F
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 08:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775463960; cv=none; b=OrgIPi2oQ1Jmjb/Exfvg7IlC2DZlo4VM54vTPGgzWPXbkGW3KzN83l5E7ZbTcTHLVxFDs7+48hsO8LMbxp+FeVYNFx3wRGCWQ22AWPqQjgMwLV8Grur/gmIYA5l+auRIyp5TGZWT5jq/e2RzRlqhtUbqATIXo81ecr6qGFI6mWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775463960; c=relaxed/simple;
	bh=tyWK96ZWWKZnO+q9rIXpNByqGHb/OnJPr2cUQ1sKBws=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=lUx3mFk64+wr+m2oE9FLxfyAQE9dxbwC5+DXxk658gDBeXZZNTtIJMz+RoDFwPIWpOxxaVQBc8BpTO7kFUejlMLljNoGR+GDxJlgNsM7gR5QvqxGebwXy0J+k3T1Iv6OSdxCx3cGB1WuFFvhKhUSiAjr0IriC91ZMmfW5ivXvOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fsDUwhot; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PBWL1pLm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 635Lss0L3722967
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 08:25:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MOrTBocZl5kySfciOGvZUv9NqCenxGWPRnDVcRlP+6o=; b=fsDUwhotpLBuj2kO
	yvZg0S99iJu1Vs4cYJb4qpEMwShEUoeFNqfD0wFjLAZ4kSl++idXi783epGxhVh9
	HoB9+SZTkiHGPysckwkX6uKRBroKreInHUWDa31DQYTksxZyxc7n6RnxjSAsAaor
	IIpoxyDBjyrVzZryCLzvITS/WcX3tJgpis0sdqp19loiXxUdA5ESrfOzCosM8NxA
	tDsGhgqHDS44PJe5NuBIPZkI2FNk724sERoAIZhE0i9bam8JV+Xv6c8x3TuRmGPH
	4IeZTHf+qqSG3+dOyU08E1V7FzxXzIJ0YmneOzPa/+H4E15pK4lYH8qULpzzjgEz
	hhGKwg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dauthcda9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 08:25:57 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82c70d1f65aso2138190b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 01:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775463957; x=1776068757; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MOrTBocZl5kySfciOGvZUv9NqCenxGWPRnDVcRlP+6o=;
        b=PBWL1pLmmj+Qo61pIwddbDBLOd9sYns/aTvvmTdSpq0l8A8wBHGRhAwESSaq8PU84p
         dr22JbPv2i7KqGt2ZjvX8EFyOvaS3JlmB1DDe9DofFaQsFW7rVvu2CcDNmh8Ih2X9JoR
         xIkAwnyM6XwowcxO06fHrDfdUMi5aG91pXDSc8SqE/w+x6NIaYcM/efhtjwgpmsQ0o56
         GOFlQamlVlaX2gM8OevEk2kwuCdtToFcJ6iukli2xGNNehelKZAaRCEo5hFQMbHiXcbS
         gfZ6B0cDK0Qvp4HuKegqXlAmhZybj+OhgBs7Y8pn+TRU5o1nIN2QVhyZqin4umRvMilg
         lskQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775463957; x=1776068757;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MOrTBocZl5kySfciOGvZUv9NqCenxGWPRnDVcRlP+6o=;
        b=V7/YrbuFNvlXAnCkeEzd3B3JHH6ipQrX+mJxMW9pamUUufBu9XvLj7WrTyebmT6gXt
         zkXQSbu1SjgWuWibAsV3MttSQGAR55ThYGIEAMeDBhDxnICNxE473rBoRcQHdwde1fuV
         EEg9AUdaevc7xR/Q10nCxAP8m7TCOOXI0qxvzC+tMhgL1eANeloq+fImaDbi4bCBvk1M
         2oZb0sDOX0K6Bi+cRnFEGRiJKSGF03aIcDJhsBr3zvLa8exoJ3FRxwsif9aahTdZqRKx
         cJkI33zxqixqHqeNcKTOH80mpATtjihpYI6/BafsqCiYHKsg4HGI99cykXtui045F48D
         2ERw==
X-Forwarded-Encrypted: i=1; AJvYcCVgkpr0xYYti+BYQZPcQzmP/WVlXYLVG1gn52JvIWbO6SR+u5o06dOLvLiNN6BcRzUOTQQnRoaq4RVCbrOk@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+wFfoR6E1iYg+OV9Ju2SDlEe7pqG9LI38o/D4164kN/z/6l+X
	c9cYpWr3lXLstjwsG4bRwzBeZt9naDTwU/hHkBsIEHpRl8qLLy+W8gjTlB0iKFex4qHHLr/Cw97
	Mi9kwFdM6SxQEfrvTt3f46qI0OIXqaPiMp7X71N44aDBTlLU55htcpK342LDrp8u0l6iB
X-Gm-Gg: AeBDievM9vBCDdYla4dNqlFcb3HTabtJuZCLVT/q2H+A/J4jgmSHUsxLUexqsBd8/S7
	BOhysXdb8Q43EoBE9ndlus6Azs+1c0ClnXhRyeD1PJBS1I37iSX65LBXPrx8Ox6x7CAuzeBIpQM
	CYe6RPHbygC8aZA/arvQMR1zCkZIh/azsuQ18+6tYFMObEicFm9wMLctjE2OYta/YA4zgk6AmnG
	KF2dYij/QBpKfVyZkJjVJ7kH0+nU2+qe+gu1R7rCYxhJJ69RAq058JIonV2vD8h93ViJHRw4ZM9
	xcg1ZxHVeLJeZXBR/Nc8jW5CuoayIr279QrpmTo5jla5HYRriaVwmNo/n0lFQMEhfBmQ6ctURd1
	aNcg/h9E6ATpZ5JMPL/feyfvmA3XC4KfU8kEZr/1KMR86gp5D3mY=
X-Received: by 2002:a05:6a00:c92:b0:82c:d6d3:3197 with SMTP id d2e1a72fcca58-82d0daadb73mr12018064b3a.23.1775463956917;
        Mon, 06 Apr 2026 01:25:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:c92:b0:82c:d6d3:3197 with SMTP id d2e1a72fcca58-82d0daadb73mr12018025b3a.23.1775463956288;
        Mon, 06 Apr 2026 01:25:56 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b5fb22sm16753198b3a.26.2026.04.06.01.25.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 01:25:55 -0700 (PDT)
Message-ID: <89d95bae-01d3-44b8-b3b6-5e70074d272e@oss.qualcomm.com>
Date: Mon, 6 Apr 2026 13:55:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/11] dt-bindings: crypto: qcom,ice: Fix missing
 power-domain and iface clk
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com>
 <20260323-qcom_ice_power_and_clk_vote-v4-1-e36044bbdfe9@oss.qualcomm.com>
 <873e8ad2-50cd-4c09-9a51-20ad745fe8dc@oss.qualcomm.com>
 <2b71dd68-ff35-411e-905d-3ffa2ea3efe4@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <2b71dd68-ff35-411e-905d-3ffa2ea3efe4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDA4MSBTYWx0ZWRfX3r4frQxYQGcV
 hKFscPXGb/bZK1DYYwI0Gm6VPIQ5sMLfDKoQa6c34sOeA6T1kmXxu9Ay1LfXZrSqr/Sqfuo/Qxi
 AepMMEWSnc0Csy6q0XsxPdBjcsrbKf80Gl8/Txxm7sn1V8gUyNiyCdSv1/dxsdaTVkZ5axCmoYn
 A2iDzbd4XDE5x11tGFp4O9iN4ObRqVoJmgJ4I3k1qUnq+D5geV6xx02rypZr5q3fPsZzHh/6uFk
 8WtrlhkqViB8SpjDfDExdJs5Tfgl+0pd0ZWvnyXBOqgmKhGgVI0buXzGO5xZ7eXyJyzO6UxS7N3
 uwYM5tZ0cvfdR7CFfP+AGBIv5GsjFD3gR3Jces+VjoBfGOkUswsz6KO/CmeEc1e8geTOAa4o/rP
 14Q6fsCLciAS7DWmApPtgnDAUp0SHcvfiq4MlP0jC0ihckMSHLiUdUCcV62SEUV5Cp7hdn0Tjdb
 PhV96b15HoLsCttrfeQ==
X-Proofpoint-GUID: McHFKHHaRVAkn7BzzW0py-dkA6IthsZi
X-Authority-Analysis: v=2.4 cv=MIptWcZl c=1 sm=1 tr=0 ts=69d36e15 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=qoNIJ1LOUDDmZ2oDbzIA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: McHFKHHaRVAkn7BzzW0py-dkA6IthsZi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604060081
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101929-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gondor.apana.org.au,davemloft.net,kernel.org,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E3F373A232B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Krzysztof,

May I request your review on this commit once again. Hopefully I have resolved
the issues pointed out in the previous version of this commit.

Thank you very much,
Harshal

On 3/31/2026 3:10 PM, Harshal Dev wrote:
> Hi Kuldeep,
> 
> On 3/24/2026 4:16 PM, Kuldeep Singh wrote:
>>
>> On 3/23/2026 2:47 PM, Harshal Dev wrote:
>>> The DT bindings for inline-crypto engine do not specify the UFS_PHY_GDSC
>>> power-domain and iface clock. Without enabling the iface clock and the
>>> associated power-domain the ICE hardware cannot function correctly and
>>> leads to unclocked hardware accesses being observed during probe.
>>>
>>> Fix the DT bindings for inline-crypto engine to require the UFS_PHY_GDSC
>>> power-domain and iface clock for new devices (Eliza and Milos) introduced
>>> in the current release (7.0) with yet-to-stabilize ABI, while preserving
>>> backward compatibility for older devices.
>>>
>>> Fixes: 618195a7ac3df ("dt-bindings: crypto: qcom,inline-crypto-engine: Document the Eliza ICE")
>>> Fixes: 85faec1e85555 ("dt-bindings: crypto: qcom,inline-crypto-engine: document the Milos ICE")
>>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>>> ---
>>>  .../bindings/crypto/qcom,inline-crypto-engine.yaml | 35 +++++++++++++++++++++-
>>>  1 file changed, 34 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>>> index 876bf90ed96e..ccb6b8dd8e11 100644
>>> --- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>>> +++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>>> @@ -30,6 +30,16 @@ properties:
>>>      maxItems: 1
>>>  
>>>    clocks:
>>> +    minItems: 1
>>> +    maxItems: 2
>>> +
>>> +  clock-names:
>>> +    minItems: 1
>>> +    items:
>>> +      - const: core
>>> +      - const: iface
>>> +
>>> +  power-domains:
>>>      maxItems: 1
>>>  
>>>    operating-points-v2: true
>>> @@ -44,6 +54,25 @@ required:
>>>  
>>>  additionalProperties: false
>>>  
>>> +allOf:
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            enum:
>>> +              - qcom,eliza-inline-crypto-engine
>>> +              - qcom,milos-inline-crypto-engine
>>> +
>>> +    then:
>>> +      required:
>>> +        - power-domains
>>> +        - clock-names
>>> +      properties:
>>> +        clocks:
>>> +          minItems: 2
>>> +        clock-names:
>>> +          minItems: 2
>>> +
>>
>> Hi Krzysztof,
>>
>> As motive here is to enforce 2 clocks for upcoming targets and keep
>> minItems as 1 for already merged ones for ensuring backward
>> compatibility. Can we do like below?
>>
>> allOf:
>>   - if:
>>       not:
>>         properties:
>>           compatible:
>>             contains:
>>               enum:
>>                 - qcom,kaanapali-inline-crypto-engine
>>                 - qcom,qcs8300-inline-crypto-engine
>>                 - qcom,sa8775p-inline-crypto-engine
>>                 - qcom,sc7180-inline-crypto-engine
>>                 - qcom,sc7280-inline-crypto-engine
>>                 - qcom,sm8450-inline-crypto-engine
>>                 - qcom,sm8550-inline-crypto-engine
>>                 - qcom,sm8650-inline-crypto-engine
>>                 - qcom,sm8750-inline-crypto-engine
>>
>>     then:
>>       required:
>>         - power-domains
>>         - clock-names
>>       properties:
>>         clocks:
>>           minItems: 2
>>         clock-names:
>>           minItems: 2
>>
>> This will ensure for every new target addition, default clock count is
>> enforced as 2 default.
>> Please share your thoughts as well.
>>
> 
> I don't really have any particular objections to this proposal, but I can
> see that other bindings where the need for an additional clock was realized
> later on use a similar pattern as this patchset does:
> https://elixir.bootlin.com/linux/v7.0-rc2/source/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
> 
> I'll wait for Krzysztof to take a final call on this.
> 
> Regards,
> Harshal
> 


