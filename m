Return-Path: <linux-arm-msm+bounces-116930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iRyJH5nSS2qpawEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 18:06:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B50A713028
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 18:06:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=i3sfWJdn;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kSjI2wf1;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116930-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116930-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0BAC731E2E9A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 15:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA25B39280C;
	Mon,  6 Jul 2026 15:31:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E72B3DDB03
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 15:31:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783351891; cv=none; b=oTL132UGwkVhwvg9DnR1PENs91ohpzw7cmJTTcQvjs6crjbQawzw8LD/bAiLRcF8Bx1JRkGS2a/E1s7xyZj9pTfSxXLmXf3FRwr2in2D+wluL8hNR1dBsK33QaMhsNVnstvEazdT57VOsd6mFR+TgvWFGWBDrwcRZbKlIH7O0eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783351891; c=relaxed/simple;
	bh=MWXvaa3McQKW0X+Ho0aiOmBxvbNnEOlsUh1HkA6n6nA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kbjZhSZvc34MzLmwxoGJG5O4UUAS4hTtDY9X4/diWtH9v0xVCaw1hEqjG3MDXCDS50nVsiQB1mOOUMaJvVZC4W7Cc/NPywRfSLhFc4LmCbIitbBEfhgtVID9BsBUO5ZMgZVK2/uKpWB8A8B+NLVWmWf4ZmlLRVWXZ8GlwbhOrhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i3sfWJdn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kSjI2wf1; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF6rZ982438
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 15:31:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UoGmX6/8M0XrRbOk6nh6+9gojaLrHsrhKhUf3nggO1A=; b=i3sfWJdnHYtFp/s/
	OhKnvi6OBlewJALw2q0S5l01BpxtckE2+XbTB7s0I86CpcGzpEcd6fS59BVT+DDX
	oUm3L2Fxdk0MX/IxO2Ir7Ca/IuiAqG5Jbyqpa8W+N3rjRGyvEkYXcrUPCLYOb6PO
	LfUlTR8NmGYs54DRcl0kxBp9MW3U7a0o5IpwezRgQ4IrbOyS/hAehmCDHdsyhZAw
	JrtJdpee+AXL8FCFvj78V3DkV6BY45or7BYOCcUAKy4OszpLT1ghidPFENeslALu
	gecIL8aDTQg29ckoO78H3ZhDLTEPhd98uMBlH3toFKB57RwzZmi7Gr7DBtpBGYe7
	zLYFJQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89qphju8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 15:31:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfa45b280so8696221cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783351888; x=1783956688; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UoGmX6/8M0XrRbOk6nh6+9gojaLrHsrhKhUf3nggO1A=;
        b=kSjI2wf1UBBldUAAPKCEHkSvxiHFBKcsuw13zv4PED2czz/OVx2OuwFlcDntqGTnNj
         RuNoRPK/zHRLf2riZUb0p2HZJbtnHYlmgQ5q7F0/eJmRaLC7q2lOfC8glE5lElhlfZ8B
         YCkL2YiHfiUiJF/pmroAchpxI71rTYFBnGNeTIlikeB2WQzegM9AcVXvZGeiTi110MPS
         x5MSj4x73u0vs9bMxgBbkJQmgANCoz3NFf7TTGqc8sCuezEN61AUX4TxLwUVuMzyP88A
         SutW4UdcsJ48wZIh6+PHUpozhR60E1/wY2L4nVO+YuIGGX6+3APFaP8KHDQ3Dy/4Ofss
         5oRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783351888; x=1783956688;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UoGmX6/8M0XrRbOk6nh6+9gojaLrHsrhKhUf3nggO1A=;
        b=ahNO9Ex93zxu7ILY8WGhY178/YFU0GqnZX+xtOoTf1ii1njMWP/YKvxo/3WaYClXr1
         qatuO4O3XF9t6CSH8RGWOxrNzMcpiYKBR1+f3rXwHxNoI2W9e/zawYTw/TemAxgf4E8J
         8eXegAPezYAEdqb5xdW1K8KybTVQmyhNtsbFON9lz3aHjWsAJRTh6h0ziS77foA5Z8xJ
         FrEOHgWcNj3WSS7QwLzTPF0BoyS5Mmg/3farrZveQLC04i71OOFGx2i7pDa33bTRUNdi
         eFFykLQIoDiL28a4pxG8w13BQdh5dm7ChYerZFhNJAh5wpI/FIpRPqK1T/dz9UhFt2tH
         6jOA==
X-Gm-Message-State: AOJu0YwEhRg+BX9V8GFYyiYCSLZ7hMwUlCvUCDm7ljKDrndW7yzTnJmm
	kwAGA2zVrsWVq/hi35DUyUQlwrnkXwGlGam9p9O9kDyOwMrGQKvyxzVA6Wp7YVlfvzLgqSWDUUy
	CFV6E4IBB835vuUPWLSHcZv3LKPmKrZ6JCMRGhLz7lEqaKEbHxj95a13MxfQRHgVN7XrZ
X-Gm-Gg: AfdE7cl+bB9QJFsAzIpjrMhZSHlLR0NSvxwhui8sW5V22hbQSua9gKaODx40TvqnN1H
	JSc6wFEhtw0QSF7E1b4pOX9zh0hH1PA63lE4A+2A7jO4vqIRZB97r5WCgUXDUn/kOM2Am+cVSaF
	rrHCH/AsKi38d3qiN6znxzBSkSN8UW9BK1rAqx7CdabMz5z44s2VfGcWB+S2Ha8vsqgW7xWzIO9
	Tm2HclgQ3suROVOQRgRbQzrwqG+tzNyYFGcdDceadhkIOCoyLzJ8Jw7RdN40lMWhFhg+l2Xdc3E
	eh08QCEKRyG+HkjozlOdrYgjgWlDCA8+OYOmUXcKvQjxrXoe4CzqDO2YS5niK6d8OqiVBnu1QE1
	/uPDKC3/Oa+uqekLuFs0JDvIDkUc14/Zzz7M=
X-Received: by 2002:a05:622a:180d:b0:51a:8c9b:64a7 with SMTP id d75a77b69052e-51c4bf5b83cmr97157681cf.11.1783351887786;
        Mon, 06 Jul 2026 08:31:27 -0700 (PDT)
X-Received: by 2002:a05:622a:180d:b0:51a:8c9b:64a7 with SMTP id d75a77b69052e-51c4bf5b83cmr97156201cf.11.1783351885041;
        Mon, 06 Jul 2026 08:31:25 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19ce4ad4sm4271032a12.12.2026.07.06.08.31.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 08:31:23 -0700 (PDT)
Message-ID: <1321c89f-ab6a-487d-b18f-99f281a1238c@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 17:31:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] regulator: qcom_usb_vbus: add support for
 qcom,pm4125-vbus-reg
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, jishnu.prakash@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260706-add_pm4125-vbus-reg-v3-0-999d78a87b81@oss.qualcomm.com>
 <20260706-add_pm4125-vbus-reg-v3-3-999d78a87b81@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260706-add_pm4125-vbus-reg-v3-3-999d78a87b81@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c6qbhx9l c=1 sm=1 tr=0 ts=6a4bca50 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=eoxlGDcgPB-HuCwanXQA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 25jKLv1xPRji_FNyD-5WrwjjhnxEBLhY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE1NyBTYWx0ZWRfXxu3j7MdXiHZL
 nzwbz5VrBjqc2ksuKQpkVcBFJQtnzPQF8QYAY6QLPE3IWIoZfWEosr0BYAR8TrnWtDknblrT768
 KzKewXETxXvPsJrIXjOgWb5ucvwwXgszJvjI+kNrajSUJNmzWXYg3upP0TbCMPdByUINolou2jF
 kJDmV9T7Ji7wY002U8a/RD6ZZuC5LE5wp/aWkkKib3jCMJ5GgNNjFCDu2MZMiy337yv8jIOi948
 JUC5qLVpfgilCVtju1nL5RuaV33xbMIQ2ygnScZTNz1gnnXiKtd68PJC5lBe4gPA818ARuK6H+i
 FuILfmu2lvndfq+3qe2uDvyc6Wf8unmnhpApjR5sgm+JUy02UPDbTG1/cH8NgUT7z3HbBImrVdA
 pif2mw4s67v/6eSrWuXIq0BE0N+4xiYrBqv1Skq4i+BgpUqxEXzPh+yh4qODYVv81Bs0ojuU1u9
 h9cGC6IUaCZEWZYD2+w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE1NyBTYWx0ZWRfXy2rmNO3bsCGC
 mlMvqoHQRJu6H1kE7JB042/5nrruSD3JuZ94m6JfhyI8EeokEM7vyf8hBfNj2cSOIdH3iOY85Jz
 ti07shDy3jOF6ktPvDoN1Kgd8cZI/WE=
X-Proofpoint-GUID: 25jKLv1xPRji_FNyD-5WrwjjhnxEBLhY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060157
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116930-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,kernel.org,quicinc.com];
	FORGED_RECIPIENTS(0.00)[m:rakesh.kota@oss.qualcomm.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:bod@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7B50A713028

On 7/6/26 2:31 PM, Rakesh Kota wrote:
> The PM4125 PMIC uses a different register layout for USB VBUS control
> compared to PM8150B. On PM4125, CMD_OTG is at offset 0x50, OTG_CFG is
> at 0x56, and offset 0x52 is a 2-bit VBOOST voltage selector rather than
> a current-limit selector.
> 
> Add pm4125_data using the abstraction introduced for PM8150B, along with
> dedicated voltage-selector ops and the pm4125_vboost_table covering the
> four supported boost voltages: 4.25 V, 4.5 V, 4.75 V, and 5.0 V.
> 
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

