Return-Path: <linux-arm-msm+bounces-90224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAFmKuY8cmnpfAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 16:06:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1216858B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 16:06:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F14F23029BA0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 15:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DBFE2DEA75;
	Thu, 22 Jan 2026 15:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AhBg9wLP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D9EOXGnl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A518D30E846
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 15:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769094040; cv=none; b=pMyJTbrrF+4xgLHH4kHWkTMj6h1XCXw2HHOkuKxzR0BGS+gpSalCoHEJomXfPg2aVEg3hY/BO0oX+i744QRowUoWlCHNKCSwt73hUhXCrL6jQIN0ruACPL5qxf2Ei/oRuxGrHX2rWCJDPSLl63DgDatyD/FjkoPiqzsWW1Vuqaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769094040; c=relaxed/simple;
	bh=arFkTbb6YsZArEoB2cYytpfo+Gi9yOGL09TKBsMn3+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nzrJnX5TfW4FX2oK09kVjCp+yV7iV1tvggdAyI5H2fta9JRe5AHMZdzMSM/NESW8t4g8qAXSxBmubiTa4QimMbx6C9ggsjvWFHNSswGKseRqIazFDqsqeIXPn+rWIe/mD+wyf+yyV9PWg/m46e4AYn72HMK8uphlKiQP6v+xyeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AhBg9wLP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D9EOXGnl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M853hQ2276386
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 15:00:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jbMKhDfn3dd1xV5Jq9MD5SYWZD1vNh0Bo5b3+HgjZPU=; b=AhBg9wLPtGHVP2Po
	/knE2BMxVU8nWS+m+uMQwfv/FjG4l8xZxK3za36xYVHD6UAXOEtm2LmdYqJ5rlom
	uZzH7ScoCxERZHm7haLMegfAMH5dKfhcWYEMTAo6IGjKpYkcCUt6kRBQM97LM5zd
	hxV1f47mFMRINtxfbun+7QQ9OlFpkxkmt0AB8MFBj+TQ6+HopJ2cKb+vWLSKsdKI
	8l87XCboJXSkpeYpwatp8b1aWkJOwZx3czlogYSp1TGlywlQSbwlBrL1+1nVhjuO
	1vyng5ieyiwRVD9XwJ/4Hnw9zAFtpYNx37m6fVro1WIc6OjfHpzg/a4t+d7vp76n
	OD8QXg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu7fatqdh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 15:00:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c69fd0a87bso85688585a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 07:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769094037; x=1769698837; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jbMKhDfn3dd1xV5Jq9MD5SYWZD1vNh0Bo5b3+HgjZPU=;
        b=D9EOXGnlt+492XUYEsj3LeTgZqVGSwM24U4JlGeMHatf6rOtEdfZjbMMDdb8hJVnoR
         MHMr3BtgBshmT51pl/9cS6i4Aj/drU4fGsPGrxwi5n/Bn1a2Fbap3sKu6OJhrjiE78F2
         j8kvoHUiv8nWk4emRiuRQqs6a7gloF4hv+s45DRlu5VEujsg5gdEfyBq8C/LVwKngIDn
         HSOWcS3C4XlAaNJLf2DKqIyKzdlQ8Y3V/H17p1G8xESdGKUK1KXBTwZq36utbJd1hd/Z
         F5v4+6emqMYT7Wu8PGmsuEx34PJ5LHEOK05yiZF/2v22JiKpBW8UfeEH/7Upkf8GS5Pk
         hpbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769094037; x=1769698837;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jbMKhDfn3dd1xV5Jq9MD5SYWZD1vNh0Bo5b3+HgjZPU=;
        b=NeJs5oHvEog69xtpto2F5x4fTjVtMGOZ0Xpg5RzUVDI7lNB1MvQ3DYchrPnxBL751x
         pE3ImcDqn0bzIuZNZzSZ7jdiExwTk+G3bcx/y0fJxQPL4hBl9U5VX8ZYTyNHBvjgkVE+
         u+6Z8xN6LM91zLGXHeD1A0HOUCOYkusFVgdg3rfCOB8a5IVNy8OJNLOdypl3merKm0zk
         8rmrgHtgH0C5GgoBia3cOxQMGFO8rCIE4rAjSS5uJR4z1RIE/I+5CwRaUYXu8493KGUY
         kPAfEf5XqAF6hmyNq3LZRtRfLecCPDKR86uX2PFnfAI2djxXCZm+g5yWR8leFluCbUo/
         hmog==
X-Gm-Message-State: AOJu0YyY+3QykYqg+ihWfSTqNJmojuHIqKrgs6ZWFjrv8FrBuCBBmGQ0
	cyGZQa6SlqrHOYrimiuEwJI7pKYIF+M6P7pcGGeQLlhbQan2hemYZwoIakvWA+eKfoXP/oU+H7I
	BHrFGtpg6FrREx0LbLDY6OLWM2VHsNWoBju2OH36iNuH2j9EeVuCXuLgjooOh9bIyp8xN
X-Gm-Gg: AZuq6aLNfEb61Z20SFmhu6M7iwAUlUY2DVekHRqnonSqfzbIXllHhJ5kkhNyLMkpS/L
	f5OhuPXMIVQfO5E4p25S4azCLT5nwdKp5M9zpwa8IxE2jb+PZfvAJDBzB6M923QWBZH58gbd2IA
	nzNi0a93DtLHpzDCMmxTa34TitELVMDnz5W6txGhhbBpy7NjJtcP5gIy10Tmvnn3WGtWlAqs96o
	GhKa0Bp7EMICQwpsmH7OGOw5qEQlS1uvDAeFaazYa7ctLsG5vJ0yj2cGHwfGgVdeldfjE3+Qla9
	DWz75qK/C0nR+bvWzj/PihiuuvWrsh1UT8DQ9v9oT0VuBiEevGEDxFlzM/SbFPmgMgPMvd9/SZR
	rp1JDGFlQezpXu/XleNUnw8Aj25m18k7cz8isA6Asn5OX8L6WWTbVQdZcO7Ld+P49Ah8=
X-Received: by 2002:a05:620a:6c0c:b0:8c6:afd9:e422 with SMTP id af79cd13be357-8c6afd9e501mr1894501685a.9.1769094036692;
        Thu, 22 Jan 2026 07:00:36 -0800 (PST)
X-Received: by 2002:a05:620a:6c0c:b0:8c6:afd9:e422 with SMTP id af79cd13be357-8c6afd9e501mr1894494485a.9.1769094036066;
        Thu, 22 Jan 2026 07:00:36 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885377e562sm7772066b.64.2026.01.22.07.00.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 07:00:35 -0800 (PST)
Message-ID: <3facbb23-80ad-4648-b81c-73f4608129f5@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 16:00:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] phy: qcom: qmp-usbc: Fix possible NULL-deref on
 early runtime suspend
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, vkoul@kernel.org,
        kishon@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        dmitry.baryshkov@oss.qualcomm.com, neil.armstrong@linaro.org
References: <20260121142827.2583-1-loic.poulain@oss.qualcomm.com>
 <20260121142827.2583-3-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260121142827.2583-3-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Hrx72kTS c=1 sm=1 tr=0 ts=69723b95 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=JrZo24E52nylh-zEmEsA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDExNCBTYWx0ZWRfX6mqeNksHnpgi
 Np6B7VNqdOOO9zZnA/TqPbj9yTrf0x7n6TIdRSGCMmFdpBk2hJVidIGL3ANGksAGyQS1ZqcdXPx
 JEyeDrrNlUrzm3/fIjYrI4SiVDjR439jeuOtpXiS53ksPkfUaA3tox3DbPxanqjeBFvKUkb8I5m
 dgBINli4u4i1locMRJdYwFUnOnB0MJGeiKHb8IAwdsKYuF/5VLSf2YupkGBbgiBMWITBEicI4aD
 cGqp4cCGI3o0nSmN0SuDsEwOLAcTx5Yo4xpEhaDvhzGd6Mx5CW/OBhah8AWDCczoqjBZ6B8jbax
 CXMIEfiaH34kNgoldHE0v8Lz0LmMFw2bXxVuvJP4ThoXgW/LaOgT1JlSkzOkTm5/LEqqdiSQsim
 q3BRfSd98qBNqT9LDGG65gjx/hIrJXZHGFtKfnouidLGy8e38rAXwYpGoNxqaTyhtSWSdIr11Pl
 JcXbPQvgUKkPQXCIhVQ==
X-Proofpoint-ORIG-GUID: Y5xwdA2-RxnNb2pq6Vr4Qc9A714U1QKz
X-Proofpoint-GUID: Y5xwdA2-RxnNb2pq6Vr4Qc9A714U1QKz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220114
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-90224-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0A1216858B
X-Rspamd-Action: no action

On 1/21/26 3:28 PM, Loic Poulain wrote:
> There is a small window where the runtime suspend callback may run
> after pm_runtime_enable() and before pm_runtime_forbid(). In this
> case, a crash occurs because runtime suspend/resume dereferences
> qmp->phy pointer, which is not yet initialized:
>     `if (!qmp->phy->init_count) {`
> 
> This can also occur if user re-enables runtime-pm via the sysfs
> attribute before qmp phy is initialized.
> 
> Use qmp->usb_init_count instead of qmp->phy->init_count to avoid
> depending on the possibly uninitialized phy pointer.
> 
> Fixes: 19281571a4d5 ("phy: qcom: qmp-usb: split USB-C PHY driver")
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> index 5e7fcb26744a..edfaa14db967 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> @@ -690,7 +690,7 @@ static int __maybe_unused qmp_usbc_runtime_suspend(struct device *dev)
>  
>  	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qmp->mode);
>  
> -	if (!qmp->phy->init_count) {
> +	if (!qmp->usb_init_count) {

This function changed a month ago, please rebase against next

Although I believe this patch becomes unnecessary with 3 in the picture.
I suppose the case that you mention in the commit message, however
improbable, could be fixed by moving the pm call to after devm_phy_create

Although we'd then rely on devlink to make sure a consumer doesn't snatch
the reference halfway through .probe...

Konrad

