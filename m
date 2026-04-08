Return-Path: <linux-arm-msm+bounces-102328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFziCjZX1mn5DwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 15:25:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF87B3BCCE6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 15:25:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1A9FB30087CB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 13:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CF3038D00B;
	Wed,  8 Apr 2026 13:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c+KzvTfh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iffV7E25"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DC230FC23
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 13:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775654708; cv=none; b=E5wKwXjvVwW6zNC9gC2ltNwGdv9GdEC45SVblxekEK0xZldre73MT0LI3xxoFbqtxrr7HyLqp2Pmf+LkrVfxioMkhEQpNpJJryxSft8DjbckvfJZ1b5BQqIWNv3EbjMOCkS5ZU7oQ9iwTT7/wl8N4wDYSxCJoDn2OG8i1/3dYmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775654708; c=relaxed/simple;
	bh=anUdhZsu/oWXPDt2FK230/Qz6pxZIc77bUnmthLzFMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SmTwjCJFzdcqV7lyjgWq8La+hJElPPL/A0iQG5jJEEC1tx0fHZYCTGFijkYwxXsrOwY/MqZXskJbwGlZ+DpcEg9bcd2bTYZ3lTGvOZPX6MiloYpDGj/n1CymWZ0QSURaj2BaGxJclfGrv1YSkSR8JPImY6ad6g1OFMj2hJxk5xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c+KzvTfh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iffV7E25; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638B4inY072130
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 13:25:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	inIahzzi5Obr1DFc58em4nmclXOv9qDL7pCV6j6QphU=; b=c+KzvTfh1rOSkiRU
	rQ5oJkWkRlDb5Qnv31H7Laa+XpgExUU17kk7a6us4LuaORg3scobrAhZ5z4ZaXIT
	qAWnV7YHY9lE9R/BKnnzaImP7JIX96yBmzRfUIGXq5MEI1VYCKXzxlC4I2JpdeiR
	OJLLC6xmIXnMuOYLz/EuqKL9kYt+tyF7A3zdPd/nyi4jp3JS1tZ4FSB5/vHk78Og
	6gGMG4/RlawgFsvCANEYmBbV0M2BQ4kVpCC5uAZ7K1/yxg+1UWUG78oVP4meim/U
	VcJVu6Lm6LcXV6K2VfeE1BvmRBIfUroJaPbu4KtvOD+caVPdHOvlt6AbE5ySs5Q+
	BHyejg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd7sxbebb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 13:25:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b9074bd42so19507311cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 06:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775654702; x=1776259502; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=inIahzzi5Obr1DFc58em4nmclXOv9qDL7pCV6j6QphU=;
        b=iffV7E25+CmCL5wxLpodQG3p3Je7ZAI1EM+aF6bDKb6S31H56M6aajYtZHTQPRhRYM
         fiOMb0eJXp+D+0ZA5LIhPG+bvEaz+FMzVB4Qgc22hRB+ndePeYQNdp5Z5ieLYqRd2ldW
         tGx7f44B/txYKADoFTaAKq9IrkxWk202svNJfpREXGbUo4W623vlqUBgKbP8aCnSyqCj
         LiUphuG3BrZL2wbNPTMgiMgyQWawNnVKdQDp65zz8tFU5Uh6eD890ab8RZUJ2cq+6t4Q
         C7nvMLOsrxD0PMiWxg2PAFvkzEIWX3urB4b4J2C3nm9AwmHFu4phlKT3cCWRUU6qlNcC
         JC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775654702; x=1776259502;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=inIahzzi5Obr1DFc58em4nmclXOv9qDL7pCV6j6QphU=;
        b=GtS33HmfG1/W9uAkNLK9s0EDQoBmuyx8g9GryJESvIiXt2odIyf3S3Fs5oge5sSood
         bjgQZnSQkCiEAtYJ4HjKoY0f4ksrC5xqvle8+KmRtP4ZqtDNAZj+wS2Vj//WlAbEtRXQ
         +Ma6+aoy98y+ITYDPvxFvoW5hCkpduRcoHQb5FS6rZT8KQija9QWaY3w5EPxUr4AIN/f
         qtwhNPesI2G8CeH7TtQ/vZxBJe0eTLDFayf9Rk7Dyot3hIsn48ej6KuhpgvUDIZfoNeV
         u53/NAn5IPruyBKp4LhZFJfQqKe9u5rb4b1Ve7lUEnaoHlL0ne8yj9FYYKrjkeuwFSrL
         94TA==
X-Forwarded-Encrypted: i=1; AJvYcCXkQLXaAeAj9FDG/NGBIT6+lPe7wVSaR3h7+FqHpftOMw/olMku72jrt2twVSd8Jw1PsWICcBdiApP4MG6V@vger.kernel.org
X-Gm-Message-State: AOJu0YwLXB3h83y6gFBE7syGcQPYgTvT0hNV/05GtMWKFctIHeIdetN3
	7/ljx7OyIvEkK2CKmxFvL2MubLCJoWI+ziTCvzNUj+W5m/pFl+3VTNA/Rw3tndMyW2y3BN7XUN8
	iINQLDrB0gPCbl4tQAGMW6vygIjujWx8QFhqyfaJNMK0OcQx1bSMs4U8g/3rfFUHWg8Xo
X-Gm-Gg: AeBDieuW3sW0kon54sRj+Z7QPM9GFOAr8FtShd/gDADznwbz/J1k8b3gCUbNHeRr8ur
	aaL6/4tkx4mPU/Fr4WeuHh9RT52dfhnrkPrEim3ZvkcN6Q4kIAuxPue9FznB9T5cOP+7IPdw/CM
	M7WijPael9URU2ZudoytX5Irzysg+r6zj9ugmf7OF3HfmZw1nv8FBirzCOHCVs+S7NuuUMKRkbc
	Deinj6lPmhrZ0hT9n5e781bOd41jX61TiFy1vdNe5ta+zncOijNTiBAuEAXa2e4fpysf/ku8KaK
	olo/t7t5NSZdkvA19Gcnwp8CANDI8HD60q6Dm8WsqvBkHDMhRxoeNzXShPcNkRoHovT3hTNRicg
	Cnkze+1PTq+8VIT0Ltk+2/a8QRz9mjgkZPYCjP0LC75iZDs1CFzN3R2aRx335Di5N4HOUYRNUrD
	KyBMY=
X-Received: by 2002:ac8:5807:0:b0:50d:aa1f:68be with SMTP id d75a77b69052e-50daa1f6bedmr58643171cf.4.1775654701622;
        Wed, 08 Apr 2026 06:25:01 -0700 (PDT)
X-Received: by 2002:ac8:5807:0:b0:50d:aa1f:68be with SMTP id d75a77b69052e-50daa1f6bedmr58642721cf.4.1775654701010;
        Wed, 08 Apr 2026 06:25:01 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cff131csm650359266b.52.2026.04.08.06.24.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 06:25:00 -0700 (PDT)
Message-ID: <fe166753-a491-4b1c-9b46-c1c8c3441cb7@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 15:24:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: use IRQF_NO_AUTOEN when requesting the IRQ
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260408-iris-no-autoen-v1-1-378d290a019e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260408-iris-no-autoen-v1-1-378d290a019e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=etfvCIpX c=1 sm=1 tr=0 ts=69d6572e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=UcOOtBqsNXsv2hi3nloA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: ADxqGVxaT_ElAnjK8CGukvamWFfnl_Of
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDEyMyBTYWx0ZWRfXzo2sQjx9Usuu
 nmSHZzRXnJOcBXfGoA6kvaNOODU9x3XkTAoT2xIxIKWvZJ0HI45fDKWSbA7WUqer8ydAL96oFhn
 yn+BKjszqDBvHfYgqhtvKnKWlZ4e844iovpkiyDiilBz77xCEvEpYDdUaY5Vsj20i+vLaUM1J9i
 7KtPfbtcQoJndfhwLaYmB4O+uaof2u9dHnk273vPWCLF2LTzeYpZO6tsESuA/dM8URgGSzRbS/L
 85whv2CfCGQPqKSNwnRMspQ91bWSgfGbMJKIkpWNES5LBNn6jb4XlNTFGmC4eZAl9h8aLvAenYQ
 qMrDk+IeLFzkdp9CKKQIgXr760upcqcx4RZiLqo2K57bSEBB164iqCt3FUD+V3Sq5vhoX9/sOHW
 yRstO6Vg1BA/AWvu58zJY6EzQTYzZ7ifL7Am5vHlJ2H3zBgnTCbIdOn0/8+Cpe1XmHfm+1/K5Re
 mQ+vfZHzcuo26Y1gNbA==
X-Proofpoint-GUID: ADxqGVxaT_ElAnjK8CGukvamWFfnl_Of
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_04,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080123
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102328-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BF87B3BCCE6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/8/26 3:13 PM, Dmitry Baryshkov wrote:
> Requesting the IRQ and then immediately disabling it is fragile as it
> leaves a window when the IRQ is still enabled although the underlying
> device might be not completely setup for IRQ handling. Pass
> IRQF_NO_AUTOEN instead of calling disable_irq_nosync().
> 
> Fixes: fb583a214337 ("media: iris: introduce host firmware interface with necessary hooks")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

I assume this was found the hard way..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

