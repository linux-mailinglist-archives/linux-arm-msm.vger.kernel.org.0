Return-Path: <linux-arm-msm+bounces-93575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAKxHgbrm2km9gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 06:52:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C887171F3E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 06:52:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B2DD5302143A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 05:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4F8734887B;
	Mon, 23 Feb 2026 05:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZgYinORc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AHQ39gVc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59EA346A1F
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 05:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771825892; cv=none; b=snAu0iLxhpNBod7WFFRCp/RXP+doQSbdHsaiskmlth2P6Z0g+y2CGcS/ZfQWmnTkBd1LWwuXa4vCgfi1q9jHbxivf3bKHB+5XgJ62CG0Jvd1nWA9i/xGaC9TUg+WJsGugHwS6XYD4Y+xvGgtifmMh0EHsK2V0jrE0nFngwialNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771825892; c=relaxed/simple;
	bh=5B2uH12fWkNLBwvhB4AC1A5SWMXFlRrD3cTFy4kbAC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D2f0ImbLLBoNvubSss2y6ByPrPbx/1yYqg45Ky9vh9L21NtFIrxSqlSe5aWJWmi6gcLoAxLw/xXIyt+3P58XXgPyS43XDDfoinyX54vrqBDzcSxKgA4KlTAAlU9Bjz5hvX45ow4TwQXwTSt3/II4p869hl7GlFxIbq4lFqHlbBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZgYinORc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AHQ39gVc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MKkn9k1752687
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 05:51:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YlXIqsOQwvU5Z8sYlXy96uUv0HGYahf5Uvea7D0cr+U=; b=ZgYinORcXQgSYDSG
	ezYaEM2QG0zIJB5sy0PpAchI9t6QfeFj5kcidIkM6mJp0RYUxto77ipt3cWDAsyU
	OVNk+W08QS0ij/wpoeCmSZ3XDkk/xwWgR9e4C4IVopnp5lZTzMZUdYkyxTCXecN9
	Er0Mv9Lcs688dAbWC/cJnrPNh8iZqrFjMeBaRVCLzDJTjql0smmpuGG8Ek09KRw2
	8CPJ4AEDQ3tldGn38Fsj/+8gjG/4ZfU32msry48u7bW+3yppDvoNtS4/0ndjn4Ai
	Boz8k3kp1LrUDFYdEJxgbxbYOTZa2aV7PjrJa3grRtTfcaQg6Ssude3j8HkZGTJQ
	QwbYsQ==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5waugmj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 05:51:29 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-45efd455a6bso48303644b6e.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 21:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771825888; x=1772430688; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YlXIqsOQwvU5Z8sYlXy96uUv0HGYahf5Uvea7D0cr+U=;
        b=AHQ39gVcznvI3eImFCQpFLNbg6X2yP2Z/ouFFsunvwkzkJOkw91phizivC6zv7+Xvh
         8bkwTjnDUA8cvYU1NERg0vnom0unOObL8HXhjE/GfxYrwuvOy8oqeUhGxP50qQgqKYxi
         N4uUfsiuMLo7+03eLrV0iBB9To6iKIUA4BEtsM0BuWq9t+1yVDq2utG5BNqduzDseq5X
         7d3vn4ORDrIVBWwe0y8xO86KkHd0wA7/r9REr2uAVMXV59sfRTFccSGvV3/sEzzILwD0
         kSHQg2GddcnVOQct1uEVoKW66kDHrKEnpQV6qQBf99lM/iBRSmv+Y3p4CTs0aodvZ+lT
         nXTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771825888; x=1772430688;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YlXIqsOQwvU5Z8sYlXy96uUv0HGYahf5Uvea7D0cr+U=;
        b=Rl2VMMc4ps7ogpeJ7bXRMLEsNje/0WFMnR7Rj2latHQGb8hUhfUGWzquEHBfZBYK+J
         GJrc0Wu5YkUkMrButLglzMRNrU1DvD37v9ORJBbgo39xZkKwnziuBb5btudPeKivoM6n
         G7TtPQJEJjqiczniLpSL+mcX+rNM1yG4yxX1lMqesn94HQs6EMlwMksH8sdNTmrlBdXj
         h6nXBblTiT74GSsQaM+pfLejaUvvauVSVWKhk+F2DE7v2J/sdIWHYKtyvo4JRUcRDj7T
         FY45C004T4gApqSnxmPYWw9F9bkBWEOr+DPe6lxBEvwwB8lJkcJDwmOIxXEBiLznIUGs
         KxtQ==
X-Gm-Message-State: AOJu0YzlwFaR5VaF/CDW0PxzuRkMXQB6fjbydR2qCcDb7z6PEwhQehVZ
	ECxuFGLns8GkJJUB/9uOm/jYoCVSI5g6ajk+VfetrryLuBGxWFow5RHnWxTF3U/xv+VPZSAmpBL
	x4FYfur67aPaPVdtCcDedmHALEbr0/m6qHYxemPMBKsJ4ixAHLgIf21QMEc5ni68TYGKzdUhYmB
	sf
X-Gm-Gg: AZuq6aKnh6UGaYr0LD4LvQdPknzAPXQmJjxNtlnSlZFW3EiesZFVvycs0LHCs0XTNBx
	c70zdhtFy8dHOCmmCEUvx0Z6yAKgs+J3T80I5bpkw1CobHlwQ8koaLTRvftHhTBJ6jJHWWjM75f
	YNxUeVuCocJL0z7fCwhh3PU1RDz6UyvCN/VnTfxZYaVfcs21VsGpusB6LMN1GHT8QOXraoJyEHB
	fAtDO/ZDlxWPheLejAQqhU970v1lcBe9/RMXfv7nm1b5zcJqAF+1E0ntjOIE2u4KZ+yNJecxZil
	oCNvj5tCj/ErfvSVvCkZM9+XTJlhj2A25NV9Cif07peqfk5YefNj2+8OgFCT6wyiGgsgpF8FpKi
	R0zLY1O57O6XWB7rHtCILI3zRNsR313jjGnrhT0LKNrrG3TNJhR3g8G3AiaVGSNrvebmBJ1mx
X-Received: by 2002:a05:6808:c281:b0:459:9630:3742 with SMTP id 5614622812f47-464461b5eaamr4040523b6e.22.1771825888236;
        Sun, 22 Feb 2026 21:51:28 -0800 (PST)
X-Received: by 2002:a05:6808:c281:b0:459:9630:3742 with SMTP id 5614622812f47-464461b5eaamr4040514b6e.22.1771825887902;
        Sun, 22 Feb 2026 21:51:27 -0800 (PST)
Received: from [10.110.58.37] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-46460661eeesm1987552b6e.13.2026.02.22.21.51.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Feb 2026 21:51:27 -0800 (PST)
Message-ID: <b1fadee7-74b1-4b66-845c-3a525f259a98@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 13:51:22 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9] arm64: dts: qcom: qcs8300-ride: enable WLAN on
 qcs8300-ride
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260122053624.4068718-1-wei.zhang@oss.qualcomm.com>
 <46d0bc58-2c85-4293-a8ee-480282b80161@oss.qualcomm.com>
Content-Language: en-US
From: "Wei Zhang (Stone)" <wei.zhang@oss.qualcomm.com>
In-Reply-To: <46d0bc58-2c85-4293-a8ee-480282b80161@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KJVXzVFo c=1 sm=1 tr=0 ts=699beae1 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=JAj8-Fn0YFEjOL2seJ8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA0OSBTYWx0ZWRfX6XmRTAPy/GWC
 ZvkIVDvDHWC1HaFLydhwpVWDHVleG6dXxkeYM7YtvasMT4fVGZjMyy3QteQ7+LkBmNWzR+/4fAy
 VNEWCs8pQZdi+u/1NC7N6MJcwvHqJCwJDcZYu2zpWgszKLljU7fNW7UQht349pfL4cZYXg8unDO
 +vpL1IHee547VFJbyukPYxY9sqVRIu1noduUNNPSD+O/nhNAWm9Wb22HBpzkMJFHJP3mEgd/OrP
 ckwBF1DBcBib8xWg5KCoL2OnXhRfbAfP2I81h++JnC+Ke1m8wu4CQNW00MBSuE9XYjtqrmWpTs8
 ZR0V8CHV3xhBO43F7q4aR80Efcaq8MefCzmPxc962lrlHI24N/yT3rby7mDhYvGI9QuK7daXmBC
 79sDZKUQZzA0rh3MCw0msJ85bULlG8y0jdrx9n+3LhYVRE7j3XQNfp+KutUBUq4y2limGQBZuUn
 iiqYyAAB5y+kNHtlscA==
X-Proofpoint-ORIG-GUID: sKOVZXVNGgNzdVvxAzxMMgIICcwZ_ss8
X-Proofpoint-GUID: sKOVZXVNGgNzdVvxAzxMMgIICcwZ_ss8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1011 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230049
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-93575-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wei.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3C887171F3E
X-Rspamd-Action: no action


On 2/5/2026 5:28 PM, Konrad Dybcio wrote:
> On 1/22/26 6:36 AM, Wei Zhang wrote:
>> Enable WLAN on qcs8300-ride by adding a node for the PMU module
>> of the WCN6855 and assigning its LDO power outputs to the existing
>> WiFi module.
>>
>> On the qcs8300-ride platform, the corresponding firmware and BDF
>> are QCA6698AQ instead of WCN6855, which have been added in the
>> 20250211 release.
>>
>> Signed-off-by: Wei Zhang <wei.zhang@oss.qualcomm.com>
>> ---
> [...]
>
>> +	wlan_en_state: wlan-en-state {
>> +		pins = "gpio54";
>> +		function = "gpio";
>> +		bias-pull-up;
>> +	};
> pull-up sounds odd for an active-high pin
Good point.
GPIO54 is the active‑high WLAN_EN for WCN6855. The pull‑up is intentional to
keep the line stable during early boot and to reduce the risk of a 
low‑to‑high glitch before the PMU driver takes control.
WLAN enable/disable is still explicitly handled by the wcn6855‑pmu 
driver via wlan-enable-gpios.
I can switch this if a different default is preferred.
>
> Konrad

