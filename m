Return-Path: <linux-arm-msm+bounces-75661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FD0BAFD4E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 11:14:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 417604C0236
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 09:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1738F2D9EC8;
	Wed,  1 Oct 2025 09:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q3Bk/+Rj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A172C2989B5
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 09:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759310053; cv=none; b=exc+nMfiukTfFdOCM4Kh4+NxNXEdcF93LM9cnIs1HvzqCwZAUZzJi161DleBt/uDjf8H1kiRn680ajQ2x88t2LZ/W+LPGpYm+WvToZ9smWc9AMX/hURZnUNBCtoMvI94JimIpGBDTzPUA63HpBTfoVCyLMxRFxvQTvO+QAzEmYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759310053; c=relaxed/simple;
	bh=DiKOiuOUrDOlbJnzJU/h1DMix21rOvJ9MIGTIzcCuLw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FjtW2BMYYGkVcBGemveRzEwwcg1/sDh2VUsyrkRm4jS+/bwEh+2COzfQA5GNBgttI3TtFTNTnPrOpRhzZXBsc8OJOFnGOxO6ZWfEOTykjYJ7EuhYfjGHLDvkzrc6IizHK/KOxyJlVIgztKgMW8K3JJ/yzsSn4A1iVRZYZXRmG1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q3Bk/+Rj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UMfgaV017702
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Oct 2025 09:14:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rn3/KCzj9e9RYjWV5CHIU+LrVXqFk2tQ42l7zJWamMo=; b=Q3Bk/+RjjREsrk/n
	MEw4NpcMDm9AtkNhRFcdtGRhaNPoiW58Y2CsOIXdZwQgBPcElLBOZKWBfetz5lGS
	EFeWgPAVpkNkGheylbMm3NJ37nOgapyxnbVoM4iM3B6YGizuaiH5wiIAP1KEAie1
	f3WvUvy7rJrs16gNLGzhemDPY1GfrdW3bOBn5Ga6ubhlhiFznrMATfA++Vo0ybek
	D8SpCQ8V92Xm0VW4w7gnvx95X3MI/csR+Dos/VpkfGq1zruU3LDp8Gdyc7Kz1Slc
	n8aiQVxKFQKVjhn4q0MHWA/6FmqshUo56vKXlNykmGBfBPFNuwx7/doFYif2JYqe
	tJJvow==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e93hkpfn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 09:14:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-853f011da26so262646885a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 02:14:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759310049; x=1759914849;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rn3/KCzj9e9RYjWV5CHIU+LrVXqFk2tQ42l7zJWamMo=;
        b=XnBdxIIbzBW+O1b9Vz9EJVq0ZeU19K0dqrUABIp0rk/cHlpbRnPDfvnLaZRC1RBssm
         Ugqh3CTfq0EtjPjDDD3Wsm6NoM5inxl6MYtazFJ7fdCvWEggCcrKhuaBVGAcXueAnz98
         6r23iiz/4naYxkzaSvknLKV3ySh/WZqrgai3D76wUeyqMYMtNkMfNJAOlpt2KxctJEgu
         wgw1Q1VDSLXtzaLfJwQiZDQAgYM0QM2kcc73Vka2nqMBYNN3jWEnst7Sg7tEp4Id0mMB
         BDdihFv5ZP4v/aVWLGnGHC5ZD8a2MS2tHWpLNpTTr2QTjDwNW6dRTW3RZqw1Zntv6Tbh
         +ZEg==
X-Gm-Message-State: AOJu0YyH2EZpLB9e7EZbG/TJksNMmefWYiHdH6dHwhV2BR6eONImlIyy
	gPm/1USII3uepMJugVloCvkSJw2vU9b9KyMRDZRWIrOdbo9GkvYTXRQkVfy0dsQGor97yczUadu
	kyMaPRCHms8EkuN6Sq+WIhVP2jiWN4/5O+1v9T/uwIP+zAmmg5SVjtcdW/GNY89h6L6v7
X-Gm-Gg: ASbGncvs0LHbXEBoExjYUn/oA0xQ/II71c82C5aslfBZ5Wxn1ptyyy4gTvYvvBLt7yG
	ICpVDUxCxMQyYOmu5A8E/dHiHhr6VmMz3r1r4c0WOxdWpISsrPY0bTJH6K5LRjBeqpgyHmJKL9i
	LhI/zC5T5vm16MNgxfIaSNaJAh+hy3QZv+vd0KhFxuaVYYooyAukcq/MxHbmNJe3gR+wv431sB2
	UvlCeQzDgVr5RllSqvy+SfqgANWH/KMGHCN1NrbenwpSGwI3sbfkDI+rNWVklOspr1mKXxhA8VP
	ULaH1Yb59C6L7bjRaSNeAofBFbbuOWq+gDtE2DUs6SIU5uzqQ7iNCA4mA/APSjUb9PylQ168t8t
	Xh1REI+IgTKxvivZjJPf2EuWhf2U=
X-Received: by 2002:a05:620a:4095:b0:827:52b2:42be with SMTP id af79cd13be357-873705f0553mr259061585a.1.1759310048781;
        Wed, 01 Oct 2025 02:14:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGENrGs3rsybFlp3G03YUI5//8oZwz0h6YnC6O0icQirUqBpC1fptftVFehVajvDELL7EbvWA==
X-Received: by 2002:a05:620a:4095:b0:827:52b2:42be with SMTP id af79cd13be357-873705f0553mr259059185a.1.1759310048211;
        Wed, 01 Oct 2025 02:14:08 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3cedacd973sm725041066b.49.2025.10.01.02.14.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 02:14:07 -0700 (PDT)
Message-ID: <f58493a9-6def-4610-9c3e-d6a877dc23d3@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 11:14:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/11] arm64: dts: qcom: sdm845-lg-{common, judyln}:
 Add wifi node
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
 <20250928-judyln-dts-v3-7-b14cf9e9a928@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250928-judyln-dts-v3-7-b14cf9e9a928@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MSBTYWx0ZWRfXzRR1sWXW/EmC
 ldwDqKnTzTK3ZXijNtJ0WdokFTJxjMC5fjy5/Vw1nbFuVjnYADCI3IFWA93AtQASk5qGov+y6GC
 hySh5W+94ncWBYxl9yevrvZk1uKsr7aONruGcUHj8Y5niJnB/6rnGnAGehWLvqK2WC7RF73GESe
 j4IPGi2g0hcCduzOnNG+ZeC6xfeqZ99Bpf4lKTkndl8G+zSVdTRqp5Bm37i+YQyOg30psaJW5w7
 Gc6NW2I8ocKogrwOaEGYXecUuagwS+MLlqprFRJ7S+wIu1cSgScCA7HMyE+CTEzlpFD2B/Mo2F1
 ZpomM/zfHhhhxYwZedIiFOllQHf2RFV/UlovByNOBWZw/xQRujy15aOrQMZkvL3/j09PhvsRltU
 kaEpnPXuV9StD65HeYFePRbJyWM7sQ==
X-Proofpoint-GUID: cQEnUauWBGWT8Lg7SNfaGD2IN68J-Iw8
X-Proofpoint-ORIG-GUID: cQEnUauWBGWT8Lg7SNfaGD2IN68J-Iw8
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=68dcf0e2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=IqCYnrxLgLuRO9zwK-sA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270041

On 9/29/25 7:05 AM, Paul Sajna wrote:
> Wi-Fi now works with this patch and relevant firmware
> 
> [   21.488274] ath10k_snoc 18800000.wifi: qmi chip_id 0x30214 chip_family 0x4001 board_id 0xff soc_id 0x40030001
> [   21.498477] ath10k_snoc 18800000.wifi: qmi fw_version 0x20060285 fw_build_timestamp 2020-10-12 23:35 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.2.0.c4-00645-QCAHLSWMTPLZ-1.336037.2
> [   22.973165] ath10k_snoc 18800000.wifi: wcn3990 hw1.0 target 0x00000008 chip_id 0x00000000 sub 0000:0000
> [   22.983265] ath10k_snoc 18800000.wifi: kconfig debug 1 debugfs 1 tracing 0 dfs 0 testmode 0
> [   22.992048] ath10k_snoc 18800000.wifi: firmware ver  api 5 features wowlan,mgmt-tx-by-reference,non-bmi crc32 b3d4b790
> [   23.045368] ath10k_snoc 18800000.wifi: htt-ver 3.83 wmi-op 4 htt-op 3 cal file max-sta 32 raw 0 hwcrypto 1
> [   23.130581] ath10k_snoc 18800000.wifi: invalid MAC address; choosing random

I was only interested in this hunk ^

please trim the timestamps, too

[...]

> +&wifi {
> +	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
> +	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
> +	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
> +	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
> +	vdd-3.3-ch1-supply = <&vreg_l23a_3p3>;
> +
> +	qcom,snoc-host-cap-skip-quirk;

As the dt-checker points out, there is no such property

If your wi-fi works regardless of that, you probably don't need
to set the one you intended to

Konrad

