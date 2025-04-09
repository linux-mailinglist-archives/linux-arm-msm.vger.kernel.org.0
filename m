Return-Path: <linux-arm-msm+bounces-53698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B6906A82F42
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 20:50:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B4C6881F8D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 18:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 969252777EF;
	Wed,  9 Apr 2025 18:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tg+0WnMF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0392676D6
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Apr 2025 18:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744224582; cv=none; b=pvg4IUt93WT0STUUGl97Afkxdd7Rn3KCkHjSUXvbiOAKHCqYKgU1+la4QkugwJ5SBoHGG6D8jL+HkDTHm4T79OLFTPo+wgIrm6KZTI//GbPI9aoZBVyNRpXAwXE7KnsWr6YaykYOLfSt5mivdGGjtsYXYZ8wx3LrjHJLcyuh61M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744224582; c=relaxed/simple;
	bh=d1HN9Tr6UusnWUDY09EuhHWuXvJFMZU/PC1RTqx388Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RGhcakwGfCib+Tp83ehmuGwWEeewxKT3ltctoeRTClW9nbAp0qbNFHSoeZrGpqVyxTBsBghuNQvnMXlZ1EYMGFUdPqKyQVcI+ZJiHhzQUpVWnefLomt2AdySfC1DFAZCW9et/EWjIt7RpKYIwLa6G+sb3aSdXFMN8j1NSXHxa58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tg+0WnMF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539H7BGU014998
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Apr 2025 18:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9G1H4peKA3lpmZuEmoeg3zh5n+oBKM3YHIRLcwt6Bh4=; b=Tg+0WnMFbMdwmdAe
	jGAgLCxebue2pQoTHclz7XGlGQ2+BfZjw6B2C6PYKO6E75IOcmHWvybq1HGmJZz/
	8/WKj/sCbOT32dP+eiLNs16mUaE7A85D3H/wH3o5wtr/a2kXlAYAlKWqmSbEJ/j5
	k/i1DOM9PBnkotkmb9LYrtBhtjYx+YoZBepNGFQcGXfCxKIkMddC1O9unS8u/MW4
	xtNZnyV0Wx1yuoclavN6npAop8c5H07iRhdh6CBcqLmO1P0TAidcHuFTF1UrVJXt
	8pY9UnDzK1S1qzUo5dMMlOHqK+KrqirG6aawVI0P56DXG1/V8mWeMoQAdJ+FC8EG
	Obp2Vw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbumg39-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Apr 2025 18:49:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4775bdbcdc3so12489471cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Apr 2025 11:49:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744224578; x=1744829378;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9G1H4peKA3lpmZuEmoeg3zh5n+oBKM3YHIRLcwt6Bh4=;
        b=Q6UdPgxL7FVQDgjSruDXR8ybx+cQOHOtn/ipWaGX/Z/NkneyOuxFGdC92qPXceF+XV
         UEfOmSbfBRWvD/LyzxvXipiEHYzmF1fJOhSdPdbo3fTUFlzjsqedsvLc1ktPJKYiJHvw
         ZgG69ER1vsJvjgBe58FzGUCTCzCInOvtPEkdhuy7eioCUMLgfZN+AxyODa9DUCUbb5Ai
         WVgr714Q0ixVviWeWINmlSQ5GjFX4reoJ9sgrZxX8DmB6aJ8YU81lcH7CNk002LUT9/m
         1Kuu+1LeFGeTKNCFSPJUvdxizc09PLxUpc7CAj++BOHctOx4uGOd/NKGijxWp57g+8/d
         uFXA==
X-Gm-Message-State: AOJu0Yxu/jZ35J2xJfplM18xEPesBEUGcRssUMHwUbGob1211R6XgC8J
	yvA86Y49f2zPz+UF8AWjSwHQfu0QwCHd8J9pB7EP7xqggbiNjSNJbmD3jIO39/AzegQPC8aBh65
	p/FAtcTTfJOQehbtT1KSofvUUdEL2OllqgOM3We97Sl3/mmnjPaUgwvpcTEV5jyhi
X-Gm-Gg: ASbGnctUXGN85ZA8hVlYtk+WEyhPAYYoBzfqepN8tFjuBIou56LW/krLDNYfmFquMtI
	pyxrN5I35gMb/i5GZhDVNeCfUojyUEbQRh8nHjfnWoVg+vSG6pZWRBH/uxiSwUU/7SQPc0JGHgJ
	hYMMpHmaCSU7GNftry8MRTGdep/+5V1LeleZaUSE0i3wg2rHOD3nSNuK+dQ6CWQe8h3NqrEpdan
	MhKvL015i6IO4KrFXlVQ/Z2wlACkQUsx6EQspPiaKBNNvOQprUvNLnS8kfHeyhH5A8JhgkXrWxk
	Nx5daZk1lDSLs2SoiNXQh2EiEV+WTTb9ybZxSnnA/ccSgeGktxQ0AJM2GohanWyyLA==
X-Received: by 2002:ac8:5a85:0:b0:472:1812:23da with SMTP id d75a77b69052e-4795f37eb0fmr18667041cf.11.1744224578468;
        Wed, 09 Apr 2025 11:49:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4IsBpqmt+cYnKoIaMat7rtolFSfys581Xta6Gs0Qhv7H57/HFppjF3Hi21BAzmpJ//NIfkQ==
X-Received: by 2002:ac8:5a85:0:b0:472:1812:23da with SMTP id d75a77b69052e-4795f37eb0fmr18666801cf.11.1744224578139;
        Wed, 09 Apr 2025 11:49:38 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f2fbc0d2d9sm1138649a12.29.2025.04.09.11.49.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 11:49:37 -0700 (PDT)
Message-ID: <07426a13-7897-4fe8-bfc4-549730717e85@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 20:49:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/6] Add support to read the restart reason from IMEM
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ofG3ZFi4lxtiOwSTw3HiDn9ADtEYrLGF
X-Proofpoint-ORIG-GUID: ofG3ZFi4lxtiOwSTw3HiDn9ADtEYrLGF
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f6c144 cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=5K-QkYO3ZFZSxnrS5XMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=804 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504090124

On 4/8/25 10:49 AM, Kathiravan Thirumoorthy wrote:
> In Qualcomm IPQ SoC, if the system is rebooted due to the watchdog
> timeout, there is no way to identify it. Current approach of checking
> the EXPIRED_STATUS in WDT_STS is not working.
> 
> To achieve this, if the system is rebooted due to watchdog timeout, the
> information is captured in the IMEM by the bootloader (along with other
> reason codes as well).
> 
> This series attempts to address this by adding the support to read the
> IMEM and populate the information via bootstatus sysfs file. As of now,
> we are handling only the non secure watchdog timeout reason.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

So I think it would be easier to model this as nvram (something like
"nvmem-rmem" with imem perhaps modeled as "mmio-sram") and then consume
that value through in-kernel APIs (or write to it, as necessary)

Taking a quick look at mobile, it seems like "reboot bootloader" and
friends use a similar mechanism

Konrad


