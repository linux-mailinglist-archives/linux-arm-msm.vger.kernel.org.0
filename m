Return-Path: <linux-arm-msm+bounces-100807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKN8KJOBymkI9gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 15:58:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F152A35C725
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 15:58:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13AED3019805
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08F173D669B;
	Mon, 30 Mar 2026 13:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OeAdDotn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XDRQSo2k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA283D6491
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 13:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774878622; cv=none; b=rw9Gi5k62ujCoa2IJ1Cl84zjKE/d8xXz5ovORrM3zuZKlkvx79Tv3OD4yIqlnpx6OIvjrkhuXb8fgcVYB6ptF8sm2sgIyi4OZTJUtYZWn3NQt5UBrOEmRBCvkfDfDXudBo/nAmFUhVbptIzhI9B2IO1OJ9sCfpn1iA8BXLQUx8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774878622; c=relaxed/simple;
	bh=wJTaK/3MgbHLlTZwRsdexgzu5R+wd740pBhkmxsfW80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LoKa/OpblSXJBo+A7YLkzPGWQQuWAGWN9Rl3Axd3Lh6pqvWS9/Oph9/F0REUi2wuZigHPLjXJL2YWtpjo8U0vmLADc4Qi4/KpyboE88wDs9GrzZcZC7Okwii4njkpxEGvFWUm/NUTElFxLwzsYLcm9ExwnRpPNykOIli+VcYHHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OeAdDotn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XDRQSo2k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UA7lVt3539773
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 13:50:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ghXRs7AkcndTxgwex/hFYFQBs7KusiFa4yNiBkpXmNw=; b=OeAdDotni+bpRsev
	+u/L+FkJAzyvZHwYMmcmELVFs7GWLn2Wvg45yNrQODKBfjl0wS32rrS50YB0ox21
	vVB6Mq5oJIOi+4K3wYJuTPkxbFV452xroWARsSYoLTw4AORVixwPYAJbPmUzepNq
	jGhaAJGe5XK3CGBQhubEe8r3pViA6KqvYxzp4lJoatsyL5Yl4uAwCL1k5qLvsG/o
	45BH4kXAkLaT8jBZ7a98cPhdb8CotIQDT9M80Mbz0KWVDoiuBlCq1OFys0FFPgpW
	En16TntWK9bp2BJVqv/ufNGVwvipGUxgpvlqazWYJa/jRooYyK4BMuAq+fPL5FqD
	z80qCw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7q59ru8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 13:50:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4bd8e77dso8777761cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 06:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774878617; x=1775483417; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ghXRs7AkcndTxgwex/hFYFQBs7KusiFa4yNiBkpXmNw=;
        b=XDRQSo2kYyFR1nYRVLAhs5gy4OEU0C9cBR8g5WxkoXwaOeOCwS/tyX0Kuel+DTRMyU
         baXq39lmU+2FwkQPxfj7qoLJEH6QAhi5CMCq8POq66oX9DgGlfFZ0U/SGZDOT8plVoTv
         YrlI3zrQuGAC0/88Uk39LB1ZdU2VO1t2vQKDbiRM2VE22HFIHflTF5F28KZhk+iCEATv
         iRj+MdcP/YxMzLCG5MvDzeCTPEIr9BfdASwE+DSUYswdAjpnayd7yVk/jfJ8HjxJN2dg
         sAzB4Zj1PDuaBUh/tDDWeCiohfrvpzBVD1H1QJ22IlrPnhdhK6Kt86WoWCQ0PkjzrrSJ
         6gNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774878617; x=1775483417;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ghXRs7AkcndTxgwex/hFYFQBs7KusiFa4yNiBkpXmNw=;
        b=sIVnedATNLAdjevQJA2d9vt1C/BeTW71ACoC7/C7ShlNY7k7zlqlNvOLryzD3FAygm
         z/TM6XVra0VwHsff0cH/dw6Tisrf7U+CzgQOQzHhnD+qT6h5e8/MyTcNPeTJ5sYQnM8P
         Gb3N/1W7uXK4aqpbk79ZFJSi5/yfVm9kJyrnYp4yb/zvKihU+8lT1s/ZCzudIQQppCgE
         R3Qxjh3KG2bD19d2K7eDFJbTQTwdvOUzRPaIiNaho/zKtRpPrBL1iUr+2iFNhpgEy35e
         HdWqYUA+XlWnL25Dxg70s+qedahaVtTfPWJ3cQT09OjrJ2fACihPRnqko3pjIsxFHLDA
         Wvxg==
X-Forwarded-Encrypted: i=1; AJvYcCXuHZ84R0fGbzvPVJz7/xbLAZ+lKHKM0UO8Ql7Jiuy6B7VKOscoA1WFEN2S3+0SdjRBSE+MJBWhfMCbc0Gr@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjqe/q/JEvH5IqUQetJoEi+CoekJTDzbepb/REBbdb27mnwLKH
	LLJZljytNTeD/ejFPd/EnLLjoUA5S6jHd6EGvlYmufWK87T9JpYBeVytVacollOmxDkhN6T7eZ5
	4+k7Lspks+2Lj0l1lhqVTwJfvOERYenXMrcgLnsIFl9PBaPiJybHArBDu+NEBdfXR3km4
X-Gm-Gg: ATEYQzyWbAUZcb+LV+w0dj695uNP609Np0BYKahfWyLTlC+VqgujyhoTplfoP4mWw9c
	ijLMkOCmLedX4BlvuRrrYJPJh3sYPamvsCscFw0/iuyxzZXjELLirAPoBYtcdEZvlQj7yrCXva5
	yK296Q4TptMDW/jg0hRyXWIbf1wtZyIPo9lfpZxlsh68t0e1RP6+pTs0qRKvdWeKPvzRjZQRHXM
	CQc30MWozj+oLbQ4c704kpBV/TM9X6iOsWvJyi9JjdxlcQgw3KtD1qJlUPT7r1icG1jk9pavv52
	ejkHzn0NdrWTjSbZ6TlH34OOzDZmeXNpZdK1xY8w4LSdw8oi+4+NEtBN5inmVWPy4H/vPH43r7O
	GbTZMexSyNUqQmJdahthvMOunD1thkIarNehewQi4sF+YHTjcFKLsmVjGV1Y8S1RvBrJU2GbaAn
	Ekj5A=
X-Received: by 2002:a05:622a:5a09:b0:50b:5286:f757 with SMTP id d75a77b69052e-50ba3949cddmr124616771cf.4.1774878617018;
        Mon, 30 Mar 2026 06:50:17 -0700 (PDT)
X-Received: by 2002:a05:622a:5a09:b0:50b:5286:f757 with SMTP id d75a77b69052e-50ba3949cddmr124616411cf.4.1774878616485;
        Mon, 30 Mar 2026 06:50:16 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae520c2sm296630666b.21.2026.03.30.06.50.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 06:50:15 -0700 (PDT)
Message-ID: <1fcecede-16f0-4ce1-b76c-32f569cb5e41@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 15:50:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] thermal/qcom/lmh: support SDM670 and its CPU
 clusters
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Richard Acayan <mailingradian@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
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
 <91af3fa3-85ba-44b8-8725-032f77c846de@oss.qualcomm.com>
 <lnumerwlyvmbdkwum64js46tbnvpxjrdrouhq3vybuwto4st3g@7xzr52e3samd>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <lnumerwlyvmbdkwum64js46tbnvpxjrdrouhq3vybuwto4st3g@7xzr52e3samd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: A8IoYnHKMXCqT4atDwAtAK55BZzPDGeh
X-Proofpoint-GUID: A8IoYnHKMXCqT4atDwAtAK55BZzPDGeh
X-Authority-Analysis: v=2.4 cv=EcXFgfmC c=1 sm=1 tr=0 ts=69ca7f9a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=wnmJ5AHhSq1Bmg3ccEgA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDEwNyBTYWx0ZWRfX+GyOte+dsJBW
 nkSkF3QKA9iErn3K4pw8qlbXPVNbBUuT9l4Zrqeb17a5DLs6kTKzbWxjGof9iKpJiK1fG281wxX
 4S2K9VW3ze5twB8DxD9szMObgzySKAXz20/G0Ms82m/EzZczE+mHOVaoXiDwOlo7j/58+C1RWvw
 XN9WbKpCOovQ2r2Y2xnnEyi4PSPmmjRfeZ2nnWBkANOtCH2EuFIqNW+7acFMAgaRWIq5OO758/g
 w4t9Dt41qEhPwsGD4RCx5wczdbom/wiwBuFjC8oNIJyiwnFzvucqWPvHgqn745HIIyJ0gynEbKU
 bm5LKVqhevlJBQRs2Yxl5rI7OEtICM0Yh/v0Kr9XZkXVdCj9LcCZV7SR+dTTfJ4B3n1AR+Xh9WJ
 Uf+0ViWJd9ULgUnQm3xQP9nji0DCFkX0quPXyBWVU7kUslnHnhCozSsEbZX4JX66MfpfQuj144/
 Bjz1RAkRuiofPdW3uJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300107
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,intel.com,arm.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-100807-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: F152A35C725
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/30/26 12:59 PM, Dmitry Baryshkov wrote:
> On Mon, Mar 30, 2026 at 12:32:29PM +0200, Konrad Dybcio wrote:
>> On 3/29/26 12:44 PM, Dmitry Baryshkov wrote:
>>> On Fri, Mar 27, 2026 at 09:40:40PM -0400, Richard Acayan wrote:
>>>> The LMh driver was made for Qualcomm SoCs with clusters of 4 CPUs, but
>>>> some SoCs divide the CPUs into different sizes of clusters. In SDM670,
>>>> the first 6 CPUs are in the little cluster and the next 2 are in the big
>>>> cluster. Define the clusters in the match data and define the different
>>>> cluster configuration for SDM670.
>>>>
>>>> Currently, this only supports 8 CPUs and tolerates linking to any CPU in
>>>> the cluster.
>>>>
>>>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>>>> ---
>>>>  drivers/thermal/qcom/lmh.c | 69 +++++++++++++++++++++++++++++++-------
>>>>  1 file changed, 56 insertions(+), 13 deletions(-)
>>>>
>>>> +static const struct lmh_soc_data sdm670_lmh_data = {
>>>> +	.enable_algos = true,
>>>> +	.node_ids = {
>>>> +		LMH_CLUSTER0_NODE_ID,
>>>> +		LMH_CLUSTER0_NODE_ID,
>>>> +		LMH_CLUSTER0_NODE_ID,
>>>> +		LMH_CLUSTER0_NODE_ID,
>>>> +		LMH_CLUSTER0_NODE_ID,
>>>> +		LMH_CLUSTER0_NODE_ID,
>>>> +		LMH_CLUSTER1_NODE_ID,
>>>> +		LMH_CLUSTER1_NODE_ID,
>>>> +	},
>>>> +};
>>>> +
>>>> +static const struct lmh_soc_data sdm845_lmh_data = {
>>>> +	.enable_algos = true,
>>>> +	.node_ids = {
>>>> +		LMH_CLUSTER0_NODE_ID,
>>>> +		LMH_CLUSTER0_NODE_ID,
>>>> +		LMH_CLUSTER0_NODE_ID,
>>>> +		LMH_CLUSTER0_NODE_ID,
>>>> +		LMH_CLUSTER1_NODE_ID,
>>>> +		LMH_CLUSTER1_NODE_ID,
>>>> +		LMH_CLUSTER1_NODE_ID,
>>>> +		LMH_CLUSTER1_NODE_ID,
>>>> +	},
>>>> +};
>>>
>>> These tables made me wonder, can we determine this information from the
>>> DT? For example, by reading the qcom,freq-domain property. But...
>>>
>>>> +
>>>> +static const struct lmh_soc_data sm8150_lmh_data = {
>>>> +	.enable_algos = false,
>>>> +	.node_ids = {
>>>> +		LMH_CLUSTER0_NODE_ID,
>>>> +		LMH_CLUSTER0_NODE_ID,
>>>> +		LMH_CLUSTER0_NODE_ID,
>>>> +		LMH_CLUSTER0_NODE_ID,
>>>> +		LMH_CLUSTER1_NODE_ID,
>>>> +		LMH_CLUSTER1_NODE_ID,
>>>> +		LMH_CLUSTER1_NODE_ID,
>>>> +		LMH_CLUSTER1_NODE_ID,
>>>> +	},
>>>> +};
>>>
>>> ... this might be problematic, unless this entry is broken. On SM8150 we
>>> have three freq domains, but up to now we were programming two clustern
>>> nodes. Of course it is possible to define that node_id is 0 for freq
>>> domain 0 and 1 for domains 1 and 2.
>>
>> The third cluster situation on 8150 is not super good - we e.g. only have
>> a single LMH irq that's shared between the big and prime cores. That
>> was fixed with later SoCs (which is why it's not wired up in the DT today)
> 
> Thanks!
> 
> Anyway, from your point of view, would it be better to define mappings
> in the driver (like it's done with this patch) or parse the DT?

Well, we can spend a lot of time trying to be smart about it and handle
the odd edge case, or add a simple comparison!

Konrad

