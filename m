Return-Path: <linux-arm-msm+bounces-98548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JzIKPnuumkBdQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 19:29:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFF82C1478
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 19:29:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CCDD531F9F82
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 18:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5EFD3603FB;
	Wed, 18 Mar 2026 18:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X5dqzScf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fVAXVUUE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26B6361648
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 18:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773857529; cv=none; b=A6Ktnxk+NlyJ0q6yfM9KhviSarGP1p24cDf9lW2e5MC6aPPryZwj/TOZnFc3yMnMUb83Q/GGaQBeh5ncm80wxFUCWjiQQ4NBwkVCdIgMmvcTqXLq0W1ZNuLD+QAXFG9SgzwU7sHlWb0Ki60mP8yeMA/6499X9zVWsbT9Iro1Ujw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773857529; c=relaxed/simple;
	bh=AvpiGxvavjN6CMkDGekeBWr26O5+mruHopbv9LKEW2s=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=hBE3jpz4mK/hkZ+RZ1aZL7+U36WxcM4jQ6StlbPqWgPpvD02LFhxl+/IVYQXHGvEKl6hLAdXWk8ZYDmaY6yrUsAb43dOzQatIxJOce1lDWQ0gDBOg9PHk0zR0pAue+vG660FIR+BjOneVzmRh0Tichmifcv84FZi/jbuzSgyKuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X5dqzScf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fVAXVUUE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IFgg5M671484
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 18:12:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bfG7RL/BcrgyAT1igZMvNMLVT4y27kMw61RURRVQq10=; b=X5dqzScfYWiUyNK4
	UDqOonk3xfIKfIEdaY/KAQ7kaH373n9CdZdFtco7xPkZesPoIrR0rdC6H28IHzkf
	0IJtoKaeUyohJ6fZhhRleX2A92vctmfD+6IeVKxmCBhHMzm5WFKs73r2wkkzRC13
	RuIuTdGDoq2GX4MPJ1vRtkPs56k615DdwXgqUJWhPawU7D8wgn/Qq3Ms7GAxx0p+
	aepzK6dYgKIwDQP7SmV+sbbdIXU33EsR4cTU1sHXpuB5xUE4iDDj1C6eNUF+7RJc
	f1zyJA7vOZsRvd85c29Gaehs1vEmcuxrlrwOjWtFBOlU+czBKrTGWRA1NYCNCE1L
	Gj792A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytj51ra1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 18:12:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5091782ab06so9836151cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773857527; x=1774462327; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bfG7RL/BcrgyAT1igZMvNMLVT4y27kMw61RURRVQq10=;
        b=fVAXVUUE+I4AZ8pQcGmMBuS7VVN3DgnPKXMPa46TZwi17BXc1JlSfvQGM0xMNJlWQe
         XSvfkWX6hzmR8ocb87nVd3TOb75qyAfjpKVFRkQlgLcWNmYeQHHXCi7w7+8XTLiJ/j6d
         GTyELtWv0h4PhfpBhx9QHNIPxtDbkTgv5TnszajawXVxdTGCF1zrz7v7nUETIfqDO5eM
         YSyX0Tlafr49PaG/vbGi9rLuFOVbhdLOe/peblBwJMvqOXGCbl+/TKU4Wz4VUgCQdOM+
         6EKmXZlMzFI4be7u7E9/kK2be+OE2qZmI3hRiCRyYKatddbZ06SybKk91YVy5gkRhUlo
         v70Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773857527; x=1774462327;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bfG7RL/BcrgyAT1igZMvNMLVT4y27kMw61RURRVQq10=;
        b=cR8AJk700lGmJBPMLfIFzM0RaUQQaH+H2kVUreHha6abesffEirVc+5b9tASssjt9r
         B6e4BtQfMFuKHJ76tTHYEw96rFgTUpKla+bHJ1F9thd9BCSTmd7T683ixquzR8DI7kGM
         mzxnqjESa9F1qoLgme5sGlPi4Y7nmQ3/xe6FPl+A57ElWHOWrEoZgpR3/2ZJm3U2P+y1
         YW1rUqQ6/QjVwNs937WOOcoc3tjy6VGamdKifnarjQ/z3e8+uVqzjiv4Bmu3ga8mBKcM
         1bRvJ/tE7FzsZv92EsLooqjIJuMnE+zvkUCROH+XEka+Mh1+CxJsrq4eWxJzAk8DVpA+
         ySDw==
X-Gm-Message-State: AOJu0Yy5SkmRfdkkQ9Lmjp5398kM27SnrtxZXZ3d1bCtcJ6glVk/jyEh
	7QyGxik+Siuc8/zC3f9U59f0MAAGNimEe1H8uiveGIVVTpp1Mp41Tl9EeN/zTgZeDUnYMPB/nVE
	aJuBYGJ44LZiQtj9xXHQzrZf3AGDXcx1G3OfqssdlGUHLfLFVyOExdqZuqEuCxmtMyJ4M
X-Gm-Gg: ATEYQzxn5eMc7CafOpK1XAs/cwsGLdWcH2U65HWQ0kPh0vVt0GVxKIzL3+VzVwDa2dD
	e7IGt2SSeYSzN61zJa8+hBfLNUv50o2ZC5lfiw3oOq+bPz3t69XAbOQ36+unsKrhxq/TzhqM3Wj
	RSqjXLKGDk7k+HOuHIGxuzHHSarZbmvGIolqP3a65IRx0RmftGVMEH3YR9hIv/ItSoX2+z9a5zo
	QrGPfSBn5nlAzFbDPCduszvQNa9a5U5J//wMWL4iXRWWtqhJBVyBZOuDE0GvuWWdi4DDi6dVYxS
	dqfsOj5FNFVRpsCGCAESl81E5fDOcWqLo1Xx7fbaGG8yxK4ZstxJIIWcaimVMoyNWFdmn4Dn8Be
	dJbIlzJZyPqVIkKjrFEpGRw9TwPo9UyMehS22InqD4vqv6MJE
X-Received: by 2002:ac8:5f4d:0:b0:509:2877:eea9 with SMTP id d75a77b69052e-50b14863deemr57038541cf.43.1773857526958;
        Wed, 18 Mar 2026 11:12:06 -0700 (PDT)
X-Received: by 2002:ac8:5f4d:0:b0:509:2877:eea9 with SMTP id d75a77b69052e-50b14863deemr57038041cf.43.1773857526507;
        Wed, 18 Mar 2026 11:12:06 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4b838c1sm25175935e9.13.2026.03.18.11.12.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 11:12:05 -0700 (PDT)
Message-ID: <fa2f6219-3cd9-4f30-bc12-aed03c68340d@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 19:12:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: qcom,eliza-dispcc: Add Eliza
 SoC display CC
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260318-clk-qcom-dispcc-eliza-v2-0-8c05581168d1@oss.qualcomm.com>
 <20260318-clk-qcom-dispcc-eliza-v2-1-8c05581168d1@oss.qualcomm.com>
 <cd63e6e4-e8c5-4c26-b929-cf47e9b58250@oss.qualcomm.com>
 <1e46f412-aedf-488a-993c-3470ad50aa92@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <1e46f412-aedf-488a-993c-3470ad50aa92@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDE1NSBTYWx0ZWRfX1Iqice4xqMwt
 W2r4KbfmJ9uvqDXIGZiLzVU3tpV/Sg3yBUEV5+BU+fAw5zwLqNDUFSNd9OCzqcwV73Snpn6doc+
 0hwqJ62JBNKPsRFdFVhC+LFqiOj9Lt/3kNfTOqMjj+xcqZttQnZa9kUnDgf+Brhi7GSKmEXkgCb
 3Auss9whO7zq7ZuXES4kvqcb+xRP04PFBdc30K3mXpw0Gd+uF0M2NhfzIe9RaKt3Rx+m+lSaM04
 Rh2eGIq+vm8VI4loNGdaHWc0v1iYoEmhUiHIZnHxTXxxlYohdLk/1GP7y0IAJAU12sssDWY9wBu
 JtjyPBK8hg1bG/VD2bZuT41N0Qc0t62DUHD23rH/qTjD5zeiIMb3VJLzgPeeNc/ELI3egeXO1yN
 NUP/a8L/s66f/nB/w5K3w/tvXsYZ7lnVlChg/ulLArdN5oraoq1Ix5Y6RWuccl8zhcf6uNB8Hcr
 upU40d46qdim9OUhn1Q==
X-Proofpoint-ORIG-GUID: vltPzirpKtyZso3sQPvybpR-lK1NlRUW
X-Proofpoint-GUID: vltPzirpKtyZso3sQPvybpR-lK1NlRUW
X-Authority-Analysis: v=2.4 cv=dM+rWeZb c=1 sm=1 tr=0 ts=69baeaf7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bFbsAXeepE7vyIqeo-8A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180155
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98548-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0AFF82C1478
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 18/03/2026 19:10, Krzysztof Kozlowski wrote:
> On 18/03/2026 18:09, Taniya Das wrote:
>>
>>
>> On 3/18/2026 4:09 PM, Krzysztof Kozlowski wrote:
>>> +  power-domains:
>>> +    items:
>>> +      - description: MMCX power domain
>>> +
>>> +  required-opps:
>>> +    items:
>>> +      - description: MMCX performance point
>>> +
>>
>> Eliza, does not have MMCX rail, it is all connected to CX.
>>
> 
> I will just drop the comments then, it's pointless to list single entry
> regardless which domain it is and it only stalls patch acceptance.

And as you pointed out here, please also fix the same in your patchset.

Best regards,
Krzysztof

