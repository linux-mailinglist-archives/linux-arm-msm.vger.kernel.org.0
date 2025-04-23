Return-Path: <linux-arm-msm+bounces-55130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5665FA98A3A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 15:01:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44E631B6553C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 13:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAEB935957;
	Wed, 23 Apr 2025 13:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jebbOYq2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112FC2940D
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 13:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745413275; cv=none; b=eEmELn4mNH0kg1wr1BqjvYPn0KkrNOnb0iwWMPRiXJ/pc+aIDTet1gN34Mg1gAB8GljDeKoG8VWWvcv1Xiw1ObeJKtcGpKapLPDPQKzdBuimDCh0RrDKEluk9pokBfhSPCRIrOMlLJSkYppkoj4/CMS5Jut3UTtO2pnecPFl4fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745413275; c=relaxed/simple;
	bh=wd9BuDyfY2g+YcmDFO0GJF3WmdKVfVi8IfjkUW9YZzU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=niqrJKsVgUhm0ylTqAageMsigPh3y0VLSiKkXEweb6Req/IYkUzbukwmHN2GR3gjnxkRO0ULd5P9DqbsYYaoEIQMWIxFhdsFglBoKyC6VnvgOW9RX5djnxsrfSThxDSBsoZYkuLZbQ5shmtdtY8LIYyMGE77f/heANAdsoFIvwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jebbOYq2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAt7pq017255
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 13:01:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xPikF6CHMtboH8wVgZUcnmTj+ScLp41cXAhI3chWQ6s=; b=jebbOYq2L4NxvuWT
	OgGT6NlsvwUlxEMsseGJeXf+uSDT3Phwfeia/pLvt2f9Mnd3upe0+fLHgPZxcmYs
	cSyStGCmznyp94Ooi/KJGUQXCvp4rv/3pmWuXf2Z4yLlAvoZqHOXUdUnOcIBckFf
	QAMokAIUHz7BXCsvvbKnS195TQ1Uzbpk2Ua2wF4j1BKE3djSoH3htCccvH9nzC25
	g4E7BSfqA7CoIQvAGQemCJrVKhA3dQJb+cavut9Zp+vK54xBguiVItxHrop4Rf6t
	Cd4mng7hAS2DtGBoB5+xU1iTO/pqAKxjQkj76N0GNGSWPCWAB4BMFsf4nhzpv3BR
	65supg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3j5kh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 13:01:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c555d4ad75so32598785a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 06:01:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745413272; x=1746018072;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xPikF6CHMtboH8wVgZUcnmTj+ScLp41cXAhI3chWQ6s=;
        b=QG9/s6nLr/nLvVIroKTnqrsMpzRafXLk0mhlBIGdIeOevGuyiLJligu+dLa+9qxXNv
         dTujbHrjC996BFoU1WUs4ClYxuxhn4angMBqBymRFSMIgfqaVtEPdslG1MuTzu55sB9a
         MHmLxhsjougHp7hHy4OB75QgGSVg2xJKgsi6R7RDDGj/pV5cthmGGosvzydMTQkuqZl0
         dIUdLQsgUNa3V6M7IaJApVSTs/+NB/JpplE8J3ggeNGGwCmFssZ0l9+lcWx5KCwt5OX0
         NDvFGXF8HrvN6msvc8QFKIjX8GWNsWnR2tQLgF/SGVyCGl3pqPRHzpo11LmY/1lpdlmA
         mEiA==
X-Forwarded-Encrypted: i=1; AJvYcCX8cAF02VG+C/XBdHFShd3GAQiPiFn9SjhwivwcXAWNy9JL5uTGPRtIIf9n9P+P+/bCYnUzpE89+Jjf/K1O@vger.kernel.org
X-Gm-Message-State: AOJu0YzFFaMsxP9cjXmg9DT4EBcu7aeH+MO1BnUIkFHplwqDcpUrnOcw
	CIyxryhdx71RbfuL/4VHVOXmzv4vXnqlNgCyHHzi7+khNCZOLIgZ53VSgjNzCuonJuTEeXgjjit
	7teXmZgKgK26smqg72+1ZKNOnHu1owo1zUKahcHuxul1iYvfppFnaYYljLkIRQhx5
X-Gm-Gg: ASbGncv8IgTNfrreSifcbW2B6WaEBbE3w0/WrB9kRTcyO9/C7fB6Hr7g28N2Igy3sX7
	kPLXjz//yUwjv9inx99fZw1Z2C20blBAUEBX2bLltoX3CrwsXvNmsFBYoYL+ap0Ojek3bKqhtQL
	aGsoFYIHfj9sh8eE9Dh9ozjI+w3hatHIX23eRUJwReyeGrLrJMg8YMPJWicY0Yhf/qrHKtWFj2T
	l/nz6zK5CBfkD6EorXQJNjegDG+FzdiELiSAEZnSC29w4kdZer5iPkBQ3/mZ1HTRQPImOo+b3Ia
	VGvJ+dxfk1LwtJbp6/AR/TJRQ6A8zUggFpo7GNN5q2IgOAHxZRIEB6R2+FO9Azbs7zs=
X-Received: by 2002:a05:620a:2584:b0:7c7:a574:c0ac with SMTP id af79cd13be357-7c94d234d2bmr199587185a.3.1745413271799;
        Wed, 23 Apr 2025 06:01:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvC0BBlTo+m5g1Fq3RkWdluOAVAwUmBFljOPIeXR01i5VEzyjJw3LAtEQjfmCHpr6YmNfHig==
X-Received: by 2002:a05:620a:2584:b0:7c7:a574:c0ac with SMTP id af79cd13be357-7c94d234d2bmr199580785a.3.1745413271071;
        Wed, 23 Apr 2025 06:01:11 -0700 (PDT)
Received: from [192.168.65.183] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6eefc72fsm809912366b.101.2025.04.23.06.01.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 06:01:10 -0700 (PDT)
Message-ID: <6662b275-6b8e-40be-b62f-c17ae8e63dfa@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 15:01:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] Enable QUPs and Serial on SA8255p Qualcomm
 platforms
To: Praveen Talari <quic_ptalari@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_mnaresh@quicinc.com, quic_shazhuss@quicinc.com
References: <20250418151235.27787-1-quic_ptalari@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250418151235.27787-1-quic_ptalari@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1e20Ye1SpKdUMTCjDcyzYOanpduQiPoU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA5MSBTYWx0ZWRfX1H3tZaU4snox WkRMiZQ+n3MP6oPRZuf+WIJPWdX+gBfosUmP/J9cQ4YcsQzsxqbfzv59LA0KLDuz0vNMhZjRWdr BZD+vxJcQoJ7BSsRIV95AO5QvV7cZTooRMTKRSOmzaPhK2o+JKtQt1b9DM1PPP4lGz21Yp17AnM
 xdwF2XPPoJll0QtamewJb0H6i81iMikM7HK1iu3QbR4nPbjv3Vw8gEh5+c0ist3s/EylY84tzh4 iptluZ9DRh5TBM/gMZpdMSKksAO38E6rlni11Eq7LDjQ9QUEVMZ/Mpv6GA04mPH1UvH5jsYc9wU a0e/rpCWLYXZ//E/VKMwNYq0bmAUd8nn2Ss/v81ieJjjc3A9Ry0bHioKB+DX4XqzhTA61RF6huo
 ZM/sgi5hHHBTUj3HAemvbo5q1uvpVm2sr5yHX0Rg7QLFNGt5bYq/cFtbHBXWPMyc2eF2EGUs
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=6808e498 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=TM_zcG2lH5YfWnRg5aMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 1e20Ye1SpKdUMTCjDcyzYOanpduQiPoU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=926 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230091

On 4/18/25 5:12 PM, Praveen Talari wrote:
> The Qualcomm automotive SA8255p SoC relies on firmware to configure
> platform resources, including clocks, interconnects and TLMM. The device
> drivers request resources operations over SCMI using power and
> performance protocols.
> 
> The SCMI power protocol enables or disables resources like clocks,
> interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
> such as resume/suspend, to control power states(on/off).
> 
> The SCMI performance protocol manages UART baud rates, with each baud
> rate represented by a performance level. Drivers use the
> dev_pm_opp_set_level() API to request the desired baud rate by
> specifying the performance level.
> 
> The QUP drivers are SCMI clients, with clocks, interconnects, pinctrl
> and power-domains abstracted by a SCMI server.

So I recently started working on abstracting away power controls from
the SE protocol drivers into a single place, among other improvements

A snapshot of this work is available here

https://github.com/quic-kdybcio/linux/commits/topic/single_node_genise/

(not yet 100% ready..)

I think it'd make sense to get it done first, so that we can condense
most of your changes in the common driver, where we'd swap out the clock
handling for perf level setting instead

Konrad

