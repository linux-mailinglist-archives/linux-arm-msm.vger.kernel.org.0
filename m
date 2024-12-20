Return-Path: <linux-arm-msm+bounces-42978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE52C9F91F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 13:11:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B39821897765
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 12:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99E4F1C54BB;
	Fri, 20 Dec 2024 12:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pRM7cEsl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BC91C5487
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 12:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734696661; cv=none; b=ui/qdjvaNbK6AJuc6dBQeNc/eK62HQUVphwyziRlrraQ/pnlKQx6n2IKQyYoSMCPileLOm3lZEpSL4QDgPvxy34ScJn3DrHJ/0T2mmjDpAAVm5sH+onD49O30Wdz0+kf3p0B65FuenTMJl2R6vf7X7JYr3kW7bbn1598C18a1yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734696661; c=relaxed/simple;
	bh=ixsC8OUURgIZhAe8Mkq7/VLolocawMQe0qsbVbYNxo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mIGS6hcYQiQfMIdAcBJx1u4bpHv6D5UYygzfaCmNorYMO/d5kXyWxl1uJbrjKslx58Pi8GInYkin6TfxKfb23L6lJg8vZFvloTVso6Dei1avoyF58wi4gZtfzOFQQnxe8Fdwef6lAtaOetEJH9Ip7nmScpAlfkqyXb2esAbHE94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pRM7cEsl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK5enED005177
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 12:10:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tR3RktHelgHkpqS43pQviEzDpPVdWgKiqsqXO164Q+Y=; b=pRM7cEslYzawNh5F
	ODyr0sFsvrItzJmKADhmTjujJ5iiW9NJVrZAbMGpfjIlncePIJtHcTLKom9jmK6I
	jNr/epzrE/EFoqUivdRg5k5Kj1B6SI7vLounccdqTaXNF31LRyOf0cm/gObsY277
	SaW28ZkfqudE8VqO8ETbveDsYGJ1u6pkMcQIy1lZ5t3W1TfIOnzlyRxSANyGEaUv
	W8/3poN4ZonP3g0skhyPAi8lsRsyWezPfFlciKb4sQ7/5us9P7wLG2loncsROKJC
	k5XOi/KSX4Rmg4fW3IoKNjOO4IZ+6qgfLCt2lugJFkmHqUgZoNsE8B410k1gHpiE
	uNcikQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n2n5s08c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 12:10:58 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6d8e8153104so4480346d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 04:10:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734696657; x=1735301457;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tR3RktHelgHkpqS43pQviEzDpPVdWgKiqsqXO164Q+Y=;
        b=iUqLTqF8dUUb06Q108yTfIVXudjdsmAS+BG63Rc/VWWFMM8OhdMyq3b8z4AEDGA4UZ
         SVSGvhnbbO2ZwLY7KQbSTXImngI44/r/NpJY/rXZWPuMxHAUaNz4paBOL8EyM5i+GrjK
         34zWnO7f/f9JzE/q4mT0VY2sOdjQavdnu9VBJExFcyquXhTJuiREgDFwmwxjaK9Q3Bmb
         G08tnKIap0uHUA71z0UnMRqz6RdH1cJTdaIZyT9lwyMs3NpVRFr8PvOr5B/8DjG3YWRT
         P1KrJeQVzvLbJRYMLLkX4ooPe84mFRJx61JHEkskStIA3HGO+fDcODKT2pqiUErWVQUS
         DWhg==
X-Gm-Message-State: AOJu0YxhDLtOqA0gVnU8trDB4sgnaMYt2e4EGUT1zQQKbmZXnzIXWy3A
	6pijipmrDgX+L44T4PY1pUo73pocvHsKidSKl+LYhjxszy/cH4MsyD7hnkVz5Qj95tf+ObHarw4
	2eVtJ4c3a5hcEIzEkQ/h38lX0697JPffc2NIKkUNcpUptA7A96r64sb8xE9ou5Fl/
X-Gm-Gg: ASbGncvfUbx/KjUA1OY6NR+8NjLTSe+GvAvJW7gyw6FXg8H8IOdsSNaCSZxd9NtTJTQ
	sMY+jzSQ2uDKpol+YPySxW7XCffnwfPyyDa5Dh46rxNFBSVmBmE/WkxtAqbRNwTiHOoBVzSXRud
	FWZ1viM22tNH4UuCMWgl9KFcBG+mKMjHLQLlFxMcG6b8Cwp5AtKCgYWuPe8S0xdDAm5j6r4tP1X
	MVtoweX6vwEgXvNHUK5+PGXc2MDKVOHVdchJnCejdfPTWdJSb20XBSKljREcrao4iAxjsvZYHpk
	1wsX/BW+58SVBcvJoJgXJI1qe02K9PWQ9jQ=
X-Received: by 2002:a05:620a:26a4:b0:7b8:5629:5d58 with SMTP id af79cd13be357-7b9ba743a88mr148180585a.4.1734696657548;
        Fri, 20 Dec 2024 04:10:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEp1Tme9VmNjTRC8n0yRS7LgoBf7/6a2YtTs9BUveVcRYh7GuIm5Nkh0GTzoPGQRv00zVEA0A==
X-Received: by 2002:a05:620a:26a4:b0:7b8:5629:5d58 with SMTP id af79cd13be357-7b9ba743a88mr148178985a.4.1734696657191;
        Fri, 20 Dec 2024 04:10:57 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e830af1sm170563966b.14.2024.12.20.04.10.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 04:10:56 -0800 (PST)
Message-ID: <65d46d28-05d1-4c47-a1f2-7694552a743c@oss.qualcomm.com>
Date: Fri, 20 Dec 2024 13:10:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add
 the EC
To: "Aiqun(Maria) Yu" <quic_aiquny@quicinc.com>,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20241219200821.8328-1-maccraft123mc@gmail.com>
 <20241219200821.8328-3-maccraft123mc@gmail.com>
 <d301a695-a5d8-4e76-862a-a6ea5c125617@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d301a695-a5d8-4e76-862a-a6ea5c125617@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wzay8TPtEx-R8mssNgbhmaXyNeaImqWT
X-Proofpoint-GUID: wzay8TPtEx-R8mssNgbhmaXyNeaImqWT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 mlxscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200100

On 20.12.2024 12:52 PM, Aiqun(Maria) Yu wrote:
> On 12/20/2024 4:08 AM, Maya Matuszczyk wrote:
>> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> 
> Is the commit message missing for this patch?

Yeah

Maya, please add a short summary (some backstory about the EC, what
it does or so).

You'll probably be asked to do the same with the bindings commit, but
you can mostly repeat the same thing both here and there.

Konrad


