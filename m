Return-Path: <linux-arm-msm+bounces-114501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VHeZCmUBPWq2vggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 12:22:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 920AD6C49F4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 12:22:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=j6+gUzc5;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WEAjm5QY;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114501-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114501-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A3A2E3013869
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 10:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CA8C3D0907;
	Thu, 25 Jun 2026 10:22:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B150B3D090B
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 10:22:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782382947; cv=none; b=n6YK/XB2sdxwZCzOdOHV8qLbXXH0hEgVep7wBlz26FDEKYtjiny5eBIiL5PikYItqErbBI5xiEmx51mflJK53PTsV1LVWALW0dwa/uPuqG1fthnKcC2vbettvVyD4WcQLf6vHVzXTdiEP8rSimm3YNdEg9Se6lP2zehZgz45+TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782382947; c=relaxed/simple;
	bh=PUd3wa1z9wVw46F6JNtqqyfzu6JtX0osRRT07M2mB0g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YFYusKbQBCpnSc0woF/NZpBGMOO+/7xUxisNCIT2K09R4t7EKquH1zrKh+3RwllAw/OXFHwXGtitlXvEoP+jfzvu9aTgX7aOTxXTC90s6QfBdztBz8TLiQo85zX7+7mO2Ka7ZleXDVHteTryp4spKUx+XuqQ7mEQ63rl8+ZeCAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j6+gUzc5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WEAjm5QY; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9jwPC1471239
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 10:22:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QKsIEUrVK0G2nIoOCPG0vvWvJmYCsY+ovNi5/n5tMP8=; b=j6+gUzc5lXVSNUD0
	kXlMVtHC3fQPq0lxjmNUrXWVdBZPIs0itBiyQKGlKjBDFlDUikU024C/H8o93ELN
	VU6p4ZAA7/Jinjj0EizNoSl8bwVUz1gxSt5oQjruMXn3Du2/jHc5wyXnlwx2Cww6
	rDmEvEygNI4jWAxY6ioh6CcVw/Ex3i31gHnixifCEwUfKvNQNF0eNBjztQMPpfpB
	35MhHxYzxZNnqPCfGFt75MFA8uVPmblxQKRWONU1+ycunVZ0gdwPhMUPVLLlkGa2
	eSSDN8RxAKTUI83o7awTdcnw7ihfjnlTfnN3mOli3d7UR6BlBwZ1gAPyAWGyAXKa
	5D0Ohw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0nv7jv28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 10:22:24 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ddb0711609so9376126d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 03:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782382944; x=1782987744; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QKsIEUrVK0G2nIoOCPG0vvWvJmYCsY+ovNi5/n5tMP8=;
        b=WEAjm5QYwAz2E2R6nX7AE5zq3nTqdpBFbpmUX9jmjyBmRb3JLKNGQBmovyWxgBHbgv
         RDmKcgITR91zQZPs+17TSF4G83SW4hEVPFXT9O531bOPx/pFWPFKDnusF56zrTlALLwi
         rNNMjtFcTTTCSNrNZ/KbAC9/Vu34TYCOIDGki7RG2+58X8mdjpWUAThSgoFL7Si1svUG
         upMt/0ujhMD5goO0F49nZ1FS7cJ/X4zhjVU7rEVc70Hvy25iZ/L2Mr4e1l4N7LhDEkSp
         VqSwG4dPof3QumgDE0974luqjusnjme/aNG6bNFxiOEz4g2t1dwES6eV7iYHB9XlWYxY
         TNVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782382944; x=1782987744;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QKsIEUrVK0G2nIoOCPG0vvWvJmYCsY+ovNi5/n5tMP8=;
        b=UOX6yrbWV12f8rkkIqknpO0XTHAfZnkYhHBSIPcN3VoU8/fLtBh5lp9ZdY2Fmc0Bf/
         65db+fiWrsoMasEQY5xGuawvJ7t7of5JgYv1pmm3mf66t12t8UFHRPGBmPgQ4Z9meMNJ
         c+Siv+ITSsoTHDheKlbGtthhHK+N9z+n6zxegV4FZU4WSX6XRmFTWlF7EN8uFclCR+ip
         eBpIi6SXyYKBhZh7GEZUvthMfxtDtv/jJpWkzffW7CGCiSelYfVsErwTbL82dhtrnywM
         9TXJv3DBBMXhsxGf79sUmnH/iXtwO4Qni9IaxZkIajGbKI2LYpRkBcM8WSmAB9sxG8dJ
         MGow==
X-Forwarded-Encrypted: i=1; AFNElJ+iRueN2h7a2Fc9sLOiwoinfMJwyJzFfxjA5Q0yybxmtXiF/OdHu91/0/qXSq275Tsq2PNqRc6myP+C2S9f@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1UDgI/N5M8aRb7E2ny/lnrWrpj2/8IfN/L2iXKtGGSUMl0p7S
	Bxc8MwctSgQ5xh7a/8siKliKk3uvSQ9TKLz09kXA1wBtiQEw9RWKSLtNSJ7EA8Vy9qsstK++t2E
	PlHH+AO/vSfTqjkXA9q7cLVwm40U3kP+EXzRjTWRaXJzaf0klP3yBKDrLBhDrRutCF6Jb
X-Gm-Gg: AfdE7cme97EGkZw4iovwUxIJsUr1V5fxl9lHwFWa+20CJgd59tlfv7OEyjkoTMBsTOK
	5ORQHWeWiNX9AF96JO9YbH73bm6bSD35twadLCr3neHpSsYGTPkXHVvT4gqeJc6Jqc0ATlSvODE
	sskA59pw/aWChljXyU3xRzFuLE0mrPulM8mvy49R0gUwPMqr9oJHG8UXUuyUiy9sv5mvBUjOaSI
	uq7YFUzdx8Vz0h8evig1tLpf2Olgcvieztq5cJ28e3LGc2D07rD3gRSwL4yMmMNv5cBRsniaU2O
	QUl6V3X/rFyxZORty0HTrmFBx9eI6sEVzatAcexnugVeTrNluxVBB4oZy8Eib7uwewy6+xtiGRS
	Wy0ub87dElWni0Wjnw395xy8+OvGgP5cycGg=
X-Received: by 2002:ac8:5f83:0:b0:50d:a92e:fead with SMTP id d75a77b69052e-51a728014a8mr13182611cf.3.1782382944032;
        Thu, 25 Jun 2026 03:22:24 -0700 (PDT)
X-Received: by 2002:ac8:5f83:0:b0:50d:a92e:fead with SMTP id d75a77b69052e-51a728014a8mr13182371cf.3.1782382943539;
        Thu, 25 Jun 2026 03:22:23 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fb8dc641sm152400166b.0.2026.06.25.03.22.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 03:22:22 -0700 (PDT)
Message-ID: <df35362a-aa97-4cea-a18f-2bb8b2a320d9@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 12:22:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: qcom-cci: drop custom suspend/resume and rely on
 runtime PM helpers
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Todor Tomov <todor.too@gmail.com>, Vinod Koul <vkoul@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260625-cci-v1-1-a100cda673ce@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260625-cci-v1-1-a100cda673ce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA4OCBTYWx0ZWRfX/CtBun7X9FKs
 vLTllGnop/wREFHM4HqSitQR6N46bwdtEAl6Ik5ng9WoxE974FBHZt5wobkDgB10YtjAz5lF3gR
 nf/ywQBeTSsnQrsiEuO7Ydy1YOVQk+M=
X-Authority-Analysis: v=2.4 cv=RJiD2Yi+ c=1 sm=1 tr=0 ts=6a3d0160 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9YL1cksPtRnqhRk4DJMA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: S86b9LxNmdhBRdb-Uz6L-oLJkhoECnNd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA4OCBTYWx0ZWRfXxQtlLfwZk2Ka
 4UAcYiD58q7frsWHTM5LAwzqhT6FqSESCyugCxbHtda7DwT+GTmK3o9C822HmIBKRDFPJlf97H4
 oXfbtiCJdSJpx33qa3tyIPAyX2AePfVKHZ9xcxv+uA/r5Yy0s2SwIYRDvN+oMnxRwcGDqhNScqV
 GROiGyJNtI1NQDf4Aha6Vmez8G6plbrOxXhLJHJeyj2elY7cUkDiVCK/FsJaGXvHfZA4JWK7GfB
 ckS3eEcODBKqll6b1u54GCos+9uqZ181xrrk0eqt7H4wSc/urvA67rypbebzoc+360iHca8TK9d
 DN5Zsg5XBV3E2PlweiTrFEzJu34bnwQ0jegz/Xj8herACyIBuoE1jjqjVdtEBvXZLTx38cSlwAr
 BSGJxXdSRu533BIdGgMiTV9yIP/E6ZLwvloPPJJqkwRKS+9a4GaV2lpBvRYPjfHJWBQ6HVpBg66
 4hRVnKEYJBf3HX9udsA==
X-Proofpoint-GUID: S86b9LxNmdhBRdb-Uz6L-oLJkhoECnNd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250088
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114501-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:wenmeng.liu@oss.qualcomm.com,m:loic.poulain@oss.qualcomm.com,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:andersson@kernel.org,m:wsa@kernel.org,m:todor.too@gmail.com,m:vkoul@kernel.org,m:linux-i2c@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 920AD6C49F4

On 6/25/26 11:42 AM, Wenmeng Liu wrote:
> cci_resume() unconditionally calls cci_resume_runtime() regardless of
> the runtime PM state.
> 
> If the device is already runtime-suspended before system suspend,
> the clock is re-enabled while runtime_status remains RPM_SUSPENDED.
> As a result, pm_request_autosuspend() does not arm the timer,
> leaving the clock permanently enabled.
> 
> Fixes: e517526195de ("i2c: Add Qualcomm CCI I2C driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

