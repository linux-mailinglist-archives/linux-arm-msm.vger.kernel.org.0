Return-Path: <linux-arm-msm+bounces-90115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2E5KL5THcWknMAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 07:45:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 068216253A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 07:45:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D60274E1476
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 06:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDA1F2F691D;
	Thu, 22 Jan 2026 06:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dvZbpRy6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MCN0WUjX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F4028D8D0
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 06:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769064332; cv=none; b=VluyE7kfnJzib7iRj6YfrG554DZ0arScQLeAu4TXiMXEPE4otyVCXcq45uf+YIWyzi+/gI5oMvVVGUlm4M7OUAOGzzRDSEQ/avjisFHDEsrFBVCP7fGctij7cGFDIl5QsHdBNg/TISXd0n3jlZSSbWbXoXlIJmOrZdZL3ePsZsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769064332; c=relaxed/simple;
	bh=h9IappXemjSPuKBkHpH8jOqmBX+lqCFBU35ibbnL74g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CBtVj6CnA62Q0eQa+KYBZOA+TzHDd5BZIjJKd5q5MXlMcu18AUsT/9AEhUw7jB99CWzYqpQCsaO3XFhmVNta3uLXRo60RjaTTI4V/PfTuO+L0P/eZM/Ax6Y9U8TELvvKGKNni1jLKNh83o+i5Qsclyt9FFkn7UUicvOnbHkD3NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dvZbpRy6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MCN0WUjX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LMUJLf4057946
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 06:45:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c3hWvxUHhpF5011W4/euO3pCXAEb/R4xavbCazJ9uN0=; b=dvZbpRy66RxDOhP5
	TMu5WOwfxbcTnhgZ2VbpDnKxvEBQBtMkCto3DakoJeg/7lMZ/hXlqOiYyXdAQCUg
	L1PU1MTZB36oqs/w8AmHr4OrJIhnjicziIBhHUg1lW32E4n91PH9HFjBl4CTWniz
	0BxA3KYP661iqMFNlEXWWmFzhrErr4tRhfUiaEDWmk223RnJSPEwkQL+WZKMRKvA
	lyE4c3+/mlf1ntKWF9x3TmDc3HgarBw8u9lQdpnVQ1DL9hFnCkn8fHZa2ubCn2+H
	OZH8EDXhPIaqTwE6OtEyAISb2LYeW8ImLlmaHa4KcN5pahBXUl2vSvy6tpCHM6IF
	KBhjxQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu7nbs7pt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 06:45:25 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82181fdf3d5so388584b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 22:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769064324; x=1769669124; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c3hWvxUHhpF5011W4/euO3pCXAEb/R4xavbCazJ9uN0=;
        b=MCN0WUjXUTMq4+OkPU9wMTfiY5VF9yePODrozEFNxKfrRNU+uuvBDL0r96wRKjD3Oq
         q5WKhRz+MdbyrIzXT/VZzTKO1Uv/2JbF3/RWZyn635eCPPLNV+sRGdp4fqffqSaz7Clw
         WCs0cAhX8ltUDPLaMiAdG6S0uhOcniGoRQWgnYc15BdC5wSUWsrCaXICsX4qlYENprly
         d5oeFYDTKHOwP/rqHdH1boXLQ/vO/bSkh3Xd0qzmke01+SOXRzrPBOGf1Q7Wzwe0nXfz
         jos1WBaqa5xmvjH6+I0uVD67VueNnCMi6XFN++KOZDFO5yvQNP9JIEqK++JCxG/Nt8hE
         K/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769064324; x=1769669124;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c3hWvxUHhpF5011W4/euO3pCXAEb/R4xavbCazJ9uN0=;
        b=tfKf3kiB0XM8hC13WcyyLbXqnKT1kinAMJajx4K6Cx6LWKopAzSKRuZZO572huncYO
         Oe/JFrc7tnabxv7WwxqlbFJTyQ5fnZWaz7b7W1NbFtpxII293cWdyKYbYw63uJHdc1ra
         t8xJxAJGAf8x7yTH1rLhfOrmGtCSpVcFb1sRlIQf+2RSEhcxfHVKxscvjS+bjLVy1dXv
         TzPHZ3QQECFh17+4zQLzrklxhMVcmXR51jQwQ7CHPA1+5BzKQQLBUXJdj4NS5QEl/LIX
         Hd8Kbx5kLYsiXFNOy7HfB22OEetXa2rvjSn5/cYPZCHYGvJm2lX+88Q47uQ4W6RgvcRm
         wUoQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4jNGErCgl3isJl6ZXoxCcoAfbfOlzgSFIsQCTWCDfMygQ/BrbLGi+M+aP+hZlSSQ8jKPacxedhRER+cb+@vger.kernel.org
X-Gm-Message-State: AOJu0YzSRFMNh8bROqgCwS6Zguy679epOEaYDVh9ebB2P4P6fiW/d6lY
	eI7zqGix1oc2Fp7Px68be/zL8+KqrmOu9bjQeiSms6iMi7WEXle4WSk47Wb9vN86VYPSyM/0Je/
	RG1Wn1kxXP0c1wgxRwqwkTgQk855NdNGJLu5goOTj+7u5Tm9rbzqfUXqU+fcq5YDzmBs5
X-Gm-Gg: AZuq6aLh0kXZ/TcxHk7c+aGDu/yWJvk5zEKgW9GgMG2diAJOMC/VqPUamiaGhs/WuLF
	YlaksshUsdzTgLRGKXhiYBOTb1bNk5V18BSUUFaNwVonpghQffBzj0uHBGE3vn/F87Tswsd+OBF
	aI0bUPQHdlIyo1DAQ17U+gru73V0g/cQNqO2ySXrer2UceoJgrMpoqBTrlxsVP8Fj80nETFT2Cp
	gCVrqDpN7yc4nawzIKYJIdrWn3bLGuz724z6gChu+uLD2P4oMYE0BiZORSippSyohAU//esaymS
	GGrE9KA9wV9NEhOvtMuEkjmIHoBw6wVGAS5dDKKRFQHBN26EH+sBhAXpGB6nWHleqW/T7yMhyI2
	EsqLy5ChGKWElWH7eu3aeURPK5UE0e06Zw/bcSQ/o2esgJqVX5z4DuODA11k8QI6+N7Dztd7qRO
	Q4a/xselLucLzEL7u40B6x0JCGF/44
X-Received: by 2002:a05:6a00:3a0d:b0:81f:4346:6870 with SMTP id d2e1a72fcca58-81f9fce68ccmr19457701b3a.28.1769064324335;
        Wed, 21 Jan 2026 22:45:24 -0800 (PST)
X-Received: by 2002:a05:6a00:3a0d:b0:81f:4346:6870 with SMTP id d2e1a72fcca58-81f9fce68ccmr19457646b3a.28.1769064323853;
        Wed, 21 Jan 2026 22:45:23 -0800 (PST)
Received: from [10.190.200.191] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-823098cb1basm751620b3a.32.2026.01.21.22.45.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 22:45:23 -0800 (PST)
Message-ID: <d3ec2d98-eb43-4de8-a356-006f0df43c54@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 12:15:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] arm64: dts: qcom: Introduce Glymur base dtsi
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
References: <20260122-upstream_v3_glymur_introduction-v5-0-8ba76c354e9a@oss.qualcomm.com>
 <20260122-upstream_v3_glymur_introduction-v5-3-8ba76c354e9a@oss.qualcomm.com>
 <pmkxaslxodh2cnxbxy6wnyalb4zl64xek5l4cfhtw3k3ywatfk@hyzhbh7wzzji>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <pmkxaslxodh2cnxbxy6wnyalb4zl64xek5l4cfhtw3k3ywatfk@hyzhbh7wzzji>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6fKF38y1G5a4BSde6VE27ri4rjcSmSHN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA0MiBTYWx0ZWRfX4l/VDDwZFc4o
 UxELq1FniW0De3bhIdULAj5f3Zg7uOsNN5NfA9TDEZcCqXgNYqeadHZ1r4K//bhWpyc6Ae0ixXv
 kGkn1b8hN2hmT+SzzSqZLqL37X5IN91b1OTzoxGFfr5y+bGcB0++HcLgz+gTc0xaHUfS5y1uXYv
 tnpz3CzEHnKS9VRvPT5p/PW9ASvgVV5w+G68Gq3sjBCjwrsqqegIg1+yy68/trhPHLEadBD6nJH
 z/aIupUi+PCwhXH/UY+D/GlL2GJKJQ+ILId+1SHGXnNhfyOooEVAgsVJLvjifTBe0Qx9/Tya3mc
 e6Em8gagTxE8L1sQwPMblmLn8gl2owR4DvPfRN/TCAb7zzJSbOg4qh2r3twXqbL14J3GFLynyPR
 pRn83hKvN6N//5+WGhTtSH9OxHqYARkDXbLCjm0/tzoBgq0MQJh1NMkzp8VQu8uCnAvvW4M4r1U
 eUiKVtpiuRqPAK6ZaHw==
X-Authority-Analysis: v=2.4 cv=dZGNHHXe c=1 sm=1 tr=0 ts=6971c785 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=HCOLv22quEAogWv70kkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 6fKF38y1G5a4BSde6VE27ri4rjcSmSHN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220042
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-90115-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pankaj.patil@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 068216253A
X-Rspamd-Action: no action

On 1/22/2026 6:52 AM, Dmitry Baryshkov wrote:
> On Thu, Jan 22, 2026 at 12:05:13AM +0530, Pankaj Patil wrote:
>> Introduce the base device tree support for Glymur – Qualcomm's
>> next-generation compute SoC. The new glymur.dtsi describes the core SoC
>> components, including:
>>
>> - CPUs and CPU topology
>> - Interrupt controller and TLMM
>> - GCC,DISPCC and RPMHCC clock controllers
>> - Reserved memory and interconnects
>> - APPS and PCIe SMMU and firmware SCM
>> - Watchdog, RPMHPD, APPS RSC and SRAM
>> - PSCI and PMU nodes
>> - QUPv3 serial engines
>> - CPU power domains and idle states, plus SCMI/ SRAM pieces for CPU DVFS
>> - PDP0 mailbox, IPCC and AOSS
>> - Display clock controller
>> - SPMI PMIC arbiter with SPMI0/1/2 buses
>> - SMP2P nodes
>> - TSENS and thermal zones (8 instances, 92 sensors)
>>
>> Add dtsi files for PMH0101, PMK8850, PMCX0102, SMB2370, PMH0104,
>> PMH0110 along with temp-alarm and GPIO nodes needed on Glymur
>>
>> Enabled PCIe controllers and associated PHY to support boot to
>> shell with nvme storage,
>> List of PCIe instances enabled:
>>
>> - PCIe3b
>> - PCIe4
>> - PCIe5
>> - PCIe6
>>
>> Co-developed-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
>> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
>> Co-developed-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> Co-developed-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
>> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
>> Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>> Co-developed-by: Abel Vesa <abel.vesa@linaro.org>
>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>> Co-developed-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/glymur.dtsi         | 6122 ++++++++++++++++++++++++++
>>  arch/arm64/boot/dts/qcom/pmcx0102.dtsi       |  107 +
>>  arch/arm64/boot/dts/qcom/pmh0101.dtsi        |   45 +
>>  arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi |   83 +
>>  arch/arm64/boot/dts/qcom/pmh0110-glymur.dtsi |   83 +
>>  arch/arm64/boot/dts/qcom/pmk8850.dtsi        |   70 +
>>  arch/arm64/boot/dts/qcom/smb2370.dtsi        |   45 +
>>  7 files changed, 6555 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> new file mode 100644
>> index 000000000000..c0ecc64202c7
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> +
>> +		pmh0101-thermal {
> 
> Why do we have PMIC thermal zones as a part of SoC DTSI?

There were comments on v3 about moving them to out of board dts,
https://lore.kernel.org/all/aUko20ORsgrlZrIn@linaro.org/
glymur-pmics.dtsi was dropped in v4, the changes were moved to glymur.dtsi

> 
>> +			polling-delay-passive = <100>;
>> +			thermal-sensors = <&pmh0101_temp_alarm>;
>> +
>> +			trips {
>> +				trip0 {
>> +					temperature = <95000>;
>> +					hysteresis = <0>;
>> +					type = "passive";
>> +				};
>> +
>> +				trip1 {
>> +					temperature = <115000>;
>> +					hysteresis = <0>;
>> +					type = "critical";
>> +				};
>> +			};
>> +		};
>> +
>> +		pmcx0102-c0-thermal {
>> +			polling-delay-passive = <100>;
>> +			thermal-sensors = <&pmcx0102_c_e0_temp_alarm>;
>> +
>> +			trips {
>> +				trip0 {
>> +					temperature = <95000>;
>> +					hysteresis = <0>;
>> +					type = "passive";
>> +				};
>> +
>> +				trip1 {
>> +					temperature = <115000>;
>> +					hysteresis = <0>;
>> +					type = "critical";
>> +				};
>> +			};
>> +		};
>> +
>> +		pmcx0102-d0-thermal {
>> +			polling-delay-passive = <100>;
>> +			thermal-sensors = <&pmcx0102_d_e0_temp_alarm>;
>> +
>> +			trips {
>> +				trip0 {
>> +					temperature = <95000>;
>> +					hysteresis = <0>;
>> +					type = "passive";
>> +				};
>> +
>> +				trip1 {
>> +					temperature = <115000>;
>> +					hysteresis = <0>;
>> +					type = "critical";
>> +				};
>> +			};
>> +		};
>> +
>> +		pmcx0102-c1-thermal {
>> +			polling-delay-passive = <100>;
>> +			thermal-sensors = <&pmcx0102_c_e1_temp_alarm>;
>> +
>> +			trips {
>> +				trip0 {
>> +					temperature = <95000>;
>> +					hysteresis = <0>;
>> +					type = "passive";
>> +				};
>> +
>> +				trip1 {
>> +					temperature = <115000>;
>> +					hysteresis = <0>;
>> +					type = "critical";
>> +				};
>> +			};
>> +		};
>> +
>> +		pmcx0102-d1-thermal {
>> +			polling-delay-passive = <100>;
>> +			thermal-sensors = <&pmcx0102_d_e1_temp_alarm>;
>> +
>> +			trips {
>> +				trip0 {
>> +					temperature = <95000>;
>> +					hysteresis = <0>;
>> +					type = "passive";
>> +				};
>> +
>> +				trip1 {
>> +					temperature = <115000>;
>> +					hysteresis = <0>;
>> +					type = "critical";
>> +				};
>> +			};
>> +		};
>> +
>> +		pmh0110-f0-thermal {
>> +			polling-delay-passive = <100>;
>> +			thermal-sensors = <&pmh0110_f_e0_temp_alarm>;
>> +
>> +			trips {
>> +				trip0 {
>> +					temperature = <95000>;
>> +					hysteresis = <0>;
>> +					type = "passive";
>> +				};
>> +
>> +				trip1 {
>> +					temperature = <115000>;
>> +					hysteresis = <0>;
>> +					type = "critical";
>> +				};
>> +			};
>> +		};
>> +
>> +		pmh0110-h0-thermal {
>> +			polling-delay-passive = <100>;
>> +			thermal-sensors = <&pmh0110_h_e0_temp_alarm>;
>> +
>> +			trips {
>> +				trip0 {
>> +					temperature = <95000>;
>> +					hysteresis = <0>;
>> +					type = "passive";
>> +				};
>> +
>> +				trip1 {
>> +					temperature = <115000>;
>> +					hysteresis = <0>;
>> +					type = "critical";
>> +				};
>> +			};
>> +		};
>> +
>> +		pmh0110-f1-thermal {
>> +			polling-delay-passive = <100>;
>> +			thermal-sensors = <&pmh0110_f_e1_temp_alarm>;
>> +
>> +			trips {
>> +				trip0 {
>> +					temperature = <95000>;
>> +					hysteresis = <0>;
>> +					type = "passive";
>> +				};
>> +
>> +				trip1 {
>> +					temperature = <115000>;
>> +					hysteresis = <0>;
>> +					type = "critical";
>> +				};
>> +			};
>> +		};
>> +
>> +		pmh0104-i0-thermal {
>> +			polling-delay-passive = <100>;
>> +			thermal-sensors = <&pmh0104_i_e0_temp_alarm>;
>> +
>> +			trips {
>> +				trip0 {
>> +					temperature = <95000>;
>> +					hysteresis = <0>;
>> +					type = "passive";
>> +				};
>> +
>> +				trip1 {
>> +					temperature = <115000>;
>> +					hysteresis = <0>;
>> +					type = "critical";
>> +				};
>> +			};
>> +		};
>> +
>> +		pmh0104-j0-thermal {
>> +			polling-delay-passive = <100>;
>> +			thermal-sensors = <&pmh0104_j_e0_temp_alarm>;
>> +
>> +			trips {
>> +				trip0 {
>> +					temperature = <95000>;
>> +					hysteresis = <0>;
>> +					type = "passive";
>> +				};
>> +
>> +				trip1 {
>> +					temperature = <115000>;
>> +					hysteresis = <0>;
>> +					type = "critical";
>> +				};
>> +			};
>> +		};
>> +
>> +		pmh0104-l1-thermal {
>> +			polling-delay-passive = <100>;
>> +			thermal-sensors = <&pmh0104_l_e1_temp_alarm>;
>> +
>> +			trips {
>> +				trip0 {
>> +					temperature = <95000>;
>> +					hysteresis = <0>;
>> +					type = "passive";
>> +				};
>> +
>> +				trip1 {
>> +					temperature = <115000>;
>> +					hysteresis = <0>;
>> +					type = "critical";
>> +				};
>> +			};
>> +		};
>> +	};
>> +};
> 


