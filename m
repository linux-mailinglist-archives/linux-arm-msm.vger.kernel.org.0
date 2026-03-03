Return-Path: <linux-arm-msm+bounces-95128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BShC5zUpmnHWgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 13:31:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1341EF72F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 13:31:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBA023121EF7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 12:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53DE233F8A2;
	Tue,  3 Mar 2026 12:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W8KUfWrg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZcCRJnZx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB9733E377
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 12:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772539849; cv=none; b=TY7lHucAiPTYAMhWruQD1joFsCwEpZYm9AyUgGFVurxBL5b5UYbZE0HzJ/RWEr5jsJuchV4Dxj+rN4Dqug6F8mliYMKrrvxeJYhSyw6KRud6/oJwiK/c8MjlYu5k0EvOl9Rvtzc8rRTcCt8B4Lu285uwXSyjHcZ3vRO5pm65A1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772539849; c=relaxed/simple;
	bh=duq8E/FZGZzRF+AqYQKvs1DBeFxeK15Ta1sGJeaBe6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JDdPjyPqQEUtFpLUbGvvXyeDw1Q0HSIXJ+wfJ6sTzIxSd0LEVuYCrP154ysdflH3md8DTvfbn2Zf3gMukTC/mttK2HcxFzwTw/3//35QJA7XwtDuuc9SDk1ew6a7GeaClr2kCt877c54c6EcoonK7DGlZ9AxVzoIeWcsdwJ2rMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W8KUfWrg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZcCRJnZx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239mdeY2307383
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 12:10:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uwoV7ee+qwQfSzw6umsLl42FYWoB+twf3uFaLe7Fiq4=; b=W8KUfWrgqBsf8V1O
	tRQCvcWznKtLP6WCii8wxk4le0oY/3e2lA4evKqwl9lJoYWTfL9oybRTavjdq0FP
	50vZ5DZeeU4EZ1grE5bCxU3zZn1wfwTfBLCpoC7+MdrpKjenSvup+/tJMskZFeFh
	AS/7EwMLT1eI+v3+QDNIUUCSkHJXrT2IbKAXz09LSCQymUmaI0ePZwdxu94jb7tU
	GPETtsxNBPQ9iyrp51sjOo+xP7S7/fOwvU4cT7lJXT7Ch8BdKoXYoDyLSuEJEMns
	SCB7WquSuig4apOzdUZm+EA3gkUCSlXx1Y51yPhFGlaWCl6NmUYxKo7IrNFlVdQi
	5qJ/vA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvtu8hp2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 12:10:46 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-899fcb63705so8768356d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 04:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772539846; x=1773144646; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uwoV7ee+qwQfSzw6umsLl42FYWoB+twf3uFaLe7Fiq4=;
        b=ZcCRJnZxIlONbLwsj1k15F/QjCWxqAf5nnya8gvTYXclWksfzVfValRvM6FONwarUu
         Kj7kR3MyVjQqdX0j/b7iHUhYxiZ8T+s1I7xj9xVmMLhw0IroB2erfqSq8RHfTVHuWfag
         /sml0wfSJBz7h3avKG4Dvkc5v2kcwoPBEduqCPL7Tzh5snMMGKxlhjszZrEUSe34MdZ3
         74NH7JKnQlX/3qFfWvcn/KNrm6r/NKYEfjs/cana0JDzvXl+sHbKo3JpdiQn19i70Smv
         mtHGcxwlUy+4n3jC2mZCz5F86NGsZfu9/rMddts4hQvAHtFkeN4caajiiYvKT95+eiFh
         sHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772539846; x=1773144646;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uwoV7ee+qwQfSzw6umsLl42FYWoB+twf3uFaLe7Fiq4=;
        b=LeoQ6ghjDshdVMVrz4CiUQhCfhR9AR8fWO++sPXK8/vU61xC42+T/JrHy804eR8JAO
         BVWu8G7LBa413a++ZIr1+/BfRGo6K8CzeqlWkt9iywBBUQR1HGKjPnWkkf4YtNP0bZCz
         yjuhttkii8hi5Da5SjWBoClIRwBRZQer/Onf1OuOyUuvp/Qgrc1gNDdqNMIK0Mt8sg6f
         H9oxUixoXVld9TMG6PZMjGZQZlNW5Myg2cKg2yct/6J07CgLfNU+/x6/gfmyq039o3NF
         BD1oU6zCbpRpSKWBBH88hwYrXuPxDjX7IB8+mStRh37TCiJTtF5brQQLWDoc5SFgkeZt
         sIkg==
X-Gm-Message-State: AOJu0YynQGB6Mrt8w5HcUEgI3fArQgR6eA4Rk9vKZOlszgSS6Gj8fBJ1
	8wODpAEiq6Owu1OkTKqtAXp19/oRbjg3cUfBDqofoybl9zyJStKoEr2OFhCiNiK+T2fDpK5Ntht
	/8TsVg5lRhgdY1LYrr5DSipqz5kTOCzC+zKrcab4X/ek3uodalEMUUvkP+y2336NhAvnX
X-Gm-Gg: ATEYQzybw9oNDzcHAqOEBjbVPzGgbICC6iF5j0KRj6TFAQ83Jciz4kU0AfYnJDyaBgD
	NfqQOegVlYE3g7SHNhjNmhfborqdkFa0WSsgBPvPxWhWRUsTbnULCsb6mfSUoq3etrvuvpHRX04
	K8YE+FTqSt3xmDImY3gwPXwYaDiniqED1MJmCmfjZc52KCjFxHUAtV8QJjhlOJe6sFqA2i6/wUo
	m1o/s47fuYffLtBbieZ+0aVomiEBqS9yujdRMPWYCXqMP0AETBfqUqX1ocrirxxtz3bMxxouiBd
	IOXILMtSV4XkeLeNBt7NGOaQPsaElBy9hDw1TzuDoZTjKADc3UN3ysvdflbQlM2LaqqQ27Z3KSl
	26vb9/dU2m3jBbb6ghh8uqbiAqvaMS2Zahkzls4Z4mWgZQ02yiEyIVGyF6UbzDRPc6CkUwqWZVe
	ZIIFw=
X-Received: by 2002:a05:620a:46a4:b0:8ca:2e37:ad06 with SMTP id af79cd13be357-8cbc8f467c1mr1563173885a.10.1772539846234;
        Tue, 03 Mar 2026 04:10:46 -0800 (PST)
X-Received: by 2002:a05:620a:46a4:b0:8ca:2e37:ad06 with SMTP id af79cd13be357-8cbc8f467c1mr1563170585a.10.1772539845780;
        Tue, 03 Mar 2026 04:10:45 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabbd98bcsm4567887a12.0.2026.03.03.04.10.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 04:10:45 -0800 (PST)
Message-ID: <d2cdaa7e-1a17-4e6b-879d-266844958410@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 13:10:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: dispcc-sc8280xp: remove CLK_SET_RATE_PARENT
 from byte_div_clk_src dividers
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, White Lewis <liu224806@gmail.com>
References: <20260303115550.9279-1-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260303115550.9279-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: upNUp-loIPmAZW0i5cqyV2qtH1ZjUTku
X-Proofpoint-ORIG-GUID: upNUp-loIPmAZW0i5cqyV2qtH1ZjUTku
X-Authority-Analysis: v=2.4 cv=A75h/qWG c=1 sm=1 tr=0 ts=69a6cfc6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=r64ZnLUNze7Q9b7ZCxUA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA5NSBTYWx0ZWRfX4gK+RLLBAFRk
 D0ouPf+mDvKYVxQJsrjSt2tcWuPjDPA0CKkr9+pqmrDc4o9B+cWnK5rhtG9JmNRT//Pzeus9TOg
 h3czq9v+YfBPAEV8ZgFYu968GhoODP0UUDlbPMQvTcUlO097dFUB6Dq/THWMGUe+wERjhufAhsN
 Ygmm5SjewrDF/9BfhM50avPo++1QRlBnfLLAygeiNGIoJNkw0jubYEuf3JIuK8b7bSSvgZxa7l5
 LZ9USnu1Nf8zSpWUNVhk0KfIOcshcc9HiStMxKbOzWmUa0opWsfhWsp+dD726I1p0vhLXdlZ1rZ
 n6NItYEaDZbbbkc8bKcDWJv3pANRcWus5f9AfXGKyAs+Rem42pGra0pWBJlIYPsPTpBTiopBXJv
 BQZVijNsFvu4I7i9qYX8tetFk7IpSJii3OcNPcePpC46ePB4+npvogxLPnAB5Dwjp85yiWLP+t3
 UjYjIcbayk+BS4/C1LA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030095
X-Rspamd-Queue-Id: 7A1341EF72F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-95128-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,baylibre.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.990];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/3/26 12:55 PM, Pengyu Luo wrote:
> From: White Lewis <liu224806@gmail.com>
> 
> The four byte_div_clk_src dividers (disp{0,1}_cc_mdss_byte{0,1}_div_clk_src)
> had CLK_SET_RATE_PARENT set. When the DSI driver calls clk_set_rate() on
> byte_intf_clk, the rate-change propagates through the divider up to the
> parent PLL (byte_clk_src), halving the byte clock rate.
> 
> A simiar issue had been also encountered on SM8750.
> b8501febdc51 ("clk: qcom: dispcc-sm8750: Drop incorrect CLK_SET_RATE_PARENT on byte intf parent").
> 
> Likewise, remove CLK_SET_RATE_PARENT from all four byte divider clocks
> so that clk_set_rate() on the divider adjusts only the divider ratio,
> leaving the parent PLL untouched.
> 
> Fixes: 4a66e76fdb6d ("clk: qcom: Add SC8280XP display clock controller")
> Signed-off-by: White Lewis <liu224806@gmail.com>
> [pengyu: reword]
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---

Looks like more platforms have this issue.. thanks for fixing this

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

