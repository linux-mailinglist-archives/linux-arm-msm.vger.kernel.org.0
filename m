Return-Path: <linux-arm-msm+bounces-91062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHmwGos9emlB4wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 17:47:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2A1A61A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 17:47:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5D1A3120962
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 16:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93A0430BF4F;
	Wed, 28 Jan 2026 16:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OkBobwmQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GtCP/RxM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1952FE044
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 16:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769616553; cv=none; b=Mh7bAbGdI5vf9EQLHuq0OeJInXWXwqCY0EnnHlhbxqvXiCa2qa0LcIg9ODfDpRMag2PvvhsyyuDRpSFwwRn7r+tZw1+MZZ7Ccgn/zay6adfF2d7StFelxscfckg/lQkPBh3BL+sectLAf49qbC5sS6YrZ6mV2QPqsFuMX9NoZU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769616553; c=relaxed/simple;
	bh=v/AAnFBaLz8W76NNtzAgAljeodgHxKUAx1qI0i6IFYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=neRA8fW4BdhykepcyiLO86OZVjYfR9NlJtZbS5JAA+dfi/KdWf8XNVSlH/tUP//n1UrvP2AceejgPsvw0sBsR6l84+KUG9xgVBoxPW2pA+32QbGeJOgBgp+kX1NOS8tdYij3IKmLQZkMQhCc0ESKkqxDZjaormifuxN0q0DQUI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OkBobwmQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GtCP/RxM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SFWBhx320313
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 16:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dxbdgO5XaQIAG0/7RMvA7vsSLpOyTsZYiIdwwatHLdQ=; b=OkBobwmQYsDAkCPP
	fq6ICV5v5Tm3nXAWExo0Y3FwjLT3v+4Cigf75EXq0e9DmZ40M+BkyIV7okTG0jna
	J6BYfF9LGx9KQnpUwP9DEtJMgBEfeh2lTQnFqTya9OMSHCi+dtb7m3Q0vOD2VP6F
	MFlHggdaRxiL3x/Qxt6DpcfgR5Bumx/sU+lxoGDf3lgjKYqeoKoLvw3+d3OlLylD
	ImIRKmEM8F8AFV5pC8OxJHVRmRavNBo3c52zUh4Xvz8AfDYMhJC9JHp+pi8H+kTj
	a1WkPFbi/xEl2s86kSsQ+GWo4Midb1h4OUaPBBelEXJwO6chT16pLaFFBX2dj7CH
	8fpTkQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by4sjujw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 16:09:10 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b715b26fc3so9406237eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 08:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769616550; x=1770221350; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dxbdgO5XaQIAG0/7RMvA7vsSLpOyTsZYiIdwwatHLdQ=;
        b=GtCP/RxM7ZNSUh9tqxzc952NVucLMkUBVRMegiVRCAAQ08XdK+rAcDjhYjOtTcCdTQ
         rw4de0N/QtvVJusPNglR+a6mGJeXMI9SLBmpm0MBFk8J2XKd1JKRyaR2P/1RbkDgjotv
         unRUFgtXojZDY771+E45UGlLr6or2LLyXJAnaLMXoFom0uDDHJXKT/gDuCNa1m0gKhXw
         7JVs/AJ7wM9GOF6A2v6HvesINJjXgdHR4ojiGCHeU9+r8RMfmNl4cNv7ZLYx8lvBVLkx
         td2D4nAXTaTQSmaLRu/lpGa6hpqhpdggIkt4dAyZjnrhjVKxBYrkHrq/NcdmmGQof18w
         5+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769616550; x=1770221350;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dxbdgO5XaQIAG0/7RMvA7vsSLpOyTsZYiIdwwatHLdQ=;
        b=lRRUPjdcJNtmH0CpQV1zqyh0OhFOT886LP5/Phw+0BzXoIx7toV91jnmO8F8q0cQza
         mKQGxpia6GAYccYLI1TiuPo/UKVnGNSDQgZBCgf8rfuoDjVw4vjFffq6KqegCuNMCEKM
         BCBY7baKQidHO4vaqiqw1H1MoZGs8+loa3Rtcae1YixUt3+A3UA60+krZixa2dOXbNzz
         HWMeNI5FZr/2+8rXZZqPZzt1Cd0AgREZ2CkQUOAj9nWAei6puaVLvU3h5Fz3mMe30J9U
         WdemtNnW2QMVU3l3Mc7yvWd1/cLVFZSkJxNe667eEaoyUOWgBWzzwC3k2TTt0NGyoRjp
         yjmA==
X-Gm-Message-State: AOJu0YzRvZEJf1v+2xCzEnr2rp8IdRw6lMRS9KHDjxTVwL5yGs4avaq/
	ZrF4H/ooTWnbChlCc9CoDG/xGlWBDJoNMykOkTPE30o5H7ZNpOOBY2o0vcjVfpPPESxWoiac0by
	ea5zipZHn8Z9RODlCWiTHe/qdADvYT0cfO/pwZ6TVo61kjaMXw53Ku9ynEeMN8cIbC+A+
X-Gm-Gg: AZuq6aJ2Ws3ndZV5JgvhmJNfkk/eS5c2YZidnDkO+kpTKoivxsNC23uIEe1/XtK/h8I
	+QdIz5YGGs+MO+/AeLRYvHyio5lo3yT+eVNRI1Jnzorp/VEgklSua+Q1RY1Fea2CloAf7atNn8J
	NrWhroV34jxcBZxtQu1TFD9h9A+aBt7izoVHygPVc+6A5id50yM6UzwWxIlhiADuai4rtjegFR+
	CimpYFWUmtNHDjeBmXr0l1WL70kRv+b5zsvqY9enqXLh1T7QsLtuUdUB4dsVqCtohpiqmgRgz5T
	DNLWw/FW21PDVlVbf/nS2qOj/OnAFxMAQ14AasYgmQXdJ1PCb66WSfy0fHlfHITEMD96mGwOo4m
	psIXFdlMR5hWL8NTqDNohp7TjHHeafNUpb4E8jWBymFPq9Q==
X-Received: by 2002:a05:7300:3707:b0:2ae:601f:f4f7 with SMTP id 5a478bee46e88-2b78da68e23mr3217851eec.40.1769616549937;
        Wed, 28 Jan 2026 08:09:09 -0800 (PST)
X-Received: by 2002:a05:7300:3707:b0:2ae:601f:f4f7 with SMTP id 5a478bee46e88-2b78da68e23mr3217827eec.40.1769616549271;
        Wed, 28 Jan 2026 08:09:09 -0800 (PST)
Received: from [192.168.1.3] ([122.177.244.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1addafesm3208959eec.25.2026.01.28.08.09.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 08:09:08 -0800 (PST)
Message-ID: <f9f7514a-8841-43b8-b01e-aef4aceb8d3a@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 21:39:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: talos: Flatten usb controller
 nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260128062720.437712-1-krishna.kurapati@oss.qualcomm.com>
 <20260128062720.437712-2-krishna.kurapati@oss.qualcomm.com>
 <2324aa41-6b2a-41ca-9f97-7a5b5e0f575f@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <2324aa41-6b2a-41ca-9f97-7a5b5e0f575f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDEzMyBTYWx0ZWRfXykq8LUZ/Y6Tp
 yBZ91lxWcOiBtTu9hMnJg+7xzJ59PmYeLjciZKB4Wj/hljvJShdLhv/kEAl8G20bbkwYPrFkGBc
 L18uHryeAxvy3vM19QGRzmXbKLJPY7+ZWOywilsY5298CGH2tKWjuuwG7NEBOhnrMRVJeaLHyEO
 FJ8JH1uG/+hQxRDBcFPcPG0WddD5qVOHY/GaoCuh/z1lHc6QHSdvlaAQvcYRc8FFazLCgpzi2ZP
 Mt/UUoivOfp5UKcpUFUyk4GLsEzewsbb6O9YvwEfz8tIQVwkeAcnDvKCMztYkRD7eHXpsbugOGh
 poPI0LSHfWEhZeDqyOzDURer7rtT6hmSMf0OiMNhzJkRSnG31c+C7UJ1puYweXmEZFM+aYRCRc4
 6sGbRoVcFgz90kP3Fxdb0U0WIRcWbUw5brb//7ANpUIte/WVy4lAWbCmNcWP/FQV+PSdSLIJuEK
 pfcgL72OsqFAs2TGSmA==
X-Proofpoint-ORIG-GUID: pGiPL3RSdtzSXIghGsiT2Aa8HCq45yNz
X-Authority-Analysis: v=2.4 cv=KezfcAYD c=1 sm=1 tr=0 ts=697a34a7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ni4xaUQv+UexsgkVNKbnGA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=AyQCSZuuk-tLLIqlLXYA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: pGiPL3RSdtzSXIghGsiT2Aa8HCq45yNz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_03,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280133
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91062-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CA2A1A61A0
X-Rspamd-Action: no action



On 1/28/2026 4:01 PM, Konrad Dybcio wrote:
> On 1/28/26 7:27 AM, Krishna Kurapati wrote:
>> Flatten usb controller nodes and update to using latest bindings
>> and flattened driver approach.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
> 
> Have you checked whether this brings about the same crash-on-suspend
> issue as it does on Hamoa?
> 
> https://lore.kernel.org/linux-arm-msm/71c15a78-7a50-4913-b677-e5308fcabfad@packett.cool/
> 

Hi Konrad,

  Yes, I did check system suspend use case after flattening and there is 
no crash seen.

  The only issue I observed (both before and after flattening) is that 
waking up from bus suspend, there is an enumeration failure on second 
port in host mode, and an xHCI CMD_RUN timeout occurs. The issue is gone 
if we keep controller GDSC flags as RET_ON (not the right solution 
though). But this issue has nothing to do with flattening. I will sync 
up with clocks team and try to fix that host mode issue.

Regards,
Krishna,

