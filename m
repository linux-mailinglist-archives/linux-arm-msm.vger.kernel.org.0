Return-Path: <linux-arm-msm+bounces-106626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CLzDRy1/WkXhwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:04:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2074F4B54
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:04:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C8796302EE8A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 10:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 817F83CD8A7;
	Fri,  8 May 2026 10:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O2x69sam";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kfwh1P4D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A153CBE89
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 10:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778234479; cv=none; b=R/HMloM7gh1vv6cQl+HUlE3mTnW+qV12g/kvh7KJ3F2PpCWNfv63U/SH7U2XurAuNl7Fj1ScvFHedBuH/OKNGAK2G8JBMj0GvbibNPLSYtRvz27K2pTMniYRXDUhGa5ek40/krRjnLt4RP4gVOwNuIMNFKLtzo8xm4IPr8hWNIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778234479; c=relaxed/simple;
	bh=BTe6tbqNFBRw9A656cKBDm3/Kt6aBKllSr2UTqxtR6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nh6DypPxCwoOHcUcu8cuLGxripBf063R2rzRdYeE0wyvohx2JyQfpHfVtOPuWw12cTX2+aZA/lKwJAZp4j5GSmqKOzitmGiUgx/UBkA0EdAfbiv2xtfXmQqOMQdl5GL6fxAPlfXBn1VPLzIwPH/mHxEMAXIqiMEDCaleNQVsBd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O2x69sam; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kfwh1P4D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6484wbls2183070
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 10:01:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mYVViA5lER/JWv5LGE7unDaZDBq0499CdgqNysorOsY=; b=O2x69samdgWyIMd6
	7cqPL7vAlIDvOUoeFYbDyUGzGj4mcYthiSaXdA8AdmVjCNs1tQ+cazifAcfsuONV
	D/xO9oLZqKulN+fgmNTqXz9k2hLo0Y1wcAZMqsH9l/SLH/1ugLSGhL4Do7b8TZDN
	cx+STkZxEtiJez2Dr74zvaEKgnZWoPL68wfDZmSATuNOwnr0JjXX5Xnea2mPJifa
	kYPxpzgw5kdHcupJ+VRqKmJzLS+FcglOTuhYmI1/tI1s7iBTDPpkgl0cIc8IExN9
	MAKPVMqcuGjeyzQe+tt9W1cv6/o6tzCzYuGqF+BbZTR2u8Mcabe9DPCXJKhS/Xic
	QAFE7w==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e10pyau0e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 10:01:17 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5751831fe6dso207982e0c.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 03:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778234476; x=1778839276; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mYVViA5lER/JWv5LGE7unDaZDBq0499CdgqNysorOsY=;
        b=kfwh1P4DDQwzFGM+7BHDcWH19K86rzng9UDk6EygAL6Q887v/Q9AV+EcMgI2qInpgy
         LFbEbVm09HssVwiLyTQepmLGPGoptYeNLFbFDdr1C49zil97ClF3H/HB+ZcGDfg5E8mj
         C85pQwXuMVBdcxI0bYp9vU17RkljRQKPMTW1wzotXK/0hIyaTPYbwIaYRfC1cysKhF7d
         9tR92YIduWuyBD5HdXMxCLB6ifSL1vNLscwb/HJ4PHnzz7Lv6uA+pnKEW7wHw7dpoLXZ
         Q7lD3lTnmjeMM5/3Gc7jkIa7HWBBLxN+ukTS53xfh6XV/fsU4PWc4a3Yd0an7cE0Ee+S
         YqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778234476; x=1778839276;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mYVViA5lER/JWv5LGE7unDaZDBq0499CdgqNysorOsY=;
        b=qle28+2s+72+10r5CpOrWztXAcW5VucN2cdGosXPC4NePW41iDFA6slhTBXcA5FE3G
         WBoA+l0H5WrxIv0T8rdIk/5DVDfAOc/Jv4AgVgDTijQ3Rqblmf1tg91UDhq0Zca/6rVO
         oWdyiFVMwXG1fPNcrtKL52jyIcj/ltjUPWvWX0BtjCCcUvhLolEdEMyvcyTx96il63P+
         f5AX9+t04XEDuCtzDHj+cmK7KC/zUzWtexNhvFXlc4+EVOte3tXr7sSW1XPWMN0hbhhQ
         wKoM5xydSPAlZPv24sB33IV8Vt0mXL5h4P1ddXcg32oOSSsIMU7bJ6l59j5u6NJiWmKE
         Rppg==
X-Gm-Message-State: AOJu0Yznku8okGcDW9CtGULZx3s9f91ZJihbvkDOGw1o9vin6nn5MfGR
	zYfiL/83BI0rrZqau1393u9jzyiQ2xmwaaunH9rEoU+OfPQmblcXAbMEd8z41Y/jfcI/nSrA2RN
	c6lJXNDvTsEfXuaMJVMx11qIQixdSuKcmTzRC67kMw17M4rtcw+n4Ivl67QO2Dn37lQke
X-Gm-Gg: Acq92OGALTNuZowbiOrPwUC169pfeikCLU2Sf0FeqJGi0B7GRCq5wQVbr0jiY9Lcn4c
	0juNjhSrOftNH8cBgZo65YxaJ5wQB0Mx5YEQDfPORQoIhpQ4ODdJQTqoP0T41lCAs9LCFsonrRL
	L5bWjg8P56P/vpCWxvu9IPfqsLCLxZcgFTyPQVRS2bnJjWUwAQ2oZ0hM3z8OtdX8S46QGdq4ngr
	JRnwKG0wWhOVGUmIU3Weu1IegCen6k+9wPer3FQfGG428LDIrqBOSCwpbCHbA7m25hWRh6EF978
	eKRjGWc7NiUQyUxSLRuosJXpqv3N1CrnvIFsR5NFuU0+yhD5K5nmXY1ATEImtqh9174DTiyLTn3
	Nz1dP0tBLVFHr/8KJOSissPocU6sHQ5ibpnYyasIvJAiqlrtBhXgKNUaY1LnoURq74x5Jr7NP3k
	iCJ3g=
X-Received: by 2002:a05:6122:6214:b0:56d:baee:40 with SMTP id 71dfb90a1353d-5755cc74085mr2303784e0c.1.1778234476405;
        Fri, 08 May 2026 03:01:16 -0700 (PDT)
X-Received: by 2002:a05:6122:6214:b0:56d:baee:40 with SMTP id 71dfb90a1353d-5755cc74085mr2303743e0c.1.1778234475956;
        Fri, 08 May 2026 03:01:15 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac3a7f89fsm60530266b.29.2026.05.08.03.01.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 03:01:15 -0700 (PDT)
Message-ID: <2c43e6e3-979a-4413-9026-e6ef28acd3a7@oss.qualcomm.com>
Date: Fri, 8 May 2026 12:01:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 26/29] soc: qcom: ubwc: drop macrotile_mode from the
 database
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
 <20260507-ubwc-rework-v4-26-c19593d20c1d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507-ubwc-rework-v4-26-c19593d20c1d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DZUnbPtW c=1 sm=1 tr=0 ts=69fdb46d cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=I54dV6YZZfg9ki0ab94A:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: IY1IjfqsYDY5zpatUY6h3H5nTh2ndE7_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEwMiBTYWx0ZWRfXwxsU8m9AjvkU
 m5YT1usRleazl5pp0kinq5h0fUUP4mGkHHxg9UrWDfgBSjDGqqoKI8EsEe5ayxfSrsmEgLbBKi6
 zkHvtQHPlZIGo0D++CWwp5nsj0/XLaO6VOBMyPfzBvISP7YlXoAehtHb7AN6kCT5CuWrDaB8gb4
 SoKMpL7WqCV/01xmEUwtIPrZDtuKvtJwaGIEzooomYzgUvcMS/6KCxFXniRlavtygIMP2W7lS9v
 8gcqdfBObXMiQiGogFWdGjw/Tz2syz1iurwQ2uVQS0G67uqDyqfFht+VEKBPUjgdRmb/kOK0TZ1
 G8097L3PtleRcxCG3b8zc+F9YlOpW9M4f84XdFFyVp2lMsIxuVufU42kWiG+KYebgX1K2TNUCcK
 MlM3G1u6SrKSgo8JqkJrdZUH7fg0GDidgpdl9/T3H2JD9vULfDgkvyzYdq5BiD0umZM1LRL+gg9
 1e+Xn6ASJN5yQnwhznQ==
X-Proofpoint-ORIG-GUID: IY1IjfqsYDY5zpatUY6h3H5nTh2ndE7_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080102
X-Rspamd-Queue-Id: 3A2074F4B54
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106626-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/7/26 3:03 PM, Dmitry Baryshkov wrote:
> All the users have been migrated to using qcom_ubwc_macrotile_mode()
> instead of reading the raw value from the config structure. Drop the
> field from struct qcom_ubwc_cfg_data and replace it with the calculated
> value. Split single UBWC_3_0 into UBWC_3_0 (no macrotile mode) and
> UBWC_3_1 (with macrotile mode).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

>  static const struct qcom_ubwc_cfg_data sc8180x_data = {
> @@ -89,7 +84,6 @@ static const struct qcom_ubwc_cfg_data sc8180x_data = {
>  	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
>  			UBWC_SWIZZLE_ENABLE_LVL3,
>  	.highest_bank_bit = 16,
> -	.macrotile_mode = true,

8180 should also be 3.1

with that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

