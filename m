Return-Path: <linux-arm-msm+bounces-52551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F911A71D82
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 18:43:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48872170959
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 17:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CB5B23F41E;
	Wed, 26 Mar 2025 17:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nOTC9XqJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3426223F28F
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 17:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743010926; cv=none; b=nDitEJz3uy9ro8T+3YzkgxSogR7ZhcOWYgK7nqfuZZJTBhKuiQm4vc4Jedte1cfMJIMQdBSvQkq9ZzDKn/E7aw/oMd03cnmLyaJfkxQjUyG60h42eQx4TbKqiJpr4hhpTjbFPCN0ITmeq5zCYIPPhaHz7CdglsNiBOsNadc5PRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743010926; c=relaxed/simple;
	bh=xy/2rzsOh+trLOCmWnJsm2IkbvXJ8ayuSunPg+ApXo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pbsm7LMY78e4PaORBq1l6WtGJcSiQ/M1T667lYWn+Z078Jwd2rrHrBohouFTMYDrPEWvnw8p+Lt1iW5/W5A4Mr7WDNSEFz4zSBXF2ms7VJUkM3Esr6Eh2E+5n1YF44gIeP0s16M55KnTWzw4fxpLeeKwuqFdo/amPLGsqAq1YXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nOTC9XqJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52QF0IAq006142
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 17:42:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1whyNVe02s5jo4EwpJiW9RED
	EE8MpWJ5TWtU7vf6DK8=; b=nOTC9XqJoGDPy5O8S+vITzRqXgvTtvRlw6JuhcUf
	bB/ITLmQsQhCl5HGEWRKstUoJvkfOFqRQmDN8XlI/6Piu0lubYL8cD9NjvBKikBK
	nIX72UOgzoQwRZhCppGt/BhRYqvEw5+Gm9PGgLIpZiURaz+xhTHlmK+VX3RxzwwV
	CjApa+671YwHukps6Obk5nN5mx93SQKNm4sugSnWce8I+a8S0zqlzjTel2uyd+Fs
	uvJQ3XCJbsChw2f9CutrHaTlYelQmemMaybabHX68xid7p2yfLgsdtDk5khxQxer
	SOuPAEYJ00i9rzzvMF2sTXIa1AuXtz2eV5CZb4etcGsLrQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45manj26tf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 17:42:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c593ce5e2eso29608785a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 10:42:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743010922; x=1743615722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1whyNVe02s5jo4EwpJiW9REDEE8MpWJ5TWtU7vf6DK8=;
        b=jOt1rDcRIGvNKXg7K/GYEwOXF+PJ/6hcHbd2hItFjoOkA+wsWRrPDZJPIcDVen6OFV
         5KwOt37mWlZl+5hHzjl59UFJZYyEgNDGHOc6v+8gYR51AAWNP3MnCE2Q92IWyhjrr8qx
         WjBEiOIxUN0w93asQq0pX4yNWTcasZJswOnLc/CR++K/G16aDyuQByL3JZvFQx5f8nih
         5YZvN5gRbi5t2o30oxtfzbbmAd6zoqwjsoAMQTeL54THQ404Ngdc1tegsD2azF8eKfo6
         iAbrbdQoZiCFd6Mjbf2xoIFzM4pYhrwWDOKX0gqRlGUSIrHGTR7sd8IZSL4xA1GMyZbe
         Udpw==
X-Forwarded-Encrypted: i=1; AJvYcCUfJOJHT2S23Oe7ZDVp7Ggi7q6lrD8piEtKD2/jmLlUOCdwwGAnvkEKx8u2uYFt0JVCbIrEBo3sB6i24tWk@vger.kernel.org
X-Gm-Message-State: AOJu0YzHzClfNgqhXGRgndCZuI+PXpR3FSjrpuEbyWUgJ+brQLwNFfIp
	4qNcMVt2IkfPgIkec7RJ5JklXkah8ij1/6NAQSNE9O+bstIfej/Ms+SNEekj+UsDv3g0EevLp4c
	ECK7rkYNT8cFvwZM4B2DiJ2JVpsNg4Gh4ZVYb5HdZzRiSTi4CZKC+GLHfsMjeoeHs
X-Gm-Gg: ASbGncvbzwC/6c737bICFOitB+P6Ytwern3xAwVDz8QDdyEnJcpOEJhucSfyRTg7IOL
	vyANnZbLwxzTJ38AfUL/Hq/wwz6u7lLZFoG2HC/mrH9G5QouGt5NG5hmTBlayM0A1BvotjzuZsn
	3Kg6EOIBZNbQc1jt8v0e/9Sk+GYPGfvr9MeFQcVd2SVWXRruW2v7eOi24NjNpGWoSgPfPir/t2y
	FauHgYJsc6c81sEadl9R3DyxNq2PGPaz4l7atkupvjW6Zz3+g2JI6uuBoX4XMVMygCE9QjqEZgq
	2UqQeFo5JPKLmnedxxYubcPdPVHNZWG5BeC7LFe2zacQTpBUofcjf/3l6kF02W31oO77XmroE5r
	cXRU=
X-Received: by 2002:a05:620a:1a03:b0:7c0:a3bd:a78a with SMTP id af79cd13be357-7c5eda61631mr71561485a.41.1743010922120;
        Wed, 26 Mar 2025 10:42:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGHUNfQ1l6wNqR9JpGezxG7QsvvjX37Da6MaMIZlLcrxsIc64vsgldMpySbZGofIgFHJRWfQ==
X-Received: by 2002:a05:620a:1a03:b0:7c0:a3bd:a78a with SMTP id af79cd13be357-7c5eda61631mr71556885a.41.1743010921656;
        Wed, 26 Mar 2025 10:42:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad64fbcffsm1849438e87.119.2025.03.26.10.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 10:42:00 -0700 (PDT)
Date: Wed, 26 Mar 2025 19:41:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
Cc: Georgi Djakov <djakov@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Odelu Kukatla <quic_okukatla@quicinc.com>,
        Mike Tipton <quic_mdtipton@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH V10 6/7] arm64: dts: qcom: sa8775p: add EPSS l3
 interconnect provider
Message-ID: <qcvz3t55bu5zok5up5nxk3mxstzkcpmdavsm6t26pe5dwxyj2a@p6nkxe2fhvvv>
References: <20250324183203.30127-1-quic_rlaggysh@quicinc.com>
 <20250324183203.30127-7-quic_rlaggysh@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324183203.30127-7-quic_rlaggysh@quicinc.com>
X-Proofpoint-GUID: dfe1QOB1PafIkBtUGMsyqe_v3PecVjYN
X-Proofpoint-ORIG-GUID: dfe1QOB1PafIkBtUGMsyqe_v3PecVjYN
X-Authority-Analysis: v=2.4 cv=KvJN2XWN c=1 sm=1 tr=0 ts=67e43c6a cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=TedthiWShpgNw5UeFFIA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_08,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=989
 malwarescore=0 priorityscore=1501 clxscore=1015 mlxscore=0 spamscore=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260109

On Mon, Mar 24, 2025 at 06:32:02PM +0000, Raviteja Laggyshetty wrote:
> Add Epoch Subsystem (EPSS) L3 interconnect provider node on SA8775P
> SoCs. L3 instances on this SoC are same as SM8250 and SC7280 SoCs.
> These SoCs use EPSS_L3_PERF register instead of REG_L3_VOTE register for
> programming the perf level. This is taken care in the data associated
> with the target specific compatible. Since, the HW is same in the all
> SoCs with EPSS support, using the same generic compatible for all.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

