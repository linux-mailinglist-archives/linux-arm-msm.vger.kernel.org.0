Return-Path: <linux-arm-msm+bounces-76399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C44BC4CD9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 14:31:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5ECC8351DB7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 12:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BF5E13957E;
	Wed,  8 Oct 2025 12:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WC0Ya4SP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC8C243951
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 12:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759926694; cv=none; b=EcuINRMHO5bXv5W7Xm6+t02WX/Lej1v12PvsElg9Ml0kdv41tKVL3Y80tgRkqRVl7cL/6OVl1qldAP2q+/fpXePUjz2Ggjaiddb20YxgSVBLZTzVi9xW6DiEn27UPFJqlHE5/nG8YN9S+ivU6Y46M3QfGDhLCv+GovXVGaOhYfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759926694; c=relaxed/simple;
	bh=ATHazlMaG3uXrz/8bapVZ0QyRnQ3LTj31ll9TPp9054=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qqa0BewV7iqJwMXEilRQAuOpG+ba28/5n3MDT1D1egWKKQY7LZ8Fz8/+r1amlOUVEQCLq/wphhrn2NomhhMItrfiQkc58H4oT6d+dS+61tOpeyXxWW7FOZA1NEQdfVPI+f5cdsCpOpyVGBlcLXddTVMgTwPf4rbrwEtAGryueOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WC0Ya4SP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890mEv023842
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 12:31:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W2xJeI3OG9l4i5P/NiO0E6EXHSuabja0k88qJFuiXuE=; b=WC0Ya4SPaTu0KwZ4
	FTweXLcB3jSodnqWhwuo5dwMkiTuAC6SVx+mwi+wZSrgekVIlCtrtSFEyPbhtMCO
	Y2KvqLuxIORVAk0BD8Q2XrumwCGcLhnV25TSVTlXEYMXk/TyA30NjQOwigqUVkta
	J0Cxq0q/CIG1Eyq2/yRzt8Ofam48l/FZ9oI9dMibVVwthHrOLplHhvXrMgm2ayW1
	quAGp42uoohAm4tr253GOnYYtpXouyojAkFnqMii4Tkrf63WPd+M+XtDugY2ctPO
	kdXQeOMKlzNHXCaBufK4GxLuJMVDKfUbZHq18ZyMj6MwXP7WrZ/xaHNBMZHrzmvd
	Oe2TYA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49n4wktx5k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 12:31:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e231785cc3so30437441cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 05:31:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759926691; x=1760531491;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W2xJeI3OG9l4i5P/NiO0E6EXHSuabja0k88qJFuiXuE=;
        b=P4Dipperu9eOnR7IYPmiI9TYXrzfy+1ZPhUYMr/JiIR1o9l01uMvUCcvR0l6DMpRnR
         Tf9H/u8d1/Q70eczTLCbvfyK2Awg70BnfFbXwhvME2AkyXv1TFvQCB6ruAhbLvWE0/S6
         V/+F1OPV9ELdDKZCH3M1BvJCSnYEcPqXa3PscLz6DD6BjWLYZJ7aH+wLNLhwJAxGHrv5
         FK4r4pPMGsfslmzbykxga1CYiiCDPIUsX8zsc//J1Y4BmDFRiMIL3qlFgAKsEAucOwJ6
         eYJhmC2C9R1BuwOQvm8gi8L8BFSa0jv1FcQWCToMnU+qpddLJIVm8FH99wWzx9lrHdBf
         Ug+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU6MHTKA8k1hbCpb+EGONupF5UxdZW/Q7fhJZUhhda68lPMTP6QTVPga7LTIBSu7sQ+18ebuMdcljXQ21rN@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1driDO8Rnj09kgXaU6p0CYgjMQOb9K3r9VdiudQVxJ5E8TFMF
	AVqtzKqgT462CBvkNVwtanD3bWqfXO9vAwBOTYPW1mniA9JMS5BdUYJzs3NBwSiaBgfigBQZNvw
	t7CYtpbi8ulLgeyKjfa7ls82g348GoyFfrvrA0vtZFnDMfJcj2OEX/i2sssOvdybpPoGH
X-Gm-Gg: ASbGncs9BfXc3+8X0kiXMWhUnHrx6cy+Jp/CbD42dvEO5RWGYdcPuTwXVgF84JxBige
	Ypw+ZsVDnt5Ltj2LVTpz9U/df40Q8aH+yPqgIGr2yF+Oc367ptvzM+kw6+5frsfxxEVJulOeQCs
	CJMyUBljaKfzOR4iNgPNtwlgtsd1qd1e8EjGPLULPJz09Mcp8ofaeo52FCLQfC71h7oPK1GT49V
	24ENDN5/N61XATf4Czg6faIK+8NcKf+rSXIJkHoS9Afw5ut2sA+bxEwn7o3jyXpSWqxg7drl1wU
	5QK5rK10LJzNRX8pQFr75H5ibDHQ3z6ukY1eg3qHjuh8PQbpc+BYwuZPUkp9dNoWYxHMIWYxhSL
	ujvuJ+mlcl9bwNc8rV7d1MNgooCk=
X-Received: by 2002:a05:622a:60c:b0:4d9:ac87:1bdc with SMTP id d75a77b69052e-4e6ead0aba7mr29274901cf.6.1759926690641;
        Wed, 08 Oct 2025 05:31:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFf19WcSpWdEUFhuwsgE9dJ2DJvAeifUnbLDZML0K0s/i9UQH0GMuTwSzetRW1A09yhfc7ONg==
X-Received: by 2002:a05:622a:60c:b0:4d9:ac87:1bdc with SMTP id d75a77b69052e-4e6ead0aba7mr29274531cf.6.1759926690078;
        Wed, 08 Oct 2025 05:31:30 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865e7e8d8sm1639249266b.41.2025.10.08.05.31.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 05:31:29 -0700 (PDT)
Message-ID: <0ebc651b-e174-411f-9ecf-c165edc8f754@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 14:31:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] arm64: dts: qcom: ipq5332-rdp442: Remove eMMC
 support
To: Md Sadre Alam <quic_mdalam@quicinc.com>, broonie@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
Cc: quic_varada@quicinc.com
References: <20251008090413.458791-1-quic_mdalam@quicinc.com>
 <20251008090413.458791-10-quic_mdalam@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251008090413.458791-10-quic_mdalam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDExNyBTYWx0ZWRfX+XifiZchUG+H
 d2M+Fs71K5SadI6PIIvdTN0Ndn4H1k7X+vyuRgPc+QVedXj/O8ACBWogqdU2Y9gX/nyN96QasXZ
 KuPUEIn2JjovyDp3rK9bsUxw/yraYbve+UYll437LnVloaeSRwzj8iRBveEkDxUTJHijC0cEG3U
 MQq32bo9jWPo/GuZANxHZFHriSWVKFNFrLNjhVqKOsUU/RF5/8kVddAC8sb0ggkd15P9VBGoynR
 jDlVU/oI/patW1EyURvlrkMhnI+pV9La53lWoOtIShnmWwtJOLbqj/0DDtt9pYI5ZqDDC2hW96x
 yjZ0xAbeBbZ/r6Q+TVkf6WnHPLEAtsPWbnBpRstZvxmCo6wR7jRP02VBiSkQ65GQRUS7K1hdfXc
 tI/ZbH1otdw6/+9b+S0yhiq6eq1ZCw==
X-Authority-Analysis: v=2.4 cv=BP2+bVQG c=1 sm=1 tr=0 ts=68e659a4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=VaBRgJVrheE2JgugGuQA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: tph4KLHtrlvDS3wD9ZXThainW6-tKdo3
X-Proofpoint-ORIG-GUID: tph4KLHtrlvDS3wD9ZXThainW6-tKdo3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510070117

On 10/8/25 11:04 AM, Md Sadre Alam wrote:
> Remove eMMC support from the IPQ5332 RDP442 board configuration to
> align with the board's default NOR+NAND boot mode design.
> 
> The IPQ5332 RDP442 board is designed with NOR+NAND as the default boot
> mode configuration. The eMMC and SPI NAND interface share
> same GPIO
> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

