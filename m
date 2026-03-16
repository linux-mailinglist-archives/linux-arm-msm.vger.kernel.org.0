Return-Path: <linux-arm-msm+bounces-97949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJFTD8j5t2n1XgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 13:38:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C72299937
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 13:38:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9CF823017261
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 12:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8B82395D8F;
	Mon, 16 Mar 2026 12:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N7N5ZXRC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VwN5RBkO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC0B394463
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 12:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773664709; cv=none; b=A+LNj8fref+CgMZDbyFUBuOVRxnNKgN74q1yptuoDsB+dwLfjydLlaXMeoL9SbiqRXrONDczbEgIJ3XqhDtAJvky7kx8IaAc6Jo1A7lk2Tr1DCLkAkrx2iBtBmpCSxjkvJONGEpeTAsUaPC1kWbwsiaagB63M3DKOookbMoa4/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773664709; c=relaxed/simple;
	bh=nsErYwbtChCQiapJkcrzg98OOqd8zCCGMK2ntR4jOqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hGQjRzCACpDSb9dw3NdpuhHSp3P2jS5qYjp0MWXaSHQQH6NnA2cW64uIlgt7rmxPAyRqU8L8fVCIxS0GalojGw7PicQtrFjVm+Tvf6+1QNqelM8tSWOQxN3n7kdGriPB47JsaR/1QJXlq4/Km1BFJf8YrVeYo6t+rxe2bbn+UY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N7N5ZXRC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VwN5RBkO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GA4DBV3125145
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 12:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9J2Sbga2XlEXPDOHcokMKf1ZSnJnsrAxProE5RVBy1s=; b=N7N5ZXRCutQ6RBDz
	/S1ioW2HCgNopQ1FCnJtUN+Lp4kyIn5A9p6FMDVhoip9bNRqUYyJcLPd0I+OySh0
	LIoM0aS3QK//H/GP7XDU9iyX4+Hg+KrIWjDBDUGQzQ07potR6yEcfhVu3aXBHuHP
	CaY4O4GU88ALZrVYZFJisjp294zZ3vc2u6tXkvpkSXHbfdHObH8FCh97ixhBlmR3
	Sz8aPG6KrC4A8BmLYmMq74pDk+J5p/LrrLCgoLlxhq+fNuNRgjGXnhUW1KmlRamF
	aqnocV+LebWZqS90IWBWzFQQ//uFb9S3dyjVf9Yk+QBKcap9jAB+dKtbLaSBgD4x
	gJkgCw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxfsmggxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 12:38:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35b94e2caf9so7702460a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 05:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773664707; x=1774269507; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9J2Sbga2XlEXPDOHcokMKf1ZSnJnsrAxProE5RVBy1s=;
        b=VwN5RBkOregDSQPPb4NXjyetAm1AerysCscHEEHLuT3vJUIvypK1thvPPrmS6zj0eg
         MIB5ayHN7zlK12wR5g5NrYPevehx1uR9OIA2aTNZj06q/+E5AOLVwiWMxOl0b8QCGk/O
         D6PMPfrSZ21X++A4YCDMdU04IL+UjPDccZVoiS4d4xjHfuatoPJ9BrlcZBV0jyNc89y5
         9gP/hVFLP3x01H7tQWLODDSSSV5Ptb/EAqK9NpvB9vBnt9LFBgZLAX+KvuJsRBSi9Ucz
         tQR7HazJndlXIkMa0yjmuEi1G2jHtUuF+S24Mlk89kb3BOEQK7BZDzASAUznYwB45QPN
         CHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773664707; x=1774269507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9J2Sbga2XlEXPDOHcokMKf1ZSnJnsrAxProE5RVBy1s=;
        b=Se3Rkevk6c9ERQbqU4XVt1j8+FBosRGWjR/iH4txzVUtln41oDFfAsd+vMHk/mR2qf
         7pisQCaLDBfIrjwnHx/JcxEs3ZjkttW92RNHVwYn3TYAEn/E3lKAtY3PHaDqalZvK8Q2
         grUiCluhzvx3EJrK9CBvQaci79ygKzrZU1pGpb6XV7IDRd00Upkw/I7/FRLouSkNIujh
         Vvnz91NVJyHzaHnZvoqtM/Ivml1Syqf8xrBc1jQ4kV/IwqUf304LXCvf3V6IptqdiSYP
         g8b0yb8/jDHsA14f7e0M9VqD57RlTLcu5MaGvJlnzRYUekYLBiBERBgM2i1lopmSbZlt
         FCIg==
X-Forwarded-Encrypted: i=1; AJvYcCV5p/RZOyFZikTTwYHFrxtZ/ygAzg2Wqiklaabe8s8xfzee3e1X6b3G2xo4OUMT6eG5ztDQ4L7DC2hDpadv@vger.kernel.org
X-Gm-Message-State: AOJu0YwtcWUNE8EsIG9Bzo7icmwg3T/z4PhNV2hDbxeHFJRuv4LTTvEw
	1Wr/8ZgFb81xfo1QHKiGwJZphHbaK8Q/82x3pzHdEMziCkdvojxB1fGk1jy5TQIkYat45AczI2l
	Vha7NDhxKt92Qtzd8IFFDET7GcVS9yU7JcYYglzSZHHqbl0878kBK4V6J1cxzU4W8bX6P
X-Gm-Gg: ATEYQzxDdGCGRkcErz3BE9shCAK9ZSZNyKqMhuIIg+/3xv6v753SS0G+uHvA3KgLCu5
	mSCEUwgZVPj/hzlukZ2YftMA/MbkXBR1CJ8H9GF2lAbOOl4YuXcYaVr7OmDqPAyA+4ciTfH6sS+
	yi7ADIiUSm2FCmmc9A9J/zGmEChQdNvgOy7OwgmxntabDsWM0nJ05Vqt3MisDxpAmuV4eNMNk82
	A/jWgrRNQbZoPC1bFaVpdCnOLCqbbs4YhsLiFS6kYKm+aYDaKXsK3i5BplvwRRX+ngFMxnpiLam
	Ukpnhy+ZwABUU2SsOsxAdD43WGkITfbStMkA36TN6iyhfPE7ZZ4gDyJ6X7tH/6ksMPV2Ifw4r9j
	UF4gNIe8GzbnGHDgVMtNA6nrY11vUPALV8HuOlYgEzOtA6Pq/4WI=
X-Received: by 2002:a17:90b:240e:b0:35b:9242:61ac with SMTP id 98e67ed59e1d1-35b924264fbmr3530213a91.10.1773664706864;
        Mon, 16 Mar 2026 05:38:26 -0700 (PDT)
X-Received: by 2002:a17:90b:240e:b0:35b:9242:61ac with SMTP id 98e67ed59e1d1-35b924264fbmr3530174a91.10.1773664706318;
        Mon, 16 Mar 2026 05:38:26 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c74028eecd4sm3718488a12.26.2026.03.16.05.38.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 05:38:25 -0700 (PDT)
Message-ID: <938a2d30-200e-449e-8ccb-0d2576fd28d2@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 18:08:16 +0530
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
 <fc3d1ef4-1a0f-41d5-a742-81305ee7f521@oss.qualcomm.com>
 <87fe32f1-b2f2-4b9c-9e54-03be35c921f2@kernel.org>
 <48daa237-aff9-45ef-919e-665e5ed27f66@oss.qualcomm.com>
 <f8cf0bea-aa1c-470e-9d1f-807546a93b9a@kernel.org>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <f8cf0bea-aa1c-470e-9d1f-807546a93b9a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA5NSBTYWx0ZWRfX6oN6RgSBS8bC
 hrMz4hV8tSWrV7Xt8FV2iSftKxZOQsoyeJ1py2ZXzc5RX57NwYFjWhm3LQfu0uT6Ja2ZCriS5f8
 VhzVzhYKVHXomPTsJKHh82Yq8KMjdamcCCPOoAI8qyCyn6AmhZEoF1M+cp6tRqQBoYTgKOnPV/R
 W2KFXBqNpbNzeW1R677cycBaZ3IapweUFBe0WIRF8juItT/zBGZ1kIrJNIoV0c+YnCoRtbGSIJq
 RbguIkJPKP1Y0bodsv6LEXVInuzJmAMcwRJpFejIDC5iCV6mGd16qkEQIe1ilzlNq6ZImbCAOY/
 kPEVPUe21MvVJSq9jbrocCUXQ0dhocKran0F2KLpjImWWsKyjfGDpkOzVbaYxuUtbNWkbWTft1X
 hBviZ04nOJIFYbO/lFn7aT2+6jZwyKNatf0+jDuFGlyCGLFlz6dfCwGYlVPAyPlqBMEG0JpwE5k
 llwQXcYEI26FhBkreyA==
X-Proofpoint-GUID: SwF3l1Yv4J2j-dVyzFt5x5Zj2-ziQmk3
X-Authority-Analysis: v=2.4 cv=V/hwEOni c=1 sm=1 tr=0 ts=69b7f9c3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SZXt-WhlXTLr8WwM2e8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: SwF3l1Yv4J2j-dVyzFt5x5Zj2-ziQmk3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160095
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97949-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,gondor.apana.org.au,davemloft.net,oss.qualcomm.com,chromium.org,google.com,quicinc.com,gmail.com,fairphone.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: A6C72299937
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Krzysztof,

On 3/16/2026 4:39 PM, Krzysztof Kozlowski wrote:
> On 16/03/2026 11:56, Harshal Dev wrote:
>> Hello Krzysztof,
>>
>> On 3/13/2026 9:28 PM, Krzysztof Kozlowski wrote:
>>> On 13/03/2026 12:45, Harshal Dev wrote:
>>>>> Except new devices, like Eliza and Milos. And then this should go to
>>>>> current fixes.
>>>>
>>>> I'm not sure if I understand correctly, do you mean to say that except for Eliza
>>>> and Milos, new devices need to change their DT binding to 'required' with
>>>> corresponding DTS changes. And then, the patch updating the DT binding also needs
>>>> to be back-ported?
>>>
>>> No. All new devices must require this. You only preserve released ABI,
>>> so fix unreleased ABI (Eliza and Milos) now, before it gets released.
>>>
>>
>> I'm already being annoying, but I will disturb you one more time for clarification. :)
>>
>> By saying 'fix unreleased ABI now' do you mean to say that I should add another
>> trailing commit at the end of this patch series which marks these resources as
>> 'required' in the DT-binding without carrying the 'Fixes' tag? Specifically so that
>> Eliza and Milos carry this constrain.
> 
> Please post a v3 of this patch for crypto subsystem, doing what you did
> here plus requiring these clocks for Eliza and Milos, with explanation
> why this is a fix thus why this should go to current cycle.
>

Got it now, I will add additional bindings which make the clock and power-domain mandatory
for Eliza (unreleased ABI) while keeping them optional for others (released ABI).

But I feel I should add this as a separate commit which carries a Fixes tag for this:
https://lore.kernel.org/all/20260223-eliza-bindings-crypto-ice-v1-1-fc76c1a5adce@oss.qualcomm.com/

This commit with it's current Fixes tag is required to be back-ported on LTS branches because
they fail to boot for LeMans and Kodiak.

Let me know if that's not good, and I should add the additional binding in the same
commit.
 
> 
>>
>> From what I understood from Bjorn's comment, the DTS and ICE driver sources will reach
>> from different trees and either could be merged first. To maintain bisectability we
> 
> 
> They are applied to different trees. Period. This defines everything,
> you cannot fix it post factum, you cannot fix bisectability afterwards.

Ack.

> 
>> should first merge this patch series followed by a subsequent patch which marks these
>> resources as 'required' in the DT-binding along with accompanying ICE driver source
> 
> Then you have a released ABI and you cannot change it, so what does this
> achieve?

Ack.

> 
> Just look what is merged where and you will see the differences. I don't
> see Milos crypto engine in current cycle, do you?

I don't either. I believe only Eliza has been added till now, I'll re-base and add only
for Eliza right now. Subsequent patches for Milos will know where the entry needs to be
added.

> 
> And bisectability has nothing to do here. You need to fix ABI before it
> gets released.

Got it. Thanks!

Regards,
Harshal

> 
>> changes which fail probe when 'iface' clk isn't available. Of course, the subsequent
>> patch will not be back-ported as a fix.
> 
> 
> 
> 
> Best regards,
> Krzysztof


