Return-Path: <linux-arm-msm+bounces-86859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FEECE6DE7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 14:22:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 44A11300C8C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 13:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39C9630FC37;
	Mon, 29 Dec 2025 13:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DI7f7SS1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RpjWjLdm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABD51E5718
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 13:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767014541; cv=none; b=hiDF8oHEsYsbut29XGJ0WZNKTQ5FlRue25ryhXdSD30mkp9870ZbyXOdA/39M6uCIwtnLs5i0oUC0DizilgVW/eiflPdV9ALOziWO6jrSVzmaxfQfJTpVbJsnSxxSL3Zr0IttGYfjL8fCnENT3EMXJp3BZDO8MroWdff8wva71U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767014541; c=relaxed/simple;
	bh=HJqevJYAY1QZEuReRtLCKo0yBk0YcaGD7kh1FWQHyc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nF6gEPF397pYTiWOATY8jl1Wdmz3c4NtmDcKjDIR3/hiSNksYlqHW9qCm8Uyxluzr/UXnMCwG/751p0//drodBpKOljwOfGzromnj23S96R8q1PqdywBLwn7l+1SuXdYVd5YsBCQX8AULF5gamcam8kAlo2/kubFVhSBomWjVhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DI7f7SS1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RpjWjLdm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTAJZen3328419
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 13:22:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HJqevJYAY1QZEuReRtLCKo0yBk0YcaGD7kh1FWQHyc0=; b=DI7f7SS1+EnsEhjZ
	cBCVIMv1rdkzLHA85yRF0q49iVULv/gLs4M16tz8gOCJFmhEqJvwSrMWq4VNP1b0
	8DwOPjo9SL4ZImtxT3N7Y41eQEWsc1nObUtAUPb33vcGoBNExQvDXHKkjbXRhDX2
	oOn7pkwjcB4PJ+kXdGSMFaJ9Qs7ILCRYhZtScgHtS2eXcjr+APHSYpGM6zywiygn
	vynQvtfwlvTjfvcwjUOTvlWeOyU+bgjrixzihUkcU4POUqFXcjn3+gdOeIvTEQRZ
	i0NJvvTj0FBUcX4uUil0105DPBkB3vWfPMLEehBDbyTW9YDv56stiEAmwAH2FLR3
	Tjekeg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba8r6caxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 13:22:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c231297839so71416285a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 05:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767014538; x=1767619338; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HJqevJYAY1QZEuReRtLCKo0yBk0YcaGD7kh1FWQHyc0=;
        b=RpjWjLdmPgeLc3DD5idzGPG7zEliIwa2L8/jOi/G7NwZYl+EaD/jNE81LiYGI0u8Ox
         Rd5eftJJgBeSnUasVc8PQzpYBZvCiyXTKpC+lDovctlUSiWkAfK7cjvpn3IPo6pTZvcw
         luzfOKDpXLwUUgwVtiuTLva2VkMzI/b+vhAAjuJ3DE2dO+eP9uZaBfH2DQQH2cLDgepS
         4vcDI+HJT6A9a+xXX21hTT9u3yRCdpMn6V5B85NFlOeoeHrRaOruljjWFZTuT1atsaD6
         gAQUV/Ib4w8vO1CS4klCR+0Zucukmhtmi/SbhXHZL27IZmAOt1PYgCI9CLkmGF9KCYsP
         lqdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767014538; x=1767619338;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HJqevJYAY1QZEuReRtLCKo0yBk0YcaGD7kh1FWQHyc0=;
        b=YcRmoCJL0OImgITPRWVS+V1SgxVHx7w3Ndn06rqTMmLzAnV4zi22S0PWBkPTMt87Re
         P+6wEi26tsAq/E6YaRPkhWioE8j+TSl91WYXGUJUT08NytQ2TMqRXqar/HPPQAcV6Ewv
         atvDrdcZ5BSeSXqLTpvL0HKOQUnS5iuQY5rwBdefHPuQw76KevSRmaSSGZCTcseIM4Ah
         zWUiyQu++xPl4xeM1ikVPBCByNGLX/aR5YXAYuubonVKanz8MRxQSc11gl7oh34iustn
         Wjx+NvnUGJxgkQb84ac6A82JtZXRfMd2xotVMukRwak6SXDNVY483Z4ZejzYMpUqMGEk
         TvEg==
X-Gm-Message-State: AOJu0Yyt1QEFzEwD4ZmD2kM/3i8POsxG2xPzyKkj5uKwkxDzvD0VsRGR
	Q3T83fH0GMikSLDsisi24iWFOB16MSHPrLWRklzgyovMef8wIJ/5sewmdkWgQw0W41s/dQA2zsj
	i2TnFJvA+Ed32Jv9QXXoMbe9qsBlpxeCdHvHJmUoJemFli3xvmlPfcexZCB7pfz7xlYbs
X-Gm-Gg: AY/fxX72nrjTsrgfE11AQIrehoBdaMMVcIDC1kCihQcuA0lQnuD5/TZ6vnYkNepSoX0
	VRWdErnHKpiywW3s8/8NTrhW0MPij6Rev76iFCb1FffPruIeJnbKI+AnDbDTM8V4oZ0QSAPYrU5
	h4Vhigay296r3pFrMS6IePhiVmaR2H7b+3dHNferaXui67BOrZzLgavRK/YDxkZlvwt/j1CEax+
	sjQz3nZ37vofQLHwy+05FwLvDA8uidk7BlSG3cgxLOTgsa9CoI6+pONtCzNdYWEh4gegdJiCm0L
	hihm82c+CxrQFQ5mcyOQ76+8rna/88lWp2fsE9g34aqgFHvpOuolxSWulYTQ5vjmP2WXdMt47YV
	yK1Zqb82lEEOTwxgKPC6GxbIG45+ftN+X/iX7q9FbBOfJfUU1tcU+B3HTYu6RclFDPg==
X-Received: by 2002:ac8:58ce:0:b0:4ee:1c71:71e1 with SMTP id d75a77b69052e-4f4abdb158cmr318186731cf.6.1767014538340;
        Mon, 29 Dec 2025 05:22:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGB9vPODytiYPIOYJr0ojiA+7vTk9wG4QHcB35oQO/bx33xSmDZ0T9A6JaTvdLxFmBKp6uCVQ==
X-Received: by 2002:ac8:58ce:0:b0:4ee:1c71:71e1 with SMTP id d75a77b69052e-4f4abdb158cmr318186461cf.6.1767014537822;
        Mon, 29 Dec 2025 05:22:17 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ddffc7sm3340618766b.43.2025.12.29.05.22.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 05:22:17 -0800 (PST)
Message-ID: <0c7ed58e-4023-48f3-948d-0ca2811b331d@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 14:22:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: talos: Add CCI definitions
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20251222-sm6150_evk-v1-0-4d260a31c00d@oss.qualcomm.com>
 <20251222-sm6150_evk-v1-2-4d260a31c00d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251222-sm6150_evk-v1-2-4d260a31c00d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Raidyltv c=1 sm=1 tr=0 ts=6952808b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EdBNvarzL8_vv18a1hgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Dvt0VUdAb330T1klJvPFDZfTmokk7CfX
X-Proofpoint-GUID: Dvt0VUdAb330T1klJvPFDZfTmokk7CfX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDEyNCBTYWx0ZWRfXwZww+YZzcv6T
 z1fe9d3vshj3sBHqvP+06377YDxynbyyeXK6cthmvTmKYymFk5QzUaXja58SfGJjgW7WMTDOXAG
 fejrQK4Z6+0bnbt2vd4KoFFzYjqiuJNHgJ9PMAlOsM6UOy+gjSUUX5nXhPPyQ7k6JUvkGiEVW/a
 iXKIzD5Z6iZ5TmTldywy51XTw++QrY3ZMwrkxEiCOoPRLRUj1mqX19pHbLVIWKH7QndQS1Kx7kl
 n63ZTr7PLnN/NVCRgKI4EPToUXMhCizYNUX3ebYp6sbysTVMB5Oc3AKQUcIPyK/qPpS4IgwMhfY
 wg4hPOU+kd/UZC1XbibWLcwwDXTJTZ3dFXL/PZyWo2yGZuoLZYBWAeLcFIDE0lRs8wmxFjsl6o8
 1v57pz+JktD1hM5nO/J5dixF8mhkiMvZ2HluZf2IDG2PpIZE03Q6iiFt9SlqwBtDgJgpfCrlDHO
 fGQkT8rjiRbM2/FyJ+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_04,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290124

On 12/22/25 9:44 AM, Wenmeng Liu wrote:
> Qualcomm Talos SoC contains 1 Camera Control Interface controllers.

"[...] contains a single controller, containing 2 I2C hosts.
Describe it."

Konrad

