Return-Path: <linux-arm-msm+bounces-87616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE00DCF68DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 04:06:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E8EE305CA3F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 03:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DED021ABB1;
	Tue,  6 Jan 2026 03:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HsB3GQJO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IgDDiJca"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750676A33B
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 03:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767668739; cv=none; b=oOk3/q9gUpFyjXLtZkeq6roYXNYBvVVD7EQiRi2CU70GRgt7EVlkWd9kardacrI6Z+e1Iyt0mKzg1fno5G1A1ltLgBUNvwveE4B3P9t/oocPo2t55KHRRgv8rx/ZU//UEYP1DFJ2eFUsVBJHW+wtGvCI/3EvO55nyvdN5ubER9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767668739; c=relaxed/simple;
	bh=Eaxrr9rmM/yxXogqyNFes8uj7fVZG8xiqPIfkhgR5kA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Huia+heIJkqtcTlJ+WWPBf0EymVtk0NcWlGh06WOlbRTeTRKoGjw1TeQEHF6GyAauttebqzx4op1nCfVTkPPfJRh5ffvSZSwp1vh56uFK5KganJR3nwsPSdRbYa6q838FVswEnNICYpSttU1yL+hASiOhjGoXjxMNik4sZBpKKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HsB3GQJO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IgDDiJca; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6060o9722971699
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 03:05:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Eaxrr9rmM/yxXogqyNFes8uj7fVZG8xiqPIfkhgR5kA=; b=HsB3GQJOtrIEEj/X
	T7nN3rpOanWp84G6b9jWJO7/x7mJy1YaHLCe0PTMI+lBppqYAKoBTCMpnnf/AM+T
	lWRy7jvHPcS50fxFUc9XD1B22QgseO4QAUwy30Id9HEgu4MT+LFC4CBJH/dF7d1f
	INCBxPkWPQHHmzS1Iop6jFl9IXqdUE/qp3dP2A3DFiIIRhsg9gsu61O/ARB3bDIu
	GkeG9YcvgUt10t/nLS5KkP2A01Snf1ZwjHzKLaSd8kgGnybIb6KQ4NAOEfrthQwk
	JZWznGDyYnzX3xpwjmYxl6Rc6Y4vepvvdVldYp0kSHQECX/L1ivMJI249rjqP+T6
	H0mpgw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bggsvshk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 03:05:36 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7bad1cef9bcso1175427b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 19:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767668735; x=1768273535; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Eaxrr9rmM/yxXogqyNFes8uj7fVZG8xiqPIfkhgR5kA=;
        b=IgDDiJcaa1tskBL82+Mf/lx+UyLGg4hX02yOG80+gA/MLRmz1oL3ZCqb8+9qGLPmvO
         UyXBW4ayl/H9VIil2bp7sgetkdahI+QG02m4I4bpHokvVmu0ef+OmeskPyWJDFUGBkqd
         p2zzur6z6xOZnCUdVhdxpSMvc3sm+TiHke3xuWmpw0cVINxWAG3KiNk8arq4XkDkZnUS
         YYuQtWtmzmVZetoeWfd41oNKylwyN70RDelaNnyXBt08wdP6TamQVImz5qifPwNPUZPo
         lEy2FE+OxKunYoM0VBp+y0Ma99m6Fprj8q4epg3U49N6iNw1wJgEa+bTLw3BqVtoXjiM
         LPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767668735; x=1768273535;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eaxrr9rmM/yxXogqyNFes8uj7fVZG8xiqPIfkhgR5kA=;
        b=LbfrLg80k3khcrfeYC7ywAYndll2CQGOSzeJ4u4fKhX2awhxcieOQ4L/e3DiEP3zWU
         pFtjua9lOmC0uX1W2pqy5JWnNIHRJrJmJdwzfDtaWI7tK2THF2sQs8zhIsUdvh51SdTf
         tpm9RXGfXBpv3XKR33eIH9MslVT/GwnwK+pcmVkv6MQJFr9FkFo9kuBS3Mkrn/ETDc9G
         0GVcbhPnl1Hb3crLMpFfy/p0VxaJGR2CyrjMRWx1VKj2mxFoArSL3rfgtlJX19NjZHKA
         1+mXddOAyb+36EHrWq6d+Bm7ubtfm7sWem0v7zVfHE/H5K3F4i+pEsp1PUEQVwEqyxK5
         mtyQ==
X-Forwarded-Encrypted: i=1; AJvYcCW95u7sgISUAdIoPXLU0jgmq+0b/C69enudFp4AKqIpwm3q9ITjM3YWXMG9MnBvoED7RLpoy89MAn8jWM/r@vger.kernel.org
X-Gm-Message-State: AOJu0YzNzNP07Rduy+TcNeQTJOaPHznkfUqWmh2ux8WcFgBJMDn5WnUw
	U0KGca1FfGpcSVEMtOT50Rz24CUuS8iPglho9dp8o4l6poNFtxzd/rW8BTMfWSbtU7bqLy8zic8
	AUa6V7fnX3ONBZQCtTyrZxI5LNi2m/pRVx8JQyjydeZTLfuxgSB3cEoE5Lbfac2IRqnR4
X-Gm-Gg: AY/fxX4F5kXDH0x+iXikrTE/Dl6mfGEpWUIiZh/6aFfnxjCUwdGu+bPtvvFEW/yuBIX
	VCqy6HRw7Itj4+LfdKPMujDWRhk9UUChu8WVWkHshiAituvORG8h+pX03WQ08cKq3yB7MorZOyS
	ulPHGsmGK1TDQfT6thj/eCyENxoE/Sd2/4XTXyPiXpcdh+2M/i6uYRTsDoRwlPaWkFFxmSlrC5Y
	vQ58eFP9mCGyBEwW60QfJfL55dOlUeClrEwcAp0iRjHeV60rQnnzRaOskLAulWTUztiVf/Y2mHb
	MKJuF1yJwY6fBSrvKq+nUEeIn96Vg8y2iPmh8cMvKzK4QTMDu84DeLuFwyYcW6TKp1AjNDfd1mt
	3hcoglb21+51MZ8y5PGu/yGBK5d/jNIlFCxaE96fFE8gWKyXxl3HTprTU/pbFPZ1bJm5AAKSmcD
	uoKWqz9w==
X-Received: by 2002:a05:6a00:ac8f:b0:7e8:4433:8fa2 with SMTP id d2e1a72fcca58-818825f5135mr1524628b3a.42.1767668735254;
        Mon, 05 Jan 2026 19:05:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFy4FPUAb4fKmv7RwXQm5U4MimoxIKmU4QZPE5m2tID49l7pKBW3Zi0bq3SQSACBqkL5eK0Xg==
X-Received: by 2002:a05:6a00:ac8f:b0:7e8:4433:8fa2 with SMTP id d2e1a72fcca58-818825f5135mr1524606b3a.42.1767668734794;
        Mon, 05 Jan 2026 19:05:34 -0800 (PST)
Received: from [10.133.33.108] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c59e9d42sm486142b3a.51.2026.01.05.19.05.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 19:05:34 -0800 (PST)
Message-ID: <3f3dfd39-2cd1-4b03-8632-2c9d15b0bc2e@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 11:05:30 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Commonize IQ-X-IOT DTSI
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Yijie Yang <yijie.yang@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <8bcf058f-5bf9-46ce-a188-e94954101f2f@oss.qualcomm.com>
 <4f79d090-7d1c-4fb3-a835-a7e4ff96f79c@oss.qualcomm.com>
 <448f2efa-5b1e-4855-a62d-2e375938b36f@kernel.org>
 <c7983b8c-5085-43a0-bd5e-1194df2f0ee5@oss.qualcomm.com>
 <a2b62af6-fe17-4c4b-9dea-4ba9cf312765@kernel.org>
 <j7i2oryel7d5u6gsbb54iaer7amqre2vzwkb6fieybascvonwi@bmt7zmcvg7yi>
 <36cb7d6e-ece4-42c7-bc11-b66837df5fc4@kernel.org>
 <469d89c9-8f6c-4abe-9d9f-b6a47f8cefd8@oss.qualcomm.com>
 <f54dc011-1796-4088-8bfe-be19e8bd9157@kernel.org>
 <bab3794d-d7f8-492a-82a2-6a8a6f80a708@oss.qualcomm.com>
 <6qvzhyjrxctrrdvhktxkusyhdcohr43muung5paan2i35suxwg@kfl5kkmpv4fw>
Content-Language: en-US
From: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
In-Reply-To: <6qvzhyjrxctrrdvhktxkusyhdcohr43muung5paan2i35suxwg@kfl5kkmpv4fw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MG2J_I6lx0cpF3oUFBLFn8WepzJm3zma
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAyNSBTYWx0ZWRfX7Vis/5XKWlKS
 NodD79Qsd5yPNjYcgTw1DxtZQwUpN92dC40UaNp3G8U3QsQet97e7udOxEen5TEoDEwRlhrpA9b
 DkD31HIoFFUQ23KKRe3q99MAe66cHP+Zkm3MLdhVFTF2uyfL8f5cqQ6DXShXWrP4GQjfahh5pD6
 e2k5Bg8e8DY5b2fsPwSG3Yk3pIuXC5uLjijcWpOo2EiIxOw7BDLJqu9rSFJ0nhMXhReDEAYGi+8
 MVwECTmBcjAePHx20mxDk3JpoH3UE2Hs+LEHQJVlrSWNc5KYU8jPX5njm63f3VqMqaQQOcU7eDN
 34W6dW5VxPwcdpXon6Jp/sUYaDCBXUvjcZkhxiyv8X4hvJSdktUGL+RDWoX0mpiUn49M0QsLzV6
 cSLIJh/EOrkOHoSWYcbKdVXxbk1EYeYbF1sdJFru4gUNhvzQ1dMBvU3c7RbglUNzkTp6JHUvnzz
 OWq0Gd123T6IrmEBqBg==
X-Proofpoint-ORIG-GUID: MG2J_I6lx0cpF3oUFBLFn8WepzJm3zma
X-Authority-Analysis: v=2.4 cv=Yv4ChoYX c=1 sm=1 tr=0 ts=695c7c00 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NOXgDK9tOkanpevrMyUA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060025



On 1/6/2026 9:47 AM, Dmitry Baryshkov wrote:
> On Tue, Jan 06, 2026 at 09:24:38AM +0800, Tingwei Zhang wrote:
>>
>> On 1/5/2026 11:09 PM, Krzysztof Kozlowski wrote:
>>> On 05/01/2026 06:36, Tingwei Zhang wrote:
>>>> On 12/30/2025 3:21 PM, Krzysztof Kozlowski wrote:
>>>>> On 29/12/2025 21:08, Dmitry Baryshkov wrote:
>>>>>> On Mon, Dec 29, 2025 at 09:47:05AM +0100, Krzysztof Kozlowski wrote:
>>>>>>> On 29/12/2025 08:38, Yijie Yang wrote:
>>>>>>>> On 12/29/2025 3:21 PM, Krzysztof Kozlowski wrote:
>>>>>>>>> On 29/12/2025 02:23, Tingwei Zhang wrote:
>>>>>>>>>> On 12/24/2025 8:12 AM, Tingwei Zhang wrote:
>>>>>>>>>>> On 12/23/2025 9:41 PM, Krzysztof Kozlowski wrote:
>>>>>>>>>>>> On 23/12/2025 04:38, Tingwei Zhang wrote:
>>>>>>>>>>>>> On 12/22/2025 5:11 PM, Krzysztof Kozlowski wrote:
>>>>>>>>>>>>>> On Mon, Dec 22, 2025 at 02:03:28PM +0800, YijieYang wrote:
>>> If this was the same SoM, just with different SoC soldered, it would
>>> have the same PMICs. Different PMICs means different SoM...
>> I agree. It's not same SoM, but they are very similar with same circuit board.
>>> Anyway, I shared my opinion and I am not going to spend more time on
>>> this. It should not be my task to go through schematics and prove that
>>> PMICs differ. Authors should.
>> We will make it more clear in the description about PMIC difference.
>> Since we have the agreement that Hamoa/Purwa modules are very similar,
>> we will use common dtsi in next version. Please let me know if you think
>> that's not correct thing to do.
> I think, you have been clearly told _not_ _to_. You have agreed that
> they are not the same module. So, please stop.
>
From hardware side, I think we are on same page. Hamoa and Purwa modules
are not same SoM, but they are very similar. The only difference is different
SoC, PCI, APC supply and one PMIC. The circuit boards are same.
We have exactly same case on Hamoa/Purwa CRD which uses a common
dtsi.
Can we use common dtsi for the hardware boards which are very similar?
Is that very strict that the hardware boards have to be exactly same?


