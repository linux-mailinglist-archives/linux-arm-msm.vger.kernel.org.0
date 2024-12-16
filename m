Return-Path: <linux-arm-msm+bounces-42296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CCE9F2A7E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 07:54:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 255BE188A4E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 06:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 541611D416A;
	Mon, 16 Dec 2024 06:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Zh022Krx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51C91CDA19;
	Mon, 16 Dec 2024 06:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734331923; cv=none; b=qlimVSftg+1iOuU4AQVJHReROtkYqhmpwjB0n/Ed1w49Y4gNQNGqwo1OPc1lOr/TZBOy590MHlF26tQlb6DP+1yCWPwdi1odBhcP+ArI2Vt1HXPVmpS66nSHEMH1h4TTY1kSyrxCL3MNDbrbBH+S1lTRVXLGipwFkw9hGi4MYeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734331923; c=relaxed/simple;
	bh=WMrEz+LMhGjGjcGy2RvNwSXp26knQ5HaO7GsCo1wpug=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Q7EfR2eQT3Iq0f6FuDliJpr25tz1DNak/EHnCcqGQu5bToy3LIbkQa+QrjvOfeAsRiyLbFERRhf9iTBfd6I0m0VSgy2akkkHg/1xtmquWhIUx0Ev2zTOVWCaypRJ+9MYAzv7/rJZ0lL+cb+v5GfPI4k9J1Y9V7kncASDHvXany0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Zh022Krx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BG6XUMM022881;
	Mon, 16 Dec 2024 06:51:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W5DE1K6aJ4x+TQ/APFlbqgz5GJVAuTMDhtcN8go7qyU=; b=Zh022Krx94TmLyvC
	MRSrq+ENJehlp6spgxyttsl+mrlTTZwyw/XdSADzepqQ1CWX21OWgH89aMvYvdSF
	1hDPQddur9HBCVfG41e0LNngFXjLkuz6qJ0TcC3eYjeEFi/i/WtDgbqNmHYHisQE
	oAkKNoVEB+TciQVCI+BZJNVjVHjtOrGgZCa344Hl4wjQB8WG15lwwUc7NEv1QPtv
	v04cw2dFjGXZQPuldxlCNnklzlPbSATsOEt6ChMiMCEZT7Ac4tXflvrlLJWqwDGK
	EZro2XaKeOjp83njBcJXHZkBEyvoiHe49G8doPk+Rn3TM6968VAH71ZRSC1dHc8t
	L5EIiQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jf1w8429-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 06:51:54 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BG6psPs016371
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 06:51:54 GMT
Received: from [10.231.216.175] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 15 Dec
 2024 22:51:50 -0800
Message-ID: <86c148b7-3f5c-468d-a935-72dd5e4660d0@quicinc.com>
Date: Mon, 16 Dec 2024 14:51:47 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: sa8775p-ride: Add firmware-name
 in BT node
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz
	<luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Balakrishna
 Godavarthi" <quic_bgodavar@quicinc.com>,
        Rocky Liao
	<quic_rjliao@quicinc.com>,
        <linux-bluetooth@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_jiaymao@quicinc.com>, <quic_shuaz@quicinc.com>,
        <quic_zijuhu@quicinc.com>, <quic_mohamull@quicinc.com>
References: <20241212150232.3823088-1-quic_chejiang@quicinc.com>
 <20241212150232.3823088-5-quic_chejiang@quicinc.com>
 <qjfytsieecdiavyosc6u2t2t5uhmkzrhw4ad7oykd7x23o5yp2@5bteod5q7yud>
Content-Language: en-US
From: "Cheng Jiang (IOE)" <quic_chejiang@quicinc.com>
In-Reply-To: <qjfytsieecdiavyosc6u2t2t5uhmkzrhw4ad7oykd7x23o5yp2@5bteod5q7yud>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IdnB2OcfefonCRdWd8BheKOh4UDbCRyG
X-Proofpoint-ORIG-GUID: IdnB2OcfefonCRdWd8BheKOh4UDbCRyG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412160055

Hi Krzysztof,

On 12/13/2024 4:51 PM, Krzysztof Kozlowski wrote:
> On Thu, Dec 12, 2024 at 11:02:32PM +0800, Cheng Jiang wrote:
>> The sa8775p-ride platform uses the QCA6698 Bluetooth chip. While the
>> QCA6698 shares the same IP core as the WCN6855, it has different RF
>> components and RAM sizes, requiring new firmware files. Use the
>> firmware-name property to specify the NVM and rampatch firmware to load.
>>
>> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 1 +
>>  1 file changed, 1 insertion(+)
> 
> Just to recap: this patch must not be applied to Bluetooth tree, but it
> should go via Qualcomm soc.
> 
Thanks, I will submit a separated patch of this changes. 

> Best regards,
> Krzysztof
> 


