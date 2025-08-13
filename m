Return-Path: <linux-arm-msm+bounces-68874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D064B23F07
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 05:32:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2790D16B5E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 03:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A90602AE6A;
	Wed, 13 Aug 2025 03:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ksGs1bHh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8B81A275;
	Wed, 13 Aug 2025 03:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755055924; cv=none; b=Ujh7Fu+3q2TWUuYcTzABBaX/A1SLypTT1YX9y0uvObaBMUxV6HKmhgpvRbgZ9aUa/cbvZYF3P2Z98M8vPky/30L6dMbPKC9+L8Y1uhH2eNiDOMpR6LSzTlrSsa5qxELuruOLyqRb9Z4fvHuyNaXW5f/yiiJQAIfT7lHwpO4uVvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755055924; c=relaxed/simple;
	bh=1q8TVMTxm2hDL3PQEZyIt6gSyS09g0Dq8EeGoQivsmI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rnY/IwB76S7Gp6sMyr/UdT3Gig6V/1F8poDz5G+GraWNMpCe2IaXwf0EPow9GTcQpI0YaBR+H/8vNGNBYBoAVfKgBfHhwQx07ND6G1REnQHRhirdvQOqmEr/JNbsd+ONPOU1cn8IyqLhtF+39OePcRUseWLeJS2J1/vi3RLAvp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ksGs1bHh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CK3jcY025463;
	Wed, 13 Aug 2025 03:32:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J/6FpbvDPYPzG8EhlvANCYWGU65cg/Pc1BWVdmJqyWA=; b=ksGs1bHhOaKxWJbR
	/DhKoxCzCuZWAuwPfOIuJbhYNULcKZraKtRflvMg0XTFp4MA8Cx93Sth0jHsNeRJ
	rCCD+MrfF869ZdHWPLJzOI2VKeJKnRyQJmC1RjC/HJZqc+X/0la3Wae+llr4S0bw
	2U+WZ+lAf4lfdV9OrIspuMZgNqg+PLKAfpz4ftQtYa/gtGj5xSn5O5O5mGoDRqi4
	H/Y1uTK9arM2iNrubVQM7KLRD9DE/cMFe5EZYXGziZ21LXh/O4GnElTQak3hvHii
	l/UiDwF+/eJUmBRmvPgodS1MxP9JYo7cbzvOWsiLt7j2OdRDSHeiFrGy1yWPeTYH
	g4d34g==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9stgq4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 03:32:02 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57D3W1RT001208
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 03:32:01 GMT
Received: from [10.239.96.215] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 12 Aug
 2025 20:32:00 -0700
Message-ID: <38c6baab-f9fd-468f-ba20-3e2a24de8e9d@quicinc.com>
Date: Wed, 13 Aug 2025 11:31:57 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] driver: bluetooth: hci_qca: fix ssr fail when BT_EN
 is pulled up by hw
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        <linux-bluetooth@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
CC: <quic_bt@quicinc.com>
References: <20250812113620.3135226-1-quic_shuaz@quicinc.com>
 <20250812113620.3135226-2-quic_shuaz@quicinc.com>
 <4ac0db96-8107-4809-8b13-580d75948ef9@oss.qualcomm.com>
Content-Language: en-US
From: Shuai Zhang <quic_shuaz@quicinc.com>
In-Reply-To: <4ac0db96-8107-4809-8b13-580d75948ef9@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689c0732 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=s1kbfEM2HHd9KEI90ywA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: k2BglOsaFvjqTzifxBCLAZ4G_Yd8zs6_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfXyUMFPD5EzhCR
 J1fiM+H6gwRn9c0Nehn7uduY7WVo3iWefJgy5B1Ad1AM/O41LJSPzknxtwY9N//C6DsaTqQ1isf
 dIs4SeqwcuKHj9y4jREj79UjNn1sfZQOkXr/1i0oE80eqHYUnm1N5r2pYmv8f+fbyca/aDqJByx
 /ollT/zFX55b7CBjd680mMuaLRvtnhD0vsbCz8YXeRxbP7L94JFwY4bVTnVrG+Qeb/pCiROvlBB
 BHTsx5Vak6tiu6NVl0LbcLGIG7gCRLIyuy5JNWMo1IamerwMx03wbGQXR6UspVuDKK5qUoNX2h8
 5QeUe+BmxVzsFGHL2ZYciDW19iHDUAaq77nBv0T5MJ9C9AgfO2Y1zlxyndtuZBMtzlabgvOzzIa
 whOv57Nv
X-Proofpoint-GUID: k2BglOsaFvjqTzifxBCLAZ4G_Yd8zs6_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015

Dear,Konrad

On 8/12/2025 8:36 PM, Konrad Dybcio wrote:
> On 8/12/25 1:36 PM, Shuai Zhang wrote:
>> When the host actively triggers SSR and collects coredump data,
>> the Bluetooth stack sends a reset command to the controller. However,due
>> to the inability to clear the QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits,
>> the reset command times out.
>>
>> For the purpose of HCI_QUIRK_NON_PERSISTENT_SETUP, please refer to
>> commit: 740011cfe94859df8d05f5400d589a8693b095e7.
>>
>> The change is placed under if (!HCI_QUIRK_NON_PERSISTENT_SETUP)
>> because this quirk is associated with BT_EN, and can be used to
>> determine whether BT_EN is present in the device tree (DTS).
>>
>> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
>> ---
> 
> I have received this series two times, you didn't add a version
> prefix (make the next one v3 so as not to confuse the tooling), there
> is no changelog and you still haven't added the relevant people to CC.
> 
> Please read the internal guidelines at go/upstream and switch to using
> the b4 tool.
> 
> Konrad
I apologize for not including the version number due to my oversight.
I will update it to v3 accordingly. Since the patch has already been 
generated, I won’t use b4 this time. Going forward, 
I will use b4 for all future submissions. Thank you

BR,
Shuai


