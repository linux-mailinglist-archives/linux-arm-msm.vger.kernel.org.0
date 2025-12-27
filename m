Return-Path: <linux-arm-msm+bounces-86695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D561DCDFFE6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Dec 2025 18:05:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6F51A300F188
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Dec 2025 17:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADBCB23815B;
	Sat, 27 Dec 2025 17:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MV5PuPi3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I8FcAVGR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1508834
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Dec 2025 17:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766855106; cv=none; b=ORNgR3dh3Q7jl3qhMHBZaVHgI/2NKyOZdEOZU182F4F/MMu/4ZQK2NxGwz0f8ptQs4SOCwH0dp4iHR1pPdSvqQniLm0ssa53csxpqOkP5FloL0Ciz/x59mCo3OcJtHTqm33W/z044n4z5SeMj5gLAYzKOLwrNPmMwz1Swv8Qqfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766855106; c=relaxed/simple;
	bh=MS9vLUY5ntaeZEme31BM++oWeE6wEUHUNjD0o/tN8lo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q/YetNPPoiTBJcRQKJFDWigI2t/zX/nMCQYnemSW2vrrqjiUQmti8MenDrRBeZnE8XYnVNpsAKI1A8zv6YaTlHm2VJQqKUhpZG/fWUZKSFbrD0BElxtuu5udzK/dEIDlDujTjQf3vALGAXFXeZumvuyDICFWZSlQEJlF+T/AI3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MV5PuPi3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I8FcAVGR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BR7rPQL3443643
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Dec 2025 17:05:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Oh/6k7T4U0Rm5ZzbG+CXXR8JXY/6vqOtJhEadyO4Tw=; b=MV5PuPi39RVmd5OU
	D21hZnZtyLtG6DudjaTQtaaXKmHaNmi072SNxd5M/vg/iTtuVwIfBcTA1u1YmX98
	u0PKk2yOOvIEZZqX2u9OQl7K3paB0WHYD2zo3W73H6qi649f0bTdLa+nHOQYXplJ
	w2i1j/Uky0F0c0MQ70sZMmEJozZ+uHoEveWSQPtaXHCS8A+68FHRT+SoVjkyjybt
	gE11IaM3XncmS9rU9sbUeZAWzQo5PhnQJ/uq02yEC0YL9nrC1oldZG/WeYz+mQUP
	ZQFLkhmdmvgPcGjz9Xfu4eEx+0OekNS/09+g6Z1Jg/LGRzlgc11EQBcqU41EAU7X
	NIytyg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba55e11ux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Dec 2025 17:05:03 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-93f568048ccso7581697241.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Dec 2025 09:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766855102; x=1767459902; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+Oh/6k7T4U0Rm5ZzbG+CXXR8JXY/6vqOtJhEadyO4Tw=;
        b=I8FcAVGR/7Rddti4Jg6pKQAYmAytcQHvyQhVGVqyfvENtYtUfsnWzwH3YdMVCilDGg
         xrNXGJ4X5QrEnarFAzFrJowDbL6axDptX0cD/wo6VDsZfhd5jWiFHECSDgv0vRjl9+tB
         J6P35ErpkqqFicmso/9KdJAhJXuxyuOxHzoiYxK8u8ZN0o1JucYjpZBp+CiJ1m9EqNvi
         ub3NYxtz4jHKqtHe4gV99z4vojAxGA5apxWpHtxZEAEUGkHHSQrCzxN5AswQiyqsjDDD
         AAyrzSNuKn3zYB8SJxhC+jk7lrJO87Vwj8xuJNdUWCsOtD9LbMhJZYWBwbhHOB7UwpoL
         lJnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766855102; x=1767459902;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Oh/6k7T4U0Rm5ZzbG+CXXR8JXY/6vqOtJhEadyO4Tw=;
        b=aB/3PF+LYoeWIPlX6iY/HET+889kVR9Ws3MZGH8z1rnESpsJ6Vt6CPL52dhVWUh4S+
         FNAgXBMhW9IaQs0qHLuAzXSzbjLZQcrpzzRoSzSJAdfieL+LcU8/6xiujWA3BGfSm6g7
         bN+m5pepnSg7jGY4MoSsrBxmt4GJ3vwOr1rFYZlFqyz8eS4zej9+wyjclx3Ge7zlP9Di
         wzWozc1mc5f4WKfRA1g2ZGxZCYqh7fGk/PfawI14KKc4PDp1r93PoYJgrcc5TtOlybiC
         Q7x5XcYAWQYW0RupWXVTIPa7mUT6YMpe+xOIyvINd/4kOuuHYxrnhMqQr1fuRqmnJFq6
         aFKw==
X-Forwarded-Encrypted: i=1; AJvYcCW25Hl2Ynk1wPt4xuB6oWLWcygys9QlZJBnCghjln8EwRdE7+u649U1sXc4O4NX/GiN6j0U8u8AzJmyYMFI@vger.kernel.org
X-Gm-Message-State: AOJu0YzgimD+d90zXpRwAaPRzzMLfLtpFYAP277TwsJCZJOHgfbesHmw
	uzU2tDwILdn8/RUpxFxwbPWm+rxlShpY7lWxy5Per0a+lLkroUG6yCdT8Oj0CZV8ep7t14IQvhG
	mFNHlzN9e3y6Va3YQ6GmvWa8iV07TGJfQC6W5EKbvNGpZAVCWdQA/Or04rkaB5arZdnYF
X-Gm-Gg: AY/fxX4hkfCJ2s6onfb0IbNWekfhA5mEDLQ0zV9rS8a3o0GE756w4P8/KFBWAExRk3g
	IGqxq6sce71cZYqojevgGVou7HWMQiVP18mYjiGhP16fxF2XBY4g5senh4KEif7hUsFeSHv4T0f
	l9cLeYhspANigefieMPz5T8ZaBzCG1xRf7GvhlMQL6bpK05adrr6I1zCFX/VpurCIgqjxgDXqac
	eve9JQ/HBxbv4QbvA1wP+cqjtj1yYzPB0ufj5XEf3Hc86aGbxHk/zhdidFZs3Xvfq30aIvjGxqc
	xYrl7hc6a+mprTnuw+XA5OSzTZhT1F5Mt2i/CJE4yoxm/T2IunDcLnswTmJFt8GPjrvVRvaTafb
	kHYAUmPVgLLTrPOJfFK8rplL7qAtsdm7OPbIKu+bt5NzifZWWjwO2OxvXZZ6QWT9nKHz4DyQMEQ
	3PPXxYXBoFxm1imGGpWlMcfcE=
X-Received: by 2002:a05:6102:c4f:b0:5db:cc92:26e7 with SMTP id ada2fe7eead31-5eb1a853c12mr7702923137.38.1766855102559;
        Sat, 27 Dec 2025 09:05:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwkyznsZy9VLF3+rmshKCzvJdz1PTVNzfgXQXNYlm28+ki8EXPxlEy7ZyW8U3oJli0ER/zbA==
X-Received: by 2002:a05:6102:c4f:b0:5db:cc92:26e7 with SMTP id ada2fe7eead31-5eb1a853c12mr7702916137.38.1766855102117;
        Sat, 27 Dec 2025 09:05:02 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-381224de719sm68420111fa.8.2025.12.27.09.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 09:05:01 -0800 (PST)
Date: Sat, 27 Dec 2025 19:04:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        devicetree@vger.kernel.org, konradybcio@kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Rob Herring <robh@kernel.org>,
        ulf.hansson@linaro.org
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: dts: switch to RPMPD_* indices
Message-ID: <cbibz5cli5lk7wmzfzuek3rnil3xykx4ucdblonsyellochu5t@nuw6ij37ftiw>
References: <CAGsSOWWMO8+8vB2EM8s1=hyN1raO6TDpqGBTdrmNrZpfDfn5wQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsSOWWMO8+8vB2EM8s1=hyN1raO6TDpqGBTdrmNrZpfDfn5wQ@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI3MDE2MSBTYWx0ZWRfXwH6n+HRp59KL
 dNNnrViKSfA9vSPJIE/LOudbFr4C/xPLZAmg3KucZELE9L4X8HLHzrnZD0cHxST4Z9chgaGJNjX
 HmtbulUV3+ab7fpc2mO4Oa8WDexVztnFoOHxGIqFeeqSN7zpVchTF/nhgs9Q08f6gcj2PBQbTya
 I4osmBN/GB3a83eNP3WUBKjP9OxluPLtq0kvEbuza9TpPhUnc4QedKYsBI5iEdXGdeZRUPSbfgT
 dfz8wE8/yB4tQTwmNxzuTmKIn8pvlQ6AzR2qAOa2JHsNntx6PA3BN+FHYiKei0AdB5jjBuzgog/
 2Bd1I3yvy2S8M1Yx7B/d9keajgPfbI04bWp6g9b+PT15JfMCXoh0VUWZEPNJjaWtv03cLz2XA43
 AoQKj7j1oibCHWsIu+jz83QvOwIovMsoSkkdwtjowolInavJuY0Xj/0+he47ypgIYDMdo55cxjT
 L8GDMzRCgqM8TzpqfRg==
X-Authority-Analysis: v=2.4 cv=UMDQ3Sfy c=1 sm=1 tr=0 ts=695011bf cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=MN_lGMKq_FOr7paQGrQA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=Qmqj-zlutpIA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: JYm1498dgqIA43vzVA04Fdyksqn1r3FS
X-Proofpoint-GUID: JYm1498dgqIA43vzVA04Fdyksqn1r3FS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-27_04,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512270161

On Sat, Dec 27, 2025 at 05:53:18PM +0100, Barnabás Czémán wrote:
> Hi,
> 
> MSM8937 and MSM8917 MSS would need more power domains like MSM8939 and MSM8953.
> I am planning to send modem related changes soon what are interfering
> with this change.
> 
> https://github.com/barni2000/linux/commit/21151cb3d07124897e4d3dad51c833c4af27f6e0

Please extend the RPMPD_ enumeration, adding VDDMD.

> Shawn
> 
> Br,
> Barnabas

-- 
With best wishes
Dmitry

