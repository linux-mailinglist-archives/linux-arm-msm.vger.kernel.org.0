Return-Path: <linux-arm-msm+bounces-85883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C63CCFF9A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 14:08:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D91813081D6C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 13:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44675327C16;
	Fri, 19 Dec 2025 13:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FIvZ7eah";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gP4z6zGT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FD3325701
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 13:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766149335; cv=none; b=Mn8JPR8SVGBPnMeb9h3WdRLiUuX7p/cYspkjwH/i9KhJvSiQ/3JQGG+5Fb+6krzGf3IYU45cApfgAVoSK3t7dQ8tahnyiltidwJ56y6Kqg/iyR1VA8+J0lfottj/VWW8megiWnaEp++3QSZ7QfyQsl+2nz4C8vE85RNceEOhibg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766149335; c=relaxed/simple;
	bh=6Em3i7MID45x6PraANojvAi4wM69Uv1R7k3lu4+xBgw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HAWomQjrNAf8EKFC45suTL6lyBWowjZV8scZltmoc3HqEokg7BbKrs2kh2GKMPbZNEItPXmjX6x1LlnpP3a1iQwBDw1GXViDAABPa2PWDgtoEg+B7UaXQtEyiRoHwC/LFZU77AyOA84161Hs54uYsU8loErkoE7YMpKp4Wry6Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FIvZ7eah; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gP4z6zGT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJB832T3939127
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 13:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SZXL63hhjyW+1jMgBiewMjiLdhPV4CzHI9+MzSuzuiY=; b=FIvZ7eah4EyNSe0M
	k0GSK5z2lLWta2ZF42Yp+1A42yc6PC2oSiM/4Z2q6NCOwcT2DjwPmht2wszW6NLd
	7QxVx25gTSBOFkZnTmJf0yiOKFXqV8cpHe2pJbx5ACWoBkkHItdpqwSG6E51h4qg
	O0cBE7VnIgDSMCMmuULcrqvBwtBHpqpxLfCscj3yI/6XGa26iIBIssgG+p6wbgTD
	mfoe1fTAjLusa1cZXFa9ZwwiW/Y2E3xbeMol6QTlaa/foqlypubAZKvS1Rq6OR5n
	Iv1mlMC1QfVWH+0e8JCDfR+CeTiO0Lhd9wHh490/MAFYOObSAg6U4P+0eF54s9Ok
	eZQ8Ig==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2c2q9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 13:02:09 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9414fc8eb29so204639241.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 05:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766149328; x=1766754128; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SZXL63hhjyW+1jMgBiewMjiLdhPV4CzHI9+MzSuzuiY=;
        b=gP4z6zGTGRqPJuSddmUC5/r3ccuSWjS7XUZkRI5b9avQiGUEl+UJOiX5l5Esz0Sagc
         +0ZkQDq2Mealaj0mLTCztQ764ART4PQ8hMNKke6PSAzFX50eChZang6qSYdCNvIXzSVM
         /xufbTPmta06qpmLruL52hAJY1SLCjhPG/Jf2HzWPymNDpjlLaUpVXffhgVv2Rr9JUhx
         o23RYwqNRaq1LRBaPHy7i/+R/TYDsW3mx8DRoIvJppO7EYnIMLbHwGdXni+ejbyBWb5t
         xrjQSBpKwbSykIY8YOdscmBWvkaPTMXuypX6X+35ZLnPdT0nwX2rDoxmhxLbfVtVP/ke
         TXYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766149328; x=1766754128;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SZXL63hhjyW+1jMgBiewMjiLdhPV4CzHI9+MzSuzuiY=;
        b=w4czCM9xoC2Q2p50ZW2SqMnOYwIDZYKOdTz8sx26OUrMB7+8mb+dm+qBl8ZBe9CwW+
         /BjViT7OIAx88A5cXxoLFrnMoBKrNX7RawkgElxsdlOzrEZ5R2XOTqviCdqwys1btmj0
         sE/WqW4p+h+Pzx581mNXOppd9xfPxAhqm71XMqbu8Ee3K3bjcXUuvZk9vxQoaXqRmaY2
         OSg23ZWVHqhkUFXFIQ1XHzoGDuIt6p6KO+3uBB1q68SJZoqZ/2MGlw6vjlFn3cO48ecs
         oe4OAynU78m6e17vogNeavEtHXSQYxZNUCShy3eiMroVYVS6vFkNidIod5nYkvnG2O/9
         RSlg==
X-Forwarded-Encrypted: i=1; AJvYcCXFr7D/x1bCP5zd5vEdQkusRLCXb4juZqsLZbz2SGbpZdrO2L3AowEAG5iEvPaEl49RIsE0FUL/nETp+Abw@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0N80Na4jVbhebO+YFnckjwyhKnkIw5S7tviWksObKzosAluds
	XX4OS7mb0jaNQRVVGrwz5zCuXuw3Hx4kH4PvFEBrbvtCy4/y37CdejMYCcO+QO2+Vn2/20w5ZCP
	pBYIJVwZ6Sp/Jq/I49QnOnKWii2KkNumlcyhhFJCryv/H2O+FaeWmBsZg8LJE0+bBfZRbW1/7dW
	kd
X-Gm-Gg: AY/fxX7TLP6rM5TJheJRWzV14iXzgQwTjn9PLSvW+2kp5boDxV6jZ+fneZFZGEKXzpj
	mijWfK1WBtCwyqFuEADj53LefiioMJO7Mhs33R8Cvd4JrV2jZWhg2y24VziBp28hHivUtThI4sW
	GTtlwcZzs6yBzZTiehRp2Og8OJeV7q1pORywt97PLfNXFIMiVclX+g6qoOdcuzMJJshxS9GLXxT
	P9RKXn0pOqhs/0pmF45mnc40mTyead5JbteuWCbM2mh9aK9lljSIEUIkOq+VVT5DLv2NgKp9sof
	annmTusLjE13UJTXg1gpC10PZTXpYhCsFzLxAm3algiSYoNys+ZSstbJhsZhG2UMabTfPsPw2y/
	nkOE0O2ToXfLyTa2neBbVGodUdAjDj89MrYh1fIb09NvKRCp/TIxuKfN0fXQwbv5T0Q==
X-Received: by 2002:a05:6122:104c:b0:559:9663:bfb1 with SMTP id 71dfb90a1353d-5615bc2dae2mr435794e0c.0.1766149327867;
        Fri, 19 Dec 2025 05:02:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXeDGSy1uF22rzogOY11+L7dou3cJ6USkw1y5Af2xvx2Z79MJW104nHs4Qxm7QUPKa2C4w3w==
X-Received: by 2002:a05:6122:104c:b0:559:9663:bfb1 with SMTP id 71dfb90a1353d-5615bc2dae2mr435755e0c.0.1766149327079;
        Fri, 19 Dec 2025 05:02:07 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9159a6d0sm2136497a12.28.2025.12.19.05.02.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 05:02:05 -0800 (PST)
Message-ID: <701a7b2f-848a-4cc0-8924-ec72155d93a7@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 14:02:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] dt-bindings: clock: qcom: document the Kaanapali
 GPU Clock Controller
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
 <20251125-kaanapali-mmcc-v2-v2-7-fb44e78f300b@oss.qualcomm.com>
 <20251126-elated-stoic-scorpion-25b630@kuoka>
 <de44560d-4ed8-41fe-be7b-56412b933a8c@oss.qualcomm.com>
 <fbe39eac-7c92-4a08-bafb-31e5c51a0613@kernel.org>
 <503f445e-0d12-407d-bc77-f48ad335639b@oss.qualcomm.com>
 <e8bdb176-b6fb-4dd2-8b5b-9da8073fa915@kernel.org>
 <ca118faf-3451-4b83-9074-82bc5e1f731e@oss.qualcomm.com>
 <3e8128f4-3cba-4c13-a846-e5f1638a1e0f@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3e8128f4-3cba-4c13-a846-e5f1638a1e0f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4mdEv_SwGx8tZrAzbejmkBv5BBenVKQg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEwOCBTYWx0ZWRfXwkrhiwetVlpm
 jScr4gKC8EoY9X5gF9JQlqEWcyX3l+rOQdjDzSDvMeKpxsGI10AwusrpMLh08AK1DhgL968y1aM
 ePvCauzynP/Bpena8efSQvEeQAVExetodH+gsHCTp5j22EobvMR2B8CQNcdZKLU+Q3hIKBVhUKJ
 x+6Rlykw4SvF9N0DT5raczWf5uiCO8fF1ZtIjAdfRZDiO7NLK1a47cv6UPUrXv5ULZ81pRMDVrH
 Wo7ueeSGIJldK+nDRxKTuH0wH6XOgLc12wUD5aCRR9Md6AqbcpziJwGdKFOL59ZIiDeJeroPisk
 TmCXnT6PWBDJAol9o2vIhwVBrBxLDG7HiKJmbMz+XT+NwW7T7SVfXf9g7QZ4H7Xquq28ACvcw3h
 LnJZ5T9cdFPmWNFrBsymzJ30evbRZrrwizcdW7/UQOjy8MN1vCeV2mzBwBZJN+ntzSejNRre66c
 cfebHVrfXcil20wFV4A==
X-Authority-Analysis: v=2.4 cv=feSgCkQF c=1 sm=1 tr=0 ts=69454cd1 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bZysObWQuULb7_ZgAGEA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: 4mdEv_SwGx8tZrAzbejmkBv5BBenVKQg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_04,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190108

On 12/17/25 2:54 PM, Krzysztof Kozlowski wrote:
> On 17/12/2025 14:21, Konrad Dybcio wrote:
>> On 12/17/25 11:09 AM, Krzysztof Kozlowski wrote:
>>> On 17/12/2025 10:32, Taniya Das wrote:
>>>>>>
>>>>>> We would like to leverage the existing common clock driver(GDSC) code to
>>>>>
>>>>> Fix the driver code if it cannot handle other cells. Your drivers do not
>>>>> matter for choices made in bindings.
>>>>>
>>>>
>>>> As it is still a clock controller from hardware design and in SW I will
>>>> be map the entire hardware region and this way this clock controller
>>>> will also be aligned to the existing clock controllers and keep the
>>>> #power-domain-cells = <1> as other CCs.
>>>
>>> I don't see how this resolves my comment.
>>
>> Spanning the entire 0x6000-long block will remove your worry about this
>> description only being 2-register-wide
> 
> But that was not the comment here. Taniya replied under comment about
> cells. We are not discussing here some other things...

Right, you omitted the part where I answered your comment from the
context, so I'll re-add it:

"""
This block provides more than one GDSC - although again, not all of them
need/should be accessed by Linux. I suppose just enumerating the "extra"
ones in bindings will be a good enough compromise?
"""

TLDR: cells=1 makes sense as per usual

Konrad

