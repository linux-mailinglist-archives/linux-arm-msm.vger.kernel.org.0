Return-Path: <linux-arm-msm+bounces-116320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 63RHKvS6R2peeQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 15:36:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4923D702EFC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 15:36:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="M/B38wVV";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GI971ERw;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116320-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116320-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 41C07304A172
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 13:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68CCC3D9531;
	Fri,  3 Jul 2026 13:35:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE1B3D647F
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 13:34:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783085701; cv=none; b=NVtzSqFUOU6qCF6YtOQl4k3ARdkRGgk9ukTIsc4oyd81L35BemCeAba6TRA8+KQyfjasX9n3KJ3FAa/Yva6DPV2MHyZIVrEoR2Qc+04Ggh/ScWSSc7u3A9J1uxZaCCbqZ4auESvSU9QuG/Nx41R09KuZpaxext9YXSp4MW5rbzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783085701; c=relaxed/simple;
	bh=JkM2UpcqPx9B58KERsCPRysPzuvuZFFZnEq4O6HEgvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oRicVl86eqQbGXTxAeL8oNBEzs1Vc3E6UHNdjZbJyVQd2HeZCYMPTuVrp1QuWFfyKnDjc7XjBSqaKNtbibI2D+/Yba1K927Uyz95xdaXaf8tzNL3fwW6NwcKlHjk+aOfBjehfWGNtX/UeQMHhPaeIKTZHvWwohX8a3uwGrIbAk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M/B38wVV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GI971ERw; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663C6YkT3144211
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 13:34:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jqBviRqbT/IMeHZ+5dUpYAxMnFNQlS6hUXqs3HiclKs=; b=M/B38wVVR2ZBTJNJ
	0ZssfLIzOZ61rloETCwazrJKqVm8MtOjYd4Oz73cQz/r4eesfTL04uW3QCFU0IQZ
	hoKsP5MmRqikFGF5n3cLY5rpiejRhWZF0rCfpwU7G560pH2bvm8KQKIHDyiDJ3sg
	lzIwBS7ZyoPq3YOmcwbxcFtxp9KrCSVbAjUofZRDBEeyNf4MynAKZ/CFqg7ac9/9
	er3Gd86uj8ECqPO0icuYXsVvKqLykXIV5Nice1MifhfjKPrK+8HWrqE5FiIDJUWa
	QbnlUH8+TJyShD4xktedH6MymMLK5C1RXd4FJzBtlE7n0ZlWGgwKZzQ3Pi2IWh3g
	7bVoyQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f682bsgyp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 13:34:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e66fe6152so13299485a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 06:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783085698; x=1783690498; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jqBviRqbT/IMeHZ+5dUpYAxMnFNQlS6hUXqs3HiclKs=;
        b=GI971ERw+lnNa7rVOfBIbHNEh+H0ZR9aMR+6+zYNnPyoNhtXyseOqqOwBE6UNDPnl/
         Qa5mbOfw8d9+qfi2Weyujqxo8cBjNF6oE1zFn07oK/ZqBm2+A2xDTaiSS+jAOdnON8h9
         zX8FkfU3dx1J2NntRE/vp7BkKJwuqT3qGfD+7NGSL3wsuvBLs9pFyBH0IkrQCeq5sKOd
         m43mGNMukG9gGZu69G+ZVQc0w52QJFWy0dUIgX1Od0HvACCegsWL9AZz5IifC1uBbUMs
         n5P8O0hWRZbMgNPxjBEIDXv0ggONrAQpuEsaKyu38aU9FhiWR7J3OXMZzAVzxBX7RyXL
         M9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783085698; x=1783690498;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jqBviRqbT/IMeHZ+5dUpYAxMnFNQlS6hUXqs3HiclKs=;
        b=kuFRWQCqABzUB3t38cW3yDEYFzhnkpUeYFchAL/rklTiubcAX+gy2//r23QcT1Fiin
         ivwB0JHnGAk8zpg45+TN8532Rwi765QkBlsmT3K5NZm67eVPXvivyZtb3H0LqgiqZjp1
         5knrTgi6bWN50WZo8ZdHlgANW+CfdAPgt+3iUUBiBMuGN1SqQoDWvKBP9iLrp2sIIfZE
         jOctSN/m6uzsrMqjvy6i+iGvc8Ufhgqa/OMWBgtNENJQz8fpKc6Y6Ys1yD0EER0KDX/y
         y2LHOYFQYc9qv1+1GUAsl1Pg54Rq7cNm9kzdOP7dVZEbkM9WFbCpg80C51h1hRHGKfV+
         XT0A==
X-Gm-Message-State: AOJu0Yyy7iVE7wnF2IROlnpXB7NqG7bs/DsaoXTOyxGZAkswqt1EnkkI
	I7gYml9hqrSBHj9wwKawqkiqlD1X7QEbZc/n+WYIw7DorUOa583XuVa7exy//H1ZpdAtcEse91y
	QHC3sGeHL/znEhY39Ib0CCA57ut71/+OwUmK+9AR/2Mh6iVf5jm+jq4pzzOZmkrfWl08tGUtxrd
	yu
X-Gm-Gg: AfdE7clZADF+r6frkLSNRIZQ8IB3PbQbaTye6FJGi2jXwcWVkqpVjD2T33YsG5cXm21
	5hF/2NhSiGqnm/9sih2F6D/N3w8OOPtdtE2/aqFjnkt6IE4usuPe3i+RUYGcLf4aW3LgqWCfu60
	DZpohzjL09qXrcx4gIdzkWctV2ZPBtHPUUoR0NDiFaOvvkBWHw9TzU96gXQpoaxEqEW7RfWasti
	6CIX917VY3cMDy81chdH7Zw6dwhn8e+4RXocDH7JqsIHafQpumISoS2rxnCW/MIHb2CeauDr2oZ
	S9WPy9CNCa4/k8LB5BEQIelYODtld4NlrRrWcfSI2+TM33ZL1ayLraS9bwOG2QQjqZ+1QdZkRK4
	iM0yZfne8atB8LZBnIZI/Xsyy8FFwDS1js1Q=
X-Received: by 2002:a05:620a:1a0e:b0:915:6433:2599 with SMTP id af79cd13be357-92e7821f763mr867426285a.1.1783085698021;
        Fri, 03 Jul 2026 06:34:58 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0e:b0:915:6433:2599 with SMTP id af79cd13be357-92e7821f763mr867422485a.1.1783085697647;
        Fri, 03 Jul 2026 06:34:57 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6054a97sm284606666b.2.2026.07.03.06.34.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 06:34:56 -0700 (PDT)
Message-ID: <a862f1d4-dc6f-47cc-b56e-3b54b32c7443@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 15:34:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: monaco: Add passive polling-delay for
 gpuss thermal zones
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260703-gpu_polling_delay-v1-1-132de4dd3cad@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-gpu_polling_delay-v1-1-132de4dd3cad@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEzMyBTYWx0ZWRfX9GBUY2Geqaly
 t2ZtY/nnkDWNR7PeL+9xZv9Jhx/v4V5bmx1k9koRI5lywrnP/2NR3bzJblAVUh+BR31Hz0skudw
 v6p1CbaYBZCsIl3Wo8x5Vt+w5VnjLxRhiz+TsqSujkHhOX3MpqkndGNik+lAKH/gbaGjFOcvX7W
 +/633hnwrF0f75pAUGvSrRQGim9NXJXwoN1bpb5Rtaljm+aUS/jMLi6+a/NAp0Bi3T1sxzWNBuf
 XCTlr8HObaWbwJYOD+7Od3EZwwklzb6NwpJc32o8SqNVVuNijml5upxnZMB6m5i0Yyle6lZ359d
 jlVVDRnXOyEpvbqUpO1MNuiVISMAjyHn8/j0vFHeg6XNo34jwHlywJVKTgZKFyXiD4FQ7SCQWza
 sFkxthBrLBY+VT2mQCATXWzzCaKg0yuPezzMf5JB/jOpWcG1be6en9Jeo6TbNCdjOd6RE877ZZy
 qy8nozXnsrv/8vFV0lA==
X-Proofpoint-ORIG-GUID: G4UOkqQtKySC3JdPFE3ZLCcyOPDHjw_8
X-Authority-Analysis: v=2.4 cv=cc3iaHDM c=1 sm=1 tr=0 ts=6a47ba83 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=3W1yRxDTcY_M_aWfLUwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEzMyBTYWx0ZWRfX4DNKm7RdSLS5
 3RT704Qwe8HKq3EGRCaN/vJN8uL1ih9SNE39qPI+PHJ3EUmmZluJcJgj0vi5V7xlJbcuCl3YrsD
 H4iyhu6IPKo+n4k4yFqPR/guNqitWcI=
X-Proofpoint-GUID: G4UOkqQtKySC3JdPFE3ZLCcyOPDHjw_8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030133
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116320-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:gaurav.kohli@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4923D702EFC

On 7/3/26 7:23 AM, Gaurav Kohli wrote:
> Introduce a passive polling delay to ensure more than one "passive"
> thermal point is considered when throttling the GPU thermal zones.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

