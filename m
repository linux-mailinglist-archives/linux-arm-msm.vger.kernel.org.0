Return-Path: <linux-arm-msm+bounces-43967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6374BA01F74
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 07:59:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A9BF97A04C6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 06:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CD561BF58;
	Mon,  6 Jan 2025 06:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eIz16R8C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00C1B676;
	Mon,  6 Jan 2025 06:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736146752; cv=none; b=fGoh9JtZaKMpqDWVundTVDpgUoy5wW2DUil8I2aJLfSD8KG4xUzkVSEMSnt09q77VVHHFc1/2zAvI2wYuMODq/vDY6XAq3g5ZydT8AfQ55VTmafcxTlZrb+Wl5jGI1o3FuvJtrGxAwKXA1mwbH6fX5HNDh4VthiICf/WKdInLKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736146752; c=relaxed/simple;
	bh=6pT7+dXsklLh1NRZnGillSRXOyCQqbrayjVnpgsbliM=;
	h=Message-ID:Date:MIME-Version:To:CC:References:Subject:From:
	 In-Reply-To:Content-Type; b=uvro3oCeOFlw0fK/zgKOh+3UbHeB61AAgqdXMJc5ZXXZ2zBTVFknpKGMiiX8tk3QUkI3VV9s8c6x9xJwoJVWt83y6boOk0ZbB+aqfbnq5g8cyVwfdWMSXXFsy+1pMwHeX9ahhxCoLD+ZgGgj/usA6qxdYRTGtgzr156Ld69C3UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eIz16R8C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5063XaRU032557;
	Mon, 6 Jan 2025 06:59:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yVOD3v3Y0g5LF/Im4pbOfEYj3LcSGcmxUrJET2J/F/4=; b=eIz16R8Ci1sZgnie
	7++jy4oRps4ZltSJBE58EbwWLdo1608+C4urv8useyHqTAjcjLN105gGvmIHzAFj
	L5KXD4dqxqCurX90LpPOLU7jX2WwOE+JUi8f5bWHU6g5u46kbEDe9lkIYVVcXfjG
	s4GsCqHjO4IiE1FvgkGlg7kn0o4GG5vrYB3uCyR3WPjmVczDXQ94iQt3Bp6FhLN7
	86Fqcu0FCIQJObxP/GNBshJfGiIWDZxsgoDMqrFjLfJ246ksjmRAjfv5gbDoaLsb
	0JtBlOrPexo25YOTk2hftFGrpLxa8CIoiw+lzqQ7nBbd1Ix9LogeRFNcRRNpw+Zw
	YAsmkw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4407ck8cgh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 06:59:07 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5066x70L024048
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 6 Jan 2025 06:59:07 GMT
Received: from [10.219.57.57] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 5 Jan 2025
 22:59:04 -0800
Message-ID: <84e7258f-72aa-4afd-961e-7b82091873b5@quicinc.com>
Date: Mon, 6 Jan 2025 12:27:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <quic_pbrahma@quicinc.com>
CC: <andersson@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <konradybcio@kernel.org>,
        <krzk+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <robh@kernel.org>
References: <20241217092636.17482-1-quic_pbrahma@quicinc.com>
Subject: Re: [PATCH] arm64: dts: qcom: qcs8300: Update memory map
Content-Language: en-US
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
In-Reply-To: <20241217092636.17482-1-quic_pbrahma@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BxNPpxG2TVgPAGVpfJLuP5qWnlmIT35e
X-Proofpoint-ORIG-GUID: BxNPpxG2TVgPAGVpfJLuP5qWnlmIT35e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=534 malwarescore=0 phishscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501060060

Hi

Can someone kindly review this patch?

-- 
Thanks and Regards
Pratyush Brahma


