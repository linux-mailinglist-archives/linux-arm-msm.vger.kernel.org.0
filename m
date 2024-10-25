Return-Path: <linux-arm-msm+bounces-35969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFF29B0F34
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 21:37:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81A7B28587E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 19:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58B3820EA30;
	Fri, 25 Oct 2024 19:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="En+U7hbw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982E71925AB
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 19:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729885046; cv=none; b=vChDUu2EVF3vDdaIYr1rWHaV6IUyBsdQ18IIsgAtqhGl4EBElr0H5/tllLlBr51YBoe7IQBZL2Pbf28DhfEXtbjF0oZg2dwL0bsaUvCYln54hoW4JL3lkAvBxzVj00LLCoZKNbhmhsYcpjzZdkoLqOW8BKOwoAtGaOoDa6/CCdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729885046; c=relaxed/simple;
	bh=yJd7uxQ9nDqVhUcUjkCjaJ5lj3WiaBIq2wHv2GpUxgk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SVeP7GuVjXi2DalaMul0+qaoNBlsVNDprA9Zx0+wmDvn2dXpcsc8EBJKTau8uvIfyCMOc8GlvsMkHmsKqF3m2BcpnwiUFt067riHJ15vcAYc8GhvBx0QXQ4WtnP/W/ddKQ994LHK+xbLwVM0H9hneWaT8oAw1OPfwQb4EC8U0rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=En+U7hbw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PAoK1P006951
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 19:37:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hb9h0XKJ56CITqsmI1KtN+P7Qd0AnzcB+X4gDKt/lic=; b=En+U7hbwpX//7pJV
	5rUT5s+zI9AR22p5xTyUIiUmtLNtUrpzX9CIhRN6jrUcI4MVDlCjW8PVc0ruwcgF
	NZgNBwWOp0FKgdpja54rxjouCaJDMS4wfCUD41hPBBSWrMFiGvV9yr52mST0zw8O
	JR0WJt6KaZJ9a3cyFc/T+j4RpZps59FCatK379Ehg3kdazYgzcZ5BrBWGH9/o2ei
	X3S2f8hD9AXT74uSt8suZrhdzjnx5Q35RGvkfTCtwguxAcEN59GDQqBiYcKMam6e
	i8pnqfiqrCpapqfptr2DLei80g9vi2TIAsTTp3KLjVsas2DZ5VRWymiHZyTTvI+E
	+5hrkQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42g9x6hhbx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 19:37:23 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6cbe6e6bcf2so6886866d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 12:37:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729885042; x=1730489842;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hb9h0XKJ56CITqsmI1KtN+P7Qd0AnzcB+X4gDKt/lic=;
        b=kmcB3iJt5YB6iN5hejy5Wal6g69Yd/Xg55ZeDU09NxNU2lnRC/IXXWfoTLz9d/tjbP
         anWJs9pYpYZX0LX653r6maS3d+4V39e7HBw8vMHY8DplX5L3QMvVzhie+RwNOI3wKgDC
         +qV7oFwGupJNkE4O61tS2a5DmFruBIaDspog9Bv1lfap2MdctUR8LaHszZ6aeJK8yY3Q
         rHsTlFSHOSxSXZwPqkF43R4nBbpPypx6T3N9VSRE487tCCPV1eo1Yc/n58ySqLvI/Zi7
         VaG2UxVscVCxodl3e7FvwlnPoTDQymY+WMqiLwMg8HWu23BOOEPXZABo6x+vStFuAtZR
         YPKg==
X-Gm-Message-State: AOJu0YwT5RqI39MKPRyTIHWVkCVnuqxslotkrDpsLNfWhnGrDxflZPNR
	lVcK/vRRUpx/PuxcvhWxidzCXwt5CFIppcqaajokAbnzgAvmLl2D6C3tasRcSoKwKTUk+cR7I43
	14HS7dMNrOMWLqJdjriFFjkyNGpfDry8PvJXPeVQhhp/sgqeIOq+fl7fpOmdP7q/m2X/gDUV7
X-Received: by 2002:a05:6214:1310:b0:6c3:67a8:dd48 with SMTP id 6a1803df08f44-6d185682ebamr4081186d6.6.1729885041549;
        Fri, 25 Oct 2024 12:37:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjsGVZPYyiW1I8GHWBjenI2jSJvfZfFDyqfCLcTMAV/NxNpHhGDS30Pv6QT9pbRH31FJBXPw==
X-Received: by 2002:a05:6214:1310:b0:6c3:67a8:dd48 with SMTP id 6a1803df08f44-6d185682ebamr4080596d6.6.1729885039794;
        Fri, 25 Oct 2024 12:37:19 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cbb6348c93sm893169a12.97.2024.10.25.12.37.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 12:37:18 -0700 (PDT)
Message-ID: <fc2f0bf9-7afa-4db8-a234-26c01749b070@oss.qualcomm.com>
Date: Fri, 25 Oct 2024 21:37:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] arm64: dts: qcom: Add coresight nodes for x1e80100
To: Jie Gan <quic_jiegan@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>,
        Tao Zhang <quic_taozha@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Song Chai <quic_songchai@quicinc.com>,
        Yushan Li <quic_yushli@quicinc.com>
References: <20241016063113.673179-1-quic_jiegan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241016063113.673179-1-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0wf_VogqUfEhF3BVQ97FTt9F8fw-QgnQ
X-Proofpoint-ORIG-GUID: 0wf_VogqUfEhF3BVQ97FTt9F8fw-QgnQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 clxscore=1015 mlxscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=740 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250150

On 16.10.2024 8:31 AM, Jie Gan wrote:
> Add following coresight components for x1e80100 platform.
> It includes CTI, dummy sink, dynamic Funnel, Replicator, STM,
> TPDM, TPDA and TMC ETF.
> 
> Tested-by: Yushan Li <quic_yushli@quicinc.com>
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

