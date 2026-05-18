Return-Path: <linux-arm-msm+bounces-108150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFbbNQHmCmrO9AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 12:12:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A9E56A754
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 12:12:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5B889301BA56
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 10:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFFAA324705;
	Mon, 18 May 2026 10:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UoBhrUBo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DGoJBMbt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D0B1C5F1B
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 10:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779099067; cv=none; b=Fh6bGfYa4KU3pJ6rNq1mcFv/Mi5uT0rK5rRbQ/+j41+yXrko8AWLsAz8aoVMbfHfSNBveEom9ydrekRKyDtmApw74FjhCYxVIU0gkWACN5D4yDhti5OJ4zH9nrSijw2GijeG2/Sld1EsseK0Y4nh4gI4ceqe+FKFtYc5LuBnspo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779099067; c=relaxed/simple;
	bh=vOpK0d37n7uwbArZm9MneJF87h36WMMxKwaiCUgcXFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p85CerKpd6bHnJXTn4+k4YqkYF/dONlXQHhzqM1YgWznGGab101I2Z1oQv2GHqqR27kBnLU6IqOl6CP4JFjBy5wGi7zzLUP2cSE43SbY1vqoIFu7NYLGVOGGgx43yQQ+0toTIlIwx111YleiSOxg2gwNsuUFpJisX3Uh491q14U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UoBhrUBo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DGoJBMbt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IA1SZY3427454
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 10:11:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O+1Lf9eV4YZqdx7I47XP78GSMimosryCKYAL1WX0Oy0=; b=UoBhrUBowGkTEG1r
	C1VBYYcCiGYIy962I4qBvYqv5BKSBIPNpbgrS0w07LNnyvSe3/xraOl2vlehAuiR
	9fO61lp1ljU7aRIAil4Bm1UvMXw0cXSF9TfBIuyJazlw5ZhZBRFNytINTW16lEaC
	k24WPT8uUlizJn8oivNdeCBU7D5fZTWlNmfV3a79cQOAog+e62DfS7pvVahrPi+H
	dhbVtE1scFxE8jVDJy9IqJJDCh5a9yuWzMLR24clRRbltopUhSOkBhkdW5kizV2T
	LQ66htFJ6oP1JaHCmqvedJo2uhfvfdKyEEjGkwKsZX9eiPzeFyS9CfeSlz2aQgD4
	1JD3Ww==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gvqwy9a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 10:11:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d840206c3so8126361cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 03:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779099064; x=1779703864; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O+1Lf9eV4YZqdx7I47XP78GSMimosryCKYAL1WX0Oy0=;
        b=DGoJBMbtvvgQNgA9hOOPj1tXwq72RCUHpjmNiHM56nq0Lh01xNccB8j7sELcN/i+Yb
         dFbxcdYpG/a2O8ogagaCNXZTrLvOyvWknJo4SigMPW9NS3kJ8tjHHq5qdVvpAbTanpez
         C5pSurwpqg+bVMKqhT7BdQrf4VloCtrKfJEzdrhbVm6eLVYd9kcVi2wPYnmoxXIqeusY
         LUoIONKKq9bL9Fsk9aHFax0bY3cKNVJCfI1EGte1SYfOwbRJgVgEKZ28YCGBebZGWqeF
         SzvlwiA2BryGHScL1jIcChnYokzCosKm4Gm9DU9pqXaqlxswrDgyDXwRfllbjehuMdO+
         Wgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779099064; x=1779703864;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O+1Lf9eV4YZqdx7I47XP78GSMimosryCKYAL1WX0Oy0=;
        b=Ceu3Zm4K3dcJVCefLXUZGm5LAnvJasOn2p3Ogb24iJuMPpFt95xtD/QWx+KV7YUV1h
         XmDrQb19YQuKN2po2qmqp2WZ8Vh5Wqh0XC8mID2Ar/uLhOZTtyg0SdDspbCie7KVVNrh
         zYTd0jmtd4LwMeVxyR77E2HQYbcnjTkJHbGqFBb1KND1eA97tniEWvXNibq6w9+i24nC
         VFXE17lGREq9ojlCvbC/zIRS4i4LvSOZ9ygd74XZJU41jiXq2dxXYpSU5jmAtlevsJU5
         ej4qgEzGfypOBoVGVqZmWGKrwF4lUlqtVJ20MS/qDsZ3CUjlPS0aaRSArRM9qRWYOa65
         KEfw==
X-Forwarded-Encrypted: i=1; AFNElJ8pbnJeycGrzzzfQQO+m84ztcHg6iw8qJibRsHXoTH6GpbnCYEs6Wt/CRPMrak9f/RPfN4tmPsfGeozNIz9@vger.kernel.org
X-Gm-Message-State: AOJu0YyxqXXTOP6zOP0DZVaAnRGWFoSu+zL5UJiKEDZ5YUe08GhhTvTb
	5BQFHn7bS3PpW7e0cNVWMCfKH9zZXts820UeeLwvr1XgzRO4o46lLKyAICdu1XL2HIb2N1k/Fs7
	xu+xmCyotfFRQrQ/IBupsNReCh8QP5qNJRjLOSgSWXjtaIkthIekotKLVOIxxEHfnEcdp
X-Gm-Gg: Acq92OGxIL2vXVh2PXIEc5abbUUE3JT0qwgGcOZaXhfSsRZb80m+oRFpowd3ro8LSgG
	zARlxnylHTUH6udamznj88guMuty+0Afvdzqvk/8Y88kKwrdzNeMEcn6i2Srh8b4KmM3f3+23Lr
	YlJpAK2vmi2urT6U9Rb1v+xfByYKvQPJIKLIvfUPLeyLrtHl/7B8/CsvVIaEoLAC0YJipzAh049
	JQpnYKbq1qKO6r4z0aaUKOLnebX2cKriUg6tXs3rfwF3tb3r1tfybyRWXmiB0LoK158x7qNdG+5
	pHYrhA1/3ddo1Uez/xsvwOZAS8iiWX7EAPTxd9NsSNRkJc53ow3ELhtV6lk2v2hxN9m+0ftWRGx
	GLJA9wDXE8lDYcGaGRgftKtNIuZko5PmsY5I6GFcL4UX+sHzG8ieMqYt44HmKcm8M2s61lglhpd
	W/3yc=
X-Received: by 2002:a05:622a:594:b0:50d:9138:3322 with SMTP id d75a77b69052e-5165a22d136mr145842691cf.7.1779099064220;
        Mon, 18 May 2026 03:11:04 -0700 (PDT)
X-Received: by 2002:a05:622a:594:b0:50d:9138:3322 with SMTP id d75a77b69052e-5165a22d136mr145842301cf.7.1779099063675;
        Mon, 18 May 2026 03:11:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6831197bf00sm5085669a12.31.2026.05.18.03.11.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 03:11:02 -0700 (PDT)
Message-ID: <235b0c91-57b5-4c1b-839f-88cf9a11707d@oss.qualcomm.com>
Date: Mon, 18 May 2026 12:10:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Fix wrong interrupt number for
 i2c19
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260518-glymur-fix-i2c19-irq-v1-1-7d5968bd9b2b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260518-glymur-fix-i2c19-irq-v1-1-7d5968bd9b2b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yIAhDhnsXq-XtAKtPgr_t2TjEqGlg_jI
X-Proofpoint-ORIG-GUID: yIAhDhnsXq-XtAKtPgr_t2TjEqGlg_jI
X-Authority-Analysis: v=2.4 cv=LKJWhpW9 c=1 sm=1 tr=0 ts=6a0ae5b8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=YFrQUJdA0-VyeVoQsyUA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA5NyBTYWx0ZWRfX2pUsXa/cvtSh
 t02UJIK9jvQfSQVwkg00pASWJM4rAfZpJx9SVj1nDy6nbWVNdG9IdGpAxCMd9MfaA4KaSM4uhFT
 FIOkvd1fSh9jttIS+ZHEJcQSdeYq18PKsVn0LRXkx07bN8ZJ/Mwla4P5aznpyN/0zBLMIUsY4GC
 6WuVYzJFFQBWbo8wZdcr908ebSgUHt0rYLrJHJh7VGGYkKso3ljoEjNx/ipsXqv6MjX/4QhmET1
 XUnEPcLjD98Qo6u3fOBcVv8BDfCmR40iRF6xnQhjPASMkjhRT3lyxHgZaG7K2wk1zwbMxvRlJip
 LfXRNMIpRcYlK4F6CNIfqtPhrZfTQdPXDO5CrdnbKhsN/EiS2xzUYvRxInt4OKS5ZgZJHfq33bj
 cIBEDXkwxzDUeVB3PmRDhROq4WdP3+kJUE/Hx6yg66+XW6sBsbdEaDST+ftsNcV8BUuhfcgi+OG
 VEbNI42rRl7o5Gqz+Ug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180097
X-Rspamd-Queue-Id: 57A9E56A754
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-108150-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/18/26 11:52 AM, Gopikrishna Garmidi wrote:
> The i2c19 node at 0x88c000 uses GIC SPI 584, but that interrupt
> belongs to the neighboring i2c18/spi18 node at 0x888000. The correct
> interrupt for i2c19 is GIC SPI 585, as used by its sibling nodes
> spi19 and uart19 which share the same register base and clock.
> 
> Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

