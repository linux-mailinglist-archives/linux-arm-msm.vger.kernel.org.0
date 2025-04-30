Return-Path: <linux-arm-msm+bounces-56312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6E2AA51DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 18:43:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F0AE4E6CD1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 16:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AAC32641E2;
	Wed, 30 Apr 2025 16:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jk/Q5dEq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F85262FE7
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 16:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746031424; cv=none; b=qyqPO37RmI5/MYm0E0amSUnyOzoujVon3vyT009kBr9ee3RINDb08++NmAQ5vlK1t2Qm7e0Dt/HYWTxeAM3fVr9hLNiDACb/M6JcPe9e69xet40LT2LAsafcIiBnkfGv03r0scXlOCjLLVK+cMaE3pJIYnxBh6MaxYAoPo6bOn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746031424; c=relaxed/simple;
	bh=+UxfhgQiYyfYvQmBeh4IU41/OmeHbMBkc5DfBPIEI3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FAns/QCU4QWT82EUg/5QdNRLtu7kZqI5lWo2fh4ElPEfPhPwXQovbIK0osHQVj3t76vnNpKkxi9uD0gAfTwz8Up1OyntK+v8ymaD9WKu0SlgfCx1pP/h7J0ZupR0Gd8xq82MyZcRinFHMR/O9/OtoM14HQFQUawwH4UQp1Omqr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jk/Q5dEq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U9V1wM018249
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 16:43:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m8gechZt1FFMmvPClarUjgPBXpccO8/uIU+IaL+lEqg=; b=Jk/Q5dEqOZ38oUAi
	Z2vIDqnZXUD9/g843JoICwAxjXU07O14bYND0HsT+FP6uBwthjrCm0eLUZdIA+DG
	GZdKxpfwtr2bjCtsgE/NmwS/j3Ec0DTWELlQoGA9Ao01AWaHHAqftcgsGf47mnus
	3tMhdafHp/4R6Kds/yoB/GbIrDgov8qp6wkMcajUDo3jQ0ojnU6kl9adquglgwrt
	ArxPjtfOEVIws4k6IMw0nOF66WTrcoqjpRbi87p6Te/qYiXCk4c32AWhrqLzhL9N
	RiaGO01BbuAgxW7Adwge+8smE7G/6zjioni57Q09RxJF3XUKnSl7GkFWLB42Rv/U
	cYR0kg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6uaavf3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 16:43:41 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-736c7d0d35aso128156b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 09:43:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746031420; x=1746636220;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m8gechZt1FFMmvPClarUjgPBXpccO8/uIU+IaL+lEqg=;
        b=W28h2CCTTTz1i5aTA3N6QF51ocmvtM+eFQKR1W4HFtwPrky6DOzh7XmPhknLTF0BqS
         XYLR+Rcx9yvyAldiykPJEdWf2v1ZZ6LjiI2tqiQ+sNugSQJd8FBsdg+ubI3cKcnLKTTs
         Nn0wAp9hNIMdz6Fd3gj8fkdfE1BoEMT8+HpWt4sHP1wbarZ1lRBSAqVxDaJWnL+75D6k
         gW7h95yQV0jDXsrhV8A/TUacFjyeKkqsxB5AQvDNgKz5hPVaERaQuB23wrgLSqc4tH/E
         moYkisNU5c+x421k1py+0sRqv+t149+UbhUDLMvOEkuV/qCx5XaKMMjcjzKsZxX43iof
         na6g==
X-Gm-Message-State: AOJu0YxqYK7y1Qmm/Bd3uAW+NUxn6qCy/WLrzNztDz25EcViSRiC6L6g
	0bmlgwwncrxOa3Ot7zHS99wzR+GFieSWOUmBJ0IQbVFYDmJzHwEbjOtACXVvNDVs8+rYJf6pkZm
	US5Q3TAP32+S38P0oI3EQqnjT9qnPshn/2xOLGj6BhtzeZMQP2D63VE6F2sqOxUgA
X-Gm-Gg: ASbGncu726PccPKUqk0ZX+2lj+I7SX3Xq8qEi9vWjx0RD8hXE8vAKMCV8KUzT0A0jWP
	XwnQwhTw/VBxJ9eDvTL8K2gzKLy/3+6xflJ/UhgwJpz4L+F0j2pb8gygYkyEq7jcFtm8DXm+HDn
	qfyEWoWBj9CORgJq3DZk1Af1mepKDcP96qOiqPYdHI+jfTSZSTUVN44ExaGEGta+f7JV33sBJ6N
	Ooq6Ks0uq07sUfCXatuKaZw7yYW6rziTPCAfwknZyks6hzjsmsb84O35PVSvdLXM8Ymg9fKRC7o
	10FswyK/+dybt6YBphhnnx17fHcKrZYy8zniV550LPx9SQMQ3p5o
X-Received: by 2002:a05:6a00:1814:b0:72d:9cbc:730d with SMTP id d2e1a72fcca58-740389c6d3amr5637536b3a.11.1746031420659;
        Wed, 30 Apr 2025 09:43:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfvM2n/WCXOQfmCAt6vISRbV46zytVPmlHBi42n3e9/Mr/zp0qmV/V+dD0IhKtXBh3vpZs5w==
X-Received: by 2002:a05:6a00:1814:b0:72d:9cbc:730d with SMTP id d2e1a72fcca58-740389c6d3amr5637514b3a.11.1746031420328;
        Wed, 30 Apr 2025 09:43:40 -0700 (PDT)
Received: from [192.168.1.4] ([122.164.87.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a5c25esm1943084b3a.136.2025.04.30.09.43.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 09:43:39 -0700 (PDT)
Message-ID: <52c249e3-3cf4-492b-a22c-f82caa3bcd73@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 22:13:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Reuse the IPQ6018 QUSB2 PHY settings for IPQ5424
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250415-revert_hs_phy_settings-v3-0-3a8f86211b59@oss.qualcomm.com>
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20250415-revert_hs_phy_settings-v3-0-3a8f86211b59@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BNizrEQG c=1 sm=1 tr=0 ts=6812533d cx=c_pps a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=wj/iefQKNY9P1RSDfSoyGA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZGpNPYoN0zUfxpdBiG0A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDEyMCBTYWx0ZWRfX8Xzqszphe9mA bYg3ursju9o3cue7F30/b8DywSpfiQbtDWIfpbHDT2pOGsXsTwW1uh/YJqjSldh41YZVX2dN+4d /wU1j73/gBkwUYna7F1obTD2lI50g8e0ax2uO0femm0SG0xVNY6VPDxF3LeXLAj3qngaaF1GdK0
 Mh+26aBK7F3ELeP6kIONio08//e2wGKz0Y8Nftirr9zOIGt5t9589VFgJD0T7xlxtrQ/gzF2U4J YoRZ3ARLh7ATwgTnFgTdtp24CyiyRKGI2aCm2cTaWyVynxdmxE5xv72oCGmbt0j+50PW+BelcKL PEk7UL0EcDn+rfNM+XAIS+PiIulXeGG5d0zcv+dgAwa/rS9tXOaTfd4oIfohKzQara3jLWzD8jP
 9f83a+9HZGWhJMEQ/wWOkR9+irJwAZPlxZOWrUZOueu37DhrZvsfp6GL+qeNEwoLf14dZzuo
X-Proofpoint-GUID: u8lGxzcm0bkwwmOSxebaRwB_cpttb1Rk
X-Proofpoint-ORIG-GUID: u8lGxzcm0bkwwmOSxebaRwB_cpttb1Rk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 phishscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=771 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300120


On 4/15/2025 9:52 AM, Kathiravan Thirumoorthy wrote:
> With the current settings, compliance tests are failing, especially eye
> diagram (Host High-speed Signal Quality) tests. Reuse the IPQ6018
> settings, as mentioned in the Hardware Design Document.
>
> Merge Strategy:
> --------------
> Both the patch in the series should be merged together to avoid breaking
> the USB feature.


Gentle Reminder...


>
> --
> Changes in v3:
> 	- s/complaince/compliance (Mukesh)
> 	- s/design team/Hardware Design Document (Mukesh)
> 	- Link to v2: https://lore.kernel.org/r/20250414-revert_hs_phy_settings-v2-0-25086e20a3a3@oss.qualcomm.com
>
> Changes in V2
> 	- Splitted the patch into 2 patches, first revert the commit and
> 	  then reuse the IPQ6018 data (Vinod K)
> 	- Dropped the R-b tag from Dmitry
> 	- Link to v1 -
> 	  https://lore.kernel.org/linux-arm-msm/20250407-revert_hs_phy_settings-v1-1-ec94e316ea19@oss.qualcomm.com/
>
> ---
> Kathiravan Thirumoorthy (2):
>        Revert "phy: qcom-qusb2: add QUSB2 support for IPQ5424"
>        phy: qcom-qusb2: reuse the IPQ6018 settings for IPQ5424
>
>   drivers/phy/qualcomm/phy-qcom-qusb2.c | 27 +--------------------------
>   1 file changed, 1 insertion(+), 26 deletions(-)
> ---
> base-commit: b425262c07a6a643ebeed91046e161e20b944164
> change-id: 20250414-revert_hs_phy_settings-47643d2c75ba
>
> Best regards,

