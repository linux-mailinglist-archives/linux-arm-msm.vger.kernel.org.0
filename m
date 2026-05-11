Return-Path: <linux-arm-msm+bounces-106829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFS5BfM9AWq7SgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 04:24:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7F85072BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 04:24:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83CFF3009F92
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 02:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE4F226A0A7;
	Mon, 11 May 2026 02:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VXA8KIRd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gsNtZ05B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B301F7916
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 02:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778466287; cv=none; b=ktia4+dvN+vqLstdP1E7lBIJH+uHb661ckuRAq7Hei70YtEaQizEHLCp35kQPY7IGky+KKD3BH7Vqe1OXUHZ2SESpJmRazoruZESDJbxwMVBiAhr8ohReDkuOSDOd+bwm0rBC/2F+FiggOvxmuXRUw12IcF2O0Jd9LNQUJInrtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778466287; c=relaxed/simple;
	bh=z/Oc9IGzqdgqt96PWJXKU1AhRYn4A/ccjjjMOkRN2Pk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D+FWahCtI1cx/HOc7TyNByulU7Yg4dBi8dnOd3eEwTzzG2Up9mdw5uouNgpTBbfsG8pQvPzggYF0RAQo6Y9r5rUU3KuURvgo8pAsYZTLN+wWwhUh72GxDD8rTa9RgBj35gEyC+/6lvV4da8M/jZz2rJJKDs3nJ7VQus9aFgHLCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VXA8KIRd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gsNtZ05B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64AMxebW189475
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 02:24:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NDiSg768CXBvGt79GGg+qABUaCPAYEyC3WguiTuB1ec=; b=VXA8KIRdowG6Ps/f
	8zv0HVMzFMIYzuxxUOkhukFSFNHVQn9Y+kXeWGGtumsMTHHwFO8xGMF2Z0vQRGfh
	Nw0OhfDZWAe/F/N3/a0auPLxWPJq0yy6pFojTg52SXyttklbyZNwOx35VvYw42zk
	atPXPg9O1GbNJt1diMqlv/cCIhkMbNBbIgg4yxaXus7cdAtsu8YIx0aZW7FaW1mL
	zznfWgwuJZ7BoIOr1vhRkb+6unfTHtDSb7zWeDSBnlfiDirQsxeQQEQ+m2iSfKrW
	rCVmnKVmDTPWU20Zafee8J758wnULpxJCUELtLCBiouS3tO3RcvP6uz7IgJORWWX
	IEQHxw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1vgy435w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 02:24:45 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8bc140520c7so64158766d6.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 May 2026 19:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778466284; x=1779071084; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NDiSg768CXBvGt79GGg+qABUaCPAYEyC3WguiTuB1ec=;
        b=gsNtZ05BtCjwHhgDdKkv1JYdWZXf3vzy304PjCWDfBtmxMd+igXrWmY1m630LWu7Xv
         jBHbUOkG6nDCTo9H9F9tmHopxXwlK9hS9Gha+oUGjNZBXEFgbNpBOMWX9RvwFMD18OJN
         E1jVepOvyUXC/5voN60xam+wVxUDrmT7kBU2jIqvrWbpU80EczuFMiP6UgPdcJRjTLkJ
         Q+Hx2ZhI34RFMdK2phSfKAyh9kbbu4g+h4mTDqUhCrVBfMFt5+tv/cBDyNasZo5ilpYN
         OXAVUfzcpFphPpdqHseMyaNlpQtqNlGAxgK4GB0xoxtsubLq5b00dtubKQyJOwc3Xd9J
         AyNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778466284; x=1779071084;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NDiSg768CXBvGt79GGg+qABUaCPAYEyC3WguiTuB1ec=;
        b=T1YS+qLkyWY5OjciQJGsqNCnsj4ofltIPJ0xgfrOPRAWb6HtfNlKnvwTHD1duNPL0I
         oW4hHrhNQDZnTyEqqV7IfAcZV9HzZvF8ICS3yTARFdnyMBmNbtBboyEuaUJBHvR0aUh2
         0ClMTb+8tKNO4iEUMNLyPL3+B+ycmxe1dOIeytMN3KM1BOCKC4LqIs5LfqA+ExkAuRAE
         KD7saqujrUwcgkyQgUdAR7mnrzXGS5UVGBjaIXec482zV5rvTLNtvz1DLExo8uJRdHn2
         bTiatXcDP1WsVLjm9kdWGww03N7Y5CR88Q4l5w1mB9+XIZMXwlBgdXabjqKqb49seZJm
         6szg==
X-Gm-Message-State: AOJu0YzUjRh9RaZrkitavBMXeqQuWwDAGn76ElSRiS8GAFH+/iAJJizQ
	EUQMoRaMgSykOS3bRZAt2Nz/WR1wXFPfrFGIZroEA2AbzRATzNK/nn4qtGfF570LqjTD+MJak/1
	eIS99vwEboMZvHzGhBryUiMFr5b72RJmaobdukiGGzw2QyOMYf2hc0Q8bHVj6e0ruYwfX
X-Gm-Gg: Acq92OHOZ+mjjF5rSYc6ZKe9XYe04opsIDodax5ZWpe0oF4gdu72LKbKXh0COlrIjR3
	MaaulC+6Alxd4OBThK6o8k1DLZ22assqvWvR3p09yzz45EKRYypiKiiY+ImUZO1k05uYHxIrNFj
	nh7zgczG0QAwYCyy7OrBl3CRMe1kQ4dTtwJDw4f1+aFIm7cG5hfzBEJ140kKyQpXHbDv+4zMLiK
	5ib7cUvdAQsbNR58xAK7i90YFafSsXUljrNpXf597hQ9hhu6k8nqLJoY9IUKg4LUlEkboNGpqYc
	GOeoMCvig6I7IqsJh44msjP2CPSfk8+BHGq13JiPOd1D2zPhdZ8/yOVKGYo5wJ5al2aRjADaufp
	sDOSEvfVqMEo55rw5QIuDqy0bhRJw7ruuyPylFOWihK47WwGgoD6QQ7+G9fe4bElqBgsUFwoxdv
	P6FMbUHok=
X-Received: by 2002:a05:6214:469b:b0:89e:a170:6af2 with SMTP id 6a1803df08f44-8c1afabc2c5mr138776866d6.41.1778466284604;
        Sun, 10 May 2026 19:24:44 -0700 (PDT)
X-Received: by 2002:a05:6214:469b:b0:89e:a170:6af2 with SMTP id 6a1803df08f44-8c1afabc2c5mr138776556d6.41.1778466284094;
        Sun, 10 May 2026 19:24:44 -0700 (PDT)
Received: from [10.38.243.40] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53ce7e73dsm300484716d6.42.2026.05.10.19.24.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 May 2026 19:24:43 -0700 (PDT)
Message-ID: <1d6b4182-7cef-4c00-a655-095c0388a038@oss.qualcomm.com>
Date: Mon, 11 May 2026 10:24:34 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] Add dtsi to describe the xe180100 CAMSS block
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
 <20260508-hamoa_evk-v2-4-3ebdca3e4ae2@oss.qualcomm.com>
 <328860b4-1d4b-4a90-9d10-cb70207aaa5c@linaro.org>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <328860b4-1d4b-4a90-9d10-cb70207aaa5c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fpHsol4f c=1 sm=1 tr=0 ts=6a013ded cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=SmDLwImcmQvp-VwJOJ8A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: RypRz2jMRxOp2NhWZmOR8G1HovglywKR
X-Proofpoint-GUID: RypRz2jMRxOp2NhWZmOR8G1HovglywKR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDAyMSBTYWx0ZWRfX7FoBYgFqo6LK
 y46QEagEkoMCJoSMTRisFNdzqYdmKTKdLY9n3Z4KTE0ft2JBNh8K+6m/kVT0/DQNrRdqx3linC0
 uuI5WTV1MS2N+qUip7kJijsQei+JqPOx6BxBduN+vklrpVbVJf7nctRjNg3QAnyFaTgOwwP1WWF
 25+fuBbDVaBoFv5U7JnGTftzY37+ZX8674/UK4A7EsqXuqxoy+9UUD4zGkppBUSpC4M5SQCjmi7
 IJqzNmi5v1f/JjZq8WIYHgWVhQtzDCP3VQjkv4TXh2ropMe3LbzyLDDEg8JTHkBzCycHakMFBde
 Qv+B/afBtFD91ZvTzTO/83XoeLVkhMu8PGmlYWrXB/dVCG6aHJ5FNYlodaSzh8nQ8gzIkgs32W6
 EYKVwvAw8bwCcjXhYT4nBhZzN+mYBVVxKd7aQ9XzzjRJRRIdOMabcSHzaeRLA/QqOq/1WyQ0/Dz
 Hb7Wlhdi1DffJee9pwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110021
X-Rspamd-Queue-Id: 5C7F85072BE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106829-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,nxp.com,pengutronix.de,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 5/8/2026 10:23 PM, Bryan O'Donoghue wrote:
> On 08/05/2026 12:40, Wenmeng Liu wrote:
>> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>
>> 4 x CSIPHY
>> 2 x CSID
>> 2 x CSID Lite
>> 2 x IFE
>> 2 x IFE Lite
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> I'll repost my working version with the PHY stuff so I'd kind of 
> appreciate you not posting an old version here, just wait for it to land.
> 
> ---
> bod

If we are able to designate the old version as a candidate, and should 
the new version continue to encounter substantial resistance, we can 
provide a functional version.

Thanks,
Wenmeng

