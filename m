Return-Path: <linux-arm-msm+bounces-117322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tPKACUv/TGrntAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 15:29:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8704871BE99
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 15:29:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kYBbUyfQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YwvDZ0VV;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117322-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117322-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B83A73005AC8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 13:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DCF0417343;
	Tue,  7 Jul 2026 13:23:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EBA414DD3
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 13:23:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783430637; cv=none; b=hVG+HFlB2RLZ0w+BU3g4DUzpuP0H7AcbEVn+pLYRNp6IXBmjtkwYNNssVzrFHaqArfvTiBCNsQ7f0SRVhhKWXkS2h6WHgfaJXFI9RU2+6n1+skIJ2e6S1ZYF2xhs/xZpjd0MCQrtldl4RtVzJ3vTC1vLnrKiFkxVBWPW4tBdSVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783430637; c=relaxed/simple;
	bh=/CzW4y4xLjEPhP9wVONfumAXuS2ptZjJRj7gEdzwUMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iJ0Ynfr436SOqn90iwW5MmFtNaLJT5ZxaTfP5QZoO8Nw4W13LtZSDOaE/4TAHI0kCYbMuCwxCuve+3zXiOX8150+wbEbqdrwQeTK9zcA3yK0eJPimJI1fQzGqxmmLDnm5rr1VndbAjb3REJzDoyiU7BLGEeopTlZ55rH/6eZAZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kYBbUyfQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YwvDZ0VV; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8tRq3542115
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 13:23:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JkIjxZMrAHcsaaGSniPtOPxgv3iCKSb8ywfyTMLuMtM=; b=kYBbUyfQE6cdZ9jr
	GCXKGLQKE43RgIWqp8viDxqPSM5i94aHW4zXZa6aZnayqBJE1uetce1dWpQER+7N
	xqryPuxKqKCyUt/a0K5vGZJJoN2MZfh04gBvtuT26JAVD9bwAHPAws9dzvm6+QYD
	/03LGxTd4sgwdoT2QtIn1gqn3MBYx3oMQwA6LY2u6h0o1vnjo+nUO9bxkuUNJkmf
	3XAdJM+aQqoXUE8Qm1ZWB+bkVfdPaFG1tafrvfeAIaThTDybKvuqxjcJHUMH+SjX
	B0TVgba7g2f1Jxff+eLBEOmAqim3uTA7RW4kF4ZAV6C08la3hWxKe8VqhSY7dAoC
	29Y7vA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8su724v7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 13:23:55 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-966c4d68d91so761095241.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 06:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783430634; x=1784035434; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JkIjxZMrAHcsaaGSniPtOPxgv3iCKSb8ywfyTMLuMtM=;
        b=YwvDZ0VV7uzsQmVDxQcn7/PjuPo0lCNGG1NBlr2vJqULuAlUXdtLH9a30GGBDkROiz
         qh5Dvs7K263PaOYfvf6Un0dLgtcMCh4LHEpCkdAMi7nitKAjPg+Twfjo9vP62cx4sn66
         avfwXAlqmNqN6855ceB2WRErCWtWTSKfwQJbKiyGCxwxI3wV4R6iAnyWnrRxufZSOoGM
         FkRZfC4Drr/hN4QnDMh3wfyNoncRha9Tz8UOfSJmCMpPrAMqptCM6bH1IBRbe5+Z3N1D
         luc/m4CbyPyJ8VDy674wt2z/gcDz60gkTZr6s2ulyOIEA7wXcT9lg8hpSX2ZBRsBsVpS
         Y7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783430634; x=1784035434;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JkIjxZMrAHcsaaGSniPtOPxgv3iCKSb8ywfyTMLuMtM=;
        b=c7qUOakSZGOyFNFLNr0XN+CjBbcBJlhR7Gn/1w5j+DRZN5YaRpqpJWmzpscMBW+666
         6zVwiQer9YVJWbQ6+ViwJOlNlbhmfN48CCfBw0lqu2MwUhQmKlfj65KSpxMf94E97CvH
         PMXfUmVO4IT/omLnUKtxPVibdjRZKSsSuSluMX9UfFd0Z42RfkkE4awsC+iiiALNqZeX
         /FcPnjTztm9d+RnDUKTYx1ueAuyRskGzWG1Z9Gwfhxs/wMdppF6zN9soL9srUxPWdVVM
         v16w42Wd7CO2IRpmfXJNvZuxMTsMok42mGJR/ffxeBqmbKnjzFP574Gc6vYm0IunzoM0
         L6mw==
X-Forwarded-Encrypted: i=1; AHgh+RpV0v5tgzy4+IQQWNfX5eIosILI5P+RwLLeZkK21MO/hVztPiocowWIl8iW8AqvOeLN6W3PyxaNOqO7/4G7@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv9Jnd7kfOerhHdUz9iGUvlH7Zcx1SJEpZc1WniKAQKa54EST/
	MwMLHbKtSymTIJCD75tvm3lIKzU2dWt22uEfYpWCXHZryOfIgzBZLDoH2/Tgiiu5JJ2JJI9Sj1U
	DQv7O6ksXs9bIkJ/06lmS/TcVCju9NpITuyYM+T9LmNdRZEAnRW4CVucvIbg4kM4hByhS
X-Gm-Gg: AfdE7clY/DGBjls//hsz8Ghb2k9ToXkrO0W+5F7VfIfrsG0ESdf3Vlc9HOAQyYp4BeJ
	TjubOvDfjxCGItcbeGDZ3UAWezxXTJFijF9tCqwyx95RkfxzgCTh5XJ1YI+AxpvUUaDB8N2mtti
	fC9J7rReeYeIJj/PMGde/CGrJh8SIasitqy8CZ5rZp2gDwA8Ul/GXIWlRQWEc7PMosQ9I58mBgC
	INge2Z/9yP2MVrSoezebJSUDS16SC14duRmlXdSOi5mSzkaT+kj9ZfXLBQ+eIdWu24fYLYBWSfa
	QkKxoaYers+GOraDdsfU+raKac3wOZSOa3KtKHDjVP+5dm2RzYB85ZOzy2PVEnci4aSbfU3gfbz
	/ioYK3S05lRXrcoazpzffQIT5yWiSRyQmlp//5avrmKkQrwRxU/qHhu2yXG5V5yGO20NA1mWs9J
	oFQR1I1YMwZpRpINw1v/E4HgZc
X-Received: by 2002:a05:6102:1611:b0:73e:605c:4078 with SMTP id ada2fe7eead31-744b7c34148mr2407960137.15.1783430633936;
        Tue, 07 Jul 2026 06:23:53 -0700 (PDT)
X-Received: by 2002:a05:6102:1611:b0:73e:605c:4078 with SMTP id ada2fe7eead31-744b7c34148mr2407928137.15.1783430633319;
        Tue, 07 Jul 2026 06:23:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4ad357aesm26931281fa.10.2026.07.07.06.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 06:23:52 -0700 (PDT)
Date: Tue, 7 Jul 2026 16:23:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com
Subject: Re: [PATCH v2] arm64: dts: qcom: purwa-iot-evk: Update TSENS thermal
 zone
Message-ID: <itv5ekiokhce6eomzymtspp2pt6wucdfat5pjnb2smmpeqo4cq@to7n7cndmw4o>
References: <20260707-purwa_high_tj-v2-1-b66f10ebf1cb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260707-purwa_high_tj-v2-1-b66f10ebf1cb@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzMSBTYWx0ZWRfX46/81nUrKJWk
 qMSAuRLLHFcL/A5V6/uJA5EBWcTQrTciUL1ERC9jM/Al9LNKPRdSSJx/4iP9rRPDkVPvprCw8rH
 c4WzBvHb/XKnHXMlekl5SwAePbQ3zBc32ook6Jy9khcY/pVYmDYJAJXJGrGYQvrcX01UxENVjCD
 usiHcAn8eeZCMG0WMbGyjSvx2Wf7pLKKb4KVUR6oezHyJbFUY+/qSKc1mnPjWX/ZSBGEehV4gHp
 BPyUTnKLSZTsaLmcJTqoSmAx0w6TA1GOnsoBQuN/Cdszl0cLQp9BfxrVMULK55wx69vbS/qetOp
 WwpN7DpL/LW5tfP+fjDArVOV/ievk6WnJQtbximxJGf2npPbELj9zss6FU0zEoXH+BxSqjKByfX
 YtQJTiHNpwLwudwOA2gjAKblqZABxbil8eea6y/aJW3FyjMb3YnFApF2FBZ7qCeRcF+xSkHer0B
 2ZLAt0rwSEgmDuQyYxQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzMSBTYWx0ZWRfX9zHZ0OLm1z0N
 4QbgMNwweqnS586OYcixP+wtGG9ATMoidNojesSE1OqaNvovqo8m+Y8FNHZQ0Br82b5DzJb+mJi
 lZkVD1s8rhwx67OyYR048Z2a4FrlkQs=
X-Proofpoint-GUID: xbjcpAeNIbRMk-DJltf-hjXUUgJBCKIG
X-Proofpoint-ORIG-GUID: xbjcpAeNIbRMk-DJltf-hjXUUgJBCKIG
X-Authority-Analysis: v=2.4 cv=HN7z0Itv c=1 sm=1 tr=0 ts=6a4cfdeb cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=irIo0gwFZieol5Rq1NEA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070131
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117322-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:gaurav.kohli@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8704871BE99

On Tue, Jul 07, 2026 at 04:16:16PM +0530, Gaurav Kohli wrote:
> Purwa IOT boards support a different thermal junction temperature
> specification compared to the base Purwa platform due to package
> level differences.
> 
> Update the passive trip thresholds to 105°C to align with the higher
> temperature specification.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---
> Changes in v2:
> - Rebased patch to latest linux-next tip.
> - Link to v1: https://lore.kernel.org/r/20260416-purwa_high_tj-v1-1-b538f98d42da@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 32 ++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

