Return-Path: <linux-arm-msm+bounces-59379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0020EAC39BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 08:20:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B086B7A40F5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 06:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 763C41D618C;
	Mon, 26 May 2025 06:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KhrzV4+p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A131FEEBA
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 06:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748240398; cv=none; b=FustckG8NBPo8/oqbU2VDp4faKSFG4s2w3+Tz5GXs0OfaRj1PyPdUGsnpzqpLBXlSYkv8shpRffYQoptOPoJkWiARP25L5CsGVHXA4FgnVl2ALANf0sATcoaCtZQWS8WiOcLFstS5pB7KOfV/7kHiyQ3KC5vAJ8tvobgX0BTA+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748240398; c=relaxed/simple;
	bh=kfKqrjxj7SWq9xEU4Nr35KADHrm9QuM4zBWdzxTlRIU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=qoTx3k5Z/ylWcPu+xpqfGiAlk3LG9V/db6cxhkaaZK7pZ9yFeNAVRpiNo3DdFMOKG5oo93hpyGLK2YNrLNDiObfBbkuOSVw5iZK/3eziZpUdql6lLTAPKM5Av/YLSA0aw1L1RxiXfr4d/HrvTY+49EB3AGDXlOB8pn8r2NLHKmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KhrzV4+p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54PMcYxs022296
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 06:19:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jrpH81vVpBiCOEXoQcJthbVv1fuikJmHn767rBuFXaY=; b=KhrzV4+pKtB3HxOM
	uoWDa0wzmqu7cl5SPPw5PVsjzh8XrbdG5x5XTEtVAdlV24GaDnE8ilHcKbmiexEc
	fuL8imxn0TGSlfLn5O7bR/0n0a2AJ0sotBii/PhKG/l/Pq5KykJb2l9shCGzaGSb
	2QP4nPYWeSatrmbDvNOrM482BcTqcVYttDrGkln+NZwMt3F9dYZp1omaAJbZnMor
	27I8g2UC1OQnRS6KBYCFCmF3Uk1IXHnJq+fJAHkimeydKkOjdw1viIyEedrOcooy
	RPtc5bXp/rgH4bY1P8tMMsDOUcnu5BtGu2sCEKlo2Qy5czoR0T4XJwCsHAfezoWL
	rdvuuw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u3fq3b14-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 06:19:55 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b2706b51df9so2470416a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 23:19:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748240394; x=1748845194;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jrpH81vVpBiCOEXoQcJthbVv1fuikJmHn767rBuFXaY=;
        b=kbTcO8f21riAsu5q/wbwzBFa+q0V8DmGIitBudgJpjzSjwqyHgNpajdHDc7hXKj80E
         4Dy9WOph0AEBa7HsTQotoajbZ/XXvzmjlhytbXKGeFrgDBmFiJx5ppT45/XYGm/1Dcz5
         PGiStrNNFryDOIHmlZkXWAh5K/N6Y+tKBYJh8cTVVtZ5l/9ZzD11WfLOX1sJO3/TkfvY
         wJDxbzQl+KcOOr4g46w512qvWVfF2NhE24ThdSZjtiygJ2PO32J/xnApu6yryngzS3Ls
         GpxoMEORTVEmf5a9Khr7Rct/fC5s2A1YGspBPtoLXbR1TyonHCGhIPYVVCuX15NwxIrz
         nt8A==
X-Forwarded-Encrypted: i=1; AJvYcCVmeDc1MuuG7Nrf1+IihOSD+4zmu4Ir+1q/OjgQSOkSQhDZsxB6OBCobYkwCcwWfRPIm1khwhoCL+bD/Vzf@vger.kernel.org
X-Gm-Message-State: AOJu0YzJCH09poKs5VZZ7f5H6o2xEod5OzBFeZNIQFh3eMPODhve79iA
	gsXlFWIuGDt0+7ctyrWLnmhEOlmyTJp7HqGwpqbW6nPfrWiDWbXfK2mwEsfJroPpyz6VbyAae7u
	I+O6/Axsm2xeu+e+7Z+wTOHsRWlcDtoEiij/YNWEZXu+1Tb4z67uDFiWKD3EC/Y17ereZ
X-Gm-Gg: ASbGncuFWfsDcd+pAs1WmzK9vVzQbugEQAED7tEZr6VNQWnkGVtKZ1ILc/pt0euVJIA
	MygDGYZ+gkN2kPqLkKLZpnbckMiRo5bvaG0aKcLqW+ZeLH/p7IcdGLWmRASM+OM51ktJdMq/jjL
	T9ZkW4Q+FeMafVi4oTc+7BE90vWeLmjVDHDW7E+0Anh2WdpzVoR44aLERnukf8vJWZD5o50gOIq
	VS74VQtcr44ueLeqozPNLmCPfuKAjTos1Mo3cLbA0RwWq13qY4/gbIsSTPxDOKw37j0sAl3mV3k
	wi6OhjIrHLAw5VGr2Ra9Nh7cEQjOBTSyoA==
X-Received: by 2002:a05:6a21:9a01:b0:1f3:26ae:7792 with SMTP id adf61e73a8af0-2188b7186c6mr12136497637.18.1748240394037;
        Sun, 25 May 2025 23:19:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLnz0uckNYdWgaRUUv1Iy4mf9s2o5p3ZDDG1bu8ljveYmIuLe+S+fQSQXw8/Y/OCC+jguUEQ==
X-Received: by 2002:a05:6a21:9a01:b0:1f3:26ae:7792 with SMTP id adf61e73a8af0-2188b7186c6mr12136477637.18.1748240393663;
        Sun, 25 May 2025 23:19:53 -0700 (PDT)
Received: from [10.239.154.73] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a97398f8sm16407814b3a.78.2025.05.25.23.19.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 May 2025 23:19:52 -0700 (PDT)
Message-ID: <1b1c4617-0e5b-40c8-9a66-d243b48c0977@oss.qualcomm.com>
Date: Mon, 26 May 2025 14:19:49 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: Re: [PATCH 5/5] power: supply: qcom-battmgr: Add charge control
 support
To: =?UTF-8?Q?Gy=C3=B6rgy_Kurucz?= <me@kuruczgy.com>,
        Sebastian Reichel <sre@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com
References: <20250523-qcom_battmgr_update-v1-0-2bb6d4e0a56e@oss.qualcomm.com>
 <20250523-qcom_battmgr_update-v1-5-2bb6d4e0a56e@oss.qualcomm.com>
 <db0e40b6-22f3-46aa-b35d-7a8729370ddf@kuruczgy.com>
Content-Language: en-US
In-Reply-To: <db0e40b6-22f3-46aa-b35d-7a8729370ddf@kuruczgy.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HyOKjJ_JFKCjQuzNyRUIUFWXKH9gLR74
X-Proofpoint-ORIG-GUID: HyOKjJ_JFKCjQuzNyRUIUFWXKH9gLR74
X-Authority-Analysis: v=2.4 cv=X8FSKHTe c=1 sm=1 tr=0 ts=6834080b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=t2JPyoOaPHs4AGm2U3oA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDA1MSBTYWx0ZWRfXzSzJW0sRXYXh
 0t3WQdoPbS2x2NIoU0NsIya4jd02sT2nHyeKMBdbutYQxSInU8gZOWIgw17Sh/Ty+wIco2/kdx3
 k3tIlukiQxWl+qVzpyixyiBlVc9iVPu60SaFd9COeixi+TNo/TeTokL2xwJaMCS/eS3ABvLyeAG
 q/QLVEfsULQYEShFrJVBCT28aNHtx5+cmTbC7ySttqeBj+pLnMyihIIllLTfs39uUXD2acQQmwB
 CRAuNdlssPoZhY/xbSTozmKByUu487IkzTEK0Yq3dNWDgSgDgGXEmEToopTBfpw9qyXaG8bpgm9
 lSMKZLg3dAKlrX+2fEz9O49ZwcryOMDT+WfxJizmD8P8F/p/lLbu4KqOn6PUNZpGnmI4fZL5uhV
 urSEBkkzeEj2VjUdofrXt5aPlpTAdesZQmL/28eDg6JwCx0i2rhAZR0fG3ogIDYMRQZBIf0d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_03,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1011 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505260051


On 5/24/2025 5:29 AM, György Kurucz wrote:
> Hi!
>
>> +static int qcom_battmgr_set_charge_control(struct qcom_battmgr 
>> *battmgr,
>> +                       u32 target_soc, u32 delta_soc)
>> +{
>> +    struct qcom_battmgr_charge_ctrl_request request = {
>> +        .hdr.owner = cpu_to_le32(PMIC_GLINK_OWNER_BATTMGR),
>> +        .hdr.type = cpu_to_le32(PMIC_GLINK_REQ_RESP),
>> +        .hdr.opcode = cpu_to_le32(BATTMGR_CHG_CTRL_LIMIT_EN),
>> +        .enable = cpu_to_le32(1),
>> +        .target_soc = cpu_to_le32(target_soc),
>> +        .delta_soc = cpu_to_le32(delta_soc),
>> +    };
>> +
>> +    return qcom_battmgr_request(battmgr, &request, sizeof(request));
>> +}
>> +
>> +static int qcom_battmgr_set_charge_start_threshold(struct 
>> qcom_battmgr *battmgr, int soc)
>> +{
>> +    u32 target_soc, delta_soc;
>> +    int ret;
>> +
>> +    if (soc < CHARGE_CTRL_START_THR_MIN ||
>> +            soc > CHARGE_CTRL_START_THR_MAX) {
>> +        dev_err(battmgr->dev, "charge control start threshold exceed 
>> range: [%u - %u]\n",
>> +                CHARGE_CTRL_START_THR_MIN, CHARGE_CTRL_START_THR_MAX);
>> +        return -EINVAL;
>> +    }
>> +
>> +    /*
>> +     * If the new start threshold is larger than the old end threshold,
>> +     * move the end threshold one step (DELTA_SOC) after the new start
>> +     * threshold.
>> +     */
>> +    if (soc > battmgr->info.charge_ctrl_end) {
>> +        target_soc = soc + CHARGE_CTRL_DELTA_SOC;
>> +        target_soc = min_t(u32, target_soc, CHARGE_CTRL_END_THR_MAX);
>> +        delta_soc = target_soc - soc;
>> +        delta_soc = min_t(u32, delta_soc, CHARGE_CTRL_DELTA_SOC);
>> +    } else {
>> +        target_soc =  battmgr->info.charge_ctrl_end;
>> +        delta_soc = battmgr->info.charge_ctrl_end - soc;
>> +    }
>> +
>> +    mutex_lock(&battmgr->lock);
>> +    ret = qcom_battmgr_set_charge_control(battmgr, target_soc, 
>> delta_soc);
>> +    mutex_unlock(&battmgr->lock);
>> +    if (!ret) {
>> +        battmgr->info.charge_ctrl_start = soc;
>> +        battmgr->info.charge_ctrl_end = target_soc;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int qcom_battmgr_set_charge_end_threshold(struct qcom_battmgr 
>> *battmgr, int soc)
>> +{
>> +    u32 delta_soc = CHARGE_CTRL_DELTA_SOC;
>> +    int ret;
>> +
>> +    if (soc < CHARGE_CTRL_END_THR_MIN ||
>> +            soc > CHARGE_CTRL_END_THR_MAX) {
>> +        dev_err(battmgr->dev, "charge control end threshold exceed 
>> range: [%u - %u]\n",
>> +                CHARGE_CTRL_END_THR_MIN, CHARGE_CTRL_END_THR_MAX);
>> +        return -EINVAL;
>> +    }
>> +
>> +    if (battmgr->info.charge_ctrl_start && soc > 
>> battmgr->info.charge_ctrl_start)
>> +        delta_soc = soc - battmgr->info.charge_ctrl_start;
>> +
>> +    mutex_lock(&battmgr->lock);
>> +    ret = qcom_battmgr_set_charge_control(battmgr, soc, delta_soc);
>> +    mutex_unlock(&battmgr->lock);
>> +    if (!ret) {
>> +        battmgr->info.charge_ctrl_start = soc - delta_soc;
>> +        battmgr->info.charge_ctrl_end = soc;
>> +    }
>> +
>> +    return 0;
>> +}
>
> These function names sound quite generic, but AFAIU this patch is only 
> adding charge control support for the SM8550. Is sc8280xp and x1e80100 
> also expected to be supported using the same 
> qcom_battmgr_charge_ctrl_request format?

No, sc8280xp and x1e80100 don't support it. So I didn't add the support 
for them.

These are generic functions are similar to 
"qcom_battmgr_update_charge_time" and "qcom_battmgr_update_info" which 
are only used for sc8280xp platform. Even right now charge control is 
only supported in mobile platforms starting from SM8550, however, it 
could be potentially supported in battery management firmware of any 
future platforms and the same functions could be reused.

> Thanks,
> György

