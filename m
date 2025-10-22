Return-Path: <linux-arm-msm+bounces-78357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A22ABFCD39
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 17:19:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9DB219C71C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 15:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5320F288C24;
	Wed, 22 Oct 2025 15:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jXr42Zhy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD52D26ED49
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 15:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761146389; cv=none; b=iiyJir6dr7vt8e6aI6IUjtiJydX54NTWwm7pPnJBtRKoZrk+4Cr9Vi+mQBfNUds2/p6v4Y5Pi8+1NhEWIoiutxFMHRQSZ6BwWBLMNlsZJdYH3dRiDFzmpLKvH7LSH8QGnDHq63D99Zf4CeVl0ZqCJv9yLmtYDRiOZg8TKILVBiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761146389; c=relaxed/simple;
	bh=AOPCbuZwYDb6Dpjxmn73PLplRI5HptZK9i3IrS9xvQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jl0Gfzq27rKIV+ewjKh6Cve3KWE3Bn0j32rCWVAWqzI4tGxt8IuwgiS7Fyog0s3jp9YXS2nQVydH7RKKmjPpcELtmEMC2w9wn9/xEgph+FGdX4o4Al66j+buV8VkpB2IzaFW4Gkff/m3xerYTYg/mWXCUyc6zV+IIXwrpsHoXPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jXr42Zhy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MAdlEf032689
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 15:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EFJjV6ZS3dp82z3JjMux6bhTskobUNBVC36CDY6FPjw=; b=jXr42ZhyNhaVEDqc
	fV/59OWVO3iy1FJlmO04R7rOE1No/5fJWFuVd3Jk1c1gaNpLD3giL+96Tdy+rCu7
	M3EcFYR03VzPyqGGST3ck+gfanRm+wkXYtBjrUAwZ3SFtHQnfgubDtDJx/m5KDOc
	oxJlQZFmIzeYmjNzGcEDqeJge9Vh29dEZwxIHuxZ1YhGPtOL1QPzuOUtVusTMpi4
	+9cd4y7HOi2xuxGRK/ZH6FUvTpvc7wwQLrLf4DQqWZdNoEGM8VsY6unURVUqvMSD
	nrv3FQMtNHOhmU7VLMmoeUQj69RtsFK7Ajrpl+tMvhek3m3zcaLeFW2/m0tJ+7Xt
	S6fkcQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42kcx98-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 15:19:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4dee3f74920so3034271cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 08:19:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761146386; x=1761751186;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EFJjV6ZS3dp82z3JjMux6bhTskobUNBVC36CDY6FPjw=;
        b=KzBqUWItQtE3F3c+kacj5PQydiDX4JzuXTpl17GAv8FnZbyRIPM1A13ZzaGCyYEYMr
         OTMAGlhGv/Qqs+QwTY5L0dGC3BsMsayGGCygrHntmvfU2HuHjC7AgoJ9Y9aQmZByiHta
         cd6lxZ8GFNe9Q0GBxEXnqrRG3ArLlm4BLqC7Y5YBzOGi/4cTPviwnD0K0YyjMFJar00k
         HRsWebkV9hZBNvAx7enIPv8DarQw1M9IYdbgCCxKtOb/W2XTEJ5qCAVyOaTaASL3GMSM
         9a0WOPkpve85+dQwRH5RKvrYO7RZJElZRMNDzTKxbdpay4UOryDQtEqweHe8O4OrjwtD
         BWRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVs3ziPh8W/NoCuBzqFb7I1uTi5IXbJq072IzJt+LEiG7s6E5swmBG20b9MWaGmdaCYw8rqyiK1ktqtruNF@vger.kernel.org
X-Gm-Message-State: AOJu0YxV/cQcJ+f6amgHKm3W+TkhPhJlYL7KieybdoLJsy9vcsrnvywK
	a2zoUuxvKfKPWo3WR/jUTxznXWS4RhQ34AC/7hRWocym1V/rh8AlhmB3G8P+O0WuXukHE2NpDs2
	RI1L9F3M8zxV3crz2Sz6IhSRkbezdqFAQ1J/yCtp4rM+5LKOAKhJewjkjeAbnfwC8Ks32
X-Gm-Gg: ASbGnctaqKx5qVTHM5f8IqOjrOWwU9eQ3p2ld/EgcHEfR3aLzNf9vXCXz5DEAY5Xs28
	XuCQsxbFj/iHZDMFIAY0fOYH5nRDhDYiDam4mDl7Xxkqc8oZiRLlyopNEBDaFvVwt6ztKMRM5vD
	+LIp5RTZgVjYVu08zx00fBVWYJ5r5iCVGnleBGNTdlxo0rqCCubHtuL/Y5orJFBya08FfPeE55C
	DPJQTVrq2G/Pw6z8sHiR5k8x3g2wBqKFQp+8tU/b02H3tfcrFCyxqDHqGFumY6aaZ1x4UpPkvEu
	AEQ1K8rWAczePRBDjDUngCoemIguXN7XLF+seVb1cMkwF3I7UAVMUcpHkQkCpkhI/x5LORVCcsw
	iUMkhnBDLiDiJIaZJLO96J/gd0X80xlMBAdaFvbvPEqkYRSHXD1SPS4eL
X-Received: by 2002:ac8:5a05:0:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4ea116d889bmr62265141cf.4.1761146385910;
        Wed, 22 Oct 2025 08:19:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKXvCIbB2pLB6SjAv7Ty58xdlLb8zP8xTswFS1vxWoJjM0mXPHI55XPzjSk0aLd8Oz/JxG/A==
X-Received: by 2002:ac8:5a05:0:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4ea116d889bmr62264671cf.4.1761146385272;
        Wed, 22 Oct 2025 08:19:45 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c48ab5553sm12255949a12.16.2025.10.22.08.19.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 08:19:44 -0700 (PDT)
Message-ID: <f859d423-32b9-4aa1-8468-c2e9ef006669@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 17:19:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: camcc-sm6350: Fix PLL config of PLL2
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Danila Tikhonov <danila@jiaxyga.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251021-agera-pll-fixups-v1-0-8c1d8aff4afc@fairphone.com>
 <20251021-agera-pll-fixups-v1-1-8c1d8aff4afc@fairphone.com>
 <06aec134-4795-4111-801a-469afdd8977d@oss.qualcomm.com>
 <qanawqrk6izypwmmuvezzff37k66ptv2vlbdwxs62dqx7igop4@wzkz76376jli>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <qanawqrk6izypwmmuvezzff37k66ptv2vlbdwxs62dqx7igop4@wzkz76376jli>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CXwGTDeTX4TX1A2Ma9lNEPg_rxTXL6ub
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfXw5D5ftMQoPSb
 BJFyH1ESosFI5hVcFVN6yP3aG3bW/S7NN1ujWu3jt+Gw3ak/gsEANTGf+mF9CmEFhuNV0RZaEln
 g8B3SfKLwI5uraWEMC2SDxAzBB5uIdEXBg88ZX/+OHhajkXUGUfGJzWMNarq/vSRT2NuWiRLz4/
 vkmZuQ2fUfU4JJnXvGlRT3uqYQQ5LPmh2dGZwMsq8ul5dVOB5Wlnhw/KFgb3hR3Se08aCs3dzqa
 e09Us3vs8q1IfigRCrWuCt6u1juDrzvpqSHyHqI3MNWkgUJzevHv3yTlgXWdv0+PsaufIqfKqLg
 UPHSZFVP54+ytARHPCq9ShgAWnlJOE3mR+Dq4SW3e/p9L6vj8oX30ggFdU/MS40CSUaiqW11oRN
 JCdhRAGpIqforJltFuRkq7C1Shiuiw==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68f8f613 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=3hiQA3MbAuwmldFtFxQA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: CXwGTDeTX4TX1A2Ma9lNEPg_rxTXL6ub
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031

On 10/22/25 5:09 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 22, 2025 at 01:19:16PM +0200, Konrad Dybcio wrote:
>> On 10/21/25 8:08 PM, Luca Weiss wrote:
>>> The 'Agera' PLLs (with clk_agera_pll_configure) do not take some of the
>>> parameters that are provided in the vendor driver. Instead the upstream
>>> configuration should provide the final user_ctl value that is written to
>>> the USER_CTL register.
>>
>> This is perhaps wishful thinking due to potential complexity, but maybe
>> we could add some sanity checks to make sure that putting things in
>> unused fields doesn't happen
> 
> Should we just drop those fields and always write the register value?

They're used in other_kind_of_alpha_pll_configure.. and we have a lot
of drivers using either of these approaches, so converting that and
not breaking anything sounds a little difficult

Konrad

