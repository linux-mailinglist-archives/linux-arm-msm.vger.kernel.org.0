Return-Path: <linux-arm-msm+bounces-92771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4POGO9QIj2ltHQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 12:19:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4A5135AF9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 12:19:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9EEE530AFA80
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 11:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7727C353EDB;
	Fri, 13 Feb 2026 11:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZKUd9Pfr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mcwk/PSt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3969D34F461
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 11:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770981256; cv=none; b=m+sb9s1aWL5yNWZv7dI/kTPFWkyzSLW87GyLbVPY157CDvvZu80phsorg4fZKrUGyybxVpzS3o3HZdSoo0VJxm0vH1Uti8r91S6iYKtHrhnFX73clJpHYO2l2OH0Dg9XrHRZ9U3taJujt1E1y0Fp43fGiY/FYa9C7lcSb5iY0rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770981256; c=relaxed/simple;
	bh=a28rbnnIyfM2Q7sOoR/5JlN04Cll5610C+c1yHTmtQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lt2QL0jUrwTGMwp6yXP2uvpK+uMWUxwBsN3WVoSCx30VDQ+6fw5k7+L1ncBJyZxXtb6iOqvHIdroteefUPc0m+LMfWDq4tsrD/A6Y2tJx+va5XDqZGW3XS4DZUoL/gbqlVqsIu+t/7BUjUqgfqcbPlRXzHuEjUdcfus9TRy/gy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZKUd9Pfr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mcwk/PSt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D9eol43023502
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 11:14:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kf0MsnTl1MoxPVgGzu+Koh9phahROaNevqsbTzSVCnM=; b=ZKUd9Pfr0yxAL1GI
	MQSRCEhfkJglu9+6nNnDw5kpHryplPFl53WMA/qoIMCowX/G0zTkF1XMlIP/SiHG
	Zc3pR1WkzfdZkc6dVj/ip1yi7mvUmBJYMVp2+xNIXhazPlfDSIHIeRbiz3wrcyaR
	ktaQRXbnUK7R1i8sH7GSJi8vpGLOj7GKI5/VFZdlJC+S8rfCRUz+rzyqm3QZPpUh
	6PJYNyEEm4JKuK+6axhVdWtGrXFGgbI8AD4EWXcWPikg/c5xS4igZCqXM5vSN0XF
	SxyqoNDUBk66OWHMom29rSpj9a5SWK6dDC2Tl8Kqzx/sQd+Q0P+oBeecrSoBXrem
	yiW1PQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ca1hn09e8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 11:14:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb485c686cso6355385a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 03:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770981253; x=1771586053; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kf0MsnTl1MoxPVgGzu+Koh9phahROaNevqsbTzSVCnM=;
        b=Mcwk/PStO8GoyzgR3zZmvBixvNvJck2Zl+skDLyt0qT0lA4cB/VQ9aTCYZjUXQCPGF
         e2Z/FCKxrglA8XpcYgkXQpzAw4K+uT4gDMfWWhdsKlIycCeb6N85VB2nLVlE8dTwAcYT
         HZ8Z0HTHq6CyC6ebRFywNxXQpLIk7vWBd8Ew0ORWY+HyP4KotAqZNK+SVoDsOcCMhdSt
         +3cgoY/gb8W84QLVfOrIQd3eDrOh3iIBeyApafWxDvkG+OZgX60jnVlxwNMOx+K9GkZy
         IIVHAGGCtxKzVEARmu/RnIPVNCKaabqoCQxOtivZ9nQiyAeKg3ZsOBivyQUABCKzIMTA
         Q4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770981253; x=1771586053;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kf0MsnTl1MoxPVgGzu+Koh9phahROaNevqsbTzSVCnM=;
        b=hbVtrQW0TjOy27YTHQ7aQIur0Zu6aRmnYtV3IW7dwi8zCpYaVbWfWrd3ltdZUVPviP
         oQC542Lt43cVpi7Vbl0pTwKQnMiCraY7Z2tPg1PYeqI2fFkIotvheRvbBZ31Ty2oiR1L
         QWJ+1F+jlCLQgfnwfF42cCscsFwJWkUBpmHrZPkFwe2I8Uj7CFbwqgimgiAeyzJsFpMT
         lMa6oJR+auQFxeFKL1soWPqRF4oM9Qot93A2uPGXGKg1NV3UDhZI6n15kPmJwYKQSJ/U
         eRa1Mdd2NB4qdEiR3WvbmvV+TRt3u0M+rzwDZfxJ3QbanNoISI1Hl5HgkhiSQPQHiy0m
         B9PA==
X-Gm-Message-State: AOJu0YwgvvRUxmIEL/eXzSPcxJdY4OA9jNBoHZg36k7qOKcqc746jlhd
	9lOPODVfXXUqORnJUbhQUPDmrKE4RhWyrYy0AU1aoHYx4eMaWllfzshEj3UO3fi5Rh1HZrbAgLc
	o1Yn9Seag0cMb4g4IxH0Zod1MCoA0GdeRlIMijGAh9cZbzz7K6yMoWXT+mIAjzv41C5sp
X-Gm-Gg: AZuq6aJ6v7spG6SrHaMnSHJXdPnk/qTBGFky6gVBrUqrz6bhfjqdCxXueObm2j6v+ot
	l7K7lIEmh9RziqHmzIxf3KviF8oXw910Kom8mdsa1ZpBuu8uN3AhrEuDrWenbSnRnHrhaLvfjEE
	rkkLjLOAuGKuwy+Ju9aiDsOQ9xm3GEEWgCMo+xeVyQWCRQxtkyJnMryudhV6zv8l17fdqD7N6GT
	NIaLULZgbwFrfmURf01sO5KBzOWI93D0SOe645efEAfS/gV2euLAZl81vNlrtHT85wxVObGFUBy
	v9nHmejChQuV/ip/vRYvV141mBe3D7m6YPorp6BpbRBrXMZLyrazncWCoMK8UPul/4y9HJ/TDru
	xvYX6lQCo2gboapEcX5LX14AzX+YfyvRkl1xq0zMpxiN7vHKvzmcyQVF441j3MJ+jbEtLudZztL
	9/Pxo=
X-Received: by 2002:a05:620a:454f:b0:8ca:2e7:56c5 with SMTP id af79cd13be357-8cb40916695mr184541385a.11.1770981253582;
        Fri, 13 Feb 2026 03:14:13 -0800 (PST)
X-Received: by 2002:a05:620a:454f:b0:8ca:2e7:56c5 with SMTP id af79cd13be357-8cb40916695mr184538585a.11.1770981253134;
        Fri, 13 Feb 2026 03:14:13 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6eca3f67sm243715966b.59.2026.02.13.03.14.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 03:14:12 -0800 (PST)
Message-ID: <ece590b8-9a29-49f2-934b-6082f093290d@oss.qualcomm.com>
Date: Fri, 13 Feb 2026 12:14:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] phy: qcom: edp: Add per-version LDO configuration
 callback
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260205-edp_phy-v1-0-231882bbf3f1@oss.qualcomm.com>
 <20260205-edp_phy-v1-2-231882bbf3f1@oss.qualcomm.com>
 <200b055b-7221-45b5-aea1-2462e07a3c1c@oss.qualcomm.com>
 <8dbc18a0-6a64-491b-84b0-ba220c9050ac@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8dbc18a0-6a64-491b-84b0-ba220c9050ac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Wt0m8Nfv c=1 sm=1 tr=0 ts=698f0786 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=cNRGMQsWfAapTQTvfRUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: eaR-ncWgaRvNPrQGblO6wONh8OrbPoJi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA4NiBTYWx0ZWRfX+XBtYKSJsSlR
 +myx3lpQslTbaEsHcezMBKD00R/YWT25KJtyQ/upuN5MW58BqDxJBmyd0OGO9ozcOeIdt+hnQ1e
 tZwiX0Wvi5ArQ02I7MJJ8ziKuPqxlM9vDoIBuOnlxKMYz1MJakroOm3/NsEdTXytK/77QKBh/+O
 uJJe8PQFei4U0dHmtM5zwihYbnWo3PDEtwBWY6+RZKkE1cdHQEM3MWzwqcmt8FA1vjXi/nYjFvc
 w9h49iy2Xva+AlAnXzfyOg/65yOQ9De0Hr9UBmK72/ZVcdzLJQS1NyWaCTQv2NqYgFINcRYORhD
 cA30lAnhlzwvRzkaWXTFJI/GoFgK0VDVnBNpF6XS3WzwRkAB+AiRTK8wam5mCC75KIZDPJFfVoz
 nay1ZxGxYBykLcXPradHgXCRLCmY2VV21mxeRVUl9rzpCtyESD/PhjZd4eu2zIYWO9lO2FVP1gg
 WxqxXwdrDhLfs+azVVw==
X-Proofpoint-GUID: eaR-ncWgaRvNPrQGblO6wONh8OrbPoJi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_01,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130086
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-92771-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6B4A5135AF9
X-Rspamd-Action: no action

On 2/12/26 10:04 AM, Yongxing Mou wrote:
> 
> 
> On 2/6/2026 6:52 PM, Konrad Dybcio wrote:
>> On 2/5/26 10:20 AM, Yongxing Mou wrote:
>>> Introduce the com_ldo_config callback to support per‑PHY LDO
>>> configuration.
>>>
>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +static int qcom_edp_ldo_config_v4(const struct qcom_edp *edp)
>>> +{
>>> +    const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
>>> +    u32 ldo_config;
>>> +
>>> +    if (!edp->is_edp)
>>> +        ldo_config = 0x0;
>>> +    else if (dp_opts->link_rate <= 2700)
>>> +        ldo_config = 0xC1;
>>
>> lowercase hex, please
>>
>>> +    else
>>> +        ldo_config = 0x81;
>>> +
>>> +    writel(ldo_config, edp->tx0 + TXn_LDO_CONFIG);
>>> +    writel(ldo_config, edp->tx1 + TXn_LDO_CONFIG);
>>
>> tx1 should be dp_ops->lanes ? 2 : ldo_config : 0x00, in all cases,
>> I believe
>>
>> Konrad
> Hi, here i want to confirm again.. In the HPG main link brinup sequence, it not say write TX0/TX1 ldo_config based on the lane count. Only when we switch the lane mode,  the LDO config will be updated according to the lane count. so here do we really need this condition?

I don't believe these two cases are differentiated in your patch, unless
you're trying to say that the hardware is smart enough to turn off the LDO
for TX23 on its own as we switch modes, which I wouldn't bet it is and can't
find confirmation for

Konrad

