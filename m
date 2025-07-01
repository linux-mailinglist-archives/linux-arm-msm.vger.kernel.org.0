Return-Path: <linux-arm-msm+bounces-63158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E4DAEF187
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 10:43:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB58C16360C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 08:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E033266B41;
	Tue,  1 Jul 2025 08:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XKECikuy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2443125D209
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 08:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751359340; cv=none; b=TwSxj0ptpBrXRFzhzP0KFU5ZinagM3nf5iGVXN0PzD8xpyepZRFMlR/A+uxKN/R06w3QkVGJVQ51qTi6BrVW0Fd0V/2ZwbBZnIUEPVk6hjuSfFcKHY6lm0zgGdzwDLSmdsQaBkon0Vh9tcK0F8LYrx3iShhRfIVzP+n1AYGUGSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751359340; c=relaxed/simple;
	bh=RVVKzcxnlx7nOWu7Gu0pvyl7lRMUct8fsNs9VBvYeW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mdXQhCepBiXL6Vp0W+ohVgPkS+OsVls6wCWeznxxh02QltGaUHtDE5dOC1ASrk1PTWGgI8Gu7nTSmEwJMXbtNU7zlZQH332nXUweH5KvLTmxn/hXrEucL9xuLe40TP1MzIlbTmhvSCCedpqmPDuRjAyXTd/I6lzRRKQ3TNo8rIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XKECikuy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5613nw2O028440
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Jul 2025 08:42:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tutfviu70uAl7UTDUY4zJ/1EBwlos06c3KUfZrmg1A4=; b=XKECikuyYRU+pWA3
	Jl1M1QpC33RbExyX9FmCh7NBXBaJpQRHu6Ua+DwurZkIHZvzI0v0D6Ezp9/Y5yCz
	isJ4Wfu0clSXCwmihsCs2xvVNS3m1K2tWRLgNqQ0DY/BDZP+i+m2918pDQCBbR2y
	2rP9DaZzRJWuGZREs+Agl1o8fRPpcqQoYJQvzTaaUJs6gwxcOnii8Fq4zHH0eP8E
	9ZgGbjVFl+5evPyuxtQgcVJYpHdxu41tUvyfptDkgPhxdjgzkXRalmBH/fOZIsWg
	RA5/OGfhuIcbW0UH+HisdlrSzwBcslPJm40BFPXwGN0hvW9RsqAaS74Vy78/2tjt
	TpsBpw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvqutf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 08:42:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a6f5995650so3371871cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 01:42:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751359335; x=1751964135;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tutfviu70uAl7UTDUY4zJ/1EBwlos06c3KUfZrmg1A4=;
        b=Rnzeppfpcsc6RyE2LmfSeaX9ROhtemy5IhFylVJ9AzUmWxsO6LpyQQzG5Fzyaw0kAZ
         mEaC2QrtDfcn/1EhVz1954T0h1XKgQnIY4zNrL2+hJ0x9isysjbB09+xgxNh2KAzuSfW
         zFJdLb/e/rVOODxDFOvwjUYH9t8zzG4LgrUi6JcnPbEdvsKPB+SMAUGL8SLq12b82EaJ
         PyBR22mu8nDvV0MSsX23YdWIf2Ec3UiivhLg9SMIsLbqw33K3T1vSThr87P21FeCK5W8
         +HNGoPNAyzC2z0wu2qEliyfqXxe5kQZqFJjFPCCT2+4TSm9pFyiQpX1gDY9GL/hokABj
         z8GQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpQbop5uJv1tCbK4YIhxb7N4vOjrsxghvAazw5cYFMx+Us+KTsHgXrePIvweNkk1oOMlM3rRDmtBxm2tHj@vger.kernel.org
X-Gm-Message-State: AOJu0YxXeh/D69Dg7bn3wG+ZpJ/Od6rgdTo485o5b72tKeHEq9e+SzKq
	Eai1DwDmGMoGQci61SWZRQihWE9dcjtYWwdqh1CuirI3LcyCJKwdUTAvMwgMHIKJGlcZdcDF/LT
	A4L24OjV2kM2xYpGtpZI/2wgh+AjSrH2aNK9b7uCVBDtruPRuazAiYiuVxQ8wobVb9CKM
X-Gm-Gg: ASbGnctrj1hgo/QGoU1bNesXMnvjw1fV1MsqgX8wl+3t4z6F16OMciaKy3nWsKNqloT
	rY5TlOFfZmdAO81sZowGZWylTZTDoLust6DVHQbkfhO3GfFWDkz7hEPyTXpOGWWGTgW6zwQG9ak
	NJR4yydfcBOQ4BoP6k/g1nYGC6KOrpgy9l1IQG3kBQ1NgIT/96B3vGfXla9CmnNRIywxj0htW25
	09HE1jnJtSJuy2PSjjBhwWhBb+doilN0l9LbTCDrrGcHMiQh5ZYDB/hWN9NXJNDJpy6g7LulBu9
	79dcp840GDuNScezH07EmqcVtWbsE3C4p5B7LX7pm6Cj3fVf8llrZA1xnLq1uRutqRZOw3/hjco
	pstq4KANZ
X-Received: by 2002:ac8:7f0a:0:b0:4a7:79e1:cd54 with SMTP id d75a77b69052e-4a82fb4a7ccmr13336311cf.6.1751359335214;
        Tue, 01 Jul 2025 01:42:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIiylmVmPpd7FS2xOPQGYFcHkmg9ybF8Pa29w5MBFMzjhMUeUBetWA8IVnYLdjBQ6zWunoAQ==
X-Received: by 2002:ac8:7f0a:0:b0:4a7:79e1:cd54 with SMTP id d75a77b69052e-4a82fb4a7ccmr13336081cf.6.1751359334787;
        Tue, 01 Jul 2025 01:42:14 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae362cbf19asm736054966b.128.2025.07.01.01.42.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 01:42:14 -0700 (PDT)
Message-ID: <59f46b2c-5966-4ec2-89d9-305ca52f5111@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 10:42:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
 <6c5d9ff2-fa59-4151-99fe-3bddae46b507@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6c5d9ff2-fa59-4151-99fe-3bddae46b507@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: x1jwytkdDaLGFmUe5Rx8LUar9NVJ1Ccv
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=68639f69 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=qC_FGOx9AAAA:8 a=KKAkSRfTAAAA:8
 a=FHDPKuC8_rlVOAf1JN8A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=fsdK_YakeE02zTmptMdW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: x1jwytkdDaLGFmUe5Rx8LUar9NVJ1Ccv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA0OSBTYWx0ZWRfX24rWChdc2rWR
 ugeO0iwxNt7QpsIdWa72VlSfFlKWJrQTLXhWQDXMwdmcbB6L38NBCVJ6H7nzLPgAiadWl0LgaXF
 0pIkJ3ZgYj7czi9+ICzdDB3v8sCO0xvUj9H9KUHv/W41h9ZhYNFrfPkOfnoYD0lKHouuLuouUzF
 wlOEEDZR+RmdGkr7PclbT2uNvAulQ/b2HL5dqtZbPgxeQfqtv75Zd//6pV4UjjJ6k+CGANBraPN
 LosJA3JmHG66K5eZP0Xqk5US69Jbdgk9eqZOFErQKTVd3R9AISjIbE1KerwDCTS16PLd9fP+qTs
 FGhjByMh6y84aa+AESqfpgLx1n6xAtlx1nQje/y/plfb/QEeCw2bZ5D4bbN5oBCZlqp6KW+8Qrz
 tCcVlwbxzJnDCD2nt/u+CaVVca2/Cex1q3mYmlFo3S0LLJyqdZsTWbX9UeeCqQZVIMA6bQvm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=742 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010049



On 30-Jun-25 20:04, neil.armstrong@linaro.org wrote:
> On 27/06/2025 17:48, Vikash Garodia wrote:
>> This series introduces a sub node "non-pixel" within iris video node.
>> Video driver registers this sub node as a platform device and configure
>> it for DMA operations. All non pixel buffers, i.e bitstream, HFI queues
>> and internal buffers related to bitstream processing, would be managed
>> by this non_pixel device.

[...]

> I tried the patchset on SM8550 QRD and SM8650 QRD/HDK and the system just reboots
> a few millisecond after probing iris, no error messages nor reboot to sahara mode.
> 
> The DT changeset for reference:
> https://git.codelinaro.org/neil.armstrong/linux/-/commit/e1b3628469c038559a60d310386f006f353e3d59

I think that's because of the majorly suboptimal 'define disallowed
ranges' approach with the iommu-addresses bindings.. 8550 (and most
64-bit QC SoCs) also have DRAM mapped above 32bits, meaning you'd have
to add a whole lot of boilerplate to disallow these ranges as well

Konrad

