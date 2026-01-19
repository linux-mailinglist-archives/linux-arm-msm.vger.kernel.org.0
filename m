Return-Path: <linux-arm-msm+bounces-89608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D03D3A50F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 11:31:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0B123084D2B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 10:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FC34352C36;
	Mon, 19 Jan 2026 10:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KJ6EYiIB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bneaf11M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E8733A6EE
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 10:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768818494; cv=none; b=OQ1+NBRksYEScldi0X+nf60/Gzv7TTZQLbCwv8ct3AwhegxEgoiFFWjl3ktovsDUitXogBjrDlVFc/EJqUYLBv+L3igmuJ6mC6VJ/jgNdxeAo4Y7HsoCJPuHdWgLuxFoa+T2MQjwXcRxxiV4T5qmvwMtE/xDWLWQ7Hf5Rt8lGyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768818494; c=relaxed/simple;
	bh=1TTWxLD//vavcXET3qSN3d3YFlnSmRQXg+2dMp5AMPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fQOkSMiycKz/ATuXt5MfjZk0kZDkr/BrTYHGuf0Ye9p1UCxo7s94LzynpAUKwOQEsFp+GpW1sIU1rP4M5K0HVM8dOSU2BMn9pe0u0x2fiYuN+S6Cgioa+JDANjFK4thkdMs0oP03eQlADkphHvZu3BhNpL9gop6AVqhTEvgtQe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KJ6EYiIB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bneaf11M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J9kKuv774079
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 10:28:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zgDTgsCTahWEZhB03zi/3mLe2SOyw+84BxrjADPSQeU=; b=KJ6EYiIBH9g/wBvf
	blTbe9NYeUJNfqqFVn4I9dtUNpR7ceqayuliLQUyXH+o5DhTGup2z2bKdUyb7YUr
	VQRF7Ji2GLwn4GyvBpQ/+IH1sw4NVSCHk7RqM++uUIsC511cuc3PEqodetbcst4N
	Yjk+h7qvvlzqWndVNmdn2PHY2R1FtZNMN95i8gpeTCdejeWIcT93gkT3W+naKN4p
	CdcN/Zn35rV0TtyHKHDqaFbJ89S6MS4XTJhut1/GMmLBOFTqONuoo27JCm2b5Pc1
	aK65wS0t8JJAxmuecwsyznaWBnwe6hEzz/EtEBxOfY4702nikrlcLU/7ZoAA8FQ3
	bskqtw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsj9a84sg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 10:28:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a182d4e1so104924485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 02:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768818491; x=1769423291; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zgDTgsCTahWEZhB03zi/3mLe2SOyw+84BxrjADPSQeU=;
        b=bneaf11MsD4AxTKjXsR/L8WOZRHN5Kxpgq2iq76jzJdKuoY5rwHnj4HUOAO2OG+8Nr
         8Os7eZjFGVbW0HeM3eDZHSAjMqiEvXVNbB3jcuYHgq97yjZhA2Z9+pwhwNmpdYkO6MNN
         /8Uevkg4/rL4d4mhUYKCOotyoh5cZzjv3JpHsclS22W0c5KAdYFaX2/4adNQjuUHS4QI
         +mBu49hsNJo5h+30m+ZQT6AJZfvu7H+CKWb3tG3Kc5LA6jTZilHG5/1LgVHoKpCEofF1
         jPyAnjwZ8lqjPX5Qz3fiZWESjPaDCKAEjF29fga17t1rdvq2R61ofCw8pFqqyBIVgix8
         VMYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768818491; x=1769423291;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zgDTgsCTahWEZhB03zi/3mLe2SOyw+84BxrjADPSQeU=;
        b=ZOh3qeYfpeE+kA4tdecyw/esl9cRnKbBvOEEwohLDwW/vVpfC5h842eiK+ZjKVLsMe
         kvRf9DJRwXWt/JMIXzo4LEUOTqEXJ8oSmgJTHDNYgOXypB734mrer5EFKeMnkbOyI9x5
         Xhv88iE5Bhq3R/POY6FjQCXfWKLJeOnS2XwwCUJ6o0qcAu2gRqzFA44cqfDdnDVl/LiL
         j+aMZEtRAD7WqMWhyveCMA1//LIu7AmMRN5MIDh4GUYqRgq9HsrvvPOIOKblwGAb4cE9
         9WR3wMrDKO3evA7k44GKAkbB89taoGfnqvebHrpBgjyXXlHPjmt4hlGemvioCYJYakfJ
         4cTw==
X-Forwarded-Encrypted: i=1; AJvYcCXzfAisAviKvCDICE5JyAydVCNglXPmpjbO8yHWPzFbjugAvGq4lj9sSmkx94Ktxok3VjbUsls8Q8n4dOL+@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+t50ZQrxLwRcddnXj9OuCYY56Y9uVAXywttAl1ArSbj0Xi9hK
	lKS6rNsgH8r/zS42v4mj7JzokSL86inNKSSu1Ym4amiqUEsoMAE+Bf6ufVj9DnQBjg6DwWZTsRb
	P6NZW1z7Z8qP2WTxZV/vZoA3tLvbETp9G01dNWlLPLZswaaBcVYj2coYHliAWwt0Op1qtA/FEFC
	tk
X-Gm-Gg: AY/fxX6sqs7zoH1pnnsRWDY9ltfb6HjcOL9bUHKaSQ75Qf5PVdzHWg6b8VbuKPIgWc/
	frv6+xxahegU/RCFTJDDJcPYLfSpR4RLHalnz8Mon43ebsXZZIYjwuaeNoq4aY955VXLEsI1USl
	mZTtWO1b+J+6lsTzzqFAatJW2rrUcudAVglO2twGaKD7oQ+VZdCrAP3Cpm74PPbZ3L5GN93jNoj
	aCcwSKodB3vGmmtyYGQ7PcD4Gx5Sihr+/m/Bpt2gUBDOi8tUBVQ3erbJ04lrOLu6GabMuMHHVXH
	OxJfbIRXbh10jCERS4oS6J98xOFFT7Z76XTLGHU0vRAsbJTdOQjUbI194aErgKRdRMB9sWRwifc
	7RtTfx+sIzOAqAC4MEHT73zYuqB1EV7nRJse0Yo1Zfq3WqSemcM7drfyuGO+OykVFkTU=
X-Received: by 2002:a05:622a:1794:b0:4f4:b372:db38 with SMTP id d75a77b69052e-502a1603f71mr117659231cf.5.1768818491142;
        Mon, 19 Jan 2026 02:28:11 -0800 (PST)
X-Received: by 2002:a05:622a:1794:b0:4f4:b372:db38 with SMTP id d75a77b69052e-502a1603f71mr117658901cf.5.1768818490586;
        Mon, 19 Jan 2026 02:28:10 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65452cdab55sm9920707a12.10.2026.01.19.02.28.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 02:28:10 -0800 (PST)
Message-ID: <9f8619d4-43ac-4bc0-9598-c498d59a27b8@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:28:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: clock: qcom,milos-camcc: Document
 interconnect path
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Luca Weiss
 <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
 <20260116-milos-camcc-icc-v1-2-400b7fcd156a@fairphone.com>
 <20260117-efficient-fractal-sloth-aaf7c2@quoll>
 <59d9f7ff-4111-4304-a76c-40f4000545f5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <59d9f7ff-4111-4304-a76c-40f4000545f5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jqg7YAXlWee-v-Ck1H9786Kyzm2Yz2aB
X-Authority-Analysis: v=2.4 cv=N40k1m9B c=1 sm=1 tr=0 ts=696e073c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=RTbhy0NO0nWS4SIPpYQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4NSBTYWx0ZWRfXwvw3O0H+3R8O
 jelDIlzGmEZV5E2rXqdBQ/9KwHZtOe9mu1VfL/lstD0bi/sOIzKVA7e6P7P8GZHX4vZByjcz4c0
 AP0NQGdWcfV0te9ri9NcxML05VN0EQgnELeEBtDDRBhUSbn37ca1cdwJ3FqRKF6ZVSjsfkeIitC
 NIrslKk6oLGwWAMjPN/vF9BM5xa/uJfHUm2CrzlOwSwRotCtKsuVZ4xUHCr6oMhEYnT2kb6WEn3
 7hgsmYV+kDqq8C2xWK/h+mEf/uu5tzMhQHc4D5cEzTEacVAQBt+fOl/ldbP192Mp48jGCMiswri
 ABHeCT2UKDJ0ai/0cKWMJryeixxxADlV9i0bcdwElXU+gUT2Ty0Ag2217HzRIRejccwPMR4clv2
 FM3V8ChWxW5Myk9MGPuiIlPRL1n/nrfwC6HTgRtVqvK9pNRcGaxHcdUpM8+XbBXThICffqen636
 RjLoU08Q/kg09Ek8toQ==
X-Proofpoint-GUID: jqg7YAXlWee-v-Ck1H9786Kyzm2Yz2aB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190085



On 1/19/26 11:20 AM, Konrad Dybcio wrote:
> On 1/17/26 12:46 PM, Krzysztof Kozlowski wrote:
>> On Fri, Jan 16, 2026 at 02:17:21PM +0100, Luca Weiss wrote:
>>> Document an interconnect path for camcc that's required to enable
>>> the CAMSS_TOP_GDSC power domain.
>>
>> I find it confusing. Enabling GDSC power domains is done via power
>> domains, not via interconnects. Do not represent power domains as
>> interconnects, it's something completely different.
> 
> The name of the power domains is CAMSS_TOP_GDSC (seems you misread)
> 
> For the power domain to successfully turn on, the MNoC needs to be
> turned on (empirical evidence). The way to do it is to request a
> nonzero vote on this interconnect path
> 
> (presumably because the GDSC or its invisible providers require
> something connected over that bus to carry out their enable sequences).
> 
> Taniya should be able to explain in more detail

We'd have a better chance of her responding if I didn't forget to
extend the recipient list, fixing that

Konrad

