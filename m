Return-Path: <linux-arm-msm+bounces-91938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIvOMm+whGk14QMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 15:59:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEFCF45C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 15:59:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DBDDB302F7FC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 14:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28EED421880;
	Thu,  5 Feb 2026 14:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i36AdaAY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JDmLjuig"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A2C25FA0E
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 14:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770303546; cv=none; b=LF7FbfzoWJNksDcUQ1sIdBW3XQNfsOTcTGTfmlycrzKwTszXaySO5sv+pfHgL+GxaZzYKoITdPvE5RearzkOuQFCyf9svbppbvEO/jq4S1QkJKVL6urPkZaC1ppuLCvq/hlcGg3R46anfC+8jRTCqeapde8wtLc6suEbb2xdCBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770303546; c=relaxed/simple;
	bh=eiU+1bS+g6As9p2FvLqaVvB+ahkyOhmYrIL/xT0QYvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JXg2oqKmoSlWwyfl3wF6i++xBCyamJdtUprqoQf2qckLQa8QfblA0EhGjtT8RfkiiEZKc7guZi77yNsYdWxW85/DuE/rvW7CH0ulQccv+0GR09hkeCr/fglMrALsNxHRghqNUzqK0S8MlFdVDmYLZBbi3bLuourxcVcAo2Vrrz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i36AdaAY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JDmLjuig; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615EYdqL2945607
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 14:59:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rCooReUn47NbAdYaF/BXRuhgYBtDMcYnTCtHV+u8eeo=; b=i36AdaAYbpWmcnO3
	3/q37l9Ekg7KWIBmAIQ73jGthMjG2PzhVOkjFimXfkMQrcv79f1WpklVeXWhoVT3
	Yf2Q3zNJ9NhWDaylIFY3efvNDH/+R8jBCVlQqCKTW3TNL7BCvemjwnzRwh+cKn/Q
	+GTLkUV5Cuyogu2T9jjOxiJhGSkflqgSkqYCK+APSJlebpPndF+PxTGgaxKUVFwn
	Us2qzgWnLNKEtrR4fjxL9AeJCvVvbN9WqG9WL2UcqF0NupHfuj1WKx1gPOQgrkf2
	3pgXNMKAsXOEw7L2orzccJ7PyRJoKPf7WGNb0y17AsqD1KeZt5pXqHfeqzuC1MLz
	xkifvQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4q55s9dk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 14:59:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6d6b0f193so21613285a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 06:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770303544; x=1770908344; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rCooReUn47NbAdYaF/BXRuhgYBtDMcYnTCtHV+u8eeo=;
        b=JDmLjuigeEt+Le6uMrFcRs7BqTsGUp1qLJ8S45hn8QdgQNvpO1MgRwxbIryhuQhfQ6
         ODCHTG2mTDQei3CU6jfwUissb/l83XKkXsG0j61QfIREsnZkAVqVp0E6duujNjkGT561
         Ptb9j/A0AMy2i6jSHx5W2CAz+zsc/T5Y8FqLwfgfL+ZzZEpm/QGZifq5CVpfvUFkZCIb
         SVmJxt0bERBkUnfQ+AUUYeTfMe4w1y0GWwRLHEp6pGKdA0x3uQeK/GEvG5JCjF8frUi6
         4m/PA5scjXSR3LmETgX4QTgpA1h75fw5L4GvyzWUFahx0Y1mHIR7WJvsh0zn1GDIrv8O
         cRiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770303544; x=1770908344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rCooReUn47NbAdYaF/BXRuhgYBtDMcYnTCtHV+u8eeo=;
        b=r6/aOIwNt5h33SuXnK2J70dwe9grnUVMVyaqbP0PUQyl3gttBX+oUyUGhPhWQOM1/N
         emoLnwDmp84SQXexsbiveqDcvZtLBKPdH5YjlaP7sIs6y4yvbYlPlAjbSG4a+PHZZ9UK
         V/MKqjJDl7ZltKjP6lmGU92N1eyC93l6QDvx3uyvhRiSk0TLkI2jarzYxw0+9PM1qlFN
         n9lktIudidgmNXhga2yqGt6BovlKNd5ay0KrCpiDxXaj6qSGwhWg3+Fyt8nx9iIQI4NC
         s4Fx78RzKA3+5rrJ7BgUCGPSRSupfOf9s346FIG6Z/cyEPZDqUE4zgo+VX4hVrk5VWig
         C5QQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnyORLwn14izi+dF6o4QWJuH/bukA5Ddn1WlyVm3b1eFEQlTttJhZccV5oiPA2Mnw1xPEek59gA0FD76iy@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7a2u/L+pEwgSoFYJ+xEJs4c9YPassdOapFflazFXJmZdGR3ql
	CsX+SBnS2f+UHQobeVHiM84a1hNunNqN7A5Tf85HmW/XHTXtAH5XvGm+87/ygolVUa0VlgUNBP+
	TdGcj8yP4TERp2O1zFQ+inh0adMq4GVTYPsVk9HvvyvXFRZU5GtAPfYLddjl/6x9AbfSk
X-Gm-Gg: AZuq6aLG+UaHtXlCqUjPQIXkr3DsfMHrq/MDU+iSXzIdhRs94Trs5m1IDd+tcEijKkc
	xa+yNdtSMF6WhsogAjw7/An34kJLtgsq3R1Io0Wkw8ymGBekhyFhHiQRxhyp+Plw1pfBfWpPlpf
	OOeSsdpXTxbOLhQvMwX+rpznSSe2zxtCK+HgJSo9TMG7lLBdWQr6LAYJkbOV+yGcO8YEt6WgGO6
	NxYdaQDv+UK2esm4g5f+irEj6xh+M+/LWp8/RDP1Nb6SVN9oMAz9IqpvWNViw2KhgNW/VoV5Rm7
	5XQjGToGQ7DNLUP89OJyjWqxf9EnvbooOxiPHmXN8eTuxujZ8vMrGLEhFsp6iSJnasMkvIw60GG
	Zhl5J/h6+eDVjPOClAE/Px5eCn+ox10l9dWWD08L01ACT0EZL2MI2MHD2Id3auaovlvs=
X-Received: by 2002:a05:620a:1924:b0:8a3:d644:6930 with SMTP id af79cd13be357-8ca2f85818dmr660199585a.5.1770303544199;
        Thu, 05 Feb 2026 06:59:04 -0800 (PST)
X-Received: by 2002:a05:620a:1924:b0:8a3:d644:6930 with SMTP id af79cd13be357-8ca2f85818dmr660196685a.5.1770303543674;
        Thu, 05 Feb 2026 06:59:03 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65949ed6b7esm2186812a12.11.2026.02.05.06.59.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 06:59:03 -0800 (PST)
Message-ID: <1e026cc9-c89a-4c6f-8def-fc9eac5a00e8@oss.qualcomm.com>
Date: Thu, 5 Feb 2026 15:58:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: fix QCOM_MDT_LOADER dependency
To: Arnd Bergmann <arnd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260205145623.1360105-1-arnd@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260205145623.1360105-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDExMyBTYWx0ZWRfX2KQEQz8wsrGF
 dAV6hZArMGiuden6Kgr8IikwbZYQ51Z8laW/xRUpqfCbv3y0ZxyTecSQZ7Wq7FxVEjcYEUSw6cF
 YtvkEpCs3sM2GHkJdFOweMxyHsjCSnmuxCYVX5qSJ4URYR943Zi7r8CUdfgLSaD67im8H04TeT7
 VJchflFfHgDo4IsOYee9hTOvHdb9J8CmDG+cfHKUtBqNzhNe8Kz2Qg3H9+duU518dM0lIld59tk
 9ARhIjbQYnrGEnoQoKJ4KBv+WEGalpqtLdhQeurDsyX4UUHU7zbt/DEY53em03/+HzRTuEmxa9Z
 lyv4MKhVU3jy+j/A4TBk5uo1r6HlaxIm9NeZjye62eeaHzRMYHxXTyf1L3iWwITpLpiB7YkR3dc
 r0yw6Cu41iMll8o9mqhH1Vu0r7RsXsxAGLmk7JBaKrCBVJivPmSW/hxdQyc+WdhiDhTzoVX5f84
 qxKyckfrKcvsZuYW29g==
X-Proofpoint-ORIG-GUID: E-w-TKZawyLyr3VKu00gUSIScta-_FKc
X-Proofpoint-GUID: E-w-TKZawyLyr3VKu00gUSIScta-_FKc
X-Authority-Analysis: v=2.4 cv=Z6zh3XRA c=1 sm=1 tr=0 ts=6984b039 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=3VnJ6WgW_pJ2kVnysBMA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_03,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050113
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91938-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4FEFCF45C1
X-Rspamd-Action: no action

On 2/5/26 3:56 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When build-testined with CONFIG_QCOM_MDT_LOADER=m and VIDEO_QCOM_IRIS=y,
> the kernel fails to link:
> 
> x86_64-linux-ld: drivers/media/platform/qcom/iris/iris_firmware.o: in function `iris_fw_load':
> iris_firmware.c:(.text+0xb0): undefined reference to `qcom_mdt_get_size'
> iris_firmware.c:(.text+0xfd): undefined reference to `qcom_mdt_load'
> 
> The problem is the conditional 'select' statement. Change this to
> make the driver built-in here regardless of CONFIG_ARCH_QCOM.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

I see that drm/msm (+Rob) does that too, but perhaps for a reason (old
I.MX platforms with Adreno)

Konrad

