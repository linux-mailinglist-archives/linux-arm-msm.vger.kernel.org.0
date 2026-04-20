Return-Path: <linux-arm-msm+bounces-103686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDvhCgbf5Wk1owEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 10:08:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AE406428030
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 10:08:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AA0D43020867
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 08:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32E3F38643D;
	Mon, 20 Apr 2026 08:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="phocj96C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UU0f7/GJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEFE3859F3
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 08:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776672487; cv=none; b=D20Dozlxz8NzkAe2phccWN/KrVumTjwTB8+5xW2DRMbDrjuUL1SVGirmYQMFuMyQS7/MeZ59qs4Lx9n3IMFIizVWgn70DvZGjiLU83BeXgkQBK8CaujVcQcGYzyT8FxPyeQXrrxCBVuaXZQAwuBhA19tSMKv8Y7/4KT744Heq+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776672487; c=relaxed/simple;
	bh=jGiGBgpSJDf0R6gUsM1wzkCE7QVOWEaOstOEYgqOppk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mEuz02SdLJtA5hB2vEG39wmkVzXvPiAP0MV3c0DgD24WTxW1yEQHAKqxZexJpKYXUsKd/Cf0TCleiFNoXHpbCWnSJkjxMe+KYRTKQdNg6cY/RFZx+TUVguX885JEDfDkDWdbTN5tmJHZUB1stoJGt0b/v8vZo4Swwt7Uy7hgkM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=phocj96C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UU0f7/GJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K7LbNB2386855
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 08:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Eqn8xTQ5yRUgRM3yHCiHxICO4zI2SMxnbZFI39MhF0=; b=phocj96CmTGxMZvk
	8/+P99Zr1w6KI8e60aJcG3RZiOwfnODKGqv9OjJSHiwdGRxYyaKknApX84+8CPmp
	Lqmwfcz+0Ln9gqYQx4ksximr2nYn0pWTjAKoFL0zOmVzaPRLGz+vegYDJfEuiIib
	YJDjPfRZIK+odwItfIuOdfMOBVdP3DKrc8M6NHswYoBjJVKZ4sDllUqxSgv0lav3
	Ihgy9u1N//SKlJ0Th2YtZCf0M22MihqnBR0gSQx8td+Z+wqw3ukYcXO8xHFKaVTi
	c23y8CzlPn8s9kG95v1aM9cFcOWrTKdPqCHfPSFVG+Rza0hWhB+hr+u+0KVYuEdH
	z1/l3A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm2qamts6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 08:08:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50e5d7f4b63so2004981cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 01:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776672484; x=1777277284; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Eqn8xTQ5yRUgRM3yHCiHxICO4zI2SMxnbZFI39MhF0=;
        b=UU0f7/GJpZAar+Jx41RYAYDwlmIqKx6sdkosh12JG6qyb9RIPFj9mZJiFLuuD3VGEI
         5bFkWPIzlVXyl+DWduopS1QajDkM3rSDHQj+OX4lzVxrEt/+ymC5MTQOI4TSXd+302a+
         MrB+yTweLyAxEi/bOdevsDWrU5ILAm4mkLDg5FagNBBk1zWiaUqdQl/zkdZmRavavdrj
         M7Emi6prXcSZ3OZlJqxxaPACeryeg4SypVSKpJhJ00slPNL4RBveDUM2fs/cmKJ2/eHF
         wEhoxZOVhURfqpQEoc39iMLJNFOFITbQ+iDe/+cQ8CMVi4DLjYXAAhWw8Mg+fIcKpYA8
         vwOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776672484; x=1777277284;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Eqn8xTQ5yRUgRM3yHCiHxICO4zI2SMxnbZFI39MhF0=;
        b=r56xxzb5YZiht9PBPEmWG9F1WRxeGevYRx3AX8IPdA3ynSoDDniv6FIkep/RWDepdi
         w3L8rokFrQhVxKrnhsj3lbqtXYKNRzkKEe+QCEo/4ae/FHh0Mha/ci1WFbXGl/g3uhRT
         kwR+1gvD1I6FbxgmkbRCflKdxbkEqX9NkQHKmihX7nT5PXjwxfLnMiidM3snvO9SzKAO
         dVSbGYSHIxh0IF+8AFKdcj56POM+sOVw5bXQ4pRyOjy0zzDJviPxQ06jn3OZJOcRoKVC
         P67UqtTPDWXUttRDA/T9uKyVogEbBNNd7t+H4cO1kc0lSmD+j+LM0nLQ+xXiyHuwBQ3l
         8gwg==
X-Forwarded-Encrypted: i=1; AFNElJ8J9QqXxSpsW/u0aZYLi/aQA2Mj1Ik6xLu5+CuIgR2IOYzU0Px3hybnCwieo0g4UAaM3MPdNHgg3pY6OlYr@vger.kernel.org
X-Gm-Message-State: AOJu0YweotiUcEuuGNfqEP/+LLDI1RDQh3bfGcPVfbUK8UMUIWtcZMwX
	fLYWHRVkeUG7on3WGeAV3aDZutvGfwxn+ZQVys5oZEFxl0Cieoy/m0D1TqdpcKLWkNn8KN26m9g
	IucSyX6nVs5HVsTJUR1cFVDUpLjIjHV9Sgmk3PmJJZKyWwocEYu8BEsMWNSWCa/oBcUUUq3JTKa
	1L
X-Gm-Gg: AeBDiesgSfQBFpQpWUor7J+YG+0CWqNMotY8YBRhE2dhNCiYK2wipBGpZf8VDjjdqfR
	oKlejwleCMHi+2uZ1vPHyJ44cu2FHu2nPedXPbQATe10tr0IOL2ijuc2YM1TTW9tXX4N1vLBCZS
	4MRYRm/JlC0uHg84EAiwt+wuNh4Ibt3e46rx1G+XQnTDC6Uy2AQlXVFmpfJRZ3Pu3YToX4eC/V8
	Y/WhLe/b/d5oaLH+0oqHK4cKrc3skTYOLgIsHd8eu2kvF8SvZSH30QTZ/5Uj8pxb3c1rRKqB7sD
	q1Mf+0DdkDvYUSlWBzCoXZkWvb9ShI997L1KD4kndEkxn5OzBV2eVkPrr0ZukyI8nGoyxJmTbS6
	7ZLD3M/8Fd3zZzl1mNMC7zGuKAtfey1lUhZUN3cicUQwNnbddoAsX76rixHSvGpUS9MR+hVGdQG
	CO12NVyKwO1hy2yg==
X-Received: by 2002:a05:6214:300c:b0:8ac:b4d5:50f0 with SMTP id 6a1803df08f44-8b028162b50mr137389286d6.7.1776672484103;
        Mon, 20 Apr 2026 01:08:04 -0700 (PDT)
X-Received: by 2002:a05:6214:300c:b0:8ac:b4d5:50f0 with SMTP id 6a1803df08f44-8b028162b50mr137389056d6.7.1776672483692;
        Mon, 20 Apr 2026 01:08:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba6366452c6sm182920366b.11.2026.04.20.01.08.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 01:08:02 -0700 (PDT)
Message-ID: <cadc3a2f-dbe1-42d0-bbca-6a4273747c3c@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 10:08:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: socinfo: Add PMIC PMAU0102
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260419131523.1232835-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260419131523.1232835-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: G6H3N0VJG1SkbTm9iACmHOJMHmw_OptR
X-Authority-Analysis: v=2.4 cv=KdDidwYD c=1 sm=1 tr=0 ts=69e5dee5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=FE0JCe1nNlBvAKogSaIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: G6H3N0VJG1SkbTm9iACmHOJMHmw_OptR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA3NyBTYWx0ZWRfX09pV7p3gHQLv
 CtepRNGYWzgEiEpM79F6KMrNEik5JBi9IoR1tIS98pNgpKv/Q5rwKByLIfXmkGePEVyWesjzhxW
 5leL6YUW8DNGx+9Y6iWaa6jy5LFYUc+brIhv7E+heLkWsQeVmC2Y7vkIOgCK14m3gIzzX33RXro
 C4hzkihXLRQjFZRcbMLWy8QCGCLaekipzrQXJnDJbSHpgCL5xMTzSM9Avme41xdqtNup02Sqgft
 atb7/edOAj+w39l+N8vuKH/sOqxCHAE7lzg4UaKsv3qlHL5lO7NtJH767Sz8eIQrv8FVVOdV+oF
 vVgWDkzeUaW/IGnhaHIzvHoNMJ1qrgiD9Ks+5AbtIIIUz9R6dZ0RBTu4riUZNnAHVC4s6PeFTFS
 duuwGKkxHAZXshl8+wprngMok4LZu7vsoPST8WHpktUjfik+vYYd5Js4Gxyna4n+Xp7pK5zrYXp
 YoSLiC8EtS/8wFoLCCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200077
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-103686-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AE406428030
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/19/26 3:15 PM, Shawn Guo wrote:
> Add PMAU0102 found on Nord boards to pmic_models array.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

