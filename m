Return-Path: <linux-arm-msm+bounces-69692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD5FB2BCBC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 11:14:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99E3A1964439
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 09:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37D32318131;
	Tue, 19 Aug 2025 09:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ALYpNebQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13EE319863
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 09:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755594655; cv=none; b=Wx0YGlVSsnOaltxNE/gd1kMGoc1JJei6P8gkhIyqBIH38+GLXwPDn4z2BwX8NM01aGK7moiXMN/heAWX4tiPCxASV2Yy1VHrf4PkrCrSeFZk8/HQnpNmfTYrwnW4GaO9mOpcaweJ5j0MsuAS9XdQWvfvidQhIDOdfvElfUdCn3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755594655; c=relaxed/simple;
	bh=c/0xNcgwWCHWAKR+JVYlYWfbwgtw6ExzI4wBauUtpcY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MBgGWWMWErB8mPso7R3iaMWxjnYyaPvMHSfo6dFZjr7vD7RTv+MUKfgqVvniro4KPZqzLZrjMK1PdzA1uuFHob4oxF2nCDuKgzJrvkFpCVmLhpFCzY0CSMgXgn/dKy4fARn0ougfZFPGXkQZ1JdnmU4FYRLyl8PI1YBiU2gBomk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ALYpNebQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90XMs030328
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 09:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XsV7Sy9k+vwy5ouGV8qiQwIlxBTG3StwfrEciiJABG8=; b=ALYpNebQBBPQijLH
	hUgUj/WaqcCgC6a24ZsazZdY6HSViOWR2cUpffsVfFMQBcwMU/ci0l59/XhzRlMY
	HUDYarrd2Qo24Bh0U5Ir1DBmsNLQ2HuvxLh5Vxa8N/s3vC5vJL5fuU/KWnsSgTU4
	f8QSTKUZOAaEr2gr0R8+bvO54UYch2wljZYFQvx8V8OlMYYbRi0OQVTJTAh9D9V8
	hdENLe9vQNi+00MiYn4UyhMtJ0f4ut0glI52e2q5wSxZCcADoI3eLb1Oe9p1kTdJ
	4fw5+a2ZI4G/BwYxOLUP6EIlTDczbOH8KR655mMtJcvrvXl0uaD5xwyIwaDpXTEX
	tc06/g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48kyunv5dm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 09:10:52 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24458121274so61734295ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 02:10:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755594651; x=1756199451;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XsV7Sy9k+vwy5ouGV8qiQwIlxBTG3StwfrEciiJABG8=;
        b=q/BKSKw5QFVUxq4rxgaC6MJc2Rhe3ANIP4191UVY0xUPDmS/M+gOlOFjRVewDSME3a
         AoH3epla4u+isJL+ytw6UUEva+CaR9jhdZjnVmkuYhOG05SDWQ/eT1skhjV4FX/yvybs
         r9ZglEJJC3+j1FqbXgiWY3ekxKZunZy+LM1FCySeGwkbBf7PDpNEA2MkGfIGNQS/TSfh
         VjguQncwDfQDa4XLRF7X2QVcsdmgOXGczeuNnEL/IzLTIVhQqpRFb19tgNBWOWzONgs2
         d1GLzB8+4jic13lYJyJcTiFdtuT5qZ3i5d3d3Z/zIL9lNeF840cmCyFKsevYmXUsHTy4
         Xq7w==
X-Forwarded-Encrypted: i=1; AJvYcCWoA2HZZHPShvUjBGJp0ZQBOxqFELefgIvQyD+GyoS+wucuZjf1fSk9XTgJ6O2ff/GGkvMh5BkKE7KKfI6u@vger.kernel.org
X-Gm-Message-State: AOJu0YzJv+B/xv02JdC6C/QPhEjMuHwrIO80zB2H8frcoUO3wW6Cely+
	UbKay7NCEbk4Ea/MF1RkG2h4OmHkUtpjz8PpFDf6wHf9IEpY0a30HAiQlIs4IzBC6j18fY40wff
	KWloGz8n2cnpdCFLIIztJ09/LzElm66+YDxTTIzmMUN9x078aCwddUDDT7eVmYMs/1dUf
X-Gm-Gg: ASbGncuA6NiED2mMWswpKJmVbXU6FrtZkaWii+pFSQGN9acy7B0jBLSNh0ayfBqlRs8
	ADvV0gZ0mxYHYSw7X4AuPJPvy+DnrjacR+3hTmEdPaW3PO2S/MCY7mFFmjAtp6iqOURV5olAuiT
	WHvA1nRUBXu+N35Ly0vwYrtkSsiGhlPk61BbWJGYbo+s17bHFh/jZESETs/Q0S7bW09Gs+vE4jm
	hxmXC++FTSStHn66EFajuNVTBcvx+WLzQI+mCqi+2P9j9/09Cvj7FTPdXMr7N2M7dp4EHTETWlz
	xjmO3qKptf9G+CyqVvbDyeOs2pY7/8f43HdWiGUbPiwiRn/Bi5C8ZNp4nQZ5NN5ZF8HueQBC
X-Received: by 2002:a17:903:2442:b0:225:abd2:5e4b with SMTP id d9443c01a7336-245e0491239mr19189135ad.16.1755594650994;
        Tue, 19 Aug 2025 02:10:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcIlqBWyX5Tv1soCJZ6KctFg2AezqPzi/p+uzBDvpy7KJX24LI0Ju+K0knNxrEaJDXB3Sarg==
X-Received: by 2002:a17:903:2442:b0:225:abd2:5e4b with SMTP id d9443c01a7336-245e0491239mr19188855ad.16.1755594650142;
        Tue, 19 Aug 2025 02:10:50 -0700 (PDT)
Received: from [10.217.216.215] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446cb065a6sm103629125ad.52.2025.08.19.02.10.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 02:10:49 -0700 (PDT)
Message-ID: <be066c47-5d94-4182-b8f2-5c353e078227@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 14:40:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sa8775p: Add clocks for QoS
 configuration
To: Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
References: <20250808140300.14784-1-odelu.kukatla@oss.qualcomm.com>
 <20250808140300.14784-4-odelu.kukatla@oss.qualcomm.com>
 <857f56a9-0fe7-4c10-a55d-b00740a8be02@oss.qualcomm.com>
 <7c96f881-23ae-484c-82b8-d388a5c637ca@oss.qualcomm.com>
 <04e09739-2462-4a4d-8378-6c6514dca752@kernel.org>
Content-Language: en-US
From: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
In-Reply-To: <04e09739-2462-4a4d-8378-6c6514dca752@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: JRPSEEX5UXhs_GjPD4j0UKUJ0tECUqQR
X-Authority-Analysis: v=2.4 cv=N6UpF39B c=1 sm=1 tr=0 ts=68a43f9c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=Oyi9YktmGe5suzeJu0oA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDA3MSBTYWx0ZWRfX1H9F8TZ+18yX
 uSG1X8zQJpxBr05sLLWJ01toV5S9iskxFuQYS7+mge2FyIBVOeerulOl2pJLd0txZ+ZjNO683xD
 7MsTKCbkL9gHT+BvNzgPtRmz/e6rKwc1v9wgkXmpgSU1ssVl6BKtiifzSPSrK0pu3ofVpvz4JOu
 61pdGdUONk2o9ahsW5gyRYdsrDb32nlH/sDiCSrYdEyB0pFYvqNhR6tDriIKX2JjFjSdZSNmkNV
 4HclkzlptwQaSEs0bnkHXOeiBQy/wsgA8pcPGuvz7RSksFM3uVhGcAmaMg6aHL2AM5Th/N6t7tG
 xVdsLMFNK9hZWFF0NkWF/PZurXxt7ipRI6hJE2TWd1nPxttB7CtKDqpDjJxxd8N4K1zQ/amAC4X
 n8Zrs9XM
X-Proofpoint-ORIG-GUID: JRPSEEX5UXhs_GjPD4j0UKUJ0tECUqQR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180071



On 8/15/2025 6:41 PM, Georgi Djakov wrote:
> On 8/13/25 8:45 AM, Odelu Kukatla wrote:
>>
>>
>> On 8/12/2025 3:21 PM, Konrad Dybcio wrote:
>>> On 8/8/25 4:03 PM, Odelu Kukatla wrote:
>>>> Add register addresses and clocks which need to be enabled for
>>>> configuring QoS on sa8775p SoC.
>>>>
>>>> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
>>>> ---
>>>
>>> [...]
>>>
>>>> +        system_noc: interconnect@01680000 {
>>>
>>> stray leading zero
>>>
>> Thanks for the review, i will address this in next revision.> I also
>> see there's a camera noc.. are these controlled internally
>>> by Titan nowadays?
>>>
>> Yes, camera NoC is controlled internally.
> By internally, do you mean that it's controlled by some camera driver?
> Why the camnoc is not using the interconnect framework?
> 
Camnoc is internal to Camera subsystem and is controlled by Camera FW, i
think it is not by camera driver in kernel. > Thanks,
> Georgi


