Return-Path: <linux-arm-msm+bounces-113992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hpA2DLgyOWp2oQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 15:03:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C07336AFA49
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 15:03:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PyJuQkgb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Q7NI5w8R;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113992-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113992-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 99AB13011063
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 13:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B94063B0ADA;
	Mon, 22 Jun 2026 13:03:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3F23B1025
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 13:03:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782133428; cv=none; b=krk5gRUJFfH4CIaBgx1n8WsL8SFU4pnsoyITThmOKnxGD5d1y/OeLbvgFNKaZ7zniYaODiNUV9fz1wP9+jHMpY7gqOCTvB2JZ/ao/wlt9v8HkUYvxXBYwZ+5VJfRXXuFEpJD4ySiTMzO6OascYKO91sbiWNdOEvFCH9GRpkCM38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782133428; c=relaxed/simple;
	bh=LfAbiZfa6DruHOchJf2O4gSn9hmUf0OdHh+EKVCKKXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=if+Z4hLhNWSnEt9d7kLaB+HxZPv9q5u5M+XLl1Y8/NqgN51tyxa9ZYU/4KSbedOBQCUwI2Nwzf5Rg5TJL19H8KAD+F+RyVjQoUjoYxZgKn2htGs0fcHPnIAfX9Ovzur0WgKr2zhTzVqyYlGDN47kZ7s8hksfx5bQni23f5vYLh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PyJuQkgb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q7NI5w8R; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MAoH831017113
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 13:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S+/LkGW4Qe6UVR0xMsntXktSlgIAIOfnsCAKWcIu3AE=; b=PyJuQkgbpZxw0ED3
	n9c8oId4IxnAv67n5SzKZ5wC+rDiXkvbqjIWuBPW2NWS1rx47/jQeMJApXWHip2o
	zf4PERzFf6QneBe2Tnc2pAep9kFt2IeVfpcqWnI6ClBpmnZtAYpZ4OxTckdtFbUd
	USm9qfwcvnvoA4Mr90evhQSdMrrMoOW2MnQ6BA2vQa9q1YgZmdLuq2DbX5feEzbM
	ZNeFJ/I43buR8bB1AHrJUqmaLamM9ixjxT207VM0PjEW7BmUynkg4cjqqFuSpBLu
	X7JwQgqZhCuwPcQpRIFs+z4557OtKDtInqpJablp1X/TbptZBlIMwRm/nNhqE+rj
	CXZF6A==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey37h8gw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 13:03:44 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e6e0426fd3so2147384a34.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 06:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782133424; x=1782738224; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S+/LkGW4Qe6UVR0xMsntXktSlgIAIOfnsCAKWcIu3AE=;
        b=Q7NI5w8R4jq9GldxYNgW3yVXZo1VQMC6ldgy/6DSpOh983XBRzcyd7GPlocW703ZZA
         HeIrHFvjwe89VrSEobKoxLnY0u7k1ULL9R70efoPrZXbsPP9d90A/G3FsupF63KcusnA
         2abhCaZtHKT6Hf2D8FYUsWeyx3Nc6inksk9tE0CnfjVrVCETV8/qFEKwf2GyiZmRKU+O
         dTgwNFQqzFCFnIgJgW/IEpTxG4c6vt6B6UTnH0XWwQFsegh9hCgOh/HLHWCL7jyUf4sN
         3iWGQNyff5RkbPBIpRLXSbfvNuK1H/JM5rze5+tNNNrn5sUCYVpGiPf8pcFJwVM3A5v3
         BWDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782133424; x=1782738224;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S+/LkGW4Qe6UVR0xMsntXktSlgIAIOfnsCAKWcIu3AE=;
        b=Ug+Dhx9F2+wOkFawNRFjAkyJqhkkscC5vHbSpMGPyUMI/6vXRjovcAgYe+BTp5f8QE
         oXuy2F39CMFuLqZUMTMQCbtYvZdOF9mkbu/yh/Ohu5krw8Q/9RJ4XbGtHWEiaS+icgvs
         o3Eudo6ahorSD3u5EgLOseRo6OpgcsjxyH8Datd2ZFQtGYY3ZbSqDqAvSLitwN+OwXmO
         qJL73EhR66u13OKOwjHJxyj4HZVgpc1yGQ5oTLTqbznkbLluEZLGssk66H00XwlzTEPB
         CE1zlo5efHCiJoOt6jExObxYigQ35/NzUt6CjXE2MFN+3wNL4MR2Zs8T3dIV5gkdA2JC
         mXGw==
X-Forwarded-Encrypted: i=1; AFNElJ8Co65YB7QtX+hMCoNxbrctIBB7SbqU5RkiDOsKBzLbPVB/IJkM2yx61R1xlQJMzzv4gLhXvBY0idZ/mL0I@vger.kernel.org
X-Gm-Message-State: AOJu0YwIV20sPVJl07I0M64kwp4HqbE049TEQuwTGKlUbkTjpyW5wbUB
	7N3sLxvxQRCZpjLa4JxNXQVFjlIBEQDImKOA0AEk65+a9LAjhOSyyoOiXrhbW+yRx5R0Eul4v2C
	bFk0oTs98gQ8KlCi/CI1ipfWD2r3FaMcJ8Ve5IZobQ3SvU/M8iH3mXwYbS1Ag8Psrh+Ux
X-Gm-Gg: AfdE7cmOs9Qa5WuabiRQN+1nn+y5fFZmaeS8ef5ZgQdW4XLlAVIN5dP9e4okuPefQoM
	f3pM7d6iC+cirn676hEzTaZPEM4fp4rZib73fa44yQMpD+YUIKubwOsv8ezFVkl6jnrAvnAKkk5
	aT1q0yAsPU5W+NfQ1VKum7qFGr2L7931iD8ACi853h4al+1zU8qgBMcDKliKcasbuJKGXnp/KvX
	tUUA2iZdHc/9TKuHG34DJLFLKnhpzstIqo9/mkaAB+9K4UACQCnDiQi0qA9jumcGFJlWMhA8o0i
	M6/4LaD3uJJT7CjpnABNR+CQYGx80FdyRuCEq9OLOwA2cdlUrFxitTbj8/RTR9s00bYynlP0qf6
	MU852xOC+wyh9xGYwC9wb2BRV8kruP3B5iPU=
X-Received: by 2002:a05:6830:2585:b0:7e6:da95:a7b4 with SMTP id 46e09a7af769-7e970b12dbcmr130901a34.4.1782133423604;
        Mon, 22 Jun 2026 06:03:43 -0700 (PDT)
X-Received: by 2002:a05:6830:2585:b0:7e6:da95:a7b4 with SMTP id 46e09a7af769-7e970b12dbcmr130872a34.4.1782133423141;
        Mon, 22 Jun 2026 06:03:43 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e49b77bsm356454866b.2.2026.06.22.06.03.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 06:03:42 -0700 (PDT)
Message-ID: <cd7619b6-a428-4ad3-9926-52b846953634@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 15:03:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/8] clk: qcom: tcsrcc-glymur: Add Mahua QREF regulator
 support
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-5-c939c22ded0c@oss.qualcomm.com>
 <5f32d4c2-f90d-4f66-96b1-c9c7987ac18e@oss.qualcomm.com>
 <ajkvV28hEWFfnwa6@hu-qianyu-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ajkvV28hEWFfnwa6@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _snor4zJ1d3z5VzTIm6CUiBsWqQR0Dd0
X-Authority-Analysis: v=2.4 cv=ecANubEH c=1 sm=1 tr=0 ts=6a3932b0 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=pFwZyuztDp_4AeEFtcYA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEyOSBTYWx0ZWRfX8A7PrSoMz3yK
 3HenFV5O+V4PDt5/SHSbsy6I9VsqZ6SYN7dObtyqwpqJ5z15yWXa7rlpQ97jagm9Gun33yOtcAq
 U4Ejt40hQN6fzJJfGp4vMK+OHFbmLAQ=
X-Proofpoint-GUID: _snor4zJ1d3z5VzTIm6CUiBsWqQR0Dd0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEyOSBTYWx0ZWRfX8RG00CidQe7D
 EU08eWjPRTvv+xq8LUQsbiPuEgYKc7qwM7Ww/9lncps4C9W7myOQyxPbS7A1p4/MQ/bbzYxFBWn
 JyDIHyzJ/escc4dnD5EngIpe/E31LGz+F1JwTnx8MIVoEyheq60vzYKA6EL6SbO2WLuqHPVrI7v
 BUNgeZeQMp18qEaek35yT8I4BdDgSOWWiFwGr8VgjK43Byzgaoe5U2k7AnK+FhBLamgG+HIyAvV
 UhRTRgpM26gde4NpoLJwnGiOlnVMrg6SX/yoL326kZyVa2gW90M4dweWwXsjMmq2XMdZck4ZMUy
 arkR1YGG8UJvU1H9nbCanlS70ynn2fcG+KijI6kIXmKB8R0z0sCsiPP9fFupuRidbQcjgwhULoh
 E2o2qMOGKLUbPyXxyFefa5yILg/vZhrTuiDfhnQl0TmSCBvSkMvxFyCi3d12cMpi1UA0dBk5vr2
 rM+STq/3VBzqO7iZ+IA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220129
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113992-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:qiang.yu@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C07336AFA49

On 6/22/26 2:49 PM, Qiang Yu wrote:
> On Mon, Jun 22, 2026 at 01:35:45PM +0200, Konrad Dybcio wrote:
>> On 6/22/26 7:11 AM, Qiang Yu wrote:
>>> Mahua is based on Glymur but uses a different QREF topology, requiring
>>> distinct regulator lists and clock descriptors for its PCIe clock
>>> references.
>>>
>>> Add mahua-specific regulator arrays and clk descriptor table, and use
>>> match_data to select the correct descriptor table per compatible string at
>>> probe time.
>>>
>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>>> ---

[...]

>> You're also missing PCIe_1_CLKREF_EN (+0x48) (for PCIe5)
>> which goes through CXO1_>TX->RPT0->RPT1->RPT2->RX2
> 
> I have removed PCIe_1_CLKREF_EN in dts node because PCIe5 PHY doesn't
> require QREF. So I didn't provide its structure here.

I don't quite get what you mean. I see that it is there in the graph

Konrad


