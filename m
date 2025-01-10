Return-Path: <linux-arm-msm+bounces-44734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C3797A09079
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 13:32:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD51F3ACABE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 12:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4354A20E31C;
	Fri, 10 Jan 2025 12:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ifSRdC7r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A937220D4ED
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 12:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736512100; cv=none; b=Kt0CdYtO2ND7opPdxTb62ISLF5xSsHcfUP2Y+z5nHk62jH84XjqMwF4mxMyun1FmBzT66dTKpA/17kTOQ0H1Pl+fYf4lcrJm/OaViA9lk80cXUxpgYjtJpLCZYtnyoJ288sLVcRo1Ku6SUh9oD3zKzixED+7ktTHyK+PpNS3jxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736512100; c=relaxed/simple;
	bh=9mgZHNGBzLOQuXSB+jkyfWeQuF5YUIZNGRd6gKBxgek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h/a9G3ZZ1BRADcGQdH52SQHKG6D/H9IUMO0uev40X/xKKG/PWXYFEpS3Z/Kmx8edejq2WOrgntT+GWH2WFXO3lB5YYvbYWBZUxS8fUnfNvdWRF/AjxupHp+SCmM2oap5pHAJAeltqIcFpH3WhhIFZfbf0cnh/2D3Nz6eRUM0Sxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ifSRdC7r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50A9wi0D011292
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 12:28:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Lq9dyuLus20yp4kplmjOnFQeKKs+HMiGfzSgt3azWY=; b=ifSRdC7rkMwAg0n+
	4THTTeHh/w5QuUff9OOajJx6xu5NUkIT4DtOc6dkU9RsqmRQRUkF9UMqMbfP7OD/
	y6y/7BaWtlxXqcfvbGU+Gwl1zHsjv9GDaQMQEKMxCbyI3XT8RJNdOe7j+fe8G6HP
	/Xa0IzxnNPRgdSaRtfjBiarB7sNsgniI65NhmhlnqMJgc5qXiv8ZiKEPFAA3ygXb
	BcOxET3Wpa8nfZ7G2oY/neWC6j4qKuSL7u6oWSr24wLot+U4I/tKs/RpyRvX1bn7
	E/mZxvUF7f4zamqpqf+0tbpotKgQlSeaDimsiuzL50dUxQ5x94UpzUwWwb7oqT/n
	zgCHSg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4431d48bcm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 12:28:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4678aa83043so4780741cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 04:28:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736512096; x=1737116896;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Lq9dyuLus20yp4kplmjOnFQeKKs+HMiGfzSgt3azWY=;
        b=GaQHqSuneNCybj12jdZzOzisdDCpLO0Rq6u87aJe9m8eMjqR5VN5grFSW4Leb2r5+x
         mbRpJmLyR3wxR/zCpZiz1aekU25isUdL4X7WwC+BX+IdJqnaUnLLF6ZZfH/agZOD1S/h
         507QXWBei0Sx4dgCTiKUjcUnhTAkZLOEHuQ2sYp2iHUdoU5m4qzUkUIHgiA6Y5QHCIvD
         nTljm/arwbFPyLA3GYuCTunhRY2yvR3AcFnZtxJuLDlHEC+dv8u2YhMbNq1iP9XEtfRk
         Eoo3oObjYrqgwNwlcGMvIaFx3YW/fCHTvAphWUT53dL/HlSDLW24EwTozNhs0s+g7Iu/
         RJtg==
X-Gm-Message-State: AOJu0Yx+/EEJUyDfJRvZC6hq5eemZvJUrfe9QBMt8oRwECx0XXgjEQJc
	2w/LFrFL9Rn/R512IAVed6Bceo7UishLmCCX4JAAx/PuX+pFmaBVb0WSVVRQKgcMYhxScU7DTmK
	qmsBREvqAtpDN0pbrKgMowvUwhkWdZbPp095j+iexgZLy91SU0CLMcJBeCwFpco3eMdpBEnCx
X-Gm-Gg: ASbGncs6MEMdNDxeARUGIbtFFFvVkebqO29zmUfkSUwtS6FPKPUY8lcVapwMfNq+VS4
	Qe+3yrdxsaMDuC0gF/+t9CEiWF8HKm9Kg60Px5BCWw3CNEAq7oWm0VLNQhj3hppAmErKTrz9dti
	pOd9jJ42laNACVu6W+ipshige2q5XezfL74+0y7vSn+89bXyQSIFjJp9WmsX/trDUO87hu6IYoq
	WzoS8ov6iLR2q0M6W9etF5ndhDX1nhYB8O7Q9+i+ru2Oe+lZFfZwZWrvEpr5erXrCCcUB7upqHv
	rzMEBm3jq2a/G3gdTc/Givf1XDyqynL2osA=
X-Received: by 2002:a05:622a:401a:b0:46c:78cc:e53 with SMTP id d75a77b69052e-46c78cc0f32mr45291261cf.0.1736512096460;
        Fri, 10 Jan 2025 04:28:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGB7BuZgxjZZXc0Iv1450j7nE/9I//uHvCF6onNzcuH1Yn7yj6fVcJxeBrNjKccMHbS0VLMAQ==
X-Received: by 2002:a05:622a:401a:b0:46c:78cc:e53 with SMTP id d75a77b69052e-46c78cc0f32mr45291211cf.0.1736512096080;
        Fri, 10 Jan 2025 04:28:16 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d99008c2d7sm1622982a12.3.2025.01.10.04.28.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 04:28:15 -0800 (PST)
Message-ID: <2e240422-b964-42ce-b537-413b1d8ae07d@oss.qualcomm.com>
Date: Fri, 10 Jan 2025 13:28:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: correct usb phy power supply
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250110092326.167575-1-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250110092326.167575-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: I_JJ6CjTh7BZWMynKGZrSIPHLzpsFZ66
X-Proofpoint-GUID: I_JJ6CjTh7BZWMynKGZrSIPHLzpsFZ66
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 phishscore=0 mlxlogscore=811 spamscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501100097

On 10.01.2025 10:23 AM, Pengyu Luo wrote:
> On this platform, according to dsdt tables, usb{0,1} phy consume the
> following regulators. usb2 phy should be corrected also, usb2 in dsdt
> is a little complicated, so correct usb{0,1} only for now.
> 
> 	usb0	usb1	voltage	consumer
> hsphy:
> 	l1c	l1c	1.8v	vdda18-supply
> 	l9d	l4b	0.912v	vdda-pll-supply
> 	l7d	l13c	3.072v	vdda33-supply
> qmpphy:
> 	l4d	l3b	1.2v	vdda-phy-supply
> 	l6d	l6b	0.88v	vdda-pll-supply

Looking at the CRD schematics, it should instead be:

USB0	USB1	VOLT		NAME
L1B	L8D	0.9ish		PHY
L4D	L4D	1.2		PLL

I'm hoping I'm reading those right, it's not super obvious

Konrad


