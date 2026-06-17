Return-Path: <linux-arm-msm+bounces-113664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8qyvIGrCMmq15AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 17:51:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D02F69B241
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 17:51:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ULm5j7Nt;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gMYZB7SD;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113664-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113664-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 17B46303A95F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 15:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D976481231;
	Wed, 17 Jun 2026 15:50:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334324A2E35
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 15:50:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781711417; cv=none; b=qrpboYJ/qt4/EFErt3TCzJAiem0JxtpuUHu0Hjaju9r1G8Vp/1Th9j02qFDXb2547M4dAKP1pRmJdmk7+ocSUmPSgr8911sXY+FjICHHKyPAoRjG1CUPIt/sMqMNADJCDQftZKqQjqojWiHBI9Hl1Z1wFOT/36Va7p6KoTuV5Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781711417; c=relaxed/simple;
	bh=LTozN6+KKvaV3pQEB1cO/FYh0GrmW0oAjoYOtzAUIa4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AVzYiwQ/iGXbl5b4K57Cmc8OtrL7U+k4KABwC16G9M8FLJOF6AhcDkxtaDD/gfAct02QVJN3T4NnZPeAZtBpWMTfaKONnNTt1OADQm0CvwzVIvx0eryebHAxbRy9g+7UoSULVPy+W9qSO920HznugGC4w6HtbFGPZhujOtJ1040=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ULm5j7Nt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gMYZB7SD; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HFPqEK2959748
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 15:49:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	snUUV2JUr0Ih2MNO7R+yOLfSCvu6cwwWeMkXOmJL2KI=; b=ULm5j7NtgKlC/RHt
	fgtQ+pFDM59Ar9aHUsupgiqhzczmkfJDWZF+Vev6ColoEp1+GwEjobngn8VFWntp
	c40UHDa0PhDeOIHOFR0fUrJ+g8EWk5Xc8gGIDqsJYknvrtj0CZDV93Uf6cRlvx5Y
	JHkAUfAKkrJR5GwCKwOzMx8GyrQ7YSz2GYOAMdgbhzDJrDmQdR26X8pUjV2ug5dw
	yLh40/Iw4kyPD8baui1nOyVfQqjMs8WNAMxmJ+GALlEh+hamAAgoO8gDiK8QDpVQ
	Qj0fNLW5Knzv+46Y6CboiW1toLWAW15WQiBROXbje+KxCmFzgoGTvC9BkFm7Jkwm
	jEUYxA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euees401f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 15:49:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9159c4b210aso186660185a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 08:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781711399; x=1782316199; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=snUUV2JUr0Ih2MNO7R+yOLfSCvu6cwwWeMkXOmJL2KI=;
        b=gMYZB7SDKKyeDnhItMGcemBAmlxMX2FCEbczVx68M7GPAhyjSe1SxtlwftSKBIESUI
         WALkEHp7heYbp4bp+drqSI43DUibuwJiidKZMTQYFeKLaNLw76RX7KKjCIHNxJ1E1Hji
         hrWOC9Iz5AHVpfWyp6FuCclpecYmF3dSSTyH+uRuyHk97hvOTjp4g9b9LpRxxRGnn/tL
         DJ1zgVwxHJMErL/1GDFILlMEdKpY6BkMct8oi8Gq1c35253zJFoTDlcZG4g+IhYGA1vB
         hB/vwCYJTsvNxVWpzV3Av7YfcTC8lTPFp2NALunUAo4rxmXJufPD/T3qwlBaavKuPAdn
         BO8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781711399; x=1782316199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=snUUV2JUr0Ih2MNO7R+yOLfSCvu6cwwWeMkXOmJL2KI=;
        b=WJZSQ4L/zEwtioVnTTJu8m10OlCge2gxyMT1m2KjwRVJBqgYxlqh1EQd7tyuK7YOd3
         oAQzb6EsNanyQX4RA80YylJF8eVjbrYyjxWkQF4ATeJ+LJRmn35Z03vMoL+kY0ganS6N
         kNzLEIGq+i/U7MCKDVj77PVOAuNt5JoqkWzOlRvDMKp6QS2+/6WlE/PUglU7Ti0aee8u
         AH0IRkLOSa1TFyeowrpfn2veWHOUwOFVDdsLzacexvcfjEUVDaUV6hcncuSYwYl4CA89
         B6zZJgU6kVwUbV/iEL8bYxotKxOkajF8yGJ4YjZyGgeE87mqn9hGsDKhx+8WO+0pVENh
         Ttkg==
X-Forwarded-Encrypted: i=1; AFNElJ8gElixYcKQCbHpTJvrldy0SVDQTZGn7qRuQyBm+6fsF0bIVKPmcCEjCbIt1HToFCceOUmwRYArFzZYfhMa@vger.kernel.org
X-Gm-Message-State: AOJu0YxWYsJEqLxqbPFWAeCy1SmmB4CjHJ62PEWwzbUHXukyL4iG4LT/
	SUurEQehzI45+8qvdEOFzbbNUQ9drXZwdP4ppl+doKOBSxC3NoXtc/9wwNcLmJFeUIWPSxpJHF/
	asCud0M1DvuE78RLtsGzzxpQq3wTKOZxRKPD+YIuMF+0JZkmW2K0MeIZtEIG7FyGUCklb
X-Gm-Gg: Acq92OEV5rqF1S5bCtEdf35P3lLmdWJWLEYAXRtrQih4e0j9SG6mudknpwg2Pv2okfW
	pPioq7ogPT02GtRuRqXLolOyIUg5lkmsepktvx9tjUgp+CTcyGLY7RHG/Bib/qGA/ookdiMO9Rw
	ha13MRK4j9YhzvwmOamtKyB+UERmLbX/8Jc0Akg/xgcubLqu7hsYK2ppReGU43+3+yin0OHBrIS
	+EpuAYwXp/YNtrTCzech2H/eMJYSYL8NzZm8wlzZThadajb6DlwkPEtzYIzWu0ro+nRJ8eUJd+L
	/wUwnDTyIQZK6u58ShePbEIXRDrqf1+HqbcxV5bhpd0mx+VWWTQroJ5BW0ZjRbogdj0/y712Zbs
	FHtNDpOyXH1avyULOhZ0+Gj0qEpm/uC9EyDWHk9e5
X-Received: by 2002:a05:620a:4890:b0:915:80ed:8327 with SMTP id af79cd13be357-91f0b10d07bmr376485a.41.1781711399014;
        Wed, 17 Jun 2026 08:49:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4890:b0:915:80ed:8327 with SMTP id af79cd13be357-91f0b10d07bmr371785a.41.1781711398587;
        Wed, 17 Jun 2026 08:49:58 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:c856:25e5:e249:5e0f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa8b423sm168913195e9.11.2026.06.17.08.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 08:49:57 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 17:49:32 +0200
Subject: [PATCH v3 3/8] crypto: qce - Reject empty messages for AES-XTS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-qce-fix-self-tests-v3-3-ecc2b4dedcfd@oss.qualcomm.com>
References: <20260617-qce-fix-self-tests-v3-0-ecc2b4dedcfd@oss.qualcomm.com>
In-Reply-To: <20260617-qce-fix-self-tests-v3-0-ecc2b4dedcfd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1432;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=LTozN6+KKvaV3pQEB1cO/FYh0GrmW0oAjoYOtzAUIa4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqMsIYsWtxEfk+euw8cGJrHp2EQC94ItMatssu/
 IqK9akWznqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCajLCGAAKCRAFnS7L/zaE
 w5oAEACHmCVEXZ9uyMKUTXx4EkDSrqWoM2g6y2Bxl1/UFyoLNe3mXaMz4G+hgNxqxA5N7DeRTUy
 bu6V3BrB+WOp0ZKaJum0G3kBXSIOXGppXzrofVZjlElbRnDN4EXr+Dzb0hSchcK4CHuM/tBI+U4
 s8lCUm/XPYqraK2Tma9KHFiFG6g2jMdxMoIyeNPqvO40ZX3YiTnrQu/RaxFWVMV3sIn+oEYisxa
 K6xUQIpFqTQdaC81Pds6buL/QqVaeV7FPeqwSWOQ6NOSs7Od9FuKaaN6RaMS+w9tY7hnIzW2YXn
 ujzlJZG9aCSNzSpiatPhf8vzi60fPB4p9t0aAdwI22bJiTkYBvMD5RE69EGpjFzAttqTS/0NtZP
 6twHSnLLtCHLTFQWAS13SgfzdPfprTocTgD1n8pjcfJnt0zxldGQu6KBn9NREEdIAchUJEWY/UW
 5+R9gbRREQpsyvkJLE1M5gYUjlkeeej2kigaAbmIXClb1E+xCZDQlnspgj/cn7vOOb7wonZjEvT
 kQ+ucPz8b4joq7Ljp0qjDIGZZj2MdqXlGMMsetztQd1IaossB2Hj6qqNrg4jtSi6hHWuif4gG4k
 sKfcJX78ks1qMf8UlDrVjagxEZKQxEZAMIVqyJEpIoZXyevt86aV1m+cKAegsECbtlgkMlfQMh9
 y0B2pPL//1ahveg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: YGqjuPXLBkZwNKGND4qWTLfRwuL4_078
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDE1MCBTYWx0ZWRfX8BggN9MtSyxh
 lamW5/NqySjjs+sXBLjSYGWYBq652D34NvgwRrF+YYIUo/ALKuNGE1yRQZcQ7g7XqOWN2lXVMTS
 y3u0zSYSVGFwILAaSQjg2qeyieYOmGvaSADvw+STpGNlBOSuvE5Ipw8EnKPcRlMgpDOKMH4JV6M
 Mzf+zP1oCjWH5w+6udx5wrh3k/NLzPJPcHQ7rJzKSYkLIXyydmxPc3foaaiRaOKK6/6gApQPgRW
 79hdWUHWo4GbHGhNsJoo+Ls3bSnuCdZ+eO4LAO5grgM2ZX376NK/1a7DubV0gXcI3P3tw8vq1RG
 PmXljo7ICTwLEWZrtJfprR85kNEKwL5H/+pjG5WKSqSTiltdQEowUI39ruihn13t2bOzXclvInu
 FKHJav27fh6GMEeunYP8cKsYb4orGsgaLDISX8v9uOBq/0+uW6ltNTN4KjY5eD98jANjZJd49PQ
 fp8k5CWPMSp27Y1mGNw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDE1MCBTYWx0ZWRfX8l3r2oKa7kKT
 WL/2eYGRxRnS3eVnzikmvTHjAlKjazkz2fmm886Fi9i8ME+cCSGq8Y0uzLJpI7q79ZD3G5bTulU
 l+3S59urOh+noONOPIjvVLfwEjze0eI=
X-Authority-Analysis: v=2.4 cv=KeTidwYD c=1 sm=1 tr=0 ts=6a32c227 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=kiYxeA6Iecqc4QeK3QQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: YGqjuPXLBkZwNKGND4qWTLfRwuL4_078
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170150
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
	TAGGED_FROM(0.00)[bounces-113664-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,mm-sol.com,oss.qualcomm.com,kernel.org];
	FORGED_RECIPIENTS(0.00)[m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:svarbanov@mm-sol.com,m:cotequeiroz@gmail.com,m:kuldeep.singh@oss.qualcomm.com,m:ebiggers@kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:stable@vger.kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
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
X-Rspamd-Queue-Id: 1D02F69B241

XTS is not defined for an empty plaintext: it requires at least one full
block of data. The driver treated a zero-length request as a successful
no-op, so the crypto self-tests "unexpectedly succeeded" when -EINVAL
was expected.

Return -EINVAL for empty XTS requests while keeping the no-op behavior
for the other ciphers, which the crypto engine simply cannot process due
to its DMA not supporting zero-length transfers.

Cc: stable@vger.kernel.org
Fixes: f08789462255 ("crypto: qce - Return error for zero length messages")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/skcipher.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index 58a6c8e333784af73cd4340814046f04405c69e7..459c9ba6d0a5363da9f6ac8c69b6d3c1a4633f91 100644
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


