Return-Path: <linux-arm-msm+bounces-80112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 45928C2BFB3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 14:10:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0063A189A3F3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 13:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D7183101C9;
	Mon,  3 Nov 2025 13:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I5oH72qr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GrqJj451"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0D730FF08
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 13:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762175211; cv=none; b=oPN6tWjMviXeCmbTt07s4ZVoTh+l/1tbWCStQGUFK+Y9OwtnieesDE1DFVo+BJTJXlPaNOI1g4FM8yCndd/dstlUCZ9ltlU63kaXQdwb+JiRSqQxo3919O/oCWiEl3YTRDH2x6h7n7fjZqePulUZ0TZ8MBt98DsIqY2t323SFDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762175211; c=relaxed/simple;
	bh=FYiwxvyL3zVaY/1QX0QkLlPmbUiAY7sdzTU30Lh8ax0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gOuRpxAooKEHlam5D9wwGK/VMs+pbATX1jLb8nML0dhIsZkB2A9Eh0eCEovom8HDZ/no2xRSyxyghBNCugv2NURDNIgAEKb/vskUHKs9yTa4F4kpJ1ePanfEXIA60hj5O5xz1l6HPzI45TcNXpem/tL1xa7/AhaEj6GR/lMePNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I5oH72qr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GrqJj451; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A3B6CCq2909016
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Nov 2025 13:06:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0gQtupiQh7xm0fUtdhHWILT97Aw/Ir/GtOFHBMes/lk=; b=I5oH72qrzlazKvy9
	7vSITRnkb+IvYVfTFanhWTi3mGmmn67gQwqIyuUKBlkiTNvBs4lByoIbG5+achDu
	RM5kfu00589K9GCK9Ag6JwSe5CgRTfp4Y4uqCpLgobboZk75itUEDtbP/04dVMXP
	8NRLFqculFcNDwguXZ1x/fAuyGgIuamax5GbqX5lAcWlRz5BBrK3StmGLFerJ0NQ
	dlrqxqpIWRifoGkZGU745a1AZBjRqPWr6ivFBKWA2b+KDL0hIMVP8m5D76UCIB+Z
	zluy/iBd+22IHCTb+O/fpfMdqMQd1b7xosYP39QplmGTxdA9ZEHixQhnpXTqnMqK
	35JvFw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6u7kr9bw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 13:06:47 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5db22173f9fso439225137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 05:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762175206; x=1762780006; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0gQtupiQh7xm0fUtdhHWILT97Aw/Ir/GtOFHBMes/lk=;
        b=GrqJj451fKx4k+GyF85E3a3zWUYdUnfl66WjivqGIy1mBKSJMxSdUeuTMNmq3L1XMz
         ARgIu4Z9v1KcsL6frPySzhwDiI5cM45yw4TwM9DP2QfZPGd5BL20OYfcoFM0YAilb4nl
         G+3NlQiINuo9QFFyR8pHCbV6ClVj+l2VCGwhD8QuSNEZD6cwlLnV1iCzEjUT3SNWbIDJ
         ARPiEwWPSAS/k6gJei7ZhKJoAJwC23yDdNFN6yvvrVCF9iPkUbCRtP0D1pOBTlqONnyK
         zUd+oxN/cYicjioWQsKbdDYpGcqBb1O100Xs4u9oICgYpSttMf2ABBjo9xZWYmmwp1PN
         GtIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762175206; x=1762780006;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0gQtupiQh7xm0fUtdhHWILT97Aw/Ir/GtOFHBMes/lk=;
        b=V13gsGvsuW6+PaYP6oLE6KBbsrDvNyOFtFh4Ip5H5Sh4eeWuaw5hJPWwBFyVtmTdnt
         /gcwrQeEnxd806K2JCIeAISLc3i+5ikzh9aAD380CeWIq4QmFALrdgvQcGpD8t0Ui5md
         gcacpfD8mKaERyd/FOZI5owCC5fwDo/0WQuTetWfWIvWeDb0/U2NHLj/+Xd9CglxZ2Bn
         G+AE/TvLaX2HR1Aj9vQd5F8L5kOs9cwWQhSLHFKP/RCDL07FpAM2umlmC8z9U1nssFQX
         UnT4lbvBbfA7QV5LefH58XP5XrwJSNL1/3Hq0OD+hhbKuiaFCFR3f1kHHtWQr1tmi3rR
         Zaew==
X-Gm-Message-State: AOJu0Yw2oxyiadIdkVofPsUxJSsFoWT3bqCYwZIVYphvX0LsN/J5BNMl
	L/x8Rz5HTA1zJ8gohgaiQRo+ICc5LdGkNnty+PJAI7RAciqbtbfmBzq+/LB+mMro/lL9XJCtgrj
	+FtP6DGY82Aj96FDVr7mkyxuLb+T4unfGfJVsawpCr18tF1UmTnAk2PWlBxsR3YLXCoawDdN0fi
	fs
X-Gm-Gg: ASbGncsNTxl+ihzvb/C3/Ef7J02IMUkrR0+6+fcN6lVoJTHwWtlQauzfb/BMrc2Psc3
	hekhumQ62TGuSMZnEki224AA4aEWU7y7FX/GtvWAKMqD0cRiMz5tVKIVqLGsu/Xc+IBMKg8atNF
	j/BMWXTlA9AAXtv0VKtFu+WJjBgU7I0DzTy63RbVZbXoU16ISWh18FTqQ3wyeJBdJdb8NJomwfD
	6lGMlBxB0e0VvSFWMl/S+jScQ2SmG4pCET1l8SX72IBw/nPy0HSDeBDmg6KGIKST1/hMfEhjQbR
	LQfZa0vtqZ+QHreGBKMXQHTDWvu0zL3RutgA7Dzih+OI1cAhHGeqCdrddlR/GEvRQFsjz1Zu9kq
	NFOEIVn+dO4KlXDzRyTzL+Vl6x1w3VWt88Yc8VVzvn1vpvYl5twIYHcW3
X-Received: by 2002:a05:6102:c92:b0:5db:36c1:17bd with SMTP id ada2fe7eead31-5dbb1384cd8mr1552725137.7.1762175206269;
        Mon, 03 Nov 2025 05:06:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZQfYGFiNLW1rcYHKPA9Aj4aba2BmPzD97bB586pREaBpqcLuVtZl8564mZTLw+J0EloBKoQ==
X-Received: by 2002:a05:6102:c92:b0:5db:36c1:17bd with SMTP id ada2fe7eead31-5dbb1384cd8mr1552698137.7.1762175204392;
        Mon, 03 Nov 2025 05:06:44 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64095f9ee0csm7261405a12.16.2025.11.03.05.06.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 05:06:42 -0800 (PST)
Message-ID: <c0780268-74da-42d8-892c-b0cf2b86ffcf@oss.qualcomm.com>
Date: Mon, 3 Nov 2025 14:06:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH DNM v2 3/5] arm64: dts: qcom: qcs6490-radxa-dragon-q6a:
 Enable all available QUP SEs
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
References: <20250914-radxa-dragon-q6a-v2-0-045f7e92b3bb@radxa.com>
 <20250914-radxa-dragon-q6a-v2-3-045f7e92b3bb@radxa.com>
 <1d4ac08e-ccfe-4b6a-8f77-e97836171310@oss.qualcomm.com>
 <C33391CA9466C163+e15aef57-454f-4c83-abed-542e62890087@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <C33391CA9466C163+e15aef57-454f-4c83-abed-542e62890087@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDExOCBTYWx0ZWRfX1GOJWxlKc6vA
 XCSqQ41/JrzLkPq9mI2c1mifuVl6J8tJ9xmbQzk7XoLiKuCuQm5AMtQR/Xjb2DhS/B+6Zvpu0RW
 Sc4KRGCuRg4SBYEuHU+EjaHIhNGK3FqRUa6PflkJPLCkHlzjeusgtQjPEDeCGmwyVVVAejftAFn
 Q5V9LRBll3pRa/qrIscG1S8SfdLsuyS9S/0mAEImUgWXmpbS21W/ZlhfOZ+O7F/WIhCtvR+UaE/
 lDB1rO/YMIQfwrNpUvhWR6+lZpeZGhiovZ5N70zKzg3zzPlS1heP2GGKHwZSpYtiHugcpEsAN6i
 9ksYwXiI1TkJU0n2TBKKjgmO6UqFK2E+ZCIYRtUmyoskdNQCMxdqR2NL1JSejdSg1eeYSoSvtEY
 TOjELcs+yk5bTXFGHUbZpx5q3bzCAA==
X-Proofpoint-ORIG-GUID: cua_3M6wOrWx24Nz8ylKzEXtsZhkQp1e
X-Proofpoint-GUID: cua_3M6wOrWx24Nz8ylKzEXtsZhkQp1e
X-Authority-Analysis: v=2.4 cv=Q9HfIo2a c=1 sm=1 tr=0 ts=6908a8e7 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ksxQWNrZAAAA:8
 a=99GkO54zK2vxxsZGscUA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_02,2025-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511030118

On 11/3/25 2:04 PM, Xilin Wu wrote:
> On 11/3/2025 8:57 PM, Konrad Dybcio wrote:
>> On 9/14/25 5:57 PM, Xilin Wu wrote:
>>> Add and enable all available QUP SEs on this board, allowing I2C, SPI and
>>> UART functions from the 40-Pin GPIO header to work.
>>>
>>> Signed-off-by: Xilin Wu <sophon@radxa.com>
>>>
>>> ---
>>>
>>> This change depends on the following patch series:
>>> https://lore.kernel.org/all/20250911043256.3523057-1-viken.dadhaniya@oss.qualcomm.com/
>>
>> You should be good to go resending this change now
> 
> Thanks for the reminder. I added the QUP parts in v4 of my patch series, and it's already merged :)
> 
> https://lore.kernel.org/all/20250929-radxa-dragon-q6a-v5-2-aa96ffc352f8@radxa.com/

I had this patch marked as stale in my inbox, it's good to see
it was delivered after all :)

Konrad> 
> 

