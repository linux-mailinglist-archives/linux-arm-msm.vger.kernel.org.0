Return-Path: <linux-arm-msm+bounces-85313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0804CC14F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 08:33:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62C793053B24
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 07:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBBF33093AC;
	Tue, 16 Dec 2025 07:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dE436VXL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SY7f4Wge"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14E1258ED7
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 07:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765870277; cv=none; b=bJcyC96kwsf9E5Rkzq13cDaiG3bj5VQgXC3Qx/MsXG33/aeB6CxfJXN1jb1C1xIEkpNftNZRNMMZq/CP/Mlia/Paqkxioty2OePZ+5QFZXwOadLZPooQ4NsASO+gp7h7KXcnIgmWlhLlMJ2FoyAMUHHmy9t9RmE1XeSOL6Us8yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765870277; c=relaxed/simple;
	bh=KqXmHiakfwYzux5eMArMxc1YvDvL+58Ynaluota3mD8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kUhiXr3mRm9Dh08gJNQSAFdVmGM2xuueJhxb+RSX/GOwYVYeccloynzg7G0BhnidMtaeB2gFAurdU2L0aZugQe1bHlplLtn6GzHoY1WzW6FSnu3iBjJstFdSgnwASdsNXqMeQGLfByXU1BqysjBHsYX3R4LIgkRmJBxgE8+6WPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dE436VXL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SY7f4Wge; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG7NVsJ1131493
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 07:31:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xIxBJD1RkXCDnkjEznZGhIWfIGyUcYjFJZa2VKldCQU=; b=dE436VXLRIYyTNba
	+2sTzsq5fXW8fOFruRgP9eKwuU1A5ory1jv+r4useRCf9oM4tN38H98sUtiZipkU
	3p11v7UJqkz+zeiLMOgcMMaIpc9A4QE33De/mgk7GRpFVt26rQ4ZCh0+FbZAmOw1
	AU9Jyv+GdEdjLQU/sPwRWc9Uxbis3pc2u4tz/K0iK0qNZeWiHf0cMEUOq9LOhkPb
	3fHXmX6Yu23kpWFqnyxLo3Zjgp+ucCD2vIy1AECmPbr/JnH0VL09LBMLzDiVGIdz
	+KVek1X/nZCzwkvYKKffx/c7KIVeCeynFyB3qPxvWmY1SF7qEvTJAmTfUU/tGp4M
	TkKPuA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2p3uatbu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 07:31:07 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0c495fc7aso32696295ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 23:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765870267; x=1766475067; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xIxBJD1RkXCDnkjEznZGhIWfIGyUcYjFJZa2VKldCQU=;
        b=SY7f4WgeEZbbpwZTUUGyjzWdpLpb1LodAhzW9Mo41Y7mkrorLFIQP5Q1zHk4nV5vbE
         b3bkIuS3yMN+DKWM2H8JhjgsLoNmp9moRBfcrnDawrAxWrp3aauwh255WCuuCofUSjb0
         fF0MNLjCOeePnWBTnyWSrD2TjI+4a69ljp5OLPdYWt54Zfetm+sC73/EEh8HXNWct6oH
         V1v6OQKumna1WOScspMO9l41j6j2f1tTyNBGZOPlhiTbyEmnNalKqE5xXFJ+Sd2g1MAE
         JBWSQrdT+eRYwjwTjQSWKRZ58QTDsEqGM8gW0MSwxJYuDzLVN2a2O5+L1xh2wPSFaLp6
         B5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765870267; x=1766475067;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xIxBJD1RkXCDnkjEznZGhIWfIGyUcYjFJZa2VKldCQU=;
        b=JsDoSgIjKQkTG0E9f5QDO3HWWoDfCHfjHzJ7FmHvwquZNVImUBU0KRiJPkpK7EPV9t
         fFmgLRSpMI2PA0vHNtu22mTzGgrjDDgkgVDoDt9A2LPrffdXktaqyX0xnB30pOqWhSNg
         EzPRMU+bVZEjE7a13yxDQMhiExLn/d13MJBsNjyw6BSiknuuHs6laP4VVBZRMlT4iszT
         0R9zC2TM638vnJAZBm0opeObwddNj1F5khYvWJYYKcXbOrDXLuVLWvTd74PnclXm/CmS
         seZtJ5bzwtfeJuSogWAu5dECAI4cRTtQizgmlYajSsxFBkFZLo1mEF2FhgsWUeTZj36+
         Pq0g==
X-Forwarded-Encrypted: i=1; AJvYcCXNCoXrrLHIGLyLsq+AStri+Dr7CEVpHpoCpbwtV96M5OGdxoJo8MEiVLj0dUwhe+YdgtRmSGpLNp40wgxZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd9os6iGP2qDQCTc758Bnn/C9YGzfyHTVLnOP21oLwHIaf2S48
	MTf2EexDOGGsV9w6RQzaTRY93lqU9PIFp9vJCNdou9Hvxse/troVWJuF1r0m/Vr5ndIPlSzx20O
	eKRLq+OYMCveGzUrHYs5rY8fgWzYHAFaZFYYK/E2UzmPaR9V0SfSQ6waVJ+zd8H95Lif4
X-Gm-Gg: AY/fxX7qm/acSZTpOne/fkks3XZ5fyofedfaD7yhfJseZg3l71z/VRwGgrqNLqtHBH/
	3KzxUrbrurlV/FpYyLCoTbLyQAH8y92e6rxH7wKR00EmLuNUHsfsoiYLWHKPCoseeCTSQ9zf9Ft
	sNT/xD5jVDPE3QIY0cn2rcBZio2E3hbFGE4g2h4jDtiOeJfVeVYLsF0hqtcMTDtDTaB4jRx1YNp
	3OQe5wJGNBqDQSV7Vokg5wyIu2CF3m4OLBeRThvbw1mGdEblLC9ywjy/3v2lDQqTAG2y38uodVY
	OC/xRkpWwPwRYVbq1J3Rt7NZzoC5QoiziVub8sJ/LJMPGXKb79L6tzuVre40Zrk3CGDD15byU/Y
	R20p+PN2Yvu/U96OhaY5mXOOLk38D/rp90bdu/ixghGHhpg==
X-Received: by 2002:a17:903:249:b0:29f:1d52:1a07 with SMTP id d9443c01a7336-29f23b52fadmr134076545ad.19.1765870267062;
        Mon, 15 Dec 2025 23:31:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGlu3eF+nq1irT8+FRIR/8xTU2Sc+nEboLNIwXG5OzetUX0379flKvZFD4RJPK0VF+9Jqis0w==
X-Received: by 2002:a17:903:249:b0:29f:1d52:1a07 with SMTP id d9443c01a7336-29f23b52fadmr134076215ad.19.1765870266381;
        Mon, 15 Dec 2025 23:31:06 -0800 (PST)
Received: from [10.217.198.130] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a14625add8sm4504985ad.61.2025.12.15.23.31.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 23:31:05 -0800 (PST)
Message-ID: <46cc0587-8eb6-4638-ad04-c05dcd56718c@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 13:01:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Adjust tsens thermal
 zone configuration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251215105934.2428987-1-manaf.pallikunhi@oss.qualcomm.com>
 <zf5ztvnzaf6tplpjpytwbhktrebdnst2doybuubp6rjfj2fjs7@t2ma4ylx67gx>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <zf5ztvnzaf6tplpjpytwbhktrebdnst2doybuubp6rjfj2fjs7@t2ma4ylx67gx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA2MSBTYWx0ZWRfX0mJ/y5xPPjMb
 9WytF0IjQNyx15Hf42pArd7rJRIMZubizrVcO1asOl5cqtegBSk+SUPf7rzhxgZKahByhZ1ga2O
 LigGoUyIvhqS5n2BrGPx99JLf3uo/FY8ulJ/OlXMPg5f2W6GvT7ywbwbnMFtaBH2w9t3duGH/Gh
 2PshgvRFxYqzB7JjwB9Q/U1kk1YvkCWrV6UA/uiR+GDFCu1swwdLTUP60LPF/3PlDnaif7U1b8y
 +NyXz9tPjTBfDOTSuL041PHD9qSRz/b1rlAMTc9PA6i+xy+yrD5CEgUZqeSOr8IxqfA9zgqPpdn
 thrRfHIscQXEnuTqoB1vtfqAkkEzRrwOnV3JGeM7h2CCEJCKayxKseYIFkI2h+BAgiq0ONjcgmS
 21xWU5iFnSZGYunJbVgVsgNJNeH5kw==
X-Authority-Analysis: v=2.4 cv=Q/TfIo2a c=1 sm=1 tr=0 ts=69410abb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=H-adPjGYz1qELiouFCkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: eIn_O3j3y5GmGaMkZasmYBFv1GONfspF
X-Proofpoint-ORIG-GUID: eIn_O3j3y5GmGaMkZasmYBFv1GONfspF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160061

Hi Dmitry,


On 12/16/2025 1:21 AM, Dmitry Baryshkov wrote:
> On Mon, Dec 15, 2025 at 04:29:34PM +0530, Manaf Meethalavalappu Pallikunhi wrote:
>> The QCS6490 rb3gen2 board uses the same Qualcomm QCM6490 platform
> Is there a difference between QCS6490 and QCM6490 or between QC[SM]6490
> and SC7280?
Difference is only for qcs6490-rb3gen2 (IOT ).
>
>> but has a different thermal junction temperature specification
>> due to package-level differences.
>>
>> Update passive/hot trip thresholds to 105°C and critical trip
>> thresholds to 115°C for various subsystem TSENS sensors.
>>
>> Disable CPU cooling maps for CPU TSENS since CPU thermal mitigation
>> is handled automatically in hardware on this board.
> Is it a peculiarity of the RB3 Gen2 or is it that Chrome devices didn't
> do it? What about QCM6490 IDP or FairPhone FP5?

Chrome devices do not perform automatic thermal mitigation, whereas all 
other boards handle it automatically. I will push another patch to 
disable cpu mitigation for all other boards other than chrome.

Thanks,

Manaf

>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 334 +++++++++++++++++++
>>   1 file changed, 334 insertions(+)
>>

