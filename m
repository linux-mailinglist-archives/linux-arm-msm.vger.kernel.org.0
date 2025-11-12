Return-Path: <linux-arm-msm+bounces-81363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E144EC5160C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 10:36:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E500B4F8CD4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 09:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C1B42FD66C;
	Wed, 12 Nov 2025 09:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j3xbodKG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BGeXR9b6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8942DF136
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 09:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762939755; cv=none; b=BnzOUAE36wNUUIlX4UkCHDRSPAKNaLKg0ngduSGZC1g5hkM8DIW1mxNRLcgUfbAOoqpmUD4eiNKuSyf9uuaNp5Oad4+RaT9V2A04bytWPHfObni2kal14JuuIb61DIJybh8ZbId6GQac6DFSbbGrPFOTepFP7jDAmdfuGSf3DGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762939755; c=relaxed/simple;
	bh=Pm0KcGLdkUyYMLvnx9ZOl4Og/wEoF0xNClvZWZLEXWA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XWJi+LumV40G6ivWiBNVnRCzoyz6uu6WrhDwv9CAesZ6TbC4eWw00qtj+QkzO5sX3NCpUzwo6/TlhY201eR8Y4Gsm1c6jxHMubgW37mHfszi2f4RXQG6i5+NrsyEd18bMNsFShJKONqKs8Q9pFoa9zFwcO7RyTlSUKsrmxLEbNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j3xbodKG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BGeXR9b6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC9T1EB4076895
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 09:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Th69YKPq2o8N+ogj+emLojAGgDHwBfgYI/xXUfF0z4k=; b=j3xbodKGGdYS/RVC
	JvpIgMvofdY2F5xxtIvNLjjbc2+3PkZ9ZPtun3h3jWl0SGhM8jFfXGNPkltsrZLB
	lp/by6zszbPcDeXGXo9QCIW4e6wVuoUXovJTHTcf4BLY4y97twD3v9EEca71laly
	tIS6rxoBDXzjYjT4F5U4idZ3iNZ79+Q4PiAWDWxAZGAAfcyz/u6OJ8s0DT5p7KXd
	VR30pGRsl2O5rbyOKexAS/XHOSkzKDu23fTXzW65WSZYyXuchFh88C+X74r1imN3
	sk2hG4AE9hrvko6lKb2zXpO7bzEqu0ZRI72A0B4gwPYKwP9hj8nyig+QJee7jQ0V
	lxZqyw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acguah7dt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 09:29:12 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88046bc20faso705206d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 01:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762939752; x=1763544552; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Th69YKPq2o8N+ogj+emLojAGgDHwBfgYI/xXUfF0z4k=;
        b=BGeXR9b64Gez2nQdMZA7mj5cy+bDR4rgjRcVSMmcc9woJ9gzjsFGwc8XbXtWKvWphV
         2VizsfeJby/573uAcF756o616Kd6elwigngP7rKOTBT4kwtZ2Q6lYEoGPhrVZ5xSiGsm
         7NgUxilSdafs1L22WW90BbsY2iK0QjbpZIgqofLtWigTWbYBZjpWdfjv4J0OjGb5Olsi
         IN2XsVDWq22rexxmDyNQoimHDl8c7EtjrYDvzKMc1J0bDMWmpJz3J7TkXvZSyOiDw1aL
         tI8IJdUw0W8cxBPOv6jfsKOwfnqSIS4JeQvwa0eP4sWZ2ddUSgRbXARAaYv6XCpkKfWo
         y+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762939752; x=1763544552;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Th69YKPq2o8N+ogj+emLojAGgDHwBfgYI/xXUfF0z4k=;
        b=FzH/Ke6mGdMVyWeo6q8xIpqIde+Tkxa7tejWgoc85MHawCvDdKgDYaiScixFVYS3fu
         U6F4XxzSabDU8Al7BEKSJc3hkV1INP7cf+N+1GPZDnLoLji/LRXynm9v4RsYs3EKauwR
         APwI+UlBjrrCDS4/xqNOFCkGs1pBIcbKeiQ8gkIk3QTsWz4BsXVwwa9n72Yf7wDtWEA5
         7U8Qi0zpKWTtxx9KmqYLmleI4pC8qK4zBqZTF+YpakkG7lK/imod1H4WLpbXLY/erLYe
         UJJRywz2+D4sro3ePTuQQUWJ31DzrQwMHpIIRKmpp9HwDC96uInAO+WnSvVaxxqgryMT
         ncQw==
X-Gm-Message-State: AOJu0YzN5G3+IzQpLLeA56REy2BEtKuEAjPVn2alUzuWwF33t3iujflm
	SwWKeENKmj1XVua/OY3qFAbJAvrdMgkqJr0VZULri8h1o9qJyMVTbE2VDm+GaNa6GdSGt8arvBE
	5kCtvGgtrsG7hqE3PKuRtyCzXYuZDsNA1ySL4CxsRNKLXRMplgwTc2Qe67tlI55up0mB2
X-Gm-Gg: ASbGncuVrLW2I55JFvLZ53WAXvIS4DjcTDBQZNZ6xtC7zH+DPKuWKp7H3dpgVGidQq5
	8zmE71Rs5CDDjHLI1rpRcxkcWkdD9v0uPnB6Syh8AM1EyYqNAaZMicauXJ9FpC03PBKJQmE6XRG
	do7P4QPte/azaHNqg7PsbQ1s5wvqcWl3n85UjofQwiCFeH5NJpJ+x90HNdtvWob/DHsbkYSBJgS
	4Nzq6RxgzJMmZaRl1s0nEFV1T5i0Q+akJtqn+cTiZVUAcGutRlCTPm+cBIfquBp/unuh0+owp4S
	XpKuWLcGuFs1Rn35rwwaGC+OpfNEOi9GTP2nUdg9kOlWOX4XwhGTCYE4PcRSRM1oggStLnEeyji
	z80V9bSvOossyzYd/xj4dRNC06Go9VDYoufTi3LLluzVaWxsHfiwq8aYh
X-Received: by 2002:a05:622a:1808:b0:4ed:3cfa:638a with SMTP id d75a77b69052e-4eddbd6f1bdmr17958791cf.8.1762939752198;
        Wed, 12 Nov 2025 01:29:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqlHgXC45rT8J+7YIfCSleUn1AIbYKCpDCT55SsVNBiHkKcHouXI74qE3/rDIrYIBNFZHQdQ==
X-Received: by 2002:a05:622a:1808:b0:4ed:3cfa:638a with SMTP id d75a77b69052e-4eddbd6f1bdmr17958671cf.8.1762939751809;
        Wed, 12 Nov 2025 01:29:11 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf7231dcsm1551653366b.31.2025.11.12.01.29.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 01:29:11 -0800 (PST)
Message-ID: <9d959c15-5b19-4173-9a02-4dbeed2609de@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 10:29:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 3/3] arm64: dts: qcom: sm8750-qrd: Add SDC2 node for
 sm8750 qrd board
To: Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com,
        Abel Vesa <abel.vesa@linaro.org>
References: <20251112071234.2570251-1-sarthak.garg@oss.qualcomm.com>
 <20251112071234.2570251-4-sarthak.garg@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251112071234.2570251-4-sarthak.garg@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: avCYMjbugq_dTNIJGUDInuIDSLFRg_h7
X-Authority-Analysis: v=2.4 cv=ao2/yCZV c=1 sm=1 tr=0 ts=69145368 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=UtbPLzXqTwk2hxi6kqQA:9 a=QEXdDO2ut3YA:10 a=l-yEoJkE5-sA:10
 a=zgiPjhLxNE0A:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: avCYMjbugq_dTNIJGUDInuIDSLFRg_h7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA3NSBTYWx0ZWRfX7JkfFnMEioxn
 R8gvElXNUoraOHU4atCFycgrHZG/Tv18v9DG/IREb0eGFoaTcUufhevC/lsSwTWnOMC/wYJAulZ
 euNkee2FhP2dyrWxDgKlz6imqf6QN4V+MOjFr5jWcB8QeMb0M54NbT9y6X95SC35xKetwZSoh/B
 +JupE73rK8Td5vCKE+VuqxqnwwerqW4MwSBIHjQ7SXAcHhzrfXdb+7jZMs720G4DDZ0zMq8AF9B
 /vB+XS2jTdyESjyFnyiMWqBqNYk9k6qobGFz+oWz5tEzFcLtXX0Q7uzhINxdUwQwkpXvIhae6T/
 pN9ia8zPr//NVFcluUe2IFpGFU//Uha0t0PuAF/1j4R6BFhsujGpd67O3JkRdotNjmILWy7NnDz
 ojs+Co7h7rlx/F5rzlAmBJHS+AN/Jw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120075

On 11/12/25 8:12 AM, Sarthak Garg wrote:
> Enable SD Card host controller for sm8750 qrd board.
> 
> Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

