Return-Path: <linux-arm-msm+bounces-109791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKRdBV+CFWoSWQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 13:22:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7C45D4CC3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 13:22:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 02029300ED92
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 11:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAE503E0094;
	Tue, 26 May 2026 11:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZhvaZp1o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SEmo2QFi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA933DD872
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 11:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779794524; cv=none; b=XPYgMs2ClB5P46drIOuIJ70mVqSnnpnBY+6Bi3C7nB1dgzS5JGUCp5VpjsfXHykdlAemiI75zs3PgG+kpHYZlFTYCNPJyvcL8cxYwR0Nn9FG32nvqhT+5lqfCS6w9flllcWRSQifdvDJGxIp11dswq8IZg21XgmG9F3WKVX5JYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779794524; c=relaxed/simple;
	bh=XJ2u4rAlFKqf3bCwOxTrOirn6TiVORyvCT7JY+6a+I8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YtzlKgzVnH4Xu8LrknKgd18U6ElQWLzvHB8lwvAQCyhuko8O686aaPoA7E9+rgLgUv/0ZjoXONmUu3aap2SBzDkrcni3wpzJrO0G1epmzAJixTiDAiRffTGqp+gPY1udpdTzRhEoeyYBRLWM7pJRE+tjSGvecY831G/l8r5gUec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZhvaZp1o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SEmo2QFi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q601Y21605273
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 11:22:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kqsxV/xGmwV1+pwo9CefvjlaBlQyBYs9ZVzmmhLZlaI=; b=ZhvaZp1oPmCOLsQv
	wXGFKPi1dhW8ElBOcdPs7ThevrfynYs898JSbA2082a5FJdxfPj46sJEWKlRKBlZ
	rcw9pnpTo13ZU2zklATcUV3BbSnk4FtdnXI6Xoa/F5UPLFGybmlIh4uLBJZjXTCp
	M0ITFUgjW4IHCKAYUrTDI9ODwZ+1hMywyPTLjsiPnaTCwiwRoe2aOx1qoHawsiKv
	Y4GeEmxpDHiGRpnX+WUjm5NOq7nGhjK1OrRDScnwCqEE+bb6Yv6jPV5LvADIf9+v
	+Ck/4PT/pDZ0sPwLG1JR0EMLF5n5zoP69kfknea3BZ1L/cTtRkV2SvvJrQBZvZI2
	QDEvAQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5v3s8f7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 11:22:02 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c828ab3b033so13499724a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 04:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779794521; x=1780399321; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kqsxV/xGmwV1+pwo9CefvjlaBlQyBYs9ZVzmmhLZlaI=;
        b=SEmo2QFimkzZYnByr7YiqUnmWtN2+KV/c/YyiVEUK1AmAVpcO8VIhiHfNoj64l3GV4
         KsNy6aXEXQ3To5Yyu73vHW9R1cjpBZUWXPr26h4Q0iZXIRvRRbm4/D8CpdEt3DXcbOx2
         4Eft9NELXTqpPZc8xIXYsJpOeqFhPFP3+4NuiTOl8UjDIpE4IEOswIg7PY1aPkkHupWH
         8hOrmPbZ3sx4JgGqJ+2IaoDBHoMaA1+yjZ4kuthRggQXOofGxXM8r1fqv2qQtlj3+zvS
         sh2K064mdgbvpuw8XK4ZcYS0UCAnt4DwKbDhd89oJm1iwijuccoUPrb7FFEkO/HNP+fo
         wBrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779794521; x=1780399321;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kqsxV/xGmwV1+pwo9CefvjlaBlQyBYs9ZVzmmhLZlaI=;
        b=dRBKSjk/piCAnSiF0yaR/gDcZsWI4RnWvROkzEUjtBTP/7jb58c59x7xJAX2u0PAfD
         SYLU/IqrBvzsfjve14OF7a5OYcbVmVevxj7+2IyWY+z1glNNuwktwyAPqDd7iBYl1Jty
         PRZPU+upRL+3OnhGKmzzu00PVzYC1MiEOAq4pg4zTeRdTlPSMt+L673hJt4Sz8nEPQgI
         2rYNmN3t0BFZYfgzVqI9Ok5ZZpZiEHALoaCvnPZ42TgQzbK9J8TymN1qGyTGgfklI/L5
         wq3FbkLQu5a4yM/GXASU1UJu5Lopaxe4BEBY8/q8jM8s0IwnrxcJMkmejfMfNBKYN51Z
         xVhg==
X-Forwarded-Encrypted: i=1; AFNElJ/iwAOlLcbWfNh7NQGfUagKWF+zVmyTkjVsVAbqF+nT1jdp7m5r4MoJf3pXdxOrWJPZ4hpXIWzaT0okNLk/@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw1OTp9TmskjDFIdlDT/z+0YQ/1WAY72/dXms44Y8Y69AB1Rfr
	4aVxhGaxlrK0UHijX0qrAkY3JIF12T3sml1GV92XpGalvoMffrpHN9gCQvxbhcM//11v9kCj+E7
	WUTMno62tB3pemkRiUKQLLbCb1Un6cHHn/SwKmOOjDadMDaUdmzrotpXG0YVZRaZe9UB+
X-Gm-Gg: Acq92OFbqRCWg11Vcxskmup3y2WgnEgxNXawOuXua6iCfE+E+WerSP6CzgmUoqFzyGM
	QNTe9B44gRHOeX+6m29WYHTe1OuebfnPo15iluMOi2bOfIugtX16f2R/8ldhQE47c6I35tGRBBt
	6VSbrVJJpVRcsGUchpSpX39lLamzq93NipOwITBMr2nS6/MJES+VjS0g7J7gEChBuR584+FFsi7
	5+6Yw/HuBDhuQEZ7Fb7zhSULn794mPRk7OiLBguQWh1Q6FRnwS2NtzNkzhDJc6BZeGfUfgcgVmn
	DXIK2Bw85pvPmXJxizEVq/y3lMlRleraf/kKiF9HMqs1LVk8yecHjKDytzwTGMzZZZXLjWpMufy
	k8jkdQw+7Y+AmynahN1c2OHmqA7AAmQvfNt9mU7TqoKBu5SJLX6XTbV9xoeSqKZuv
X-Received: by 2002:a05:6a21:68f:b0:3b1:a9ce:5095 with SMTP id adf61e73a8af0-3b328d940ebmr18161094637.22.1779794521416;
        Tue, 26 May 2026 04:22:01 -0700 (PDT)
X-Received: by 2002:a05:6a21:68f:b0:3b1:a9ce:5095 with SMTP id adf61e73a8af0-3b328d940ebmr18161060637.22.1779794520961;
        Tue, 26 May 2026 04:22:00 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c852057f9cdsm10331123a12.32.2026.05.26.04.21.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 04:22:00 -0700 (PDT)
Message-ID: <b1888f5c-2613-99ca-ee12-fb4717a40731@oss.qualcomm.com>
Date: Tue, 26 May 2026 16:51:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v6 06/14] media: iris: Add context bank hooks for platform
 specific initialization
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
 <20260515-glymur-v6-6-f6a99cb43a24@oss.qualcomm.com>
 <sqjbcmcy3wohzdiftb36i7ztfyt2k7mnxkrzxk5yuocpe7kfy6@ev2ouxxnf6cc>
Content-Language: en-US
In-Reply-To: <sqjbcmcy3wohzdiftb36i7ztfyt2k7mnxkrzxk5yuocpe7kfy6@ev2ouxxnf6cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA5OSBTYWx0ZWRfX7JxhrVzBNFHq
 iAJ2O6bcSdxP5Xi7QTOCnb+2gIwgQn/9+YYnEm1Jl7Hl6Te7PM/Ihi6ZYIIl5fTyxEv2cwUY/NW
 6Z00NowkZ1kG3z4BKwEv3EFpt1KSlvS8K2h4nqJEYDWE1m9wOfJ55m2cfrueC7HhepwPq24EwqG
 W4w6VPRVL+JKjtcMaBYcozm+VpWob8QrW2Mw1xiOqwSvAu+1U9rPNvH8B2IscHOj0sDsL8SkYnE
 I54HJTxAAXddUBGRFwA3OeVwI+PiPVfI7vXov0ZYZNcqqrlPgv9cDL6xr+yrk9L2tnbZJnjmecw
 6Ef0M2Tihkp39d2x1xqmWdZYZnXr+6kmxwR8H5EL8U13LnPo2PJ7saoH9ANjUYdJAyvlLhynNnx
 pcpeK/YacC5JU5mYPfoDEiO39jd4IC8RhxmOIbz4XMm2JMTcAJ1wk4EXp05qINH0lZLle0VHFpn
 gss6Z+JnMn/ZxcTZ0EA==
X-Authority-Analysis: v=2.4 cv=Zc4t8MVA c=1 sm=1 tr=0 ts=6a15825a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=93t1r52Nw9wdlAKC5OAA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: AXIqi-ugmposLDcGpa93jrLIGLKOL4BE
X-Proofpoint-GUID: AXIqi-ugmposLDcGpa93jrLIGLKOL4BE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260099
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,linaro.org,gmail.com,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109791-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AE7C45D4CC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/17/2026 11:05 PM, Dmitry Baryshkov wrote:
> On Fri, May 15, 2026 at 04:51:21PM +0530, Vishnu Reddy wrote:
>> The Glymur platform requires a dedicated firmware context bank device
>> which is mapped to the firmware stream ID to load the firmware.
> Why is it required on Glymur? Is it _only_ on Glymur?

It is required for firmware booting on platforms where Linux runs as the
hypervisor (KVM/EL2), where the driver needs to manually manage the firmware
IOMMU mapping via a dedicated context bank device. This is currently specific
to Glymur.

>> Add init and deinit hooks in the platform data for context bank setup.
>> These hooks allow platform specific code to initialize and tear down
>> context banks.
>>
>> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>  .../platform/qcom/iris/iris_platform_common.h      |  2 ++
>>  drivers/media/platform/qcom/iris/iris_probe.c      | 23 +++++++++++++++++++++-
>>  2 files changed, 24 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> index 6a108173be35..84fc68128c70 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> @@ -263,6 +263,8 @@ struct iris_platform_data {
>>  	 */
>>  	const struct iris_firmware_desc *firmware_desc;
>>  
>> +	int (*init_cb_devs)(struct iris_core *core);
>> +	void (*deinit_cb_devs)(struct iris_core *core);
> Why are they being added directly to iris_platform_data? Why not the
> vpu_ops?

Some vpu_ops are shared across more than one platform because of same
power sequence.

>>  	const struct vpu_ops *vpu_ops;
>>  	const struct icc_info *icc_tbl;
>>  	unsigned int icc_tbl_size;

