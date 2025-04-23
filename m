Return-Path: <linux-arm-msm+bounces-55126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 888F4A989A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 14:21:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB8521669B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 12:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99EC02144A3;
	Wed, 23 Apr 2025 12:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iEfdqrJv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086E63C1F
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 12:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745410908; cv=none; b=ecyGHaYHEB4REA5Ja08+9ldHMpVAcxhZ6nGtBmeqVJttQMYpK0GbZtDsdQgJa462JxXGbguUqlMV4Matrc4GsjERLA/GwCcmx8rSTIZo8594PLqOc/UZ+1+/A9BQPKAd12CqKdRh9p5KEi8EWmh3bn8yXnXJRtQnYkFKQuYOqRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745410908; c=relaxed/simple;
	bh=yUlmQngLWM95uTbYGzUfTXaf2KiV+RckgPCq0lwW5TA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RjdRRuCyqVOZDnPb1JRWJ2y0fkNsENOV/KiWaGygm3plVfqoELXqXa0A0BYNq0q57Xh3w1hjVD5/Pl5Zqw/1oIG3uPR9bNB+qCY4kH2oCV+pWJHXOZSFyNVVtPQkFdssYw2LLHFrIKdz+mNjA2Ah9mZqWB63xh/XPdun5cRYOxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iEfdqrJv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NBB3Bc014204
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 12:21:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yEy3BB74MydlFE5SvSBjX4VOfZhaorZTjCn7mz9RhEM=; b=iEfdqrJvitZsTSxv
	xsGCnrcjXPQ2IcWoKVAnGGCLzDRIk4aNsh8+XceLEgtJnBHzppKtkd+PX0XgPy+a
	/OkacEzWoTkABAA44fkCf4sbZ/umnbmaBjr7/E8pFzFzwflwenKcY3iHtwqUFxX/
	yy0NRf1fuFuESEyfU1CJv+pyi8cY2grdbFYwBsVJFg5uFktiiZz27uPCFdI8S4YY
	y7xfEZfaona7VSXAXKXXC85waLtsZlL8PLEC+e08Ort8NOFMbtsJFzywu0Plzmlh
	rZnTjZled51CzoiAENbgJamTBVAMIL7HsfGVDN46I1QOA/BOXBzkQJ5GUysx/yKR
	IFpN8w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3a2ak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 12:21:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5841ae28eso120390585a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 05:21:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745410905; x=1746015705;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yEy3BB74MydlFE5SvSBjX4VOfZhaorZTjCn7mz9RhEM=;
        b=epVAFaoeF3ZrBs7Yx/O7jHUva7Sncyojp/kHbHzh5rP/qM6YGo/hjmXKixjHlZZuGi
         OWdxfmia9DWONdjfyqMAZDZhYtexQptnDI1qMvaMv0axE2vd38zHw2NQ6K2jnLj+L4TD
         ZEKXUq6wvbitVTbSJwuB2zoFaL8ssPFFk7LqLk3QVJt6tcwruL/OLu40cm6hPtfQWlx3
         BAKn9D2JSIXymEjJhMlTRuEdxTuNq1B7i/GMYlgXoTDm+p5Rr5v93vLt6ya61BxAoDBb
         Yzbi16vyCY4MW6OiTTbglRiJmUqpuj1/nkUTW0+yY8P7ypiI47kXXFpjjErGqPyVVHXy
         2Y7w==
X-Gm-Message-State: AOJu0Yz3x+LvNxsGMBgPHlyxzZCoibUbL3gZsWvPEjcBPxkFWE3IoC0R
	dgzMOtFMLgKs0T4W8ZmBorry44bx55Vm0i584e8zMtf9oaIHf84S02jEoiDaVou3E5zRUwzsbPq
	eYmuHs0sbu9aYy0+SQnPmUcW6kgJv2zrlr7pJialAbT7dnKboJ2WzV95WvuizoUnD
X-Gm-Gg: ASbGnctDqvJbZNswdMYWIJk9OOKM6yU5YQiPoLV0fNxoT3l45hIizFB3X6heDHVvu/J
	G8Q2Cd3CPNnpL4yaFfCzn7zjpaHLWf2pQaYAoEQbS0679FxcRZwRGhN0y2tIkdGOIeVqGgvTkw9
	yADQkQB8XFHDxQsL5oZBWrjzmGOocgCoD05v10sQuxfPCcZE/ouqC0IG48xjBDKYhugxUscaVck
	ifd1/yqG7WyB6tKMEM+W7hARG4CxqqBrJuHQ+jzr8TbP6kakt7UG4+OEapLhP5VPPqVAFQc+Q0/
	+OxdbGG0Iw0zsqY33G0SBtcouxztpiUyzBqJ6llA42oj1jUx3mZZL8VzvY7LwJNJ7j8=
X-Received: by 2002:a05:620a:318f:b0:7c0:af16:b4a8 with SMTP id af79cd13be357-7c927f6f902mr1108009285a.3.1745410904987;
        Wed, 23 Apr 2025 05:21:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXBbDZMwLarl+zI6FrhIiRzh9IB3F9PW0wtQy5FUQ3y8e0F2Y8/CQ5HRXpH8vW397/Zsevcw==
X-Received: by 2002:a05:620a:318f:b0:7c0:af16:b4a8 with SMTP id af79cd13be357-7c927f6f902mr1108007685a.3.1745410904673;
        Wed, 23 Apr 2025 05:21:44 -0700 (PDT)
Received: from [192.168.65.183] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec4c622sm786854066b.44.2025.04.23.05.21.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 05:21:44 -0700 (PDT)
Message-ID: <ec7b53a4-0321-44bb-938d-0cb955e64397@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 14:21:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/7] drm/msm/adreno: Add support for ACD
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Anthony Ruhier <aruhier@mailbox.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250419-gpu-acd-v5-0-8dbab23569e0@quicinc.com>
 <20250419-gpu-acd-v5-1-8dbab23569e0@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250419-gpu-acd-v5-1-8dbab23569e0@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA4NiBTYWx0ZWRfXwO+ErimKKbek 3zpJMMOIssvqBPEQKv2ZFay0EYlbYJoqwO4WSYPoR4uP7ouK55y59gv1GSsA2uWtL5y8eYqR2PK SQsG1pUFyY2kESgnJlLkXXAJ8fwviEsgEWex7Aw8N0lDQ0P/OIWLYu0GY1K7k6EPUNG0hycA5yF
 mnjIdIbZEdH5cpSlutmMfK5Q62HefyXzVwcdZ62D/O+1wAm6u4C5amgIo/eGs/iFCJB8zJ63Hqa CiC415j5zrZfnuDwTU+5e7ngHImsGKBkaqgzKVfA9+ukdGqkE1sV4x90UrUvu8KujzRhcQqRmIe +bx4lZQzHgLB+exexmYCeXXdjZ54kVF6ixTXNWm9qIYaOMX7NghpmkD3VJSB2CCEDpCRXLVPk+H
 wdBVIJEqhu/xQ7n/ozTrZNAYLUWGrS1rO+pPAwrXZXxrIrwQpLG7JgmVrjdBZ/q6TU6acev1
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=6808db5a cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=pGLkceISAAAA:8 a=b3CbU_ItAAAA:8 a=EUspDBNiAAAA:8
 a=rNhkmTvpKUHMLWWBcFsA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22 a=Rv2g8BkzVjQTVhhssdqe:22
X-Proofpoint-ORIG-GUID: jmm5gND0ePRSyoWx6vR6u-vdgZR-mi5j
X-Proofpoint-GUID: jmm5gND0ePRSyoWx6vR6u-vdgZR-mi5j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_07,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=957 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230086

On 4/19/25 4:51 PM, Akhil P Oommen wrote:
> ACD a.k.a Adaptive Clock Distribution is a feature which helps to reduce
> the power consumption. In some chipsets, it is also a requirement to
> support higher GPU frequencies. This patch adds support for GPU ACD by
> sending necessary data to GMU and AOSS. The feature support for the
> chipset is detected based on devicetree data.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Tested-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Tested-by: Anthony Ruhier <aruhier@mailbox.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

