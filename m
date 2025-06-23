Return-Path: <linux-arm-msm+bounces-62097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C420AE4772
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 16:53:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EB3D189DD81
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 14:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98C6472624;
	Mon, 23 Jun 2025 14:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TWBxEGXC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA518634F
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 14:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750690384; cv=none; b=U1/kvut4wV1B1bRhLTwSwVfcaeM7d3yXdpnZwHulOFQKsKlL9XiMwmwcJyW/OsObm2LEq6fpGlOMM9m050iYfQtmMlsJnavP1I2jrTreGUtesMLijuTa07Av7tRBaZT506wMWH53IGo8/6YQ+lXh2ZyaGBZ1oBcnJH1BZHZE5Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750690384; c=relaxed/simple;
	bh=R/kxzzgiixlukyr+QqYyh1VnuJlvynBPFO8dfuoRIc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P6j5glFSL96RQL/sjfaJ7+8ahax3jQU00KSYzXLpdef4ONfLBQ0XrXSpPPAvHB6QaYnKJ+u/GOUw7kOsvyi3q4khma0lN3ZufqCyroJv/5t4PVZ6lgqaBL0z8p3RdHy4PCsklVro4xQyhxIE9RXv1q7aRukypDy8YOBOUXaOahU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TWBxEGXC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9adPc030835
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 14:53:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QjulfjMLVMZNGFwlPLa0QQErOrJoenj2k34tfFvIg6M=; b=TWBxEGXCn82XNsbA
	D6IoejiriZNO2nls1EWY5fETvq9SvbRJRXX3+lZNSwy9H8tnG6TXRfYHqRGdTV4x
	3xmNT3FgizwFi2oAHyviw8NiZIxf/B8+JT8Q+q/jYAqiXWEwZWYMSKsaUdxVvuTo
	VBid3U/L8Ee1ceB/VeM3CWBYw/ELEIle2ojnB0a6qVnsEJ6eCMDwPHdQtWepzTHR
	u98z9Q6zb3DxHjAwNAvsSCcs3p7h6NXHJ5lqpZ+NqY/MbVEx4KeOwmzyMCzu8wgU
	qR5rvPZI+3Y8FGZ5DAw5bAear8Bydf0Ad+laOgAgauUtpXTxRQIsOH8Pb+ieHvQA
	Bkse6g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47eah7ua0y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 14:53:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d094e04aa4so149028185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 07:53:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750690381; x=1751295181;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QjulfjMLVMZNGFwlPLa0QQErOrJoenj2k34tfFvIg6M=;
        b=XEK4ynFtVhNZ+/NDFbjSyFc0qB2z2ea+UrPDLBexMzgySClk67ePUW7/2GbiDx/S+l
         QuGp1p3Hslj/MjW9eONIoQTglxP0TdpkgwUgUvSzsrC1JwrjMV0sq4Kp48dsY8FO530a
         +QDyqsyixuziDnHZ5WgeN/nozqzu0OzmaBCf2JTeEl9W7iZUuYFMM1CUDuLYR6D0bmVL
         UzwUgvkyFNfOKWEVOLB4fpRD4UVtZH8y+lidCKJ+YJPLq+dhrq7AlEg0piWKCREtYUQt
         bzE2v6ESauL/hLcGsmwMlUkKglvpttz0kf9pj6lZN3AmFGpVOqgJKPpLXWayJHT27MIc
         jWXA==
X-Forwarded-Encrypted: i=1; AJvYcCXMJ5OjdB+XxQDR/7l+4XC2sTNVRTU4nQ3xeJ8EcAZvoJE6YDATb+NJ35yfrk5vL58r8eZJTnbT6RD/JWEp@vger.kernel.org
X-Gm-Message-State: AOJu0YxFq8gb80WZpc/R/8Gi6OLIwdAACl3BUDVCteU6IO1I3r6+Y5Ge
	Hmgd7B/55uA+gJb8E4XzSvG/T6K4ylNjfSVYfl1wLrBCIFNiLBnklMY7DxZa2Qsf9FXqGNRttWt
	zv89R9YEu4lxxWQ7il+00lIS8fPYVRKxZo6ZqAvnYQujTkvxAxyQQ2E/spj2jHSod7ips
X-Gm-Gg: ASbGncuSz5yJKVSQjeGPmBcbz667dcexHLI4cCTbfz9EzK2qn2etjfw/UU/xq3fl/NL
	p2Sborrcci4jsTARNheqx+19LXQdypxqxH4dnbIoHifhlG9a9NsLBuzeQDRL2F3bTWvu5N9eqn8
	Aem24dT5qI3hCRePB6S4CMPIKTA776+q/fdyLCjy8aDQfAP4uZwlAkBamBxe9fP7kWK/l3JnJts
	bkJg0xhCn9tOarj13RY6lFA+hLbP61QVxQ674SQV8yl/mCnOsxgM5HukIc9BQCo2B5aWF2SK0qZ
	6QxJ+S5iXTmhFhODAutHzlOZHakaIfeM0KidqJHqe8VteZ6MYQx9OjbtML8VNtLfVR2L8fBER5R
	3o6g=
X-Received: by 2002:a05:620a:254e:b0:7cd:14b:554b with SMTP id af79cd13be357-7d3f993a79emr683999285a.10.1750690381266;
        Mon, 23 Jun 2025 07:53:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAVfsfuHGPRp+Rfb6Qn0LbSM6eVDSaSJ4R1Xthk73wPTYr+SBryfjHGfkihaeEDsySZ8l1Xw==
X-Received: by 2002:a05:620a:254e:b0:7cd:14b:554b with SMTP id af79cd13be357-7d3f993a79emr683997085a.10.1750690380752;
        Mon, 23 Jun 2025 07:53:00 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054080a6csm726628366b.93.2025.06.23.07.52.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 07:53:00 -0700 (PDT)
Message-ID: <55624c7d-0192-43ec-b367-f33c96866a2a@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 16:52:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] firmware: qcom: uefisecapp: add support for R/O
 UEFI vars
To: Johan Hovold <johan@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250621-more-qseecom-v2-0-6e8f635640c5@oss.qualcomm.com>
 <20250621-more-qseecom-v2-2-6e8f635640c5@oss.qualcomm.com>
 <aFloifxONXnQbVg6@hovoldconsulting.com>
 <2a37d3f0-a3f4-444d-8166-f85888a27308@oss.qualcomm.com>
 <aFlqGMWwx8ID_SaN@hovoldconsulting.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aFlqGMWwx8ID_SaN@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ggDXuvFCcFsGKkPjqOeSCt-zToy3LLFh
X-Authority-Analysis: v=2.4 cv=PpWTbxM3 c=1 sm=1 tr=0 ts=68596a4e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=L-5_I4KBUgPuGXmJ_zkA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4OSBTYWx0ZWRfX4KJnsFFYlHAU
 leFjEz1jZSMc2ePEJ43jpfOEXu/9aKCfvP0FP8IgdwLjJGS/V78LssS9W+5fayfWiFazgvUT9DN
 /IDMIgix52296xZdQli9H9BrXeB3vB2vcjBJuJhCWXdfMUs7SdY8enz8smE3AB/HZp7oj6c38Yk
 1ARutHqMHxRC3RGA0CQocSx91+5AKjTQDu/Oa+rtiM7CyFcRM6YKKbZgH1WPJwTqSCRPIbzd0MN
 cfynvtp35qTZmy4Dw+nLT/Jitx51w4wlCksV0IoH/Kl18SnvuiQN4T4Fuy29B1cGWhvcmAXDKZc
 mInCY/3M4FyD/L8FxfnRYZPwzsFRs7zJfHQrm1IWsH3RbPvRDhj50djdl8eXn225zFFbYDx1wiB
 NXxEcahO0KnGNhhEKQHyxuUkvIiVtrYLECDl99wNfLaK8jAtzexXxyG1XwMI78d5poKBMzeh
X-Proofpoint-GUID: ggDXuvFCcFsGKkPjqOeSCt-zToy3LLFh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_06,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=856 clxscore=1015 adultscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230089

On 6/23/25 4:52 PM, Johan Hovold wrote:
> On Mon, Jun 23, 2025 at 04:49:22PM +0200, Konrad Dybcio wrote:
>> On 6/23/25 4:45 PM, Johan Hovold wrote:
> 
>>> It looks like the efivars implementation does not support read-only
>>> efivars and this will lead to NULL pointer dereferences whenever you try
>>> to write a variable.
>>
>> There's efivar_supports_writes() that is used to set the EFIVAR_OPS_RDONLY
>> flag which then sets SB_RDONLY on all efivarfs superblocks
> 
> Yep, but it doesn't help when attempting to store the RTC offset from
> the kernel (since that does not use efivarfs).

You're right, that hole needs patching

Konrad

