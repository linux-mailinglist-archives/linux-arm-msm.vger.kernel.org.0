Return-Path: <linux-arm-msm+bounces-91325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHmLIr7jfGkQPQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 18:00:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EB5BCC56
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 18:00:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F1A5302F720
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 16:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9298A322B6D;
	Fri, 30 Jan 2026 16:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UByHh4W6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V+f3jyK9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28744352FA7
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 16:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769792125; cv=none; b=QviBRGUeUjWGq+e+LFLF4AhL7857wC4O/Q2BMKpjS+Kur/ORuru+T0b3woRdOiZNfmIhl9vqqXrF5o+yq29EfYjd2piXiBx659mNlD3x+HIi39+7ufTpeVeWv4LmCzZy2dlX86YQuEbdLXYrouapWKzx4kVH9L0DFbWSIAXgUuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769792125; c=relaxed/simple;
	bh=K8KGKz1oQPK/wCJ0R0Gp5OqZAoDdJ5/8NN1U5mXOVRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GZVYW4Psx//j5zVqalREV1Za6O1PUkZcrTdQuIGs+RvSj1EqT39XfzXynuQX0/FkB4ddRC/r0bd5h6pg3tvdx4LTCVL7h1W+VgBsBb37QTmnbEDMPLGsN8IYIvtCBLcuUou7ZbqeaSYo5765yKRqDjuCW30yC1mpzrvnrZk9p2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UByHh4W6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V+f3jyK9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UFCCgB2413758
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 16:55:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4+Kvb7mmvIX4FEq8N1wkyDPpvMu56Ue4ogb1H+w4qZg=; b=UByHh4W6673GOkVz
	8+Vn7jdvQqz1wbXUu0VMt01xBt0STHDcjIQd7FpHhn0B3KyaDx/I0XCkyhj3VBqZ
	wjmhEek4PAspjPFl3fvj/IVuhZBdGSyLtvQd8sIVOJ9qhrZOA0cybZLdMjJP5SGg
	IMjGeNzoIP0xb0BzAZqENy4tuObdS0RdfsCoE/GoOrZqdh5/LntIwVRrVbC8YZSa
	v8iHhq6beXLKZMikuiLPsgMi2c2fsjvsBLlzTojMBnP5pKY+vB8pZ8SL+pGPEsSa
	GlbxZKWMn+LAupVlk3fQ+xdNwZNRjg1TZ8iYkDObuEvN6srPOl0/IclJ9Fw0EfNl
	QoHvsQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0r41hrpa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 16:55:23 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-81d9b88caf2so2088116b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 08:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769792122; x=1770396922; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4+Kvb7mmvIX4FEq8N1wkyDPpvMu56Ue4ogb1H+w4qZg=;
        b=V+f3jyK9CGAHqVKJlhHrRydoo5w6DkaD6gTrO/tIgMoU3kyEbDbNdxcTzpqg3dRPAC
         OQp39+0TX4mH3D9L+h7gF/w4DMuOLbL3xGjaPbhjfzt6aPWbNX8AINexIbkhKA3V4HB+
         Jro1yR8iC38QhEVMuHlOJVbcgCIYZQqnAfFBitFUvfcQey1euoIEDOysFU9W7xZZKNIs
         Ni/MTZjTkx3Dm/PufeFrLw42cbCXJmDCPzfM8YrSlrbqdZki1htsqijujMQI31BxQS1K
         T8AErPJ8HQEqy+wn9VP60xH2nyh3WG0uSrwRYEIG5eZlfTyZQNGn6gEBYIa28A8nQooX
         DPTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769792122; x=1770396922;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4+Kvb7mmvIX4FEq8N1wkyDPpvMu56Ue4ogb1H+w4qZg=;
        b=b++LskZYG246inySvBLZBD2xs+3vyDh1DLRKU42FZPzL5fXj4UArWAUwVyKKey/H2v
         dMqdIiAwG8hFc6B67zT2MhjKFw4YlRFb52Wh7YDZ5pYczp+xzAFd9b4XVsDOfyF+AbvO
         cdmqbyHFYZOK2fLRYXj+3PDeyaBhxiM/LRj6ZW+R2+cXErITj969oA5ub2qM2fKzPORo
         +9Ict/TXyn5E+/Lu/AkbO0j0gbso+E7J27fF8BJZoTADj2TrEj+2eW7+epHmnTIGArfc
         zyd9lRNEI6XaXeXQbljg47SkfZbnzUKMSHFyNHPr1nauxfwcWX7Zcd7j25CpfbhWsMTJ
         lC/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXtK0w1y6ZoMfO/KV9HsMmpqKgbT/xtq/v0f9lINfzH+WJVgFMCdU0VgZP9sPaKF9ahc99iDZiAQRtvGQOn@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcha5bHjB/7rvsTXBqzmlyl4W+SWU2srI3ePhuBFDxHJKRW796
	boGP9zT4bGvgKDgFmja8oPtlkE5rUyLImYj6m2ndU/Yt1gcy1IfDK0U+VMbLAw/iAWDRON/Xt+d
	nmsoMRaHaAoy2GjTDLHCPQzTKeenxrFEIUeo5iwyu3BhdLAiCvYfqD3Ass/K0cDVZYqv+
X-Gm-Gg: AZuq6aIFiZc7+uFME8wiOxl3uLLEbV0SOHN6IVBiTc65lslQ+2PiLWgj495AyZ/FCNE
	7cCgSiJEXTGOIhJp/ABRgL/x99LK3DV8wPQKwcNeUJTdfUt/wCHW46gz6kiCqvsHexEsHHW8Cpp
	NZIiWg/XtN98ELjbXbBRFmVk/G1a7EDPT9yaFwbPmhXwjDk+RHfd3BMpqYgaORzvUr9FiZ2DYlz
	KrKX2vTTVzpG1Lt02SGUiGhQIZq3K21JKr2uWDUwlSZOJhgl2QIu6pJkTz2QplaDOzrBDy31d2E
	3vuKaqkV0rqs0CRSm67otxGTL5ldSg/hcG7528MeaDtBYo87yg5WnEI5ic7KJ4VySSU67rPw9S8
	PXjcr69h6J+EiOa0CsMWwPBZgz98Zps28loKgZg5P
X-Received: by 2002:a05:6a00:21d0:b0:823:3078:f684 with SMTP id d2e1a72fcca58-823aaa4ed08mr3672777b3a.32.1769792121988;
        Fri, 30 Jan 2026 08:55:21 -0800 (PST)
X-Received: by 2002:a05:6a00:21d0:b0:823:3078:f684 with SMTP id d2e1a72fcca58-823aaa4ed08mr3672763b3a.32.1769792121409;
        Fri, 30 Jan 2026 08:55:21 -0800 (PST)
Received: from [192.168.1.7] ([49.204.111.90])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379b19a9esm10857706b3a.11.2026.01.30.08.55.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 08:55:20 -0800 (PST)
Message-ID: <7007e802-f7d9-42a8-b7ed-25572c451f58@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 22:25:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/12] soc: qcom: geni-se: Introduce helper API for
 attaching power domains
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bryan.odonoghue@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com
References: <20260112104722.591521-1-praveen.talari@oss.qualcomm.com>
 <20260112104722.591521-6-praveen.talari@oss.qualcomm.com>
 <d13d1931-c6b2-4f4c-873e-efd45823fa89@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <d13d1931-c6b2-4f4c-873e-efd45823fa89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YNK3mwp8RL-Xnzr2BqYDBu30b1MKOwlM
X-Authority-Analysis: v=2.4 cv=W541lBWk c=1 sm=1 tr=0 ts=697ce27b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=10aD+GSAjGS7IfLbEAHBKg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=RFm3ULBN9CpRR-2xPD0A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: YNK3mwp8RL-Xnzr2BqYDBu30b1MKOwlM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDEzOSBTYWx0ZWRfX0qzARrYcT5Vz
 ZBEgXmfHwQL37trDn/KZ2N34mLQ7jr67k0yQkQFTNdwt+xNZpYMJ6fjjBtIN/bw9H5gmJAtE6sk
 ynDU09ykQq9yQ54Octtpq0lTHhRyzTSr29tG07nurU61WT4FDdIDpf54Emg+t+mJt5/oN0iLvba
 +Tc3q7ff9BdYk1V/iE9YrG/aUXZK5sYoWFWtgYNPBZbFH7Q2qYcDLV3js0I5ZN9WLlrOVjhwmzi
 8jZr1zp3xsCqHqaAI0fzmA4cH6iURAA4aNLi/ikxdGUads20AxynYw78H+Qr5U9ew0LVfjxB1yD
 xfUDiCsmBwLctEz29VK3BxykAYUErHS5rgiSoT/9YysPkJFbTNWh5Zof2lA1T+SBxtpyRIOT/L3
 PE0H6pS8DaEUfPBpVWVyB9qcEvB60Jmo1ryXKHzRVnMi6Z0zgyUDTnj+7qdoKv2SCl9eZDFG9g4
 IcT4KbcLvMWEU86jSNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_02,2026-01-30_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300139
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91325-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E4EB5BCC56
X-Rspamd-Action: no action



On 1/30/2026 5:42 PM, Konrad Dybcio wrote:
> On 1/12/26 11:47 AM, Praveen Talari wrote:
>> The GENI Serial Engine drivers (I2C, SPI, and SERIAL) currently handle
>> the attachment of power domains. This often leads to duplicated code
>> logic across different driver probe functions.
>>
>> Introduce a new helper API, geni_se_domain_attach(), to centralize
>> the logic for attaching "power" and "perf" domains to the GENI SE
>> device.
>>
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +/**
>> + * geni_se_domain_attach() - Attach power domains to a GENI SE device.
>> + * @se: Pointer to the geni_se structure representing the GENI SE device.
>> + *
>> + * This function attaches the necessary power domains ("power" and "perf")
>> + * to the GENI Serial Engine device. It initializes `se->pd_list` with the
>> + * attached domains.
> 
> Please sprinkle somewhere into this kerneldoc that this is specifically
> for the SCMI-auto-VM setup, otherwise "the necessary power domains"
> is at best confusing to an external reader

will update in next patch.

Thanks.
Praveen Talari
> 
> Konrad


