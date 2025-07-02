Return-Path: <linux-arm-msm+bounces-63410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE6FAF166C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 15:03:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ADD137B1893
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 13:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED421267387;
	Wed,  2 Jul 2025 13:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fmnZwApL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811DC27380F
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jul 2025 13:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751461251; cv=none; b=pvaf+nMVwEBTMjs8MpBOGiCa9EgfKY4XJJpAUbLl+7IV1BzwKOJ4DuwA6/6nz2c9VcpoPpr1eHeoMSG204uwzd/cNCv7e/zirXIBQIA9QzgNPQL076iPOrKCADa/XUPkruwHcCjueontqmPQDRjRwXy4CgBih0Gr4qpS3kQZP8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751461251; c=relaxed/simple;
	bh=lV32kChCuVqH8yCvDu+qF7ZrBKPBDV6XI5jEvKcTek8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=chsL/74w9MGSs3gnDPH3T9m9aA6u3VR4xDeTiFUxHVA7uY5Sf2RNBK1f7MTD/EK9glRbadcFYWlZMkzeZ6+SjUzkDW1cVavLefYMb8yTD4BRba0ZNqVUD08xhx4/O4ZZccPMLNvktWFFcMb258Vg5zZfMH71PjSQ1TZspjIDrDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fmnZwApL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5626B1DC028627
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Jul 2025 13:00:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T3NQ7HW39R+Gt0CitY5eJYcMoF47O8lIW9qMV+Vh880=; b=fmnZwApLB40IE3D/
	m+ovqXGXHqi0C0RIEETMaMMGq6Ehu0skXl6t3s5SqxkyuDnCa1VAotZDdbzhZouT
	0TvVcTJmmnz4gP4gRh9K8kSvaqfKpwA8C+qnPNf8PGjgrSrLkJdo8KMNtdMJFGm7
	GzOF24ZKBOd/jrbuazz/xbgal8ae2/zajSeod3v+yd1vFDDxNovhMFnHnQo0JJPK
	8k5GmK+F5hZLKeonIzqBql56BE/FzHkwJUovrqHRvX8+wJ0AEz11o3IJ0TdU/8uF
	R/XavCrjLShOHvx6f4fA8R1jaGYB0J+jG8mMfx3rfg1iSGFR5qftO0uUGRRnr2JA
	YtHOOQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvvp9a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 13:00:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7cfb7ee97c5so33227985a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 06:00:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751461247; x=1752066047;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T3NQ7HW39R+Gt0CitY5eJYcMoF47O8lIW9qMV+Vh880=;
        b=IXa3nvuvaADcqEnsWL7sv6jCxceV2ByWuzGNPtkLn+imWGuXXgsO3gzHew8zp85Jg9
         PMOPjGKy4iJ2MA0vmoMh0v9BIVntUYckEu6bHQ5giQC9a6BwSqdgfrwFTX/1E4pziFuH
         7VkDEOyuLiqUfA6HVBOk/npvXylnVvIxf1UN1hUe8P1X+yTju68SEenc7D/jDkrDsKdl
         ozM1+XN4y/5ylCBO4h5fCKu8n/OU/wiak9GYSvnFNV55RBko9gD/9Fsx/4cXF9eo2ru/
         CBlcBFjJ4+cZIMUygv4oMtdyyJDESJ89ty+dbh3DDsOzrtmdpCBOBQjF/gIKzII2sEtc
         FVlw==
X-Gm-Message-State: AOJu0Yx977V3iIW2xmDhUfVZUF0f2YfFBhioD6zy5bGDkUH3uNr26R2s
	gXhBcp/NFYQ14X2oBqWSFODAusdGIVk85aHyhgTKhQFSafdOauktANRnjCvH6g3JSWFekND+aYh
	b76cpVsLUboiWU193Z7Sqw7u7ftppBp2yagENjfI/s6ZjyU+YZOHEvRnfxhxqwBAcSPho
X-Gm-Gg: ASbGncv3E9/HCQ3Gy8g2C7LbtfcaNcGsW0gGRqJntsksmgEMr30BM6G5BKMLP5Gi+Gu
	uA4EmbHJ/Tjj+mebtLDsnS9TuZcjZWS9wxud8Q4eefflg8Wg6ldrtRKUoC0KFSVZNazcLmiKNTh
	Q4W7URrvTmPv4HSY2+6KtcnFOs92ECMgPG5S6TYK+Z0ilJTFc0aRDS4TPklVcw4aUrJK2wQMcyu
	SDBLv0iXcgG7SUVHAJd4FiUTbuM47OJpHFLHsY3IZCc7HjrpAyEhesht8AN7GG8CmnAzppARHEu
	qBqX0tlHQll8sNyyQse2r0lB1Vb8X7rqDpSKlRVWrXyNJMwkWkOCnlYWwxKtgvpuxpRTYMGai1h
	7ORc=
X-Received: by 2002:a05:620a:2552:b0:7d3:f0a1:2f3e with SMTP id af79cd13be357-7d5c464cfeamr150088585a.2.1751461247145;
        Wed, 02 Jul 2025 06:00:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3/BXMk7FAeZKeLVzLwjtOhnzyC65WEm5pD1H2XXARo1S5Jr0K/z7PoCIEXLabu0cpABZM9w==
X-Received: by 2002:a05:620a:2552:b0:7d3:f0a1:2f3e with SMTP id af79cd13be357-7d5c464cfeamr150084285a.2.1751461246447;
        Wed, 02 Jul 2025 06:00:46 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c01636sm1079292166b.105.2025.07.02.06.00.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 06:00:45 -0700 (PDT)
Message-ID: <0a646e08-8007-4bc0-9324-fa1d40b90d20@oss.qualcomm.com>
Date: Wed, 2 Jul 2025 15:00:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] arm64: dts: qcom: ipq6018: Add the IMEM node
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250702-imem-v1-0-12d49b1ceff0@oss.qualcomm.com>
 <20250702-imem-v1-3-12d49b1ceff0@oss.qualcomm.com>
 <f66611e3-2961-4435-b276-7f13041518cf@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f66611e3-2961-4435-b276-7f13041518cf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ED7P7v8muesemBCXnx8uyib4Ok_drdq9
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=68652d80 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=jZhe5MNW9S75RuEgyRIA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: ED7P7v8muesemBCXnx8uyib4Ok_drdq9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDEwNiBTYWx0ZWRfX3gKWMmKTdTSj
 Kjxk4SsnTxqimI7WR6wkzNG+ZB1Ihy6zXnpuytHj2Ekaq4i36xMlZ9pVCZ3jfgHfaSTvfCQjBot
 ezDrTTVMlXoVMHQ/+1MJzNN6cMdFJTIOsC8BRPqG6YolwQFKBOSIsWsrEXS+2l1FeuT4WWFE0BD
 aMZv8izOqCvEqQkAwtT3Fd+G+mavo8qx9AOPdLRWsmuKx5xfB80MY3WQ0ZeuvVCQt9cMC+6L8Lu
 2KBukFR+kmCh6sJxDsZA/JsgsWQOCduWYB5BT6vtfKgpV0ZzBbaEvmLThcDjY9+l/KPbeycR9pq
 ZkIoWMGOz94nH9IX/tNHgb09SPB3rGkUbYmoJorWHq0bsfvwipWjmNfwIjh9NRkqOmEcFH96JuX
 JTLPmRH2fU/FjSrrpAFG9HgSiAhiAioOJYrIWBxpKyW2ofpHXkucolNxc2WoY1Po2h6302JY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-07-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=981 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020106

On 7/2/25 12:50 PM, Krzysztof Kozlowski wrote:
> On 02/07/2025 12:17, Kathiravan Thirumoorthy wrote:
>> Add the IMEM node to the device tree to extract debugging information
>> like system restart reason, which is populated via IMEM. Define the
>> IMEM region to enable this functionality.
>>
>> As described, overall IMEM region is approximately 32KB but only initial
>> 4KB is accessible by all masters in the SoC.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/ipq6018.dtsi | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>> index bfe59b0208415902c69fd0c0c7565d97997d4207..7eca5ba416c2ef5ef1c4e0eb4f58f1ca94fc92f0 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>> @@ -659,6 +659,15 @@ qpic_nand: nand-controller@79b0000 {
>>  			status = "disabled";
>>  		};
>>  
>> +		sram@8600000 {
>> +			compatible = "qcom,ipq6018-imem", "syscon", "simple-mfd";
> 
> No, this is not a simple MFD. Where are any children if this is a MFD?

IMEM is just a block of SRAM shared across cores on the platform.
It's present on all Qualcomm platforms and usually stores cookies
such as reboot reason.

A user would be welcome, but I'm not opposed to a lone description
either, at it still shrinks the undescribed-reg-space-hole

Konrad

