Return-Path: <linux-arm-msm+bounces-65844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BED96B0BCC6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 08:39:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6098F162D3F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 06:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C46BA27F019;
	Mon, 21 Jul 2025 06:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BDRFiugy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2C127F006
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 06:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753079911; cv=none; b=gP6fe2wLrGX9CBVFBPcVMrhGE+2tRQ/60bTxQGhlfGyKKeFewaTh88wdol5XvQ9XGpfJNaNx+kHFmv+7m90NCpxMF08ccfZU1HmoCRSlJWc4K7oMgB4l7s+JNlg6vkCFly+yJ/rrDrPPFpul4JGruXxgMj3QGSBJL65SXCchAQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753079911; c=relaxed/simple;
	bh=ZcoU0TGwdamvkaiI2FBd7ECUaQOwGpBw3EYD+sAv8S0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mX99EJdDkUOFZmL5X+Ni4GD4hnQwilwl3KhzpG80QqtfgnkHtStiqEtsth82XH62WL1CQ6/gb1gY8USfgmxurRJwOAANsHC58Ce/uRvBHf4eMTIxD/gpBbhAX+3D+33v77SGVSc7NjjJmsxTXpPExubX6GDht6SP5eygnCGxLVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BDRFiugy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56L40hxu015833
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 06:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZcoU0TGwdamvkaiI2FBd7ECUaQOwGpBw3EYD+sAv8S0=; b=BDRFiugyrqxv3i3i
	FgVP9TWHbvtVHHPXQ+WMfOkJp6KGmLgOn2C+oThHXkr/ldbeYRzjvW9IVUCvEmZa
	lnWWvYBLovX8LFWkxEeQ6BErK6kSQ51grGvDtRX7bVxeZHm//AqE8gIR2OAt7qEl
	FB1hfvJri+SSVfKjCFWUUbN9/duOdQSzrL3AlCVwAfuMqsZ2aW4qYedStdmbOnYS
	iZPzROKQK9ZjkxbI25hTq4ZjEkH4qksPcgfayRBtEEnWksdDL1Sd1Y4rXubOZYca
	1qmDol+rRgOOt0ZedsfJcCo+9ProMn6lLbsR+0lqEfjI8iirlovbgHEsO/q4XgG1
	rfRt+Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 480451bke1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 06:38:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23507382e64so37564355ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 23:38:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753079892; x=1753684692;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcoU0TGwdamvkaiI2FBd7ECUaQOwGpBw3EYD+sAv8S0=;
        b=L2QixC4ACtiyS5nNnJcXXfI8Ud5kobqRJR5eJ+mJ7emNB8BNvvF94DdpX7ISWb3QZO
         uQ31HQujQRW0WasVPXef4EMxoCSZzHIPFgNVZQSra7xmR/KHPBf069VFnPG9ImYvcpFd
         ZXAODDOAY7gbCIKPPurx0IYraUrP2iApGBv9BtVmnY47HGmfAnP9RVk1pToMwJymONEd
         REJwh7N/QJJe8mzcdXqIMzsILFwbEyTpi7MQt5eqrFK56ywdLdQ0Psyu/oa7PqpjIj9f
         znfmikCGcIMQrnpYrJf5VOCPNACPA7NRvPEYJzyXO/jl92jLFLZOMxG1sCZdbWnTDSH9
         +jxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXkSEPEdXCBBaZzM7f7Hte06bn9yIKT6QcSZUQigQdZe9KKE34ILvMzP8K5SmxlKeD5+WbpQhpQbmEHJ4m@vger.kernel.org
X-Gm-Message-State: AOJu0YzU3oeQSoec7bj9v5H1nUmCvNWmFCL2nqLnhmSCCrtuOKQzYXxV
	Oo1QkCY4ZgVYrFRKVzGebp5FV23OyImmev7M+SNCt20I/s/gcO0YkRzi2EcdAWTv1ccPaicGggN
	krsKrZuNxZ2qjLO3zgel7Q852ksg3PBTcjwoWIJgYyJWtSdLHlwZZYGddB/oGrrpf4WQw
X-Gm-Gg: ASbGnct21FYGMWNkaiBFm/SrmUL5DYyiIYFh3ep/si11wyQxPKK4A9OyE6KcZescX97
	SewEvq8EZNpFJSpdfZ7E6EV37D16criwiaJIfTFptpaSKgnGGekirq5z5c4Uzys1qrCtGGtP/gX
	LXz6iyP7yZLCX/gbWVRMFcoTFqyA5TnEtAVOw6wL93UuCK2fq8m2e4f6/28B5PB5LTd+RoCcNwD
	4AWwKCS/YAXJDQKFdADVAHji4Jwq0jGIDUAJdq90z3j15b2XQ86sY0J/N8X3QCr/7hUaUiQSeFe
	HaF8LSkKeVlAXWtWWWbKHksB/WXFcuRYkiiqQ3lpuLUswHy5jdNnffpP+q3LsnDFRnXfLalXTmU
	kyi42b3jDDMqltAN1YHL5SswtnOdR07LEEDFyaJnlvmmjZPkR2a66
X-Received: by 2002:a17:903:1a85:b0:234:b41e:378f with SMTP id d9443c01a7336-23e256b5f80mr272335735ad.15.1753079892325;
        Sun, 20 Jul 2025 23:38:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJPo/UaVeW+EGlYevcpLuFgKAeIRLV0gRofHorAuBZ0G3Vhe9/bgkD/9w7yL17PZR7jZP6Aw==
X-Received: by 2002:a17:903:1a85:b0:234:b41e:378f with SMTP id d9443c01a7336-23e256b5f80mr272335385ad.15.1753079891894;
        Sun, 20 Jul 2025 23:38:11 -0700 (PDT)
Received: from [10.50.52.170] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6b4de3sm50912045ad.111.2025.07.20.23.38.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Jul 2025 23:38:11 -0700 (PDT)
Message-ID: <ee2f2d91-c18a-44e9-b048-10cab911e65b@oss.qualcomm.com>
Date: Mon, 21 Jul 2025 12:08:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Add support for Clock controllers for Glymur
To: Krzysztof Kozlowski <krzk@kernel.org>, sboyd@kernel.org,
        mturquette@baylibre.com, andersson@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_rjendra@quicinc.com,
        taniya.das@oss.qualcomm.com
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com>
 <bfe8b558-444d-4fa7-9e01-e55aaf48f2d2@kernel.org>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <bfe8b558-444d-4fa7-9e01-e55aaf48f2d2@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EIMG00ZC c=1 sm=1 tr=0 ts=687de063 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=8bVFQ3Vb14ZConFL0MkA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: NrjvhOzSK4-fg_h7CledWeY_yCiHQo7N
X-Proofpoint-GUID: NrjvhOzSK4-fg_h7CledWeY_yCiHQo7N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDA1NiBTYWx0ZWRfXwZyrMxreMRE+
 HiQ7pQan48ayIZhIcGWQ+j2bdB2Cjv4AiK0PPtMqRWzOJu+KECA8TX9lwME9dqQbfZrfWJ7bwYm
 JtYfAPWGpdJYIZx+xpfBXumMX5f28uUtGEIXkQMAegxKqdVnmn4/mfJ8//TUUP8hpIBSinBsi9M
 YIvltb+Zg+6evCTm1fhOwA+FsxP6AUwxR2NIR3yaJ9SwFcl5CrvZWV3x8OYoftc0mTGUD/M82Ng
 Nq1/7D2rGROo3gcqE6KD0NouSm0L7x+1ZBFp/2BsHXEkwFVQDYrm6/1eAro16m8MgnYvyumWdCK
 nJE2gLPeYAa2s/h9R/iXheVtyZZ1Rc0UMVs/FR1WEDvrYOfLlWxh0/BhuidoaX+SXx8fpvvkRME
 0vMwff9TS3bWmtk+dJqWOYW/483rbo39CyogwKhp9ZsA1cGmE1ccTwVifKUPxrhc80k+3Sx1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 mlxscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507210056

On 7/16/2025 9:42 PM, Krzysztof Kozlowski wrote:
> On 16/07/2025 17:20, Pankaj Patil wrote:
>> Add support for Global clock controller(GCC), TCSR and the RPMH clock
>> controller for the Qualcomm Glymur SoC.
> This is the first time this name appears, so if you do not have
> in-flight board bindings patch with full description please say some
> words here. This will allow the community to understand how this maps to
> other known products, of which 99.9% use model names, not internal
> codenames.
>
> Best regards,
> Krzysztof
Glymur is the next gen compute SoC.
Will update the cover letter in v2

