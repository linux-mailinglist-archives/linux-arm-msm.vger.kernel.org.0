Return-Path: <linux-arm-msm+bounces-61311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2A1AD9F98
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 21:59:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE6051893A7F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 19:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC33E2E7F08;
	Sat, 14 Jun 2025 19:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dAMvxHGf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF892E6D11
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 19:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749931161; cv=none; b=GDQkM91owQSmKdQDGZZ2n5D3/8bmkY1rD41ql+mxDiPrxx+4AqSNm62EuvXS+GqLhoKGZsN0VpD9xaO1Y1c/rNscf/iwGVfAJOiYq8hhB9P17Ts3WnvnIlXn5NsigSaWVYlCYKEv6OXlIUTPlwsdQXcyhihcoz+WJ05K1gmtiew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749931161; c=relaxed/simple;
	bh=PZaEJQhz3tByOxc2e8q1GMIyVFTagBkfd0BJeUZoZW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VssU5mpKMfjvtQU5XcK7/6eaWREKEIvV8uG+egKAD5biCl4xISb7oItceNRLxKIUKig29t0jJgRUpl5aeVrLocq3aptenmwelXrgiXTWkfMlVpbwA5eaETg61RxA1Kp3xWiObtRVCNssVMz8PnD51sj9BDr053RcMFFP3JfxgUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dAMvxHGf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55EJpbFh028448
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 19:59:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D9Yz9eeOEAB6gwmE/XjUJssKvHuIHZG5zhBMZH1Z5yA=; b=dAMvxHGfPG4PEBnn
	4YUTpSk+0+m8gwP+g0AVnupkSOtc8TxpsPuUpn+mQ/1K6c/Z8Mqb2PdT/Ar/I1X5
	7CLLBd0dazKzV3QNASAhB46pQ8EkeqAsM3x0+LIPrABaMJvRuoa+lbh3gXmhmLRV
	Z4O4hyUfV/+gWjdrJgDPVXse2LGUCFXv3OYynO/ECvgfdBJGa8DCK3+LvWJdtXaz
	sp/O7RIX5ZfT7E5Nvbk42m9hA1aXhGpk8q6HvfVFgY8blWLG4FcWtWz//I42GS5Q
	Iu8+eRf5QjdyzkTaUfjIhbeBLY/t8xUL5n+Y6dNeojBYbgNzyonLz8ll4Er6xMrf
	2h3oDA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791f70yhw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 19:59:18 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8ca9286d9so1023726d6.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 12:59:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749931157; x=1750535957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D9Yz9eeOEAB6gwmE/XjUJssKvHuIHZG5zhBMZH1Z5yA=;
        b=Tu+o50mW3Xtk3jsAXLudPsl1JCsYkfiba2HXhD76Xk8Fo0yqj7eoqNJIZ8XlaJ4tDV
         CqNbFZWdwkrx7uYTL8avWhnAoH0WDpd2xRGU0vAIp2BOUnkMKXkjY0og2OswOertcSAx
         82GiyjaOwqLAgIr7j5gopSxjNQqLh/lQxOwx6s4dE1ZUJMYLIz+VNKUSOoqbYOffR4hI
         PLpWWaYf/jhaiEW+52gxXvrjv/hUC/LoXdbytgT3Xfq1DheuxgKlFoZxKllEw4bC4LcF
         PL7DhtXKc/YyiER3AWbpKvQ7mIijAAFjWQImeYuS90Z4WCLulr4oykHmceBDUlxWL84f
         moTA==
X-Forwarded-Encrypted: i=1; AJvYcCUj0HZJoVCNC9Uw9ru9wgHK55TA8k+oJs/mf7havUFDXL0yZCU9mLW5wapHEDFPV5Q0QamsSnvLRBusDsQ2@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4dsjVvxucZeEBvEJUIy3WiLBK+rAVSvUVIVBmDkEpEqos+FSi
	SA1nvxyPAVL3K/Y78zD+pc8AacWurOnGulTuDktddxMqk0CEmkYrQmu1LVj3j5P6TtaXHC6NKb6
	BxNYxbRWJhiksgbUy+aEqM20oxi6TBWvWTzvJGQfRa7VP8LFIdYugcpa8oMJgj/orBXiq
X-Gm-Gg: ASbGncuRzJKKCtpDK29a9aUA8Dk8+o4LtrRDG2AlWPd+LOLaYX8elzW9BErq/OruNc+
	AegcLTQRHi9sjtJnIq9P9Ky1X+Y00C+ocjKh4cnJ47Zrk2VDcZdU/eDRLReY3vawCG3HKZitdyR
	j/PoQm9Altt1OsJsMKk861F5wEZtklrPXEnw5m403i78rKQAAmYFbyX0RnzsisghdGaLP32BOpO
	RMG1pZVWrWTK2fw+L5ufr2mBaP5x8eWKI2mgE65eqfZzxa2zO2R2AKdR/FiYYg7KUdW0T1Lh9L6
	UwRGSX2fyHfUof+trA0/blrJ90POnrpubk5SvgoMgrPfK8UOqzTafJq2OsBgFiuRYMCzD9TahBw
	U6lI=
X-Received: by 2002:a05:6214:1d25:b0:6fa:fcb0:b899 with SMTP id 6a1803df08f44-6fb4779b7edmr21624226d6.4.1749931157281;
        Sat, 14 Jun 2025 12:59:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyfvXu2z/Eu8GxiF3dbJxs97S6hPTXH957lzGZe6VLmsR4eBt3mhoTtVoO+YoinFTILZFt4Q==
X-Received: by 2002:a05:6214:1d25:b0:6fa:fcb0:b899 with SMTP id 6a1803df08f44-6fb4779b7edmr21624086d6.4.1749931156870;
        Sat, 14 Jun 2025 12:59:16 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8158d33sm356206366b.31.2025.06.14.12.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jun 2025 12:59:16 -0700 (PDT)
Message-ID: <296a9ab8-04e3-4623-8246-c8fd3fca8d98@oss.qualcomm.com>
Date: Sat, 14 Jun 2025 21:59:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] phy: qcom: qmp-pcie: add x1e80100 qref supplies
To: Johan Hovold <johan@kernel.org>, Wenbin Yao <quic_wenbyao@quicinc.com>
Cc: catalin.marinas@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        vkoul@kernel.org, kishon@kernel.org, sfr@canb.auug.org.au,
        linux-phy@lists.infradead.org, krishna.chundru@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        quic_cang@quicinc.com, qiang.yu@oss.qualcomm.com,
        Johan Hovold <johan+linaro@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>
References: <20250604080237.494014-1-quic_wenbyao@quicinc.com>
 <20250604080237.494014-6-quic_wenbyao@quicinc.com>
 <aEBh2xHu3QDtUrxe@hovoldconsulting.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aEBh2xHu3QDtUrxe@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDE2NiBTYWx0ZWRfXzzk1XuO2hIMf
 GYF8MBrmRE3QQY8U2p5ASxtOq3BXdbZP8+/UBREcG81lti6Sfv9nj8mhNpjKpqQVxqAOGY9H2Qi
 NYhwN0lr5HxZqYBYPVl6aUTzuRNZBH/f6BbGoZylppAaoH5/8RxepiKfgNrTirX2kp8/fmLZMjQ
 XqXZtuVwycAYUzvgcal7ziDAvgGHQiclIBnALwemusSEUVrtyz+caTPxyOa1G2p4UTaO9SABDti
 xV7riCQ12VtNlHdET1vgzsSU0QHKwpdYnXxGANHmzqHmz1dfkRUXStFRZOmuoBleSBKeTDaWkiI
 3LJKl+kyzalekiiJh/b1LX3PTWy5sbA1FfqYvaqx6DnR/0oNpltgU/b4MUkIssNuRIFPxeyjTbi
 d38QrTebo3NU5Yef4WEAHiK3P5cbg96/eNWdKnlar2ONm82b+PXPnGkOqIK3ATMAb1G/BrGH
X-Proofpoint-GUID: TGKIqIbuontxxIVoo6mYObq2jYjjba9v
X-Proofpoint-ORIG-GUID: TGKIqIbuontxxIVoo6mYObq2jYjjba9v
X-Authority-Analysis: v=2.4 cv=FrIF/3rq c=1 sm=1 tr=0 ts=684dd496 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8
 a=EUspDBNiAAAA:8 a=6rhPmxELWQzppWOSQc8A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=xwnAI6pc5liRhupp6brZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-14_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506140166

On 6/4/25 5:10 PM, Johan Hovold wrote:
> On Wed, Jun 04, 2025 at 04:02:37PM +0800, Wenbin Yao wrote:
>> From: Qiang Yu <qiang.yu@oss.qualcomm.com>
>>
>> All PCIe PHYs on the X1E80100 SOC require the vdda-qref, which feeds QREF
>> clocks provided by the TCSR device.
> 
> As I just mentioned in the thread where this is still being discussed:
> 
> 	https://lore.kernel.org/all/aEBfV2M-ZqDF7aRz@hovoldconsulting.com
> 
> you need to provide a lot more detail on why you think modelling these
> supplies as PHY supplies (which they are not) is the right thing to do.
> 
> Also please answer the question I've asked three times now on how the
> QREF supplies map to PHY supplies on X1E as no one will be able to use
> this binding unless this is documented somewhere (and similar for other
> SoCs).
> 
> The fact that you so far have not been able to provide an answer
> seems to suggest that these supplies need to be managed by the TCSR
> clock driver which can handle the mapping.

To emphasize, we apparently can't do it, because there exist IPs
where the QREF *ref clock* is not expressed through a bit in TCSR
(which we interpret as TCSR_CC), but the *supply* for that clock must
still be described somehow, as it obviously needs power.

To add to the mess, it may be that there is more than one supply
per reference clock required (which is not necessarily an issue
when the driver takes care of it, but something to keep in mind).

Konrad

