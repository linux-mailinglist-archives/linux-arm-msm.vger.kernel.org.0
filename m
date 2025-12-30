Return-Path: <linux-arm-msm+bounces-86934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CEBCE9229
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 10:06:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E10C03009F60
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 09:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A09D4EAE7;
	Tue, 30 Dec 2025 09:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U8HrbxgI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NT0q8Ifp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A0823B61B
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 09:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767085558; cv=none; b=mvQ0aIQf+BOIvIw+NFg7ngdHK4gJPCWneqC3hDIkxjekeTisapiU9DIOzj5Tk+hgzQayvkAHTYMZi/pTdLlxyknob9ghoLjMR5/tnf8Ns/uj5lOEf1GcTTfBTXREUTyvKmBS9QUbBn1cMSnmprhbVhTFaWuBrTI5rifYbTvqt6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767085558; c=relaxed/simple;
	bh=viRDd6TSB2NyW57t9e0rKnq8mtr7/AeCGI2eS97q3FQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MlvFgjVDMitDOrVC9Cs66iT15MmGGTv29mLp/lnuu8Od9Gc6mdGLIT6krBJTawBrSpFQeFQ2M8Vdwrgf/m8IrqH8K4js/BIYGv22d3CB6EpA6mU3Oxap5HyihGZd7wiTT9skYYysO8JfLToc6/h+JpRoXDqERwGLquix4kcSqkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U8HrbxgI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NT0q8Ifp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU1UUuc3815374
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 09:05:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	viRDd6TSB2NyW57t9e0rKnq8mtr7/AeCGI2eS97q3FQ=; b=U8HrbxgIcSBfMdjB
	3PD8GkH+mb3HT/R3hY4JMxjXYXVykwAv+3Ju6VbXp7wlMMBUt9ZSgGWo3l45RPEV
	rJOZ9WJVAnEqcP0H+T63svUzcXMoyTkIIUUj6+U6UDT/tH6seBse34NWtI9sCOxK
	CEmAwfjqyAIqtP0kaf4dlQHBIuFv33KxgC+hwCt+wMwMTgfJSEQjDZdCPXzG8tnG
	KEgIF31sYpq2m+L3WcihYshLcpXE79XhlvkWXMy8U3qkn729rEFbXdz0SiCJnBv+
	ZC4KvDs0IrPmDl80W21ML5lMYLjQtvu+zkuMAlgaM57IVFRhVZSFi8uecajs2/oW
	LQmfkg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bbc8yv0kt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 09:05:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29f177f4d02so223248405ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 01:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767085556; x=1767690356; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=viRDd6TSB2NyW57t9e0rKnq8mtr7/AeCGI2eS97q3FQ=;
        b=NT0q8IfpSftRP78gRkbDOttReRj6D50OK1dSZ9gHpWCCWiyzqErNj8QX7yEz0W66Cx
         zK+tt9h/m71Iq1BQN7v9PaUKxYNllDjamWY/iwsakkZ81CGPqYCj+JYfkdQBBamBn/2J
         JmQCy2SGWfGv1PYFh7WcwtFBn5wupgpO/S4xSUJCew8u0QdTlI4/zY+FDKLYpIoiTRl+
         kkN5W3uEJO6YK0PpsCFfWC6En1+1NlAvNsJHCRAVLLqjw9GM/qk5LwlueRVqqcaBN51U
         s/w0D5pg+c2rffXSTVnMaF6Xy1jLRTe7WD1BlZR2bXAh1GZewkDTbbseYEJXwGkl09Jr
         9wLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767085556; x=1767690356;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=viRDd6TSB2NyW57t9e0rKnq8mtr7/AeCGI2eS97q3FQ=;
        b=gAULgFMom5z4JioPz3B9N0DlHL4AV0vSBY6y/5dKDQHuQ609Ybe9GzOWLqaMO9Aq5+
         +9M/+wVcbsD7JNGWNcAe+WlUoC8NO8fKxMcldHCz2UzeoO8o2G5BsZY/kEA1XyELEnK/
         BUUMgRVRhRKL0sRRNjhveH7I7ltbsMJlYOaOOsmpL+UgKkQ2TnlOUTw/r+/GoDt7uMa3
         +UsuxBdjFfFLg9GfZM+ZR1yRE0mkUcNmjJf20xqEPe3SZ7duuQkBUKZt9RYlklS7UYEZ
         ZZ5v8V+VmzbingsMKHsF8nzYGGfOCq9AvybKBSvJR6L69Nrn952RsjFlSLvWPHOC6sO7
         +IJw==
X-Gm-Message-State: AOJu0Yyl+u7LorMZdoYj7d8qwHQoPic5LRMMwF+tkv6aANYOL0GX+ghZ
	agfmAZnAMqoRaFhWsmYDhi85dHtbVntEj/c9H7D7nZG4dClPNEp9T2KV8neN5cixzHAm+ZyyNyM
	t8uUNYu8RVGMJZ5qgXP0TUfg4mnELfwjEmtNVT0pxlYwbeRoUET79QtpPchOoEpGlBjLJ
X-Gm-Gg: AY/fxX6kg93yWaXtJfRGpe7rltIWciOsb1tN29S0at7e5S/uqo6iR5QkZ/mH/iNIrD7
	wOuqbplDa4J/1rwFN29vyg5VCh3zcsejnEKvG8pDf9FvUM9AjY9xh2xyhk5o6GgP6Ug6pYZlTr2
	5nimQ/Q3abZZ6wSoskB9DURfvd1rD98/Hn9GHleJkpSMZvN1WRxLLmqUKZDHXVDtWt2B2wEdykh
	xX1epnTTqPWbZgXbcpTFVNxp0E+Nt+aOI7bEvuDc7NGPCfCXlKvivTMh1RikZMMErhj/vwR2zs5
	oJSgUgtggpqkDjvBv4QIzaJFJEmYbHfixkmrd/yDdBRK4x+MSpmU1DvDQWhrizZTIy/iEvApyjb
	aFOzhuN0EV+IUWCXgeMDh5YgbXm/ITJnxIdX80BC2T/bDIEzisjU=
X-Received: by 2002:a17:902:c403:b0:2a0:ccdb:218d with SMTP id d9443c01a7336-2a2f2214ee0mr292308825ad.17.1767085555645;
        Tue, 30 Dec 2025 01:05:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFlbJO0Yg7sa0nVvN5mfG82L6hyMbf7a1UIusHtFGqjnnAgGqR5DWD6lTmqGSeTvwTy1nKmw==
X-Received: by 2002:a17:902:c403:b0:2a0:ccdb:218d with SMTP id d9443c01a7336-2a2f2214ee0mr292308515ad.17.1767085555123;
        Tue, 30 Dec 2025 01:05:55 -0800 (PST)
Received: from [10.217.216.105] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c65d66sm290751605ad.20.2025.12.30.01.05.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 01:05:54 -0800 (PST)
Message-ID: <86c649c8-7529-45c0-be13-93ff8f05aa44@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 14:35:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 1/4] scsi: ufs: phy: dt-bindings: Add QMP UFS PHY
 compatible for Hamoa
To: Krzysztof Kozlowski <krzk@kernel.org>, vkoul@kernel.org,
        neil.armstrong@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, martin.petersen@oracle.com, andersson@kernel.org,
        konradybcio@kernel.org, taniya.das@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com
References: <20251229060642.2807165-1-pradeep.pragallapati@oss.qualcomm.com>
 <20251229060642.2807165-2-pradeep.pragallapati@oss.qualcomm.com>
 <f87a8caf-6c65-48b8-a372-1ebff95cb6f8@kernel.org>
Content-Language: en-US
From: Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>
In-Reply-To: <f87a8caf-6c65-48b8-a372-1ebff95cb6f8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA4MSBTYWx0ZWRfX3aWyCGQgvDqi
 KAMKWzATgcGAXxV/jqpCW52tybSVDNU59+kELcP/Jd4rbQO/07Oy/yIXVVshwe3QQtCG1Vu8j8N
 RGgWopU4rzIS4Yjumbx95xsMu4rZbT4VwXYmR7Y48P9dFSFFAaY2S1Yx5reWAhTaZA2KSPSfk/I
 Dypglqgf4nWwIePq4nAwaUf+cI6EPu6l43jaqzWscLwMthnA8OtHZc1OXxDzPFb9q86VKhPSlqv
 Aq+7m3rb9MS00dTyMtur2HO87qv05cgl7teSXJaAiv3MgCkrS6fHa67DQy8i5SzDgwusMxtRE+L
 10fYVX1vhQDakz+7ov4xkSPXPXPpPPkg3UG+r5gEAKD5SpfBzjFRfd1b10oCtLg3Rk4xr08/xqr
 a7PUwTPw4GY4mNbU6vJiHUCLQPUm7Kokcze+ZGKrx7upv/yQa0oFl1cNCYamak28aVpOlBixfHo
 +/pvkOnAe2PnrhWRJZA==
X-Authority-Analysis: v=2.4 cv=cP7tc1eN c=1 sm=1 tr=0 ts=695395f4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=YiUacr96smqfDrfpFg8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: Evw1cHWhMMznnHGg8m5DMCx1FvOs-6Ya
X-Proofpoint-GUID: Evw1cHWhMMznnHGg8m5DMCx1FvOs-6Ya
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512300081


On 12/29/2025 12:41 PM, Krzysztof Kozlowski wrote:
> On 29/12/2025 07:06, Pradeep P V K wrote:
>> Document the QMP UFS PHY compatible for Qualcomm Hamoa to support
>> physical layer functionality for UFS found on the SoC. Use fallback to
>> indicate the compatibility of the QMP UFS PHY on the Hamoa with that
>> on the SM8550.
> Last sentence is pointless. You keep explaining what you did, but you
> did not say why. Why Hamoa is compatible with SM8550, but not with SM8650?
i will update in my next patchset.
>
>
> Best regards,
> Krzysztof

