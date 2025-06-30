Return-Path: <linux-arm-msm+bounces-63097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2B3AEE324
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 17:56:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E463189FA01
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 15:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69D7228F95F;
	Mon, 30 Jun 2025 15:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F2tLCm6O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7827290D98
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 15:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751298989; cv=none; b=BTTxx5v/Mf594NjUCSRCz8d/VBu1DOa3u9vmJmMHU1Sp2QfJqk2UH6Xihykd9YbOTlHEyEhk0PkRDTP1TxA9IOxNKPq/z8rOhMvnJ7RHjUYb7eEgihbn5hDwMgv/DzqFo15PKISuH7GqtS/zM1ct/40TpMLP3hS3M7xs6w+zSqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751298989; c=relaxed/simple;
	bh=zGLBBCS69S5bewAHvIuxxbqOURYmkIJvrgkWVT8V734=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pIlGGO/F7gpPmMNyvJsw7cb6x9m6nSI2/UPP007zv+h1QQXkEbgCCoy/Vg2RArFkXv2Ooo+Bfl5h+Qy0nB72KepOfUl8ZuLfbsLP5XZmiraxlDmQBXRaciyxaEUvIqUm9OcmoboLZaLtLBdlhs4f0GQHRHc1TW8/QIPZfTc7jM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F2tLCm6O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U8DQkC000415
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 15:56:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D0Fl5LewKcARD32i6DxdJAAOcn3ZiRpvJ9i+gosfreA=; b=F2tLCm6OVgJ5uM3o
	+7t/kkc3XyFSQA7vLg6R3KpOKbVMDK2sDZ3waa1SM22IyjoviFRGFE8XzamBmUjY
	PU2acpGUm+JVTTlD4DbAz3S2kKKuX/2bmgMViYatB+qa2B0pHlC7pELi0v3NxToO
	9mVK2iBNj9RjGVM8SfBmRUo3TnRBk+V42xUV+Ct+JToMQ6XgpyFx0e83x6w8ufNz
	TsETeG4+G+b626dPwfu/xheR9fUlvdpAgxfv0cBNKE8eLjpoE1VPNxhSY7JHeK+I
	3h+Vzsslh0KL/PsFIwBpfhtU8oLnqkczSgV4Ns5G7J7stufuHVwTI5Z5Pa6pStpI
	4Ah0IQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qm5a9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 15:56:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d3ba561898so41379785a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 08:56:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751298980; x=1751903780;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D0Fl5LewKcARD32i6DxdJAAOcn3ZiRpvJ9i+gosfreA=;
        b=ldYMbtqfa4IhJvYwykC0qSNCtcoMnEVMxuAJen30aBTzvLsVjQbIHOubYdLhVkL4i9
         6BsclEkXbGkXTusa53MlYH7t86ctjTc+uCs9R263icmKYBKrQfKsBIw0OELPGY0qKIWY
         41jtVBIgGRscDerFo1da4Ab5ktOqJ0rL+HQObugmmRGKp9C4//vS9Z5rGpuajunhzLfn
         hWdKI6IG4Kx6IiaVgLRsTGFZip2qx/Fh16ZZVIiStp6GhG7MsAdNeUwxnzbA0CDTuxt8
         Gdl7ueVBpswPFXXUEx3YdvdjoRpEVHkSKxwy3kvfmExoDnYIqsqpcfUD4Sg0NTRKLauz
         L6SA==
X-Forwarded-Encrypted: i=1; AJvYcCX7QuEwdhREqdksVzVu8d7sXz5gPqh2uaXmeuCSa1nYE2y3Zlv/9mIIvxoYx7je2YlT6dZFuaOHmw73xsh3@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+sQYtSrdmmSdV8r6E78/zGUu43iEV34qvtZ5XXUVsVMDeW/+y
	qQznw8u1uP57qRWtjIgiAwdZT+ftodkwvfB4PuG9Z3tAAKdOnZtiyJJd7JVGjSdZ52ZhJSfdwXO
	eora/wRNq0dr55HvTEd2mtkutCK0yLAwd8bSRJ2vcvku54tvMyb5vNw8iiRztuxxCWQ+e
X-Gm-Gg: ASbGncu4JyY92IreCeD/EH9022MgP86J6QxBfdQHzG2o6Pczalf26HyBQz7Cju+TkG5
	8mG9gNhmVNKnsLj3JfxxqxxLehvzBmPNWGdyH4yLOY6MATY4Z97VLWA1rtmrskbzOMOlB4FzjVV
	VIvAfQvGOhUQfWhadcAhmKf1lagxqkXAiUl5VjoLo3CtzWdZh458clo20Yo1uKbHsHI3g11ERT6
	SxoJdY/LyOiwz5Wcg8C7XTadH5vfGaQ9/6iHBnFVCtberuqOvLvwzm3aR84KwiVLz+7X+G0VqsD
	Fs3dGgwiigHg8i70+tQ5xWOohI+mouYCSJpAZErYBArD0QR3XvXtW8sSzWhshnpw1DvZbTs/rSb
	Iw/D+5Z5f
X-Received: by 2002:a05:620a:690d:b0:7ce:e99e:bc87 with SMTP id af79cd13be357-7d44c21cdd8mr551566785a.6.1751298979909;
        Mon, 30 Jun 2025 08:56:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmRmTmwWyC/XAvDEJJwe50p+zxnhcywcSEGqHClp/yN/qqSKZwbpDjpuECX6rKycQCNqvXGA==
X-Received: by 2002:a05:620a:690d:b0:7ce:e99e:bc87 with SMTP id af79cd13be357-7d44c21cdd8mr551564485a.6.1751298979335;
        Mon, 30 Jun 2025 08:56:19 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae36ffe2981sm484430166b.120.2025.06.30.08.56.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 08:56:18 -0700 (PDT)
Message-ID: <aaaa42ed-989e-43ee-8d45-2908f52e8584@oss.qualcomm.com>
Date: Mon, 30 Jun 2025 17:56:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ci: Remove sdm845/cheza jobs
To: rob.clark@oss.qualcomm.com, Doug Anderson <dianders@chromium.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20250629135843.30097-1-robin.clark@oss.qualcomm.com>
 <92314f06-e6a8-4882-a31c-914438d7761d@oss.qualcomm.com>
 <CACSVV01AUOp7vZ7kLt+gwxvfv4CYLtAQg6MhUccygbi1NpVJMg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACSVV01AUOp7vZ7kLt+gwxvfv4CYLtAQg6MhUccygbi1NpVJMg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=6862b3a4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=_ijeUKsmqluwEKimemEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: exvC3ucRme2EcZIFxCoZ0QZcgppRJ9iE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDEzMCBTYWx0ZWRfXz/CbaGXIWQhk
 OG2XTvFLs754UFTNipTz/ag227UWFO0xGYzYM0ocdrujrmh71yCf5tLSsSo/MqM4PUa1lSlYW4z
 L/ddyvT6rs40FdpIgqOqU4gucEO3/kCoTMNHHdvyocR+yFC0P5IFYnIdxmiGsVr5CVvPOmeroXN
 AYaMxiJ9jy8yevAKP0/j1wbTOqHLtXbL6GEzdtpSsgffClskRAmr8lDV7dmUFYW7QW0UghgZo78
 FV6T+gSx/nS81vmuqv/EG+jArl9X3Hzd5I/lhxd/FkCMXbGW0M6v2Lmwo8dRAwSES7CvvTSBtvh
 K9dCYnHabhdK9rCNax58H1VUY2PpVwYrl/dKY++xT9otNFEoQQi8AvwQATpdasLWn+67LUoS38j
 pMgefLHgr3hW1DddjWDRtL4WpdIGO6qmRa5iLqxSU/3io1rI5YXXrJbDbEjL2lNhIpANwvoC
X-Proofpoint-GUID: exvC3ucRme2EcZIFxCoZ0QZcgppRJ9iE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_04,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=805
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300130



On 30-Jun-25 15:46, Rob Clark wrote:
> On Mon, Jun 30, 2025 at 3:34 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 29-Jun-25 15:58, Rob Clark wrote:
>>> These runners are no more.  So remove the jobs.
>>>
>>> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
>>> ---
>>
>> Do we have anyone using cheza at all anymore then?
> 
> Probably not

Adding +Doug +Akhil +Jessica, if we don't have any users, we may
get rid of it upstream, as it never made it to the outside-outside
world..

Konrad

