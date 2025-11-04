Return-Path: <linux-arm-msm+bounces-80219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8CFC2F616
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 06:35:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A2493B4918
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 05:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00FED2D061A;
	Tue,  4 Nov 2025 05:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hvLCrYAp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IONOni4e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842FF29C327
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 05:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762234511; cv=none; b=HstEozN5gznUmwnBo+m6FZVyDKN/nrFfyuSxC+24+8AM7fYK6JCRGM1WGUXIRgvnue2oNC2rTNd29ijFoNN2yR/PZStGksdRVC8jSgbDyPT5Nal97pjGUteU4lyjIWzdVZzBgya5QDU/IaQnxiJnTPBLlP1ESJYCv+fF/y4a9wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762234511; c=relaxed/simple;
	bh=2P+CxIoELezvA+RCfalPVsUy7iSXyonL+qlhkllQlb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mTcZgFya0v9PXFYvjbzSxekSkDbmtTG55gmBk7kVy1FQfBSZ4CI8bNY7fpKhNtCq11KFYvMuPJftzHUQeW+nqQLVoVTrH1L0BbI+L4frRnLJ91FfCYOVu4fdXEGXQyYB278KFgfYYGw+S/UC8aWD4fvkI/Be+bXnDgRTZRz4/gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hvLCrYAp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IONOni4e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A43BD2p3659507
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 05:35:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1yAZ5BZxanPwdn7pnZ47192vgH1AOWrXwIL2Xsu5H7E=; b=hvLCrYApud9gLrqr
	TU7pmqOKylKn2G0Q1RSCSIlyROfbayjJf3qVTc477fHIn7sC09AJbaGP0xakcr88
	wvvBRx7EQHdgTSu8RyqNpXM2O8epJGKig95b8KoAq+VxAEdSwARciFWaqUtcGZu5
	0P/v+ot2KUNINhmP4dEcuQ0Amj9UahxpeyGet+gk2OqtqTDdO7N3Zpo5ZpSplaXE
	+whntNdmOIkTmMArtrrzaXudzoAgEOjG9lAyudPHgL449xco9O7+bV4JD0qpkCEA
	ngcMDddv5ps+VfxI+gODhbLGnl/go4vxwm/HJrrDPWAb8j/yYNhSmXPMG2gK2D49
	CWCPfA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a70ge9ra6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 05:35:09 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b9ceccbd7e8so1729062a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 21:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762234509; x=1762839309; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1yAZ5BZxanPwdn7pnZ47192vgH1AOWrXwIL2Xsu5H7E=;
        b=IONOni4eGirUbQAhImCQVLOqE4UbtQaCLGjtDnJfhdhlEn70aYlvIK59sWAIAEoi1u
         yzXnTpMe5jjhhQ3XvjRh3e+x7qGd+2c7Wt2ucBAsSkZsxFGHvfz6ai59n25aL6OLlCV5
         XMVNiEK12RGoYFAxlnwVOtMW8RzjcQdpb5GlWCRSuh04o7m/mxWIXGUzWRy9t8HR7nys
         ZW75iTXefdNUEuBB992V4pEOPFWLvaqPCbIg4sQF7dIFUw3ezWgloim8pTDSKrQYx7lp
         axgkBMyL5d5RViV1ThEyzcbGSkksVHSCupwPJTHrECK3XOSDLctlFjMe1WsJA8x/nxp0
         ogNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762234509; x=1762839309;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1yAZ5BZxanPwdn7pnZ47192vgH1AOWrXwIL2Xsu5H7E=;
        b=jxAepDJcXiGTx5/Z7IfPTF1l/XslQXk6b3zGaDCTUNCyNhQsNL/WA5WNpaYRr4V3fR
         JTK1n36WIW/5+5A7ZedQs0p7IKnP7btm9Lfz5WSFTZ04c2h5dotXnD/8bTgv6fQHnlgp
         7sskVvG9HiL3mgVaswVH13eZmm3N5uOiLeoE4X+1E89cazbFGamyPO/GH95xfr54CnWX
         /OzxAGZ9dy3AtY2VynPOL/x9Iyzm2OGZeLqxeOglfEOLXrLyutKzxNOApy73W2Ii1xVz
         w0JTEJduiLHHa0+svfQZ3gfcOvycAsbonKyDrNH9UM8Nwzl+LryhRA713aq3Fsf514Ra
         N1Lg==
X-Forwarded-Encrypted: i=1; AJvYcCWZBPFEhEmx0vm4a5WX1nDd2JCIx/f0yFexYHnYfkM2N84o3eKSfHtnn8EfYEMjuEsrI6XFIIsdasdn/pSx@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4ZAkO3VLGetMPpOZ2+xAs5ajW11d9ad8eVG0BS75N1tAuneiY
	RQHlp0U6rzPvMusA3rE5eYhbdsg6d388nxuKzuUyGTCmxcnDY9XOOTzyhBxyTvjSbGE2jKumsk6
	hNaUTAU/CulRS6xSB9LxHkRZ8VKt9omy7DMmnbNvFtpyppNAiSsHnHV6u8sLbN5jeShyBZ1RmkV
	0R9VA=
X-Gm-Gg: ASbGncuyuJoUgwhd8SHEI5Bc2bZ6qOc17mnBi6UIAEeuHEk4RGqhMqJv4ryk0p7CCg/
	qHbNwXQ6Gpl6LqokEN3x/dwaJmULtEGHaNqWH3AgM3R5L6AN4i8K/ZPDU/Y7yvC4t5MJ5e5qXdf
	M++7du5DbNRafRQs6aFFfY1I7Ut3D/JvfI6OYvQKpfyl2ppU/DJ0XeGE/Dq+CKt9c8gAEp3d3Z4
	zmdUm3Ayb7MdA2moImr/L7O5kmlwvct9dsimyVyInSVy7yAfuhb/TJ4JemZEQ/DmHPABxZ/qtZh
	ymDaF0VcExGC2qF9lqid7W9kXY91lRvMur66iBlS5aShS5u7FkwU5+nKEW4auyAYbzB9iYjUiNL
	yxKT49XHXyP2OeZb+Fgh1A05Wu6QK4AWXQ5JPCq16zwi+NVjd35UH4/xa5abMZZKRzAeZ+A==
X-Received: by 2002:a17:902:f60d:b0:295:28a4:f0be with SMTP id d9443c01a7336-29528a4f6b2mr143160065ad.10.1762234508766;
        Mon, 03 Nov 2025 21:35:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHng7eVS5bLdwxY5O4re3A0l3NZGOVCyRWV9eOTQvzKfq1x2VWpkt7j6UzUVTsx3vqD3p1wzw==
X-Received: by 2002:a17:902:f60d:b0:295:28a4:f0be with SMTP id d9443c01a7336-29528a4f6b2mr143159835ad.10.1762234508290;
        Mon, 03 Nov 2025 21:35:08 -0800 (PST)
Received: from [10.133.33.122] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a609c8sm11237775ad.92.2025.11.03.21.35.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 21:35:07 -0800 (PST)
Message-ID: <ad00835e-bc20-4f97-aba6-e1b4f5e97191@oss.qualcomm.com>
Date: Tue, 4 Nov 2025 13:35:01 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mfd: qcom,tcsr: Add compatible for Kaanapali
To: Bjorn Andersson <andersson@kernel.org>,
        "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
References: <20250924-knp-mfd-v1-1-6c8a98760e95@oss.qualcomm.com>
 <b623c7f6-f28f-49ba-b6f6-25084117a6b3@oss.qualcomm.com>
 <l4mb5pi7kz7uuq6o3eueoxl2ngt2sdd6dv3kyudw6i54co5v5h@w6ya2nuas322>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <l4mb5pi7kz7uuq6o3eueoxl2ngt2sdd6dv3kyudw6i54co5v5h@w6ya2nuas322>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NkeM7NNCD9QhGddWBJl0Rzkg3w1uJ3eU
X-Authority-Analysis: v=2.4 cv=bqBBxUai c=1 sm=1 tr=0 ts=6909908d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=jXqUCmHUJh4Flt8Z5iMA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA0MyBTYWx0ZWRfX2SqjWfC49tD4
 a1RXSfRROJ91Yxo8s70SwHs3XUcOVp2aVOzwbF7QrIRh7RhcxRBgqa6QTiWj9ocJ3f4CUzMVA5H
 CY0bU/br7hgxVsbsgcUSkFuURu2/9Q4DDldkuxGAYqme3CL3+JZPboJZupAto4beOJA1QQVYDfU
 VkEyU6H6Mu/WUXLLUePxdVLHn0ujaoIuo1r6wyIz+xXV7rKe6ZD5unJUjoKmfLKG+DslzFc11mP
 xqJ2er8ppW45pRGSc60K5tXF5HSfHxmkylQ/2EE/pnn2rWSibuPY8YT6xrmKf2ik/tDyaeUQngX
 ba3ekVXsgzthkYJRbw+bTdCmgkLCO0ewT0t7XRYuRzy2kGqCjFTjzNaD0/91Woglf4PGeOO29fu
 5dWWXmBGhWorINBNTgdx0cuSMss8Mg==
X-Proofpoint-GUID: NkeM7NNCD9QhGddWBJl0Rzkg3w1uJ3eU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511040043



On 11/4/2025 12:02 PM, Bjorn Andersson wrote:
> On Tue, Nov 04, 2025 at 11:34:25AM +0800, Aiqun(Maria) Yu wrote:
>> On 9/25/2025 7:23 AM, Jingyi Wang wrote:
>>> Document the qcom,tcsr-kaanapali compatible, tcsr will provide various
>>> control and status functions for their peripherals.
>>>
>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>> ---
>>>  Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
>>> index 14ae3f00ef7e..ae55b0a70766 100644
>>> --- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
>>> +++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
>>> @@ -48,6 +48,7 @@ properties:
>>>            - qcom,tcsr-ipq8064
>>>            - qcom,tcsr-ipq8074
>>>            - qcom,tcsr-ipq9574
>>> +          - qcom,tcsr-kaanapali
>>
>> It looks good to me. Glymur didn't have this functionality verified yet.
> 
> You spelled Reviewed-by: Aiqun Yu <..> wrong.
> 
>> Remind for review.
> 
> No need for that, reviewers will review when they have time.
> 
>>

Hi Bjorn,

> 
> But that said, most modern additions to this binding follow the common
> format of qcom,<soc>-<block>.
> 
> So I would prefer this to be qcom,kaanapali-tcsr.
> 
> Regards,
> Bjorn
> 

qcom,tcsr-kaanapali is used to distinguish with binding for GCC:
https://lore.kernel.org/all/20251030-gcc_kaanapali-v2-v2-2-a774a587af6f@oss.qualcomm.com/

Thanks,
Jingyi

>>>            - qcom,tcsr-mdm9615
>>>            - qcom,tcsr-msm8226
>>>            - qcom,tcsr-msm8660
>>>
>>> ---
>>> base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
>>> change-id: 20250917-knp-mfd-4dd3c81e6b9b
>>>
>>> Best regards,
>>
>>
>> -- 
>> Thx and BRs,
>> Aiqun(Maria) Yu


