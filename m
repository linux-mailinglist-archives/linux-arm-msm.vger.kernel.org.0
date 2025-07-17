Return-Path: <linux-arm-msm+bounces-65451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FC8B08C53
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 14:00:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E1B6A62A48
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 11:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 933D929ACC6;
	Thu, 17 Jul 2025 11:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jIP3C2QI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7C5292B3D
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 11:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752753571; cv=none; b=aiSjO5MSvG267sP2lYK08mRs5T36ungTGR0BWFTGi5SOEUurdgO607BfumgwSUTM2SmoOFWM+LxIqWa+Ihd0FU8oeRmBLxeNDDmEMguJkWq+IDTa3JPxEP6Gi2uaAAycPYx47q+DKuOxEObBYycirBHYumVTBK+1JxcIONB7+b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752753571; c=relaxed/simple;
	bh=VlfFX7mQA7obeq2af9paLgAuGzTyy1CUXFA7pbF06DQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aLH1z3be9wNQyt1NKDLxqeprYKN/PeiZWNSTlHaJECmzVKqf6y8X8Bgl5JgSDJ43M5Wy7i7c2tecXATvHSHvU1gEm4JUJyrowrLqdeIEweQHwNfzjBryqHxADcxEab3hCctGLGpMc5WU+YF1FzLGCQpbr/2z4ljGMMU8VbwxUlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jIP3C2QI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56H4UeVU015738
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 11:59:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RC8QbYC4Tyk41SorqPKs/ueg5eS7morHmOcMxL4tVz8=; b=jIP3C2QIXyVLjSaR
	yX55JQ1SrF93rBkCLuiB1OXShnGwp91XaeU8spdoPkx7fYmiYJgQ4a86rNngqmM5
	K4gzrdpDW7OrciMD8mbHg3BA9XYChHWJTby97VFNc2w1tI6O93vvoe/Brdi2d62b
	5P3FF9jcPmcWaxkQWLi03mEMIfnEwW35GjaOb+0+B0LBG6yzWGG6YMUuzhV4pH/W
	FmUqx5xTUlHiRsOQka1avg2rXWS3LaQhE5+Jtmb7f9s4yCt4mTyxcwVv4eEH570V
	TghBNl7rLBX06H0OyuPPGtCH+voKX7VHG51w5cpwM3U2b21LDIbJ64a6ntwAINY8
	ooDBbw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dytfnk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 11:59:29 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fb030f541bso3546586d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 04:59:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752753568; x=1753358368;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RC8QbYC4Tyk41SorqPKs/ueg5eS7morHmOcMxL4tVz8=;
        b=m76xh0jJWv9lijgj9cR12fRddZTAh8nyHDTSr87ZZbx3dfrrbgA1IpJtTnProB99K3
         Ldcurt0NZzhrQOYcKP1Z2YmT+Tp4vR7NIte5RhUcEKaGhCyMo/3KGe3qmS9xXztte8xo
         tKnQry7nuB20HzpE0wGHG3TrM/1WTGpgzeKfgrX8O3W44bsGAHIpcdIAVUme71BhXrYF
         XDmiSYM/AEpzkIVCrlv76+3CEBqEwoPQytj+4mH5l62dnQr9xk7InDGaR1jkiwNsskh8
         SrG14AJ1oO/9fqLzMoDiVoW58h6h8/TtVyrzJ3P5rQjUVDfMXm14nMz7Yjw2vrq2JsYR
         i0cw==
X-Gm-Message-State: AOJu0Yz+vKEAych0ZxnMSD3NjjNSUW4OgF5rtetTYpvO5RAovAdJhntb
	WaKhjlb2/Rj5v8ubFvhnReut+dGtugFLwVhE0nJ1h8dAkOWyLdlP1TpnL1y+Vbzpzw/BABV4Hws
	Dgug+v3JUBGZsHPzVK0mAXbu6yLBvevw1KBQNMP9SaJwujkqFMn298XiqAC43stzn8ZW0
X-Gm-Gg: ASbGnct+dWaCzTbtMsxB3Ib7Ui+NOJ453bsl3XT1hKxPjErmwEJWxFd/WlZLERmIltL
	bAEScP5VKTAv8gaR7PgwqEIJvphw8r1Rk0uPq6tb+Ul+TAF+W8aBvV5v7q0++kL7LMNytdCHNWs
	drXxRNNBnc7/Bapjzz0MVyLqkFYCXDlBKcyJ0D12bex1bPnJqt1oA5GfMdaIvrWL1JSpb+WkpGL
	/YQ95fh5TCKGv/CHGT16DI31l2QpjkNjl/BKnEau+SmPagJLdJXy6AFR9bn0FcL9CVO3HYk1EKQ
	5ge2OxPiYXdzbnJImGk31dtb0wu+jwwl50PxuXUzysKXGNz+E8oMyk4OALV0kyGnZTlgvuOLVjZ
	WfaASmBXOZNgri5VYHw4f
X-Received: by 2002:a05:6214:318c:b0:702:d3c5:2bf1 with SMTP id 6a1803df08f44-704f48364afmr47557426d6.3.1752753567881;
        Thu, 17 Jul 2025 04:59:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGx+fJon1hM47o3ro2qoIpBT/ZwbZ2MVf5+gvcrkJWunY7L635zgL0jQnJFiBoidFlr1XdTcQ==
X-Received: by 2002:a05:6214:318c:b0:702:d3c5:2bf1 with SMTP id 6a1803df08f44-704f48364afmr47557166d6.3.1752753567447;
        Thu, 17 Jul 2025 04:59:27 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8265d88sm1362294166b.94.2025.07.17.04.59.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 04:59:26 -0700 (PDT)
Message-ID: <5f382858-1a43-424e-a774-00511f2e1cac@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 13:59:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Add missing clkreq
 pinctrl property
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250717-clkreq-v1-1-5a82c7e8e891@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250717-clkreq-v1-1-5a82c7e8e891@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vR-pioiHo_Alany05ELuEbdICHBLfUy7
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=6878e5a1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=6pHcnep46kEejBPVP2gA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDEwNSBTYWx0ZWRfX0ZXWAGXbxTRD
 teqmuWrfHG+sYV7iNaj7Cx2DDRiC2w5kBp3wW+Q6yx9ieUQij2covQSTzEnYOpR9AUnbLC2vJgQ
 k1nXnoDMoVBstc1aYPJrDuP05WkwS4oox6unhnbeWbqtN6rdYIOjUlAh75AHOvucK0bhzgLhESG
 hb2pRWTkVuPTelmk2HaY/EOqHSXVe0UW+//ET96QKcVgwT82Y78q1caD7zsOnehcKPfWsT72ccY
 tghwPnzZfUCCCyhR9Hu1NR7KscUrbDKDwAE8p/LMz+dEmHccJ/ghakegKT2pyUyciOPJ67BCP6k
 1CcLVvsOVvZK/vz1xdHNQPg65qrTZ2Kv3U9TyYMcI4ck8ku3dpF+y/NFA9f7eC1xUzo+OvAEVPn
 hl8xy11Q4NzYC+c5KGrPvwO5q6CcvblHD5hYH1IFnU+3WbWj37KuIBCaLfqHLRzeeclEFVFM
X-Proofpoint-GUID: vR-pioiHo_Alany05ELuEbdICHBLfUy7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=679
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170105

On 7/17/25 12:40 PM, Krishna Chaitanya Chundru wrote:
> Add the missing clkreq pinctrl entry to the PCIe1 node. This ensures proper
> configuration of the CLKREQ# signal, which is needed for proper functioning
> of PCIe ASPM.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

