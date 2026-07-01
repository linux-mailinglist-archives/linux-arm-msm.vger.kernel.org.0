Return-Path: <linux-arm-msm+bounces-115678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id L/owOkj3RGqy4AoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 13:17:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CF46ECAC8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 13:17:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QbJWIeCu;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="DUqmcE9/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115678-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115678-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5A3B8318FA2D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 11:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E40D426D16;
	Wed,  1 Jul 2026 11:08:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DC342B750
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 11:08:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782904139; cv=none; b=U0opwpji0Fivd+Wka9EAlO9sKBfoldL8oEpCasghym/0cVA2PYxNY0w22JLsBoEVDMOmN93I2z3svD+eq11M57QQDAjnvpRECOrPXL7a41xDph+8+wyCmauNZRyw+hQbZmp14Cowg+hRCK3Ck1pONvADi5vQcnQ/Fjw2OIe9WNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782904139; c=relaxed/simple;
	bh=EajvGOyHVdjB7flEijUzNcUbVW6CZqbgokaNABOLM98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TgzJKRwV58NbNzo+JirRHn1rlL4EPWnRioL41a55s1o3lNntu+OzFvVjYnM88OcHVaFEVIkK7yj3ELXet+sPtgW+wHFh8TBXcmx0anObYcQ/Ci6EyOzLaXiond5J0RpcRLZaQJE+sOHYx6pYrupdV4ZvsG+/UigSI3FJlL7FUK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QbJWIeCu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DUqmcE9/; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8aU7761871
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 11:08:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XjO0p0fwk2cFU8YWIRx46rqtndmqIKc0Yo0RgDCeCIw=; b=QbJWIeCu/+vPnVRt
	Whc93/25VI3WypDs/fDPpQPGDHxL/uNSOM0chaw1lbohq+xrw5rTv7aHaEmOjaNO
	FP3Ls+BQ/ugfg50i8i+8aUBH2APhGfDR43YNcENmd8yVdNr5jkreuwP9TZcDOD+i
	oB5iS5A9GR+OBQfVlMZ6Yhe1MWtVD/AVHCzg8BaxJuZoNPLS0jrASlAVKd68xRlL
	xgsCliuVe0J1ybSSX/TqhmrC0eh0fu3eNB+eRcX4p3a5OIBCmfosdh1GvylqzY7v
	LoVQuA/MbH8+svEyg+hqYGgSHXamqrEDVOym/akMfHwfQ4epEefND19cce10cOYN
	6aAkgA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4kgw3qas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 11:08:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c08e9c344so1490961cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 04:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782904136; x=1783508936; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XjO0p0fwk2cFU8YWIRx46rqtndmqIKc0Yo0RgDCeCIw=;
        b=DUqmcE9/LCHXpIOY4JMWwJ7JGlM6palU2Y1StueHtPtxP4dJPSdMhesg8TX9wgYIoR
         fiFEsl3gzkekgXYoBM5qa/jPKaNmdnuVZdbJR7X1qIJM0hSm/Hj0CJO4slHmdMqOSaP5
         EhVuUSGMCR6SewDcI7BpeQ4Vh0t0FUWRbSHaINgtlwK52f3tgzxqRpFieymv4S++V6uz
         w5jeJTWmFiUkQjRz0r9voPQqFWcQa2c5cl10ykzsV14VVhUq0elc8RWj1TL/QWvWmFPY
         KNEQkNYmqOf+3MwpAxqz9Be8Y5xA11VAWFiOHWG+J5xiRvPi0TnL7rumO4KWb74WeOZi
         3VEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782904136; x=1783508936;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XjO0p0fwk2cFU8YWIRx46rqtndmqIKc0Yo0RgDCeCIw=;
        b=Lo/qOj7YzbN2wwOuY4yEqtcxBsaaVLOCPa8wxyllirZDoGZgzfA+EreyPchSLYjqCC
         ga9Epd9m0E8qZrYwjkUyfW5x2TlwV9OrwqMyTwy0LfxLinuB71C6FcYBJ40uc3OBOCqV
         qUS03erqQzAccQu440c35CJixYuDFiGjtS91cxXDopvPefyuZK8p9qtjeplSmhxHpNIa
         fePe33YfRh5nTCF6JtCJF+A32WbVUpUj5T4WU6FU3aA/7qynQvcz232bGAvSCFdH3/N5
         jJTH4EOsXSwhdxNxtPN69r6VZPtXgatxBWZUEpRTDXkMv09RR5fx2aGiGkRps6MYSE76
         gwzQ==
X-Gm-Message-State: AOJu0YyPmWMQrqVRtU1V9tE6HZ4oG1zvD34eZTSjhR4VcQ3sHF3Ue2UY
	P3HGbcZUqeT6LeINy+bAouM9KwVjMlpDUb+tuH2KyPijhhLmnL7rFVt/bkFhxx9tA50Er3bnsgz
	jGbSDUnHJropFRDb1CE+CxuxNOwP/covPFTcGed4vPLpMSFZWwrzU7dgtnUyPc061MlN4
X-Gm-Gg: AfdE7cmYlPfWeFVMTrEjdhtua8I3/oh0ShXP+zMPLS62WnZQLPOnGwj01Fraj1YdR3H
	KQ1vrkmyg7Z2niW6UklsttoltmDXmi1poP1hbStfAo2/2KZUaC9VOuQyD6XxYmYvZJqpI4rqr/F
	7JIElspzKC8jM9zjOqDpaRD5EadPekdNoyBpPhAmK4qaCXdkjrwmoKVEuOlzA8trVFr60NswGqw
	jortOdWlZf/jjPKJLXN7xSb2nh52FEJMgYCVZ77OPZqnMNEG3FTPKQR35qbJfMl2RePXIEqC5Ok
	KJPrhKZKgfTK87wz+BKx9hQmaskLwbbRvaaenIvJTJu+dMUABoPBZhR/KpUV/NEghjH0Mw06EO9
	X0TFuILNYXH8W0rI7H+aMGnzhOsg9SMTordk=
X-Received: by 2002:a05:622a:3d4:b0:51a:8fd2:8ed2 with SMTP id d75a77b69052e-51c26b06688mr9546531cf.7.1782904136520;
        Wed, 01 Jul 2026 04:08:56 -0700 (PDT)
X-Received: by 2002:a05:622a:3d4:b0:51a:8fd2:8ed2 with SMTP id d75a77b69052e-51c26b06688mr9546181cf.7.1782904135881;
        Wed, 01 Jul 2026 04:08:55 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f0cb41sm255231666b.38.2026.07.01.04.08.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 04:08:55 -0700 (PDT)
Message-ID: <6aca48c3-c7a6-404c-9a88-9fe62848d204@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 13:08:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] soc: qcom: llcc: Add configuration data for Shikra
 SoC
To: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
References: <20260630-shikra-edac-v1-0-287b3233241a@oss.qualcomm.com>
 <20260630-shikra-edac-v1-1-287b3233241a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260630-shikra-edac-v1-1-287b3233241a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Co2PtH4D c=1 sm=1 tr=0 ts=6a44f549 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=lxniFRaUx0KqtI-xCyIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: xC33FpYJ88s0RHchz678J9oYRmfAkK7Y
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExNyBTYWx0ZWRfX/I/NrpyxXtpk
 XCuFCTgs49fv0JehPjjV0QsYHJeoGtZqE2WQbtui00ZJSQZI5A3UZqhk41YnEowK53saD2uHDkx
 RSKpIPSClsVsgzOPx1rUQwmm1YZF7L4=
X-Proofpoint-GUID: xC33FpYJ88s0RHchz678J9oYRmfAkK7Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExNyBTYWx0ZWRfX/xY7KlhBUKNf
 Hk4LKIHgkIKRd/m3O7pHifwoAozjfR+0QIX2MM6FFMaF5nEyknedDd7h7kbWXntGV7Ur3CCnDnl
 wSQ9Vm00jWc0yYbXpRreZAqVKYketNoqRSR+baeB0OCXsp+YUEAqEvZdk4ESerEArsfMB+8CNf/
 t81h9Ajj8hq+mrQzJH9yZ33RyZlxcqs65G83YjjXR3WhZ2YnQ7fjImSF2nkGw6wqwxgZW6KIQNN
 PmO8DmgtZwylCFWjP8HNyHSCpxIUOgQX0DzIFfv3nA2xqOOgfk+NQ4EpZ1AG2EtwKdxUzipdtIB
 +Dsl35zw82TBMXlm5IwY0nghx0AzHzsu1lr60OOJoh/7v4EuSo9vX+FL8SkNa3jNW4OkCFAL4Fx
 mcFX4bWaRkefyIio1fupJCp+eNtnkPBnoiqr05giCsXo/fNotHn29fLIClrZVr2W/g3hwNy83aX
 qKvPhRuPhrPzM7jpKrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010117
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115678-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:faiyaz.mohammed@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:komal.bajaj@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 68CF46ECAC8

On 6/30/26 2:55 PM, Faiyaz Mohammed wrote:
> From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> 
> Add Last Level Cache table and configs for the Shikra SoC.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

