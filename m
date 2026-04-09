Return-Path: <linux-arm-msm+bounces-102431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFSENp1h12l8NQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 10:21:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D43A3C7B20
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 10:21:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0D8E301702B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 08:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D05E3A4F47;
	Thu,  9 Apr 2026 08:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q7Nr9jCU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RonBwuNu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0213A16A2
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 08:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775722643; cv=none; b=Bwm1aytbUOHCi0bmQZqr175rByhQVTNO4LNINlPUA1l37h1hRtR3+DiL/3BB8y7HYvukJjEczP/rKgOG0S/7Fr1W5s20dY8Ese16LPOGGphNwLlz8/pCAteCUX3y6Jaosj2teWzQQhD3GCvVSfE37L9+F/cRRsC9vRIt7u+Xi4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775722643; c=relaxed/simple;
	bh=totwhvENBNF8lsaeZIFlYkhK0o3Zzv788+2z2zVDsxI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EJYgcdTjgR9LrISKtwzi6ReI9dvhly8twuvrImMxhqSP7nGeosNorq4IzhyvRbFcf3Aq+d5Zayaq2cbjIJMsGpy2ILDaqiCD3i2ZSKs1lCQHWtg4WphEmHo0DrIPmWLOGeaRpJzXBWXOHE1dx6NUIWHhQjsQxUM6szD+ZifSMag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q7Nr9jCU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RonBwuNu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6397NqxR674529
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 08:17:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BxSRWVJFhTfuq67blrqNau+EN28Vfo5z6oDilIcjPXw=; b=Q7Nr9jCUxLE1/9Cv
	8+8t5mFirrIPGARD34c7q7wvTtvoBuqgUeJJhhdHu5wlwzy14r4QUl/Rc68bLO7/
	oLnkT9imU2Nvh/WXejsNrbqxNxbHbq/a2wZ96hW16aH9RVF1uedupq4Pu02YdL+N
	18B1iNfogLMTijIRHVHxNcZgYKGGP1LQ9MyPapQofNhojAQtK986UBfDk2PT6XEZ
	LdVG85U8kbp/kuvLAq5KihkTX2FDLcc0Tkb/KIbeAI7BgQLZdZsq5yzMAFrvTS9D
	l5OwFyMZEasRgx97wjZQC4LCvzO4+bJLiFfHYI+hHjcapEwXimBUM1prHU5ku60h
	UouXIg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddtbmu3tc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 08:17:20 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8954b9b5da7so2603806d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 01:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775722640; x=1776327440; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BxSRWVJFhTfuq67blrqNau+EN28Vfo5z6oDilIcjPXw=;
        b=RonBwuNuQbAlfSaTsVsn3q++8CRlamQciXuAZ2S++vQmsusAjRIvrqsQItszdAeiny
         vo73vMupaMGG3seng/wZKSovvvxQfa0c2BRRISrAYNpKyjkovK9DTcCJE+HkdTo4XeGk
         2QR8nKZxIB3oyxnW9kGDYwIYN8QSGjBmZSKhpzLPxrR1HiL3ccWFIt3+TK9M3PuGozHg
         sOBcUy2huipm6jgbUwn6YpDA8xYE+pPE7EiqGK6T1Hy4uhTyoid2aOFS0qnlaoFXgb3Q
         Afclo2QRmyaB2UB7QbPVtKw76MQ9RuJXTB7NA1c0ui9+/9XLsxTWRVHYjf7VH9k3eEVJ
         fCXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775722640; x=1776327440;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BxSRWVJFhTfuq67blrqNau+EN28Vfo5z6oDilIcjPXw=;
        b=X2M5cOhjCFCJTQxoEzZaxnj1jumh0k8F7eMOpW2N/jJmD+AHpHsTzJ65bT5Ep4NXGj
         deUSlOm7noJ5bxZvKiJa2A+UZjOo8LP1xkW2TxMAzftij7UIjnlnmKcwRn4P+3eJ6B37
         bASKJt1AzqjzdFCr7j3fEa6P0PTqsANowgy4MrKkgoxK5ET1RVuUD4WUlN8ca/aTjIxb
         c8cPQBtnqPhHLpKtI/3InEJotuXr6Qvd+xqQdaO8wUkocHS4e1rJJh11kjGDf7XMdfb8
         8U8NLIiI2CfIqA94H811Q22bUP/Pa1vw1Z1h0XpuqhtH2kyvZnS4A+x1maLym1vRw0CV
         RtXw==
X-Forwarded-Encrypted: i=1; AJvYcCXL8hBtoYZpBu29LeRzY2vrPxcveFC+1VrhDmmRd+9dbFSIz6ukSXK02kVmSs+/yHcOhTIZUz8EUO34TpPJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3J+HLTnfD6yTYxx8SLDmZHgpqC3RH24MFVXDsmF3LWdQ3CHLI
	31/OrLtYqdUeD1tuyewre8KERX7oXkqPbnvJTM9lv5/XwKzwR/J2J2Po95E6sbG+rjuGcMeHUBR
	Scz+REm/zRulYrHdmxxVC9RBZBX6gkv9y/zmAjrMzosCbpYyKjbZaYMRuSCowpIYdqtG8
X-Gm-Gg: AeBDieuO3HXqod8dv+iW5SKSJDkZJGAcnF3ZU1lFjL1+NVO+dtEyI/nXT69JKeF6WHV
	Qo0X0xEVRRmweu8l+YCF5MGqaFiFiVazITSiR+C3nRHYai5eo12Q0UN74bYy3LNMQ/DjRoKmEs4
	jlpRViVI6Rb2vuhTDTaX45cPeeuwmnJn6o3igsb0Vw6gMPO/0JVcoHu11NbE9GWNa/bjzuKOsTA
	0InC83ey95R7DANVij+mxojY66k/KUAYRCELoFp7QYcWT6esRuhS3M9pN6BUHvAkNGf+fg/ANxQ
	H2UKLsrQgshoI06YOjbpseupKsNpuSDgSBELWyZdOlpYzLzbwNYKczHaY+zNetsoqwIW1U204nA
	zmeHq6rtHwNHDBlW0b5NokGEIYxtZ1vTxuv087gtnoSIxBGQrB2acbblcP3w4ugoxHGWTPASTct
	DGZE4=
X-Received: by 2002:ad4:4eaa:0:b0:89a:732e:f805 with SMTP id 6a1803df08f44-8ac640bdf61mr79343596d6.7.1775722640100;
        Thu, 09 Apr 2026 01:17:20 -0700 (PDT)
X-Received: by 2002:ad4:4eaa:0:b0:89a:732e:f805 with SMTP id 6a1803df08f44-8ac640bdf61mr79343426d6.7.1775722639737;
        Thu, 09 Apr 2026 01:17:19 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c99fc09sm721173566b.17.2026.04.09.01.17.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 01:17:18 -0700 (PDT)
Message-ID: <4c5a5f3d-c1c9-4b49-a045-3c2994adefc5@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 10:17:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 1/2] net: ipa: Fix programming of QTIME_TIMESTAMP_CFG
To: Luca Weiss <luca.weiss@fairphone.com>, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260409-ipa-fixes-v1-0-a817c30678ac@fairphone.com>
 <20260409-ipa-fixes-v1-1-a817c30678ac@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260409-ipa-fixes-v1-1-a817c30678ac@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0BZ1gawIPrNLrB_ofkp2G-BiQdv7Yevi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA3MiBTYWx0ZWRfX4/m8MfoUOytv
 dTtUU1EuTFimdGqdWfkdvGJbV7IejIl1/YRZjn0nMDUr5Kehlx1yVl0uIBaflZlnJzprvSxExTJ
 a/iCLV8TKT93tEGwumI6l96Vr7FlinJNHH/9ppuA0MtDAPhx94JeD6kYj3tZdH0szUWI4TDbrRA
 kFhHBc0PnNlXvhwMqzrH/TRUbg3JXYqkVlPIxgtAixSF2PALeMTe7n+1/QhiPqNVeJkYah1trW6
 QZuK+M1AVbs0A4d6twEMUprLlvQ+4jHT2hr6uo9Rk45cEOwrfdvWbE3Gi9wGmDGpvlfxhKha0q+
 8cygD68pfb0hW2lXeu4vtdsyyFK4VdUudeQ+jfYrYslGQ7i5i8p8Hxk7hLAUBuUOf59DXwI33lO
 tz5lXThBXDJ1RcCw5iaT/uwSpZFl5I0zxJkKlOlGXWHANs+07UsjpiSALzZp22exNAwqKc3+BxU
 p75EQUwakvtZCJc2/cQ==
X-Authority-Analysis: v=2.4 cv=YM2vDxGx c=1 sm=1 tr=0 ts=69d76090 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=c92rfblmAAAA:8 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=3mzYr_IWz7iMthFhtCsA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=GvGzcOZaWPEFPQC_NcjD:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: 0BZ1gawIPrNLrB_ofkp2G-BiQdv7Yevi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090072
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102431-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,fairphone.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,sashiko.dev:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2D43A3C7B20
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/9/26 10:13 AM, Luca Weiss wrote:
> The 'val' variable gets overwritten multiple times, discarding previous
> values. Looking at the git log shows these should be combined with |=
> instead.
> 
> Fixes: 9265a4f0f0b4 ("net: ipa: define even more IPA register fields")
> Link: https://sashiko.dev/#/patchset/20260403-milos-ipa-v1-0-01e9e4e03d3e%40fairphone.com?part=4
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Ha, nice!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

