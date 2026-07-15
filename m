Return-Path: <linux-arm-msm+bounces-119195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id B4mSKc5VV2oDKAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 11:41:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EC36F75C9D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 11:41:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="lIedsx/a";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=St5MVPnj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119195-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119195-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7F783028F26
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 09:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CDD243A811;
	Wed, 15 Jul 2026 09:41:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A0A43550F
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 09:41:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784108486; cv=none; b=aVTvRo/saI+ddySz2aA0htk2h79D3JjKFrmI1b7mCbGHd8TC3bQDFXZuMyeczG7R7EWF79RuhUdtEcnW6WD4Ago8InaDr3RiR3XU1R8NYrw1DvhXy2maAUlUef0Oyev9c2bQQC8jIx5TbD0UmfOYoYQQA2Fje36/3M140NhaPic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784108486; c=relaxed/simple;
	bh=CZWjRFVhNRFD5KRdIhEjv8uNSh0JHTUy4wS3VdRGbpU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XH67A0J+4Movjwju4NaWakAY4sASTD/NVal/uUYEsFRHB9eZI/R6+kXT3SsBbJJmqkKsbIucJONoYrrsd11EcE4qq06xK1I8Z6e8G1ZR9GWRqYfm6f8ppj+AROAN5YJq81cVoT+AIsQ/q23/tPcZk3xB2nXdHxag0OiuJ7S1H80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lIedsx/a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=St5MVPnj; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F9bJjn2269601
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 09:41:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i0ovjxjsaslUBo3qllkswGA5E6toY8tNc/SHCtFB524=; b=lIedsx/aaHyMAIkz
	AZTMgwpz3E5vG+i9eyOwIPecGapFOd5YvhS1O6IdyGOdwR3cjiYy7E2wfsaRat0L
	wNku9JplWkv9MyGuR1IhTCM939za3jlO+F+bI9mReBAglKk3goNVic+zgw7tRhMr
	hIb9JSadmrVE+VDFCvZ7dZhdPiYqWNudJnCdpYuuMuEpTHuol6c8a7mZxmVabt9s
	YeNK5dlI+w44sSdb3T4ra3sBaPpdMZiTvW9d7ATvUp42Q71rkJKnBikaDYg4kiwx
	q2Bg5xUBxjLnODtkZ4bz6FTNiv5QIS25FCuOMXJSuUz/PaeSrAI33hxEOt9RSn/u
	CiK8Yg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9mk09j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 09:41:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92eebb130dcso101591285a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 02:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784108470; x=1784713270; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i0ovjxjsaslUBo3qllkswGA5E6toY8tNc/SHCtFB524=;
        b=St5MVPnj+LKLFljF18IO2RZlwVTKHz5n8GlVWkaxIXrzl22nBrKEj94WX8RGNB3wsd
         X3v5ouLok98NcQdEixp2/ZIlduUlL6fAzddFnQQxHZaPh4u5YIIG80HAgW12TiwzZ33D
         EMmUDkxumH8b6r/M3YZg0ozMyFjyGcJc8q52lURK8+vnihjV7pROc2AQirXSzv9xOjEH
         TQ8gMTAus0NtAZH/+7PMVdj/TX6geF3JTKEVoddhP3E8Ks7/YK8JNdX2xYcCAzXTG9fF
         rfsrr5V4nLeXEua0GMhWFA+mDIKialXOFqH7ysz5AVIFkuQDCFaF2+PRvXr9+CurUUaJ
         nbdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784108470; x=1784713270;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i0ovjxjsaslUBo3qllkswGA5E6toY8tNc/SHCtFB524=;
        b=QPmnXY6Wwt5C6QdGBuTlkISChe0kOEoZYvjjgnZJd81V9TL2mZO2ZUq1FZAS9q7Mbo
         ICruslcSHHwj7PxMqmTGmBWzz92H5pc2m68SfQCu3ff2p09cwj1wjDvUQWsU4LYowODo
         w4QAMgl7BaxZysX6Qs9zH4U8RsMWH2QltOtrz6V1iGARo8ZK6gSPxPmIglvgH58Uloq5
         xx6uoN/EG9mg0YbjNR8NVJHoZsaDKGdwfAfPBSw/1zm3VsxsoTBhmXdjTIu6ryCYDEnI
         QOAseRUC0+wMrHhQjRtr95CBZ8VDgb3+WhOcRAzLgaMwfwaOTIgtS4wfNpVqyIdwMWUI
         q+Fw==
X-Gm-Message-State: AOJu0YyxVjjwDzmaTuGl1EXZzDJp4sihgUDqscynSphUhs9QT6pKaiAh
	t2s5XsgdbbsGwA7dZ1wGDkvjtqwyJShdzIh4gEbOZODjm3cHpvbjjgmk6i2D6J2eiyMYgPP9mjd
	3+M1hZwuHXL070HJCjMzce+f1j1ei84J7TsUjPkdhIIqUlLZ7HSwlvknNy/t3HUfhKfo9
X-Gm-Gg: AfdE7ckKTKOlyGQXZFJOnIJx+QCF6BUH9J0XpDFWpgXMbn/Kalx014OfLmmLa9pj7cQ
	hZJnyMqTFi3wVk3GGcGz7QUM4JSiih/ztozbnbFyfmugR1K+ivi+8whl7qqqH6RRbDOnDmZVNq2
	12fGjZiM1CY38TVrnyrMEb0FnwV/feqpsTYvbRAW51J49a3quUw6853/6w90LbBa4k9lzOHeghK
	YH3hJ9qkBUqMqW6k7o7qnXCGEvDKYpG4SYPQeeN4cryout1hipHiC9Zfr2qT+DUDHR3Ck4tyTvk
	YWUivSrHU+d2jlxCNl3sTuHzF4Bw8TiBTB9jyqgCNo06HUG0poAwUJeJuVRzTw/dgeNvY7T9QNw
	qcjiIiddl4UF1CS3MfLeQKk9/UBOm24Q5LSo=
X-Received: by 2002:ac8:59d2:0:b0:50b:3489:5495 with SMTP id d75a77b69052e-51cbf286b1amr133643861cf.8.1784108469782;
        Wed, 15 Jul 2026 02:41:09 -0700 (PDT)
X-Received: by 2002:ac8:59d2:0:b0:50b:3489:5495 with SMTP id d75a77b69052e-51cbf286b1amr133643671cf.8.1784108469343;
        Wed, 15 Jul 2026 02:41:09 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15c63c04fbsm1127051466b.23.2026.07.15.02.41.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 02:41:07 -0700 (PDT)
Message-ID: <35941437-9003-4e64-b4ea-46137077c214@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 11:41:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: enable ETR and CTCU devices
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260714-add-ctcu-etr-for-glymur-v1-1-791de63c0713@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260714-add-ctcu-etr-for-glymur-v1-1-791de63c0713@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA5MyBTYWx0ZWRfX0CsGXZ3AlZ9S
 VwCF0Ria+mCl4mGL4DamRsXHK5mMAZhl6PcWVvkDDPDx3D0i4rhbhNxfonvbyz5L1inKxrKht3i
 13fiNSqqsklqDHigu1lydzplb7LQ9gxp2z09YJ/PmylfTvQzN1MLKSUivWRKaPapTfG0+uss8C6
 SZvhGdujvrR3B0jsV6+u3HOvArCkQ9zYspNX5v4z0Zx3vjCFqQMbGUvCKf0ytbJCP1qqa+SoSma
 MVzJij9w89iliY4gGMceg3eIUTT/Vcktu+Eor3Mc8S6taCAtBgORd3lAuYuHTTwy5n/EovEVZeq
 JAFiDgMaeg/CxgpLGvgH4O/yHfKM8PdOdT/OyGx0E9M4814oT8LDiAzdbnUhPrFWw3KZSNA1xY5
 9By9Zl/OGhPKfNuu5vAdiMt5l72CvMLD6UZP5/e2KJPr7vB80u8PwMayfQ9ufCCbOvVtu0eND09
 m84b38GjKZbNIf7K5YA==
X-Proofpoint-ORIG-GUID: nPdHqxy5WRu5UB51bgg7HdkK0AIHfMrF
X-Proofpoint-GUID: nPdHqxy5WRu5UB51bgg7HdkK0AIHfMrF
X-Authority-Analysis: v=2.4 cv=E+79Y6dl c=1 sm=1 tr=0 ts=6a5755b6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=iWN5h_POgodqhNU-qcIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA5MyBTYWx0ZWRfX4hgrU13ICWbt
 PR0yd/sXvi1o+LD0bomEyJTz0OlPG+uJt41U6uDkHMCrV6cfF/3b6cJsDVZQoyTVPBeN88q+exT
 aEHXuegNhuoTcCCiAZHHYSZ7q2RqneU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150093
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-119195-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:jie.gan@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EC36F75C9D8

On 7/14/26 8:50 AM, Jie Gan wrote:
> Embedded Trace Router(ETR) is working as a DDR memory sink to collect
> tracing data from source device and the CTCU device serves as the
> control unit for the ETR device.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

