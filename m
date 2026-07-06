Return-Path: <linux-arm-msm+bounces-116736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rRDcGVh+S2pFSQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 12:07:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5954870EE71
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 12:07:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PhObwOTc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=j3f8s2kq;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116736-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116736-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4A1DE3016C01
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 10:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BA3E3EB108;
	Mon,  6 Jul 2026 09:48:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BE936F915
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 09:48:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783331328; cv=none; b=nu15zEdCPM3A+EGCMYQ2DIk6jm7EU8s0njRLBJWU+fI/3SNVMLIbKB4MWSm9XHayJyLpAlPC01ZLvWc1tS3IenqjXQoqi2SfS70Rl/HgJTNGt+JM+R5OrZLZ1//0mLLq8tPA3C2jg1Hfaal9SQTfVvqsVXJlP1qfMDbEA3fZZdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783331328; c=relaxed/simple;
	bh=4BevZDInq0oiqXuLYccCivQ5oYM7+LFPzVWpZcVwfjY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tqZpXCqUjRQ3XkRjE5NC6vPo0zAiA3YN3+yxrovAMtmOcaKLiTlD/RZpH2+hrvRMgHlR8aent34TeB/T+iQLwx6urGzqUN11LOoUvlpLUOlDAknfaMXWVpeoMBhrHwdvaDH26Ogllzq7LteFlOSqP8uCH2YcbyFAfaCTS1rw4As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PhObwOTc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j3f8s2kq; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693s764172338
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 09:48:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LFt1cnbmquIdfT70CB57ayQHnGhwtJl2NHixthPRKhk=; b=PhObwOTc29nLiodc
	CZCGiBHZfL3dA1JMeSxw38x8TQDbJ+1vvtVoZuXOjBQsU9OG9+yvKuwmcF7eenPj
	vtjLg3U+vND/uxag0UeKVsjYSBQpw6Cf7bJpU+opyf4oPyMW/yYgRigctyVclM48
	thuneTrycE7LIC0Yp9ypSXRsq6a/s+NyUbbnCmeG3Gr4F6dganZt7xlig4Y0E5aI
	ZrbPYm+2MmfRlXzjEX25NSBi24nHqG6C5c2PYT9TP2iqZhJSjgjL9fzVYhctzZEZ
	cJnWLEjUAQg9TYE7ABA5R2lE3cC1ONafwPC3D1Z/oYYI0nBgHiSXYZdjsZznZcqg
	BL5qCw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t88b7a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 09:48:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e9c0c4492so65426785a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 02:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783331321; x=1783936121; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LFt1cnbmquIdfT70CB57ayQHnGhwtJl2NHixthPRKhk=;
        b=j3f8s2kqDpQ8xKDwJbaa9zOIaCRYZru5MOHlsYk/Q04yUaOXsUt2//SnM2CY2SaZpQ
         MkYDdQhDfpn1dqx9eMRQX7l4hRCUbRMdKiqVtoVly+oy1K1p9UqKh8o6cQpyySeai+VX
         0CU30zPENzXn2bQDrJkS1jbWmMPz+n/nz0kx+AyXa8oXliYP26zhOF/qi5zg9C45GuXq
         Vb7P+8mbfbPJ1FdCK+2ZvLraRdgu4PpFPHrBRW2pjI8o0MDfapyTCZjHkJLg7UOMO8+A
         p8WWjyiXgedzIp4h71Xq9aloCqKn3jfQAoElQxEvf/9godeikmMUcZoLz5BIZtAFXlKE
         /GNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783331321; x=1783936121;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LFt1cnbmquIdfT70CB57ayQHnGhwtJl2NHixthPRKhk=;
        b=NfVK6IiYnGI0nR5P6px1voRxIEGPernHbsJGIakggf+4lr9Yg5KrOPBTGo0d5K2Jma
         dX7aZn6kIFWM7wdWWxBv0tk/JAyHR0DtJfMeZmvq7J00FolSfsshfRdtLHCE2qGllqcX
         T9HI+5CfXcMxBkY1eED+sYmJy5MlqI9N2hRsYmdht1gFUnorOM+jaH9OVODmCBdRAwAI
         7JYUujnjc2Mrpbu+ObcRDSnMDtNmMybLwv+yYPB7PD9C7Zm+rDmzAMl87+kYxt4CWBt5
         GyBgvFd5XljDLZZyiDAl+a+x7WO9KhGs+sEwMwzQj4q+VQ3xHN8VG5jZebCE0JbPtzxu
         N2iA==
X-Gm-Message-State: AOJu0YzjTksiM6EABlxDUHKzL0G601VpIbGb9JTwiwtDxO+PPbRWF4uo
	hZmJplfmmY2dByzeVzoTHsbonfaNUicYHj5ShgvBj/FL0iy7LMsenwLPmIoOqtA7DMFUv+GIv91
	M4OG+hKKLoQp+Ii9zqz3muvWpGZNRCWlCEt7fIj9Xc7hbRXXKhnk+l2ZnPz7CzYbGa9NQ
X-Gm-Gg: AfdE7cmhqhCn1zMfHACtVkwMTTt+9CVWa45WAmrryXIlcNE1kmpmDREKU9cT5PMIQco
	8EsPMgzuMsbBsBO07BecRvW5IaLbktYw86YLIB5/4rfB+a6SCg0lPQbZP4Y6zyTaRkxlKhZefFr
	mswLvhNuua3Yp1juqlUWHDwd+7Fab08GAOzblnn9CjSRcIUnkzlq39zasEH0Wc4VFfa2RMLgT57
	+w15oafgIDfSPtXA+ui1l93pBZuVbbXitcCYsnUGcHcYk7m6plOesieO6lM0H2MmXSHaD02j4w2
	ds1YFyMNxbLOUmkY9w/SPADHZi2iiCCTbXVizdohAN86Pg33757k/YeGszBk+u/PjQwKVdrP4ct
	C1ix8zxbabjs+S8sUpYWmgeNrCfh43Wgxp9Y=
X-Received: by 2002:a05:622a:40b:b0:51c:d8f:d77a with SMTP id d75a77b69052e-51c4bda726cmr88366571cf.1.1783331321325;
        Mon, 06 Jul 2026 02:48:41 -0700 (PDT)
X-Received: by 2002:a05:622a:40b:b0:51c:d8f:d77a with SMTP id d75a77b69052e-51c4bda726cmr88366481cf.1.1783331320756;
        Mon, 06 Jul 2026 02:48:40 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62907ffsm715403566b.40.2026.07.06.02.48.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:48:39 -0700 (PDT)
Message-ID: <6b8ad516-c368-413d-94fc-d70844a2af07@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 11:48:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: qcom: stats: Add stats compatible and config for
 Shikra
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260703-shikra_stats-v1-0-0aa0ec1fa83e@oss.qualcomm.com>
 <20260703-shikra_stats-v1-2-0aa0ec1fa83e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-shikra_stats-v1-2-0aa0ec1fa83e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5OSBTYWx0ZWRfX1ZnES+tYXcpW
 KXxov29uW40XM0vJSlOrLwYCeCVyfjGKaOaepCi1tGV2VDkGI3F58u69PTpxvfpzUjFRxghbo5m
 ntq4cYwdKFFgYCKwvVBeTMzQglPSaYw=
X-Proofpoint-GUID: jQEZoTATMrKYcbO617BVopmOiMmjclTx
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4b79fa cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=9HhW6uXCempL9KpAJskA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: jQEZoTATMrKYcbO617BVopmOiMmjclTx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5OSBTYWx0ZWRfX7icQAXgqfHae
 8GAzW8JfDsU0zreSQyBHXVplG4xzIBRM9ukXDIDSn53hwX2EWer6uKQ3asVzuzor8+xTMspQp31
 VQtpkogkMWxaNiBJ0v9YuEmwqlMtGx059MvmFYNYV7vzSW8PZyr4C6m/5gItr9E/WJkEtuJrCxH
 Uyg6OcoX+2SrBbzW8w85WVfbo+eCqUL4f5IoXkcyU+175W2iaan2Z0VTYIHvy526I9tJZ2JgpEi
 AnpIk1dMWs9nLvVYDMW4BovIFLO+00CMBxtqCujUDO88xDrP1ys6PE7/6hV6D14Mzs7XU+yxaGB
 ksJe2Yq94XmSiGwFUEXp1B4YCRRnD84m+A9+rVxewm1rtw4CNv0MU9ZJzeVrqS2vqOG/McC5tNQ
 gtKkg8nUUNxqLrW+c/3WcUjLxAmNRo8igEFYVZF6V8hUKhYy7dWU6BHxRd7OsYPjfh0ogMAdDlp
 gUIKMAZWsvE1mwu/eZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116736-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:sneh.mankad@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkshah@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5954870EE71

On 7/3/26 1:13 PM, Sneh Mankad wrote:
> SoC sleep stats are present in RPM message RAM and subsystem sleep
> stats are present in SMEM for Shikra.
> 
> For earlier targets using RPM processor like msm8974, rpm_master_stat.c
> was used for subsystem sleep stats since those stats were populated in
> RPM MSGRAM.
> 
> Here is a brief summary of previous targets and their stats
> configuration, along with the drivers used to display them.
> 
> +---------------|----------------------------|---------------------------+
> | SoC           | subsystem sleep stats      | SoC sleep stats           |
> |---------------|----------------------------|---------------------------|
> | msm8974,      | RPM processor MSGRAM       | RPM processor MSGRAM      |
> | msm8226       | (rpm_master_stat.c)        | (qcom_stats.c)            |
> |---------------|----------------------------|---------------------------|
> | sm6350,       | SMEM (DDR)                 | AOP processor MSGRAM      |
> | sdm845, etc.  | (qcom_stats.c)             | (qcom_stats.c)            |
> |---------------|----------------------------|---------------------------|
> | Shikra        | SMEM (DDR)                 | RPM processor MSGRAM      |
> |               | (qcom_stats.c)             | (qcom_stats.c)            |
> +---------------|----------------------------|---------------------------+
> 
> qcom_stats.c supports both the configurations for shikra, reading
> subsystem sleep stats from SMEM and reading SoC sleep stats from RPM
> MSGRAM.
> 
> A generic "qcom,rpm-stats" compatible only reads SoC sleep stats like vmin
> and vlow. Add shikra rpm compatible and config to read subsystem sleep
> stats too along with SoC sleep stats.
> 
> Below is an example showing sleep stats for "apss" subsystem with this
> change:
> 
> cat /sys/kernel/debug/qcom_stats/apss
> Count: 2192
> Last Entered At: 5498618336
> Last Exited At: 5498708046
> Accumulated Duration: 2046572620.
> 
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
 
Konrad

