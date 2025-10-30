Return-Path: <linux-arm-msm+bounces-79543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB0CC1DD95
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 01:04:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFF3F3B48FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 00:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B457B1CFBA;
	Thu, 30 Oct 2025 00:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AZzOjsly";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EINaNLbc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45145134AB
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 00:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761782667; cv=none; b=DzedMf8g1vlB4e89URLFS3UtT+o56G1IkI5jd0BEcp/1TiNSFA5LcOIRcxL5wwC3Q8xXAnjTssrwVT2lryZpUDPIF2dSoEWnxZIpxgGv4qSLFAdbPh2BJUCbJ3GH8TBvAIiG5RTOQVaUwnBsGcBfnXacNokoKd6fogZu2fzqcgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761782667; c=relaxed/simple;
	bh=e8La3PhKLAY0yqATjn4W+M/31632+mqbSgzSPOUT1ok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YRcCOkHvVzRf60ioR0jhhLcSGbbpuXnc6rp0noU64zYwJNYOQVB4G2g+ZmJPcwGXhHCAhpnBEtAPbH1wmUsa3TsjNpiPLBhaLwAm5Ica7/+vdhCw9TSvvWPP4esAV1e8W/vPEHTlyC44TFiyMWGzUalIXt+/ijlEGKodrTI0pHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AZzOjsly; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EINaNLbc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TGCF5a4135755
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 00:04:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LmQr/nvqXK+zOFXNOeHfnc6G
	NLUHSfAv8AGMrlOSOR4=; b=AZzOjslyn+AP6WLjvmjMX420G6Qvsy/DISlzjLw0
	KWQZA6TKF17Aacb5Yu0QWeHZNnFlDO8+ALvD935093QNgc5fHMGJIQa9rIL42NHA
	Z29JVa2n1aMfQ4W13LLfkdbMt/y1dvpw6dwF1YBoZ/rWD/p1GmOCQwp1HfQ5Y742
	Kbq8EDDEu3XZdPe6vCMQnMU+MEGf+/LRKcx69w9xQr1gpOsKFSoE0JWwS3dgc7ny
	XoiSMn7IWGZ1WKYmmn/RwNEmKx1veRy2eQj8Z0Hpojunh8GOOK3sZ68VXFt260Yr
	EC1bQWqL2WDAVvEfplslbFtQO/q/q7rldwf8ND5+ww72HA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3ff9tqx7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 00:04:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4eba247f3efso7988751cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 17:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761782664; x=1762387464; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LmQr/nvqXK+zOFXNOeHfnc6GNLUHSfAv8AGMrlOSOR4=;
        b=EINaNLbcqOUBfky6XcwD4C4eecPBr93cgiqtbiaJkSw2xbUjZQl2W3BukyjjhzsTt7
         gsM4GCVepkRJdRkQ8ZQv1QQHU9vsrzDeTr8i34QnrKiF5A4J/5/bm/CFXViEL0v+4bIr
         L/Q4+Hr1xQNdQUR5K2dXkQFxEJS0WqIRzpc4gz1ixYz1jFO8emGfrWZdFq6aMK2ovG5f
         NnARPlWFTs6lZ3t8wWnpU9Ng8wdSt3RP4iIqyx9E/kn0dLS9v4zffMtQsML4BHOQiv34
         2hhWNlNG9hyYRtabPjv55k3IJ6Kg3ShEAtlEJl1UqnbbV9uqyvLB2ECgLa5KCQTQynqx
         lErg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761782664; x=1762387464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LmQr/nvqXK+zOFXNOeHfnc6GNLUHSfAv8AGMrlOSOR4=;
        b=ETk+HvztHGa6nOvCzCfcdKootuZbD7B8no+mEWjoaG3n559GC6KB5MWDBqiCZV2ZIP
         Jbxbw70lmCJfSlSBIuN9opN94M+g86ughbDLnt/CGZJd6HR5i13LXBmhxX6lB15U/Rbr
         yQ3zkI4jC5zhPG2JJf+xwODgk3QjXbXVp5+1hrZBW0Wp0DYZi5Sq1B6UxSiDYJmzu4T8
         qPBByXNbDPgkLRcSk3eoq9XJw/4UtDV5lYAOWRSNQxMS24q2eUzouGBTWxE3qCSmulZG
         gaC/MVXjZVQnAR8RqqTKazMWwQQVvOEsZLkDtHx1uawShHP/fliJu8ktqiYNsCMhCQCl
         Pszg==
X-Forwarded-Encrypted: i=1; AJvYcCUXq3iAI5WZYofGBotxcH4m48hEeC3ZMmbQv3J0F4MRYRgJdNKFxFHAMcgfq6kbARTPiCjubvPROLN0JkCi@vger.kernel.org
X-Gm-Message-State: AOJu0Yys8f/Cc7s3NOJPn71/I0XSHb555kNg4tH79cgaAypSqF258OAf
	fIHtZSDunYiV1axIm/AKg2b49km1IhqggM4hdmTdcqXfBnrFWfBPETIeEoxbPr2SucQhaFPe+/q
	Vzwh3Vjb3x2k+aqHNBZH3MuwpKpZqLJh0ewRf5ipdzdSt57r7dHQEcXirkP2yR6B0g5DL
X-Gm-Gg: ASbGncuam3FoHqpueBNSJ0HLciMtQ/+gVCODCDMCUzPzq4Sw4HA9x1tSPJgKFC2Mrru
	b3o3SPIpmEEr18dtlUJePbCe18xpF8mCK+YMj0+MNMD79vIByyus/7h5MONtPeeJYALV7qT9rdS
	YrGRrhPluJNSm0aAZ0pCQxAxpZJnu4H6KSC4/Z/2G0RZZ/nVvCZRf/cdCYHVq7QFIw/HQT2aqAJ
	s4QGo3qMbUNalNxiXg44BVBlvUL9fFgH4R1CeFcYGE08ew72TeP1nC0XwRVpFsTdnj14Q5pZDxS
	1qdXMhiMx8v5bUqMIcVZKbBF5MRirj5twXDn2ouhTfeEdtcC5bCWo3OPJ7JEKkGTWFzq4qs1bZ8
	3Nh7gnOQTcuBA/rsP13v/KarEnnhE7bjMLd5wRuP52wv4S+QMvjMiBfzSydXQkqNWRuAtafjKNu
	o/wuV/fYzfESg7
X-Received: by 2002:ac8:59d4:0:b0:4e8:9704:7c83 with SMTP id d75a77b69052e-4ed15b53e60mr59019461cf.14.1761782664166;
        Wed, 29 Oct 2025 17:04:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHls9al2XoteQcyohoS5y0Zyle0J/v2kM9a5LZVzgtA4jNe9zTqJ/FMEHsgEyEmUumiISYvUQ==
X-Received: by 2002:ac8:59d4:0:b0:4e8:9704:7c83 with SMTP id d75a77b69052e-4ed15b53e60mr59018991cf.14.1761782663698;
        Wed, 29 Oct 2025 17:04:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f7444bsm4248514e87.85.2025.10.29.17.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 17:04:21 -0700 (PDT)
Date: Thu, 30 Oct 2025 02:04:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, quic_vbadigan@quicnic.com,
        amitk@kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v7 7/8] arm64: defconfig: Enable TC9563 PWRCTL driver
Message-ID: <jjbiamlcof6gttme3crotwyzsxtrguohaib73gcsaabpan5fqe@s5uroqqargti>
References: <20251029-qps615_v4_1-v7-0-68426de5844a@oss.qualcomm.com>
 <20251029-qps615_v4_1-v7-7-68426de5844a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-qps615_v4_1-v7-7-68426de5844a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 2O-Qa60H89jTkgR9JOia6M-nPSnLMyPp
X-Proofpoint-GUID: 2O-Qa60H89jTkgR9JOia6M-nPSnLMyPp
X-Authority-Analysis: v=2.4 cv=Cf4FJbrl c=1 sm=1 tr=0 ts=6902ab89 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=EhQ9wbuxbXqUBhoRm5MA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDE5NCBTYWx0ZWRfX3tK/1P3atmkg
 5DIZYtjs+ePv83LUuJiNo3p62gOmxduH3///tvH2Vq/KhZrQdEdu8CZFrLEemYZF97k57SsTZ7s
 SSXDoBkqXtg3yEXbtdsnyW6rA+TgXU292W+TLV7ZFb3yYZXgQazcQ5Qgw2vcf6FVT4Ov4QKHJ46
 K03sB+WZcd9pU0yVQ8U0+UqyNmTILwrcPPhkcKoK9Km8ENJLXPxA6hAOuTC2FljhBgfE/pMxzwL
 WcUDcpc5slkl7R2p4gCJuNq3f9HbK2N/qNRPfIq4V1wju0V86Yq79RmIURLdIuDAF9Mt0ym1Mcy
 FajGBQ2e7qWP0qLHbFrydV2JZRVBSGWrEEfw6ax+eWlgTKYVDwD+03ENfYJssCoGYHvO2ZgNaQ8
 6AetLvUESPU95aW4+NXjqAruGkZm2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290194

On Wed, Oct 29, 2025 at 05:00:00PM +0530, Krishna Chaitanya Chundru wrote:
> Enable TC9563 PCIe switch pwrctl driver by default. This is needed
> to power the PCIe switch which is present in Qualcomm RB3gen2 platform.
> Without this the switch will not powered up and we can't use the
> endpoints connected to the switch.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 

There is some broken logic in your commit order. How comes defconfig
changes come before the driver which actually defines that Kconfig
entry?

Please reorder your patches _logically_:
- DT bindings
- driver changes
- DTS changes
- defconfig changes

-- 
With best wishes
Dmitry

