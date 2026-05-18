Return-Path: <linux-arm-msm+bounces-108152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLPDI5DpCmpt9QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 12:27:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B4756AADC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 12:27:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E32C5302F9A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 10:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 739B93E16A9;
	Mon, 18 May 2026 10:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dv1s9rIX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H/AaEFTP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0F03B7B79
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 10:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779099844; cv=none; b=S2epgxHIo378jCtDKvKepZmjh22aG+lmFns91yqoQq25pXOoWTVNedsubWE1Gzr9kVxLhhSvfLJhnFdtf+7agPtjQ7Gz2+nXzNLWZDK9Kf1LFVIUvdDo6ND+qhto82Y+av04VwLwzt3lIcIPx2jXSeMR1fUQvBRl9O5UAD0Vkwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779099844; c=relaxed/simple;
	bh=zej2Cpyl6kSQWSK0UynwC/MbemQJBK/YK0lG75EKZwU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O5A78wxgBD6+GSJsIjNs/L9fuwRNkNCnCYd3x5wLosexRHM+RhdZv7iPVhDOk/DLmfhGIP68xh1TLy0qzo8YKOPP2HQSfJbv5WrxL5KJec2cwPlRpygDlHBuSf4IopNldH+BzMYpUDq/JGSAkQKuYEHXq5hIIhs6xbpRiSdCkzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dv1s9rIX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H/AaEFTP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IA8SDX2090993
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 10:24:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SA8886K6poJcpjofD22W11q9F+U2c/JpSKSwDMQIEm0=; b=Dv1s9rIX3+Tjr+2S
	TGEZDsVk9nR/3/xNb833XAcEk9IOGs84YjruEuDA8P1QN7uaV4WlzuPmH0kcuD+e
	2a9qOu8nAN1PhMLaHKT+4iDIMfuVh6qXa7y90Ukn0kuEEVnpMBs7xnNAan2gjkJQ
	/3eruFmAFjfdJoNOB2VlmPFmareCwU8+FnC5g/unGsXY+f3eyzx0gu5Hh3uMt+K2
	4kb6E4lPMqkiWEt14/OaaKJHYj3HJa77zy6HePr6kk5lvIlRyl3iBHCDVXx01LKl
	58BOzRM9DC/bW/dn/iEFiIotOiV56Awg18WDPUPtygNUsUS4+/ZbtqDs4TQUOJNC
	P8AZcg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e80rpg23y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 10:24:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2baf7748d0aso20827675ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 03:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779099841; x=1779704641; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SA8886K6poJcpjofD22W11q9F+U2c/JpSKSwDMQIEm0=;
        b=H/AaEFTPmtKqCYxPBwQu1EHCC4Z5VB7qXr1lTkXEoHQNXS6Qo3HknFPwV7EwpBayHx
         rg4YYxduxI+2J1JSJTP5v8xwpvj97RHsQNOQgeaO4g88uwAODrjypnsBuSXXIq+gx1Ds
         6lJ/eeoRvHkDhHwxP7XhLGLgWzxfJkzC2GXrEWy74g6rDbZ0ONvogtlQX3aU0To8gT/Y
         kmEy6tllNH5fvvJT8VqXpHggkvOSyYr/MZYBucuNWBLmqRYlWr2y6uB7B1FUzdFIc/xL
         tcBR7jrrCci6SLK9y48SZvlLuTaLAAU/ybUCuzvgUKwSOzfvwjrgbTx02npLfsjgVDh5
         O9lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779099841; x=1779704641;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SA8886K6poJcpjofD22W11q9F+U2c/JpSKSwDMQIEm0=;
        b=tYCGyGNgSRn5D9M4kzhf+7ZMDEkuJvg92wnLjr7RMMjgT9SrIAcu8eCoOvoRYgfQAI
         rYbLpQbSvnZX+LOReGeK52MCLmnrWI1Q5/Tkae/nlUWhngAwu20JF7P3dSdhJjmndnZn
         2jmuGkvz2XR5UanVl/tNopOlRPLxV+Qkoe4TBhlOiOtgvTEFZS6iuOelp+9HVE0OQeeL
         JKzfKZ1H6I0sf0d/HzjdD7VO3c2VZ83U3a3FnBdJR7bx05l3IM5pBSHZFVsMCyUQWhPA
         y7FGlHTNqpy7zlC801C/xluBv8YHCw+9agPGfh3aMdafCF2Rv9RKA8pDe3ug//czDy+4
         WDIw==
X-Gm-Message-State: AOJu0YwXvD0dH01cwuOfjjQ0INYUIfoRLq08P/7C34INIEe35WDCZ+4H
	OJT6Kp9/S+A6OQk06NDlYcdLB7o6wAcXQtrdZCejxqfS9Xvqo2TuoMgRbrSeuWWbziZXWvhxm0p
	sdWa5WDZ92czt7Ks+eS+2QUir3MoLTVrlHOO7LadZ5G19GTCxCoTfXY4kS69cIc6UMDNg
X-Gm-Gg: Acq92OF6f510QwENVXHL3qGfG0SRHfVbEcs3pB79cEOvLw6fqWEYeXZgmd5sKahRRLn
	Xk/G+CmyrOp+dssEpUwsMw8cJXem33I0FxEXmjs5flp9RNEdJ9521wxoBVC8IIZLk84Py2mpGWq
	nzSzyN8RXj5nx7qZ3Ydtvh5dkFFVR0Hplc9ReXabxAKMxVduBObRUHIrfGNuHgU/u4L88S4Xpq4
	a3nPKUooW3Kbf9g4RhUtIsijUZQROKvRIJ7AV0eOThDptjoR8WiC5/MBT4cm3GnkSwYkyFmxJ14
	Bno7ULGt4FOIDTHu1neky3/zuaD4y0DO+HQrVatvXlr/FDUY3wELqyOnIaD/yQmXXDVFweBZnmr
	FH22TBkb83+/6bzdx+3w19kx2kqqZeCHvrpmu08n5r6iAArn4/ozq
X-Received: by 2002:a17:903:987:b0:2ba:5a20:1d94 with SMTP id d9443c01a7336-2bd7e8459ddmr171304295ad.13.1779099841092;
        Mon, 18 May 2026 03:24:01 -0700 (PDT)
X-Received: by 2002:a17:903:987:b0:2ba:5a20:1d94 with SMTP id d9443c01a7336-2bd7e8459ddmr171304015ad.13.1779099840607;
        Mon, 18 May 2026 03:24:00 -0700 (PDT)
Received: from [10.218.5.182] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d12e38dsm145269515ad.77.2026.05.18.03.23.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 03:24:00 -0700 (PDT)
Message-ID: <2a496bdf-4728-47b9-84ba-063712a6e5b6@oss.qualcomm.com>
Date: Mon, 18 May 2026 15:53:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] clk: qcom: camcc-glymur: Add camera clock
 controller driver
To: Bryan O'Donoghue <bod@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260517-glymur_camcc-v4-0-9d00acffdbf7@oss.qualcomm.com>
 <20260517-glymur_camcc-v4-2-9d00acffdbf7@oss.qualcomm.com>
 <8bd4365e-0171-425c-9738-0b186047cb15@kernel.org>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <8bd4365e-0171-425c-9738-0b186047cb15@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2Nn9Dma1EdQ8qANg9qd6PuX4RC2kVqPH
X-Proofpoint-ORIG-GUID: 2Nn9Dma1EdQ8qANg9qd6PuX4RC2kVqPH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEwMCBTYWx0ZWRfX4QyynsmuDUL+
 q3958+yYk4eDKmP6C2BxEABtknPZxroj6AYfz79owD8DOg7ADF5TGe4Nj1Q+6hSKOkLWjXt6keh
 FfhS5PIGNIV0eKCFNnxzMnnk3sEIlJKJoG7I/A+w95UpIghF6t9mLAJe7gdRaGAirSWLLVfMK9U
 U1TY0og6clHd16GA6uVEIqn/lZ1bPY61coSUkTsZNKPjuKo2kVyyvUmAercPIP03oGegGIXaUmc
 Ai1hFrIe2+JZeNnZni2ehqKenowg8pebsIAx2u5E9+0pL9ydCK/bpJYv8lkgxhGhgb9c8wYwaM+
 T+tKJNX5msK7+5bJWTSp15y7C6rsT742yLoi8NIjUMp+a+QnCXz9gjj8051pnf2F8h3xp6kKZN+
 Z0XsmInU8x6HAL9wVaDAUZ8upGDuhWgDjMtT0C6Cg6APScYS3cbU4GxAkU/ezSS/mkdkYlJ3bhP
 Xx01PvTMeqNNV/krVZA==
X-Authority-Analysis: v=2.4 cv=ecMNubEH c=1 sm=1 tr=0 ts=6a0ae8c2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1leAgmdG7ggDTx2EHhMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180100
X-Rspamd-Queue-Id: E5B4756AADC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108152-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 5/18/2026 1:05 PM, Bryan O'Donoghue wrote:
> On 17/05/2026 18:33, Jagadeesh Kona wrote:
>> +/* 1200.0 MHz Configuration */
>> +static const struct alpha_pll_config cam_cc_pll0_config = {
>> +    .l = 0x3e,
>> +    .alpha = 0x8000,
>> +    .config_ctl_val = 0x25c400e7,
>> +    .config_ctl_hi_val = 0x0a8060e0,
>> +    .config_ctl_hi1_val = 0xf51dea20,
>> +    .user_ctl_val = 0x00008408,
>> +    .user_ctl_hi_val = 0x00000002,
>> +};
> 
> I'll again push back on these magic numbers.
> 
> At the very least you should be mentioning in the cover letter log why you _aren't_ making that change.
> 
> Just reposting and hoping it slips by the person making the comment isn't too cool.
> 
> Why can't qcom update the python? script that generates this code to enumerate fields instead of magic numbers here ?
> 
> I get you don't want to do it but, just ignoring the review feedback is no OK.
> 
> What gives ?
> 

Hi Bryan,

I haven't ignored your comments & already responded to your earlier comment on why the bit fields are not
defined. Most of these values are static settings we get from PLL HW team and we program them only once
as is during bootup and are never reused again anywhere from PLL code, so these bits are not defined.

Please find the earlier responses for your comments below:
https://lore.kernel.org/all/b92a2cbb-fe8d-4378-aa02-d91e2e4dfff4@oss.qualcomm.com/ 
https://lore.kernel.org/all/009ecdbb-2297-44eb-862d-233e3290691c@oss.qualcomm.com/

Thanks,
Jagadeesh

