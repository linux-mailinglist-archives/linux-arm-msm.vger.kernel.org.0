Return-Path: <linux-arm-msm+bounces-75042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B81C6B9E495
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 11:22:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DA251BC5942
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 09:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 917972EA485;
	Thu, 25 Sep 2025 09:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MpxISx3D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EDD2E8B9B
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 09:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758792121; cv=none; b=EhT2D8RddI1819GX6WLqRSbDul9A0DD4hmLRfftsJVPPu1yTpLh0N4lbwAtgyvOkwPszPoj5GU6ebcApZA1+FQmf8mwb5IkJG0aDVhk49SBIW5Unv6SnVrRgDNSS+zPVyFXGQV2MuXzeUiDpGyyFlGVoaMcxkvq5QnKXlS+fOhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758792121; c=relaxed/simple;
	bh=YuN2jxSdm0ZZkGMeRrFad1MgrLUBYsgNVOQsFLIGfZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H+zD/t4hOQbb6ELb6Xzntuv9PWsjWGG8yzJLTYstzlpSjB5SfIDt7c4wlfugkOSPkG2u9JihcyupDnzHA5fDCbR2giViu9n+vz7hcsZ2O8g+9JTemdd27gv3f1hsCGDdbN6/5ZLprlCKEqLwbrX8UulOBEvN6yWrVMi0zFOAyX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MpxISx3D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0MCN9002079
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 09:21:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qkY6Gkhe4/YsWoOULLmVEty3WERnlLeTlM1ZWPHFrjQ=; b=MpxISx3D5ylLI7z7
	xry39xZ8wQkjCX0D5Tav+KZW74WENGTIphUInpXBVPNrEK0J5iIKevLedCaQqrxb
	Mr/Y/F8WbfyqTQ0T/lyCFh+VxB75TTdEmUzXZno0OqkHBlruo1yyrwDi5xv4xQsq
	puJV1fggyRt+nU4IauL1ESO4wcE9Y8d2/SMNUsE1WlysrIVB2WXoUwRfIBlzUg+J
	MjYSlAlcRch9h3eyALoo/aEFlGSjH6N6fZKOyhay4fadPgF3qvc5m5hdDRWTL0uF
	yIiOujlPGMoh+GuZdbulCMsQEuK2b4hEYRx4CT6LGtf1zIDvcpkuG1ZFVut0GwVr
	8k+sZA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98qhak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 09:21:56 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-7abea94d621so1832726d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:21:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758792116; x=1759396916;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qkY6Gkhe4/YsWoOULLmVEty3WERnlLeTlM1ZWPHFrjQ=;
        b=DCzS2RRNzWjDBSd4sC+Z1VfHMnVLxYSssM/ZvnfmdnkbW4vQ45xvzy4tUoAMdSt3QG
         iRu9sGGkULMy55UPWLhzeeum1sLXfylg3Y19dmf5guxWU19ZIomQoChxuC8tEbcarJq6
         8OZVp2Nq4u5wyfyNmS8FmJt/86PYNGmm9U/yL19j7bDWLiOn1LS579RyqcSTNAKTZ108
         +rca2FD4CxZhOBpiFEXvazes1+aLu5cxkEPo/wXUd4hQ46EePS5+WW8dzkhBLHQzUfJT
         u8N1/FZbXHD+ZQvwUD04bnThhwCNr2Rt2/3C+PnG/LgWnsBZ2XIHKTaQGNdrBA2gz47Y
         sbRg==
X-Forwarded-Encrypted: i=1; AJvYcCUUHG9mkB0Qw7ciV5uPvPhmfe+VYTr6vp7T4X0iMTNvVLtXthAzHUnBYRFoet5/b8SzbS3MnJgd34nE8eC+@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8TJU6jncicMSG9cJ5MLvuO4rzSzQSY7KgC7gctcfO/EXFrN3f
	MxWPxYAKgdwZnqR3zs9Hz/H8wEFhGhDpeMkbxCnZ1xSc2dMJY30ujN7A6g9plHzdlLXbNjOrSB1
	OuizXxr6QMmD3LpiE9D6QnBtQqYqRyG99kL49a6HQrzFCnSvjVWbrqNknM78yiy1v3nA2
X-Gm-Gg: ASbGncskjCh77aIniUpY1isVMF8FP4B/x81i64ISF0N2Eav0EB3aLl/saS+/bgyfkIY
	NLloIXVG3rvKFWmfnZx9LRMT4uO2eHkSIMenk8NAzD4Sl7HAHsWz8kG8qZLORPHkqNRIsP0mi9B
	qQkCyIJwNAffsLEtj1YhQXOUGqyg+9mjpWbg3wjyqkGhsPPCX3x5b0J7ncirP9Q9EtQHVZUwEQd
	VaWzpV7maGgW5YAiWt8Ev/kzzc6+zDI4/6jAw4P7ss0n5iPh0ta3e7BkhI+zgpqkzSX1KwHLcSc
	dCuuSoZJ66+2Rx2MhkdjjtLhaQPLnSlNsNDZn1NIIghNR0pHWXrsVgKdTawXhHyk65fB4O4jWuk
	0YlxSw16rNKuwhg9VFHSs1Q==
X-Received: by 2002:a05:6214:e42:b0:78d:8226:756b with SMTP id 6a1803df08f44-7fc3ed8a772mr26720146d6.5.1758792115621;
        Thu, 25 Sep 2025 02:21:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwGMmaaEcZzBvc/SySDy9DSNDQiiY1yU0ffafhsYtzP+HwoCnQGiPWpwjVLzKv+RZ8tvroZQ==
X-Received: by 2002:a05:6214:e42:b0:78d:8226:756b with SMTP id 6a1803df08f44-7fc3ed8a772mr26719976d6.5.1758792114882;
        Thu, 25 Sep 2025 02:21:54 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3ae2ff1sm901820a12.26.2025.09.25.02.21.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 02:21:54 -0700 (PDT)
Message-ID: <3d808b73-7c6a-4b24-a3a7-b7fb798e24cf@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 11:21:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] arm64: dts: qcom: sdm845-oneplus: Document TE gpio
To: david@ixit.cz, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding
 <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20250925-s6e3fc2x01-v1-0-9293016768f7@ixit.cz>
 <20250925-s6e3fc2x01-v1-6-9293016768f7@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250925-s6e3fc2x01-v1-6-9293016768f7@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5nMBRpBQCbs9WVrToTwdiOYGA-tsiK7q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX+5ntbK7seIOr
 xclLwy0RXA4+tvTAuwzrmo0s2v7zYwUtn62pDbaa+WSHvj3r22bm2zphXzooeyOUZnRUaxZIabi
 1K/Q0Gv+CPRvvt/EcTXKfPLz9TN9QXwDzXu4Iu51SUbFVclt4eamJWkoAZmKChfP3IbEarsRTbr
 5leMa+QNS+jNVT4Ujn4w7ohbFEeA3yqmQiVVDhnqfwQdhREkMGmgHj3hJkHEdG243PzQJqzuw+p
 SBKCsXj6CHL7hUcexVQ05dkmFLJ11ZjTdBhBqmvnn0tnkH7uVGTHKoFFudmXvqyh6mB/1cdC6pV
 JKVRP2EAuVVTdiRKyo6ToZ/hsj0ks1YupI58018jrivPRLlR9iXI8IBY1W2d/UOT1aoasb4m3lM
 00EP09Ec
X-Proofpoint-ORIG-GUID: 5nMBRpBQCbs9WVrToTwdiOYGA-tsiK7q
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d509b4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=OZMW2xe04SQmtW8ssQgA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

On 9/25/25 11:12 AM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Document panel Tearing Effect (TE) GPIO line.

"document" is a keyword in DT context, perhaps "describe" is what
you're looking for

with that changed:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

