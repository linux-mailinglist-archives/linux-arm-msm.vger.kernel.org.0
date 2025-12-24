Return-Path: <linux-arm-msm+bounces-86465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B2ACDB3F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 04:22:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CCAA308CDFC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 03:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 943FC311583;
	Wed, 24 Dec 2025 03:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EjpL9JC4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RJa6W/Jv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2874030EF87
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 03:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766546305; cv=none; b=tzYOGDbEzZTCXaj9J6RvEbCe2HwBRNl0+QxbzxCk5Gw1ZE+0mcFTTGhoJrzJRusvzkByYmJRwHKsmSMY1tloiFNdSWDiF/ICrt0nX2LyUiJOIvoWJxoDfbHGFB07Tn/OBMhOL13dBrEMGmH1TQ1i0MRv0Ktv/1t7RNv0Xd6zxBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766546305; c=relaxed/simple;
	bh=vzkejSaCXJO6srXI9a9a3T5MG3aVvCRbaz7MNxvZ458=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HuE7L/O4J7LMZjTDR/7eUSbxHFnVa0T4Ewg6zNHdkWdNNSLiKPU0IwiZAoCwlnhfVo18Em+0TQ2jREeUlxcpSb8Az4mnZ8PKrXKwhEswcay87/VEQnik6+gydqJWu3HXL+wGudXNbh9WPoiXgBgglOFwXq8+I92LAAKuzPXzycU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EjpL9JC4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RJa6W/Jv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNGO7Dt1018073
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 03:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aaaT/MtsLg9/MTGw8soOQU5G/mHt56DgZFZKOaqo0YQ=; b=EjpL9JC4Z1HIzt2/
	McLlhVTR11aGdIhMqEZbB2qoO5m1NGLs/g81ipH0/oaktbZi7aiqeE4wS6J5h4Ki
	o/Xdv+c+o1wTwFh2QPJopZY/9FFAwHE+3R2kOz09XFdNfuo55tZJv+R5WbWrAdBD
	binDNVs59DND9iErwDU77actiKlWgs25uReyQgrRQ0pZM3rVI4EXKBwYxceDnWDs
	ikJMhsjAyxle0/wIqUNjpf/D5ROx9x6/h/Woo2KWQrqbdrgjEQChey+f5w3P0H04
	Xnu82BWmGfAMHbjeiAWtPuPY5ui+o74PCYraYoajhdYf8214gljUwYf4XpEPtoMg
	9fBeRQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7xjs9kea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 03:18:12 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a47331c39so142122746d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 19:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766546291; x=1767151091; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aaaT/MtsLg9/MTGw8soOQU5G/mHt56DgZFZKOaqo0YQ=;
        b=RJa6W/JvD7I5IbzTIlg1n9BIICtfM/v/ai988eTtvNIHOxVN+07E5ayHPtUPW2ck4e
         ipDXGteFz4DfauseXnYPwT2TvJNYwUSRld0gEbu59YZtzygMdjJYboS525LSGl8gPJwy
         WuwgesnS4+c5T3yhnkuSCVhUtyB6w+rE/65pY4zy3QDPz1S1N0gsCwdMqo8Is+v1+mYn
         cAZdZtRErJw4TO6Yuljsrvjw2o/vE/hqGTLfqwnXdpwpXBSQfBG2y8JlMenLGYzjV8TQ
         BF2GQUGk7GRNf3IOOq9qorl5z8NJLtTaFvtxn28Z7/d7eCY0Y9gKNr+yY5XyjnI+Hut1
         BoPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766546291; x=1767151091;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aaaT/MtsLg9/MTGw8soOQU5G/mHt56DgZFZKOaqo0YQ=;
        b=JQ+hen0zQ1sImztaQEl2dhkPu56cmxLeK8G6W24jGFijNi1gYme0RWshqU/tNfDZrA
         w7amjHEtb2CYUe4mcgAUVktBo+w6m8mG5nAXkHzpvIxES8HGMnBR8jr9hmVLVjdXOgfY
         Nxxo43FtqYqI+dHdxX0zeHnQMYlmPbWqFmOe5pXiAkSrSILUK8ymFAtk+1rKwrCMJhUY
         IhAE6naSQsFIZetKVwKtFceqbMTLFAyM4B8tyLqob+I0huSXdTtn8EA/mp33Oi8nS6Ef
         yeSszu3qync3knF2shXF76Is/ydL/JOZwb5BOmvi0bYSnKd1D9fb9+r/n5g22iyZb9MU
         mcBw==
X-Forwarded-Encrypted: i=1; AJvYcCUqXKglxEh3Ovmaa178KIW6vruFNGhirsSO3xPsFWSRIwN/tcfLi6gq25TCOfB82pym31DZb3atML5dJwcs@vger.kernel.org
X-Gm-Message-State: AOJu0YwBWu7AUzPu9GWg4cZijaI0Fb2nmMUzv1Yyfaeo7eYFgECE1ohD
	nVUiptXVGRfsJgn2dvu2RwDkc+zVJHNxUXXdGVlcwtR+NS4Qfzeaxv8fM+/eWZL82oqEbTpqNmP
	gNKqvZptxfg7hyfCKb7sHndmmUjzVd/XuBboe0TO8c2mXfIcnQkMNQGGQVsltg7arAT64N7Loye
	j8w+U=
X-Gm-Gg: AY/fxX70E99yLe4mW+OoDUsgFSEx66BoDeg2tfNofQP/6NYqT185+fYPXW11Zw/iZET
	8ujZZpdH1YDeoqapE/fwbCyGryz0HtOCnzOKqgMNlkHL3hmSwblGH3UQp2dQ9f9WRf+/czLAD19
	Cwe8CN2LZ9TSdVDpk1IMdRZ0efSlpjwGIAIWCPGiJD3Qins1lbaGM78gRx2YpBwOrp8Cb0+m6af
	bfCWkQAXaR5R1JULJysHTUKFWiaBtfRKKoxxevYYlbhvDsEXFkkqAz1qas7aOhN9y1SirWoizmx
	RQuSTd21rhoeBXIE/dCdDAVEAni4A5ZfxUvvVCh+BD2zdggZd9vD7KY3FkebnDd0Ur12tkvLC3J
	cl2ldZYHVwMvSq894pbLS7B6TRhSqavZ/893cbp+Q3T46Y0uSncexTqyVCSQbBFBdkRZ9FWjoCQ
	==
X-Received: by 2002:a05:6214:178b:b0:888:24a3:a9f8 with SMTP id 6a1803df08f44-88d8166a0e7mr225479656d6.7.1766546291427;
        Tue, 23 Dec 2025 19:18:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8XqDvxhmkUIG4JdHxx/10hJu4RbVFpkdEr60MvodJNZ0cdFzM17vLG27WZrE1k5cxRLcipQ==
X-Received: by 2002:a05:6214:178b:b0:888:24a3:a9f8 with SMTP id 6a1803df08f44-88d8166a0e7mr225479406d6.7.1766546290853;
        Tue, 23 Dec 2025 19:18:10 -0800 (PST)
Received: from [10.111.161.169] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d9a83f6f3sm121631886d6.55.2025.12.23.19.18.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 19:18:10 -0800 (PST)
Message-ID: <c6174a0a-9a76-4284-8675-bb5ca78a7b35@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 11:18:02 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] media: dt-bindings: Add qcom,sm6150-camss
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251222-sm6150-camss-v2-0-df8469a8343a@oss.qualcomm.com>
 <20251222-sm6150-camss-v2-1-df8469a8343a@oss.qualcomm.com>
 <20251223-pompous-inescapable-sponge-3fc9f0@quoll>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20251223-pompous-inescapable-sponge-3fc9f0@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAyNCBTYWx0ZWRfX4b/cbZEfGn4w
 IjUxyd5zs0oDqcyHjc7pDiz+At7ZRHJLHbDfu/0dSHF4px7JwXtClEbxeWpyvbgzm05Hil9F0Vj
 fsOTfN45e7kUCsn2wc0fQzJ0Uo+v5jHSQ59kha6cUHUdMCKFSFdDoxPaDMaorhbxE00WORjsPVB
 Yw7u1vhuPga4MWS1ecvAIZweRFn+SVZmnjFOUGm/rxRRYpCsgHF11nI93GOLAncri2Mr6WqESVU
 t2/4Xz7/uCAT0t7mtbi5kcUooaDavuw0J1liqDNee8Ld/Tl/7kx35h0oT/dO/yaQS3jZNoOvz93
 VhJ+K6/FJtr2cTh/WvZ7x/5Ccsys+pDKDJwgr2l/qtfNj00KpveKbcq633ssnA1pp8rBOLy6WF0
 y2EOEwWx7ANSQ/gL9cub1G0i/LWkVDcawPktUn3GywORg652PwHht1VzFJCRxLgyDYhuUwjcCNN
 ogzK5OkxCXnolm1NBIA==
X-Proofpoint-ORIG-GUID: IBQRD1kY0G-fpUaZhzLKBtI2KtLKA0eX
X-Authority-Analysis: v=2.4 cv=YcqwJgRf c=1 sm=1 tr=0 ts=694b5b74 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=UyieoiCksbjufx2AMFMA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: IBQRD1kY0G-fpUaZhzLKBtI2KtLKA0eX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240024



On 12/23/2025 9:38 PM, Krzysztof Kozlowski wrote:
> On Mon, Dec 22, 2025 at 04:28:39PM +0800, Wenmeng Liu wrote:
>> +  interconnects:
>> +    maxItems: 4
>> +
>> +  interconnect-names:
>> +    items:
>> +      - const: ahb
>> +      - const: hf0_mnoc
>> +      - const: hf1_mnoc
> 
> Same comments as before, do not invent names.

<&mmss_noc MASTER_CAMNOC_HF0 QCOM_ICC_TAG_ALWAYS
&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
<&mmss_noc MASTER_CAMNOC_HF1 QCOM_ICC_TAG_ALWAYS
&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,

This platform(qcs615) is different from others. It has two types of sf, 
namely sf0 and sf1.
The same as it is:
sc7180 sc8180x sdm670 sdm845 sm8150
Do you have any suggestions about this?

> 
> I finish review here and ignore the rest. You did not respond to
> previous comments and I do not see any improvements.

I'm sorry about this. However, the previous comments did not clearly 
point out the problem.

> Also, way you send patches makes it difficult for us, so I see no reason
> why it should be my task to try to decipher all this.
> 
> b4 diff '20251222-sm6150-camss-v2-1-df8469a8343a@oss.qualcomm.com'
> Checking for older revisions
> Grabbing search results from lore.kernel.org
> ---
> Analyzing 5 messages in the thread
> Could not find lower series to compare against.

--in-reply-to, will pay attention in the next version.

Thanks,Wenmeng


