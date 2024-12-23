Return-Path: <linux-arm-msm+bounces-43148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3366A9FB042
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 15:42:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6AAB168048
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 14:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06D5F364D6;
	Mon, 23 Dec 2024 14:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e4o1G5Yk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB9E18622
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 14:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734964782; cv=none; b=JZXv43BygHnhfuuDXtrLc2/16elHEPYjbVo/cKuEWFo9s+CUfVPNhYytxRcTzIuR00fxFiqwzkvGbsw3su49hknTIlXE3SCzv8TX6UwFItrPtydSR7Wt/4KUtHdYcGXG1wOaFd8C5o6hJnA7Mx59JJu9HSTGd8AL/YklI6A+13Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734964782; c=relaxed/simple;
	bh=cWlU43j6Oy36TsJoeaw0lKnYM3cZ4ux6QmbC/a/tR6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qvxvTs5/yLw3egV0Qw1cqRCqc9tgSFphEOoqPdQYCx8zUQCu2/9UDbs6dc20nNLYfdw1NQskbpcN1QPoLJXBf4Q4xw/fABF7bkhqTzN1H7klNq1c/+q2feDw4ULEBvu1bh+nwowMi3Z/CpF6FSLEdLUDosebvgAbqYHjgHWa4B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e4o1G5Yk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BN9moLc031210
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 14:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cWlU43j6Oy36TsJoeaw0lKnYM3cZ4ux6QmbC/a/tR6o=; b=e4o1G5YkNABX24pM
	iBtg/pz8xoDEzkHH6Hy7XrTqBBqC9c83CaEHiR9AICPbsRiQbByemuCFkJkbr9os
	xfMRpU/ngPG0jmVxs0x4s/aTd8xb3xhIW7NtyzIoPaGxoYlIPV525hR+c5U5beIW
	dqQOE5JpM4P8Q7IdRGOVj5YYNasq6os989IU4J/zdpLXbCdfmo6THPt2TpCYZ6/j
	s8JmoTokbOBM3cNvoVYIKWVCgr3Rfc8nHRNo+5f1IDF5ogOjuRKJ4ySTOUBgv6OR
	Qgo0OewJEuUlgGURcmNRr0s6x23nXyoWDVFwkHn4rjMB5wgPywNkfmEwWzeQxAXF
	AsefaQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43q5jb8m46-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 14:39:40 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d887d2f283so6911316d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 06:39:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734964779; x=1735569579;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cWlU43j6Oy36TsJoeaw0lKnYM3cZ4ux6QmbC/a/tR6o=;
        b=r37Q9od+GlPzojUbO9wFO07MnstF9qdMb4Ox8kzgvkWCbxrFPj87sQl5OD6p1nHE86
         ZbOcXWuB2PBdrxr/6lARLd+mvYB2LYXBUIXwa5zZEVMSzwM0pSTl08W+rWY9MEyMKP9Y
         EvW6w7gOdusbZFtCzP/VZHR6XpcB5qbkLW8qIis/dMeJoh3MHsLOcrpbRqidRIFHhFur
         LkGogRuZLWJXhtgETZ1BzeHTTOVBVZFrjGF5v+VrwQJplVZoH5ik4/hnQpGQR5H9lLzS
         VwHTEvZIlxl/bGUdJa/fXtck4XdurQrcseJpPPu+HvUnplusekAoz7p2gU3adnj979dH
         hSzw==
X-Forwarded-Encrypted: i=1; AJvYcCXndt8zoKD+r5lnk9tGzhZHeS8j49pGUrMoGR4EJf0oRDzVqySctjrJqf6Rzin9G4z30nntnSJuTYJ3/ntl@vger.kernel.org
X-Gm-Message-State: AOJu0YylIWOrUuGPq2co6wPIsmLUUI3AS31G90jnEAvc1co19WHWgFm5
	hFncZFbfjtUm+596w+ygGqq+z7khaXyhr0D7NmwxU8s1vw7ZO0b9/7ZGMj3WE6xcsd4B9ajSD51
	E+01oAEGyyacoFcZYwMEdGx0EZQH4phz9IkDHe4+VfN3F6hbOByveYBKpSVGuCoKsDvBGjNiJ
X-Gm-Gg: ASbGncvEIfyQBowVCEVXPFSX7xnFLq2wOkNevdhfoQXb079k44eDL56wSbDJuQksXlW
	NWzj5sgbN7KEiTGqyhznPnovkCN+AT4jB3dSPs8cTp4S+nBCsNETa1Yf2qqN22fmQUNl05St/Ac
	SBjGdsWo50TY7W0/BKR0N/RSyjd4pOPh8iG+670SH/43WrcigoRpsNVbnT0koiQbi/nC/cJ06bR
	JrSCLnNqSHF43wIovlwQOKFq0h5UxyVW8cAlKJkWP9IXj1CNWAVyyEOgj008rHqleeFKPhKGeS+
	+vPwOhMwey5PJZUngxmdmyYCTBPIYBv7eGc=
X-Received: by 2002:a05:622a:5d0:b0:467:6b59:42e with SMTP id d75a77b69052e-46a4a8efb50mr89350951cf.7.1734964779342;
        Mon, 23 Dec 2024 06:39:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjcxQvMV9xHzC+A/JP0kFaMJfJPlFxODb27Zs0dU3IpQcuZZtPz8UL9uoKcXedH+d1fl4BiQ==
X-Received: by 2002:a05:622a:5d0:b0:467:6b59:42e with SMTP id d75a77b69052e-46a4a8efb50mr89350901cf.7.1734964779034;
        Mon, 23 Dec 2024 06:39:39 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d806fed4d5sm5168660a12.65.2024.12.23.06.39.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Dec 2024 06:39:37 -0800 (PST)
Message-ID: <d03ec6e6-66bc-4c77-b3ff-926779ef8340@oss.qualcomm.com>
Date: Mon, 23 Dec 2024 15:39:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/19] Disable USB U1/U2 entry for QC targets
To: Prashanth K <quic_prashk@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, cros-qcom-dts-watchers@chromium.org
References: <20241218102707.76272-1-quic_prashk@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241218102707.76272-1-quic_prashk@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: s8Sw7DwSZU49ri9MNrmMf0ZCu_gyfrN5
X-Proofpoint-ORIG-GUID: s8Sw7DwSZU49ri9MNrmMf0ZCu_gyfrN5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=348
 priorityscore=1501 mlxscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412230131

On 18.12.2024 11:26 AM, Prashanth K wrote:
> Enabling U1 and U2 power-saving states can lead to stability and
> performance issues, particularly for latency-sensitive or high-
> throughput applications. These low-power link states are intended
> to reduce power consumption by allowing the device to enter partial
> low-power modes during idle periods. However, they can sometimes
> result in unexpected behavior. Over the years, some of the issues
> seen are as follows:

For the series:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

