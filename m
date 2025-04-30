Return-Path: <linux-arm-msm+bounces-56245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6372AA49BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 13:22:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 362CA7AA4AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 11:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 647F523A9BF;
	Wed, 30 Apr 2025 11:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dD4KVdU0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B762356D9;
	Wed, 30 Apr 2025 11:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746012133; cv=none; b=Q8PugkhTBSDh8q4c6UspLUWfEZ9lgneulUkUY2bRjQwDEKqkJKYwT1glacyvaaoLGsA9lMJ5eOxdz58LV+pc4ZevQPKBiH/kiFKLXC1F2HKwwBvy/fw25H2IAmgApuCa9nBnFHbH/rvRRCVy81IR1DJqaleXby/RkFJZzhMSGGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746012133; c=relaxed/simple;
	bh=Oo63/rFnpIaGZZjw11XGSVQFCQ5bFAbEgsOmEvGRDyc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JmmvHZG3Ia7gR1fGMPV85Zk+PQ2GbxzSxRDaZfCCd8WazOEQ3qDA4X1KKjaDAEcRF4Nr3/vf9nx897TKyz7qvTNSdnz69kg35vm+QOORbUUYWJNcXz2uxdC+vFXbbS3/cJW004CbrQRfin1OhKQMY8Yuj0+uVFV5sNKpX9JAJUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dD4KVdU0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U9RdGD016768;
	Wed, 30 Apr 2025 11:22:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GR1PjRyWstJRM2/8tvqynbPUA29Z+DfcE0pPkN9E0t8=; b=dD4KVdU0Yg7aYM4o
	A/9n/cmfHcD0EGPRe7Udr/vgRKsG3fAam0QlDQ1bKbS7PZjRj7tfzUySonDUJmHC
	OOFWE+fSVE25u+kBa/0v7mNHF3AJVkeTD1wNen4/AD2zWcPhG2VDI4GiYi9ZdGgP
	9WwYVg7aFShrY4OX7CUQBdJR/Sub/F8FZaVtXnwP0iYq8Baqub5epshu4fORhk5a
	Dbh9aMz99Dtr10LU+LOAjCoVdJkFAJrnTET97kVVzdHNj5bBRQU1HLH8mjDLW9nF
	kLjxEohCL8WX+zjIE0byzxKSkUddV9YQYTRfVKPnHu6rhuG221xnAbf8IVIOZNU7
	kV2U5Q==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ua9wpw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 11:22:09 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53UBM84p030907
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 11:22:08 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 30 Apr
 2025 04:22:05 -0700
Message-ID: <c94c659a-ca16-4f79-8522-62b985b7db9b@quicinc.com>
Date: Wed, 30 Apr 2025 16:52:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: sa8775p: Add default pin
 configurations for QUP SEs
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_anupkulk@quicinc.com>
References: <20250429173334.303003-1-quic_vdadhani@quicinc.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20250429173334.303003-1-quic_vdadhani@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=BNizrEQG c=1 sm=1 tr=0 ts=681207e1 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=g8Sv4xYpla0zDfMUimUA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA4MCBTYWx0ZWRfX7wkUqxggShhd oOkaRXbCdenfCmXPPysojxiwF0CFo8o/86HuKbA0oaXJyhJ/Vwf4rjlC7BG8dk+ZD+jSnLeEWUv jl6CkvfOMh5y9fqOwvldUurMMsBtVQ37zBhbUZ5d029SXL8lWaiU8e3xtxg8zScCaaB2MJOGIqQ
 CHmHQHOzUExEWwPgyyAZ6k+q6pTFiN1GIL8xImxrEXqYSd7seDvv+31kP2i+IEUEf5jVZtdIYuP 8bmGti2kyVL0pkXDj+kVelrjBU8MPL1tNGiJNT+wrBOIYWljlN0pmfNHiLQ4bwR4y1E5Gg9bpO0 fvAWEj6BlqB80JLUPWCCDrp9KV6bHtaT0DhhP6XvM5MUJm53lhUMgLYik6ZOEWk81zxEFt6v/T6
 /tcUlhf5+7pzu4P3B43iBcoujrkVRTTw2RMrSz67RhHR2G9GaxkytA5Qkmnf7+Z1avPssFls
X-Proofpoint-GUID: kshO9_q0g3ppAv0tkbgA8QsZWXefSQxL
X-Proofpoint-ORIG-GUID: kshO9_q0g3ppAv0tkbgA8QsZWXefSQxL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 phishscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=874 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300080

Change looks good to me.

On 4/29/2025 11:03 PM, Viken Dadhaniya wrote:
> Default pinctrl configurations for all QUP (Qualcomm Universal Peripheral)
> Serial Engines (SEs) are missing in the SoC device tree. These
> configurations are required by client teams when enabling any SEs as I2C,
> SPI, or Serial protocols.
> 
> Add default pin configurations for Serial Engines (SEs) for all supported
> protocols, including I2C, SPI, and UART, to the sa8775p device tree.  This
> change facilitates slave device driver clients to enable usecase with
> minimal modifications.
> 
> Remove duplicate pin configurations from target-specific file as same pin
> configuration is included in the SoC device tree.
> 
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Acked-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> ---
> v2 -> v3:
> 
> - Remove duplicate pin configurations from target-specific file.
> 
> v2 Link: https://lore.kernel.org/lkml/20250324151047.842648-1-quic_vdadhani@quicinc.com/
> 
> v1 -> v2:
> 
> - Drop drive-strength and bias property from soc dtsi.
> - Update commit log.
> 
> v1 Link: https://lore.kernel.org/lkml/20250225154136.3052757-1-quic_vdadhani@quicinc.com/
> ---

