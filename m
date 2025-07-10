Return-Path: <linux-arm-msm+bounces-64358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E2EB001AC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 14:27:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3263E1C88368
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 12:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C7842505A9;
	Thu, 10 Jul 2025 12:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eFUKIqib"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D535A246775
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 12:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752150425; cv=none; b=BfTA8qvV8+cUf23r9cwhKMW+KQrPmqu81mx8UWOULHC6lwcmwZAh8PY4f7h0zPoHlCRAUZZAU4VlriopkTLDUT9OZyIlSysmC4BzNdoxQiq1EmDOOWGkGBSVVnpAbKiCNriufwnQUr78TtWGwd1xaNxco8G3ZqIDPq/qZUVA6jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752150425; c=relaxed/simple;
	bh=FGr+3z81ddvrH7/BffsfT9dYxkrFwM2vo7onaWUo//A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PjwMCPNaNVDoB0GJbM7rZmaXNwJfjr5zQpNq8CTmajt9SecfvcWDl/m+kew3e1qRjqa+5GaHgDc3A3OccQ7t7mFZ2N3BifmKMfnDbpGQw3U0r/G3IKCSYMRvtlLkrbgykuoY1xTmj3ye+Zu05oC1tob8A58l17Pw+PEOhT84IQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eFUKIqib; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A9QqDd012548
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 12:27:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/gsxZzuhHs1VQ8fIJ0Ja60LkQTuMCXNEcv0jiU2RnU4=; b=eFUKIqibmHQa/Oc3
	mOZ2IxHO79ev8iFx0rwsLYPmj+8LOzK0repIcZlCB8QJgMk8vRmxkSSArFLaTJ06
	gFk55narTCvPdmatYCLJ+/j3cL4LMUQymNWrmUaWcqAZaAekUMu7GjT7MTM6ZghI
	O4eds/ndX6NGGFjFml5pD/q9v1MEjuDurRdcvVJpZuB97tWWsIhbkKQjwxN5ziai
	bor7NTv/pwNpcug5Kmg3Spn/IU7ao8sZfAujPC2QRgrpeNB9h4MCB10FjNhWXNEh
	JVac2Mkru0gpcPtzqa59/UCnxYd0LGWTwvX/30xqeNTEnJeqj1MXRMRr3g2RVW7h
	/yrB5A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucn8e26-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 12:27:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d097083cc3so23884085a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 05:27:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752150422; x=1752755222;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/gsxZzuhHs1VQ8fIJ0Ja60LkQTuMCXNEcv0jiU2RnU4=;
        b=vAJKYyyriyCITjcaQUdmuWRIFIzdUaSpgNmTZBl6+/oocQkPbTGy6qaMcI5OwMtipg
         rfD6hd134qZwnlEomU4qzfDMpPSyjLXe+au+9G9OHJKzNXTk2UGs/irhRqpEcDLIn/Ff
         jNSEygQVYP8v7GnPFSXiF8U3zXw4Ekm+2W835ei0gz9N9CIHXaKqCmWMnkDGC9f02iQH
         7TRMhV2kmMhfcrk7xWhYHEiQ78YzQzFyqtb3YyRmt8SlNE62SiI/VeFdhnioqVnIS8Gh
         0PxAAPILJBWkplKeIP/PS9ltSTTFAz4EZ7eNQLqXyYisLeoV2f2ZYWWGUqpfr0UHqrMR
         mgIw==
X-Gm-Message-State: AOJu0Yy15uOah/NuLLk6qhcRpByONvSjJBgFPbO5klTa5T5xCUm+WQim
	hJ0KDyzcEmJVi/Ke0Drr3kOWvZFYuvY+rK+dkPWeC3a/ohGeqfjsZxQ0GNfMPK0DqlIcUubqgl4
	flkTQVJStvZDlWoVNI4K2hRJwbAmQlbWhd/8ZQwpH/d8Q1C+Zx0I+KzrlnrhqXWckxH9J
X-Gm-Gg: ASbGncttu1KKtvYBVl3GzOxlWoXsKwmn4qgoKHvYMElEAKFzffynn8iVnD2N03Ax1hU
	WevzOd4/aUtXnJO8I0JagfLEN4OQ1X9S1uvxszDmakY2N5OYe75ZjOs31bLokqhM/SUmhLVz+nB
	6phSwtW3S60KDEvu2LKka//PZVrR24MRijXVy8wef32gjEqmSJhuPRV3kJj0Toq/sp5CAR3WxMo
	f6BKtLSrEzdmUiXkYZqqUg3UTNuYYAdg/hawQH+bGbCqt8IdBEVR5CkfvfCA2Wr5tdNcQZuX/HF
	nY8l9PHuudX52yERfNUsNiRlzPuPMi6gKWWMj8DpR8rcy+0IBUh4G89K/nrA/IZ80iJKR4UBi29
	4e8o=
X-Received: by 2002:ac8:7f54:0:b0:472:1d00:1fc3 with SMTP id d75a77b69052e-4a9dec6ff93mr34751261cf.8.1752150422078;
        Thu, 10 Jul 2025 05:27:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9Y+86PvXbITAApB2WEa/o9aQTNYOeca3v+/D1E7vOqMYvryP/+xVmZMto4EEa3ckQLg37Yg==
X-Received: by 2002:ac8:7f54:0:b0:472:1d00:1fc3 with SMTP id d75a77b69052e-4a9dec6ff93mr34751011cf.8.1752150421567;
        Thu, 10 Jul 2025 05:27:01 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e91b08sm124778866b.8.2025.07.10.05.26.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 05:27:01 -0700 (PDT)
Message-ID: <cc6e8ae1-d63a-4f90-8752-07251b3bff04@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 14:26:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 2/3] scsi: ufs: core: Add ufshcd_dme_rmw to modify DME
 attributes
To: Nitin Rawat <quic_nitirawa@quicinc.com>, mani@kernel.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, avri.altman@wdc.com, ebiggers@google.com,
        neil.armstrong@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20250709205635.3395-1-quic_nitirawa@quicinc.com>
 <20250709205635.3395-3-quic_nitirawa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250709205635.3395-3-quic_nitirawa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=686fb196 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=QyXUC8HyAAAA:8 a=B7Yj2uzDBv06dT-is-cA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: b4h0l89SNFsw3pB5Imc1sWBbZxjv-A1-
X-Proofpoint-ORIG-GUID: b4h0l89SNFsw3pB5Imc1sWBbZxjv-A1-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDEwNiBTYWx0ZWRfX5pTVsux/DcOK
 E8cxMux7rJJkYSH/k1xVpGycmkVj0actfw9XbB7vjnRfeIP6FvbJE0Zn39JUbfsmO9ljzA89hjo
 bSiTmlJxTGrTIES1arXZnrjnDPIVXla/tMOMdLgbw/Z4m+/faGx/e+PP6rrf2APPgjlH1z/x3Bu
 l5VypeU0vDaa3VSElIyvo2muqDxL6frjhj22hv3HnPTJwTEH7lRhXTB8v+p0wHS7C6euqlAZec7
 QeSLCOXxrOh9XNcDYd1QQxHg2I4h6HnZGQUIrtVMv3jxI/lEdvLIc4resMf02Vk57sdxjgd4iDD
 gvsxvS5Hi+PtoNY9SghXENYQlfcQc8uOBRrDm66/QoUlwBjI0liGnKcZU/vYXUaXE7UBgEQTI1Y
 eO/XRN2zQ91Or3ebB0ptU2x771XlcVlGcd/O5hRKw0qbVRm/+IK2NmYpxRTqLFqXmxTy2iZj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_02,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=833 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100106

On 7/9/25 10:56 PM, Nitin Rawat wrote:
> Introduce `ufshcd_dme_rmw` API to read, modify, and write DME
> attributes in UFS host controllers using a mask and value.
> 
> Reported-by: kernel test robot <lkp@intel.com>

This tag makes sense if your patch is merged into the tree
but happens to contain a build warning/error. Using it here
makes it look like the kernel test robot suggested
introducing this wrapper

Konrad

