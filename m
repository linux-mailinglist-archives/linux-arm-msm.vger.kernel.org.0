Return-Path: <linux-arm-msm+bounces-116877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aLxrHr+1S2r9YwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:03:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B4D711AFF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:03:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OYA7Wmlb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Q+uDSmAm;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116877-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116877-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C295B307ACE5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 13:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50F42313267;
	Mon,  6 Jul 2026 13:54:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D73333F8D9
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 13:54:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783346063; cv=none; b=AVN68JhCJythQ2lkaIu2P8jhrUk5qjRpiYxr10LA+rtIvX1UrnylLAC92dpp5ek458qprIW+W8K5SPr4gaaXBxS0JOO6PjxeCh3nx/iqlPCWSmuqB90w/onvboOKwvpmsXpBwrfcKty8ztzZXCwo7xcEp28hxT/VtW0C3ADbOFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783346063; c=relaxed/simple;
	bh=c+mrubN7rsfOnXUrhAmKfIPiEiFtp1qvBtE3BukFaZ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eITXlyD8YZPd9I4Yg8EZ8AUxaRetydlPIwrqLlxFdJ5buPlvkhHzIEyRuBfVYlJ7Jjoq5KtM0H5VI+Q1E03auwe27NG4vlf3LwLIt1DhoYQ79Sk/B+lcCOhiQrC7iUzNI52eyS2MGA8mFH+T2aujEkaETjOSsWgDD7T6G3f4lBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OYA7Wmlb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q+uDSmAm; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxLse395413
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 13:54:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	su379PS4fCpra/SUatLozY865KIfA6SXq4/i5am3Thg=; b=OYA7WmlbDBNbwl3C
	XaEFJmocHQ694G7n72aUBL4qIup/xgGy8y5Fr5Wa0fWtcXs/1fQtt14MY6NW4lMn
	B48zwHXLfI8bjk5h71/VCksFp8iQ7dlAS6oWTTaY9siPNPQNb2I+JvOvXDscjaMA
	s+7o3DaY0Oy91IcLXvlVvDM4yyPrGf98IjQHQRJjY4KAtAPrMoO2iTd2pq7465ax
	W2KQnIP0oOsGOG7hGy5E20hb7i6kZbx82RcpwihfybZfO8V/UX2nyuUtLsWMVuXr
	GSEIot5eaos+Z2WREZMBj99xqdsYcrejxdnDsJeTaPEDH4UZib7uncNRGW0PQVed
	TwLrtw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89qph182-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 13:54:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e52306621so220756085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 06:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783346056; x=1783950856; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=su379PS4fCpra/SUatLozY865KIfA6SXq4/i5am3Thg=;
        b=Q+uDSmAm0WwRtcinG/Y+3oz3fuzs68fSXefDUMQyHPmDjCYhmmTIZfjHSElGfy1oLR
         YYHvvAK2+VF6mNYM9sbkMYh4ZINWUehOVKEoeymjtlriMoOxLJspgYEX4XMJJCrCRc8n
         cUlg9Bdu4RzQo+p1U4IkrQgWi/gkiu8eCzOfOLjshgXOfK6TczRc8C4cY7bhIfpTKe7I
         B5k5afF3erQZf1FcjjovJISmp2Cag2TeCbPQ5uFyj+HL9cBrAe5lHA9oZIziGQCGDwrj
         l2/qHzhvXrmhDc+MjjlfG1ziIIWKBGoPI1HVDLPMw0CiSpAv748F4KmEaq052kVUBAps
         NIjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783346056; x=1783950856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=su379PS4fCpra/SUatLozY865KIfA6SXq4/i5am3Thg=;
        b=X/ZnpR+R4q5qf6DVGXSoouLkLUmIUHPiZDMsyAQJfX4DSEa+pKncp8WvyGdo3GNb5R
         E6pLcI33CujJTRwTo7NnKQNvK5CTmOkM5fo6n9F1DAqIsPm2uQHQOFbS5ziBClIg86wh
         uP9XqWqLBWvqvQCdEbGB8fCwJ8chCew8u5QrNg97j8VTECGHNuCSnlX0WnH96vamhk0U
         2GQa9QTrn5IoFb/905JVq2+0QzJojoa1vV7yuKIcxdwN2BgH4RB5FokgNgUB2sZJjIVa
         s17P/lG3yUkQ2XSXpod79X4TriVW79qCkhei2D6+cLM63p3eblkHqv4K8C9avdMZ+CWX
         TcRg==
X-Forwarded-Encrypted: i=1; AHgh+RpVkzS6T2EEeHTAaRgmLY00i0Mezm1fLpHzNiiwL5u49l4JlUyxlatMnWISK+gjd5tZoJ3UlALGYtJ7CSQs@vger.kernel.org
X-Gm-Message-State: AOJu0YxeBLzY5GjCoNYpBq4ynbHOxY52Wmr+c3rhrSqhZZICAfQAFkPI
	z4wLEnSjxddwayjwn9urVGA/zkTn+oWJgwDFQs0k2RHpgFkO0xjK8lDM1nLputAp6KS/4U4LFNM
	1z8BxF/RydXF9lHT4Y2ZDZXtMUDXM8ltDx/Jn6eao5hyOiwUcPw0N+w1Ug6KApZJ5VLyE
X-Gm-Gg: AfdE7cmN0TVGtDleHaX8YvU8U5W1q2X12aZtQnPx8vuBT5SbvGFoeKVmo6REZTppEMA
	IQvT8mgQ+4XDdPnyCLZZyFwe2oUD1d3fMe1Z9mS8MrPL6gow6S47QMtU7FO822ZNmggZpQDEKf1
	jnMq1sTUBD1hbMczSS1Tl22h0844HUEahQsTgVIQu9AT/slv3m6w3ZuPTSIFQ2hc392mq8NkeAt
	XaeLx2A0Z9VcmFtdUwLl2AMGkVilsMRpb+DlftPWIvFLIGsxtTR0h4Er1XE1ULFTexI0C1ZjK4i
	ArMKKXZ/vDUMpDuA2KnXb4jn8KGXkYzp5gGhGf8n8BElFfHPWq0IGYzbfd5FtGFkiGZMA/wMz+N
	aPOetIeLI7EaKqXHDQO77rTO+1e+a0WI/8qmy6wlg
X-Received: by 2002:a05:620a:4455:b0:92d:e54e:72db with SMTP id af79cd13be357-92ebb4d19eemr95769885a.22.1783346055616;
        Mon, 06 Jul 2026 06:54:15 -0700 (PDT)
X-Received: by 2002:a05:620a:4455:b0:92d:e54e:72db with SMTP id af79cd13be357-92ebb4d19eemr95764685a.22.1783346054935;
        Mon, 06 Jul 2026 06:54:14 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm619805145e9.13.2026.07.06.06.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:54:14 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 15:53:53 +0200
Subject: [PATCH v5 2/7] crypto: qce - Reject empty messages for AES-XTS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qce-fix-self-tests-v5-2-86f461ff1829@oss.qualcomm.com>
References: <20260706-qce-fix-self-tests-v5-0-86f461ff1829@oss.qualcomm.com>
In-Reply-To: <20260706-qce-fix-self-tests-v5-0-86f461ff1829@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1491;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=c+mrubN7rsfOnXUrhAmKfIPiEiFtp1qvBtE3BukFaZ8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS7N6rHrTH0qoOx88lr0IHWNw5QQwPYw0c0yqC
 7X1Mb+vX/SJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakuzegAKCRAFnS7L/zaE
 w3wpD/0fg654bzdRNlPNalglNBxVXstbqQhps8NgcBVp11RCUk57hZp/GWG+Ka21RYhGTyHne01
 1lJvKEyBkiEbyvBCmpWC63KKSHrvkzroi/vFRg3s6Za8tO3TD7evfWPzgQbrR3UQuxMzF7KaF/g
 eLVS+drzJGtz9Y3lPRmgahTuBMHD3rz6VfUx5+FOUby6sWqIjAW0nx7oT3iirhgr/aTcRo+zWcF
 B4q4GcrmisGcXvnXA6O/Y9T4PEOnvk8h0aF15UmSIznKjaVHsDgQ0H5FXHkXxb6EmiM5yOy/1Fl
 XjPTQB/jzCR0fHt2/i+gB9pz1Ztz6ezBJGyh+Wlcc5qqFlNEPbpbgftaRCOyESmGCgPh6UEAwrI
 PICO3G4d6BfXm2ZPOQOaC5N4CtAB+hRv4eLXZ7kIdylC4SO9Ma5et/RnTysBZAZjwlSf4z/Qhyp
 NiGQff6c1ddLLtf2a9nWQ/yUNLvaHQdrZNur2RqntgOmL2QVJlvmCiiQph6WptpMeTzztL+dIbA
 985f9pdFTpb/O+AevGAoIm+jsmyK3Jwr/Xu6CTE7Gm+Q3XWu//sFs15Hcr4lEQC6pfbP35EHHZC
 CYc+oq8Y9eui8L38nDdJ+JgFFFaEihLSdTO+80PE77cDPXRHF7YSWGX7pl4cyqgfw/7nLkfoolm
 c8IRLwx2rkOcqMQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=c6qbhx9l c=1 sm=1 tr=0 ts=6a4bb388 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=kiYxeA6Iecqc4QeK3QQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: UvPIqcVzyHQvVoIGYN3Hxmy7FDsnk_rJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0MSBTYWx0ZWRfX2bBtOdwi5CrS
 OP6h51wmcfG0ISDHVNSNPSpEk8VGsY86fIGA3imhVS0trg3KYJqAD//MtfFkBKV2pe1GwBCevkf
 DCLWqN3ATZdjnJwopFlhunRYYsR3AJ+b+aaQ/ek09YPWht5EJUSNMdHsyL0qAStCLsoNO+LNDVS
 7X3P+8l4029lmocw3QjohIICU+ZjIzdBmteqWOst9KrY6LPuV0ruILz9kKmukkqmVreyN8TC3yo
 c6/MniU8d8xtMaOqB+KeA+gM3ppSPd4ag2pNR2JtFt2ogCKT/vhnD88nHMPNjxjNAWEIZktb7WQ
 j83s20QeYZmhiZZCOuNv1kxklvZGsmyiOloGhpBx/by4VNFXGWF6eIWlBZ9EAe0yWepPzYgQBZ0
 pBba97kN/MBgTN7sPNcM3RPJlBeTlGEurddYpR3Dp/ukNWDdfnjZrzPyPImu1i1EXpdy3GmaBHJ
 xQuww9YQo9qFa/falEA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0MSBTYWx0ZWRfX0es99yHnxnn9
 beb0MDY+rakNaeSXFsfodVtm0+/8VHX7c/Nz4KzczFeIXv20Vx8wesrmVSkmHHMqiW1TLEyhZV3
 9RpZt3TWHTAjCW8whuSn2WQ+nkU1W4A=
X-Proofpoint-GUID: UvPIqcVzyHQvVoIGYN3Hxmy7FDsnk_rJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060141
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116877-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,mm-sol.com,oss.qualcomm.com,kernel.org];
	FORGED_RECIPIENTS(0.00)[m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:svarbanov@mm-sol.com,m:cotequeiroz@gmail.com,m:kuldeep.singh@oss.qualcomm.com,m:ebiggers@kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:stable@vger.kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E6B4D711AFF

XTS is not defined for an empty plaintext: it requires at least one full
block of data. The driver treated a zero-length request as a successful
no-op, so the crypto self-tests "unexpectedly succeeded" when -EINVAL
was expected.

Return -EINVAL for empty XTS requests while keeping the no-op behavior
for the other ciphers, which the crypto engine simply cannot process due
to its DMA not supporting zero-length transfers.

Cc: stable@vger.kernel.org
Fixes: f08789462255 ("crypto: qce - Return error for zero length messages")
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/skcipher.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index b27008ace93a8a40c291d564c3fb9d73df5447ec..e1f69057607fac36e8b4bdb5dd9e62a2aabe5f50 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -223,8 +223,12 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
 	keylen = IS_XTS(rctx->flags) ? ctx->enc_keylen >> 1 : ctx->enc_keylen;
 
 	/* CE does not handle 0 length messages */
-	if (!req->cryptlen)
+	if (!req->cryptlen) {
+		/* XTS requires at least one full block of data */
+		if (IS_XTS(rctx->flags))
+			return -EINVAL;
 		return 0;
+	}
 
 	/*
 	 * ECB and CBC algorithms require message lengths to be

-- 
2.47.3


