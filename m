Return-Path: <linux-arm-msm+bounces-75448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 573D4BA7E4A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 05:58:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97DF7189A0B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 03:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CF8C21D5AA;
	Mon, 29 Sep 2025 03:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ALD1/oni"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB69219A7A
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 03:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759118274; cv=none; b=nuAfv93YbTdMLnzPsYCoG1wGzAqp9W0GZc/wGY/t2wOaF3HLXBWlwkB4XUK1Kwxv2QFeuz+geX/0qq5tzqV0iZEzvbihZONnZcL5HLq11fhOgB15ki5irdWDa+AufHSNDkICNGqh0P1rOnAhKKESzzSo62HIyYdzba9dCfn0LEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759118274; c=relaxed/simple;
	bh=iEoKhzPpfOdEKO/nolkZGQ09h0XsBnz8AzJd6bFhW7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=plmMTuLE+8VGyuYmVr/w6Zzijfgb3d6RaUl4lkGdgMQhWvw7tEJPkdRG2cPs/cUHC0P77hkiU2UXSrhqT3pELPS//pHmdrFVOTcJjLDgoZgNw07YyWjgv65bFFuDvoVqEN+aggkVlxrAr4VyeebdNaHCsy3Ok1m2/dq9hAHJtG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ALD1/oni; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SMQxlL009420
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 03:57:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x5IKET2ZNaGZqu6vqn23CHsftRhx4zpASBXEh2O62jc=; b=ALD1/oni7E0Qcubm
	g5TALLkBGTCUmHYW+fuNpKM4J3bcx8KZDvdu+AneTt15G8DKwFGe+o38O5wHM6K3
	q3c8oESGGT9smKgWgZ8Lrje/qBM5WrSR8sV98BjAZ3XTad223SOd2F/AqK5LCyVi
	fMFDHqMIILqZoznI6uyDf8STPoDe9dkHZ8lR+g4h6znO7mC+dxcYZ3RuiQ50+8eZ
	giwb0q3GaNaWJW9+77UwpCzCahaC2iU+k0xm8nJCb7pHtXbZDdQVMExvugH/eOH+
	v0w32g89HNFpe5HJI36KaSl/HS6Ax1nR6RXuXSZSMgVi4o7Bm4+gJl8e+jXEsmDL
	EqBjFg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59mv4mf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 03:57:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32ec67fcb88so3697355a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Sep 2025 20:57:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759118268; x=1759723068;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x5IKET2ZNaGZqu6vqn23CHsftRhx4zpASBXEh2O62jc=;
        b=S18mBH9VjFUQYDtwXZK6T6B3xbUAQWuoDRjn2hPr8vSZChDaWaCNzocKx+I9wv7cC9
         hKt4o4J2MkvmXgXw2sg3gK0mhRAn2ARu72sHa6pw2paozdToDZKx6f4i8DM0d/Yj6gDQ
         J92bvBH53DTILOB6jxyG2VVPUcs9tmia0B0GjjYl9AbLmNq7+hL93aIuk5WatrWq6uCs
         snn4KkiO/xotdQXMCvCpMrWL+JkC/nG5Du+50QyHiLPBztEZJluRKmes5faUQ98mXik2
         X99tpTiRBz90FC5gtkVYXvSJBkkirH96ywFJS7al6SOCc7TGElJ5/utL1NluanvG/9Zw
         QCuw==
X-Forwarded-Encrypted: i=1; AJvYcCXdf7xnHTLE74yKrlf2oOF7FC/u8tAHFvvxHt18zf9DfgA3YJkncNx3D5m47YnhKY6wcpiPRQ49jbe8/Kq3@vger.kernel.org
X-Gm-Message-State: AOJu0Yycyg7O1+jnisdEwE932XaUTYqovelettrehTDyRfylmWKb5hJF
	+fGl/8ZURQwqzcF6udO7mXSuVgOgoojbHhpgZ2WBCvGCpc8Q5vgWcWalbmzak48FS1O9VVLYCQ/
	s9yhjjTwKfkFEwc4DFpw78nR6tEnl8oXR3ph/9k0QYQ00O1Gzye+Ybr6GVPfTeIm9zvMF
X-Gm-Gg: ASbGnctvwUKpRULR1LjFr4ysILxa/3OPfO+3FjSQclECQniuu1Sdb7M3jYKudL4Q3hD
	kcp4iRxvA3yQbFEed3dVB1WK/j7hp3/5jw3ez3CwLvvzQfZDqcS5WYafMG9YAx63rqYZ3A5AXAh
	xFMvAzsw6hvuUi4hrwc+HMlMC+GkPsmS/sHItxXJ3dhvu3Z1Lwtt52RxI9lJJ0XNPVxFsXq6l/n
	YqM+zviZAQzom5OKKkHBudbA5EYeurIMFdRKD3s8JISINafhaIo7IGTJoivNpegZGTxrpfn+CwH
	CS+qTdZn4hM4ESMCnDmx4Giemje/C0tf/1Oj0Ul7Yhiaxdtc8tEcE6FzTMxGXgUAvvM=
X-Received: by 2002:a17:90b:314e:b0:32e:c6b6:956b with SMTP id 98e67ed59e1d1-3342a2702ebmr15297819a91.4.1759118268185;
        Sun, 28 Sep 2025 20:57:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuArBOJSGdH2d51k037g9fbFwwwtZi2aIpgGp3j1sTG3Gq9TQVKDuopvTuXrBfvMWjx4Po8Q==
X-Received: by 2002:a17:90b:314e:b0:32e:c6b6:956b with SMTP id 98e67ed59e1d1-3342a2702ebmr15297792a91.4.1759118267758;
        Sun, 28 Sep 2025 20:57:47 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.31.98])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c55be61bsm9939207a12.48.2025.09.28.20.57.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Sep 2025 20:57:47 -0700 (PDT)
Message-ID: <fc8b2845-5c1e-4f4f-962a-b1b0009114ba@oss.qualcomm.com>
Date: Mon, 29 Sep 2025 09:27:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/24] arm64: dts: qcom: glymur: Add display clock
 controller device
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-22-24b601bbecc0@oss.qualcomm.com>
 <CAJKOXPd97tJ_1cRZQmKE_1-B7AqgRr_CJ1cYMe=v4hBb9Z3eog@mail.gmail.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <CAJKOXPd97tJ_1cRZQmKE_1-B7AqgRr_CJ1cYMe=v4hBb9Z3eog@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YLTqEPehtQnRljdQzNS-TeHrk1NbCU7J
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68da03bd cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=YGGbjFxyX1jBzPa45jwK0A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=fESiJu-7EXqA1LiMi5MA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: YLTqEPehtQnRljdQzNS-TeHrk1NbCU7J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfX/NzlOJivpeUg
 4JobY21EvYi8RfQFqIzbAsPn9haFNAGsDMRvKYi5WJIeAbiNCK8T4ZBqpFzjUJ2o/neYigAt6nC
 f7YcsioZ87sGA1IVpceSJYM1cOwCy9LmiQB/HS1ZpQBM4BR1bGhPJlHj5u2W+xhux/VMDd2g9uu
 +PK1yj8a/TypvSDNPW8OkJ4TdgkqR8dleNtsciw+YaWpClNen2G62Mv+4bgvQFbZ3ovo6BCUnNK
 NdpAe0EwDMdsj3gjYJApwzGixDpWhoI6D7OcGjjOvmFPqSeR3oj5nYQL2vfD1a2kaf3m08IOqit
 iDI7IAosAAm0folx091rNb8yiOhRpe4b2FmBGkp/dHFiW1rFe/GH1DxJFA6bU0ASgkuBfxGsiJi
 cUGv7FOES1pNRFaC9sLLhNXlGpViLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_01,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001



On 9/25/2025 1:48 PM, Krzysztof Kozlowski wrote:
> On Thu, 25 Sept 2025 at 15:34, Pankaj Patil
> <pankaj.patil@oss.qualcomm.com> wrote:
>>
>> From: Taniya Das <taniya.das@oss.qualcomm.com>
>>
>> Support the display clock controller for GLYMUR SoC.
> 
> One clock controller is not a separate commit.
> 
> Stop inflating patch count, you just makes it difficult for us to see
> complete picture.
> 

Sorry about that Krzysztof. As the display clock controller was enabled
later point of time probably it was kept as a separate patch and not
merged.

> Is this somehow for LWN stats? That's why one node per patch?
> 

That is definitely not the intention. As it was enabled later, it was
left as a separate patch.

-- 
Thanks,
Taniya Das


