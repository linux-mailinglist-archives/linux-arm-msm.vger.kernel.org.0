Return-Path: <linux-arm-msm+bounces-103786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QC5lDrtF5mk+uAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 17:26:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7559142E2C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 17:26:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75E86377A129
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 15:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4A13BE146;
	Mon, 20 Apr 2026 14:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kxvLlMKi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kjUHRBB1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CB13BE153
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 14:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776694727; cv=none; b=eZ0w5jIvRFOdzhQH9fm1wv9N/OgJJ7gCPEfxvr3XZnfEfYw5Z3dU3cmWTxFrUh2cdOTyZkcCMbAvsNuSoYHc05Dydt01pyPXMxJoK6HocKaYRHgwfeXGmzom3ny6qjk5ac9sUc5q5INCkR5ak4cgsHrqp5pbn1ReIVAa9nmVvBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776694727; c=relaxed/simple;
	bh=ZYPs3XUM7OCCfaVsvKxo2cgYntE6Vl3nxOcTjiV7dHM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Griumb5AP5bC9U4g765z9Rs1Q8dL3vf2ES8pbSALgZX5syNgIp4pKpGpfmPI78aDc6D6ca9vIoxDt8l0Llb8Obw4q47yP5Lxa4hgT85zi0mOmCd+T1Cj0FD/uFyqiLjvFVR/vHG0H3TEXsyOTTqV+RaKjIWJ/zXKp5q9tu7dPAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kxvLlMKi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kjUHRBB1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KA4JJZ2980973
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 14:18:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oMeY5io1/Yxeo+8chkLqpPF/CAh/4PgGVm0R9+c7fmk=; b=kxvLlMKi+DyDliJD
	FvO9gg0kGEHa4N21wxoULr3fieCj3XB35xDohNI320E2SnArLdxrKxcNKr7jFXxK
	wUQXT1AQIKCHCmqiFbMnCy//p496QRzHPOXczvIRFP7C+W3xEh7uP/9uNhy//dg7
	I+0R2EgVrSl1jskd5KUbqxAmSLmCI+kx8KxuwmCSNTdvkBZkXg0LZlzP7/HEdlFg
	FsDOggJ+FlcrPhFYfhSzHHZ0VsNz2IGB32rM20CBf1sjfKedJc5EGiVNl2WmMsXZ
	WTva5IJ/dFO2qR7VTWSCpN/S/BYRLeTFiR3t4TLjjzBK6ebvNB/lx0r6dKN+N7Ky
	JBvSwA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnj2prupq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 14:18:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2ead99f5dso38623175ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 07:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776694723; x=1777299523; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oMeY5io1/Yxeo+8chkLqpPF/CAh/4PgGVm0R9+c7fmk=;
        b=kjUHRBB1coQLyH2VWT3L/pWQbaxYpQ6k/7MRuGxKmy3zYQ07Jm57z1324L/yUrWcL9
         8cVNIx95NFCJHuGHFuNHcgI7ne7Bu9zAISzLBKVggCz/1bgh3d8K5qrpgF4VN+2X2fNJ
         jHfUWWR17bUDPTOVCrOoSic5VPqOezfYJVOI6gCXGteVtRq4OLtdBqxiC8l1Cxh4E+Sd
         BfQPcMw6VWWeRfMDpPfXi9Fbv/7WTgksqvpqWCTq/5xhcdOagb5ba5Ah5DNaAU3zievl
         AgUCAH79kSQU1mVojWtTKe4chss9woN1hH+wXLN914oCoEEAr6vWjfteSXLk9v8yj612
         BEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776694723; x=1777299523;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oMeY5io1/Yxeo+8chkLqpPF/CAh/4PgGVm0R9+c7fmk=;
        b=inhrZua/044c5uCiDewIJ3Gs/O/Hhxeuce/w3LUpf/logjLNrEuLXRAER7mQfcEKdZ
         1fEOOA9+eIHhRmKUaVPdMzszdA6YphXdDUxOLOc/gfKXikfR+obY2OZJpssCuxfoybdt
         HjaWgnoVDhWMpCHnRCg/saoAsw8r6THrqx4TntojTlHmBuFk6So1lz0h7KmNbEC5cB4m
         73KiDlqF+0k+1vFkJoJik/OKKl/9skvlkIvvcr+dwlkx+vyD8Gq6Q/Okdlsh5Oije4rV
         S7VZ8Q6nuuHLko48+jV4Kstf4mmMxVKTygrGbIeg2G+CnsNDkoBuTarwxmVCOfnmeATH
         6glQ==
X-Forwarded-Encrypted: i=1; AFNElJ9+3jrkIBlahbPGJJmMQDsf+OOk7MemZsSjzFEW55g65Kberyz6ZJTMNS2S37VEgVYL8oDTuw0i/TYdw5zz@vger.kernel.org
X-Gm-Message-State: AOJu0YwDrcCPByZqdzTOiSjtxiFxJFoJaxbqs3xghoAHiyBGUfgw25pa
	4uJQM4+oBtxWPwvplFcuU9r+r0gPAyXKhxPJ204E8wQ732JPC9LWZTsiMPPor3od3vOnfheKFDg
	CH9MJia/Wn28+C+rMC+b7O90J92tg+1EdbxtpCpiWpl41jO0RwdHi0g9e+zndsrbKHCpS
X-Gm-Gg: AeBDieutTbclokNFFtDerHQgKmklDUVuEIYHULSCxebtvt6iaZ66SiP/aIyWp63g3Sy
	HGU49KTQUGWFq56woJ5gzAPqvFJKYfJXmu/W0H74q0rVMYENRCb6RVGKw0Aax02BrPwas/D+Vpq
	AgCsHTgVKEzCpXC+T3yAozRpFqn1huOS5FOuFmRmKRwUqAuQubgr0wBLwA6K63dw6zwmlB9rU6X
	r+nvsQGJx3ohnqq6lEUyQgS0uN47aKrEYDYRflFBQDlt3FX0eQ+r/xrnGXLuoqxEfcuBAv79ggr
	/yrpYktpWeYBonqF2CSC+tZ6tskh0YGOQ9oDX9EOzgiMPE2d/kAur5Vyg29djLijFDhvgwX/7rS
	FCZglGfZBArKmnV/O2th44AP8n80NOU3oFAaKyCk+4Q2GcN2sAw5MjVJ1leY=
X-Received: by 2002:a17:903:1104:b0:2b4:6529:7b9f with SMTP id d9443c01a7336-2b5f9f37032mr155993615ad.26.1776694723117;
        Mon, 20 Apr 2026 07:18:43 -0700 (PDT)
X-Received: by 2002:a17:903:1104:b0:2b4:6529:7b9f with SMTP id d9443c01a7336-2b5f9f37032mr155992955ad.26.1776694722228;
        Mon, 20 Apr 2026 07:18:42 -0700 (PDT)
Received: from [10.204.79.61] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cdc6sm103153505ad.46.2026.04.20.07.18.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 07:18:41 -0700 (PDT)
Message-ID: <a967d7ec-66f7-4eaa-91e3-0a96e5a8ec7f@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 19:48:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qualcomm: qmp-combo: update DP PHY PLL programming
 on Glymur
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
References: <20260419-glymur_dp-v1-1-ad1067a8e8ae@oss.qualcomm.com>
 <CAO9ioeXT0jxu875jBsAbOVrDqonASWSmmxJbP0AiitXb-gUANQ@mail.gmail.com>
Content-Language: en-US
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
In-Reply-To: <CAO9ioeXT0jxu875jBsAbOVrDqonASWSmmxJbP0AiitXb-gUANQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: L2ejIPgMKl77J1J-LQvUAGCWTAFy20JE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEzOSBTYWx0ZWRfX4ZY7fseXMp36
 Xzyo0RZRB/tSop3oYgLs8XnWRe3Qy8PaJhWRWbHE7u9k6vSgIm7bpgDIisk9ffD7OeApRpT+uXC
 TPtfzsmk212UyWeMETGe3gAh6fFZxcDK81+0NG8i4elhg7jGpw1LoIoBkCpIauUWVg3FzSKxEqg
 MvOmuyFBSdP912rMEttPKP8YNkyD4vAReZjrlm3QXmwJnMNy/LNQhKeg8KVA7vO+5H06k2QWir+
 HbKGPy/79yRAwdYYpWomq9ZQgltNp/T7SXeaxSchdqOz2l7vo1bz6s0V7xPjDwcbU7jIr6aRxxF
 COP9SF7x1ko855ZbimLt417JmBaxuQU/+f3MgJXYKjRCD8TCWp3nXU+xhG9V+c+kh8ryUyL0c7E
 Z7DdLGKIP1hXEIkXEKPzDXB9rUAZxs34cCB1WG5jqoUqIHOlO92PKdtWSCnsd6lFh93eSBdVtZb
 oxk07YG9EQf7gTUVvgA==
X-Authority-Analysis: v=2.4 cv=XMoAjwhE c=1 sm=1 tr=0 ts=69e635c4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=zDaDr-ORmovJYLfbEhEA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: L2ejIPgMKl77J1J-LQvUAGCWTAFy20JE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0 spamscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200139
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103786-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mahadevan.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7559142E2C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/19/2026 6:48 PM, Dmitry Baryshkov wrote:
> On Sun, 19 Apr 2026 at 13:16, Mahadevan P <mahadevan.p@oss.qualcomm.com> wrote:
>>
>> The existing DP PHY PLL and AUX configuration for the Glymur platform
>> does not fully follow the Hardware Programming Guide requirements for
>> DP over Type-C, which results in DP link bring-up failures.
>>
>> Update the DP PHY programming sequence and PLL-related register
>> settings to align with the latest HPG recommendations. With this
>> change, DP link training completes successfully on Glymur-based
>> platforms.
>>
>> Fixes: d10736db98d2 ("phy: qualcomm: qmp-combo: Add DP offsets and settings for Glymur platforms")
>> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
>> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>> ---
>> Tested on a Glymur CRD platform with two DisplayPorts over USB Type-C:
>> - Link training completes successfully
>> - Display comes up at expected resolutions
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 213 +++++++++++++++------
>>   drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h |   2 +
>>   2 files changed, 154 insertions(+), 61 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>> index 93f1aa10d400..bb5e4091fd0c 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>> @@ -283,8 +283,8 @@ static const unsigned int qmp_v8_n3_usb43dpphy_regs_layout[QPHY_LAYOUT_SIZE] = {
>>          [QPHY_DP_AON_TOGGLE_ENABLE]             = QPHY_V8_PCS_AON_DP_AON_TOGGLE_ENABLE,
>>
>>          [QPHY_COM_RESETSM_CNTRL]                = QSERDES_V8_COM_RESETSM_CNTRL,
>> -       [QPHY_COM_C_READY_STATUS]               = QSERDES_V8_COM_C_READY_STATUS,
>> -       [QPHY_COM_CMN_STATUS]                   = QSERDES_V8_COM_CMN_STATUS,
>> +       [QPHY_COM_C_READY_STATUS]               = QSERDES_V8_COM_C_READY_STATUS_N3,
>> +       [QPHY_COM_CMN_STATUS]                   = QSERDES_V8_COM_CMN_STATUS_N3,
>>          [QPHY_COM_BIAS_EN_CLKBUFLR_EN]  = QSERDES_V8_COM_BIAS_EN_CLKBUFLR_EN,
>>
>>          [QPHY_DP_PHY_STATUS]                    = QSERDES_V8_DP_PHY_STATUS,
>> @@ -1386,10 +1386,10 @@ static const struct qmp_phy_init_tbl qmp_v6_n4_dp_serdes_tbl[] = {
>>   };
>>
>>   static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl[] = {
>> -       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE2_MODE0, 0x00),
>> +       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE2_MODE0, 0x02),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CP_CTRL_MODE0, 0x06),
>> -       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_RCTRL_MODE1, 0x10),
>> -       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_CCTRL_MODE1, 0x01),
>> +       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_RCTRL_MODE0, 0x16),
>> +       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_CCTRL_MODE0, 0x36),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CORECLK_DIV_MODE0, 0x0a),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DIV_FRAC_START1_MODE0, 0x00),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_INTEGLOOP_GAIN0_MODE0, 0x3f),
>> @@ -1404,12 +1404,13 @@ static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl[] = {
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYSCLK_BUF_ENABLE, 0x06),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_IVCO, 0x07),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYSCLK_EN_SEL, 0x3b),
>> +       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_RESETSM_CNTRL, 0x20),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP_EN, 0x00),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE_CTRL, 0x00),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE_MAP, 0x00),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CLK_SELECT, 0x30),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CORE_CLK_EN, 0x00),
>> -       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CMN_CONFIG_1, 0x56),
>> +       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CMN_CONFIG_1, 0x16),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SVS_MODE_CLK_SEL, 0x15),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CMN_MODE_CONTD1, 0x24),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DCC_CAL_1, 0x40),
>> @@ -1445,26 +1446,26 @@ static const struct qmp_phy_init_tbl qmp_v6_n4_dp_tx_tbl[] = {
>>   };
>>
>>   static const struct qmp_phy_init_tbl qmp_v8_n3p_dp_tx_tbl[] = {
>> -       QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TRANSMITTER_EN_CTRL, 0x3f),
>> +       QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TRANSMITTER_EN_CTRL, 0x1a),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_LALB_VMODE_CTRL1, 0x40),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_LALB_ANA_INTERFACE_SELECT1, 0x07),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_LALB_ANA_INTERFACE_SELECT2, 0x18),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_LALB_PCS_INTERFACE_SELECT1, 0x50),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_LALB_LANE_MODE_1, 0x0d),
>> -       QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CLKBUF_ENABLE, 0x07),
>> -       QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RESET_TSYNC_EN_CTRL, 0x0a),
>> +       QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CLKBUF_ENABLE, 0x87),
>> +       QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RESET_TSYNC_EN_CTRL, 0x0f),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX_LVL_UPDATE_CTRL, 0x0f),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TRAN_DRVR_EMP_EN, 0x5f),
>> -       QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX0_EMP_POST1_LVL, 0x20),
>> -       QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX1_EMP_POST1_LVL, 0x20),
>> +       QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX0_EMP_POST1_LVL, 0x2b),
>> +       QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX1_EMP_POST1_LVL, 0x2b),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX0_PRE1_EMPH, 0x20),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX1_PRE1_EMPH, 0x20),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX0_DRV_LVL, 0x00),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX1_DRV_LVL, 0x00),
>> -       QMP_PHY_INIT_CFG(QSERDES_V8_LALB_HIGHZ_DRVR_EN, 0x30),
>> +       QMP_PHY_INIT_CFG(QSERDES_V8_LALB_HIGHZ_DRVR_EN, 0x3f),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_LALB_LANE_MODE_2, 0x50),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_LALB_LANE_MODE_3, 0x51),
>> -       QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX_DCC_ANA_CTRL2, 0x00),
>> +       QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX_DCC_ANA_CTRL2, 0x0c),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX0_RESTRIM_CAL_CTRL, 0x20),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX1_RESTRIM_CAL_CTRL, 0x02),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX0_RESTRIM_POST_CAL_OFFSET, 0x10),
>> @@ -1589,11 +1590,12 @@ static const struct qmp_phy_init_tbl qmp_v6_n4_dp_serdes_tbl_hbr3[] = {
>>
>>   static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl_rbr[] = {
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_HSCLK_SEL_1, 0x05),
>> -       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0x7a),
>> -       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x02),
>> +       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0x8d),
>> +       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x27),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE1_MODE0, 0x83),
>> -       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP1_MODE0, 0x37),
>> -       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP2_MODE0, 0x04),
>> +       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE2_MODE0, 0x02),
>> +       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP1_MODE0, 0x1c),
>> +       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP2_MODE0, 0x02),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DEC_START_MODE0, 0x54),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DIV_FRAC_START2_MODE0, 0x00),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DIV_FRAC_START3_MODE0, 0x06),
>> @@ -1601,16 +1603,17 @@ static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl_rbr[] = {
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE2_MODE0, 0x00),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_HSCLK_SEL_1, 0x05),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CMN_MODE_CONTD3, 0x07),
>> -       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CLK_FWD_CONFIG_1, 0x30),
>> -       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_IP_CTRL_AND_DP_SEL, 0xa4),
>> +       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CLK_FWD_CONFIG_1, 0x3f),
>> +       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_IP_CTRL_AND_DP_SEL, 0xa7),
>>   };
>>
>>   static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl_hbr[] = {
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_HSCLK_SEL_1, 0x04),
>> -       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0x21),
>> -       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x04),
>> +       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xf6),
>> +       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x20),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE1_MODE0, 0x18),
>> -       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP1_MODE0, 0x07),
>> +       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE2_MODE0, 0x02),
>> +       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP1_MODE0, 0x08),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP2_MODE0, 0x07),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DEC_START_MODE0, 0x46),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DIV_FRAC_START2_MODE0, 0x00),
>> @@ -1627,7 +1630,8 @@ static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl_hbr2[] = {
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_HSCLK_SEL_1, 0x03),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xf6),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x20),
>> -       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE1_MODE0, 0x0),
>> +       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE1_MODE0, 0x18),
>> +       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE2_MODE0, 0x02),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_RCTRL_MODE0, 0x16),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_CCTRL_MODE0, 0x36),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP1_MODE0, 0x10),
>> @@ -1637,9 +1641,9 @@ static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl_hbr2[] = {
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DIV_FRAC_START3_MODE0, 0x05),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE1_MODE0, 0xae),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE2_MODE0, 0x02),
>> -       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_HSCLK_SEL_1, 0x00),
>> -       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_IP_CTRL_AND_DP_SEL, 0xbf),
>> -       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIAS_EN_CLKBUFLR_EN, 0x1c),
>> +       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_HSCLK_SEL_1, 0x03),
>> +       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_IP_CTRL_AND_DP_SEL, 0xab),
>> +       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIAS_EN_CLKBUFLR_EN, 0x17),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_RESETSM_CNTRL, 0x20),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CMN_MODE_CONTD3, 0x03),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CLK_FWD_CONFIG_1, 0x3f),
>> @@ -1647,8 +1651,8 @@ static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl_hbr2[] = {
>>
>>   static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl_hbr3[] = {
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_HSCLK_SEL_1, 0x02),
>> -       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0x63),
>> -       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x0c),
>> +       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0x14),
>> +       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x25),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE1_MODE0, 0x5b),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE2_MODE0, 0x02),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CP_CTRL_MODE0, 0x06),
>> @@ -1656,7 +1660,7 @@ static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl_hbr3[] = {
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_CCTRL_MODE0, 0x36),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CORECLK_DIV_MODE0, 0x0a),
>>
>> -       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP1_MODE0, 0x17),
>> +       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP1_MODE0, 0x18),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP2_MODE0, 0x15),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DEC_START_MODE0, 0x4f),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DIV_FRAC_START1_MODE0, 0x00),
>> @@ -1675,19 +1679,19 @@ static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl_hbr3[] = {
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYS_CLK_CTRL, 0x02),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYSCLK_BUF_ENABLE, 0x06),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_IVCO, 0x07),
>> -       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYSCLK_EN_SEL, 0x04),
>> +       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYSCLK_EN_SEL, 0x3b),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE_CTRL, 0x00),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE_MAP, 0x00),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CLK_SELECT, 0x30),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CORE_CLK_EN, 0x00),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CMN_CONFIG_1, 0x16),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SVS_MODE_CLK_SEL, 0x15),
>> -       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CLK_FWD_CONFIG_1, 0x30),
>> -       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIAS_EN_CLKBUFLR_EN, 0x10),
>> +       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CLK_FWD_CONFIG_1, 0x3f),
>> +       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIAS_EN_CLKBUFLR_EN, 0x17),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CMN_MODE_CONTD3, 0x05),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CMN_MODE_CONTD1, 0x24),
>>          QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_HSCLK_SEL_1, 0x02),
>> -       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_IP_CTRL_AND_DP_SEL, 0x84),
>> +       QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_IP_CTRL_AND_DP_SEL, 0x87),
>>   };
>>
>>   static const struct qmp_phy_init_tbl sc8280xp_usb43dp_serdes_tbl[] = {
>> @@ -3145,6 +3149,30 @@ static int qmp_combo_configure_dp_swing(struct qmp_combo *qmp)
>>          return 0;
>>   }
>>
>> +static bool qmp_v8_combo_configure_dp_mode(struct qmp_combo *qmp)
>> +{
>> +       bool reverse = (qmp->orientation == TYPEC_ORIENTATION_REVERSE);
>> +       const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
>> +       u32 val;
>> +
>> +       val = DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
>> +               DP_PHY_PD_CTL_LANE_0_1_PWRDN | DP_PHY_PD_CTL_LANE_2_3_PWRDN |
>> +               DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN;
>> +
>> +       if (dp_opts->lanes == 1 || dp_opts->lanes == 2) {
>> +               if (reverse)
>> +                       val &= ~DP_PHY_PD_CTL_LANE_2_3_PWRDN;
>> +               else
>> +                       val &= ~DP_PHY_PD_CTL_LANE_0_1_PWRDN;
>> +       }
>> +
>> +       writel(val, qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
>> +
>> +       writel(0x5c, qmp->dp_dp_phy + QSERDES_DP_PHY_MODE);
> 
> Are you saying that we don't need to write 0x4c here in case of the
> reverse mode? Was that changed and why?
Yes for glymur it is changed
DP2_PHY_DP_PHY_PD_CTL
Normal Orientation: 0x7D for 4lane; 0x75 for 1Lane or 2Lanne
Flip Orientation: 0x7D for 4Lane; 0x6D for 1Lane or 2Lane

> 
>> +
>> +       return reverse;
>> +}
>> +
>>   static void qmp_v3_configure_dp_tx(struct qmp_combo *qmp)
>>   {
>>          const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
>> @@ -3324,16 +3352,70 @@ static void qmp_v4_dp_aux_init(struct qmp_combo *qmp)
>>                 qmp->dp_dp_phy + QSERDES_V4_DP_PHY_AUX_INTERRUPT_MASK);
>>   }
>>
>> +static int qmp_v8_helper_configure_dp_phy(struct qmp_combo *qmp)
>> +{
>> +       const struct qmp_phy_cfg *cfg = qmp->cfg;
>> +       u32 status;
>> +       int ret;
>> +
>> +       writel(0x0f, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG_1);
>> +
>> +       qmp_v8_combo_configure_dp_mode(qmp);
>> +
>> +       writel(0x13, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG1);
>> +       writel(0xa4, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG2);
>> +
>> +       writel(0x05, qmp->dp_dp_phy + QSERDES_V4_DP_PHY_TX0_TX1_LANE_CTL);
>> +       writel(0x05, qmp->dp_dp_phy + QSERDES_V4_DP_PHY_TX2_TX3_LANE_CTL);
>> +
>> +       ret = qmp->cfg->configure_dp_clocks(qmp);
>> +       if (ret)
>> +               return ret;
>> +
>> +       writel(0x01, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
>> +       writel(0x05, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
>> +       writel(0x01, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
>> +       writel(0x09, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
>> +
>> +       writel(0x20, qmp->dp_serdes + cfg->regs[QPHY_COM_RESETSM_CNTRL]);
>> +
>> +       if (readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_C_READY_STATUS],
>> +                       status,
>> +                       ((status & BIT(0)) > 0),
>> +                       500,
>> +                       10000))
>> +               return -ETIMEDOUT;
>> +
>> +       if (readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_CMN_STATUS],
>> +                       status,
>> +                       ((status & BIT(0)) > 0),
>> +                       500,
>> +                       10000))
>> +               return -ETIMEDOUT;
>> +
>> +       if (readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_CMN_STATUS],
>> +                       status,
>> +                       ((status & BIT(1)) > 0),
>> +                       500,
>> +                       10000))
>> +               return -ETIMEDOUT;
>> +
>> +       return 0;
>> +}
>> +
>>   static void qmp_v8_dp_aux_init(struct qmp_combo *qmp)
>>   {
>>          const struct qmp_phy_cfg *cfg = qmp->cfg;
>>
>> -       writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_PSR_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
>> -              DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
>> -              qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
>> +       writel(0x3f, qmp->dp_serdes + QSERDES_V8_USB43_COM_CLK_FWD_CONFIG_1);
>> +
>> +       writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
>> +               DP_PHY_PD_CTL_LANE_0_1_PWRDN | DP_PHY_PD_CTL_LANE_2_3_PWRDN |
>> +               DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
>> +               qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
> 
> No AUX_PWRDN? Why?

Dropped PSR_PWRDN added LANE_0_1_PWRDN and LANE_2_3_PWRDN

Reffered latest Harware Programing guide its says we need to program 
0x7D to DP2_DP_PHY_PD_CTL register

> 
>>
>>          /* Turn on BIAS current for PHY/PLL */
>> -       writel(0x1c, qmp->dp_serdes + cfg->regs[QPHY_COM_BIAS_EN_CLKBUFLR_EN]);
>> +       writel(0x17, qmp->dp_serdes + cfg->regs[QPHY_COM_BIAS_EN_CLKBUFLR_EN]);
>>
>>          writel(0x00, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG0);
>>          writel(0x13, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG1);
>> @@ -3361,8 +3443,8 @@ static void qmp_v4_configure_dp_tx(struct qmp_combo *qmp)
>>          writel(0x27, qmp->dp_tx + cfg->regs[QPHY_TX_TX_DRV_LVL]);
>>          writel(0x27, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_DRV_LVL]);
>>
>> -       writel(0x20, qmp->dp_tx + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
>> -       writel(0x20, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
>> +       writel(0x2b, qmp->dp_tx + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
>> +       writel(0x2b, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
>>
>>          qmp_combo_configure_dp_swing(qmp);
>>   }
>> @@ -3370,48 +3452,41 @@ static void qmp_v4_configure_dp_tx(struct qmp_combo *qmp)
>>   static int qmp_v8_configure_dp_clocks(struct qmp_combo *qmp)
>>   {
>>          const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
>> -       u32 phy_vco_div;
>>          unsigned long pixel_freq;
>> -       const struct qmp_phy_cfg *cfg = qmp->cfg;
>>
>>          switch (dp_opts->link_rate) {
>>          case 1620:
>> -               phy_vco_div = 0x4;
>>                  pixel_freq = 1620000000UL / 2;
>>                  break;
>>          case 2700:
>> -               phy_vco_div = 0x2;
>>                  pixel_freq = 2700000000UL / 2;
>>                  break;
>>          case 5400:
>> -               phy_vco_div = 0x4;
>>                  pixel_freq = 5400000000UL / 4;
>>                  break;
>>          case 8100:
>> -               phy_vco_div = 0x3;
>>                  pixel_freq = 8100000000UL / 6;
>>                  break;
>>          default:
>>                  /* Other link rates aren't supported */
>>                  return -EINVAL;
>>          }
>> -       writel(phy_vco_div, qmp->dp_dp_phy + cfg->regs[QPHY_DP_PHY_VCO_DIV]);
> 
> Hmm?
  In the Glymur PHY, the clock gen/div is entirely done within the PLL, 
removed the register writes for DP_PHY_VCO_DIV

> 
>>
>>          /* disable core reset tsync */
>>          writel(0x09, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
>>
>> -       writel(0x04, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_SETUP_CYC);
>> -       writel(0x08, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_SILENCE_CYC);
>> +       writel(0x09, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_SETUP_CYC);
>> +       writel(0x11, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_SILENCE_CYC);
>>          writel(0x08, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LFPS_CYC);
>> -       writel(0x11, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LFPS_PERIOD);
>> +       writel(0x33, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LFPS_PERIOD);
>>
>>          writel(0x3e, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TSYNC_OVRD);
>>          writel(0x05, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TX2_TX3_LANE_CTL);
>>          writel(0x05, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TX0_TX1_LANE_CTL);
>>          writel(0x01, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_CFG1);
>> -       writel(0x11, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LFPS_PERIOD);
>> +       writel(0x33, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LFPS_PERIOD);
>>          writel(0x1f, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LN0_DRV_LVL);
>> -       writel(0x1f, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LN1_DRV_LVL);
>> +       writel(0x02, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LN1_DRV_LVL);
>>
>>          clk_set_rate(qmp->dp_link_hw.clk, dp_opts->link_rate * 100000);
>>          clk_set_rate(qmp->dp_pixel_hw.clk, pixel_freq);
>> @@ -3558,7 +3633,7 @@ static int qmp_v8_configure_dp_phy(struct qmp_combo *qmp)
>>          u32 status;
>>          int ret;
>>
>> -       ret = qmp_v456_configure_dp_phy(qmp);
>> +       ret = qmp_v8_helper_configure_dp_phy(qmp);
>>          if (ret < 0)
>>                  return ret;
>>
>> @@ -3570,13 +3645,13 @@ static int qmp_v8_configure_dp_phy(struct qmp_combo *qmp)
>>          } else if (dp_opts->lanes == 2) {
>>                  bias0_en = reverse ? 0x3f : 0x15;
>>                  bias1_en = reverse ? 0x15 : 0x3f;
>> -               drvr0_en = 0x10;
>> -               drvr1_en = 0x10;
>> +               drvr0_en = 0x30;
>> +               drvr1_en = 0x30;
>>          } else {
>>                  bias0_en = 0x3f;
>>                  bias1_en = 0x3f;
>> -               drvr0_en = 0x34;
>> -               drvr1_en = 0x34;
>> +               drvr0_en = 0x30;
>> +               drvr1_en = 0x30;
>>          }
>>
>>          writel(drvr0_en, qmp->dp_tx + cfg->regs[QPHY_TX_HIGHZ_DRVR_EN]);
>> @@ -3584,6 +3659,14 @@ static int qmp_v8_configure_dp_phy(struct qmp_combo *qmp)
>>          writel(drvr1_en, qmp->dp_tx2 + cfg->regs[QPHY_TX_HIGHZ_DRVR_EN]);
>>          writel(bias1_en, qmp->dp_tx2 + cfg->regs[QPHY_TX_TRANSCEIVER_BIAS_EN]);
>>
>> +       writel(0x03, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TSYNC_OVRD);
>> +       writel(0x23, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TSYNC_OVRD);
>> +       writel(0x22, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TSYNC_OVRD);
>> +
>> +       writel(0x0a, qmp->dp_tx + QSERDES_V8_LALB_RESET_TSYNC_EN_CTRL);
>> +       writel(0x0a, qmp->dp_tx2 + QSERDES_V8_LALB_RESET_TSYNC_EN_CTRL);
>> +
>> +       writel(0x3e, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TSYNC_OVRD);
>>          writel(0x08, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
>>          udelay(100);
>>          writel(0x09, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
>> @@ -3591,16 +3674,24 @@ static int qmp_v8_configure_dp_phy(struct qmp_combo *qmp)
>>
>>          if (readl_poll_timeout(qmp->dp_dp_phy + cfg->regs[QPHY_DP_PHY_STATUS],
>>                          status,
>> -                       ((status & BIT(1)) > 0),
>> +                       ((status & BIT(0)) > 0),
>>                          500,
>>                          10000))
>>                  return -ETIMEDOUT;
>>
>> -       writel(0x00, qmp->dp_tx + cfg->regs[QPHY_TX_TX_DRV_LVL]);
>> -       writel(0x00, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_DRV_LVL]);
>> +       if (readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_CMN_STATUS],
>> +                       status,
>> +                       ((status & BIT(0)) > 0),
>> +                       500,
>> +                       10000))
>> +               return -ETIMEDOUT;
>>
>> -       writel(0x2b, qmp->dp_tx + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
>> -       writel(0x2b, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
>> +       if (readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_CMN_STATUS],
>> +                       status,
>> +                       ((status & BIT(1)) > 0),
>> +                       500,
>> +                       10000))
>> +               return -ETIMEDOUT;
>>
>>          return 0;
>>   }
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h
>> index d8ac4c4a2c31..b35b486cfa56 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h
>> @@ -71,5 +71,7 @@
>>   #define QSERDES_V8_COM_ADDITIONAL_MISC                 0x1b4
>>   #define QSERDES_V8_COM_CMN_STATUS                      0x2c8
>>   #define QSERDES_V8_COM_C_READY_STATUS                  0x2f0
>> +#define QSERDES_V8_COM_CMN_STATUS_N3                   0x314
>> +#define QSERDES_V8_COM_C_READY_STATUS_N3               0x33c
>>
>>   #endif
>>
>> ---
>> base-commit: 1c7cc4904160c6fc6377564140062d68a3dc93a0
>> change-id: 20260414-glymur_dp-ffea83a75969
>>
>> Best regards,
>> --
>> Mahadevan P <mahadevan.p@oss.qualcomm.com>
>>
> 
> 

