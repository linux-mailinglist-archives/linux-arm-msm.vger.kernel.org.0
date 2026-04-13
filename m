Return-Path: <linux-arm-msm+bounces-102893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAbzJqWp3GkEUgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 10:30:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCD93E920F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 10:30:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97C1A301187D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 08:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4933D3A9603;
	Mon, 13 Apr 2026 08:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iDwKkfDm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kXXpDrhm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FD3381AFF
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 08:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776068984; cv=none; b=eGmwioKX4r1kw1VI2aKZWSsV/dqmWg5YOm7S4J0YdxLxzMmDxYUaFOvdYqbGn0gTnpBL2P9KvLKeAvKJQ7cIczHBrgsa+1jQhl8gC6NqPXDd7yTye3cSB/qee41O2KSKF7WHsPkPWXN+dYo/LjefGLdtEVwa0iNFSZown2mRwCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776068984; c=relaxed/simple;
	bh=TJzulDCerfcNW6Rn2c6DZX7y/CO0U9cq3MJmwJSy5/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CdNWeQCEg+qAHY1DZiPAPHotf+CzJNOwOUe8rrNniXel2ELxQOjIeAstN6KvuLAaJl5f+HkaNBhkQcIA1Ma2P+sa7Z75m+WJqGyexDfrCbi6XjVUOHcBks88/JvqKmFW0cqhvb/kxxOTrA0kqDqI7BGi6aGJEo/EPRS4XJ2FIjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iDwKkfDm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kXXpDrhm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D5b8Kh3692418
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 08:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NZ8sf0ggPk1h1s1lmsOsg44DsYWsUVjfMtXc3A7gmWs=; b=iDwKkfDmV+yafUeV
	52KlJYPkBhp0h3cej3HIMU8lE1n1iJ8n7LqdRC97GJX5ieIOESfiXBCDZTiTvV3q
	2/i8dg+e/3wPdAqtWWkDHL0wxbNgw5U5UGgG08M06xA0DKbtdBqnksBrhKGIO1du
	4yJaBaQ/ahGOkmfy4/NkASFXVDocFiR80SfHFZAZBxDP/d7z8BZ0dhWioms6pVK+
	A8Bl0DP0vXUnaYWq28ZS2zGwZg+5smxpWCOhV/1He3oEWk9FUhr657qKmomIdUZo
	VKdR/ESzBta4MrY6NPPYxkyoz9ORNpfp7g+Cn7IEm1JFdtTUdUU/Onm/LrDb+4rc
	k+NcXw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfffhvd87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 08:29:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b2955cc1eso6235491cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 01:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776068980; x=1776673780; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NZ8sf0ggPk1h1s1lmsOsg44DsYWsUVjfMtXc3A7gmWs=;
        b=kXXpDrhmZWtl/BiPMVf7z0h01ZrBSLITAtSCAUt6g7ZhdiTi5aoMrUGx4M2bTlROZo
         EGvO6L3W0i9Q/kxfBV1qi+Dg+oc1fM4HVo8zd0xMzPgN6xZQNM5XUD957xNA7jUWp8AX
         tr2DezWrUOryjw9nnMmudhylvgMl9QonK1lOamogLhg0H+CK7Eaxfl50Oz7Bu9hJ+Kc3
         WYmZCbvi75XDH2vCWkJZIgbyiuKPMXg4O6IOVon75gGXUbZ97uJO5OViVuMbd8KLVHHw
         DA9CSQm8iDQ4DTjaKru6l/gHsbiFUwdjFuP2PoAMVIME+Td4aGDpXMQe1eukZ0+chlF7
         jgGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776068980; x=1776673780;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NZ8sf0ggPk1h1s1lmsOsg44DsYWsUVjfMtXc3A7gmWs=;
        b=Y6Lv7mIpCgFoKF0LJADM42P9p5M4F8xg5xjq5gARplKpfcopbcBeiFt/SU4nuaP97i
         SOCbGwD2bUihsQai37Hw9TrVvCYMCS05Co+AtstG7II6D1bIPSV0wS51DzsUHhOMNYAN
         N5208gCTtHifDD9x5PX69Fy41rX+EhFiJvbvwb7Svn2TLYOGoOELwEyVqXv9f7VL6EgW
         mAmqm1CkzYhif4l7TajBHuZwFj4AJLH48gFLDM7sIyE0vtBzhQ5Adf0ukTgOHCI7nRql
         ck5mpSaEWTu6QfMTWBOoUElYLL6MSriYkVync2AY6/mUoS0/jNRBH8+A1G49KV/dt8yK
         VBFQ==
X-Forwarded-Encrypted: i=1; AFNElJ/pplbCIdUIBcOCOihNowf8d9a8zgez1VGe/B8oQZqKiMJ2ucblSSZwQoSg9Mf6udugs8yLDcr6qM7PZ6Zl@vger.kernel.org
X-Gm-Message-State: AOJu0YzsX/A7e5CFtLCdPLlE8HwUTPG2Jzj3XwKoyyZdWV2PuIJNF1J6
	FS8s2IDBv0lggXTzfhyXK1lBKhdvwZf4oiBjJb3ZSTGRPnKVXQQTNrHQFZ0Ek4fe07RWdK09H1S
	MkFnHcqCpe2GkmflTXU/7fkQ4S02Bagif/TMjcSuIJPE8tEVI/TyWXwa8oRJFIFU6sylP
X-Gm-Gg: AeBDiethiGptozshyho6y+dVmpRLFGVbvFjf9p5uKaAte3UmudWufry2kJxw5DfJIAX
	MVTDejYwEFIExHAEJq6hbFB8VZzYzk8zKCTcfNKKUnEuXLTQbAd3Ej+A9O98k18gSo2SZfouyOi
	iWC9sEmx9EIwFs5t4ABiDr6QKbLJ4jWcUGX8TYgtUcaBABRIjJDEXex8pkdqmT1sUG3qSwRMSq5
	i3+0a/JovcNXg7pKe5jgNQQyJGYnxlNviRxiaH0oeJ5Zij74VwX5Bx3ImHkBN/pW7eZ+T8QtGcK
	5qKzWv1c1lcVEd1y3i0mUohb1a6K9I7zMhHfVgmBPt/NUYaqkFane3AkR4vesezXlWbN8fr5h1T
	J2pKD8dScwJZfN6Ld4a9uzDgjvaop3njND0jah46ynC1n4PergJC2ShDU1SrdYdC436Q0H9L1pB
	8Eeao=
X-Received: by 2002:a05:622a:1827:b0:509:a3c:e390 with SMTP id d75a77b69052e-50dd8236028mr119803771cf.4.1776068980145;
        Mon, 13 Apr 2026 01:29:40 -0700 (PDT)
X-Received: by 2002:a05:622a:1827:b0:509:a3c:e390 with SMTP id d75a77b69052e-50dd8236028mr119803611cf.4.1776068979780;
        Mon, 13 Apr 2026 01:29:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67070815733sm2544788a12.21.2026.04.13.01.29.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 01:29:39 -0700 (PDT)
Message-ID: <dd384c65-c89d-4427-9420-47135cbcc0a8@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 10:29:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/35] irqchip/qcom-pdc: Add PDC_VERSION() macro to
 describe version register fields
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
 <20260410184124.1068210-6-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260410184124.1068210-6-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4MSBTYWx0ZWRfX0vCaupf70Fyr
 SMiQnw/EN/INWTsmdfhzHfPfxGdeSxpAkBfpiU3HNCb590Tmi+fpYIedQIyFo1xo9nqw9rnpn+d
 cWhlLlMp3xixTq1Zf2bEl3FM6i+BJy9p135r3+XzPqyDKlEY8LmKlH0RxON+FUFOAvm16UMGC0Q
 QNR34BPdYK8mgRMTde+FwpVtTHzL3BLA5lJASGt8+v/x9yu9ubdJx2oLZNnmB5ZyIz2SBH73pji
 KAl5qS7HyM+46m7S8IYRgTGU/qI24mEf1vZRlRwAtM2/8CuohR8zuXEUX4Ya9EBn6wcnjS7atKx
 U1u9qageRzCMWTaHrpuB6WolblsqR/KF1/YgfYRTAo40t843lNyk++QB7Qj1BsD0amQUCbbaKl6
 RVWO19xGPKCCUBpLCl4AoK3dEYN1SeCUH3fOqv7BRpWfzos0bBxP/wyaCsWBuHg2wYZo9hCUM3G
 ytcvtJwafqw4HmTXvlw==
X-Proofpoint-ORIG-GUID: sBNdrEKqiGSD5oeKRHX3QEB5eceY_Mce
X-Authority-Analysis: v=2.4 cv=FOkrAeos c=1 sm=1 tr=0 ts=69dca975 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VbrZmljE2wxRSAa9tscA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: sBNdrEKqiGSD5oeKRHX3QEB5eceY_Mce
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130081
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102893-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2DCD93E920F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/10/26 8:40 PM, Mukesh Ojha wrote:
> The PDC hardware version register encodes major, minor and step fields
> in byte-sized fields at bits [23:16], [15:8] and [7:0] respectively.
> The existing PDC_VERSION_3_2 constant was a bare magic number (0x30200)
> with no indication of this encoding.
> 
> Add GENMASK-based field definitions for each sub-field and a
> PDC_VERSION(maj, min, step) constructor macro using FIELD_PREP, making
> the encoding self-documenting. Replace the magic constant with
> PDC_VERSION(3, 2, 0).
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

