Return-Path: <linux-arm-msm+bounces-54397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E216EA89AEC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 12:49:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 552E118957D4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 10:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96E7E288C98;
	Tue, 15 Apr 2025 10:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GbhKyXHF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B20229B77D
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713919; cv=none; b=n9z4V9fB+DCClfZCntAAWZJQWs/Lo243cOmvlXa3gu+mhflvp+U5HOHxhIrhG45w9dtmGz1DeC+87udBlXeVztbxSSK+VQib/6cduBin8k4NztIYQ/99J3uEwpDU1zMSXb0sYxpdkmrH1HqcF92xYjZyJnVawLxDuU+6ZnrkC7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713919; c=relaxed/simple;
	bh=PqtFIuf2PaqgdiInwLbpBw6+hS8F+gVD8HwKtn8pZqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r+kpv+zuVPZR5OcCDoSiTg/6xqtU/O16cdHfQrQjft9rCpn5Tx7C40qr2doX4eQMDQ/hPs/4hC4GBHRmfcAI21Dvo6wa4aC8XX4qn/SYm4NhMQwpmifC/PUrg31aoMlTitiUyd/TWZLGdPvdoDq8FQKrjUbBK4SknfnB6V7AAog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GbhKyXHF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tSqt005505
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:45:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i+0K8i6mH8nJR7NC8EwJps6/hl4dOeR4gugtJgCdwYo=; b=GbhKyXHFtJPUNo2F
	r8lgxHB/xGMiPGs/xFw7MESJlNA/1FGzekziAesCWmz3twq4WH+96JvDKYJFCM1A
	zrFfwvuwI/GEwWkKzsneFjqWCB9zFxHeTI8mh1+ITGNfUVzUWAt4DpBCt17ZmF2d
	ZegQFJTCMwfKOX6mC2YZ18SeoQMOCOjtkvAa7p/7jMtRufbCKldlS2UK1wyU1sYx
	/UtRVsqfoe5eKrT3bkeHpZRffuL1FVEY4dYngYsm2BE7cUa0TUOTKLvibiro5JvT
	I8BCALixKxR/ubtRMzo3vK9FNwp0pO97ACRAlElyx9DyvFDNmjgd6+jowkVf9QZj
	lXaEGg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbpqht4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:45:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5466ca3e9so73806785a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 03:45:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744713916; x=1745318716;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i+0K8i6mH8nJR7NC8EwJps6/hl4dOeR4gugtJgCdwYo=;
        b=ODGFXcU0c8MI9qWyTc712bN+vLC3hqId5osJRpQFKqc3b4K9UdgGg4qSdRx60ZidLN
         gZih4i/2klm7ofFGh2SzpcIBZWHdhWQKhKn7S2vzUs2Pfv86LQi9zZ+HvUxkeigMdYYL
         qiFOUKW+hnPE1hwKxKo1lK8v8OKYS7FF6cHFEMxlKiVQW5OVFLtbIFsWVh8JLLS/fvWK
         QwMHqdzzuGn7rNRGAesytK18nTiNf3DpjCR2C90CyvJSHyhYKZC/lhyz/EHmSTgv5tkB
         U5xyh/IpwIex+E06LuyuK7S9ttsUhxp/YyIySYpCujuoSFhH5UyQZgt/zuHl++tfkzgh
         CqEA==
X-Gm-Message-State: AOJu0Yw+YWYEPu0MiSW3KlMvNM/BBd3Abvpu5gHE0vsot+tEFoLVWF+x
	r7fB2ldjVtoOTBtpWQerZY+Krz2u/QMFmiawWTkeLj2LDG42X2esDgz3k6b5DxlDhXHgmXzDJeF
	eNq7GYXAZSrvq7ezjRZN8EH8acQk7ZWCUd+CsHBMW3FsmWrBqKD49LCz/IJuwDZ5l
X-Gm-Gg: ASbGncuVQlLYcxDLrIZ5HhXMJyvvZw3fxqycf/TBReLsJpVLVP67QNbGIJJZZMnJj24
	euJtl48z49r7u6OZfmydd9ic5/gWZqvYfdHzZVyF9JlYxaXT5cbdsZevSi0R5LiiXR/KeB9LW7d
	kSFgoZE4OB2On+7oMtZrCEnrQHLvvRik8dgWeWKyPJ3RUYv0IkmSHwT6ja4JC+6+bfiKJJErqPp
	9pEGq8LKLWvbxp6xhMh/yskxHSRA2Ij1eDNEoGLpstmqKBCYTYgFfRrwX/kwdWV66PeY02J8Nte
	9nZYMM1TuaUAx2l8Wy9LtA2evHcGnzHapy+5mX9BGwn+v6onQyWih8GJ875zxYy2fsY=
X-Received: by 2002:a05:620a:2805:b0:7c3:d266:3342 with SMTP id af79cd13be357-7c7af0d6f78mr895574285a.5.1744713915975;
        Tue, 15 Apr 2025 03:45:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyEhEvT1Gs9u/aXKE281kr5sy1k/I78whPJRn+eNoQLoEHL0zwBuWWggzm+pOs6b25mbTA2g==
X-Received: by 2002:a05:620a:2805:b0:7c3:d266:3342 with SMTP id af79cd13be357-7c7af0d6f78mr895572485a.5.1744713915606;
        Tue, 15 Apr 2025 03:45:15 -0700 (PDT)
Received: from [192.168.65.246] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f5054dbsm6781505a12.49.2025.04.15.03.45.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 03:45:15 -0700 (PDT)
Message-ID: <5e5e0827-633c-4175-a93d-22f841858cc5@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:45:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/20] arm64: dts: qcom: sm6115: use correct size for VBIF
 regions
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
 <20250415-drm-msm-dts-fixes-v1-12-90cd91bdd138@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415-drm-msm-dts-fixes-v1-12-90cd91bdd138@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GRHbQukCCppwfc_JxkRPrZ6Xi4p2sFaR
X-Proofpoint-GUID: GRHbQukCCppwfc_JxkRPrZ6Xi4p2sFaR
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=67fe38bd cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=da4WsfccAxvekxWPt1gA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=668 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150075

On 4/15/25 12:26 PM, Dmitry Baryshkov wrote:
> Use allocated region size for VBIF regions as defined by the docs
> (0x3000) instead of just using the last register address.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

