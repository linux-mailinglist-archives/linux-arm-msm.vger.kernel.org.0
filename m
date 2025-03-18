Return-Path: <linux-arm-msm+bounces-51745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 98554A6769B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 15:39:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C0753BDE2C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 14:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58CA320E337;
	Tue, 18 Mar 2025 14:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gIwFQGJe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD84820E00A
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 14:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742308681; cv=none; b=PA4INNc3N/XQQd81QIHHk9CoquLPPOaqzueN5wvIzizzVcwJxunynBDofwRWhu9YkwsvNu7RxgUiUc7T2RcJm89VduJU1iK8Z4MvF/Oynv7urQ/N2Ato6NMpE3FaI75sn6zfgg5aXKSjWjWCGNhzrnKVmdfznEus28NM/I0bMSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742308681; c=relaxed/simple;
	bh=uXwPKYySsEu1qWFsITyTxKcgqX5hr/OVHNzrPrYSLKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ValnBt7AmGIKN9yEYoH6mFDxZZx+JJPUNOvhshr/BWqZKdhPA0o5nJ2Bx6ywLq1zHe5qfkXNL0tFh+iDd9oqRCJQx/oygyNrHn3slA6WPR+XRqyb9TLRCiQlyqICZ/vJ6eEMDE4lR6WPnEvjS1WghPO8jOFmgvX06EyuQ77dhEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gIwFQGJe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52ICeDRG030126
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 14:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tAGhhqN4VqHtfbgt2Tbr4gpqwtjyfCZLT6lo8yTUy6A=; b=gIwFQGJenoLrfmKY
	gUUGigyv8Nxbs+7reoenvfxxhzVUPGCKHpp8UpmFblCooYaopFNrMjZzCvSi9SVk
	6Dd+XQ2judMxwpwkb1cJT3BUakr2cUA67/iUK+MGt7DUi1kTr/76VZjlB5BxnV3e
	IWBCZloyBl2a55wHWD4kTPe3omYfoGcaRx3GjGHRxhXIIGMJNISJzN6R6JkG8HZg
	gOfEPpu3jLzIRnhFAG4H26ldYNiXsGZunjHeDqdWxbELol7Udlf07XvQ+lwnbezY
	LVqPrAFfPqekxwXMwKxm4zsQIItcl9DoflvaKnMv5P3oWwIbIGksugKOSLHARDzA
	EYZBkQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45f91t0b4j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 14:37:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4769193d03fso13663541cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 07:37:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742308677; x=1742913477;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tAGhhqN4VqHtfbgt2Tbr4gpqwtjyfCZLT6lo8yTUy6A=;
        b=iEHdV9vb7/dXQNu/M4bdXZnGqCe6720SfktujR644xaTAvbSo7RRqCg46F/trbw2K1
         FYcjqc1A10h57XspXThxvJdWs+2LDuaCI2Nl9ZLh+uX9TohDWswJlmOL7ARgeyOxpQGb
         k5kMYqwmA08sDf106L+Lyauio15V63aMCiyx8PLmXhhGsqtZ20257erVPP9JiOvnp8eE
         2UVkZ0jRuI5t5Q+LOvxnyy32YX6xzx0eG7fmeuK8aGHPeSWtb66sPheXT/zpUOMHo5e8
         hPi1gaVF8eFIZL9hHNsKmyvidebYIZ5pbOYal7cHmXmWPaG+shVeA6oL6DrkEQ2zuILN
         lP2g==
X-Gm-Message-State: AOJu0YyKHdTEsLX1mcLB57qFCmqJOGIzdlmnlss2nWkMMHGzfo6nMVgp
	JNatPZK0FYdMNzRK0+tDtbKIYCO2+I4bs99ybTpPkCpKCCnTa1QGRRwJgOJqaoqVTrDrgBlJyuA
	ki7fvuMT0qWQdl52hiH+MU5fZUa9GWgVEk1P4R/RfdobNklrI1G0nBr8Le/8QAMM3
X-Gm-Gg: ASbGncsCdVPxadJjctrYTeJwiAA1qTGpOZK4uPXtr+LFUNzawEpBX0FMp/uGQXRbdp3
	dFISKohoaoRo5Ij423bKEicCuChhs7CerTHdv/qHRyA0G4eNU07PAAuUA3bfM58cNiaT94J2ZUU
	uvz4o3IlOAoVkmHph+ZmiOkgEOop2Kh+WoXGBUoZl20+oHLj2ZjflHxB17XwGNEDuF2FiUBG587
	8rshiUjwTvWv0gDasPQRc/A5U9toAJUBcTLgilgpohLYw0/ookb/JIId2amzIbUl54kN4LngvaY
	uwfIt1hcbDyJhP9j/XrR63wxyk5HunLb/V9ppJBhR5NAdadnOUSljDKW6yn97EUxoZQwDQ==
X-Received: by 2002:a05:622a:113:b0:472:17b5:dc3b with SMTP id d75a77b69052e-476c8202f85mr104871731cf.15.1742308677573;
        Tue, 18 Mar 2025 07:37:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFu3NI9SHwDJRtRLeM+LYyy91ZTXP2zu1wGYSCx+/R4CBuBs8q75lus1IkTgKetEM2ptDStBQ==
X-Received: by 2002:a05:622a:113:b0:472:17b5:dc3b with SMTP id d75a77b69052e-476c8202f85mr104871391cf.15.1742308677170;
        Tue, 18 Mar 2025 07:37:57 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3149ced82sm840656866b.123.2025.03.18.07.37.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 07:37:56 -0700 (PDT)
Message-ID: <08d0a3ba-9141-4877-84ef-3b16b074b31d@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 15:37:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/10] ARM: dts: qcom: apq8064: move replicator out of
 soc node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com>
 <20250318-fix-nexus-4-v2-10-bcedd1406790@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250318-fix-nexus-4-v2-10-bcedd1406790@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iJoIbFCI4K3uIelO8jANW0TERgjIp7OS
X-Authority-Analysis: v=2.4 cv=Xrz6OUF9 c=1 sm=1 tr=0 ts=67d98546 cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=X_QOm82O2s3uUHrGAOcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: iJoIbFCI4K3uIelO8jANW0TERgjIp7OS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_07,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 mlxlogscore=821 clxscore=1015 mlxscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180108

On 3/18/25 2:22 PM, Dmitry Baryshkov wrote:
> The CoreSight static replicator device isn't a part of the system MMIO
> bus, as such it should not be a part of the soc node. Follow the example
> of other platforms and move it out of the soc bus to the top-level (and
> reoder ports to follow alphabetic order).
> 
> Fixes: 7a5c275fd821 ("ARM: dts: qcom: Add apq8064 CoreSight components")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

