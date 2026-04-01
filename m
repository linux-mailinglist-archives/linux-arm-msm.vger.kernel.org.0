Return-Path: <linux-arm-msm+bounces-101294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFXUMejxzGknYAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 12:22:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D0637868A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 12:22:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C6C7C30FFE6A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 10:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D878B3E3D9D;
	Wed,  1 Apr 2026 10:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hipIgZFA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fvk0hpCT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C0D3E3C44
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 10:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775038614; cv=none; b=WWY6LTuUgoS6bzy4rOwJz6iOunIdt5kTJLEV/R7XBWc8ECZ41afQ0jxT+2DTB12h8Us0Oi1dKDdpqN0DP07CoslXVs411cN35LEeuqjgG2IzI8iz7q0cRm6iA5TrRUhvUcKUXSBnPrcx723TcH9t+gJnHqQJQONQV/7hdw7Xgyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775038614; c=relaxed/simple;
	bh=KBXycPxrmm22Jcm5v3U9Xn8DaZXKMm8JRTL98/PJbgo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=USEshAXIXvSQyipL8qWL6vj+hRHmJG69+4BHGkqvTqwsypNwdsOjP455x2gkXBYFKrV4le7GtZt0oOk5OwbU7pClv9rigITsmE0XlbGd3WVUYcUhJuY1NvL73K1kbwAEQZV6aGFel1Te+1CBt9eLAFtfXv9RHRrhVSa7D+XGH74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hipIgZFA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fvk0hpCT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6318ehqa1458739
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 10:16:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5San9duOFtJ5qhLmPPDELhjDDBAg/h5x2dywfngs1QE=; b=hipIgZFA+kNbvTtp
	mZR1XbTWGlMZ0euMAQk4acIN7vwobre3/0c6Sa5kKI5ehDi41HCmS3hoiKqpO6mt
	XWqamUfc3JYvFpXiepWFO3Yy+t6NyYS2NAe0MAwUH8XaUa6RVkVvyeFk2wdgIlog
	S57pVJM7fZDN+BfNKBdeqQgpdCE5fXqKVBYNvrPLqjxwnMvbWrMHm93dlL12mt/b
	dpb0a/PgvUNlu53V4TqrC/tXwqFfLBAy5ZDwAQ45LezR8effIyFFLj15g+EE5GMP
	i7T7cjqV3vERqjVy54pfXgMTbFnNR0YZSHWdky7J60Q7J6cKswerj554cZ0GoFeU
	fxnMPw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8uhg1kan-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 10:16:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d1d81dad37so13495785a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 03:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775038612; x=1775643412; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5San9duOFtJ5qhLmPPDELhjDDBAg/h5x2dywfngs1QE=;
        b=Fvk0hpCTJFSGLq1t+9sJBWc4AJINgiUOOKLYzxO6lZfHrRJ+M7JW0LbjR27JtrTEyI
         U1lHEAFwLx58d0GsUg+HknOBikRAaBCzXTrlALQ3WcHcfrsxxkuImfpvmTs/s0nelp8B
         6yVGBncK6/JbwCUWeljzQOTwIlRd6nGyjCvHRqkO36Bxm/5ToQ+aTXcDuMEqlPF31Fx0
         ccR0/6k9mEOPbdWmFQUW8GHjFVoagEQwacOmhYJhpl26885C6Vmv1VV/Xoe5nxPFBDsP
         K8MtJJ6Qs0RneNBZL4S1xfg0vAfbMn5P9d1oUkwFRIDBjEOv96oX40T2NgcYBKWbAy15
         oh4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775038612; x=1775643412;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5San9duOFtJ5qhLmPPDELhjDDBAg/h5x2dywfngs1QE=;
        b=h3QZDT4xPEREVn1eez85nq7MPlXupg1+itqeUzB5SShbbOwlyydz65E2shiavUYodp
         R0Tb3oZGd2uxB0lHXpgVfxcO67SbBwsL8Z5udI6MqvR5rfzGIWQZDRF5cRRGd3442nXk
         KmafiI4Tjb845e9AhJ3210ZwnTi5GVRUAUF3y9XLwtQymmXl4ys08GXretRNeyZUhag+
         IBIZqrjfxSXMPpAKD2JTKuFpBrVPCr+r0dJd0XrFgP+aNO7KbUEHlLGx0zrBNg5T+SZD
         iGo4wvFzbrKPxceoGbfv7fQ4i5S8UTuVcklcG6Yrv2M7fvQsM+iRVtwTrImpUF9UXXq/
         BkEw==
X-Gm-Message-State: AOJu0Yy502KXOZWrz5lLt9M12XZAmL0+t8cD5v3u91b8ImZB4EeKYss5
	0lsI+q93a7zYP2OeCTQ5GYZpyT8GrFtXol6uEmlB+X8/tgQbIRQxPAy2pv55pruX86aEw776SzY
	6veig6SRZXpQmofePBW3WuChxQIVLFqih+X+yUV4mVAKoDFvey1Yd25KZMm96AYlwC0do
X-Gm-Gg: ATEYQzx/kjqoPDZdWWGUOVv/Iw0+sFPD24jNyvnad/URBNZtus7UAkY+dzWhRrqGBJF
	WKyqmrmeHppH9sExrqSxNVeSa1GVV0zPfneTe8RlSqxoH+ApHcqOe8Ii/mygsz4+qT2nDhniv07
	ghK+NwH7cs8cSx8uHHC00EFnqF4Hslu3hFFiJ7DHRiXC8xTSd8ny3SHu6x0CH52yQgg5rdN0oDs
	QOFV8XN5GmGEwhy5Ltvy53wX5YHINcxCt8MH+2RPxbClLsJkwmeg3Pjw4AHkKMOW5hwx6/FuC7t
	5eeNDqqZLMQBZam3KMS4s4q3qag6tagHeTkNZeLEidPph4l2NJoaWTtfdGqCSzGc/H6dHVDGgBY
	ZxGvDICB7qH/fqGD8MqfNM/Q4fdF142cYyE6LwWNh55tlBEE/6t9rqp0htpC9LcQ2/2ESO4VRCf
	9ueH4=
X-Received: by 2002:a05:622a:11c8:b0:50b:2875:5782 with SMTP id d75a77b69052e-50d3bd372c7mr30208321cf.6.1775038611994;
        Wed, 01 Apr 2026 03:16:51 -0700 (PDT)
X-Received: by 2002:a05:622a:11c8:b0:50b:2875:5782 with SMTP id d75a77b69052e-50d3bd372c7mr30207981cf.6.1775038611558;
        Wed, 01 Apr 2026 03:16:51 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1ee612sm504969766b.53.2026.04.01.03.16.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 03:16:50 -0700 (PDT)
Message-ID: <f07b4d80-bb82-4ab9-afc9-ee06b48318a8@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 12:16:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/15] arm64: dts: qcom: sdm845-lg-common: Enable qups
 and their dma controllers
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>
References: <20260331-judyln-dts-v7-0-87217b15fefb@postmarketos.org>
 <20260331-judyln-dts-v7-5-87217b15fefb@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331-judyln-dts-v7-5-87217b15fefb@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA5MyBTYWx0ZWRfX5rAdeyAuUCEG
 ub8AQoXraVoYa1iFNyIWOPp1x0VjRupFEm1AjtyHCDt/IRqtn60HNTDztMTue/SsunbhYNSbtvA
 sYSkZpUhqy+OwtAAHDwgfbOHuou9m32m6Ibwa1bKNtDDJfTkvWnCZxdAXtkix0myN+4U5MR7h0/
 XLt7GVhkUUdw5Ir9S+92i6Dz1ccGdHmlE2fp1zpMzj+F39286LUuKlbLbtHvU+zboq2OaHz0fDV
 OB2buEuEQjpfuJesSY6AX619HTqfGobWP7/cs1siAg8QZFj5uLOiyZEjosAfcFxjXJjt5XQ2+kX
 xtOCPnkutZUtt1JaGGXYvZ/bagbhOgG3eI5FOoHt5g+nFKIIwuEdAP2+UBtF5sdpt6DOx4/VGy2
 /E/FNWKRrINCcjySjajtZ0xSkj5obuY+MGOb4BAEpYbZ3TEmJAyKk6D35a0SMcwUB4ZBEZfnEhm
 6jvHfRmYd8eFN1tYaQA==
X-Authority-Analysis: v=2.4 cv=YcawJgRf c=1 sm=1 tr=0 ts=69ccf094 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=yndPCfnnJPvdZL5cpNsA:9 a=QEXdDO2ut3YA:10
 a=IQdlk4_VRkkA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: 2QzIIxTfI42eO288PPMiAO02FzOE8B3A
X-Proofpoint-ORIG-GUID: 2QzIIxTfI42eO288PPMiAO02FzOE8B3A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010093
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,tuta.io,gmail.com];
	TAGGED_FROM(0.00)[bounces-101294-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,postmarketos.org:email,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 41D0637868A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/1/26 5:15 AM, Paul Sajna wrote:
> Qualcomm serial communicators required for i2c, serial, and spi
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

