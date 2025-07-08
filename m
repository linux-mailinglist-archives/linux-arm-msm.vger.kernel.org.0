Return-Path: <linux-arm-msm+bounces-64076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 626D1AFD285
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 18:47:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1790B42328D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 16:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39EDA2E5414;
	Tue,  8 Jul 2025 16:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cZv5I+E2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17ED2E337A
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 16:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751993053; cv=none; b=D8tDafXylRvMrMJOnPYvH4fUp8LY/LXj4JXF4XemxPI0+C0JumO3O7HI5SoD6H0/jf2ED0KzOa+is5WYIvyze0LseFqycdbn6mdZsVzmju/reeD8l3YRKltRSwWSQ3fhKYh0pKoxZ0ao4jrzed9E0S5NzngkE2syX0b3HLoxRfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751993053; c=relaxed/simple;
	bh=ukiXSSeFVFMhOkjxWVniUgNWUQsnFXBIgcndaWPz2Dk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KBttuxq1DVj35jJy04Ri9yKij1fF0+MwL9jyLCduU/q5hQwi6kvu0xTMGMrBgvmK+cWvzTCk9cyLvHY3Rmp9kCpA9DDCB1aPu439kPnj7Wv/YBmtVxBT96+B6IBYWPFC8VGlGgynxgCmzsTdrSKUfK4KPwdfBlEmdDhOPggvG7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cZv5I+E2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAXvJ029148
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Jul 2025 16:44:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3VZKuAlxi75Rn12eGDb5b2eYwjOnft3owwU85zuZnE4=; b=cZv5I+E26G1+HoVo
	V5uqZyC4u4+erCE9R00CfrGbacdXRIwMX7LEXm8Y86dOlrd2A9VF+fKPywJlvPmA
	7Rn4gviyW/OpblntXarNb0kxXr1GYr+t6ZnD8yF3cS+Hr1M5fFze7/HXE3/mnMXA
	aDbFc0X+/W2NjMCGVg/s0qwY+cq3kcnwlicDlNtzQ/RYpPOrJyyfS1Pi72PZf4Is
	xNjEb3c9CQWgNO3f+kdOiU7W0VDhU8reyRLKfmzX2plp5s3LQvo6Whz+kJ34JHLW
	Q9dtihlATF5n90jV3xuBKxebSlpo90oE80+X3rdLT4ceFpTmexCmML5rwtaKyWG3
	jIL+iQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2b83pq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 16:44:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d0976a24ceso95319085a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 09:44:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751993049; x=1752597849;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3VZKuAlxi75Rn12eGDb5b2eYwjOnft3owwU85zuZnE4=;
        b=MPi+V1/QXwU9vP/ChNV/PlmBf1unjyd0MPJmTr/mAWbPmFtvQSC932MdEgfY/0Ur4r
         8jqy1GqcRI+1nFkY3fsJ2tiloYNEXUqirf6mtN0f+H9eGof1wDxqkrRjOGRAyAR4+Iel
         F2HvyZwhpmjnzc0xLgFXL5uH9meUFdtvLAjykx0dZVGGZxhsLof2c2K2YrKyqyQ1A35z
         3CG2Eg2RM9lYn0jnecaTT+1jbZmTezUDWTtX/u29uapzZI7pU83BYdeetusBOlpB9fGX
         oSpIWI+0igtDOXm6aoaJdMZe+lu3fZ6CJ5o5STOKQS6oNvC/zpVzWnlUwvmZ23PhdWGD
         gs3g==
X-Gm-Message-State: AOJu0YwH+7MKcaGLoZH3+SuAaGGCO6Egpu3PfiFf08qikX3jFgxr+DHs
	+9P6C+lqnq1yn84dqxw9Vdatu6m7et3dzyUz1Qtcu/YkDQoPVTauceNgqfc8DM/8nrXiE6ZbBvb
	q2VLe7GbDfmh0nYKmEIWtIoaOEgcQFwVyFcqo375Jl34bjLwaKarl+kG5lsG9d/x4beu/
X-Gm-Gg: ASbGncsGWOalrQSvFc4FyVZpEbsYKanvLe4BSFlMSp73KDYjIotix53Ga9dieDs7bJP
	/BiimYgK2ljCCPwc371NXQzoZqkZon+8mvUL1cXuuIs+34ZsJaYFSdz6ci6vux8weusRQqBF/rI
	/ZmX0r2Aqt4JnbCIRKScBhEo49o9Lu+LY2dcbski+ldXKwG1HKsZmQOJHTt56IWj03HBBSIHVgA
	2JIrzK/E23HS4vohXd2lCQEU0ifRMJDojiEY7ozlxjhOinl+tQCXtEEVR4MClIK6UP6vqn2vdVj
	QkwDIAxwcp99z9bnKAHZdZGqYrZnjs8tY9dyoQEZ0qdhckp/68iss8fzkC679m0yE9LUBW3KKlm
	Eq0Y=
X-Received: by 2002:a05:620a:2944:b0:7c5:9ab7:3012 with SMTP id af79cd13be357-7d5ddc50daemr801621585a.11.1751993048893;
        Tue, 08 Jul 2025 09:44:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMwGjIfNhpihUDcfvAlJkrfYY5TjG6OzWzgm3+25npy8cmSQsjF2jpVNr98fOmzv2zvx9/VA==
X-Received: by 2002:a05:620a:2944:b0:7c5:9ab7:3012 with SMTP id af79cd13be357-7d5ddc50daemr801620485a.11.1751993048528;
        Tue, 08 Jul 2025 09:44:08 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fca696480sm7566674a12.27.2025.07.08.09.44.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 09:44:08 -0700 (PDT)
Message-ID: <cef8c989-4a0a-44dd-b0b6-15454f98193e@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 18:44:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 28/28] interconnect: qcom: icc-rpmh: drop support for
 non-dynamic IDS
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250704-rework-icc-v2-0-875fac996ef5@oss.qualcomm.com>
 <20250704-rework-icc-v2-28-875fac996ef5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250704-rework-icc-v2-28-875fac996ef5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE0MSBTYWx0ZWRfX/O75fP8NssbK
 uuPYWLSBdJYsHvaxw9VtBuw0V6NLoo/ueWfvqscY/mfljA0vWSfO0oTtclLpjC4SoohlXVPzH9i
 jHMILIB/8VAOGrd/U4LZh2ln7zj/EgD+ilWIlYQBrbsEzAQCCqHeMuPSTcnDmPx6mGAPgI19wMy
 ZN2h1YYfBBKFzPjKO51wCjhpaafDQCVMG2TMVzcaq6eDV7rR2+McOdiOR9dfjx0MMf9S+i7JR4R
 cn+zlSVpdTufNHx++5rVydwh54T9l36Xl5u/Q//Ll+zwFOVSwA4buhGwumB4W5jl5Z4aZjKb2NR
 c/82uWXi1x19GjT631+meU5rTUNHi0MCI12HEv3lCB0h/1oB61U2j8GypAMbz4MnN+7v5PPbYC+
 85BqKxxUEa3fE0cLrHAD1FzUQ46BvXgmrrTWS8/FW7Qk0xV8m3Eu5U0I7UViMGtXHTabrv8S
X-Proofpoint-ORIG-GUID: MYsIUklF6O3plet8EfugjfPHndf7JQv7
X-Proofpoint-GUID: MYsIUklF6O3plet8EfugjfPHndf7JQv7
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=686d4ad9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=SOFPeg2F_ukm4-QWM7gA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_04,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507080141

On 7/4/25 6:35 PM, Dmitry Baryshkov wrote:
> Now as all RPMh interconnect drivers were converted to using the dynamic
> IDs, drop support for non-dynamic ID allocation.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> diff --git a/drivers/interconnect/qcom/icc-rpmh.c b/drivers/interconnect/qcom/icc-rpmh.c
> index 941692cbaf208c66a27dda2e6902b2f26f605840..796fba9fb316cf58ae2eb77af1607d6d00c38438 100644
> --- a/drivers/interconnect/qcom/icc-rpmh.c
> +++ b/drivers/interconnect/qcom/icc-rpmh.c
> @@ -280,14 +280,10 @@ int qcom_icc_rpmh_probe(struct platform_device *pdev)
>  		if (!qn)
>  			continue;
>  
> -		if (desc->alloc_dyn_id) {
> -			if (!qn->node)
> -				qn->node = icc_node_create_dyn();
> -			node = qn->node;
> -		} else {
> -			node = icc_node_create(qn->id);
> -		}
> +		if (!qn->node)
> +			qn->node = icc_node_create_dyn();
>  
> +		node = qn->node;

we can drop the 'node' binding now, I think

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

