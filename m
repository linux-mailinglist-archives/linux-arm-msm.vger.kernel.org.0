Return-Path: <linux-arm-msm+bounces-101579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMVWIs/BzmmqpwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 21:21:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DB80F38DA03
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 21:21:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD552301FFB8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 19:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 583E2346AC1;
	Thu,  2 Apr 2026 19:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gR1f5AZ5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N7GJHAt8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25E718D658
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 19:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775157701; cv=none; b=IUlyVbL9eXMDxvihnlzSuDICYPnNIqHRVpmPmFJZSEriMq2SXymtzATTq45b4fDgQOBc28lBq0sxxLOBWfTgBoSUsmogYqI77oruMwSf0SIT+qnJtVHt4h9OvuFAwEfpR7CvkvbSunYVKUJ+Mga2Qsirpwf76N01n2l6Bqr9q0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775157701; c=relaxed/simple;
	bh=Myaxr/8YNjhTt26sYxxtoHnV7ksJt8aKetDfXl53frE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j1b6dRNHpdrkIVkKIQPhdW48c6fl/akH/Fn4ZGt7wSjdtDC9PeH+bkH6NJdDtCfJq6g9WqR0KUqu5cYXASUy6u3AixYcem1OYaNA2U3BsDdyVFkzjfZ4sqFJOO9BWKuM4R6eBv0PqGM61elZ5mPsQhrMSqMi/aq9WuhM4mTIBpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gR1f5AZ5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N7GJHAt8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632G4YH41562130
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 19:21:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u4uv9+aAl7unVJkJ1C/xnc0r7hVWypSnjbM22WxXyIU=; b=gR1f5AZ5mD+m5hsK
	Z9tBtlAYYY0bGmA1QcAMKLudO9ZRI2ENL6QIHuoH3QEfKVKtJ05AAXVSwp7lYZvt
	N2gGI+NH+bS88F20nfp3EhdJf4BeF7XcO8MtDURRsJvvZx1sNjbfm/ZnXCiLP9yq
	NQMAy+N81EUB1Hb/Xmmk8zz3CMpbWAGbe8qp+yydC9YebQ14g0cEEUtOOWvevoaJ
	JcMW+GBulkfPjHp40s+ngbun8BnTzGK0PbzlEW2zWzQ8jhvvM6iJhQnizhUTToSM
	6LEkI34IHTMK1mmpyEpDXhHLVYFw6arHhU0SIsBmZ5+HD2Z9ydAqIUIt97MlPUZK
	DAD9Cw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9um70r0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 19:21:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24af7ca99so13306205ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 12:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775157698; x=1775762498; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u4uv9+aAl7unVJkJ1C/xnc0r7hVWypSnjbM22WxXyIU=;
        b=N7GJHAt8xdh6Jxxc1AsTjGXupb9q5px3s4C+KKUgrhphokNg4sVljgQFHB2m4MbxWj
         WKVOVvV7L0tTaJHKhDSIEKdw7UfHcp31tCHQPzfReXi/ZU0GEMNQEbV0RoAJEARTjHMM
         MeQt63K5jK26EYS8ZL0UrPjUETT7nkkYotT27SfHPdMJBUnGCLE84taQ28QxErCLBSkX
         UakVtnHrO1a+Zv233YjRhfwDeX4PSGo/3LGEp4byxoQhMOVKYCGVNBWv2k+PpXK0AzUa
         M6iHbyKVB+vL5KQzgixt54UfOPhpPtA3j3ZiZR+KOMqmW73Vn8zlcU4poJlY9qhjOfR2
         eowQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775157698; x=1775762498;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u4uv9+aAl7unVJkJ1C/xnc0r7hVWypSnjbM22WxXyIU=;
        b=l9n2m04rQuDZnOlvou6z3iXlI6zsGIXgohjMgofVY7UVaE881EjsFg8KrLQIAjMfxX
         5taQv+RQWNL7TkCRUw6pgfwQfAzeMpw3ii5yIu74yG2257vXFwGevfvkMw68RtfsRl7s
         4k8bKhWO+9Abs+1MjusacJCCEFq8J+ukYDW59oj7cMNLsAhElO+03Rjnz85TKCw95hJq
         TJbvXQAAF3vysfUfqzoJuldy+O7vCg8k8qtfydoC3Uh+RjjsYSLNapjGXG7CICHqv8w+
         fUfVnvQZy2lj1vxgexGwIZ4s+/4Ks9lVE2hEDzcjFUmsXFoMAdkknR1y0Ut98i0po6hD
         RZvg==
X-Forwarded-Encrypted: i=1; AJvYcCXyrTzAnI7B4sTvTH2r9P895DY2AL97mdinu7ZZvLxbK7Rp6bFgFMcHl1fyCb6Edu+BQzQ9SDzBx8Wkkyli@vger.kernel.org
X-Gm-Message-State: AOJu0YxerLpjdBCCcae/MR850kG5IRMaWn3qCEIWA0mqfZ8GY7aDnJpd
	RDoLsgwYoZYavvbLLuThfuWZw9NuFcODBsv48dj2DB2h3y2EO4Z5p4boABCgG46XYn5L7eIUzMn
	I42mq6euRn6OKnipjGWw9s84fHyIc9MYjnwRCV/xbsndp+P7dmVsTTkvzvKBewhECVZ+T
X-Gm-Gg: AeBDieuTJ/ve7XeLEfuAe5IcVgNZcxOj13KklvpNtGq2QOOSm09+PJkLWN3dgpvoss9
	nJGU+aDLBOWNh3DBticSktQWOk4G0XagNhJ4jyigIqpYaeMrhF3EzUmGApwQoSHsR6n7Pj0TDKZ
	LEt7n26vomwBm1WkzQcdNNtS2G+uvcTnSG44kBw3Ubo5nKmM/jJ4TmU50Et0l1oQ2Dn9UwAx9ST
	7Z0OAFGu53xNIGGAxSfVJtYTLCpg6iRhN6qwN77ztuxcrzL9/p6423j7qUVXrF5tTsTUQJKmhYF
	oIfOyrIGShNa4tSIV7jSILylcsunCPD4zm6y86bs2Ffa94cADp41J0ahJfDnQfAXzt/3MOCQu1q
	mf1UKXHGDYjWcO4RdJjIH9XjjAOLvtxuutRmU2VFS7M5U9qIdMluWFrw=
X-Received: by 2002:a17:903:90b:b0:2b2:4dd2:dcf5 with SMTP id d9443c01a7336-2b2816d2309mr5212475ad.20.1775157698309;
        Thu, 02 Apr 2026 12:21:38 -0700 (PDT)
X-Received: by 2002:a17:903:90b:b0:2b2:4dd2:dcf5 with SMTP id d9443c01a7336-2b2816d2309mr5212235ad.20.1775157697837;
        Thu, 02 Apr 2026 12:21:37 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.251.12])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749b66aasm37588155ad.68.2026.04.02.12.21.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 12:21:37 -0700 (PDT)
Message-ID: <c7094fbc-deb7-4d76-ad97-9c56b81c7a71@oss.qualcomm.com>
Date: Fri, 3 Apr 2026 00:51:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] media: iris: enable SM8350 and SC8280XP support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260312-iris-sc8280xp-v4-0-a047ef1e3c7d@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260312-iris-sc8280xp-v4-0-a047ef1e3c7d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=U/WfzOru c=1 sm=1 tr=0 ts=69cec1c3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=HjhN+elnpTkf3xRQdsZrsA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZB1EYcSSG1ZMcJLfxLIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=mUDYQMy1hxdww3aAYIDK:22
X-Proofpoint-GUID: BLtOJ6-89MvtAq3osi9nDAanWNW3zI7-
X-Proofpoint-ORIG-GUID: BLtOJ6-89MvtAq3osi9nDAanWNW3zI7-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDE3MyBTYWx0ZWRfX2z4RwHNVKE7C
 QVGTIKIiPz0Rsn1HBOja+Vz9aPMVED2HO9F4x3g3hcUf8sq01KPFwAUkTRCFvFUSlYgOpfSVHx5
 u+SkDhzTs4LToC53mP2d8w5PVwiX0cAhT7Yl4Es8tMx76+PaXGcjruSqdE8p6n+Ujf2lepoHAdY
 NEpnGqgqSj0l0A1MgJA5biSQ9Qqnt1AF9f2M6Xs3l14xdFSYzffiPVtvmYfAiXITV875iO4xkwV
 fZNMYngor7Z95LLo/H3CJGgEfdgjaIsWMy9wqdajWC18LRpC09uKNNiBbe7VDEQ4bYc+0uJK6mD
 ppd0CQ7LxODKZX8buKhmRtq642e9PVBybnLcbAlZAS52xnIN6vEtujhZZ4OG8zDcP818mGTphaj
 qKyds1kMdjSCYzCLiVpjZxvn2lRdH1DtQ4C/NGIAM5h0gRQn2plh3yD9PfvuMfSymEndBlktBn+
 aktXPVRD+0lBgCbLFfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_03,2026-04-02_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020173
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101579-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DB80F38DA03
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/12/2026 8:44 PM, Dmitry Baryshkov wrote:
> In order to enable wider testing of the Iris driver on the HFI Gen1
> platforms enable support for Qualcomm SM8350 and SC8280XP platforms.
> 
> Note, this has been tested only with the Iris driver. Venus driver fails
> to boot the Iris core on SM8350 pointing out the UC_REGION error.
> 
> Note, the firmware for SM8250 isn't compatible with SM8350 (nor with
> SC8280XP). Please use corresponding firmware, extracted from the Windows
> / Android data.
> 
> On SM8350 with the Iris driver:
> 
> $ v4l2-compliance
> v4l2-compliance 1.30.1, 64 bits, 64-bit time_t
> 
> Compliance test for iris_driver device /dev/video0:
> 
> Driver Info:
>          Driver name      : iris_driver
>          Card type        : Iris Decoder
>          Bus info         : platform:aa00000.video-codec
>          Driver version   : 7.0.0
>          Capabilities     : 0x84204000
>                  Video Memory-to-Memory Multiplanar
>                  Streaming
>                  Extended Pix Format
>                  Device Capabilities
>          Device Caps      : 0x04204000
>                  Video Memory-to-Memory Multiplanar
>                  Streaming
>                  Extended Pix Format
>          Detected Stateful Decoder
> 
> Required ioctls:
>          test VIDIOC_QUERYCAP: OK
>          test invalid ioctls: OK
> 
> Allow for multiple opens:
>          test second /dev/video0 open: OK
>          test VIDIOC_QUERYCAP: OK
>          test VIDIOC_G/S_PRIORITY: OK
>          test for unlimited opens: OK
> 
> Debug ioctls:
>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>          test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>          Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>          Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>          test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>          test VIDIOC_QUERYCTRL: OK
>          test VIDIOC_G/S_CTRL: OK
>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>          Standard Controls: 2 Private Controls: 0
> 
> Format ioctls:
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>          test VIDIOC_G/S_PARM: OK (Not Supported)
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK
>          test VIDIOC_TRY_FMT: OK
>          test VIDIOC_S_FMT: OK
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK
>          test Composing: OK
>          test Scaling: OK (Not Supported)
> 
> Codec ioctls:
>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK
> 
> Buffer ioctls:
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>          test CREATE_BUFS maximum buffers: OK
>          test VIDIOC_REMOVE_BUFS: OK
>          test VIDIOC_EXPBUF: OK
>          test Requests: OK (Not Supported)
>          test blocking wait: OK
> 
> Total for iris_driver device /dev/video0: 48, Succeeded: 48, Failed: 0, Warnings: 0
> 
> |TOTALS|FFmpeg-H.265-v4l2m2m|GStreamer-H.265-V4L2-Gst1.0|FFmpeg-H.264-v4l2m2m|GStreamer-H.264-V4L2-Gst1.0|FFmpeg-VP9-v4l2m2m|GStreamer-VP9-V4L2-Gst1.0|
> |-|-|-|-|-|-|-|
> |TOTAL|169/316|128/316|154/447|126/447|159/311|229/311|
> |TOTAL TIME|242.251s|267.903s|293.458s|261.934s|203.009s|366.936s|
> |-|-|-|-|-|-|-|
> |Profile|FFmpeg-H.265-v4l2m2m|GStreamer-H.265-V4L2-Gst1.0|FFmpeg-H.264-v4l2m2m|GStreamer-H.264-V4L2-Gst1.0|FFmpeg-VP9-v4l2m2m|GStreamer-VP9-V4L2-Gst1.0|

could you list the failing cases and compare the result with sm8250 ?

Regards,
Vikash

> |BASELINE|0/0|0/0|3/7|4/7|0/0|0/0|
> |CAVLC_4_4_4|0/0|0/0|0/3|0/3|0/0|0/0|
> |CAVLC_4_4_4_INTRA|0/0|0/0|0/4|0/4|0/0|0/0|
> |CONSTRAINED_BASELINE|0/0|0/0|32/33|33/33|0/0|0/0|
> |EXTENDED|0/0|0/0|1/6|1/6|0/0|0/0|
> |HIGH|0/0|0/0|22/45|22/45|0/0|0/0|
> |HIGH_10|0/0|0/0|0/2|0/2|0/0|0/0|
> |HIGH_10_INTRA|0/0|0/0|0/7|0/7|0/0|0/0|
> |HIGH_4_2_2|0/0|0/0|0/21|0/21|0/0|0/0|
> |HIGH_4_2_2_INTRA|0/0|0/0|0/7|0/7|0/0|0/0|
> |HIGH_4_4_4_INTRA|0/0|0/0|0/6|0/6|0/0|0/0|
> |HIGH_4_4_4_PREDICTIVE|0/0|0/0|0/11|0/11|0/0|0/0|
> |MAIN|127/135|126/135|41/90|41/90|0/0|0/0|
> |MAIN_10|0/11|0/11|0/0|0/0|0/0|0/0|
> |MAIN_STILL_PICTURE|1/1|1/1|0/0|0/0|0/0|0/0|
> |-|-|-|-|-|-|-|
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Changes in v4:
> - Changed compat strings to use -iris instead of -venus (Konrad,
>    Dikshita)
> - Dropped separate schema file, switched to SM8250 schema
> - Dropped driver bits, it's covered by compatible string now
> - Link to v3: https://lore.kernel.org/r/20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com
> 
> Changes in v3:
> - Add missing header, sorry.
> - Link to v2: https://lore.kernel.org/r/20260125-iris-sc8280xp-v2-0-552cdc3ea691@oss.qualcomm.com
> 
> Changes in v2:
> - Added missing chunk, including sm8350-videocc.h, lost in rebases.
> - Link to v1: https://lore.kernel.org/r/20260125-iris-sc8280xp-v1-0-2c5e69fae76b@oss.qualcomm.com
> 
> ---
> Dmitry Baryshkov (4):
>        media: dt-bindings: Document SC8280XP/SM8350 Iris
>        arm64: dts: qcom: sc8280xp: sort reserved memory regions
>        arm64: dts: qcom: sm8350: add Iris device
>        arm64: dts: qcom: sm8350-hdk: enable Iris core
> 
> Konrad Dybcio (2):
>        arm64: dts: qcom: sc8280xp: Add Iris core
>        arm64: dts: qcom: sc8280xp-x13s: Enable Iris
> 
>   .../bindings/media/qcom,sm8250-venus.yaml          |  10 +-
>   .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |   6 ++
>   arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 103 ++++++++++++++++++++-
>   arch/arm64/boot/dts/qcom/sm8350-hdk.dts            |   6 ++
>   arch/arm64/boot/dts/qcom/sm8350.dtsi               |  81 ++++++++++++++++
>   5 files changed, 202 insertions(+), 4 deletions(-)
> ---
> base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
> change-id: 20260120-iris-sc8280xp-85d13bc60536
> prerequisite-change-id: 20260131-iris-venus-fix-sm8250-f938e29e7497:v5
> prerequisite-patch-id: 6d85e3db422bc7f16246249288a17b92f6edbc09
> prerequisite-patch-id: 579d712ec3f942ba0c362e242c71361c151092b5
> prerequisite-patch-id: fa4629a3909fbae3917d8c067cce4f673ee857c0
> prerequisite-patch-id: cbbd40736f7a797ff76b0fe2b1ddfb559e14e666
> prerequisite-patch-id: 5b50917dcfef01db13af320cbd1cba15fd5fa16f
> prerequisite-patch-id: 8948139735836adb9fbc51d93b969911dc5b38e8
> prerequisite-patch-id: 7ec91bd0149f347c479c906e73cabaa28601ab3d
> prerequisite-patch-id: c711522b63f640b7504767b3af7adc05a0b36cac
> prerequisite-patch-id: 42b9cd5e0fd6fd99eae267c78b239333adff7637
> prerequisite-patch-id: 11c487545e2462ff0a515d689863c3f7f25f9449
> prerequisite-change-id: 20251119-venus-iris-flip-switch-d59a3fbc6a4b:v4
> prerequisite-patch-id: 615a763749fdc0c4ee184478bc64120972d8c7a1
> prerequisite-patch-id: 6d85e3db422bc7f16246249288a17b92f6edbc09
> prerequisite-patch-id: 579d712ec3f942ba0c362e242c71361c151092b5
> prerequisite-patch-id: fa4629a3909fbae3917d8c067cce4f673ee857c0
> prerequisite-patch-id: cbbd40736f7a797ff76b0fe2b1ddfb559e14e666
> prerequisite-patch-id: 5b50917dcfef01db13af320cbd1cba15fd5fa16f
> 
> Best regards,


