Return-Path: <linux-arm-msm+bounces-108068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFBNNC0ICmqNwAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 20:25:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BED0563162
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 20:25:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E81F130028B9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 18:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ADAA3CD8A3;
	Sun, 17 May 2026 18:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mAmwSLz8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GbVIfd7U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8F63CF04F
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 18:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779042347; cv=none; b=ZdS86w0zF9TIXxtOzb0n0McTWK/N97STZkDyjJ+JYh6o8WnuTThgak/lLMiOeixWpJ9J2nfV4uzsR5xGF4hILYAhOYLX7QmMQNVgp1FHByen1FF4GrS/iT7WCR6PBSSD9e0BKC27aq2dq/VNwsaN4IwPKjPy+J2oZL6F9uhWZ6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779042347; c=relaxed/simple;
	bh=C5/4AuL6dHCuR+PvSd4Li62LFYfLWCvoVixDNatHrQw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aTtx97ki77hMjKvgF2hep3pTKv/SXEQdNJT8gtfZgSKAxoZ1+phNZYkmkGeE+RcwFni0fyn9RwuEcDUsaBtLBUyAD6rLN5KAMzgt318fXZhwCGvQDgByw78n2XRzcZIl71sOoMhNTIy9SiYAvsyDezue37qt3dg7wr4blU3RVLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mAmwSLz8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GbVIfd7U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H4jl6O2847494
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 18:25:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0hIgd5emPImxsCYoDNvc3nRtQaDZundm1lfilHY8CfE=; b=mAmwSLz8eHCshU3L
	eVkVOLIP4k8QCd64PSX3UV2BqIP/+5RGoRu4VpWbR4zqiZFT4utbPSj31iqzKLDG
	rQOYJkV9fv3zZSOz6DLJcG67gLeulTtC4TegOYSv06GcGxTAmyxkqSYnySHzNbO0
	np5Dcu5glYGjMQCeiWoWdQt1JSp44ZPmqnEMQq7a2IEDlMv55M8UH2t+IMKVSUkF
	58M+j9wtnu/8fpsHUvOauNw68pNLVGZwgcjl5OMkM0LU1c+HETUZwGZ99nNo2wD4
	0hyT6fFxAn5gBagZ1npAsWXPeGzg5k0tije10qv21chQXHYn6MszILHrIrHV5Q1d
	FPobaA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h01kcf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 18:25:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-367cb6de61aso102639a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 11:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779042338; x=1779647138; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0hIgd5emPImxsCYoDNvc3nRtQaDZundm1lfilHY8CfE=;
        b=GbVIfd7URe/MPK2mdspM8c2XzfNfS3esaSilyc9rbYmR4+MBBXU83d3ulo2qSIygPN
         0GoPJv93ILZh9uyE0DNpn5zbcWxoXKquVakZnGF2u5b5srHHvb2rS8WWjnmIRt10LfVE
         tn3FlyMHWNbpi8QtbKeMKMojX/oDP95jr0HAf6NORYKMiBhm8SrJP/oaUf3xfEHN24ZK
         fht6JZn5I4DlkdMbkKv+srRkxmdZgX25jHkOUA5tEZZZ3EDGb1bUGCZ20zI2rKxCSq1s
         BqgIOQCYewAMVyVbG+2Ht2m+WMutO1+ddggl09vHxLwRdiccmcqNubHoxLCySqAlc8qj
         Su3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779042338; x=1779647138;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0hIgd5emPImxsCYoDNvc3nRtQaDZundm1lfilHY8CfE=;
        b=QAqbHsL7tFmXA/NEKjXCBxUlw50+pw7N5hU2+/YsOOQDTbTAXy4crnIArsDhNkAJpP
         sTnDv8W1pzliG3/9sMGYI/aJmC4vGFsE9m187WCAQGWTs8WF5+loL1l63nysubtHpg74
         evRkr7Wb/EeOGLxVWmnATh+BN00JvttLfAZZaHnjf7xpUk2Yuy7GZS+HPQq1RxAHMyGY
         4A/lAZyHkPYtcGdzYEhEmwP7uTXdCRu6jaMe0igdtmMWxV+mlf83UrYw4cmgi5ShVGPi
         6jthnzF9VRUg5TfubsCz0jI/fUuafXGdFE0Oi6WPt+ZgpaPgucl/uo+wghpGa0sms5Ue
         oAkA==
X-Gm-Message-State: AOJu0YzheUFS9Yf1A9NlVikoz34YAyXn/Ir4l4huH9TlECpmazIdIudZ
	HZdbzjn0cJBZNx1q011T5s3o+eXhbmNj9MtD1CB+o8P2jGpunnR5CwAIz1iE8F6vFatlueVp08C
	6HeSwMVvgD/9zy7iffWKSdbgWrhcszvAdC8igkKv98JYp2yMTid4CNKaBhKyUXh7zpvIZ
X-Gm-Gg: Acq92OGOfSoHCLtSx6amR5BeHrm9k16ztJtlqFYrtE0CdXAHpb6hcLkMzT5e7nSaG3u
	cEcJzVBR8Rn7Vk16/HOW8kxs+69ntlJPIOX8kg+9tZsKtnjcEXVvINsRfbSgnx7Um6fHGHlX/Wy
	x6dPBwk5R53V7SifnAoMce0qZzxUlzl1FTd0VwxfQ5kKwHDx86HqaCg7bWDMOPk33EKeyrGt1yh
	0ykvRhzcyWK+ajnO6CiWEjZ01hl+aOvyLvUJ0tRWyX6bO+XQDp1x50f9+jd7OUp/e27I6wldsTJ
	YZh0rV61Xqliy9jd73Gw2G44eZkZZ9YEM36J9lKoHsEo7beNtOXEMBvGfETlPfQwE86lDmz69HZ
	yvat28LuLAsUT4n5OtL8OZSli2K4YNOZNJF0S8dPGLC2SgqTGJ1A=
X-Received: by 2002:a17:90b:57c7:b0:365:7e4d:bcb8 with SMTP id 98e67ed59e1d1-369519cdb59mr11841972a91.1.1779042338045;
        Sun, 17 May 2026 11:25:38 -0700 (PDT)
X-Received: by 2002:a17:90b:57c7:b0:365:7e4d:bcb8 with SMTP id 98e67ed59e1d1-369519cdb59mr11841940a91.1.1779042337545;
        Sun, 17 May 2026 11:25:37 -0700 (PDT)
Received: from [192.168.29.166] ([49.43.235.85])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951278e7fsm8478759a91.8.2026.05.17.11.25.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 May 2026 11:25:36 -0700 (PDT)
Message-ID: <68dc84ac-794d-49e5-a834-e7a582753b07@oss.qualcomm.com>
Date: Sun, 17 May 2026 23:55:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: Introduce Shikra SoC base dtsi
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>
References: <20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com>
 <20260512-shikra-dt-v1-2-716438330dd0@oss.qualcomm.com>
 <ced00124-9ba2-49ca-9200-62abd6ac3340@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <ced00124-9ba2-49ca-9200-62abd6ac3340@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: d_VzTx4eKX2luE9BzmDDJm3PO1ofhecr
X-Authority-Analysis: v=2.4 cv=XbG5Co55 c=1 sm=1 tr=0 ts=6a0a0823 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=g4/7f0GlZvY0MGcqtTB0Sw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=91D59dQ6MEgKE8FQPpwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: d_VzTx4eKX2luE9BzmDDJm3PO1ofhecr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE5OCBTYWx0ZWRfX6fTEFCblVJGV
 e80hXWW2w3FCwSK/g1WtnoAANtddkfckBm6DySYdwJTJlxTrA/b/G9QIwhRpAXBtuFiRcMAXWp+
 GC1xYl0br1gxZa2D2gFNsm7hWTtL9Yv/avRuxWGvw6Dx/7HcIsUaOBXNX+TCsRDzpwRA6NYYVDh
 2fOh+SYocJ7yu5mtOxNUFm4+X3He0kY3DjZvaX0D17/pPrNtXZGsGrg8o9aSZUuL/4fq0bZeXAN
 yki6WBJaDHO7Z8oeP+aNRdNeDmVQMahGBSljdeZ4ZWGP/bn5bTTt7eeylR69en7L9Ab+YdYcqqc
 nUuKpYpSCwz4cqzSjrnqihWx2o3Uuj5FYwQZduIrm92UMZVTg7Osg1N27edikIAdvBmzUzCe++K
 oJYzU7c7NtACZpKhDmQsC9GKxHfSspn510CM4He5/tEAgJ3TzfbXzVnSPV0J3h/1cccej7OSzlZ
 +4eq4JvslyQkb8nIDeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170198
X-Rspamd-Queue-Id: 8BED0563162
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108068-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/15/2026 4:07 PM, Konrad Dybcio wrote:
> On 5/12/26 6:08 AM, Komal Bajaj wrote:
>> Add initial device tree support for the Qualcomm Shikra SoC,
>> an IoT-focused platform built around a heterogeneous CPU cluster
>> (Cortex-A55 + Cortex-A78C) with RPM-based power and clock management.
> [...]
>
>> +	pmu {
>> +		compatible = "arm,armv8-pmuv3";
>> +		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH>;
> Considering there's 2 core types, you may need something like:
>
> 9ce52e908bd5 ("arm64: dts: qcom: sm8650: switch to interrupt-cells 4 to add PPI partitions")
> 2c06e0797c32 ("arm64: dts: qcom: sm8650: add PPI interrupt partitions for the ARM PMUs")

Thanks for the pointer. I’ll update this to add the required PPI 
partitions, following the SM8650 approach.

>
>> +	};
>> +
>> +	psci: psci {
> Unused label, please drop

Sure, will drop it in next instance.

Thanks
Komal

>
> otherwise:
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad


