Return-Path: <linux-arm-msm+bounces-51512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E0934A61FDB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 23:08:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02ADE16EA7B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 22:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B58E81DC9BE;
	Fri, 14 Mar 2025 22:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EGu6UviF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB541ACEA5
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 22:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741990098; cv=none; b=VzRBYcst8IHMbphmo4sp1pIxFFduMIa+Gg+qhoTc1edoi4KGMNuEZAzFHEpGbg9nUxD3rN3bU+HA/wSGdESn0yUTiZG9oMTBO9W1i0GlCHiZfGGIAtr+TA4g1ZX+CeASyqS6POxeWuRidf9h8IJXy0UyHkQF7j9QhdutlPpYZQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741990098; c=relaxed/simple;
	bh=jp7zp0XEMKSmfDPDgt4XGymSrntAbWSW/TwBN8UaChw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uea52ED/u+GR+y6j/mGEpc2Pm4JRnvmd9vjhiBPqoNY4W1oTulBja9wQtP1LTIVfnbShXzz+qihlde/e2u7J4ef+uSUQjMiKAPAcbic8y/egcAD3aEiJ3OA4vp6y4Gh5s7ARFUbrn0ynXPcG8OvXaVLA5rcC2WIYHE9k3IWYtLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EGu6UviF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52EKj74S022701
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 22:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hm51JlcwZKu0qNKQYJdKG1AEr0/67IevirTkdaw7cAU=; b=EGu6UviFJfIQgfJg
	lhKscTd6XjQi950aUlfQNc+1EythD3ogVJCa6kwltVNJYdaFe8pX0QiFZdSdwl01
	shdvejqodacAqNl3AmaASa6dUyeavWMg1J+r6CvNpz2ZdKxnlWSMRuQKjNryszPz
	j7BhFyuqDLFv5R7cGKgTY8NbX2frpdxz8AQfPs4FQK+y2c+V5fdhw+ih4yIjKd6R
	HH6423PnXjHolA/ogBvV9AikPGwfld1c/4Mjwz4yvf7CCyibo8AUkNtiIuuhnjKp
	nRAqH9IPFMuul/idAGLE1ovAcjFw0DF40IXg613nGTtJKeA+MF+6TWcRy+8w978F
	LlPmxg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45chmqsypv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 22:08:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5560e0893so20893785a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 15:08:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741990094; x=1742594894;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hm51JlcwZKu0qNKQYJdKG1AEr0/67IevirTkdaw7cAU=;
        b=kQHMHeeZFXU10tbh7+Prg5FcDJWaYJDpCL1fXAnXf+aBaDRB7CVHGoLPqH90PQ202G
         TlwE1e2000oDC+kmCxdzVBA285Osfmn/IlkRFXAvBpcpWbpS9xvUXAZ5Kp4WEi/SyzHE
         aivsWJ3Iu3BBYSimOvt9Ab9HwfuzRPz1sYxbZgggYOXEe5R9pUIch7KFyTnf5vQTCEs1
         +bhHEqA4QCaFVAtOA5d5WPo1lilPJqVBsW+OXLkoZGhtV39RU/KBcz5CcAydJ5QApyvH
         z00JexQxvRlXwl0zfgUMUHgHEsoNLw6JY70peNBLaHEaO6SOjw8eWbi4Corsy87MhKZc
         Mm8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUEDx+3QpatOV1ETSVKswjXUFkG+sClnE3vpVsHMFrK2vVXQiOmS4QTZ6pTlu0hJwomNUGOiJswxUbdeVl+@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6whRIPkAgv9ckSCNfGONUO+GgcWH58oZD4XgSPtMvT8lj1SJI
	8/w82BhbPcPRMAoi89el1nG3acNkci7D1j3uYn9FeIZzY/T2e+v5j8zMHK6kt45xXU/M/R9KiZ9
	+u0ZrjT+HKITNCdYq2XAKpdZ5VY3T3qdwkVJBkiP9vqHwDYmR3XkWjXM65iUD2t7x
X-Gm-Gg: ASbGncvrQG2p2cxSjTpnoCtGkFeByb0XsVXO+T6/5ekT2zMJmsrUwRJCp7SRPMCtxmB
	HkHhsFgxxzGqKS5ADok1TAYVjfc/B47awriAsbxuJ7kyWFblFeoUXI8LN5fB5XGz6c0t9wBEKy3
	aTNNIDrnkJxEhTATZlnveZJoCK3gelt82ThLpLT/wpo89nq+4j7s8IB4BaEecYHhcCv/EtIvLpH
	MKcnOaC5w6CN2Mup2lGjLoh+HPHNVpM40c1x8CfTKDhDlQAwhGQ2MgRQSYshBguhmmK401BDkhh
	VVa+eI9RF6ZbzTI3dY0b9UiGp3Y8ylZPg8o/CvQPxu9Cn/wsoOKv4wovbxe57LojV/ypDQ==
X-Received: by 2002:a05:622a:1a14:b0:471:f08e:d65d with SMTP id d75a77b69052e-476c8128d1dmr20172251cf.6.1741990093995;
        Fri, 14 Mar 2025 15:08:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhj62oZ6yLYlsV/TtSfLeq7Hm5YxgXz6uSx4Btn4goF1iNBBLb+Nc1jWYJOyJzLlYR6jOkAA==
X-Received: by 2002:a05:622a:1a14:b0:471:f08e:d65d with SMTP id d75a77b69052e-476c8128d1dmr20172041cf.6.1741990093690;
        Fri, 14 Mar 2025 15:08:13 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e81692e5ebsm2396301a12.2.2025.03.14.15.08.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 15:08:13 -0700 (PDT)
Message-ID: <cddcd851-5e8c-4202-baad-e56a09d5775a@oss.qualcomm.com>
Date: Fri, 14 Mar 2025 23:08:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm6350: Add OPP table support to
 UFSHC
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250314-sm6350-ufs-things-v1-0-3600362cc52c@fairphone.com>
 <20250314-sm6350-ufs-things-v1-2-3600362cc52c@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250314-sm6350-ufs-things-v1-2-3600362cc52c@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tJqKi7OBDrgbAVmdmjlYDJwxGaeK5bRv
X-Proofpoint-GUID: tJqKi7OBDrgbAVmdmjlYDJwxGaeK5bRv
X-Authority-Analysis: v=2.4 cv=d9P1yQjE c=1 sm=1 tr=0 ts=67d4a8cf cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=m3AVSQT7pDQk2eD9g64A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_09,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 adultscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 mlxlogscore=969 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503140171

On 3/14/25 10:17 AM, Luca Weiss wrote:
> UFS host controller, when scaling gears, should choose appropriate
> performance state of RPMh power domain controller along with clock
> frequency. So let's add the OPP table support to specify both clock
> frequency and RPMh performance states replacing the old "freq-table-hz"
> property.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

[...]

> +
> +			ufs_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-50000000 {
> +					opp-hz = /bits/ 64 <50000000>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <37500000>,

This rate on this clk requires opp_svs (not low_svs)

with that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

