Return-Path: <linux-arm-msm+bounces-63685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D674AAF9108
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 13:06:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FCA83A1EE1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 11:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBC192C15A1;
	Fri,  4 Jul 2025 11:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KEOiVfWe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651152BE7BA
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 11:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751627179; cv=none; b=pOwcsQ+V9+tPnfGcCa3QLjgZNFVCMsMNuOkdX0YgVCQWpPs8UEo5PC+AVH9NmsfOmJ9afT0XQ0Ilp6fJrs6yusxaGfaR34MTgHc4IkkseYLrLm4IC5fJnoClV0oMEVUtU+EAp5NztBVm/su5Ddda+Z2pHLvtP979kQpIDnc7k34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751627179; c=relaxed/simple;
	bh=k3yRpHVV4mG8PD+9jKn9SDf4cJFDmVdprG2GMo1cjKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=opJAqwvIS+qm+HFMm6szm4pSR07h60r3wHpZs4/ksCWK7fCeJ0SnmWbdY1zElHq0v9Fmtr7fDrObSvJ2NmDBZPbbwE/vUNc86am8OfY7zVOmTVLiTQglUrv48CcyPUGRP1iSWnpltgUkyCOFTRC9R29bv4kr6Wg10j8n8XuVTEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KEOiVfWe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5648fWOO024904
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Jul 2025 11:06:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2XxqMM/RSUTF2mZkG2gocViLCUQzGXcwFWZuP+ol460=; b=KEOiVfWeA44SOaKc
	6xYZn8C2V3e+4xKSoxAAbHrk58XEX9tJJOKUl8s64JK5RUgE/AAqRWONcvhPBOdQ
	hmrMgLROzm4Mv6Ca4LCOkWwop1V3Oyf0WV5lJl73s7yHeFcM/3AReTWNYk6qHqgQ
	TeFALwk5GfIJpbaK/QB392LjbHHSVISiCk6T1V+61HoBPTUwCa6isi2WVSMGf8oF
	UezQGSf17DhbDnaSq8vJnL/WbdIdYcMyYMHUXywvMRbQLuJNCOeSh8JB74nUEgy3
	c40wF1Y83sy88TSPyckG9u6irCEUJi0B5O1TGop/4hm5ZnhULOXxnkRQRgvP61wf
	d76bSA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j802bdt3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 11:06:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a6f59d5ac6so1513851cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 04:06:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751627176; x=1752231976;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2XxqMM/RSUTF2mZkG2gocViLCUQzGXcwFWZuP+ol460=;
        b=SqsddliiKBOxCb/Z/lJc064ov18WayJcpCNVjCswhUXgig+o28ak+6EkVzGuS3FVKF
         wyqOO6m1eACFQ78KCecy0bYAkYFJ2XRh3xP8wG/diM5aNXffFregadls1QGiJH8LhzKT
         +gBMwDAFC5Ve36jaMh3fA/SzV3kmdmlLnxM5Xp6K6aIRAyqKia/j+bqKP63f0Y7ApDS1
         EVISzr1tGDY75ufmGq0st+2PZnOfz83TtRqMFppHzcO54EDoQ5MK76yp67mfKER+UNd/
         8zs2/i+yfm4gO0nsitiSUG634DQYiqOK46jMzeCy7gMYykvv6R6cwEuT/BK/uEp1h0/B
         SI6w==
X-Forwarded-Encrypted: i=1; AJvYcCVlPan7ltrlWjbx2X2Y6Exj2ntRJXZp23jgIR7jvXXxiAvvaqgSnVwpyas9mSEQosLu6UhE041nZjQPElsS@vger.kernel.org
X-Gm-Message-State: AOJu0YzuvbdFzhYHulkUmXPeEv3W4YpYos6luP/+Kv655b5MOrObg1Yy
	J78HP4LmdXs3nh2SZW39g+u4g+jQLmtJeQEzWYEQPaJdYFsYUAApwbhf0gYU6ldsBS5AfMFtjRB
	axj843fpa3f2HsrppURDH2/LJ1udZlwvZN8e1M2Ppf3J4n7wsQC1YiEkQkR0Uq2PVm5PB
X-Gm-Gg: ASbGncu8DvO8490YtyLrf47iptTV+2rqjqJFAVlFbXPutROQTjRmlmQF8zCUVy1V1Go
	Nbn5VUpaCD30UbKpnqNRkpHGpbpj79IfaJiaXisN2D6S6/EMntDyr8gCrpbH/J8u2Dk+f8FrvmJ
	0/JOXzPBFyixBRbQxBDqQaJaQq24MpF66Z22S8bhpriSnUmzIjDLZ0gH5Ou2Bsms1SViLxRMVns
	ornZ5dxfm3wdek6dXkFvTbia5LR6QFNHMoiFWaBrvUu2uNsiGZjSt+WIDw7LCSVj6giO21Jgr/M
	qfu3iZ3oIMXwXyDJ5zY6WYJHc3ICVpQYoI9FFMTSet3lMhm8A0yA8bSEKjqaFo4enLJTTEb+a4H
	1oe8Cqg==
X-Received: by 2002:ac8:5fd0:0:b0:4a7:bed9:524c with SMTP id d75a77b69052e-4a9975cf1eemr9429741cf.11.1751627176223;
        Fri, 04 Jul 2025 04:06:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEL00AfasMKdltGMxGM974NBZd0imq6S1Dc9fbvd0ZKYoSfNqzbgVRMjgXDHONPutQiSOAFdQ==
X-Received: by 2002:ac8:5fd0:0:b0:4a7:bed9:524c with SMTP id d75a77b69052e-4a9975cf1eemr9429321cf.11.1751627175516;
        Fri, 04 Jul 2025 04:06:15 -0700 (PDT)
Received: from [192.168.1.106] (83.9.29.45.neoplus.adsl.tpnet.pl. [83.9.29.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b02a23sm152666366b.112.2025.07.04.04.06.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 04:06:14 -0700 (PDT)
Message-ID: <0e13833f-fc0c-4bb1-a1e4-fdba07c50768@oss.qualcomm.com>
Date: Fri, 4 Jul 2025 13:06:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] clk: qcom: common: Add support to register rcg
 dfs in qcom_cc_really_probe
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250704-sm7635-clocks-v2-0-9e47a7c0d47f@fairphone.com>
 <20250704-sm7635-clocks-v2-1-9e47a7c0d47f@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250704-sm7635-clocks-v2-1-9e47a7c0d47f@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FMGSEY6bCVr9IyPsbwwkOoWFM7WLWMtx
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=6867b5a9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=qmfFy4ndMtQ753Zl/n/b/A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=oQRPDSM0WpIYGLKzx8wA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: FMGSEY6bCVr9IyPsbwwkOoWFM7WLWMtx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA4NSBTYWx0ZWRfX39BppEAnXQWi
 xIwuBBeL+wDmA0Xyc2+lsJ8JJyckxEReGPcQkKLQxJAVM5BYZVD7N8ta/QzOOIiGg73EZTwFuHA
 YSnaSJHsKlB4KxHrofr7Jak6G3MDkoXkxP440bOREGD1dFs6qQMej1/kbVkbbM7aI4G43pNlahn
 Kwtsxi9NFamZPBBsMTJN8YInX2yUmXLFvNk+J7ARwR6BLTMQuMn3Q+79cDuPfB3WxAA+mnLUtlX
 2sHa5DxkQiTxexErvxLsnSBkCsRZ+3tjsp09w33sGrQGi5CeNCkmrL4hYDeAE7TeTZt3EWdJb/e
 iazL+HhRoOG9lPZRqWoUdjsjHgYJlKaDT/cGtw5JDIH+bsmsM5eeMvoiWQQzQHhHMPK5pU60kxk
 cVVvzn1l6ZSRySo//jsJGzp9k+yunkIyEFTOFA2cTnO2vEdf+6Xf/WNmOfQARVHT/XPw/yhS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=952 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040085



On 04-Jul-25 09:16, Luca Weiss wrote:
> Add support to register the rcg dfs in qcom_cc_really_probe(). This
> allows users to move the call from the probe function to static
> properties.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

