Return-Path: <linux-arm-msm+bounces-119208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Fp9iEB9hV2oHKwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:29:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E9075D01A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:29:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Pqiw3VYI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OKCG6CXp;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119208-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119208-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F24C30C3324
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 10:23:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9727E43FD0A;
	Wed, 15 Jul 2026 10:23:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618BF43F8D8
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:23:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784111031; cv=none; b=Wcrlho3LEKd1CewDC0/JjzL84lIugvfyDdMbEv8vT+tB9wN+GKVN+NKSQloUbjb/QGFbmLzhAK0FaqX6ihFzlXY9Waf2dust191Zq2aOGvcmIgcDZP9+UxPyST2CxZq3n+uNC77C6ksGL1ths85PTWjmpoXPTmgnRMXr03n00d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784111031; c=relaxed/simple;
	bh=dolCZFloOHyIdVTD7TrCs6lUgDEHNVgJlSOuABpT9eU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fyxeqUdE5B6nHHSfo0LOp9hsHNsXUBE+TnDYBVCW4Vnyoz4EXD+GipEj1t0xSuiX1/3SWXGSQB5TlyETBArw+CiTlwDZfM7m6Nm9boAwP4Rf3YMrJ3qiiLPgPfEuSHjQpspaXuR7szcwkdRR6sx0/rHv0ci7yncmHUiHM+fR01Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pqiw3VYI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OKCG6CXp; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F9RA8F3143682
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	usbf8FGUCBoK4wmdLpHe+mE0Ra/HMX4Li1R3SmnHXbc=; b=Pqiw3VYIXNzB6POK
	teq0KumgRyghnQEzmFvNtSO9JNgqRUVE2GRUoCCoAH8ZAoqGR1n+WGCkNazc4DGA
	U/IVJAsCL0nQn9aczPE5HYsQk6b9HqsAGqZAXqz+1Nh+zR20kZ6WGZk4XTxn8wu2
	OHsHkWin+J5Rgq6HCrfzb1MawHnnpC5zUp017xXoTLfOrEl/UqS4P05PjnEOjdVf
	9TMf1u85q5ht6E9U0DwKkR6o0pzIZ3o8AZXDFeoO5sSNcTupg7DL+OX/xprYLLc0
	kpWB+G6KF92KlBZQ3cKotqHaCl05uHOTpIwpkZqwb8lH+MCvkYwHwTdbhlLCZLbl
	Sqkqew==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7ka86xu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:23:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfe75b7dbso13611711cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 03:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784111028; x=1784715828; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=usbf8FGUCBoK4wmdLpHe+mE0Ra/HMX4Li1R3SmnHXbc=;
        b=OKCG6CXp1geUlOwjpwUNYjbrSDO2Rm94wHCegAwv3rNvvMt6Qte1BEqpNh43VB03zw
         t+8hPybgJZNEcTYLC+psUGev0h3h+XDgQxlFSfxMYKpE1tPZKT3HFcS8kednTgLZlXWl
         mjnsdM52d5XJ3MXP2L/JNd0XvXVZhgAdbFyNkNXIrOZI9wqETvqHjSzMHJEaEIDjInhL
         8SHOvqAXaZBDG9CZF5xRYTf9Ei6nPVwEn9Qkf5SdgV302eNt//M9TasthNLf1Q8prODD
         6jcXgeJ7ONNOPIXDfHLx81oqRVkfKAvnyjLxZIHN7IDB0cv1L3jVFb3GvnXOYQ5uBaOu
         ZOQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784111028; x=1784715828;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=usbf8FGUCBoK4wmdLpHe+mE0Ra/HMX4Li1R3SmnHXbc=;
        b=TCFR7ySYvJaEvwEaEoKr+8nMvG2ieLmCVLgRLh5UShMB2du6mGsoxRwSxOKSL0smvX
         MXqDpjPs61eaewZO+dy3W21HMK9XwnVTmwUBcc5+Yvthw9GGNvf5YtqDhbd/CMjPuehe
         PBIWDu/fjpMIApCFgRDW5blmjk0akkRQxRW2O7hutgRIYCsPwbsUD/3gwWeiwmA0kZBB
         VsPGn8rFY45o69oKg4OQuX04/7Wy+bjkWlAiltX0/u3xwP6UJKViRYuSrE9HDf7MeIdT
         tJMu17p6UNnMtIhi4SqkJdBQpSVUcW/5yEbob1h5uV013z1N0nKnEWC48PYbiZCRsvUM
         +a+A==
X-Gm-Message-State: AOJu0Ywk7zWbIuv+gnE/T3xf+me4yM8STZUkULMe135oT+vw2M/uODtn
	Ikuh2yOfHCm1p+7uBIJPq0DG4MA9yyWDykuyQ7rAt/EerY4v59EvenFJQHQyisZonKVqddMljBx
	r3xSSqYwHpD2GSxzfb/GucSUFD/cFlwTdE2/nqR2c5pVaJWcaQg/pFe5Pjw8qKhJSJ0ET
X-Gm-Gg: AfdE7ck8jMXc+lcBrJzGDTM2A/d10KQGRfxdn9Erd6eXV7ZXeC70eM7TXJbfjIIeWYP
	oWRFpXQpfZOJLrQtPLiy6CpGQwx5oJB602/96r4YOuaaYNqNxkVzE7GqExLttJE/XuTulZGfSz8
	/0X/NtCovT8Umo/DBrpsUhjd3omMx5zs5KPn5UlUDMk8DYQpvcn3vnsVYstY2s/pjEJ+tBxngzZ
	k7HdQD8rFznmZ8pwrhtea5ns2UElQa9nunAI6U91dNhGEFIreCprstHbkt6kWuzQbBUAk1zdNW2
	zHDCsOCqbVVPwIe0RmwiA7doQnp7dGgCUjq2J9oRS5vdEl0/u6+HiWRk+t00yzN0arUHGiU5LO5
	wRGHF5/B1p1X8IoPEcjYg4BrLju5rP/mQPKo=
X-Received: by 2002:ac8:5f13:0:b0:51c:215:3e81 with SMTP id d75a77b69052e-51cbf0e8ca9mr134730221cf.4.1784111028224;
        Wed, 15 Jul 2026 03:23:48 -0700 (PDT)
X-Received: by 2002:ac8:5f13:0:b0:51c:215:3e81 with SMTP id d75a77b69052e-51cbf0e8ca9mr134730031cf.4.1784111027799;
        Wed, 15 Jul 2026 03:23:47 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15adb30f98sm1327760266b.55.2026.07.15.03.23.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 03:23:46 -0700 (PDT)
Message-ID: <7218baf4-df73-48f8-bacb-514ac3cafd52@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 12:23:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] remoteproc: qcom: pas: Add Eliza CDSP support
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260714-remoteproc-eliza-cdsp-v1-0-32eb7a1f2c59@oss.qualcomm.com>
 <20260714-remoteproc-eliza-cdsp-v1-2-32eb7a1f2c59@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260714-remoteproc-eliza-cdsp-v1-2-32eb7a1f2c59@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TMF1jVla c=1 sm=1 tr=0 ts=6a575fb5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=FtAS-mdK90XYVRSJJl4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 2mGMO8VxC2XlAAFoV1GwCEkCrH5gAtY0
X-Proofpoint-ORIG-GUID: 2mGMO8VxC2XlAAFoV1GwCEkCrH5gAtY0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEwMCBTYWx0ZWRfX0PNSzqyGqoZl
 pQhP8xPVNlzQl/0jZ00qu3FlRxnNeL2dJBgUsJBY7Tmyj70+GckYYkbi6ww5Ar2QvsijVuj9w8E
 W1trt29VubjTIWin/EZpjJ/IN9nwIzU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEwMCBTYWx0ZWRfXzvu2S2wALa4k
 0Xg3AUFVAr460qpVwrE+iRf8XmSe4PwHv1cqWcrQATYfNiJvN8Fa1vEOJd2U8NWPnV2jj1Ti9/m
 wyeR7VJldGSchpmUmAjad/8VSygLSlR2ViLmYlEvm7Tmegj8ZhjzdAWQUqR/yZxcOU0X0TjgxEE
 osy3YEZ7V+Lvzke+F9qTJAYUU6NEIoCYEhUomOLn18pGs01YS5+YWLsLpYIx1fU7Ue5jFZX044z
 gxYgMdzxTmR+Wp54Nzdu26YgKUSd3gSf4qkdrk/K+nU+yTWIih9gqClHeXY2tvE0Y3EG40ieRPS
 aRr3de5/8Ew5q/eHBjRJbNmJmfKWN/Cjj4a8Q2yO0ongv0i3Q7LOe3EzbqyngluB11wTlr/ujbv
 29qejhEqDIMDRzv5JrcKwWLxJXGSxYUELSWLe9e+Ig6aUva54wsKTZ1z1pLu4CQxKmPL+3TN+l9
 JVP8nVvOaZNZzOq3TuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150100
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119208-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:abel.vesa@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:luca.weiss@fairphone.com,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C8E9075D01A

On 7/14/26 2:24 PM, Abel Vesa wrote:
> Add dedicated driver data for the Eliza CDSP remote processor. It looks
> almost the same as for Milos, except Eliza needs region assign.
> Tie the new driver data to the Eliza specific compatible.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

