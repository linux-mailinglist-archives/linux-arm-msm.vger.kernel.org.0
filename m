Return-Path: <linux-arm-msm+bounces-86986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CED3CE9E99
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 15:19:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3E6163003075
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 14:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 194171A9F91;
	Tue, 30 Dec 2025 14:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a6dhvq4v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ea+HOBKz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C1E1A2545
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 14:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767104368; cv=none; b=eAOfJ7SlgGy2gCyFBDmRfQqHvtZM3SyqRxA1VS0CHQx9JnVBctxfj4l83iRw6tAUNCrVIDkLD1xq6qq8fOBvOWN/gDmMe51qhscPKRJHnir1nBh+R9BtWQedML2+ZKT0UfO1TAOQl8BcANQ1x2GyiB0JIXXzn03ri5ZM4DLvgIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767104368; c=relaxed/simple;
	bh=yNMRIHd/BkXo9jGKw4+k5G582exuDUZsMYg5DIWEM9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uhFG3aSWFxVR4mQpopNVzQECXZx6tp6B9bB7ZQmqvwbzOSe5QfHaY7cysSGH3UX5n1HYZQmu5TzHBpjyy+mysGk0JCM5s4q8BDCWXNmORt3kQjA6YJzYYAUdoDAMjEibPTOM9bcS0vcqXQDWyfuwE5daZj/FOwFi08buO1jLrwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a6dhvq4v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ea+HOBKz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUAWsE72596423
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 14:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cPTeHY6D2tDelgP3xM1Pc/OjznKFogeL4V4q417yWBA=; b=a6dhvq4vwoL71RvO
	Xx16r31SQZltWRCLbLmFzf4JTNXca1MrLSxtJs9GMkwJ+CWc3kFIJoGSW4C9qrbo
	ED+bQo5ADE2GNta1CzaeO4E5D4sCcSlFi4sAg741QeUNXx6bNKteEPWCU7ESb6cx
	q3Dt3gVaFSiELxhw0xg0ZPN4ed+r8jIvqNWjL2Gc/MWiSmjOuQXnrS5jNjn6hyWG
	oSb3dGLWPDtaptw/TYaY6vVaEgobjh1c4zI/5z5uY0Ww/C0aJS4xY6REvJ56MnXd
	9DKB4WMsLaEu5QwxOOVsKNl5n4OjLSEatnL4kctfVtXYLH+qfbtp9xNpuRa0LD3R
	AueHrw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bbqk1bcsn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 14:19:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed83a05863so33151411cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 06:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767104365; x=1767709165; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cPTeHY6D2tDelgP3xM1Pc/OjznKFogeL4V4q417yWBA=;
        b=ea+HOBKzPuhQxNM2Vl7LR5LfqEkwydEASjUxbCcgMeMBmWx5ytqLAdrA8rbY41Nmgv
         QgqJsMzQdM9XpaZ1P/reKvfW8ZmPB8NsShr/+wxIvq59roEdm8tk0FnF2vuicPwBvYhE
         j6S3uzTl2E1oIUGYwf+TCpNDmhFO3SSa8X54UaeRA+xd/5Cfw0MHwGl0H8Wfwks18qRK
         eaKLpyOXV7Vl1M1iREs57UYlslhzASmpaKEUipTifowdGxd2YleoXKHeSym+eJ9wOLZ6
         Aljfw3KGts8quFZF7C+7R8Sopcmo8tJtb2Q9UpssmiGbpVyulkt2XbAwELDrH7PBM1Cu
         UIzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767104365; x=1767709165;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cPTeHY6D2tDelgP3xM1Pc/OjznKFogeL4V4q417yWBA=;
        b=C2JZvtloOtxwPAvGinq0jRGMTxASrp4bYwscFZiHO0ChE4U3vTclY9OS53dxhAjSzH
         j6nsReJfEjhu3Sh+TPYFjKswTT2aZB7xRHTvdfdXpmVqOnkDW9CW6iLWdTM/QxtspZj4
         9nTcY1jj2tSxYCJmVwHcoucYhZFxDsbby66qZhF31gH7W+3nXx7VQmK8xBrV6EotY7CX
         lemHZAOoWWJgB+DVvBb38CYC/Qmp62SBTZonaK07xnA5wiKTlBLYDO1Fj/5gewM6beM8
         TEPTELUi0VD/9nxSMWXPP8wi6q1xYQ4IvcFFkeKYGiHPnkbu7B20l+RtGGH9bKhmMeRS
         dbNA==
X-Gm-Message-State: AOJu0YyemdEsoEntGUXFvunvCyZ0lWcehhd3CNDXOQQWIFmNYPS7Euh8
	mE0G4dzBvwN6zgorbYujpJcIUC8NElxxwESMK8Tie4XPP5MpYwZxiz0Gg+wX3tSNSKANGhnq2Qz
	KV4ss8Lz+z+KFjoMNPM5GketHikwBFXF6HCCO1ztXVBr8GAR/gjOTFDMg55VNe3W34cTm
X-Gm-Gg: AY/fxX6C3eeQSeaGqV6kJohPPUr4lnKDdBISPdTihjQXEeI0x5GMvwCGHC0Ayr1CuOm
	YvVsFRipawF+hvOzUl4WUNrGtHXb6Tv1cJQvHR1gHUDQE2VLjaJ5JiWqA8UqDHvUdnWuG9U3yeA
	OmfanC7DvVSU0+1ubhkoZ9zVoN/2Av9UX/vbNrTzGWwpO/6FUlHCy+nlP1VzBDF4Ib7pKpiqDKH
	g64TEpfschI3vX9TSsbFRI8+a+DwUgacFYN3/rrKPqzblx+ZtX3OIi5egYOv5P4Wp2MrqjvUlaZ
	18OLIr7dnxeDOHQlYD2wIzZ3YE2xaTKHgc4X26GtwvKQeRcFL2PU8SILdLwVCIk6xZQTYI1yniC
	DI9zaZas2eBYMD48R0uy8FA2liEN0mglHTgNJdTJnwVrtBOg0kLfb9fdt1kpHOV11+A==
X-Received: by 2002:a05:622a:6bc6:b0:4f4:b376:a689 with SMTP id d75a77b69052e-4f4b376a711mr273913501cf.4.1767104364781;
        Tue, 30 Dec 2025 06:19:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFx1y/8qUtGq6b+IQHmetUs2ly14xFse16BwCUC69fhJTx4dG27HSEMauwqQQpQxq7cqAa46Q==
X-Received: by 2002:a05:622a:6bc6:b0:4f4:b376:a689 with SMTP id d75a77b69052e-4f4b376a711mr273912991cf.4.1767104364135;
        Tue, 30 Dec 2025 06:19:24 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ddffd2sm3481865366b.33.2025.12.30.06.19.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 06:19:23 -0800 (PST)
Message-ID: <80529f8d-8db0-4b3c-b79e-8d5a3004241e@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 15:19:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 4/4] arm64: dts: qcom: hamoa-iot-evk: Enable UFS
To: Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, martin.petersen@oracle.com,
        andersson@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com
References: <20251229060642.2807165-1-pradeep.pragallapati@oss.qualcomm.com>
 <20251229060642.2807165-5-pradeep.pragallapati@oss.qualcomm.com>
 <a33f5b15-d574-47c7-985d-f181c4784b98@oss.qualcomm.com>
 <a64f088b-8509-40cc-9f01-23c8b87a8f3c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a64f088b-8509-40cc-9f01-23c8b87a8f3c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: KGQZbzDbqYLaOOQdwqzgKBFdt16mYlFx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDEyOCBTYWx0ZWRfX9xp4f2WazDrk
 oiO2xDe3ZBuq+o4E0sP435lYLJ1Nek3fuXKOKZHrTU1WpiOGQ26kttyh7pSp+HEo+6SCJ/1QX4C
 FyNugAqKy1ENRf/Jp416EPfxZVTpwVzyXN6Ymnmn5tydNZr9owacty8ZwDlgd72Y/MS46fNEu+r
 QKcbE+kbnOOLOdY8M7JMkwHPuV9n9RxgAR7naOBux2569WpBbTooKaZzDDyHyGrsp2KMloHrwEV
 BLQC/f8r0wagUpDOQ0bnnua3vH94ET99cTZYFGwrizPfA2KMf8zCeP6A133tjmduDG71CHD6giK
 CT1qaCaWfTcAfpN5njLSswS4HzGfX1C6v4JbefBUBmlws34fX9DtUuJjVKErRRCICGUAAD2X5CD
 +FHLBBuHhBuir1bsVlLN6Gjll+uo0PAHBWortUW2zcj4ImLRnVBT+vEaX4HcvLRaqWK+udGPvnl
 E6XvC7gqjdqLlqfZo7A==
X-Authority-Analysis: v=2.4 cv=Tf6bdBQh c=1 sm=1 tr=0 ts=6953df6e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QZSmA9GrXdfeW22t9VgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: KGQZbzDbqYLaOOQdwqzgKBFdt16mYlFx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300128

On 12/30/25 9:58 AM, Pradeep Pragallapati wrote:
> 
> On 12/29/2025 5:47 PM, Konrad Dybcio wrote:
>> On 12/29/25 7:06 AM, Pradeep P V K wrote:
>>> Enable UFS for HAMOA-IOT-EVK board.
>>>
>>> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
>>> ---
>> [...]
>>
>>> +&ufs_mem_hc {
>>> +    reset-gpios = <&tlmm 238 GPIO_ACTIVE_LOW>;
>>> +
>>> +    vcc-supply = <&vreg_l17b_2p5>;
>>> +    vcc-max-microamp = <1300000>;
>> I think they should both be 1.2 A peak
>>
>> Konrad
> This (1.3 A) is as per Hamoa power grid, which is same as SM8550.

Please check again, I opened the power grid tab in the internal
documentation source that shall remain nameless and it said 1200 mA
for both regulators

Konrad

