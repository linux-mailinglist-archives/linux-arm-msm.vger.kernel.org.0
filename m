Return-Path: <linux-arm-msm+bounces-101021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFqhDEyfy2loJgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 12:17:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D2A367C3D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 12:17:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 89B6A30B0297
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 10:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F31143A6EE7;
	Tue, 31 Mar 2026 10:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pvG+2Bob";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M+pbuP3F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1063374E7F
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 10:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774951833; cv=none; b=Hwxh8qPhjjTnVOZ2+7nNs0FW8BnpJAJyb20jvrkTyj/HC0MtJ9MJVA7IvaQlKZoCB4qLCmq+Prr+r2t3KfgwB0xa5naWy5ii9NQWtxjRISpbIlDqzyLNi+YoAeLBc2aQaZu6Gj59HrTYaoHVD+B2j+8+1ccpMzP/n37NgBvFrIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774951833; c=relaxed/simple;
	bh=6xORAGlWnQ4RaG76LpJ7Jd0JYS05i5nw4QKy2voh05g=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=cQNaD89Ns/thHk9rX6tkuMXywqEEkcGFuBF7eYcDJ6UmEb1vgH706IFYeBD0T6IhpL1HFYxa+slb1ycSdAGFvL9CnzVve8/Vzh/kIKn4htUoUST2kVWD92YnStvtaJ6i02/vKxf/MZc+Fo2G1vdGT9oKP7WtsbcXQd0E3blBvMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pvG+2Bob; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M+pbuP3F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V5qPY21841221
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 10:10:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OscVYcVLSC1PAO5AyKwi55H3UQZzDc7xDB2rFKH+jPA=; b=pvG+2BobqzBs0TOi
	aYw1IjEyVY0cM3/yP62t3d/lGzz5EFXojW6zGq/5YmszC80MMcWoOUSioxfD5dHt
	Q+ELIZEJhW++jEtY/uK7d9HYYVwmtKGvbSjiEu5WDLUuiZIRVWkbHYB7PYbNHdQf
	vhnai5uso2JMOmOV1vm/Zb8sh3QbMS+pInOdztpj34dH5Sg+wf6tLfIAsvGvCxke
	vu+2+142yDkoRA4cbkid3zrA9QhRz+z3ccrzDBf7/lC/j+0FgWWFUVqr9sPIPnxj
	aPFTruBp61q6y29mj1/qObXpWUMx1kYpEX9HFfcXVa2dj3cL4b/NtB8Bk78JopGX
	/w2wNg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d80rsjj8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 10:10:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cfc0719a1bso115001885a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 03:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774951831; x=1775556631; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OscVYcVLSC1PAO5AyKwi55H3UQZzDc7xDB2rFKH+jPA=;
        b=M+pbuP3FbTUDGk3NVqj1v/nzTE3qN3v8n+MjWTBGGWklA754nKMAAstN+I6dSEFq3j
         LVi3HVvqrzZB8rzsE5IFepcFYOkaJoteAkdIb0EJNgQJkYJbEsLL0GltUZFrwiBOtE0U
         F76IBmUIE6M1NMVfBhGV6OnOPf6XD72TXLFwx44VcQkssR5m+G0I/ISvcIxB64pAEnzA
         8/Q3uAH6HL37pzSQKfL4o+1vf7tAWoKo68D+7tSkoAin0FOiU9QXYqb9NQahbAQx4mO0
         ORrDB0VpJL3BeckjdoSZDA0tO4ENSo5ul22iR+Z+n8j4EajEGMbWxEAeWDbXLCga19hI
         rykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774951831; x=1775556631;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OscVYcVLSC1PAO5AyKwi55H3UQZzDc7xDB2rFKH+jPA=;
        b=TkG2THJHiJEPka9J6CjvbWNyMgrFNt6buYbCKAc16cNmh9LKNoxKbjjxaogS8t1E2R
         Wu6nlCYPDEz5QbTRNYXSqX2+4cSuacZF4FqxMynLgdrFzB2wwJCD1LWR29nRrq3Dk34+
         0JfIQ4XU+HN9aPyzzaXL5Quc4NusRTShJwr6vUXA2CpN0ZLEKTXeq6LQue6625aoro4u
         yicDRPa9aP2DJWKe1F+z2oOcIm+hwblymQ5Fv01mnnRGLoZhJuVK+drv4rlKb8FfO5B+
         +EhJFUBv92DBMV6HSGSLiPbT6g3lb5CrnOf6rUP5nXaQtW02I5jy2x2wcEGlk3uqtPK7
         xhGg==
X-Forwarded-Encrypted: i=1; AJvYcCUCPJTGREdhMREUKQvZQDNaz10Zc5oYK3XixPuD742KSyqSDNRMzCf5x51AaHrWAQOSQIaUpCCtgHxUlAMQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx39dzwhlRzXghiKniGr+LHdPnzN0y2OdfgJlZFKiYqTQstdiwf
	OK8EGR/Xbz1yeYtOiLUUbrT2KVDXC5DE5EUFfqwILTot+otSnK+mnRoy91fn09BCNbrhippt+DR
	EsOmVidUKwOBjJwg0MaSGnRaJh2CI73VpGPQRkBmWVs//DmJ5cqJsYPQeuKgnVYthz1DD
X-Gm-Gg: ATEYQzwnLNgZEF/eXAWPpI1NE7+ppjw5ItQ6cx30QSGLP0SUT7ZdEn/reQiSHYPXk5f
	wvehqWlusePX2icTB46GQVrzqZSIb2/kHpSq+Y/VOtPK/o6gjLrzkYfMo4gPuuACBIFi7VszKJR
	TIxI3632RVKXPjkBANazwGQdwGpNYT0yon35JljkLMIk+8D6R1E8kRLCUl/FY/B2w8Mi2l/KqB2
	rUaDRYaQrYsGiGBt+Ao6L9YPoaT3PdWaunwUP42lqY7gPY++cq/NEfcR2sPaWUc89GPdI2X9rVU
	WKye0q5hm0qV/2LaDCD02Mhx3La148fdsX9MD3qNUBluwQiOWZdoUcy/wRtVgZtI7UGO7HHRdnP
	/s7cg/E0qXBNeeEQEG2yMJALsvDuzYQJCcthOpezBUjjKnrTiiPIqA/8ZpiqpcrH0CTLaTI07Qg
	f1/oU=
X-Received: by 2002:a05:620a:4049:b0:8cf:c757:f1d1 with SMTP id af79cd13be357-8d01c82312cmr1476138085a.8.1774951831226;
        Tue, 31 Mar 2026 03:10:31 -0700 (PDT)
X-Received: by 2002:a05:620a:4049:b0:8cf:c757:f1d1 with SMTP id af79cd13be357-8d01c82312cmr1476134685a.8.1774951830813;
        Tue, 31 Mar 2026 03:10:30 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b7276304fsm3447998a12.2.2026.03.31.03.10.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 03:10:29 -0700 (PDT)
Message-ID: <51a05279-1759-4c03-8bba-835a9e972ccb@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 12:10:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: Constify qcom_cc_driver_data
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260331091721.61613-3-krzysztof.kozlowski@oss.qualcomm.com>
 <a746be68-4f5d-4792-a896-bb693d029ea4@oss.qualcomm.com>
 <6ca492d7-c041-42b0-8f41-cd29ab7b4bab@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6ca492d7-c041-42b0-8f41-cd29ab7b4bab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: f7Ytp3pXTtw6MZ6giQ0ZBQEwvVjqRJdW
X-Authority-Analysis: v=2.4 cv=VInQXtPX c=1 sm=1 tr=0 ts=69cb9d97 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=fArkNfqvCtmK_1YDpdcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: f7Ytp3pXTtw6MZ6giQ0ZBQEwvVjqRJdW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA5NyBTYWx0ZWRfX6BFR4Oj1ZZDj
 Mlrz5gIEutNArCGatSJqXQiO3jhugNBep2T18cFGjjhEPoIvE9yGK+1e6WU071vjHaLDRiXRnpL
 JXrlGo38+/P4tsQE4qk26s7cSPQmSx+c/W4uUIcNGOxT6URfVd8o3BG9IijIo7pRTuG3LdEEL1W
 tzf1FEwXSSPou8uUHGdcylMoUK+gWCOGx+ZMn9r5s/Dc+zHQ21YnQrRjNpfaxKBH+pf+oxIYtsb
 gWycSpcSwXpNCxqmCvQZb5poJDZf9kZB7YiAhOJGtlAIk4SpxAt0q8ONkSVCJq2TrLsYwlS36z6
 ySyQ/vd9mLUyrlkq4T1EftV375kQ7dATGy0wGbEDk8PlEoaWkWHd+8JW+Xmy4sH6qeN8NBpOfYm
 KmqTWjKDd5g3Oepw1P/9evfQQTZJJUgiNfNL1WkKVN8OGaQpb4HqPLQ4Fz4CstfexXKwkkiZBo+
 iBh+s9kodLujg14Fr+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310097
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,gmail.com,foss.st.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-101021-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E3D2A367C3D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 12:09 PM, Krzysztof Kozlowski wrote:
> On 31/03/2026 11:33, Konrad Dybcio wrote:
>> On 3/31/26 11:17 AM, Krzysztof Kozlowski wrote:
>>> The static 'struct qcom_cc_driver_data' contains probe match-like data
>>> and is not modified: neither by the driver defining it nor by common.c
>>> code using it.
>>>
>>> Make it const for code safety and code readability.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> --- a/drivers/clk/qcom/common.h
>>> +++ b/drivers/clk/qcom/common.h
>>> @@ -49,7 +49,7 @@ struct qcom_cc_desc {
>>>  	size_t num_icc_hws;
>>>  	unsigned int icc_first_node_id;
>>>  	bool use_rpm;
>>> -	struct qcom_cc_driver_data *driver_data;
>>> +	const struct qcom_cc_driver_data *driver_data;
>>
>> This can be a const ptr to const data, even
> 
> None of other elements in 'qcom_cc_desc' is const pointer, even though
> they also could. If doing this change, let's make it consistent - so
> shall all of them be const?

I thought about it, but then it turns out that videocc-sm8550.c has:

video_cc_sm8550_driver_data.clk_cbcrs = video_cc_sm8650_critical_cbcrs

So we'd have to duplicate the entire struct

Konrad

