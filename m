Return-Path: <linux-arm-msm+bounces-100384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJwKFaC8xmnoNwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 18:21:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 504FA3483B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 18:21:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 797FA3068D81
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 16:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75F9F3624BC;
	Fri, 27 Mar 2026 16:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fm91FqCa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ClVvQEpP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486AC35F5E4
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 16:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774630659; cv=none; b=aLvzskdU3ivdcWdeCUjQhVf3TTEtERTThm0BVPE5J5+t4NsWR+dmebIcLel4ZdeEiA9SlIaA/qi3zWu+c5GQ7tcxP9WUpp/KXOmErihZ5vhwHhuzHY6hQokQ5BIDftw9Pk+xNmw8WF5zhJ5ojkTEbjdsG77LGk8qF2MvHxcdYaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774630659; c=relaxed/simple;
	bh=u+ECWxyWzFBbTQ9BJ0PTM5UbD7f0LcOIMBiqHHGqK8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tdsr7B49fcxeA9bVe8XwjQtxZCyxESVQdYR0U85GizUzMLbgtY2s4g8+Ct2M1PcDg7VGs70d/nRrEwQTpnCOPumsTM/djtywkAvCiqR2N4SdWBy9aHpAFdxj7bozFxDVKFqw6txYxhIY13eSGGitCLLjTYBdlcA4zroB67HpOro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fm91FqCa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ClVvQEpP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RDh7Hw3747867
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 16:57:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t6pviqOdIKEhSum81CYcBUVYB3zHMvsVXBKXtjEQndo=; b=Fm91FqCamBWxrBbu
	pCCByu9r7XjSSEMUy0QRs2xOozqPy/7pYdxt0oSzrJmxWzzI11qwPXSeKHfSQRlS
	63SXZOef5m4/aFelhlsYE8oxYOh/38oHKO6WA/nWV29isI2l4QF4/UYgrbfO2YfZ
	wVAdiL4KF16s5vwWdAaLN7SYhNVF5T237vo07CBcbPO4eQetHnwABhDTTOgXZ9M5
	7CofNDiDHA9+mBzt9OzFnFddIDD/GF7BS9Xmirrdw7F0QLq4y24y/Mb6E7v77+4x
	du90FodUzb5119MkQpp7isU0JFSuGu24+7jiDBplDkIV2pB14YCL2rFcWBeyvBj8
	vHQRyg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5sxhgxh7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 16:57:37 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bdc1b30ac8so4052481eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774630657; x=1775235457; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t6pviqOdIKEhSum81CYcBUVYB3zHMvsVXBKXtjEQndo=;
        b=ClVvQEpPkj8aOZFYQfI5Z1XOv/dZJVnMJL/84B4QrI4qXy6Ro0HNy3Ppbh3bi/xwXx
         agguxe7WHjLUnsBOs66QCKYIymNfgAooR1I2Ngq6gRuDAdXxe1ufoZn5+FJ4PgnfJ5Hf
         kFooe9v3Cmu6HZdH/OQcrYtrKXC9b9yY76aaoJ497REEwaPcK97SaLWgRsrxNTzLlZMO
         ohXbblTgzvar97UwYjpr2bpjxDQXRz/oiB2RMDTOG9Goge8bvTx3hMD5+4bytrRVQ9wp
         SglaTvznirxusqPUGz35PTp7pzfAI+b7mP1oSPD5NWb6HA4ECWtq3Q70nUXdYPOaHSIP
         x1oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774630657; x=1775235457;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t6pviqOdIKEhSum81CYcBUVYB3zHMvsVXBKXtjEQndo=;
        b=V946EYE9R/rX5wnqKiw1t/hlHwQMDIYeYBxOblGf7Z6Kcy8ZXx602N3IJDYb8GxVnn
         IjKgZ0VxwO029jfdYvvUcJIpU6kUSHb744pwqecyYdqQYmRj6hJgooNtS2QU7IqpLvMB
         /XhbhaJ0NFC2hOJvTYBydvd62gAKOhw7e1OKQ8o2OguSWMrGDov1h8zpNjN2b6vgojkr
         T7dvpJL1G2gfkYnrxjvzFrgpzuJ4aUp5/+V4aVB/T1aUH4+MTNimOQ/agM/KgiFbNdz8
         9EOfdj9Nd7Xhg1QS2ZV+6dsYxG6U5YAXh74Z5tZFvB1SyGksLUhi6uj+r3S4zZ7Ack/a
         4Pnw==
X-Forwarded-Encrypted: i=1; AJvYcCVXYQb/NrBUNvdd1nPW0enJuG+8luLn1JxaIfh8IviXhxJq+GJbigyZjYSxulAgVVOD6XdeUvjSPpX1hYsd@vger.kernel.org
X-Gm-Message-State: AOJu0YztGT2xrBkmhGcrHvA0ORA+iYRy9Pwe83udsJ+ZKTvtQJ4QYtOX
	ibKErcMSh45s/n1OIZPCDOiSG8bHRey/Bh5eU9dwKXPESSarLVUTqmEAsXiO/aBQlTU1ZhzFQdD
	VPyxPVHsISvAfMJGlv4fcxFBvyoj4DeUkU/CJPogmVTwilstS1ZxPchdHAxrq4ib39Afg9XekmE
	Jj
X-Gm-Gg: ATEYQzwD4FGqkwg4wGGJvm6Wpq7TlV3lQMCecqFDYFGqNKur8Q6sYlkKWEBltuglz8m
	uIiqOICmOEgQjPJGHephJNWqP8EVxNRypfEQxIsgttLZaW20eiseji3h6OrBezO2Mgc6yBv3yeM
	5eGTFDz2nuPO0OpVRO91ni10Vrq+2buYfmnUs3Fvzw/IQde47qZdPGYWHarGDkXtyKt0G8sqkpi
	0IIJtffST3RBnvZrJcH2h4+TdYw6f2K+l9EPK7foVrdGNUw232R7M6mmgBVOldtofcjSooREyEN
	aKWRaqIgWhN7myXoXAZXbkVgEY7WIjgawpAg15b4bdwDHV5Av0J9M1piQZg8gAWY7IzHDfuhR5X
	YvZ0tiCXsB2lej5xzSSACnYjv6wjqzqEuMhRd+QCN74Lvob4vGbbSaStYG188q8JTwcsjtfSGND
	4=
X-Received: by 2002:a05:693c:3008:b0:2c1:6cfd:73df with SMTP id 5a478bee46e88-2c185e90d4bmr2003069eec.30.1774630656691;
        Fri, 27 Mar 2026 09:57:36 -0700 (PDT)
X-Received: by 2002:a05:693c:3008:b0:2c1:6cfd:73df with SMTP id 5a478bee46e88-2c185e90d4bmr2003053eec.30.1774630656107;
        Fri, 27 Mar 2026 09:57:36 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ed9c073sm5517723eec.18.2026.03.27.09.57.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 09:57:35 -0700 (PDT)
Message-ID: <55e9ad45-ef7e-466e-89f8-d2d1d0493d54@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 10:57:34 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Update copyright headers to yearless format
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251223172425.2283978-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251223172425.2283978-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QZVrf8bv c=1 sm=1 tr=0 ts=69c6b701 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=IWQDTU_h8YkQ2KHlyqYA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: FiKyf6w0QetDAZ8stZTC6OvTc6HTddfi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDExNyBTYWx0ZWRfX5rQv83R3s6Uq
 OWWn730dMegKOn2LG6G/Y/rjJCUPm33uEOmPv+UtFZCH9uwGxT4NLCmussq3jRD92ADCLZOVGQk
 lsnwqE2voGcK7g+nFP9A+1je0MIbNN6V+AZNsWsWBaNSu5u8E40o4h2kyoH8CtIyRk6TthOJ934
 b2Y0XUlPV+8VDUulbjjxnEKp72lGhU1+YFu8TnZkouTDTWwHW6k2hJOtf1UxwwVt575IGluNI80
 SfJPa5BH+kTbgGciXKbW4djatkZYg0Co/AyfY9+aACpaC76NCezWiqHVZ0DrA50qKXFSfqLZkwL
 Zt/m7RTiVCq1bFULWY6AWE1AxOeUi6nSOgc+g+Xxv+mbpcpFf9qchPdgR119++2ZozQ0zW3QQ/v
 bYzk1Jk3ROzv5lQx9KH4p6hEsZ/EJialWM8JVVwS7H/Ak6JrMhlhqeafifUHfpQ/DsQD7MqEwED
 lL+zBc/u/dhJgVNVmkg==
X-Proofpoint-GUID: FiKyf6w0QetDAZ8stZTC6OvTc6HTddfi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270117
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100384-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[jeff.hugo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 504FA3483B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 12/23/2025 10:24 AM, Youssef Samir wrote:
> From: Zack McKevitt <zmckevit@qti.qualcomm.com>
> 
> Update copyright headers in accordance with Qualcomm's current
> legal policy.
> 
> Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

