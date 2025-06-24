Return-Path: <linux-arm-msm+bounces-62207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0968AE64FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 14:32:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB2C0188C763
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 12:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 370AD28ECE0;
	Tue, 24 Jun 2025 12:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QzPbs2eQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B236628EA4D
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 12:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750768197; cv=none; b=bXxhVGkxzvkmxkbHU80ULWDOv7sSGWcNNXx3yLenp3hF9Y2paZyNcQPFnWyg01TYIfjnnRYFzHYPgGUngbYk+p5LgaerUeK5lHCzOl2HVPZ1jt14y5Ai0pNzdnnKo2JHdeWjBpoI8UyW0ZaoueeMY4/R1UjdBn+n9NSTB2Nt4Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750768197; c=relaxed/simple;
	bh=0hX16wRB6R/CkbiIPff+ySvhOhI7/tVpEaAh2GEXg2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QPqjqAQUHaTDhVqzHMSEkEwq/PyAniR3eDcKdPdJimXbJoCtEKPtYUmLt44ALj2ubKhGLvrvI036OXFVepOdA2Xnx2En0GCOyZLASLf5K3+nQin07FuVypGreCiSAhlw498wwWb+43OISfq1TGfEFdYSiKaLVGMHBwXo7eCgXKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QzPbs2eQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O8Mfgt020768
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 12:29:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EczobUY8gqhl205jiI0S5ucvxF158i19VACTDqYqsuY=; b=QzPbs2eQNcJKWikT
	niyYMkLdgelq91vI/gR+9cCGKktMsIbg9Z5a/OV5EMqpkUS1IRD6cZ1l87IIdHXO
	j07BucpbXdCo8fPQFmxC/UuGEhVhp70TyhTD1loAw8JsrDnFjXwhsElP7AuS+ZWp
	xhjk4cuJd6bXeX4X6GwthmSN1WAKq/HR4ip/yIUAS2SEcNe7CCnERWnwUe4tTFB1
	15A0hVY9L9kSPv9DmVjzf1enqPLeZphmdzhlKEkKpFEpySGLWW+EmbSmuxMGQ19b
	kM2QvK9TxjtV529THr0socdu0+nBPqfNXCFyC9jy0eKgrZa49NEC/GS+tZaGxrxk
	Yn0m2A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b3uxyy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 12:29:54 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fd1dcf1c5bso4416146d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 05:29:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750768194; x=1751372994;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EczobUY8gqhl205jiI0S5ucvxF158i19VACTDqYqsuY=;
        b=vsw6lADMb63ePGqu56fnGKmXBYowit1UL/FytcIe4K89xuuewxH4QUICyK2622eegf
         fyplpYUHMg/OJHBRliGjjPN6XrNegEBHGmpO611QJOMUD+wG0HNOllqAWjvNBe0qwuqY
         KPo5uj/gghiJuC10nvtS2hrIwvI/j/KESDlSO7eQDXxnYe9jqBXoN4155ewJLRnMyqNg
         Tp0xzDujm65zybc8wZ0dKCPHL3H52EiVzaSEt5Zk2j76RNBnKbRiw28yuSBtZ5skYfdI
         dTL88sLFhaVuxbYTkda45eCqNXReYYMSGZgWH/GXcDwQJp8p3HmcqQrxDLEJ4z/ZMJlU
         rcMg==
X-Forwarded-Encrypted: i=1; AJvYcCUkp2HmftFJBJ7hqIWUE5M/avJ13/LZHtqT7THZgKHWWvWXU9ORP+3IAm+hWqvWWgQ9jE4Jmf6VnLH1Eqwj@vger.kernel.org
X-Gm-Message-State: AOJu0YzpT/woPGke7JhjSaSE3rVx1ENBdaQke1F0nzzrmYRhIrHSLOa/
	cjLjH61Vu2pnWUkvesZIk4alwY+UILQezwpcoc4fc6FKlV9AKQZtVI9AnRh0tis2y8aAlNwGmIo
	RGAh4hq/xNMRqupaeXOJx4/eZ4h6G/MSwX27yHJ2o9k82vpWDBZKB1vtNY7p88XoniYHW
X-Gm-Gg: ASbGncvXDaVkj+9fkjZBRrdZ3K/oOODrFuHWJ59hOqunL74fYzUKrv76FH1ai84ryiE
	hVXDbyKMofSM4xfS2H3PIoUbXOgYLlWp5P05/WiE+H6SHmQ2kSdSi0uMMRvOiqDEVx6SmGSI59V
	QtpA2TaOhforbWPw6vLq/VJHO7+S+edFFtnesezmcSqkajGz8YJmOBEEraiPXgQgeICEfrux0J6
	bWYrzkUiddw6JKwlkdNqmQhyA4uXFk6Qg2dRF8S5Ldb5TKWkmgfZzEMKE0nTf5uTddwQ3OS/hMk
	4yWArphUPejz9vJmBN/85bojFqeQIKGHioFTT4RAhVO4qMPRda75aXoQxmyrTDwVMkYcmzWyKNQ
	zdZw=
X-Received: by 2002:a05:620a:1a84:b0:7c0:c42a:707d with SMTP id af79cd13be357-7d3f993a910mr848031785a.15.1750768193464;
        Tue, 24 Jun 2025 05:29:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAsRWb4D/ij0+5bsZKJQi19Idj7A4icHhoOH2B8P1pQy97MMUcTrNQnVuF5a6HlIArz9h5ug==
X-Received: by 2002:a05:620a:1a84:b0:7c0:c42a:707d with SMTP id af79cd13be357-7d3f993a910mr848030285a.15.1750768192993;
        Tue, 24 Jun 2025 05:29:52 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae08598b7a8sm439944466b.184.2025.06.24.05.29.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 05:29:52 -0700 (PDT)
Message-ID: <02c7f90d-73af-4a34-bfb5-476aa87a9431@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 14:29:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: qcs615: Enable TSENS support for
 QCS615 SoC
To: Gaurav Kohli <quic_gkohli@quicinc.com>, amitk@kernel.org,
        rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com,
        lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_manafm@quicinc.com
References: <20250624064945.764245-1-quic_gkohli@quicinc.com>
 <20250624064945.764245-3-quic_gkohli@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250624064945.764245-3-quic_gkohli@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDEwNSBTYWx0ZWRfX+BRAcKVFLa36
 mTlDg/p84Y0IJw+HRV4X7nEJLs4BhihGfjVDIjddBG3CI7vFO8TgTL9WqX1U9vBR5bfjxVJ2UUu
 mJHQKXMCYjURvDm/N99o/XArF+MQT2rVfCKKWI43Pc94tZSDh3rjDiR8waAiw5yF+PDXvMjdRro
 5QkD2Cvas/K43OCpWlLarRo04ewcdH7ZKt7ZhoiaE7T32lvrE/xd4cfI4fF3bYWWoD4OIZA9n4f
 0fIiY8PHAwQDBPKiOEnxA8Hq+ytDCVVq8LzlphPm7SH4Jvj4oyh5/e8/HyW9UVmvvddwOCYWYYv
 xto9Sv9R4NZwinYtCHZD9Ol6loZmJcY7toOEw6sh4fXf7nYpM2Jb/p1qJieFWaiIgConCO2f/R+
 Ugw0kxLSEj6fKQwKpN6E6VG+hvyMGVQUR6AEcTEz6wv5huN6XF/BKkyOzwHewD9RJc6xeLhF
X-Proofpoint-ORIG-GUID: GJbuf1WzE6oNyjHEvYDxzoEMJY1EfbDv
X-Proofpoint-GUID: GJbuf1WzE6oNyjHEvYDxzoEMJY1EfbDv
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685a9a43 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=yCzbmmpcYXQpYh9mHnQA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_04,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=699 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240105

On 6/24/25 8:49 AM, Gaurav Kohli wrote:
> Add TSENS and thermal devicetree node for QCS615 SoC.
> 
> Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi

It seems you've made hand-edits to the patch, which make it impossible
to apply..

Konrad

