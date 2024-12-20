Return-Path: <linux-arm-msm+bounces-42963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A269F9015
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 11:19:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E37911881CEA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 10:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFF5F1C232D;
	Fri, 20 Dec 2024 10:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hAxU+lgF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA3D1BD9FA
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 10:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734689849; cv=none; b=nK6uwA1rRHrMojdUoRov4Kfg0XI1w7iATm5u6P4PDGqACx5VnnCWXXKOYLaDZUCKZGYnQBDpHrzdXBZL6eEyp8WakyYC1xegmiP933CIoIWEmGhkcKTVXneUnf0v+8/phpOEw6QkgxEyGERIL2PspmA7LFqJ+MK5HDX3cJtGJSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734689849; c=relaxed/simple;
	bh=SFDPgxVu6wtDC2GsMxKEW9jpJd3//ZBI6GCKoD59BXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ihL3zra2nBzz8t/VnjyIkiFqQ2sQgbdPH4pFERXqygoDLY1K8DiSg6MyIIWxF9MRf9iLiyfXiSklu5l12QUowbEzRmkfKW3T+zU3Vta7T+0/XJtao82uUPKi3AhPBPlR7+tUoBBMZfiuss5VNsTv1B2tiBPK0X/juowdu9et5Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hAxU+lgF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK8TF9S024287
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 10:17:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wrpm/RvJv4pqacQSl95wP5M/EJZnFTnri3TZQLQlVCA=; b=hAxU+lgFGE2X/6wu
	NdYIb+VZLP0ogvuttHDlq34Q1iUgb07Fn+CSka9QhOucMSGFyfoqogBKHhL4iMcn
	qpu+ifJCdiFiRQq41YqstBOF4ThFX+LNjitowUzzSJTndh4u53F1DAVsRZsRhuFO
	nse171owuVycrLxtG5JIagm50Mf3w3jkZxAr3+7WTmAGl+RlZgsePv7IrUU6xnm6
	xoPbMxsDscCTiVwPUp2Z7g6mh+d7Qomrdj9PM0qoG8A/A30Mz70IrMrOsP3uRSVK
	EBzE9VElQU5N2by+dMl/VpMuYrDEH28sknxojrHeDYID0053jzZIZX1bKxaaY2MN
	9vnImg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mt1wsuwa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 10:17:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4679d6f9587so4577521cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 02:17:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734689846; x=1735294646;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wrpm/RvJv4pqacQSl95wP5M/EJZnFTnri3TZQLQlVCA=;
        b=w0/EaLYrZgnD+VPLQ36CDD0+QQvJgoQg67i1VRLoy4wArQ3tzUHlnU2x1CYbqhFQ3j
         uWD+eP0E+NSI2EJcr+fsLvYIJBGwu50ClAJkkjxjjy0G/hBJd9u4V7K7P6dXT/oZ68zz
         K6+ob9RPrdXE47oj8LpnP+tbsHWDrYb018vk6C+6t+f+6+abDswd+GtO+Rfqw9CRi3dI
         ouF56OUfigKevW0LozvrwOJMnHwGRuXq6Ex4EwT3z2oQKgYUrPxNeNT0uGlikGI/qj6T
         4/pSUL5bIaSEloG5CF/MjEr2EVoAGpHcdKpNYIAG8934waUz8QqpUShqDcsdkmq2KzG6
         ICyQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0yY4Foy3YtifreQPUPNMqSI5dsJY0/gw4gYb4Xp+pc8+u4n5w//qXekBY6VusVi7ilG6XN5u7ICdUsJSE@vger.kernel.org
X-Gm-Message-State: AOJu0YyX+DSdQ07+SBIOiGtMDD+QUNdNZzX53Cv27UuKyQAbiqpSE4MJ
	Z+QpZZ5m1LrS3OpIabmqlUn1h9qzQeWx1qnv2PkaXtXNIYAqU3/RMCzVGqkTajtS0dXjjwZyPJJ
	YSuiR73n8vsylwGsNq9obPYuc0A3gfQiprWxUv5U1nEWr+ghC6qP0m8owHilo1N2h
X-Gm-Gg: ASbGncsUicfsEICDDNoQ8gIZP1J6kyXsb8FpB5LdTMqVXjTxZZBAvg7YGZzbnnc25Aj
	T3caeE09tJ+I2SXKnJUDq9Q6HIEfhrKuTkPKcCbLfbSHikGBHdBTIJiOVCcuYIXkkBE9Cg3waNi
	5F8CL/uUB6s01g0pKojlWKPxtWwh2FVaGAoqk5kZj/Dk+QXPl0Zj579kTtnUq9U30AHrrCOkn8y
	PxofPh5hyKjmL+Yuy6VgdNfkhhLk8RJmgEFYcYuS/BVTmuvUdAY9ZKWVa5ztMFw8XglO9HPQlYI
	zipoBtKk25KgYTxXEoJBHd7ezIoZsZ24K9c=
X-Received: by 2002:a05:620a:4455:b0:7a9:bc9b:b27 with SMTP id af79cd13be357-7b9ba733805mr115536085a.6.1734689846244;
        Fri, 20 Dec 2024 02:17:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHWt/HpECNmTA7E5A2IgoO13Yn8mzdDwcbQ+XpPB87YicCL8ukox//oEwyNPqrgS2GNb+JyvQ==
X-Received: by 2002:a05:620a:4455:b0:7a9:bc9b:b27 with SMTP id af79cd13be357-7b9ba733805mr115534485a.6.1734689845814;
        Fri, 20 Dec 2024 02:17:25 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f5f4sm159878766b.6.2024.12.20.02.17.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 02:17:25 -0800 (PST)
Message-ID: <ab23e0ca-3c2f-44ab-b6d1-cfcf63f29f74@oss.qualcomm.com>
Date: Fri, 20 Dec 2024 11:17:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] arm64: dts: qcom: qcs8300: enable pcie1 for
 qcs8300 platform
To: Ziyue Zhang <quic_ziyuzhan@quicinc.com>, vkoul@kernel.org,
        kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, dmitry.baryshkov@linaro.org,
        neil.armstrong@linaro.org, abel.vesa@linaro.org,
        manivannan.sadhasivam@linaro.org, lpieralisi@kernel.org, kw@linux.com,
        bhelgaas@google.com, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, quic_qianyu@quicinc.com,
        quic_krichai@quicinc.com, quic_vbadigan@quicinc.com
References: <20241220055239.2744024-1-quic_ziyuzhan@quicinc.com>
 <20241220055239.2744024-9-quic_ziyuzhan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241220055239.2744024-9-quic_ziyuzhan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Qsof20AT4YyFifoKNEDll1vAm_zph_SQ
X-Proofpoint-ORIG-GUID: Qsof20AT4YyFifoKNEDll1vAm_zph_SQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=691 priorityscore=1501 mlxscore=0 spamscore=0
 clxscore=1015 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200085

On 20.12.2024 6:52 AM, Ziyue Zhang wrote:
> Add configurations in devicetree for PCIe1, board related gpios,
> PMIC regulators, etc.
> 
> Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

