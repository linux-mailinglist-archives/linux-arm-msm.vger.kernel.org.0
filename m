Return-Path: <linux-arm-msm+bounces-55138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A96ECA98B35
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 15:33:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4AC24188BD60
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 13:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE31218A953;
	Wed, 23 Apr 2025 13:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sn3gscLE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4652E146A60
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 13:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745415180; cv=none; b=CFwVVUoHinJxGoi7F39C6qeY7azJXHebAeDCjWmCCNmTwiqvVF47ljklErBS/GGG+pNyV2pkHN5NPqAxOZNSDBpNCz6GWEF9M2OOXYg+wqLdXVMf/9itsKA/n6+N+2+VO1Q8CQAZzuX4ZwVZGIWOhJkMsqEDREkneJaiO27ISO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745415180; c=relaxed/simple;
	bh=f0LlhMP1zTgqOM4s2hdfTmDlKmxklAfVmO36hNkZkBs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H7arfjj/CTELeMDRZLd5mNp0q83IjxGFZYIAOZUJ0EXtYI8Ck3NLS9Kj3OE+twP1jfBbxFKyRtFEOlD810EvBrE6AjuhfqFXxediVPZ771Tgv9MkR9v4oQFToCRljtF4HYi5aSTdqxV3H0boUBRwpoq8q13V9hG8kJcGIo5Av2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sn3gscLE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAdd7R018062
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 13:32:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CzVvCAFn7NPfsPWqPTLJfwY8YHOBJ7V8/Y9zpb3WIbg=; b=Sn3gscLE2KDwm+rH
	HGKMLOTiQHbz2mYKaLRRtu90C45DK5FAu3roDrgmgc0PGrusB1rO2pU+GAw2OOiY
	NQiuEx3H1ZzaGAnUcZtyXcRVfy5BKLinFWvdFG9EeXetbRjrs5yYK8qQiXn4Ckh1
	/1qFh53fhhcF8l2L2PciBFccacHcZsz0Ca8jJ7NtQmQkoAQks5G4qNMNdjgdBzCk
	GFUCr3kf8JtsYD/ftffjkMoGwsfcVeJkKjrAv+uXPdcfzInbxW5vLcEdEeW1fCTN
	nDnGGvJFyeo1lCCdiU5R16d60Rili8GTympINz+PulI0Nj/OdpR52FQral8kYWFy
	lx74KQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh028w9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 13:32:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c547ab8273so62134785a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 06:32:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745415176; x=1746019976;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CzVvCAFn7NPfsPWqPTLJfwY8YHOBJ7V8/Y9zpb3WIbg=;
        b=oTf1Ez+m59jKzFnT1bXmue7/lZfgvw1QWmlat4jzlxTYaNUIY2LzY9CYl170zfqXWn
         BsH7d1TnwBqcSSFnKbQH7iKYKNw1dEPQtV3UesX/IDmSuz3qR9pDEMtKuqxjTjm7pY8p
         KNJeyT7WySVprtGElzJ9HBcs+SVWTZP1X48bAkwCorbt2yA65ykJpKTmlwVGix87XBHH
         hEfn0vxpRnFXKF+CO3XM4eR6wMiWtGzy4kpEpbmctfv5TwLBATXvD4BVGUXq+5zjiC8X
         Qot8QhrcR4Q1yip9KxtrLfX0AHquhu0uEcB8PY8eOcXU2+wk1F9u/Rs+kf9PZCl+mRGo
         FZQw==
X-Forwarded-Encrypted: i=1; AJvYcCUjU0yBxLXOlTGQQUQcig2JFkDh5vP0U2H2AiikK0toqMRNZK0YOqwkAwyH0vl9NbBqxDzUPp1Lj8qx/4K7@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7LX8ZJyDo1ddl8vBlk24uTA4AAe7AcI6yayT1q0MViTytitod
	MqWS0n7hbG5UQ3pA3qJMl2vICM4qUCDQ0LvUTtjyUSe01ZWgaqvPXxNri0o/WsLxXa3/cVllhFU
	GpWZGfDaeVpxb2YPp7r62yebmpsMLagSmmLH4JHtNljMMw6810gSCriNcm9PV0iw7
X-Gm-Gg: ASbGncsg1wwDNZ2o3V40rYMnxkd9+LVl7sPedZ8XcaImAbe+71x5F4JtBsDiWcfhOiI
	5Kbm1AmHoS87nCBSuBhJiiQ5tz1g+2IgBAunZ5udoN8bPXjWLTNbMSor3rxySiA7NcMt7GumIrx
	QTn8RBVYh+VYD7ZvLqe52amUgq20EqlpCZ3AWgWfBWDkWfgbds7opMnHQl9IvoEwZehzGlosYxd
	A4ab55+Yx9ZX6MIHftPcLLsdt6OKhRR5ZFqZ5ITDsdRikH8RYZBPEvmEZU69azemiuZUho/Uswo
	BQoyW001qY2yVScdCXcnWgOFiLOBN4O++hF7frXBJNsNfIPWlUsZNO+0Cu4cy8oDFKA=
X-Received: by 2002:a05:620a:2550:b0:7c5:6fee:1634 with SMTP id af79cd13be357-7c94d242721mr177991785a.3.1745415176329;
        Wed, 23 Apr 2025 06:32:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSsZ93i//Sk78zRZIql3z4o3BYAs8oVlEvuFZbuWq+7X6SIajLVb3vJpkuS6Qujy/FvIh6EQ==
X-Received: by 2002:a05:620a:2550:b0:7c5:6fee:1634 with SMTP id af79cd13be357-7c94d242721mr177988785a.3.1745415175951;
        Wed, 23 Apr 2025 06:32:55 -0700 (PDT)
Received: from [192.168.65.183] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f6258340b8sm7466337a12.56.2025.04.23.06.32.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 06:32:54 -0700 (PDT)
Message-ID: <563f1e36-c6af-4bb5-a5cb-91324e0e60b9@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 15:32:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add camera clock controller for
 sc8180x
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250422-sc8180x-camcc-support-v1-0-691614d13f06@quicinc.com>
 <20250422-sc8180x-camcc-support-v1-3-691614d13f06@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250422-sc8180x-camcc-support-v1-3-691614d13f06@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA5NSBTYWx0ZWRfX9ZCxcnVDV6ze cJwdCH+qkHw/jwC3MkUOWcnsblCqehTPfnBwaDCeVX9EQQYyfmCEufKiirTFpZButShofrwPC8L AEL/Nya8tzzUdjOdZRCVsHj9LCK/qh1Pg311nIRz/tt5WUVTx4wi1cHM44NjgUGEx6ayK8utvnZ
 kIc8Gvex2y68OWA/pEFxD/PzTJIWR7KPo7f4jl+su0cpcmTJ+NycMpgAKD021n0nZactyO3b+Qq Tz5MaacFEx2HZk1Ikmt5XVOxnwX8S68ckn8e0X10hZzg24UrY6FA8yI8cIa812Nw7I/feEC0jQv u7LfqYDat2sLY621EEcSjckH/765CamcqOpuSFs1BYTXx+FfOuzG7vkhdc6o+GvTGNE353KQm3A
 KNagnkqPbpq0jgIrDT/KuHVvs1plDOh5+sR+u0D2Js2b76S0qdRUGCXjGPAlrEqkp8X+OVeB
X-Proofpoint-GUID: dh9SZnysCgohkXJa--0CtdP5pejuaK1j
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=6808ec09 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=TyFXSi68Uxypal7PjtQA:9 a=QEXdDO2ut3YA:10
 a=pgX1na8PQfsA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: dh9SZnysCgohkXJa--0CtdP5pejuaK1j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=773 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230095

On 4/22/25 7:42 AM, Satya Priya Kakitapalli wrote:
> Add device node for camera clock controller on Qualcomm
> SC8180X platform.
> 
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

