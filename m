Return-Path: <linux-arm-msm+bounces-58876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C64ABF0AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 12:02:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69B8C3B48D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 10:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4287125A344;
	Wed, 21 May 2025 10:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WL/b4UT/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F8B22B59D;
	Wed, 21 May 2025 10:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747821772; cv=none; b=eA6qm9cg3zYPmbNnWBBlLZQMHqP1Pi4A9VUejlEyCBvtJSCaK/9bZQVWgkV+9B6oXMTyydiDXvlNmqsATcWS6JhaNV46PHATWKtUdkcUJOSKPP/Zc6Aqq8RpbvoeqZkUC4KUaUf2tolSf7TTHd3qalfPoD/d8cHiJBaNLs60Ydw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747821772; c=relaxed/simple;
	bh=s5n+/vzAdQy/+BLtMYMB0dflYdmUHeprpP/7P/3ufBs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=owBvfSt8BsIiYbDGu5MZY1lyvHxpShp18tnCJhJkfqjtl1pSW42GJY7X1LfAYWD7k/1lkRTe6IrVX86QpH1iOc+mF4G+Kgs+XWP22+ZZ6tVb3/zl/YwD7xya4X6bzNFBo/+1qoUDjTlkrXn1lHBkgtOmuZNnaI0op/ynJhqtHYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WL/b4UT/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XNAk027636;
	Wed, 21 May 2025 10:02:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aglXn5bbF2Mtfu9pUWzztj7c2/bF74z/9HclfhgJmw8=; b=WL/b4UT/rXDeE7nC
	DXpdXIAdM8nilIPYkhMNcywzy23Ctnf+jCJ7z89GlQP51xWC482GGe4z9NQK2Wjz
	4msxrAjGaw2raeszO8kdsmg0qB7a314hbGyR87/ONLxINku1aMG0WO1wuyPrtz2k
	bjMMNBCi4yC3b7ELuxr+/BPld2s0slbc08Hx3gqyGphmjjH+XFFtdKwfC1aBKO5h
	LA4dGy34DzHkjv3RvFQhRQZjZdLJ3YO4TqWnX7EKW8KAVilZcah2ymSnWMXkVJzS
	qvjtbK6sfOdjsRba8RqE8iEpa2Iu0KZEa3CK+6+g6EGA+EPsRbCWeN+Wr1/geGMs
	tGCQnw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9afga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 10:02:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54LA2h8Y031585
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 10:02:43 GMT
Received: from [10.217.216.47] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 21 May
 2025 03:02:37 -0700
Message-ID: <ec4ee2f5-162b-430d-aeb9-90ad4559707b@quicinc.com>
Date: Wed, 21 May 2025 15:32:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/18] dt-bindings: clock: qcom: Update sc8280xp camcc
 bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Vladimir
 Zapolskiy" <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov
	<lumag@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-2-571c63297d01@quicinc.com>
 <20250519-barnacle-of-beautiful-enthusiasm-4e6af0@kuoka>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <20250519-barnacle-of-beautiful-enthusiasm-4e6af0@kuoka>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: F2cKs9OAE1xTReTfOzMV6iBsg0rAphRC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDA5OCBTYWx0ZWRfX2wwsWNzVbQBb
 NQSSzzRoUsAyB9Sff9ElOO+ZDrQZ6nqt2MQ/eFg1nUrt+pHqTP3/JX8JgPGSWPQOqu/qofBLuAm
 L+Gy+2kiS/GGqhD13DtKWPQJjcGt2tZVNjKtkJO+TG9JFoMcdDtI1tivDTUSj28tdBPVraUMGMR
 WZAgOn9SUcQbzaI248ils+fbIIp1Ubh4lRmzr8fWy9TG5ncON4jehgDSgn5gneKBDllXXxD8wHq
 FJt+K7MoV0MH7AfMHCCnysa+ilFhOyiigkBMoYHLCdf0WZqqPd4e9SNRIVoJoxku9cfGwFa+9zQ
 F98cL3pxHpFGSadhzcf5ylr8NH1vigDu9dNjDS+q+HA0H02+QAlQTYjKNVbY3pCpZ4UTDwbiJpf
 k6rHXajZFlfRj0BESqsdh9bCuyhVUxbG+5psm82T92+pQSQQ6a4dKhZz+SuY0mMiI2M1X894
X-Authority-Analysis: v=2.4 cv=GawXnRXL c=1 sm=1 tr=0 ts=682da4c4 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=P-IC7800AAAA:8
 a=FCd5T-TvBLVYlDZUGUwA:9 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: F2cKs9OAE1xTReTfOzMV6iBsg0rAphRC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_03,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505210098



On 5/19/2025 1:48 PM, Krzysztof Kozlowski wrote:
> On Thu, May 15, 2025 at 12:38:47AM GMT, Jagadeesh Kona wrote:
>> SC8280XP camcc only requires the MMCX power domain, unlike
>> SM8450 camcc which will now support both MMCX and MXC power
> 
> I do not see change to sm8450 here. This makes no sense on its own. You
> do not move compatibles - what is the point of such change?
>

I did the SM8450 changes in next patch (3/18). But I agree with you, this needs to
be more structured. So I am planning to drop this patch and instead take care of
single power domain requirement for SC8280XP within SM8450 camcc bindings using
minItems and maxItems properties based on if check for sc8280xp compatible similar
to below snippet.

   power-domains:
-    maxItems: 1
+    minItems: 1
     description:
-      A phandle and PM domain specifier for the MMCX power domain.
+      Power domains required for the clock controller to operate
+    items:
+      - description: MMCX power domain
+      - description: MXC power domain

......

+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc8280xp-camcc
+    then:
+      properties:
+        power-domains:
+          maxItems: 1
+        required-opps:
+          maxItems: 1
+


>> domains. Hence move SC8280XP camcc bindings from SM8450 to
>> SA8775P camcc.
> 
> Subject: everything could be an update. Be specific.
> 
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> 

Sure, I will take care of above in next series.

Thanks,
Jagadeesh

>>
>> SA8775P camcc doesn't support required-opps property currently
>> but SC8280XP camcc need that property,  so add required-opps
>> based on SC8280XP camcc conditional check in SA8775P camcc
>> bindings.
> 
> Best regards,
> Krzysztof
> 

