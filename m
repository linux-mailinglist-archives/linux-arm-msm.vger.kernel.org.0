Return-Path: <linux-arm-msm+bounces-51334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 766CFA60626
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 00:48:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E95951890C39
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 23:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84BB71C5D59;
	Thu, 13 Mar 2025 23:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dwGqZGNB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C581F3B91
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 23:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741909730; cv=none; b=Sfz8x6ITAP7e3AGew9Bp/Yhbfx9VXqpDgEvlMVhoya2yOLkqPM0ou5/VWHUSONJvheWya3ijcmVqO21xzlcrpbDE51dWTSBhnMZxsd0SFF9gMhOVNX6XfZlRlVoin+a1mdq6EsZCh8pIenxXBk4ys7BImQzrel3ZR87xOkEr27k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741909730; c=relaxed/simple;
	bh=0lu8oU1tyqYj57FgsKOmobIAzRwBp7FW+RRAsiYBpss=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tCEy9dFjAHEHYJ5enXbVQIu70qeBO856ZJMm/Gh7cPSgp1dZn/gg8kmCKWadi6qZkPUj3/LqJ4spUQpS54ZRiCggKqa5qEANIERiJcAxz9k00yzzk8OZ6VdVJxhs4SXqKRf5s3u5ltFMJz83bnOc2OIrtg3Pne24oZ0rOHljClw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dwGqZGNB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DKdIF9015977
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 23:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zkd/Jggqn86Uyh/5JzZQRlmlyi5xVymwBZ1NTqzN0CE=; b=dwGqZGNB2o/W1vhD
	lMvadEKnxYanIo9kqSUDcDRjzYmf0TZceWIIFAN5IMf9GLnu0vKfBl3PmMir/KAk
	WlP/r2ERc2k4tD8cZEiRtt8U6GhiW/3HsZAfKDfDxREL6QCLQJZumrxiCZoUrobj
	pPSJMo/CUvLm3P7FqRGHPp/lUzAaaD0iIqgbxHEUd4/4JGcTN2GOIwGJM+Pw/Y24
	/IjsOyMx6/5dwvtNvPO93+76BHj4j8w1KpQldr2S6nNQXj5cvMNNm1fjqL3bhgOJ
	7VUI9ZyZbtkc0yR2cfQX6LW2QF7I3TlWpXNfCgJDt7E7kXr0g2A23DXmkNyrdAsY
	oWs4Hg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2nyg6v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 23:48:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-223477ba158so41892045ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 16:48:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741909727; x=1742514527;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zkd/Jggqn86Uyh/5JzZQRlmlyi5xVymwBZ1NTqzN0CE=;
        b=q02FUW68VhwsTNerZv06UyewVqQ9aNOL+d9QsDILZM889Qb2ec/m5m2tIWSnSH6PFk
         b0S5SNejpT4j9GEulipn1uYm66db+MSmXA1Ecb8wLVhVLZGokXh0KfifQpmxKoGoU3G2
         HlWqbnEa1Syedi8ppiNL6FhLv4csAesJ0u4Rn7gThxIUacgnyvqUhNZoJDvN3big71A/
         AeI0RLETnoJxpQcVnZOBGskYIf5+Mru/c+lQEqyE2jxbdDJiHUaBPhymlxDrzuw5BwDE
         h45JcDJN2IF4F/GSMEu9JZFN4uoDaVPo+cVp7yyhH2IbhOf/0g7zeFR/lir2S+semG+E
         +S5w==
X-Forwarded-Encrypted: i=1; AJvYcCWszcdAREbhZdChT4dLWDbIXm3TzRxzW7sETyJyo3xNAzn+tJd7WFCOYC0fOaXB1UT/0MvnP6lNrnXRJgUl@vger.kernel.org
X-Gm-Message-State: AOJu0YyvXb1I7xBtTYc15Lhd3RVGFBP6f6zJ491nj0QRkKYCreuSpatG
	NBP+8tmma3sc2lnBSmRJ9L9tlOOl72EoHZp6CWcUz1rbNlG0wSIQCUm+daug4ahRBZhxV5NVn5f
	Ukk2Xt2hP19at1gHL7GfbHAJfWNd8RdLGb8OA7471dLcCwRYyCJAkQMEAOSNxjjJz
X-Gm-Gg: ASbGnctikGy5wuvYDP9fvkJFQMotZHd5ZGLa6Ii6hCMz/zh4zEW50YueBVZNUCeYkJ9
	hFfq63tBGwT+6yqhC238zgO/AO0Rbev+0oN87WGSp2TYiNtlC5YUBRmdcZikCgIkoDOqxhinKO7
	iKI6cILBEAq2ev6C2TtArnfyQR6v+2YqLPr3c4G5NUqh2YvhzRI68u2fZWKqsrGWgVl+XYfjC+1
	OrbL9Gu6ysj+Hsv6aMhkHHfYyoaaG51MsgH8GPlKu24ALhuN1kO555sE3Wd53npmBcKhrvju0lQ
	o6ovpFrcVblMSw1ijbN6Hs5G8+l99RsbayYbGTV2sFOj1rHxxODKaA0RH5RmLPKwS/oMx98LYwH
	GRBND87qw
X-Received: by 2002:a17:902:ecc5:b0:223:f7ec:f834 with SMTP id d9443c01a7336-225e0a840camr4626055ad.31.1741909727067;
        Thu, 13 Mar 2025 16:48:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcphUQ8UCrGDx8Md02DmjuseFiFZVhQ2qPU88RhdsaxrxfnuW+c53+Y3w5UiXV4O9t74jPcQ==
X-Received: by 2002:a17:902:ecc5:b0:223:f7ec:f834 with SMTP id d9443c01a7336-225e0a840camr4625785ad.31.1741909726725;
        Thu, 13 Mar 2025 16:48:46 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68887fcsm19356845ad.39.2025.03.13.16.48.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 16:48:46 -0700 (PDT)
Message-ID: <2654f986-eb8b-430d-b962-8e77d9e11826@oss.qualcomm.com>
Date: Thu, 13 Mar 2025 16:48:44 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/10] PCI: Add function to convert lnkctl2speed to
 pci_bus_speed
To: Bjorn Helgaas <helgaas@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mhi@lists.linux.dev, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, quic_pyarlaga@quicinc.com,
        quic_vbadigan@quicinc.com, quic_vpernami@quicinc.com,
        quic_mrana@quicinc.com
References: <20250313171637.GA739165@bhelgaas>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250313171637.GA739165@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ztzMUFM8Xs1kqYeHua0mNHJwZyISO4Dr
X-Authority-Analysis: v=2.4 cv=ZObXmW7b c=1 sm=1 tr=0 ts=67d36edf cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=wUlHnouiQKlN4MMnk_oA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: ztzMUFM8Xs1kqYeHua0mNHJwZyISO4Dr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_10,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=751 mlxscore=0
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130181

On 3/13/2025 10:16 AM, Bjorn Helgaas wrote:
> On Thu, Mar 13, 2025 at 05:10:16PM +0530, Krishna Chaitanya Chundru wrote:
>> + * @speed: LNKCAP2 SLS value
>> + *
>> + * Returns pci_bus_speed
> 
> Not sure how strict kernel-doc is about this, but I've been told
> it wants "Return:" with a colon here:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/doc-guide/kernel-doc.rst?id=v6.13#n142

Yes, patchwork is flagging kernel-doc issues in this series.
However, there are numerous pre-existing kdoc issues in the MHI and PCI files
being modified in this series. Just look at the patches with errors being
flagged in patchwork (including build errors with 06/10):

https://patchwork.kernel.org/project/linux-wireless/list/?series=943497


