Return-Path: <linux-arm-msm+bounces-78128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A307BF5806
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 11:28:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DA79434B80C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 09:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E197732B9BB;
	Tue, 21 Oct 2025 09:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U6zX7j1V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F07632B989
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 09:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761038879; cv=none; b=hUTbvazv2BA+DlgDhi/ucd8HrfoU9ZkJdEKT0WpfS9K2OoWebl2iISm2rcgGOsL6uNuLgkp1oO/jCAEc28Md60zBgIYZtbfIKiPDO84f18sW+chflLwvfWzLgA4iOAFAH9SAEkYgAm66Mllumi5zLBX8b4ZoGDkvhsq+cnBZFNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761038879; c=relaxed/simple;
	bh=jr1ATh3mFN1Fz67pSymlfb7tA8VWXEqzYhWpbE/WI48=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=BS1K6qHcpdMbqafx9FHGlDMsUwyt2+UZ1iqozF5D4n0wJXbdFKxXc5nfZzxsTL0Qx8ovqtliOt2ZZSXH47DR5xoBFodU8Q2DZhN+R2OvwIeRuH8SNPEWECaEVC0+NjuGxfqA8rL0/5MGxSP2vm5rMrb547pVLfDlwkutuReO/lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U6zX7j1V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L87qXG027407
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 09:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YfrbI/XJEDAcD/07p/XyDCO8jd39lqi6bwsbDgQdlYA=; b=U6zX7j1V/d2Rh7Ly
	2Ucjxh8n1mo7kJQssHUBoBefel67xZ9CcHRwvQB/Bc0NgvUZ0/7dtjv+Zgl8D2z7
	xHONvJUupb2liwWMk4uJX28wfPx3hiJvJeIdUHGOW9n+A9bo4P3Pcsr6UihH+Fx5
	1JWnbd5Y6zFRxqXtxXSPWmryDS+8DYjJ7O3/BMdUQdb/dxVzpk+YoGBdYMRoZuEz
	MUJDd0v7ByXn9Kis+2oFNhwqG+7MB+SC/IPhl5+lX6cRLE3PFN/DIJE1c5fGNYdZ
	hV3lCMpEwynP5+cRTeXDhlaSDOTPvxTqmMzz9kk4vRwH1drPMZWbnTzCV11M2eKg
	RL6zMA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08pgdfs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 09:27:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-88e452b04d5so175994785a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 02:27:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761038875; x=1761643675;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YfrbI/XJEDAcD/07p/XyDCO8jd39lqi6bwsbDgQdlYA=;
        b=HGR95TCSqqOTanGgnvPVI55R8o3IpPRC72oUlhASEUmsO22dzdX/sGlhpnpE486Wmb
         NTvJ+Sbm/GZEXL0pL86jgsvBHOplJbbUwRP0qWWBNOIunQZdf3Ao8cCNNLCfWgbuK4oz
         Q1ip8VDR4xOloEJwGy1MvitgfVMkc7MHMN4BWiv0t0GSnEib4TIe6Y9MyVy+OkjJfEHm
         hLzPpgJG8+qwAzj10k0vR0hiP2+CGh+aIBYUxoeVOPNsMfKYo7NLCIaBtEx2Q+5y7Cz0
         GtrKDS0pOdApM2QnLjZ9kVLSk0bROavIPbG+T3TreZ3pYTKzxtlwQwaixAc94acxVo9s
         8kSw==
X-Forwarded-Encrypted: i=1; AJvYcCUTYs+JCqcwb1R6g1oTrA3KFTgdw84QS2vMCNwTa0F+qtoSqY2a+CAxvPK4e46itlNQjpTXyzLg01t+5im1@vger.kernel.org
X-Gm-Message-State: AOJu0YyFz/AZsNOkZ8dvnE/ILx3iZljI9cfIEwYu0yphCryOO4c/xYkN
	XQ0RoqlNYkLpCbRz5bHtzIN1NOQ+xE9YsAzMq0al/qU/tEmTigYINz+N8z5qtnatyhdrMIXWzc3
	0qlV3/Fx8CbjmupFNCZUNdpkkVjbQSWu5rM0lB5+q458mxYOY9V5BWf6JLX33Lwizt4ue
X-Gm-Gg: ASbGnctYzC56haordOtTfny0Snlu2wU1MMbFJYKjyXxzL5T+WFmXBqC8eSi0O9ugrfv
	uUSseygiO9BN4SGExrcDqypwdDj/M8FBDaWO9TwbitZq/a0pUNrZiZB0IL1UiSGWyQT8PUAICHC
	IlMhIRH6lwIjJUZZWzOPiCBTEESqKLV3bI0EHiZ8Ft78ayfzs3sS3dSh/ioJO1VPaaWp2OTfJ3i
	fbfSe/KLDxiisP/NS2EzL/q2g2usyOHzWHXKZD6tEnwcA06YfyeVnmQbuzJ4zoHhARIa282Ppfs
	LOnDUq6+PqPB/xqAMShh/JCRoAOG60wSShozpG+TGVfSVQITnrXFC5FZ54tgq/izzdFsmwVdL49
	xHyJQaOD2Sjt3IUrlayxjCWZQan+u+2Ua1HUZtUefsHSd5zjDG9c/Vni/
X-Received: by 2002:a05:622a:450:b0:4db:1bd:c21c with SMTP id d75a77b69052e-4ea117b0e6dmr18977191cf.12.1761038874724;
        Tue, 21 Oct 2025 02:27:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFinwYQWXxrRjluTj8cLkak6FzinIPonTbmJID/BUM56PasN4UGoEM00cUsgGx4bU/4sp8Yug==
X-Received: by 2002:a05:622a:450:b0:4db:1bd:c21c with SMTP id d75a77b69052e-4ea117b0e6dmr18977071cf.12.1761038874189;
        Tue, 21 Oct 2025 02:27:54 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e7da25d4sm1016938266b.9.2025.10.21.02.27.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 02:27:53 -0700 (PDT)
Message-ID: <89150929-873f-4d09-9cec-727f92572d17@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 11:27:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] qcom: ice: Prevent client probe failures on unsupported
 ICE
To: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>, quic_neersoni@quicinc.com,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251021040337.787980-1-quic_dmukhopa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251021040337.787980-1-quic_dmukhopa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX6jpu0yK/ZcTC
 U8sUsRlHoO3/VhGw4evLRQOOddfG0cGDUEQAfYzS6Bver1hGQxFdiVSs+i6Jc+9i9VHYBgUhk+F
 wUJzXD1/uzVsp5emNBLo4mSUpHdrQg0Y23vBu3AExWV8AK05t4J6X4JqTtiL1+pszYyxZFQoXWb
 tBFaeq01m3NMaQgFpc200p8M4O3FakUssG6BiX4jp+c/qw5uH5U9M2EagD+xDBADWjwGb4rI0CR
 AJ1djQiPp3HnRRC4PK16MT3ilWS2Br95+4QbQhelp32vYCGuRKFXWwT9itobRZzwSIRV6vFx41s
 iZmB2lzqd/r+zj+he3iIC61Agr5pNQfLeBF4RHH8dj/p4i1YibwETvgEzCAkvujmFu+EXGvLMfm
 wxgzUT0ROfGJZYaAbeUVmAAQYjmw9A==
X-Proofpoint-GUID: qZID9wntXdo4DlTrPdaIqqvJshr7mDVS
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68f7521b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=-Y4A2yJOX9EHAnGLR20A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: qZID9wntXdo4DlTrPdaIqqvJshr7mDVS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000

On 10/21/25 6:03 AM, Debraj Mukhopadhyay wrote:
> Storage clients (ex. UFS and MMC) invoke of_qcom_ice_get() to obtain the
> handle from ICE (Inline Crypto Engine) driver. Currently if ICE is
> unsupported, the return code from probe could prevent the client
> initialization which is a bug. To fix this a new flag
> qcom_ice_create_error is introduced which caches the error encountered
> during ICE probe.

Probe currently only happens if the ICE node is present in the DT and
referred to from the storage controller. What does this patch solve?

Konrad

> 
> The qcom_ice_create() and of_qcom_ice_get() functions are updated to
> return -EOPNOTSUPP when ICE is unsupported, allowing clients to proceed
> without ICE.
> 
> For other failures, such as ICE not yet initialized, the existing
> behavior (e.g., -EPROBE_DEFER) is retained to ensure proper error
> handling.
> 
> This improves error signaling and ensures that client initialization is
> not blocked unnecessarily.
> 
> Signed-off-by: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>
> ---


