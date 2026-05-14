Return-Path: <linux-arm-msm+bounces-107592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHqFHqPDBWpMbAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 14:44:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D8513541D66
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 14:44:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AC745304BCE6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 12:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DA413DDDC2;
	Thu, 14 May 2026 12:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P9O0Crni";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kQ0v/blL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374502DA74A
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 12:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778762647; cv=none; b=r3w3i+a/HEet1K3Z+86LIYS19fLuhgZbHqJgyKZ+IZB6r+wee6Fq/jb/A4mWM8EbCZ65c4A0BrBR2pqMk9aiOOsc9RaGHQF2MKoE4xLRMgKcz9ATCw+MUEyx+gIqZ4yE7XUwLkZ4OzBoyb0pNFY6raj7cpuvbt4cAwf0fo9govU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778762647; c=relaxed/simple;
	bh=DcIPXR/xIFPytsBGJRYa6g9YSH+zqLKVAKufUlxLhYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I/4g3P8E03fcdWbG3IhA6E2C3C/BWT/GtDndpN/6bD8ykgpioYfW0hNikdo6mS259Mri+phtxYk/F5j/EmUcbOzxJ4FC1lMTZ7D4XF200j3SJ8QksC4DuNmZa+kMSwAPM4HigCPn9QOWqwzOManQswNrbj+QZ8AGYYvR69DpxQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P9O0Crni; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kQ0v/blL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeWed2554571
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 12:44:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rAvsMuwZV4ckNzcq8kycV+c90RKc2YlbhdiothPSIhI=; b=P9O0CrniShmq3Pj3
	iA3WD2SZI1Hycq79Apgxw1n9nuht/0Fgw+utcmQggHJkn2eiqsVoJY1qSiV5zEgb
	LLF1lBFVB2vtjBwsIpDrIvlCv5tL+5Vsw3HWBAn/9v3pMn+NiOKf6m31VUtp2qDb
	XR6oSmqq5fhg+QpNWHXbrEB9LlYmmpVEi4pvP9NfiBRCjyuGC/pzUXOYPklNnAj9
	p5Bwce3oS79TsLxZnX5MZUjSVz3AuXSpKb0eg70Z1a85XSHCMDNWJ7TzVR0al0DY
	PvkY099ekYKVzFO+8YtJPwF2lfxAAVa/TVTMD91m9C90j/40wPOiABA6llH9PS7l
	QUB8Tw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5b0brsbf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 12:44:05 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-63126f42441so548084137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 05:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778762644; x=1779367444; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rAvsMuwZV4ckNzcq8kycV+c90RKc2YlbhdiothPSIhI=;
        b=kQ0v/blLbx5M43ZmBcW74qtw+3/ERmzs7cr8EWbA1TxmSTkNoHw1u6VsxpfLKXTQKA
         8GJ1cz/rSB0aJNMjRaIp22IqwK9sTEvVVcMqNEuGHeYQdicPh0yzTRAqlrZYQCsvFkui
         ZRNN8p5cmPG00yqupzkRcWcAd37dvwNxqkcVT2LWRpjjHNGf6PTxRcW6P32bBsrbdI8r
         H3+QxOjaf8ejaMagu7Nv3s+5MhwCKwPpcTkDNPoVwhouf9cfDxoj0GGeB6GlMwqO/1t2
         FiStzh46OhQQjVAH82SdGr7+tvc7IjjlraXSaA7J9bM/KP1fk4wD3abelKmnL9IG4+M/
         95bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778762644; x=1779367444;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rAvsMuwZV4ckNzcq8kycV+c90RKc2YlbhdiothPSIhI=;
        b=Q4G712sDT5N4ebc0P0PomKYBBCra9/hlgIrUe77zeNM97FKgRadOFKhBx8/g7lzkuk
         dc0YpMvmsb7v+N5+pDSKVHp873NR5hR+v9ZOI80OHDTumGR6sqtFTep9Rwfp9tUnfW65
         WADXKNV/l54QG667hnpQhtQoKwlnVw6hEqeHWfwr9dzbEt1JErB2yiGfXS4cwG2CG+gG
         6wTaaAOAkSmxwUdSnpHqRxSMWk35mcJv9hHgjVRuUaIeznKxOaTjEYGiqyOrxAOd2lKK
         FVxlWMc3LqU1a0IPPtdjp3hWm0WuVJOjl2cgxGP+psVerLxqqsMN0e8XeGLi1E8WGfLJ
         m5rA==
X-Forwarded-Encrypted: i=1; AFNElJ86EBRW91Dni8XtnVRn8aeZgLS6m42Dt0sAtq/jJ0YrvNoT5NIhcM3Df0ZaEQZXha6SKgnF1LCmX5VMt9aE@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4rB6RMa4uqE06y1jjvFTi21+yNODQlUlodvH9xlS8pjLzPhlu
	L5WZNxsT2m+/Iv5S1E+H1plE22OpXBXm9CBzV5ool2PaMorInjrTmQHDyN5jfw4mj+bAn5boOqv
	cURQqa8QwyJAq30I84l6lPQrihcok6wxqFEsKZIP5OfG8kh+y53MUNAmVTVj2wn2JGnlk
X-Gm-Gg: Acq92OExBVAEsqJRZYtsePqSkvFcbB7r/GVFzYuIy1jN8QS/KnDgr+JeZt+wxeX8qL1
	yxmmSg5Q+uHWTWkoeaRP66aeYmdKO5t6uJksu7jXaxBehqsHDNl8ahDQH0nI7207guhOPIGt8G/
	9LPpHGEETsGqDCNGFZ6aYlLkF9Q7A6r/o4Gkzm/LNmoQLoDMSIjABUNdXeKuu718yHhI45EPUg7
	AuP7oO6a0NW0qUmoF9UpXpn+ULPywmfn95dF3Eroe3kQAXE0n2NEji+NxV/Q626S6j3jEP9SB7w
	0oyZO4JquC4srtsqtiDi9smXkQo5dPUmpbPkulV0QMZzd8GTLc/xyshPXefkbcA9jLdDBCWLdKk
	sMx/ULnGbBNwXZEGXwk0ShQ0sPSvSR0qL2exiMYPNFBXEcNQpiKdHv6j+cgdU8j5uJy+RYh/oFU
	wLBZ76ZJIBqf8Qqw==
X-Received: by 2002:a05:6102:308e:b0:631:3ccc:42df with SMTP id ada2fe7eead31-637750e0095mr1201550137.3.1778762644575;
        Thu, 14 May 2026 05:44:04 -0700 (PDT)
X-Received: by 2002:a05:6102:308e:b0:631:3ccc:42df with SMTP id ada2fe7eead31-637750e0095mr1201528137.3.1778762644167;
        Thu, 14 May 2026 05:44:04 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c24178sm87039266b.15.2026.05.14.05.44.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 05:44:03 -0700 (PDT)
Message-ID: <f0cd7431-acc3-4468-a2ce-7e44a915472f@oss.qualcomm.com>
Date: Thu, 14 May 2026 14:44:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] arm64: dts: qcom: kaanapali: Add qfprom node
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
 <20260512-kaana-gpu-dt-v1-4-13e1c07c2050@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260512-kaana-gpu-dt-v1-4-13e1c07c2050@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEyNyBTYWx0ZWRfX9gJRvVj9xinn
 GZViFgeKAHEGYnEZgzn75cikIlZ48sevEMilll9SLaZHbYMSk1KN6ctFbvsydbquPFxSvvOIxQh
 Inu/YV/kT5MYtKPxjm/ZOhS9al6rwXgkj28NqQk+EOVqjUCr0v0TFYJPNmVzGP6NuouAcbRijPA
 8u35hakEnoG8HZQikDP3rXlN2ZdqYdqNqAlzheW4wZ4itpAmfm/1ny0CKCBQgUVDHlAHCD9x2PM
 gyKPDkEuiVRpLBfiyAGraXs9MeiyteJSFCKQ/oRnh1qF7Jon8D8dVvfqTJEgntSphgAVXbNxrMU
 pJ2tBQohB53suSvDlWXx1zwHiLgig1SiySIam1alZAJymvPYSZ7uzT1IUHtz4TJ3oUBkPOfMfoA
 OPAZiWFcK+creAnxwjpj4Y68Hc7yyETvmAdCUirhpoMSAzMzj4Uz7uJ2RaIO+D7gKs9mPPmTD6X
 N4UMbXJYO51q2J+qMHQ==
X-Authority-Analysis: v=2.4 cv=b+2CJNGx c=1 sm=1 tr=0 ts=6a05c395 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=_Tv7ClR51sp9MY50WFAA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: 7bavxuN4bnOx077JCPStbOjmMutrE5S0
X-Proofpoint-ORIG-GUID: 7bavxuN4bnOx077JCPStbOjmMutrE5S0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140127
X-Rspamd-Queue-Id: D8513541D66
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107592-lists,linux-arm-msm=lfdr.de];
	URIBL_MULTI_FAIL(0.00)[tor.lore.kernel.org:server fail,qualcomm.com:server fail,oss.qualcomm.com:server fail];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,arm.com,8bytes.org,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/12/26 12:23 AM, Akhil P Oommen wrote:
> From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> 
> Add the qfprom node and gpu related subnodes on Kaanapali SoC.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

