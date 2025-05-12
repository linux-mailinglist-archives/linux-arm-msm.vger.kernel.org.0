Return-Path: <linux-arm-msm+bounces-57638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBC9AB45AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 22:53:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB42D188C00D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 20:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FEAC296FA3;
	Mon, 12 May 2025 20:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZNy9EDpa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B96327511F
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 20:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747083223; cv=none; b=DQ8geEutv3ZFgBpbgD6haCE2YvVFNpwXBuziDIGuYKO2PnfnXESPO9FYaqCUdRIgVgavMB0U4L1B0zaKOTMnLcFaivEJYlIkwBTKAHakuRTkFzJpZR80helS1Zt6pzW0fnlxby7SIFMhqd0bhsl5lH+t9zrQENAv6HkapqRmzgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747083223; c=relaxed/simple;
	bh=IQc7XbpOb+OEAWRL3np2U3qHnasNjpu+1rvKk6ZTu1o=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=NYaNQoi3gzCcl9mDawYbCQvhzkviHCgZSPyOApw2YoTZKgS8sJsspWVGk+Pbnp1s3Xd0aPGumIwDwplXa0fA/ngPOWLbSC7fj001jcbHjmJqS5S1EH0mD6A0GHOofuG8oKlfZQd2UUfoUC9V3aPJsXlwglGHiLshmZcsIt6GrUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZNy9EDpa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CIww1v010230
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 20:53:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0cq8u30UIoPjW/N2abdjgA07N6oSz8BgxUZcaxGy2v0=; b=ZNy9EDpaAWZMIGKo
	Cr8ywLg9L6bXwHdswLcPAIAa2b+KnFPU2Yv+PbobkP1MNrw0wYpq33cv2IZVmBqG
	2HwGacQAMN80uboRuNNPW6H22XzfXJWt0MRBJsBgvr4uPQlHGfbMRniNadGdp2cl
	X+mwhKBr/vKDTfDcgcMHQXnES3nnPIU6tC8MAEPTNLo4yblQVuM3ChIeWctvxHdB
	h6XmqXkAZvJySD6Jxx3kpiVDj1OH/wNHUKukSq8BJJvrXV4raTrja/hbU+6RD0mN
	MdtDX9ccPYg5HmNQxpuW7kmHIjTLxgFV0PEX/lZxavsdQ9Ziqod8vEQWyonAThH1
	7fzu/Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hv5qdumn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 20:53:41 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-739525d4d7bso3960027b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 13:53:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747083220; x=1747688020;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0cq8u30UIoPjW/N2abdjgA07N6oSz8BgxUZcaxGy2v0=;
        b=FghYEFBQFApiV792dW7hVOJEoHALiSw/5hFvmDYj8WcpsE22JGqLso57PUOirMf39Z
         H7dHq6PCAD4S+0pWfnZVm3fstwyToWzDb3VZ4puDVWykrS6Fc+UNneMHPeRAg3WWhkm/
         YLfnWwef3/eNUkTgUuNu/aOw6A4BkbXRkRxqGDHLdJFCuxl/8ZO08/H9vs2yuQnr+GG4
         mK0HwqQa69CYO9qOxMvWmKUhfwbb0ziiPReQb2hPS/3c/7+XiUpNNvpyGNyh6Fo00aLn
         lGV/ZRaTuMb61LpXq/ZUdyDM1/HntS0nTdZcPk7+BIvraBkQ1/Rh3mfwam08DnnIVADm
         Qjhg==
X-Forwarded-Encrypted: i=1; AJvYcCW+HcrIfC597PNxMi3HG0MWh3pNU7z1g9sA/muWy/2b5aM8jqI/elveVvdtRZsY1ATPwUKOs2aKg9klA/We@vger.kernel.org
X-Gm-Message-State: AOJu0YzrMR8oOMZ3ewAlWM+umbVYPqRQrQ3lNv+H7aN3AFmnAcONcTAv
	Gko5v4NTp2qUk+Kuzm/AS6gE26vPYMiyrqw7ZhlYDSCExUi6mlYNfMraP1ePt0iYAlhiEZyowY7
	rRc2QH5KBSgm7w0tZnsaRa+7k+e/Qp1hmeoLAkiB7sdA+TLVweiEoAYcLxqvjGNJT
X-Gm-Gg: ASbGnctQ5areM5Hvq4azh47IHfx83HkOVZuT8ua8PnpDSs7b6SuTalD/EBfEWmxnT6G
	2XHdN8z81Xsw/YPxWfEVtv5+HIxGw6piTlKli3bvjpTmVvUYllSvIrWElaiC8VLtwi8+QgP6PQX
	ifDT7Cv06wLjPCpYM0tSlQ/j7c4kOBQE/pZL6n7GDGatnKc+OyhXe1741KxAt9pY6rMGz98r6/K
	oYVw4C7wW6VAPVvKd1uug05HfN9SsLJGimTqqeW2Ftf53nb44cRjRARp9hW8MtfnVXwaN2h+hjR
	5tUvdelsNrgaWghb2cO85KMkXrXz8+pAAaWCCVhRDs/TJM7pu4jSrQ3bcena487WUrE=
X-Received: by 2002:a05:6a00:6c96:b0:736:5f75:4a44 with SMTP id d2e1a72fcca58-7423c07584fmr20255203b3a.22.1747083219949;
        Mon, 12 May 2025 13:53:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH687p/Y1iFlDutqkUP/1gknV1sUAfUa3Pyf9KjJ8HWT3SJf+/S7+d01a/7BrISVOK//kW7Eg==
X-Received: by 2002:a05:6a00:6c96:b0:736:5f75:4a44 with SMTP id d2e1a72fcca58-7423c07584fmr20255170b3a.22.1747083219556;
        Mon, 12 May 2025 13:53:39 -0700 (PDT)
Received: from [10.71.111.220] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a8f520sm6703804b3a.172.2025.05.12.13.53.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 13:53:39 -0700 (PDT)
Message-ID: <a1ecf255-f8c5-4f3c-ace5-793171a5ab87@oss.qualcomm.com>
Date: Mon, 12 May 2025 13:53:37 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] soc: qcom: llcc-qcom: Add support for LLCC V6
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250414-sm8750_llcc_master-v4-0-e007f035380c@oss.qualcomm.com>
 <20250414-sm8750_llcc_master-v4-2-e007f035380c@oss.qualcomm.com>
 <cnlu4yhfax3ggtkig46bwimr7acpoxl6x74dpu3kdwq2wcjwmd@d6spkmdywrja>
 <f2215dac-6d31-42ec-b2ef-d0357b9542c6@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <f2215dac-6d31-42ec-b2ef-d0357b9542c6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DqtW+H/+ c=1 sm=1 tr=0 ts=68225fd5 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=2_Z1bVATJppRhMQeSlUA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: w-fpne-7wYB4vOTEYzLvFEX2G8g6K5nD
X-Proofpoint-GUID: w-fpne-7wYB4vOTEYzLvFEX2G8g6K5nD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDIxNSBTYWx0ZWRfXyo+IUIIpMLFG
 sgbwkCm9riDK5dhFmenAgiZmx2aMPzpaJay03uhjb8Vfy7oIHP3BwOX7RXE9M9Ea3yzdOSFGhZc
 HXtM8wUzMtMmRShHwZwq+bS+QAl+FAtXlwxAd76Ep+GZ9a05Jg+63RxWCHPYHhcYi2PnIvxAK3h
 v/qbz7GXE7+0gNg0/4xE0XuqASxDsAqAs1I+3WtmOwmhJerTFXPcZj94OFFRCZhuIH0SwAlPwd+
 1uRAM2IW+iVi0zL8apaQCqTW667TRQCRzRkLkpZSl41yViJQcQQN0Sp1G4OWGbv9Z+pPkvBcXN5
 YrvufI23/xm1n/JYARL232gWUoTJrB5ZvuZkDnfKsUsxKodwnEzSMgCgjfaQ6inNcgOfzBH354t
 /ysDGecnwWhkU1y5sLAHXYU276jUeCKJDGxZa9rOMx/iKmo31EysoYdrxJf4aLj/e9DaUa+S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505120215



On 5/12/2025 10:45 AM, Melody Olvera wrote:
>
>
> On 5/9/2025 3:12 PM, Bjorn Andersson wrote:
>> On Mon, Apr 14, 2025 at 04:21:51PM -0700, Melody Olvera wrote:
>>> Add support for LLCC V6. V6 adds several additional usecase IDs,
>>> rearrages several registers and offsets, and supports slice IDs
>>> over 31, so add a new function for programming LLCC V6.
>>>
>> Can you please fix up the checkpatch warnings in this patch?
>>
>
> Apologies; I'm not seeing checkpatch warnings on this patch. I'm on 
> tip of linux-next/master.
> I ran b4 prep --check, exported the patches with git format-patch and 
> tried running each
> through checkpatch.pl individually, ran dt_bindings_check and 
> CHECK_DTBS=y and still
> not seeing any problems. Am I missing something here?

Was missing the --strict flag. Will fix.

Thanks,
Melody

