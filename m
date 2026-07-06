Return-Path: <linux-arm-msm+bounces-116880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0rZCI9m3S2qbZAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:12:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C49F711CBE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:12:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lFI0PthK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WiwlPZER;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116880-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116880-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9ECCE3002304
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 13:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A706C377555;
	Mon,  6 Jul 2026 13:54:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE6133F8D9
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 13:54:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783346069; cv=none; b=riIXsPVUp4FJ3AKIuQImwXY0EC4Nqqpp8sWpSfFV+t5rW6X8+AAM8l+/vpEB+ZvobwtyqMZnADg9007ky5Yxe8BnYtowjwLTlp5Rj0oyBki8mEJZ9zzreGdvqlmplQDatIiK0MiPdibej/q+4bYys2IONqgPQWVaqHw8OqwTLSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783346069; c=relaxed/simple;
	bh=Ejq3GCF3ALDtojefcexMkYFTMI2wVEXKIrBlhj81Swc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kn8X+0ojUZxjf+fpkFJSqCeZOYL1BHCIEEvrFUTawIpOapMyQcwru2I9TuYGaKU2q9QblZjY6topkrg3xHSKzG1YUxGS1Al34skwwB9feKkcmVEkxrF/MYgvlm1RM8SgFmkKxzQwfqNJjanhHZLCgEZmB8uTqU50WX50cUSpWT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lFI0PthK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WiwlPZER; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxEH6361317
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 13:54:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EagaE396zMSCowVPFT/Lv2P0BLvUgaUxoxYWM76TMv4=; b=lFI0PthKJCdQx+wp
	AhZosW4s1BveSYqqVtQgfHJTKGU16xzv0Apyg4xr3zlBIehRtDOJOJ66Qq4kUSJH
	b4u9gzoSHy8JXrx0cASxlGvS2gaGWqE07SYF3nLrXXxYeUz0XtRYWJQgXJmsOi1e
	2yIJp9KW21JwNOpgKD+5dD9HNULbmy+9gTzTwDiXNgjQZUPVvThCYccwIrinoLiu
	fl26r72/BWHY4OL5K8OS0DhselwV+FVvkdfQ246zPl+oBYgYqwxUSGhkQvRVQpGW
	QuzlRGlTYAdm3mZM3+oj8xB/QTNu3WRnNqGWl2CUV5mO5nACBLknDhICDMQ94GY3
	eLra/g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h51c6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 13:54:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e695a3b28so396034485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 06:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783346065; x=1783950865; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EagaE396zMSCowVPFT/Lv2P0BLvUgaUxoxYWM76TMv4=;
        b=WiwlPZERPL2NkMG6ZVqxmw0Cf07+yDsx9nE0rlV0RZGAMXIXr+8ZjEukJeg9Ya10KO
         jNetl7aX1IjtGfUJn11UJS23+m6cXph+eNR+taJkDbcuJRHPgT2DQnLYnLOhqNzqNpfU
         K0SHZn1nORV0VnUfkS2wPOvB3N5PKwmE4EIWQ3mQU7Pr5dEPSIToFRs/thK5UREISTyD
         8meCg8pb1kUy4ZG+DEMCU2sZZfjeITKEGAmDFgL3KMxRnlgjY5XDIh/QhMuh2+IgFeN3
         RfCOIeSDOfNfzdE8aTVBMzNBboXc4DolGSGoQSDg/iwqr0/jvSzZZ+/Lnt6UlgCu6Rwk
         nVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783346065; x=1783950865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EagaE396zMSCowVPFT/Lv2P0BLvUgaUxoxYWM76TMv4=;
        b=pZ5rsI02uOzK2S5YoSAYmDeet3X9C81UvVZtoO1Lu06WQakQJVBOMwJ/hiQyN5G6DZ
         zDR3MU078RkPREtaM3shMzonQAyYWAWFUC3yLfAR1+RbEMcJlrs9yFvua1pNPqcvONxF
         E++P8s8hTL24c2MhFs6BFCBBQ0MA/xCG9Np697daa4bv50rjvShcYc7B78tkfoCwWqJY
         m/KFhIORDHeGBboE5Q/FjoW0vd1DP6YYVWDl14bFQWH14ReZg31+PpNWB0/qnve/mWt9
         ktjFVZEsWKlNAJwrNH++HJDmGTmA7Bjg7YTCiPjVRQfp65JUENS+nzqBfVCXOKMqYDZo
         q1kQ==
X-Forwarded-Encrypted: i=1; AHgh+RqumhGOIi8HTefi6gwhkiQgGPZ2MrieCSFOaj2FpZiYBraw1QFYY4+G/OaZIhcTJJ+R5likp5WnpgxWi4m0@vger.kernel.org
X-Gm-Message-State: AOJu0YzLLIH2wMJoz+N9l1SQAbkrC2+dxr7cPkJjGPd9PDYcBc2uZHF0
	M/DQag+UR7VptT85Sb+bqEA6cKL22rfrpnGJtYVlc7KcMC08GnujXpLOirI5OXP9wFEHsHzbaaY
	0YqAZSy6gbq+kP+OKNeBs93XgDTKymHs3MYFWNFfbB5bzaJ7sWao9klESmi1ycydBMJD6
X-Gm-Gg: AfdE7clPaWBNhZyAU6uYp0Ah84B902xaMZolbh2MVzjlIRl16H2wXRuGlXgpTqf+tKp
	fxFVRbiUPm3AGbdBIiUy1ta6ZH7+m17VumwBJuBVhZRkk57ZeBoFW1PAkKLalJu/GAKmqB6MsL7
	Ukd8baAxAU6+YV8itUqjdYVAPyTtlSQfThpllPh+6JHAXjgMS4/SGnDGMkJPGxUbDsJjXNFqEmc
	Nu0WriqCI56Z+r3ALuQdumYtMSWo6+M3zh5sQqT82NUOINJLeGaKTdilYbxMSei3Nr08aMpHCcw
	4vnOtAghu0Eqr53XbV3clUCtrIj3WdugJpoJfD9wnSmseRz5rlmFc3VY1D8Vc5k/9dEsGwlC5ts
	BlCRVo8KIudqIifiW0z6Rb2mPwBwXDeeUBnZUhz8q
X-Received: by 2002:a05:620a:3944:b0:929:7356:2e51 with SMTP id af79cd13be357-92e8b29ea49mr1954699885a.11.1783346065251;
        Mon, 06 Jul 2026 06:54:25 -0700 (PDT)
X-Received: by 2002:a05:620a:3944:b0:929:7356:2e51 with SMTP id af79cd13be357-92e8b29ea49mr1954694085a.11.1783346064642;
        Mon, 06 Jul 2026 06:54:24 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm619805145e9.13.2026.07.06.06.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:54:23 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 15:53:57 +0200
Subject: [PATCH v5 6/7] crypto: qce - Use a fallback for CCM with a partial
 final block
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qce-fix-self-tests-v5-6-86f461ff1829@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1622;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ejq3GCF3ALDtojefcexMkYFTMI2wVEXKIrBlhj81Swc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS7N/XzOiCW37/37DC2kSjBUfMS02JFc9UyEga
 1YdY63C3IuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakuzfwAKCRAFnS7L/zaE
 w8PUD/9XFKMV4iDp/XCMdL18GM2Or8cchFLaa8I1fB2w7R+CP3nCLVdyY226OlZvUcl/5bVAcoR
 fGn8jnOwQo5nhqd4Vmul9Zk8dtQ2I7NNhscI8kGnOHe3X+qsrKGbzncqt/SiRWFrrJ2fo6EChld
 fqI2LGqEP1rkQXQaDSYs5o94bt/bB1P9MT4ULjCXJryp8VT76nzKM2lJQ4cP7xQgPFOAjypWni3
 uexKknJq10GUeYkuG/nlQP4yTmIgyKm+OFP/SSn/cbSsndwIy2kWOrT70wbd4rbpN6iGhZgUMUh
 gZAQ3giu2XiL58/YAfwtayqLOwgdfbRj0Pl/huL/E6fDBgiZdEObSu7EWsDFUBAh8Cm/3/Z7PJH
 +QneJuwsPU8OkpAG1+0LAdyQN7O3ocXQUQrnQnCKsIY9z8Vh0mnI8j3MsTQKCZhHaB37h8ePpE2
 PU8I0notdC7qZHTYIZPKjD+c87ZX9ZoJ3/gXiQyeDDI73fgWYYn/WZ0/6VI1rpJRLT54gJ7XFjl
 JJy7Rn7NqehpkoVOirXNPw92kP1KLRvEyvja2CUdF9rsCKRqjTaaFsbJ5iiascp80CDmDRa29A9
 RDQsxOV4xHpnYdijOvzaX1mcVVb7rz2GvOvwGN7RDs8al9114uejioQCkiATy/SmJCPNI3A4FYg
 0uONVkpEnxYna5w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: DGzV8fEK1eu5vzP_zxAVcGDjoZ365Dfg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0MSBTYWx0ZWRfX3GVQqVLyDuSv
 BvFjTV2FDwYiwDfQKsOBUe5AvUNllA4YViO7WGFRWrukP4aNaLXduIW4KNkjgQyddB/zUmwg271
 IfHztJkmylLF8tX9hNMIJF2SE71UdKk=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4bb392 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dx2SfONCXZg6tt9xEGkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0MSBTYWx0ZWRfX7QE8uOVoeMVI
 pf+oR7G1qfAgAxAilQp+RkUIM0fpaNVXRmpmt+7KSLaUf36C7PSVLCt53bg9tcoWa/U2P6u/tP6
 e25wFOjLj/cjb6Riax29BQ3bNv1ZuPWGsHIE+3GDm7f5jg3nQsOAoNI69RmvKg2KyM5P1m4Qil9
 sPo39+v4oFpbbKlHHZeqYnO6DaPZkl7USpSnmQTs+QRxHYSKRPR/MornIiWz+84aqMKpae4Dm3x
 Sj65RmEyL98Q7Ph+6Z5zAgxo6f1rVntFqfYByMEuypfqPh0w3qAtUtzWiJJ5wd8W5OllimSdBez
 U60j2uMb6+pARGwiP2Uh3X+1oL1G+/64th5mwRMCt4Tvr33ar1UN/inElddPKqIG5KphIn55Ckf
 oWjw373PsK3i+NjJewRLbSycEjRRy/cSRqY0lsY+rgcytweAgFzbXD4t5Neol42K/4yS22DsCfy
 s0T2FwR1bgCC1vQgY4Q==
X-Proofpoint-ORIG-GUID: DGzV8fEK1eu5vzP_zxAVcGDjoZ365Dfg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060141
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116880-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,mm-sol.com,oss.qualcomm.com,kernel.org];
	FORGED_RECIPIENTS(0.00)[m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:svarbanov@mm-sol.com,m:cotequeiroz@gmail.com,m:kuldeep.singh@oss.qualcomm.com,m:ebiggers@kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:stable@vger.kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: 2C49F711CBE

CCM builds on AES-CTR for encryption, and the crypto engine stalls on a
partial final block just as it does for plain ctr(aes): a payload whose
length is not a multiple of the AES block size leaves the operation
incomplete and fails with a hardware operation error. This was caught by
the ccm(aes) crypto self-tests.

Force the software fallback for CCM requests whose message length is not
block aligned, reusing the driver's existing need_fallback mechanism.

Cc: stable@vger.kernel.org
Fixes: 9363efb4181c ("crypto: qce - Add support for AEAD algorithms")
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/aead.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
index 336614a11377e0be246817da584296124f4de5d8..4fa018204cb628c112f64c45ff6c7407df73b945 100644
--- a/drivers/crypto/qce/aead.c
+++ b/drivers/crypto/qce/aead.c
@@ -514,6 +514,14 @@ static int qce_aead_crypt(struct aead_request *req, int encrypt)
 			ctx->need_fallback = true;
 	}
 
+	/*
+	 * CCM uses AES-CTR internally and the CE stalls on a partial final
+	 * block, so a payload that is not a multiple of the block size has to
+	 * be handled by the fallback.
+	 */
+	if (IS_CCM(rctx->flags) && !IS_ALIGNED(rctx->cryptlen, AES_BLOCK_SIZE))
+		ctx->need_fallback = true;
+
 	/* If fallback is needed, schedule and exit */
 	if (ctx->need_fallback) {
 		/* Reset need_fallback in case the same ctx is used for another transaction */

-- 
2.47.3


