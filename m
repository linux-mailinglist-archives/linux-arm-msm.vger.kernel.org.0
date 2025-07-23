Return-Path: <linux-arm-msm+bounces-66183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70416B0EACE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 08:44:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0BFE1700A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 06:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8EEE26F469;
	Wed, 23 Jul 2025 06:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e6p8O1ca"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B25920C037
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 06:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753253062; cv=none; b=G5ce0eREA06vIT6foN389Q5RMQrtPwaIZyKX46KN9TjgUE81TIV8PfTwOhpFRjS6Hg9QmxtaPXAS2pWY1U8JdfB3jgwMmeDHne2erk8Z5EzpscQLBubS2ofUB7EKsIg3Ne4M0IdFVswyqeUDZ8GgyAgeazNrBHZ32YhlK+001+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753253062; c=relaxed/simple;
	bh=ucEy6fLRjgf0oRmbifVYNVYN0IvdlBC98Fcz1R8viJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SKS8HZvas4qCKffb4D55UR4kw4b1XaZg+jHvhBpZFB+gwxYA84aVgxw4Mfp8XyjlTJObKJtTniUd+XDFu75TBzjVPFTSTVXMQ78a019431UxboFWN0tr5HO7pDFkyslklKdkzh5sR65oQATD2Z+qGHyQR0J6zvoNlhdZMicCLWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e6p8O1ca; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MMPFPI005825
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 06:44:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6JRtXfXWNAwsFUIN8mSiqpepSISde2xx5Vvzm/Pm6/w=; b=e6p8O1ca/CMYTbYb
	8V9N/8eFOrn5IAr/t/LDhmq4XF9NBku76JQYh0D0VzJG1qalhcJh1bi102A9KqIs
	GrxkdIXOxIgun6dnKL87bCKC1xIbr7rep9e+Gz/ZxOwqBOnRe5EElXqtJ099iM+1
	h9Ll0VVuY9c2rAazMjPCY9DI0fmfAm4W9/vXWwSjgjqOzmdPu8OgUG9XfuVFhV8n
	qnjJtihOCUuPW6gKDxPVWvtL9cqK031OHwa6vPXyTja2tAIk4GJlU0W436hBoYFH
	T8O7/oWUXoLbDwJ8a0mZ24nKWbz8V7BAMKFmHhM+NqcDmPovtiBVpNMPskxYZJsT
	2EPD7w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481t6w58t3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 06:44:20 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b31df10dfadso4410321a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 23:44:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753253060; x=1753857860;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6JRtXfXWNAwsFUIN8mSiqpepSISde2xx5Vvzm/Pm6/w=;
        b=DLi/8kTt4fZC4B+sABcclvlNnfiArJVF6R7k3FtdJWBtojF3MOSutePD/HgozueFP0
         vWeCFbtp1vwsR4O9ufdUSplQQAkn89qznywgAw2LJoCZW5C7vZ19zFOZxWDmv9ZfEbAb
         0Ass4XnB1x7aiZQpGjwCB/1enEG0BsGLxusFobRZJUirmIlqzV3quY3XUQbDO5hvRva4
         hLhadhR81NBng0ML6JH1yAjrMJ96UV40amsLU74aJ/BZygw0fGzUlBoMiw0980gHXBj9
         4q1rTqdM4pSR0cnPID/1BHInHKDVbRAMO9+2qNgPQyAL1b+JKmmmG1JogdxjnxSXGLb1
         o6wA==
X-Gm-Message-State: AOJu0YzlP2SncPSxg2fkiPxfqNccRqCU4vVxbcvpNyndHPSItmmoZ+CG
	b0KOt9wxCgExXQx/pXNvnC45kllrOn3pAeMgfSbVG9GSkOB0nDs1tchJugJdMvEM2hk81K8MKsy
	SfWGCk3h6qn/coxRNEwBKXj0oxZX4m5lzaox8lXP65R1De7AdrUByn1TOjizZsjdu3at2
X-Gm-Gg: ASbGncvPoXoiVt1SRO1I4XjiQ4gvBBJFlaG4i333+VpwL/0CazQofY/Fqf36yYJbUNJ
	b22KXaLGOAknvnovwNY1+/aKfBhqwDKKKP/UewbN29CINpSxpZwUhWlwPPNbnUVw+2Q7lDpp9eR
	xuDmtVLkijNztajqFGnTP8Hr8wWVoXLCgx3GJdOgul/edAE8iLzv37a6sVYC/mNvKDItYsY+sMM
	nUY1RlU7Vulz2IyPMDtcrxQQyTVYLOE4ivXYJjuLNlnRG3V/DuQ5mlzX5vkR56kuKof6nHUPodD
	BevNzlvSU3Y61dfBgIakSWKQgU7NGW7mxH8W/m7PyOLLH8/xDpfs3en6xGyNxPIuD+eGTH6Dv8B
	6hb/aCg2Jdt+2hw1f0zY05S81APY=
X-Received: by 2002:a17:903:1a87:b0:234:ef42:5d75 with SMTP id d9443c01a7336-23f98172251mr31235645ad.20.1753253059862;
        Tue, 22 Jul 2025 23:44:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFVH+w80Ld1jep2IXncJykzXgw95JBuzB7zrCNRM6xwTzer0RyGCP4PzDfAs0mSYUYgo7b2A==
X-Received: by 2002:a17:903:1a87:b0:234:ef42:5d75 with SMTP id d9443c01a7336-23f98172251mr31235365ad.20.1753253059416;
        Tue, 22 Jul 2025 23:44:19 -0700 (PDT)
Received: from [10.133.33.46] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3bdfe68csm88659925ad.183.2025.07.22.23.44.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 23:44:19 -0700 (PDT)
Message-ID: <67ca3b6f-3cd3-430e-886a-0443f6d630dc@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 14:44:14 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add HAMOA-IOT-SOM platform
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250716-hamoa_initial-v1-0-f6f5d0f9a163@oss.qualcomm.com>
 <20250716-hamoa_initial-v1-3-f6f5d0f9a163@oss.qualcomm.com>
 <0f9eebfe-21f8-48b8-9b49-a35126aa6dd1@kernel.org>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <0f9eebfe-21f8-48b8-9b49-a35126aa6dd1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SPpCVPvH c=1 sm=1 tr=0 ts=688084c4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=DGOirDVRF9kFrzJQLnUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA1NiBTYWx0ZWRfX5pmht4z+vbdr
 97pwK/8iuP5B83lpVgPPjqiXlqeIhemETZJrfsxOy/VnmMRva/S1kssamBSenCQgTrVnpB34M0j
 4R2ZPGHlZEdeAEFx/cmevXJY231xwnecyVuL78CnELmFvjyepOmy7ktlgjis+MnidrGjfv67XwI
 rmuQHcRPhtNRpX5ao03CR2YmT8s+EE4zIdRB26B513hFGomatyBXofEmDSYwK4PeIulF41xpsW+
 5FaL/46kUxjKf+xPoaABZPcZjDvuJJm10nDXAquqafO3rO2YjDwqHIiWKgrzDGuYCoQkoSJKU7C
 Bi6nhA08QFA4skwqR2m1W5ZCUEqxDxbpAnSPOtVhcX1D/TixQqSDE6SHGwojOKwfBYyYSO1SErs
 /Np9V6Sm162WiU/MlrVBXKnx2XnWopAgPdL9EDxbgAAw8M33F2olnkE7NrDCCfDps60ZK0bC
X-Proofpoint-ORIG-GUID: i2f-Zl3da7UQuyApcz6FhhduDCBMpkF_
X-Proofpoint-GUID: i2f-Zl3da7UQuyApcz6FhhduDCBMpkF_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230056



On 2025-07-23 14:28, Krzysztof Kozlowski wrote:
> On 16/07/2025 11:08, Yijie Yang wrote:
>> The HAMOA-IOT-SOM is a compact computing module that integrates a System
>> on Chip (SoC) — specifically the x1e80100 — along with essential
>> components optimized for IoT applications. It is designed to be mounted on
>> carrier boards, enabling the development of complete embedded systems.
>>
>> This change enables and overlays the following components:
>> - Regulators on the SOM
>> - Reserved memory regions
>> - PCIe6a and its PHY
>> - PCIe4 and its PHY
>> - USB0 through USB6 and their PHYs
>> - ADSP, CDSP
>> - WLAN, Bluetooth (M.2 interface)
>>
>> Written with contributions from Yingying Tang (added PCIe4 and its PHY to
>> enable WLAN).
>>
>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>> ---
> 
> As pointed out by "arm64: dts: qcom: hamoa-iot-evk: Enable display
> support" this is incomplete. Adding new SoM or board is one commit. Not
> two. Don't split board DTS, which is already prepared/ready, into
> multiple fake commits. This is not a release early approach. This is
> opposite!

The inclusion of display support was not intended in the initial patch, 
and it was not ready at the time this series was submitted. Since the 
display patch set was not submitted by me, its timing could not be 
controlled. If preferred, the display-related changes can be merged into 
this patch in the next revision to maintain consistency.

> 
> Best regards,
> Krzysztof

-- 
Best Regards,
Yijie


