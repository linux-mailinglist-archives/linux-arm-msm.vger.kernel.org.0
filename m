Return-Path: <linux-arm-msm+bounces-94088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8L9HDR/enmkTXgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 12:33:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D90D1968AD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 12:33:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A8D0B3008601
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 11:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC434394476;
	Wed, 25 Feb 2026 11:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P/QV8DUw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ezvsjhE5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CE835D604
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 11:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772019226; cv=none; b=ciiWipYiKktBHhSglHkw5BB7rG/mwZ4yoSAPHndhdlgyIOWoXtX6uIjv3SeqWGoMF8BOwlQtTcwvDoq6EM0X9H2vLgrqRIXRzQKf09kukiL8C2Fea9J+PuogbrAuW4M9yIwzyhD/sPNbKjKSV2FkewDPD+35bT5+jqYNAcHAs2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772019226; c=relaxed/simple;
	bh=W4sXDajMPPPyEt18z2SURauy8b3MPDVT/g0T+UjHmj4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OIdjMgzTvbBrmX8fAxOHKj42tE+hYHLXNG6eQkHwacR3yxZmtlcma6kK24EpQz0z5VHkeRqEUUNaxETBlMx3Q7SKtoUqTvdyLHyzD4sig66aEB3U3dVuZtym7YIHD6MMs20kF08Krok4Jq8Wa1NtjP1Vxrwh9XUftdwKV3JwX3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P/QV8DUw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ezvsjhE5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9SpLv229670
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 11:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LxXPb99z4u2ZZ0MrQ6gRxRSQBAGi1ZD4rir7sEpicRM=; b=P/QV8DUwm+8a+6GJ
	Bd6c8vM/leCnmi4WOQtUv842SVsyXXbM+IZ//L96GHQs6vhBxv9q6S8yKYy4uTfi
	yEGD/yw6yxT3vdE4u8ovQJ6+o2tgIaC8HSX/3knQ6x/g3De4QGWfFP6gg7UQJyF/
	xYMsB104XT4Y9sDp8v1eZ5QCS5y3IgAZ1ZaJzjEx+BColvRlqN7VxzCwgL0FfTvQ
	GH81/VnPelDZAdDy73kXnN/WVhLF5PkG6oa8Qv4JJaInBirSJ+nDwVd+6hzNM+2l
	CwQdgVMtZkotalsJ0Jxj9i0GvbVRWhQGfOY5/fIjTwD+ni51+Bp7u1/Q8qhcWEV6
	QlT5Hg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chg37u2r0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 11:33:41 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8954937be97so74652166d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 03:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772019220; x=1772624020; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LxXPb99z4u2ZZ0MrQ6gRxRSQBAGi1ZD4rir7sEpicRM=;
        b=ezvsjhE5CPCs9qkTXqckMpGpMzL84QTy4wq2qcNWwygkEnE3Hrr4BeVPKtggxFubOa
         VPSvpBVWAgUNQcEumDmYxPId8QhJN6bJm25M08QXo9eBr6ePpbDEwePZkc+vs8vakZBk
         cSE7EyNqBAWfLC5iUOIhkRIXGogC2V4e4gTPj3pUa8tGmKfRDzjLhrvP64g2dO3vD4aq
         LKF+sm8M/1mzddCtzKM51DYU9davIV+iHKvR8wZ6+Zae2xSijstmz0oxqFTHr7NWrpfW
         gAlDplx+qGmtcSIWLUMIf4LZDb187q0EAt+VOREtLL0gELe/yOSvLjKtQcylV41yX+jX
         Vvlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772019220; x=1772624020;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LxXPb99z4u2ZZ0MrQ6gRxRSQBAGi1ZD4rir7sEpicRM=;
        b=r8rLHQzzc3I1vk2m/3ej+iv6R91ib4ndD3HUQ8qHJDAIQtgPbUOylS8hKXr93v0RIB
         NXCuMyegY9JTQT1XOXE2cR9SJY5k0gUfNlE0lSIwLWo5MgpoYk1R0vqFhDqlzmPNcmIN
         GIKCT/C/7eYaU5P2xbe1Gwg5Wq8xu3qmLe9S4po0hDOACuRFL81BH0ixmoEn5I8S4608
         tzqLyCRz/+BqDm68azmbCMvIifWPNJG1OO6okXdf+4jxt6lioNpb5/SAy09MFquiIPKf
         gqVoVIp0hpLfXLN2IFQaslgxC7dC1NecvmIr5WAjG+2ojZm7EFwqDq8pLNWadv7VvsW6
         3kJg==
X-Gm-Message-State: AOJu0YwGo/ChVinJadot6fgbVPdqbwSiYwLgQ9VxuHiA+vtv+4AXy7NE
	CK1uXblR9XiWlQB9Xi+d8PGAeIWHLhTMRXDnPmy/vwRmZEYenZCryAPQgszb+R2eDKrxuQNVVcY
	dmF/wEHMPBV3V99xUzFh+OPWaobxCrnqTD0lp6bw7ITZe//fZECNF/323bxRdjR4v2U1xrbINbo
	nc
X-Gm-Gg: ATEYQzyPLkUyA0mRk7eXb7UG7neys3FEjZsDpFC7oQxlX0UvMwLmx+VNfO6kxgMPL6c
	ncRYSv9ijl0Fueb/MvNHoZtvytvIBQn/eNxCbtWATTrW1VWND06YIxT9uxv7N0xE7wawEVSM2lH
	Yj7g+o5dQDfrDDNCW6Y3jzoe0m/sNdxrtv6uvmIaMtlequPn+d6maI4voBw0ROiaa+MP0eEXlH5
	vzUFW3+4shDwVFjWmcTeHg9lduII13AIJyXOtfqNvvJBK3uEXvR3tRRBXcOjvTLsloSmxpGZVOD
	lqDW3zB50Sa1G1xJH7yfmCzPUPbiKFOZVYS7oufzWGctu20QmLZhdIhvz0Zb5AHz69hRlmHnUyI
	TM3ecHOoC/KIFq4vHccVCKEDonWbFITrLLeTSav2QC7Ogd5ABmOdXN2VnOfuBRo4byfj1+ZEeYS
	2QovU=
X-Received: by 2002:a05:6214:5e02:b0:897:1e9:578c with SMTP id 6a1803df08f44-89979d42f09mr152121286d6.4.1772019220259;
        Wed, 25 Feb 2026 03:33:40 -0800 (PST)
X-Received: by 2002:a05:6214:5e02:b0:897:1e9:578c with SMTP id 6a1803df08f44-89979d42f09mr152121076d6.4.1772019219749;
        Wed, 25 Feb 2026 03:33:39 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084e87c92sm515124966b.45.2026.02.25.03.33.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 03:33:38 -0800 (PST)
Message-ID: <4f107fbf-575f-4f6b-9c70-e8ee5e67ce7a@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 12:33:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: lemans: Add role-switch support
 and HS endpoint for tertiary USB controller
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260225093155.4162177-1-swati.agarwal@oss.qualcomm.com>
 <20260225093155.4162177-3-swati.agarwal@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260225093155.4162177-3-swati.agarwal@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=br1BxUai c=1 sm=1 tr=0 ts=699ede15 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=b1MM584mEctOT_RrRMUA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDExMiBTYWx0ZWRfX1dkaryzlajsR
 r3VfBHe+5jkm0PewGQ+C38FiHUsjvqZ5SSYv0vQteliOU/XuaLl8OeTfpSXRaBJ4OZeltp8hL73
 3LNFh4FUahzQ5iLYSSKoDlN2RdFWnDwx2ST9CSrrGpfDPGy0/sRj8t+cthlMKYBINxewTirL5TT
 oBfJTKVNJoumkXjFW5sWg7ZWYmO7rOWz3VoXZcEJKCjc+UVohLmCF5XYSNTnCPA4014FbiYIjvs
 RRe/iAY8BFM2yH06tgsEZuYDtnqrOP2z0Xv6zlpdWAqtiGMaypIiSb5eJc6tOXEiOgciyl9bAP8
 aIGygAYQwuXja9emEGKzxmWfZdqB2vEE87eIXwwq1d+wBEeiG8u7LAw6aIvcClhMtlzeIHEdk7b
 dmIducWMeGTUe0qRBALSnLwb4QgXdz0FLA6AkmerDb1d3o8pxkvtMtTzomuZf15oXdRHpXbJXay
 qgyajHx4ExLu/R2pYiQ==
X-Proofpoint-ORIG-GUID: ZtwDRHMG0EyL1xBLl2YxsjHGWj416l-c
X-Proofpoint-GUID: ZtwDRHMG0EyL1xBLl2YxsjHGWj416l-c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602250112
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94088-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5D90D1968AD
X-Rspamd-Action: no action

On 2/25/26 10:31 AM, Swati Agarwal wrote:
> Enable usb-role-switch for the tertiary USB controller on Lemans.
> 
> Additionally, add a port node with an HS endpoint so the controller can be
> linked through the DT graph to the corresponding connector.
> 
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

