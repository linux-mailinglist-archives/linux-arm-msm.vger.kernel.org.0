Return-Path: <linux-arm-msm+bounces-97441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBB3Ew/5s2nWeQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 12:46:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A73862826D5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 12:46:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9288301D68D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0005F383C61;
	Fri, 13 Mar 2026 11:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ottyQ+4t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ORC3YwAP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA20317143
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 11:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773402369; cv=none; b=R7KwCWz4yS/fRJsVJ+sFZk+/MXrQnn30oAdvTJ/g4GdyIy0b14uFub1SzaAtHc44OCsUyhs9a3z6kzSjoscK2x3Ukkmk3fQtpXWfJ2wfmP+7Eej0rTs+VZUO0f0RGK6KS+HY/PrE6l4U5n1fiwNG06C7u3xhirzVBCZhMychqws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773402369; c=relaxed/simple;
	bh=p9gRUw/1sa+IWFsrR/fQYGevFbp+SQEbBTw0TZ645PA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GuREkhTC6gYmqky26rbFUs4S64Wvb5JTJAq1vBK6MPMwp6PKnNXRrmc7DdUGur39wkBnBAbYUPtis5dP6eaur9X5az03zs6gCmJwHxV25vmZxlDEOfYGDcPSkaZffe4lYew3tsM3rjcdl5wmA993x1GqDvGEN/eRGK94FXv/Vxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ottyQ+4t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ORC3YwAP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D8v6Bs481304
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 11:46:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EQ6rmuUSOwm1bx/rwcwQuU4u+z1BgbLoQv3BSEX4INM=; b=ottyQ+4tYu5wB680
	A79unT/3TpojUdSQQx0TmsybiGOQF0u+hXII1YgqqR4W4gYA648qRsjgK8QTbyAD
	YWi4UgXmcwudls01G7GZ1Gk3yvI6SPd21vOF+obIfujNXK4AfpXug8M98uDzS75T
	AgNfdRCnDrTRCVu2nGj1y5UL+ZDIwc7ipsAMLucDnHgLE4IqZEX1RAxmfUBRYeq3
	aFmHT8G7T48s102xoNZn6QAkGwjysnky1PannEqIuDYBuxswdXhLzb6PNP9iSu8C
	bjABis1E1XA6xqIlfFPH2d9cZMtGo7TBVgQ8GsTVxpMO3D0KPyYytSwB+zXQoqed
	xNepFQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvfh7rj1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 11:46:07 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c7380305a9aso1830157a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 04:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773402366; x=1774007166; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EQ6rmuUSOwm1bx/rwcwQuU4u+z1BgbLoQv3BSEX4INM=;
        b=ORC3YwAPGkmUp3oAt8KixazmJqFOEmCmPgkafFdRCNeONChCq/UQoafYZEhJ8lp4uR
         a49/hjeBW0weThTL898IunPKmXw/X5GVnuy/ABmhj4E9bEnErfTIQuOVHdxZzXMADtzq
         DOnPINhFqLugBdmD/kvQUnfShp13qLgmc8QqnDVIJUxUobWGzkqwURjWS0oTibVN1MLR
         8y7VjTyv3qAEdV5pGU9/0AcFM3DyXIfnTjp0Ymvb0dp2aElD+KlUb1TuW4GJpc3g50i+
         snlLIZmADIW9CCDAcn7jOmOnjRc0OHqC6j5ripaDtA79H+pEoL24ox7B9MexYroGUVQa
         09yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773402366; x=1774007166;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EQ6rmuUSOwm1bx/rwcwQuU4u+z1BgbLoQv3BSEX4INM=;
        b=IyXQ+PjIsBOFBX3M+/V5ElCwj6zsD7d5A6wHl80fFr7Kc1CH/YrLlyNqSI11c2L+tD
         69DsYdEpKrccVUwsXdrQiDrnDqrsuoK9MWOCJZWRsE93foi91TUGGVrkZH5rbjxUzJk1
         ZwTneNI9V1ft7TlsG7/2N6We/MKN9UedfwuOBn4kYKC5/QVTL7PyR81Q/Q3EKugdZrRL
         NNM73XzYLaAD3p9LYdftxG5RRUDz6CP3r2/f+Db6CufTaczyXIL4bkC1Dwm6pSRKdQHu
         PDNOLR6uHba3gkLqfT0YUAsM6DZYGOFlL93siGUgU+3y9DYTJPSYFYxODjwyZCgOra7G
         w6PQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTQXOU36ujBmssvJ2AmM5uS6zVgd6db/bBGB5iUvrvgL2HUlEKP4aZaEvmDPe94a8OUq5jzJ/4e6U99jIj@vger.kernel.org
X-Gm-Message-State: AOJu0YxdkHFze/3Ma3Aaon7kXtQdJMOVnv5QDgbU+rE5KQgnTpVk7cR4
	L1c0X9X1v6XIrs+zf5b64z6HffKammni60MBl9D3nW14x/pJK1jAKz0E3PaJWHIUQmDAxfIlH1I
	xf9mraAvwpBXag0GaIotZQridLER6ltt87r5QzIHskwqFWzd18XOPzVXCkYKi7uG1V4L9
X-Gm-Gg: ATEYQzxk18rzHEgldEQQCJByppOWYClecku+/+Xpmpe8LVKfKSS6ktcblu0mTyFUwKJ
	tdHTDLP/Mf84aP3byPlb1PZdlQXS2aoLhVJxptze1GtrryWDJzlIzoUY/Q4TYrDMFNaPKmgKhM3
	cQxYcfW69t0TAmBqemgEkH6bvfnqfr0o6fZojfgqLQisXHp22vGDKv/vckpWMuevlF5Ap65yptY
	O2lWFNGMMXf12NOl5Ykh7Jd471cmfoGawL/tn+c7sjURjYk2QAsd50i/L1G9K9+FAbHeCXA0cA6
	BsVKmpIvXGoYlppRVKOGqPBIskrH8cu6BPVutXlS7OpcFDewU2Omz1nvNJkLj/4ZZ2p13wBVJsT
	VyJh1kVOD4zZRoERDjmBJsQr+cl+kUilZJ8WAp+fxMFkH5YI0Xn8=
X-Received: by 2002:a17:902:f552:b0:2ae:54e3:9299 with SMTP id d9443c01a7336-2aeba51229cmr56438985ad.21.1773402365559;
        Fri, 13 Mar 2026 04:46:05 -0700 (PDT)
X-Received: by 2002:a17:902:f552:b0:2ae:54e3:9299 with SMTP id d9443c01a7336-2aeba51229cmr56438565ad.21.1773402364893;
        Fri, 13 Mar 2026 04:46:04 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece83b35fsm23082215ad.80.2026.03.13.04.45.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 04:46:04 -0700 (PDT)
Message-ID: <fc3d1ef4-1a0f-41d5-a742-81305ee7f521@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 17:15:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] dt-bindings: crypto: qcom,ice: Allow
 power-domain and iface clk
To: Krzysztof Kozlowski <krzk@kernel.org>,
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
        Yuvaraj Ranganathan <quic_yrangana@quicinc.com>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260310-qcom_ice_power_and_clk_vote-v2-0-b9c2a5471d9e@oss.qualcomm.com>
 <20260310-qcom_ice_power_and_clk_vote-v2-1-b9c2a5471d9e@oss.qualcomm.com>
 <2ac2efad-3533-490e-bb42-f21c4e950277@kernel.org>
 <a2d6c630-e4df-4cdf-8b10-64d87d24bf8f@oss.qualcomm.com>
 <b2d852c4-9f52-4ad4-a916-ced19c599938@kernel.org>
 <972bd9c8-4671-4151-a3a9-d7eccdf83913@kernel.org>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <972bd9c8-4671-4151-a3a9-d7eccdf83913@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nSEAX2fPScd6viiOxlpTSGb_j_SW4Jaw
X-Proofpoint-GUID: nSEAX2fPScd6viiOxlpTSGb_j_SW4Jaw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA5MCBTYWx0ZWRfX+sz2XC4e3OF1
 PQO4S4s5KDWkmH44GCbZWoEv6FIiqyF86LtGrjQz7uaX8vfC14aOAkQ/KdBkRoiCkrWxTe62baW
 cPped7pspubJwvHQxz3+ZaZyDx5z4ZqqKeLL8tWUR9gcrHhCAUhCqXvYQOw1ESsPhSebGS12DDc
 Bij6uy8kuMSZAVu9JEVrmDWA+greYqz3lX+pdCcCNHFvqjW0LnZBl8MqgZ7sXKHsDzU75tQ0OAR
 qgHEz/K10qTpTHi2SPaKRB4mRatAqgFk5Xfhn2Hq1dTjdDK69rBIerkTuzfd/K3s/Zj2RBwwJLp
 nDEvbBYvlAgtT71Y09EbY8a5s1r3akjJLx1476sQC5lvt1gRG/QhnorKA416qartqCDyHszpEHh
 3drOEo1D3icrW/T1aP6az03lmLn4CSZ9BMB0CYmrbkXxELnALgCH4lQ1GN3r951e2mewlpjJeXp
 tkHj/4XmIViUjYld80w==
X-Authority-Analysis: v=2.4 cv=BpiQAIX5 c=1 sm=1 tr=0 ts=69b3f8ff cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=dbIX2S3wHq3ruR6a9lMA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130090
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97441-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,gondor.apana.org.au,davemloft.net,oss.qualcomm.com,chromium.org,google.com,quicinc.com,gmail.com,fairphone.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A73862826D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Krzysztof,

On 3/11/2026 11:58 PM, Krzysztof Kozlowski wrote:
> On 11/03/2026 19:25, Krzysztof Kozlowski wrote:
>> On 11/03/2026 10:37, Harshal Dev wrote:
>>>
>>>
>>> On 3/11/2026 1:55 AM, Krzysztof Kozlowski wrote:
>>>> On 10/03/2026 09:06, Harshal Dev wrote:
>>>>> Update the inline-crypto engine DT binding to allow specifying up to two
>>>>> clocks along with their names and associated power-domain. When the
>>>>> 'clk_ignore_unused' flag is not passed on the kernel command line
>>>>> occasional unclocked ICE hardware register access are observed during ICE
>>>>> driver probe based on the relative timing between the probe and the kernel
>>>>> disabling the unused clocks. On the other hand, when the 'pd_ignore_unused'
>>>>> flag is not passed on the command line, clock 'stuck' issues are
>>>>> observed if the power-domain required by ICE hardware is unused and thus
>>>>> disabled before ICE probe. To avoid these scenarios, the 'iface' clock and
>>>>> the associated power-domain should be specified in the ICE device tree node
>>>>> and the 'iface' clock should be voted on by the ICE driver during probe.
>>>>>
>>>>> Fixes: f6ff91a47ac57 ("dt-bindings: crypto: Add Qualcomm Inline Crypto Engine")
>>>>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>>>>> ---
>>>>>  .../bindings/crypto/qcom,inline-crypto-engine.yaml       | 16 +++++++++++++++-
>>>>>  1 file changed, 15 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>>>>> index c3408dcf5d20..d9a0a8adf645 100644
>>>>> --- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>>>>> +++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>>>>> @@ -28,6 +28,16 @@ properties:
>>>>>      maxItems: 1
>>>>>  
>>>>>    clocks:
>>>>> +    minItems: 1
>>>>> +    maxItems: 2
>>>>> +
>>>>> +  clock-names:
>>>>> +    minItems: 1
>>>>> +    items:
>>>>> +      - const: ice_core_clk
>>>>
>>>> core
>>>
>>> Ack. I'll introduce a check for this specific name here as well:
>>> https://elixir.bootlin.com/linux/v7.0-rc3/source/drivers/soc/qcom/ice.c#L582
>>>
>>>>
>>>>> +      - const: iface_clk
>>>>
>>>> iface or bus
>>>
>>> Ack, will call it 'iface'.
>>>
>>>>
>>>> I don't understand why this is flexible and commit msg does not explain
>>>> that. Devices do not have one and two clocks at the same time. You miss
>>>> proper constraints.
>>>>
>>>
>>> I agree, it might confuse someone reading the commit message the first time.
>>> I'll re-write the commit message to make it explicit that even though these
>>> two properties are 'required', for the time being we are introducing 'iface'
>>> clk and 'power-domain' as an optional property to maintain bisectability,
>>> and that the properties would be made 'required' in a subsequent commit once
>>> the DTS changes which are part of this patch series have reached the top tree.
>>>
>>> Let me know if any concerns with this kind of commit message.
>>
>> So you are adding it for backwards compatibility? It's fine then,
>> although I had impression you are fixing something which is not working
>> correctly. New devices will need to constrain this.
> 

Yes, this is for backward compatibility.

> Except new devices, like Eliza and Milos. And then this should go to
> current fixes.

I'm not sure if I understand correctly, do you mean to say that except for Eliza
and Milos, new devices need to change their DT binding to 'required' with
corresponding DTS changes. And then, the patch updating the DT binding also needs
to be back-ported?

I'm assuming you're leaving out Eliza and Milos because they aren't supported
on the stable branches yet?

Apologies in advance if you meant something else and I have completely misunderstood
your comment.

Regards,
Harshal

> 
> Best regards,
> Krzysztof


