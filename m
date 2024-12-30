Return-Path: <linux-arm-msm+bounces-43632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1469FE66B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 14:27:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87A9118804AE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 13:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D8FE1A83FB;
	Mon, 30 Dec 2024 13:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UsChHEOC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B535D1A08B5
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 13:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735565269; cv=none; b=eqr8iXTmMgL9wipa7uWoI2/nUF4RHwZbduAx5sCrNrULtwU7+xlFlyMqOaHY0sEQLLmRAPV3lfQZge/WWedXE2rmYf5sns320JFSB0B1a4sQ9TVIhQ9d/02ZpZnloxWE7R/Dw0Jb9yub/AO/MOazae+VrrDi4PTYNIUAfPQRG3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735565269; c=relaxed/simple;
	bh=iRe77x4L3qQ/MfCgCsfhQ6rnJQOIfHQllCFcW4Ysjx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mONdIIEp9cS22L6M5GhO48x/DMIvv7c8rPfXHQMg5HlS65irq2jiHh3Y5zqBkgorWGopEKfzj+XRlNVNsz7vjZYrPb0nz5AG0P6jU/pxPgDa73Pv9Lb546XV/Ojg1KiZoSq15wAN/TXhw8FIaoBnUty5yca4zMEajLiVuHOIXro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UsChHEOC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BU5RxlU005524
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 13:27:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZJBxj8Iw+5ZbEc/TiXmp4SHBivwGp93PUTfCe/CLKJk=; b=UsChHEOC39Xa0LQT
	E2yrH38j/l5SzkDhGOR0B65KpGlv6P+ARaROflR/OxOLJbA3GzheEhsKr+orVH9H
	cCVSDPrcdPKb/IFfD+n7R4wFWmazgMeNxKaioPT3wQat4+Q0taIpQ8Eqv26xraDs
	IbH+yvWAhnzZLId/hHMCwlwHbFhQJycBjOtSzR9U0eA5pyCLp0lao2cICw2gf/hS
	44ZuEnuv/MIQws4uj5B5/CDINi0Mm4NcW8DdNrOjy+2eKNsiRhwxffjHDsWzOQly
	F81Imod6HZEHm0zJ1SFFoECPkB7XmD8XD24w9BGDv3mswS7UujEi13iwAIFz1ZR7
	R8ey9A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43und2rxdt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 13:27:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-46a32c5cdbdso5137841cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 05:27:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735565265; x=1736170065;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZJBxj8Iw+5ZbEc/TiXmp4SHBivwGp93PUTfCe/CLKJk=;
        b=qnqCMCvrsyAI3AJmAZwwQT4EB5hH92Npz+wxURWgOikhWlBk18YcIfApozdp5PhDG9
         BSwQoS5YU/LjBJpU7Dms6hcsD3R9SerXHS57gqjaYr1owK1d//gm4rR+SD8AH2LzSF3o
         V21FILCH1VpaieYisyqY5A7EfkweOPS5XNPVuz1LMa+lk+GmDeGvfsSpT/sXRIWgD5NV
         CUiJ7I2k4ibDV3wchKKSL7GRmNzR0hpVGWp0UKQjK3JaIE4icLjCLt0I7RgLIZ+ZCc58
         z7z8WNPQga1j1p0+/Bl1EC1c45hA8fM/GED0atEHtJOwSYaeh3CoSuH0Ssthp2tzvGp2
         7bbQ==
X-Gm-Message-State: AOJu0YyHncM7dQ+gYhppIAV2E2VO4Avt6beamZY16AObbtV4wH8wKpSO
	lD70Nrw8xVmqqjdgaIlj1gMD+CORQW9yHodrCCxOmuLQ3sWuv/pQMJ9dGVFBbX2mIbj1k1ZTO6C
	y/R5I2I19ut6UyGzuKMqyd4r3MprSsBWA0+wsYfZ8y74YWT0yWK6+rS1jpXp6gog2
X-Gm-Gg: ASbGncs89WHpF2tiuviUKgQfTqjekLcDdjUBHYOKQvIf41ZYTz68wDUnRLA//qeFhAn
	BLdf9S996GmLiLhVBs6nefRhNqLaM/+P3DkPmWZaniI4wcjNnPS/y8KHCxzx6ltOgAdG2yo+n3i
	/L671V/DSh9dLGroNK1nporBZKKUjI1mu9pwKcJhuyN5I/ZXCuZU0HaMY0Y0SYt++/jMKrk4XvS
	CpPCHDnq/IyVUnKFESkH+CdDrNHNYCa6UFMasKJZTKu/9upEnt552fqxECMkRLyvWpKzOTqayb3
	adAX/XEBULzP5x/U7H6xfjU9UoI4cUP6r4g=
X-Received: by 2002:ac8:5846:0:b0:467:692b:754f with SMTP id d75a77b69052e-46a4a9a3529mr214284401cf.13.1735565265623;
        Mon, 30 Dec 2024 05:27:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGAgxglS/b81KxQnV1YgZ/liuFRmlVG3fWrCB7bdi7u2kPBAoed1HW2F4knszu8bKooSGrARg==
X-Received: by 2002:ac8:5846:0:b0:467:692b:754f with SMTP id d75a77b69052e-46a4a9a3529mr214284181cf.13.1735565265308;
        Mon, 30 Dec 2024 05:27:45 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80675a466sm14707727a12.4.2024.12.30.05.27.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 05:27:44 -0800 (PST)
Message-ID: <f1521302-e504-47a9-8c88-75ddb44f2fe5@oss.qualcomm.com>
Date: Mon, 30 Dec 2024 14:27:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcs8300-ride: Enable Display Port
To: Yongxing Mou <quic_yongmou@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ritesh Kumar <quic_riteshk@quicinc.com>
References: <20241127-dp_dts_qcs8300-v1-0-e3d13dec4233@quicinc.com>
 <20241127-dp_dts_qcs8300-v1-2-e3d13dec4233@quicinc.com>
 <466ea213-5f20-4a9f-a9dc-751756792845@oss.qualcomm.com>
 <9a42ba40-9984-4c19-8de4-f814d27cb20d@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9a42ba40-9984-4c19-8de4-f814d27cb20d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: XgRkAmBukPOZo0asG0mVL_dG4KZNnN18
X-Proofpoint-ORIG-GUID: XgRkAmBukPOZo0asG0mVL_dG4KZNnN18
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412300117

On 26.12.2024 8:06 AM, Yongxing Mou wrote:
> 
> 
> On 2024/12/6 5:46, Konrad Dybcio wrote:
>> On 27.11.2024 11:45 AM, Yongxing Mou wrote:
>>> Enable DPTX0 along with their corresponding PHYs for
>>> qcs8300-ride platform.
>>>
>>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>>> ---

[...]
>>> +
>>> +&mdss_dp0_out {
>>> +    data-lanes = <0 1 2 3>;
>>> +    link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
>>> +    remote-endpoint = <&dp0_connector_in>;
>>> +};
>>> +
>>> +&mdss_dp0_phy {
>>> +    status = "okay";
>>> +
>>> +    vdda-phy-supply = <&vreg_l5a>;
>>> +    vdda-pll-supply = <&vreg_l4a>;
>> I couldn't find the reference for these, so I have to trust you
>>
> yes, this two power can work for qcs8300.and we verify it.status also should be last property?

Yep, it should be the last one, everywhere

Konrad

