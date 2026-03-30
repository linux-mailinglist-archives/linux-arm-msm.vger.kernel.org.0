Return-Path: <linux-arm-msm+bounces-100753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOS9D1JSymnQ7gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:37:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEEA359764
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:37:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6D8CF3029FFA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40B5A3B8D76;
	Mon, 30 Mar 2026 10:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dk3BDlXP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YyRiao/7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1423BE621
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774866757; cv=none; b=Qp/4ltSYtnDiTgI54cWxjYImGFP7BvHzzLh5TXq/CbM5QKiEbRNFxtklk+mNGdwZfuzOeNzcRgNX1UW0BRjFwNEMEnxIPQ1Itw6Cj5/hRPqZ7gQckOpPgBA+GvuU6NJAWyc19QyJc48NrwFIBezkVW4Zxhggr6TlW4yuOpD1U0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774866757; c=relaxed/simple;
	bh=DjsOy1VmOhbcgAyoqkHX6VPjOIR3E5Foub9AQbjDqF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QuyKVp54JZWqaQ+OztQ+RE+0oBpLRJbl4DC4IysgKQQycYkJM0OHUXmvjg1XYHODyqgomtXM9SIzJzzi+LRATV0AmIOdMipGerlzG21lRV541uqJQ441N8nmiEHcBS9CtywrSztSoRs4BVm+U9T9VmS50qm10OpsUVYHiDF8lcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dk3BDlXP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YyRiao/7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U9nHvv3722183
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:32:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w+4sqL6RDED1B1qr1xOMY94kj4P/JEsATC5CmPtHtVg=; b=Dk3BDlXPMAvEXBwP
	Zj5tpnhw5d0MXo1FpD2t5gMM/Q8NqGP3Dlv1dGCFyyptsvA/C/zD84RrSinyJEBl
	wrVwlPjr0VTcgMvnzgqwMsKiiLgSWMY4Xahhht+0sORH6QKjgQ06kD9Hgzu5P93C
	RUBU66bVzwTzwrAcxP8pSIg29VDLIBcMYTWkAPiUC8G3CrjhzitffKqaxwdVFtCk
	S4cIggqEZyAIBnJ2BlzhwC8ro7FKsDxqhN0uwS3gtXXFKDH6+VP9X0TT7zTRMoiv
	ZWQSq+nkT5qGWv1TE9Q4LIs6dr9CUXUnA6/Tt7EjdqlqXe0zcM8Y3CqkOthQ+Asf
	JEVdPw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7pvmr5f8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:32:34 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89cd541c0edso19945416d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 03:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774866754; x=1775471554; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w+4sqL6RDED1B1qr1xOMY94kj4P/JEsATC5CmPtHtVg=;
        b=YyRiao/7yaJOny2pnMS+SOR1tood0j9aGbrKGS5NLsXXeY0ugk5EXcFWEK3EqhTE40
         x2paqpanr06ZNHhEWo6QxNCCCZX2tU6USdsqY1bkJ9HeLnNd7Mj3dvr2AgxK4Ctwsx4q
         q8un0OP8d3+A7mqpVDynImQzdqTC5AISozi7eSOa4TLzOW+Yz3iFYgPDogCOULCClF8G
         zlWICO86f1ny0PpAW1IAUonByDb8/mP0bu+HJ5r5xxC07O+nKTQ8RN4UD4U+uBWItKZ9
         UlLNEiHmdwFJ7PycufaZIfNvGrRa/d0Ht3jIo3/N9tnWCHZzbfvWYspakaXYWBWlk/Fg
         MVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774866754; x=1775471554;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w+4sqL6RDED1B1qr1xOMY94kj4P/JEsATC5CmPtHtVg=;
        b=OCY95DvMLDtX2l8dqnFlLbSe26DVymw8GZc0zVuXaefzN5Gf7twOdspaBEe0gLS9Ok
         89i3MbKnX4ksxKaDGRRm1UVK21InTVrjlt4jSco5/NT3ozeB826itlladnFngtThMVl/
         SWzGIeijdhadgKej2VKkQVlimayAEz7FjL1tZjUAiK8R0kRQhT0fC+YLRpcKaGXEJIZG
         JPe6v9BR6Pp5O5W9zysvbQYua24szjtWoDcVg5PYavwXQq1oitTqHlVaCqxQaP4ISO95
         kew4M2XGF0II8YQWqvbxvRdhEjAfqWB6h4C22DTDBmfLy5gfhIMmJ/LGSA08VQyHeI9L
         ZvcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXn/cKlHV3xM95KB/oEOv0YOtUaV2zm4P5MU+UqfIBSvuP5Bptyn0aOPRSP7qU5oWHv4biNFqqhyvmK+Dd@vger.kernel.org
X-Gm-Message-State: AOJu0YzUDUwQ6izPp2tiOZi5kKCOFS4FbRtJf0HFgY+clUr7Gp2eLtpZ
	rYKyfar1PZ/424O1KtP/OChnHHMCu4rDhxdTk6seUnoSIJXHptypWDCw6yowtlY7Hm1qev1x1Am
	VGmT86XyERFYFH/gnzo1O4RUs9Xr9WhKmtXvkrEecwXLUCqeNV22HMcULqcASLX/5LLyH
X-Gm-Gg: ATEYQzxp3LhutzR5Zhw+GXPHUjMTNxLQpXla/82uNRnHDDRp8vKnC52//Ettt5g09FN
	cDbJTl2uIfE1//bsxqk+7myEPHRbJxpAF34kcOOHQrHlCdoBPxNTkGtBro1A4nFjX8ZWDjVwPqd
	sbNOdJjAmnXKdSCBNHMhEVZ+jiwx21vgba61v9qlgg0gfWVp/meiMxgseE0W4zSbztFwqOmFGz6
	3M0YWZO0Ed6DZfKQXTjB5Eb6K9G0vX6hbvmjkRoooZCmWzlJuEsej7hnwdlSkAsoYEgvlshmvpP
	43kj0pGhiKUYKppkGqvb4g6/IKVu1K0YEaRan0n+N/lBDz3dnLl7rdI+umMwLdJjSj6KSapubPb
	5AYq47m4Z0CbUilGgO9bLuA7nal56zNP0UFEsR07Hr576JKrtZGFTbyvbbwajBgIP1qdI0QIlGu
	zcN2w=
X-Received: by 2002:a05:6214:21ed:b0:89c:5285:200e with SMTP id 6a1803df08f44-89ce8dd5ad5mr134354966d6.4.1774866754030;
        Mon, 30 Mar 2026 03:32:34 -0700 (PDT)
X-Received: by 2002:a05:6214:21ed:b0:89c:5285:200e with SMTP id 6a1803df08f44-89ce8dd5ad5mr134354686d6.4.1774866753567;
        Mon, 30 Mar 2026 03:32:33 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae520c2sm273801766b.21.2026.03.30.03.32.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 03:32:32 -0700 (PDT)
Message-ID: <91af3fa3-85ba-44b8-8725-032f77c846de@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 12:32:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] thermal/qcom/lmh: support SDM670 and its CPU
 clusters
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Richard Acayan <mailingradian@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260328014041.83777-1-mailingradian@gmail.com>
 <20260328014041.83777-4-mailingradian@gmail.com>
 <a3rrkgvkc4zxcq5oqvws23lyjy6dinlmfgp34wzguvdxdxig5f@25atyxc7zabm>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a3rrkgvkc4zxcq5oqvws23lyjy6dinlmfgp34wzguvdxdxig5f@25atyxc7zabm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 60BYezaqxk_yL4ogpEZQW-dlR7XvV_yE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA4MiBTYWx0ZWRfX7ppOHMu3WZ2r
 JZMNIjNv1IwnakBrMLQqek0GymAvFbuAy3qDFhc+hK5l7i0vN+3OuI6rqwCYYoiWK4XgCHPF/yG
 0764ovewVXWre2bJmQbd7nOTjeZ9/Jn0hSThcG1tz+PDGOCDOf5BoOboG88xuzpNL5LAJERbAKo
 2gs9JGU5NdLTzWJuvFOGy5BkgPf+Ku949/UhE8eQ9NhAoka7Yx8vzJaOaf1tfpqi5GEvNfUg9oE
 VdyXo1QnDyT1QQFlOw6pRrhWjggNy/DI1yCG4tAu2yMpW7ScHjtjKJmQi3YVt8R/ITHhueU3B2w
 w4/yHw856BsIImjKs4wx2T9UUQrOZE/ZF3fJdDrvjNGl134FJrPMGJiiFtFYwbtHRURaNxXsBsJ
 j1dhRvDjRpDdJN76djxtXnoqs4UM+7gpZmANoLkLdn/9jZKum6bjbVZivvKfmewr97MAJrGcPmb
 uJ5nVRvYeLuEd+1dlyg==
X-Proofpoint-ORIG-GUID: 60BYezaqxk_yL4ogpEZQW-dlR7XvV_yE
X-Authority-Analysis: v=2.4 cv=S9rUAYsP c=1 sm=1 tr=0 ts=69ca5142 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=fM1jUFrDNVvKu5cEwoEA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300082
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100753-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,intel.com,arm.com,gmail.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1DEEA359764
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/29/26 12:44 PM, Dmitry Baryshkov wrote:
> On Fri, Mar 27, 2026 at 09:40:40PM -0400, Richard Acayan wrote:
>> The LMh driver was made for Qualcomm SoCs with clusters of 4 CPUs, but
>> some SoCs divide the CPUs into different sizes of clusters. In SDM670,
>> the first 6 CPUs are in the little cluster and the next 2 are in the big
>> cluster. Define the clusters in the match data and define the different
>> cluster configuration for SDM670.
>>
>> Currently, this only supports 8 CPUs and tolerates linking to any CPU in
>> the cluster.
>>
>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>> ---
>>  drivers/thermal/qcom/lmh.c | 69 +++++++++++++++++++++++++++++++-------
>>  1 file changed, 56 insertions(+), 13 deletions(-)
>>
>> +static const struct lmh_soc_data sdm670_lmh_data = {
>> +	.enable_algos = true,
>> +	.node_ids = {
>> +		LMH_CLUSTER0_NODE_ID,
>> +		LMH_CLUSTER0_NODE_ID,
>> +		LMH_CLUSTER0_NODE_ID,
>> +		LMH_CLUSTER0_NODE_ID,
>> +		LMH_CLUSTER0_NODE_ID,
>> +		LMH_CLUSTER0_NODE_ID,
>> +		LMH_CLUSTER1_NODE_ID,
>> +		LMH_CLUSTER1_NODE_ID,
>> +	},
>> +};
>> +
>> +static const struct lmh_soc_data sdm845_lmh_data = {
>> +	.enable_algos = true,
>> +	.node_ids = {
>> +		LMH_CLUSTER0_NODE_ID,
>> +		LMH_CLUSTER0_NODE_ID,
>> +		LMH_CLUSTER0_NODE_ID,
>> +		LMH_CLUSTER0_NODE_ID,
>> +		LMH_CLUSTER1_NODE_ID,
>> +		LMH_CLUSTER1_NODE_ID,
>> +		LMH_CLUSTER1_NODE_ID,
>> +		LMH_CLUSTER1_NODE_ID,
>> +	},
>> +};
> 
> These tables made me wonder, can we determine this information from the
> DT? For example, by reading the qcom,freq-domain property. But...
> 
>> +
>> +static const struct lmh_soc_data sm8150_lmh_data = {
>> +	.enable_algos = false,
>> +	.node_ids = {
>> +		LMH_CLUSTER0_NODE_ID,
>> +		LMH_CLUSTER0_NODE_ID,
>> +		LMH_CLUSTER0_NODE_ID,
>> +		LMH_CLUSTER0_NODE_ID,
>> +		LMH_CLUSTER1_NODE_ID,
>> +		LMH_CLUSTER1_NODE_ID,
>> +		LMH_CLUSTER1_NODE_ID,
>> +		LMH_CLUSTER1_NODE_ID,
>> +	},
>> +};
> 
> ... this might be problematic, unless this entry is broken. On SM8150 we
> have three freq domains, but up to now we were programming two clustern
> nodes. Of course it is possible to define that node_id is 0 for freq
> domain 0 and 1 for domains 1 and 2.

The third cluster situation on 8150 is not super good - we e.g. only have
a single LMH irq that's shared between the big and prime cores. That
was fixed with later SoCs (which is why it's not wired up in the DT today)

Funnily enough the bigger 8180 didn't have that problem because it only had
2 freq domains

Konrad

