Return-Path: <linux-arm-msm+bounces-79140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 272FDC13D31
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 10:32:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5A351504C01
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 09:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB39E2F693F;
	Tue, 28 Oct 2025 09:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OuRNaO/Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B11C201278
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 09:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761643737; cv=none; b=DzNl7VIN9rdaQcorlutHrl29G4xq2wmqTBwXfnIM9d8kuTu70mPd5POGwKU/FrUYJhfFwjVADps4nw6E/ZlbtPqnTe+8Mf7i0fUEb2TfdvsrfzTOD/y/8RPAPG/1ASJk3kdmdkssF/JI4ANySqlmhOURCv57Cf129Yp8DWW9Fo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761643737; c=relaxed/simple;
	bh=ZwcXGonRvN92emIPNXJaJ1t/xG4py0/uAK0YGXZ995c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tAQrhifuEnWgyxNlseoDHv7dU/wrsT//eoL1HECosadkhum7yQM7ms85AY3hC/G2inJaKjp4+m03mtgXmy7VcK6uC/68h5L7PntduWmT0n9hjCrRQx1R+u70zUGS8gL4l9iDRhWSrlE0miIDoCcrhKCmQaL4jR/0+1kkYJLkDo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OuRNaO/Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S3BKeW3165299
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 09:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e58+fNddGzKAOXNx1q0z8A5H8OAdJV64gGeZoQGGH1A=; b=OuRNaO/ZXOk9q3hp
	t5iigTW7+TOM94JNxgV3pm3jVgA98LE6rTno2SuetfrUkraWTzsiDFu/KrnI7exB
	Fu4AyuWD90KGYZqKuVkGHfKiS8vd9uKMVUbssUIpUgIFz7GvNGGj5SPmyAbdkmjI
	A21YYDQbmLeHWgNBW/1p6heoODB9TWKp23+mNKo8WxKofNQBHjfOA7r13Oumi6BM
	TpITRsJMNAcvw2lqzAyBmp3MIEGLKhL8LJzVWQBA/3gERZAl0QnzEp04Cok9Buy9
	LylIGaf9aq5cGVUAglp7Fh6ASTR5mHNX/dtQ/fLXFVkoY5xQEb84yjOR4qvZQjlf
	1jvNpw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2bwx2p92-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 09:28:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e56b12ea56so9115861cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 02:28:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761643734; x=1762248534;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e58+fNddGzKAOXNx1q0z8A5H8OAdJV64gGeZoQGGH1A=;
        b=Qch8PQgFihsizGWZPZ+Cq82lRg6dpnShSRNnLuobmC/c6G4tw/1k+p6MZkuo1bKM4n
         hh8N6aXr4K4iw+9Pn9EFi6TWnMo08mJuhyMfGsY85cqu9BJtDRKs9t1R31uixriPC+xm
         ts/c/bRsA+tDcwxKjz6O53Uy8TrC0rPxMqN+zqjwnveNt/vDay3h3OZrYiTTLkkaUmiO
         etgfvsS73iXQE4OLUUeRcn8oI2vPoGKkTMCj5OjWko0X7Ws2TPP+yJqcLLEm7fAcZynf
         6MNa1HSDR4gAPjklHmhkmSpgn/VnBBPCi3iKDxDJwfDJYsYSK4SZpqXX7VZTkVvXYoBm
         q3Og==
X-Forwarded-Encrypted: i=1; AJvYcCX4pfulVzf1AMYfn30JpBYK1DmHACLkbOTVt4y8DcF7mTpgt4rd2SnRcz8ODclXcuk0pg5kktUVpGzJXup7@vger.kernel.org
X-Gm-Message-State: AOJu0YxjXBFtGgyvkUDCxZ8doJS5W2rR642rdLsWALdM1CcSvNanPEsO
	TEbkBmHuZe1iP2krinkLFAPT9sYhPk10p+0lP/lc8Et3EcMIMbxBLVwWyvc9kOUG3DLCXFsUHb0
	xYZaLPkNtOUALZsOBMgipmsPZt/1melK3OyTR24C8pE83Q3EXLMlqnJdvPz9y7kGVAL1A
X-Gm-Gg: ASbGncuGycLl63r/9b78KkncPnMymlfkTmw5OXbFjDDRdarrnUbq+FINHajnNAWIGGZ
	YIHveaO0dYr2j9D84Rv9NMHh1nbYIiB+MjJClSeQqIfSXRb+mkh6k6uhhUHMmk76jtPqdwJAj6o
	BL+I3qKbv1Zds+ApFsV1TWnCldNPAfMiaaoCM3nAiNilDAPm6C0bRTTP/V2AGDa4bj7zZD2ogTX
	8BMKPqJF9ZsiLmc8PISY/X1RPufhYW5PYmLmKWyxP5/pBhp0vhmgRTtFJWGEXvibRfJ6MHBocGJ
	o2tR5miL4MVnlFaTXV3WNTAyLhlW46FUUItXAXa6qFmHS0Dhri5HcTlRk4ze1S/C+n2F9d4xxEl
	eELL3j5JfLnHpYpjbCr4Rmgx4e6VSM2qQaqTL+zdcKakhERzVD6slsCqg
X-Received: by 2002:ac8:7fc4:0:b0:4b7:94f1:7722 with SMTP id d75a77b69052e-4ed07300584mr24794421cf.0.1761643734626;
        Tue, 28 Oct 2025 02:28:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1y09EzKeIgKo6FSlPS4BPv76TL/fj50gN3CY3VRT9ZqcFngZTXBYoyq9XTVLAJGTrU+4UEg==
X-Received: by 2002:ac8:7fc4:0:b0:4b7:94f1:7722 with SMTP id d75a77b69052e-4ed07300584mr24794321cf.0.1761643734082;
        Tue, 28 Oct 2025 02:28:54 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d853386casm1023836866b.15.2025.10.28.02.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 02:28:53 -0700 (PDT)
Message-ID: <38628ff7-8080-4ab2-a9a7-78b51f3f699b@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 10:28:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/12] arm64: dts: qcom: x1e80100: add Coresight nodes for
 APSS debug block
To: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jie Gan <jie.gan@oss.qualcomm.com>, Johan Hovold <johan@kernel.org>
References: <20251027-cpu_cluster_component_pm-v1-0-31355ac588c2@oss.qualcomm.com>
 <20251027-cpu_cluster_component_pm-v1-12-31355ac588c2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251027-cpu_cluster_component_pm-v1-12-31355ac588c2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA4MCBTYWx0ZWRfX19MGCj0pg2gH
 EJvfKVj6fFyBejiP+ZBEBSwuzR3Zwe2swWDVwG0PehjI4+xJmLkKEQGS4Y1pxGr2qE9Way0oiMG
 +wiJtxB1J/gB3KzIfiuXjje8KEs8dpoX3QWIMnDLfzhAv+MO1woaWTNWU6oV2kSxFqeFrCdxAeq
 qz8k2I5GrhvjJUTdU6C0euvQy+NK0RpI82yi5VD3BrNWQS3FGY6G6vvcwTEPqArJMnCZjTIomSd
 p6Io6Y+uceF1XJFOukQAiB7O4zh8LAv0xzdoV9fno53T9HSHJxQHqLlT0l7xWIze49vwwSHMzHk
 U5LRIvKt4AmPUJ4bs2qV3YaqIasAOxsrkB1XC5JSQaWnzyrWdyUAEMWo7+HYD0TWsJrS+icyLh1
 zbfz0F+dpWspXqq05A56Nez4Mcl/uA==
X-Proofpoint-ORIG-GUID: svYxlgX4HojRhOjTN7uk35ylS2xEvpiL
X-Authority-Analysis: v=2.4 cv=U9WfzOru c=1 sm=1 tr=0 ts=69008cd7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8 a=H2ti3IRskaQp3tPIb7kA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=a_PwQJl-kcHnX1M80qC6:22 a=xwnAI6pc5liRhupp6brZ:22
X-Proofpoint-GUID: svYxlgX4HojRhOjTN7uk35ylS2xEvpiL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280080

On 10/28/25 7:28 AM, Yuanfang Zhang wrote:
> Add below Coresight devices for APSS debug block:
> -ETM
> -TMC ETF
> -Funnel
> -Replicator

This is a really crude commit message.. please take the opportunity
to describe the topology, any updates/quirks/exciting new features

[...]

> +			out-ports {
> +				port {
> +					apss_funnel_out: endpoint {
> +						remote-endpoint =
> +						<&funnel1_in4>;
> +					};

Unbreak this line

The X1P part doesn't apply on on next-20251027.. I see that your base
is some coresight branch - is it part of linux-next? If so, you can
just base your series on that.

I can confirm an unfused X1E80100 still boots up with this change

Although the problem that was originally brought up here:

https://lore.kernel.org/linux-arm-msm/Z6t45aOGDkotqM4Z@hovoldconsulting.com/

still exists..

$ dmesg | grep replicator | wc -l
128

otherwise lgtm

Konrad

