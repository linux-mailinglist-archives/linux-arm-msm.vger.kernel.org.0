Return-Path: <linux-arm-msm+bounces-98708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKXgDDnQu2k4owIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 11:30:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EB32C97CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 11:30:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01E0E301FD7E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA5CE374197;
	Thu, 19 Mar 2026 10:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k0zXsckJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hF7fQUx/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F6634D383
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 10:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773916120; cv=none; b=d/dtGfuSC15UySCDFAnrxcUjhARxbK68XhFlxRUgSPsvCM9/bURHuXCPhElQr/BZwjute7Q2Yuvn9SC0QUqnJjVuOAgCfB9gLnAv+oLOSxFqCSEotVn8lu5fVo7FkccvXOzXPTKSp1nP8Qg3Kweh4YcxmEft92PiNfKvhhGQkL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773916120; c=relaxed/simple;
	bh=RW0su65Wt79SZqs3yg3hV0A+0UpOj7mP5bnUmras9hQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=gMu+5PeZ6bA+dI0rcf9o8oq5bC71akoyU4RzimdXqhu5T9H8S+NUpI6/naL1VMVRWW/DvlYlILP6S5GQc7akPgWAPmgrOXAR3kOt5Sr9eN2NITfP4/PPp6ifURmxPnMuDKAxLZ9p1DLlw+Nz9UydR6pj9wB3wBd8BtYjGCEQba4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k0zXsckJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hF7fQUx/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J73uuQ1770610
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 10:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wdLyDXI27K7D8gFcDd/WiAUwtco8d/k78JRULpZmNxo=; b=k0zXsckJWZ5odq07
	X5Qzyf2cQT8gE2Dp4sqUwEwChjJozO/Ybvp9LflQgYkpyCVAtebwF2MPAG+pQEic
	iRAm9BohHAQBL1hLh4BSUpBrvK82Rq0Zc/VlORshGoK7L5NMLqGJ2T36xWy6Npka
	Ftd1Z6kep6bpTdCq9a77l5QER2wuV2RXomfzXffDDafU7/6UiMVNuO++VNLTzsNh
	YM8CZZsM/HAORDkNz7vLMANE7Q0Vl9ZboJ08fWNhuz/qwwFg/xDYroNT6SfTiaZD
	7p2m1FgxjOF5QUmFy9XWF2d8bjrYtN5NS36D0ype7XJF9PJyyPcVAA1jRR+0C8TI
	lj4L2g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyy75u3qm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 10:28:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b33a19837so385341cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 03:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773916118; x=1774520918; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wdLyDXI27K7D8gFcDd/WiAUwtco8d/k78JRULpZmNxo=;
        b=hF7fQUx/7R6SjEbGZtx68uVsPOip7RelMjHerrwaYmvEFAiuMxWmV15pZMVhAhDEah
         Z37uVh31ONR9WX5poli6eByhkEkUj2BLebz3eWNxRd7kIhkB3NuNzOmpj0YIN5OWtSl0
         pIVG5mhpX6J8A5IxVDeo8nkUaWjmqm9UqpEJeMMD4Ldlw8EcnAohyEoCU07AgC+/XF0r
         6nDSvoKaJ7DADvZRnPHo3s8LZmA7Yxnlj4VprdFzMf8JYXQWHl3lxInr2F5RFu5aT8C0
         A5ypHqh12nza2weTyxtHkv2txqMdw8796j+oJSoioBWfV5T7Aly1KEiYvWXBNXzfTvwr
         Hd+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773916118; x=1774520918;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wdLyDXI27K7D8gFcDd/WiAUwtco8d/k78JRULpZmNxo=;
        b=pHcJwtj+cNALx8q7NBqitwUOR2Dfv/YaKLrQHL/YN1+4Tpnb4+qyqurwoUPc+AgqM8
         W+kYlBw/RVJYzqOcHozwu9XBpM788YQJ854X/MDQWs7b4bvvQDfJJ/pJeEGpvvLMPNye
         39+ED+9R4HCAPWTYT0SjyRa1QlpxPI6DgkKAljBD34GfHUz518PsrcJdTv7CmZeg2xIy
         JMEQzBzOPpezyI3uCa2wGiAO1TDPgl3g0icoQKfsogLD3cWm6Z8eL36qWlqc9ZSjCQy8
         YNa1sLsp002FLQ/qwhhVQ1HZdTasClMgczzs+gMgirIsBubZwbTksEiMauaW0dwq+0T8
         i7gw==
X-Forwarded-Encrypted: i=1; AJvYcCXrEvOwuF1Kls3fa01+4qEqd+LNa3tOBIOuE/HCLKJYql8Z89AfbBN7g8juRw2QN5p1NxtXAROUq7kQVQCV@vger.kernel.org
X-Gm-Message-State: AOJu0YwYs1QQgxbgetonDH0bBSxrHb7kNYiS+9gg01aRdzRt27Cy8ByJ
	xVBvVYtXJxkEdSr6SBSqlFj7a92TdUVVra6N2nv3U/V39T4EfCkb7aOTQdGUKRK8Iux7slNV78R
	ViZ0NQThLGgv9MOLe4IJwzXJzXFPTH6WcIRVlRp9OrjBq3+EUfb02CKtr0gAHol/uW9fs
X-Gm-Gg: ATEYQzwD7SxWDoPFo7tb+NDhRaSwafTVeP+2hBPMubEP59lj/EvFDNb0+tepffJpzBp
	IZicp/bAAvc66n0tCAgGxJOjwEm492sUFqPR+tiL3RBElzBoUEvdwyjOpGUWLCkD0aNMucsHrSS
	zhE/BSoczNsiQJcmLvrSWpdKIkoqB85DwCTK+ZMjqL21969/FVi8UITM4UTa1bTemXrq4iX+u7C
	IuB7khPqMQH40EXnYvL1X6/Jxigjn0KENZcrfaL6JkaXpuLm3x9soGga6sDrxRhuMkzIIE4jOim
	/JQGWq7+WPDeyb2AjMYfq81aKHKJf/1De1jGC8OqsqYmZ6yn24ibmwdMV8IYZzB+tBh57g1mauR
	nG5+ehd+g0B7sVzTb+gCnxw3ByJcoa6MBScDbcVZnOHeBMoVxf+yy/M0Zd1HRDFb4bzOHs071uL
	uZAsY=
X-Received: by 2002:a05:622a:610:b0:509:47e2:9dfd with SMTP id d75a77b69052e-50b14949a02mr66570091cf.9.1773916117548;
        Thu, 19 Mar 2026 03:28:37 -0700 (PDT)
X-Received: by 2002:a05:622a:610:b0:509:47e2:9dfd with SMTP id d75a77b69052e-50b14949a02mr66569791cf.9.1773916117066;
        Thu, 19 Mar 2026 03:28:37 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667b0eb9affsm3448046a12.18.2026.03.19.03.28.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 03:28:36 -0700 (PDT)
Message-ID: <393a9fed-4d21-482d-a211-8808e2f79eea@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 11:28:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/msm/dsi: support DSC configurations with
 slice_per_pkt > 1
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Jonathan Marek <jonathan@marek.ca>
References: <20260318-dsi-dsc-slice-per-pkt-v2-0-0a1b316f8250@pm.me>
 <20260318-dsi-dsc-slice-per-pkt-v2-2-0a1b316f8250@pm.me>
 <b56abd7c-1fc0-4627-aae5-06ec8c47ff15@gmail.com>
Content-Language: en-US
In-Reply-To: <b56abd7c-1fc0-4627-aae5-06ec8c47ff15@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA4MyBTYWx0ZWRfXw+93OzQqlpNq
 Egq+op0BExCwfHdrz+Tgp8ZniZdRnTVtDH6nJm3fHQSoHCs56ug/NqoWPO4DQN3Fim9iBZZjR9L
 lBQ5s9sMa9PqmghSGngRASeqOQupGz8ttO2ChPYzYiKs+5vcmFnAaT8H+rLVTQh8uHeybDomh6G
 bFV6SUcmLn/IONqlmUJTWkTCYbJU+Tpi3d35jGDdzD/r1S0xdWumNY59ctt7aGgM11Jh/ofYMCP
 V4bqDYbARXuaC+O6phKBU+Uv0UthSB2sjkCA5mGZH08OJLMH7YlG4noF5ZkKICj7BUJBA49m3/5
 +gQQBYpMQFYrgGt1kqT8TRUbFSoyVamZLxD0D9/TRhIfhjRcAlEXPBGyxmNF81FZtCJ8QCgJ7HM
 4Pz/aTvAI5/d8NYPg9KSr/GUt97gJ+eqvo6UaBYUPcPg4YNIP5MHmR3GY+sUFqM6YqsqpHCwufI
 kxQ6lXvxyssjGCimzAw==
X-Proofpoint-ORIG-GUID: KG1U4wU-KgAkCqdh1aQwur-aU6iXcLwp
X-Authority-Analysis: v=2.4 cv=A7hh/qWG c=1 sm=1 tr=0 ts=69bbcfd6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=RAbU-raeAAAA:8 a=EUspDBNiAAAA:8 a=YgiteBLtTPqnhqBJ560A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=JiizpSU_mAIq9zsZDqn2:22
X-Proofpoint-GUID: KG1U4wU-KgAkCqdh1aQwur-aU6iXcLwp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190083
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98708-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[pm.me,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,qualcomm.com:dkim,qualcomm.com:email,marek.ca:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 81EB32C97CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/26 11:26 AM, Konrad Dybcio wrote:
> On 3/18/26 10:54 AM, Alexander Koskovich wrote:
>> From: Jonathan Marek <jonathan@marek.ca>
>>
>> Some panels support multiple slice to be sent in a single DSC packet and
>> this feature is a must for specific panels, such as the JDI LPM026M648C.
>>
>> Use the MIPI_DSI_MODE_DSC_ALL_SLICES_IN_PKT flag to derive slice_per_pkt
>> from slice_count, note that most panels are expected to just work with
>> just one slice per packet.
>>
>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
>> ---
> 
> Matches various formulas in the docs
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Sorry for a sloppy trailer, let me try again with the right From:..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

