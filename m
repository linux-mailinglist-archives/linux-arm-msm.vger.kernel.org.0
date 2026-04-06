Return-Path: <linux-arm-msm+bounces-101937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 59tdNbOA02mOigcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 11:45:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 395713A2AE8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 11:45:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C5982300DD5D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 09:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CE25145B3F;
	Mon,  6 Apr 2026 09:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ILMPjt6k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g4KnSMWs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C572019CC0C
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 09:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775468719; cv=none; b=poG7xnBX7T0UOwDdGyWHo2Yy5p2Y7Pl58jZYcGIBukfQq7tqC/bfFgHKXQ4ELZMu5sRqOh/kIJyinS4fRxPfu448dst5Pn712++dlQb0G7rNxmvVdGnkXkJ84cu+VFoe0so4juXDLelGtjyHsu/cyYnoyzpLnfyK/dEbuV+QQjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775468719; c=relaxed/simple;
	bh=1u78RXdjFRE8TxNL8SpX8vkad/jIF0dr3dj7UAs72lI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=H7axyDMFDNx5xABMncWcGRkH0VnhlxtFdyjTo3UO8657uoybtR5AO95YcSrCvxJ2+BxokMNwX+niULSYs8YGUticgdeexyrEp3dFi43n66cczyz0OXjsOY8k+++DnawwP6sQk/dANCnkZYx1uOxcq0VRaPFUHZfMfYmcua0RtEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ILMPjt6k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g4KnSMWs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6369Ch9u1884221
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 09:45:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ylqmm6Fk9xqXkNcpz9CG1tMWJO34U6XEQoYsL6L/otA=; b=ILMPjt6ku9lgo8LZ
	bU7jtxwq1myBY8TMvO90CnxH5vm2eh7a8sh0LlegI6tZXEbIeREkPz5QiSOtpl4P
	FNWLEripT6vXBCg+0jku0xOtHAZFhs0QnTWGU84Y5gbbPOT6GRDNjo50GQf8I35V
	JGm9YHB5+byY3TGd1bua4w63WfYHalLzBm2yx3HGfAMZxzQ/PaBtRFV8u+e7GTXT
	oZEfrKgxVuq1hEsCSjdtYrdGzn35dQukoqCHUKpW31J23UBU5+cF2qlXEzhyhwS8
	fhC2LKwE9BkCjR7OxhzGbdbWzrE/ZFQi5MZQ2n9LIohsxDDpL/5uriYccEYcpd4N
	R897ww==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daux8cndx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 09:45:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35d9e67f6dcso8633769a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 02:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775468717; x=1776073517; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ylqmm6Fk9xqXkNcpz9CG1tMWJO34U6XEQoYsL6L/otA=;
        b=g4KnSMWsfxz3fjHT3XPF6pHZf47U2IsuTwDNKyKxek279i721QP2zZFecH6YsDtqae
         mpQF9dzBODz6lEQ2bYHdhpnNNCt3VuOMfkZ3WBAYs/ssQ3FR+kQfTfk9aE0TBLGgS9cZ
         c9HE6KmOKBplvU9wS1F7nxDZUiSEI5gDSSkTIEi4ty/Q/3zP8wgwbmvKwkEwPzH6KN+N
         KeKnzQSi0N6C8e7Hi6JHb5lEEORZOSF2LYWXOmHTjyCO+kUTVMoBdQ88ITM3T7fkVj7Y
         RKvHuhaU11EwP8blP5oNiFCemOEbschGKq0OMI+68l3a8dmhiSFk9gxM1XbyYSWQtd/+
         EW+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775468717; x=1776073517;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ylqmm6Fk9xqXkNcpz9CG1tMWJO34U6XEQoYsL6L/otA=;
        b=iC3hKeyEwuCevonFL1otIj/ktETT7V6pVCAFbHbg1xejpysMnmTRzQs2UMntHSd6Tp
         s8Xg+sRf/37mt/l+2fDhK/TQ14aLKGe7hPD9uH/upk3cAcNJrxhntkaBwXTA67FCeTPJ
         34qAAVeYzEh7uFkQsEcrsSJRCt8ytbd7YaDMBgcbI6ODtM06b0ZR9TUs8G37m6kyv75Z
         DWE3z0S/rHbgY7X1BGvaKed0Lt7y8vhuxKK+rU+FjqCge2YDzfbVNYWnWkfM14ppQMNI
         Zs+nexMHpsFcqOx4BW8baJD3e7/mi7koblunk2VUhxGO3PO+tEduh+Z1S+UVrHspzsnL
         vzDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNgJpDUxbX6jc3DLIeGl75qdGPLx4KJ5uLuqFoIFfp6lBJ4MR2OaRWLQ2GkIivtyZN7GysZiL2jpcow5j4@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1qnW1t+DjE3SibdTplc5vxoUFWo+nj0vxPn4n+rguHoomHmMT
	jzQ0p8F4VjRhVCI4AsZ1dMBy9g8cIzuJi1DrgVaNvE4oCOUt/FnFlK9ic+q6ZQtuv5gubbKnx9E
	0QVstOajT1EdWuPIoHQs6lNjGaYOG2wQb4yaDSCG2MUBo1k7SmMcjI+8/X0UxX/viDYNi
X-Gm-Gg: AeBDietUAbE9CTSK+VXhDmtUhSQErCQOlTRmiDEiigVQ6s4kTe7XVK33SkU54UHeef9
	AJEIEK61Y+PXSEG/kxQM78Cak7niAJltKGvTxTG/vEHCOsCsBSxrCSIIw5/NhqxCpwZict7SuCU
	j9xHiI/et0Qu6h1AYqx2cb2YvRngLSJRaCVGTeZl4g4oFM5KhuoBDPP4fVrtf5KYsHs3CTH3EQ2
	SpKBIXKJ2hg2ehYn2YpNKrTlKrjsHwLaqi4m+mY9RYUG5IAE+mCRoIq2+5uDoNbMKz76CKSog8a
	dqrVlOqJ4GxgKNlKakI6+8JgjmykAlKrzdjUnAv9LoVyVt4LQgnph+xrxDIbWo9GYt4hzuJs77e
	mIVKb7XU9jvHD5d58zCFhJ1FdohL+d38C1zYx9OlWff4CGDThsrQ=
X-Received: by 2002:a17:90b:5583:b0:35c:d98:d684 with SMTP id 98e67ed59e1d1-35de67da865mr10630626a91.6.1775468717082;
        Mon, 06 Apr 2026 02:45:17 -0700 (PDT)
X-Received: by 2002:a17:90b:5583:b0:35c:d98:d684 with SMTP id 98e67ed59e1d1-35de67da865mr10630586a91.6.1775468716497;
        Mon, 06 Apr 2026 02:45:16 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de66b4808sm5017017a91.2.2026.04.06.02.45.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 02:45:15 -0700 (PDT)
Message-ID: <6f91f084-44e8-40e8-af8f-f42502a82a31@oss.qualcomm.com>
Date: Mon, 6 Apr 2026 15:15:06 +0530
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com>
 <20260323-qcom_ice_power_and_clk_vote-v4-1-e36044bbdfe9@oss.qualcomm.com>
 <30327e35-6d32-4aac-a55d-134ed5271603@kernel.org>
 <5d4e0b57-e5f6-4c2f-918b-7a23e50ea6ad@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <5d4e0b57-e5f6-4c2f-918b-7a23e50ea6ad@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: H3ZZrUVcX69uhW3udAalxXgngQhO6aM8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDA5NCBTYWx0ZWRfX1eTJWnTRcuo2
 R5MdVaFvYOhLZNdAmasC65HbUIfn3jMclTTIlLb5U8zzGzygxnEozfUW8dGvSvHfRa3GIfVLzkC
 7cuKWesY+QNG0+GJl/qBuqm2pYZv2S6LI9yVd6udnhFsAdemEfhocA2oy/kQhi2/WEwg/0LnKn2
 ybEKvngtwgVksXTHWY61pagpRljNWmJr+a4Y5Aou0JB7SJxgd2H1Ngt4+bzoQzm926CnGQCmL1X
 8wEzo4s71FkXmNG2LGckvhJRi3YWnt4YIzmtvEd92blVl+wkPN1ruB9qzp+E3IW7zXq+bNrl+Jp
 2KKrcJzM2+TjGUa9hORPd7tw9OpqzDl5HXGWYdqu8SYfqX78J8+4Xg+gcoCKvvE6zMVnls+IQ7P
 m9mvT3gvhGFIrvqaytzEzB5LMsD44vdUT9OgC14YOhAe33n7VQWqFGcI6iMRxMuNfpiwQ5etnxd
 qXeGvcnmUPYp87nOlng==
X-Proofpoint-GUID: H3ZZrUVcX69uhW3udAalxXgngQhO6aM8
X-Authority-Analysis: v=2.4 cv=AuzjHe9P c=1 sm=1 tr=0 ts=69d380ad cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GOUycqkJADGgNADFIAoA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604060094
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101937-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,gondor.apana.org.au,davemloft.net,oss.qualcomm.com,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 395713A2AE8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/6/2026 2:50 PM, Harshal Dev wrote:
> 
> 
> On 4/6/2026 2:07 PM, Krzysztof Kozlowski wrote:
>> On 23/03/2026 10:17, Harshal Dev wrote:
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
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
> 
> Thank you for the review Krzysztof. I believe since we are targeting current RC fix, I need
> to send a patch for adding the clock and power-domain for Milos and Eliza DT as well to
> conform to the binding since both changes defining the ICE node for them are already picked
> up by Bjorn:
> https://lore.kernel.org/all/177432155637.28714.2511351512032518031.b4-ty@kernel.org/
> https://lore.kernel.org/all/whoikp5tdu34gujfjqpopbhywzj6dvcxebywtwufip6jxdwp2s@oepb2y36a2hw/
> 
> Is it fine if I spin a v5 of this patch adding the DT changes for Eliza and Milos? I don't
> think sending a separate patch series for updating these two DT makes sense given the RC
> will close shortly.
> 
> I'll send a v5 today itself, hopefully Abel and Luca can review.

Whoops, I can see that Eliza and Milos support is planned for 7.1. I mistakenly thought
their support is already merged for 7.0. Apologies. This commit can be picked up for
7.0 RC to fix the binding. I'll send a separate patch which fixes the Eliza and Milos
DT sources targeting 7.1 RC.

Regards,
Harshal

> 
> Regards,
> Harshal
> 
>> Best regards,
>> Krzysztof
> 


