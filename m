Return-Path: <linux-arm-msm+bounces-109733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CVdNehGFWqLUAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 09:08:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA745D1807
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 09:08:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 77B6A30254AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 07:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 506563C585F;
	Tue, 26 May 2026 07:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tq2vT/ij";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bD5dbY0g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF233AB490
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779779297; cv=none; b=r3W0Sp26DyEWKHyyojH/8zLAI0VWa66DegeTECFQQa/lI4MysJAdmLHbrTCgQWR/b+d+Onh7aDdm9VVvxjYFkZX4rpcgEVka8ybxVLlXc92tqLzel6Ctl9dcJ74w+fQn4HFnL3s1NuK0VOHajklovgKZJHNGjtb2NHOt68WKlGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779779297; c=relaxed/simple;
	bh=MAvyLMCHYlFNNnu/c4mzgdBc6It7ukrVz8sWUsSPMC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JRfMksNlOwwEl8gsG11cgj4Lh1tcw8j3Dygs0JPd5WLtjwzH8pzM0bzUmc/CRfrJPn6aHF7sWQAFLDYlve0uPT4F8ulWfBY2AxZn1w1AxNVHmyd3tjuGwDgGxMo21KgSUtxQUmpMNjg1m8BCkOflzTB4EheCGRzmrKAMrPWmP9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tq2vT/ij; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bD5dbY0g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q5s3MA2146351
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:08:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rlDqaJDlxHZHKs6avbBK1EMIaE1lZBxft0qcRVB9unk=; b=Tq2vT/ijSR6lNGVa
	zGR1Erl8q4HBGW5zAjTU7DlhP7jgiguRMNXdC3/2cbFcZ7Uueld0XTAmFQBGWYxJ
	saVIuqB2AEUWdvGud4MkJ/Qy4h9GD+UUl/v+rsFSU1Aq2TTliUsMl3d9QeHqvqfc
	0ejhoOlKRjwkRS4AyvjE7znOFA09BRHtBVSYQF1ap0ffgyT6EIz3M59HSyWpVzNn
	/JmiFes6BxwvLFnsg9AzjkPFY8VlBQBgx7bNSGWjUA2oNElNYb252svDk/Q7pWuG
	/AbpPTqLLMefO6o2y1UfhBaXizdPu6btryP0FWvwcE2TeA9tiJS0HCCacDDT7Th9
	O89dTA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecmbv3cep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:08:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b9a3c3c4eeso103396735ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 00:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779779288; x=1780384088; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rlDqaJDlxHZHKs6avbBK1EMIaE1lZBxft0qcRVB9unk=;
        b=bD5dbY0gBvRyLBwKxUiuAmWWorMp8Wouu0pBY78fuqaQ3qWfESJb4GoCV/X52CeLH6
         ka2unBG+jWczfRLktrergTgmeX3fXT8mANpLZHK2juzEc/5pFbF89wz1ZtiZPykpbSn+
         sGnW4wOa2pb4x5WH1Q5A77iR5tB1rP8DWLqMy69WMhygGL4M83va51uBzh6HIQjRNEig
         +Dg0iA2kCZjKDARumcAea5ebvKBxemiHIE1PaJ+kBQ4+bpJya8zR0l25UWE3SCFeQp1Q
         QLosgsaIN3OPXjlBIrJY6hE4dGMNVET7DKDT9pUAY4SFT7FlKxaIhj6tgmMEqaHZxJzD
         3N1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779779288; x=1780384088;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rlDqaJDlxHZHKs6avbBK1EMIaE1lZBxft0qcRVB9unk=;
        b=jjAA4rRAogsTxML+FKxwx0cDbeQkSVT3I25TM2gsdf91XlnzVcnB9m2l6jwGfrEyMh
         ZaGdU3+H/NpeTOOWYtn9jkvl2zYtpn5LDHiAll+CmrexM4H42sfGf6tvX0pNrQxE7Snf
         i/wrrl/T5DdwR4owcN6wXLy/V1sUJnpY/J1e3oeTbw3XZJeJSMMw5xJmzF3lvnhyfv/7
         stslY6gg43I2hf41d75gSha6iKyM+svuGspVoq3Tnyjt/LA0Cy1ARNqptgnKdMJ9wIzD
         WX65itGwSdxLRHTcraIT6KUsW6G/IYyekkyYCKyhZkjgBrb7LVdtwmBVFuNRQQXpVmnY
         /wgQ==
X-Forwarded-Encrypted: i=1; AFNElJ8xAzj6pH1TnWQZIyKPTmUBv6Jn9+vfBcDtOSjXn2+KEkxjswAwDrULdl/cwaHXpkCWSdvtb8OzO/VKn7/v@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb5OVMvjT5iXasZgh95CyWkB9Ner/TmFFwYRBuVw49sx/Px6LB
	yr/gRc4JnDSWtzl4IyR18Gy7GCY1m+BIaRniShQKfuZxwCBmqdQemdwxFFF+QoTGm7yW8nJCcem
	AOVBgDfBcBVRDl/YDqmewSQ7chHa/TD7lb4gVsS0Pq3HMmDRq5MzoTnA0H4Czq5FTNMrq
X-Gm-Gg: Acq92OHwS2ZmhesE6s3vTKEfaMM5B340j/NUvIu0oDX9jsy12PQeFsnvoNrMbxnxFWn
	c0LdUiVJUt/M9MK+KpSyyCtXljFGneKzC5xe7J5kBZN4nwAABmcL6UkocE6vohAe9dYPTfdzicB
	Z1ABCdIHmMNUxibTPqH4XJ8EvONfak7NqafBhfevJoZndHo5z20Fq/ry1hphrK11tTyHvk0+Yzj
	11t7qslL/jkj+0sL0o8HG0zewDlXubT4Nv85W2gCGoCNmT59mq5fExdXjkZQeHilHoCTHptbwGa
	a9bMar2NhdI8y37SbE0CPeAGx03VaKY5AY0V91FT5j80R24D+BJ2zprDCqveRWK8q3qG+q9HVr3
	WzcIP27vgAmqls/U1bjCgiAQ84vZrO2N4nE0qHdeyUXGc7tya
X-Received: by 2002:a17:902:d58c:b0:2bd:eeb6:ff2e with SMTP id d9443c01a7336-2beb0674476mr186833625ad.21.1779779287819;
        Tue, 26 May 2026 00:08:07 -0700 (PDT)
X-Received: by 2002:a17:902:d58c:b0:2bd:eeb6:ff2e with SMTP id d9443c01a7336-2beb0674476mr186833295ad.21.1779779287318;
        Tue, 26 May 2026 00:08:07 -0700 (PDT)
Received: from [10.217.216.23] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695a75sm149210645ad.14.2026.05.26.00.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 00:08:07 -0700 (PDT)
Message-ID: <a96fd47a-38b4-4659-bf82-b26df31fb947@oss.qualcomm.com>
Date: Tue, 26 May 2026 12:38:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: glymur: Add EVA clock controller
 node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
 <20260526-evacc_glymur-v1-4-b61c7755c403@oss.qualcomm.com>
 <snnl3y2ekgosvrtwmbjbk6izxpyoeiicw3sffqqmhontaroy5c@rcee4gk3dkux>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <snnl3y2ekgosvrtwmbjbk6izxpyoeiicw3sffqqmhontaroy5c@rcee4gk3dkux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA2MCBTYWx0ZWRfX/Dcv+87bIEjl
 hICPX/NKrQcD9O9+2Aj4Wf847ICSnj2HHlF6GG+gukMNpVqp/Y1usdylXRUj2F0sudi/wd/dyFB
 ANx6uH4fUh8EtxJ2nlHlUd/Hx1lTFQ45koOEmV+7KwRyxxD+ncg4vpAXwvhXGSDo7pjHv6F3JA6
 8aC0oCUw2J4ICKnQcbtzH8bkjKRVGwvVPsu/Pk4dNUSpMaMR/ekwHiPBZFnJoLcXok6+nxaEDma
 5q0TTkg7EzLCdZTvKmg+mqlTN3Cp5y55XE8hidWLjn9Cdp6bx8iZSiMau3+YCGMA+4ePflNBwU1
 xoSoVtZYzAcFRLjWN0Jvlq/IGspWdkCOnLW2V9uGGIAVc/4tNNeCXfgtJrhZaUfwLKe/Ol9h7L8
 mJHvCNf6YB1n41zxa+lY87+C7YLF53dmQB/v9jIuh0gr8EDa9908HABygVus+kO49fis/p0jo7U
 QdFkiwX2F98mEyBYtMw==
X-Proofpoint-GUID: OBBbc0Qs6NBPqkI5J1YzM-ysbc0rfsJl
X-Proofpoint-ORIG-GUID: OBBbc0Qs6NBPqkI5J1YzM-ysbc0rfsJl
X-Authority-Analysis: v=2.4 cv=XqTK/1F9 c=1 sm=1 tr=0 ts=6a1546d8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=fn4kkkoX8VGOtbxjAn8A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260060
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109733-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9BA745D1807
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/26/2026 11:30 AM, Dmitry Baryshkov wrote:
> On Tue, May 26, 2026 at 10:59:47AM +0530, Taniya Das wrote:
>> Add the device node for the EVA clock controller (evacc) for Qualcomm
>> Glymur SoC. The EVACC provides clocks and resets to the EVA hardware block.
> 
> Nit: evacc vs EVACC. Maybe it's better to write 'This controller
> provides ...'.

Sure Dmitry, will update the patch in the next series.

-- 
Thanks,
Taniya Das


