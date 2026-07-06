Return-Path: <linux-arm-msm+bounces-116878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XTbeDXq7S2p5ZQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:28:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 98893711F6C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:28:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cmukUE6g;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QZovjtLk;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116878-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116878-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9EA9C31BE8B1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 13:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED9CC375F67;
	Mon,  6 Jul 2026 13:54:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BDE3054C7
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 13:54:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783346064; cv=none; b=j6K8LzAA467HAE04btm8DoLMFs6X0pPqFHks+EEndm7nk0zGIT3luTY7EUzw5VLI5hZMIVRd2bcdJ9BhBdsjBslv6ylohqIiifc25GsXyuRo5yyVFowNZc3j7QE/Rvfo6LFpSXux6inQjbgNrEaznfOxyRyqTAgJrAcHZHCfqrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783346064; c=relaxed/simple;
	bh=ibXDE7QfYBh/Y3uVHmqj0Doeaz6ovE/rm9hnql1AQTc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I6Vpv7XqJWF0B29tc1p551OWjlwHEjJRnXpgM/j2RI2QogtX399tfTTlaIj/mKBiKj8DvVRcAf7tQiJaVmNUrRgZFMWrvMw0z5YpX3VpQoTnuaj4atx8R337fFmvHmL1YOCOe6EYqiZm6pCqMWrOz3HYldmf4TMusFb8eg9jdLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cmukUE6g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QZovjtLk; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxUQq219063
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 13:54:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QYeFtj5+lSRAHCG4iElDvXo9CD9HgurpDRFCb9pO2Kw=; b=cmukUE6gFgHUT8+f
	Am9j1OFNcGMF/w/GRgSI4eHAgWqJFKa8XXcDiGAKwbs5xxtiBicDud7Ay5by+GNn
	fVUqwwCav/8E4H1qXi0eUWP5vqIDn5q/7kebGWMCKmqdiiBhGX2617oppTL4EaXy
	uusk8ShxawhzaR3qFEIqBNKoxC7gbp9wpp16GEjuRGa8szvVsd7Ox2wHKe5h+EyC
	ZR3kBgoLd8D/Oz5lk5MmeIuwiLhatYnZgXv2/qEy3GuVviMF83hNxmfsVQcKVen3
	6AnAiN4gd4ffv1KeuyRvMgisHlDF5NJNbSQ4jyiJ7gz0M7IU+f02Lz5MJvBtoQzw
	jrwCiw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hs9d6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 13:54:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e53b8a302so285793685a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 06:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783346057; x=1783950857; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QYeFtj5+lSRAHCG4iElDvXo9CD9HgurpDRFCb9pO2Kw=;
        b=QZovjtLk+yW7GZcIlhFdDubCd7b5Xy3kyg9SlwZgG1NOPA5LTrfrHyPZmlOaD9u8NT
         OWfdjUbhLIyMUK3vWZXMqyZE8h4jOVrFQI2a/agAyIaTFvix5iQd6r46P+HwRSp4NgRF
         mTyTgyq4oDSKSAeeMM+gqPmpRT5YjAInzKDmvfZYeR0Y9QTAbjvqZgppDHN9ec7Zae6u
         XNB2+GlpY63E5Peb67yRk+ueHcJfyXTdWWQV5CMDJiAuAK4+abuIcMQ45hlkjitki61w
         S08PlNQkZJR4L4iy9Rav2rhbR2PvHrxfemaYLRkBjhhfYvwyyjlN/EA0n52u12NOzkzE
         QFew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783346057; x=1783950857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QYeFtj5+lSRAHCG4iElDvXo9CD9HgurpDRFCb9pO2Kw=;
        b=e/rFMBuLt5tg1MPlkd9vpQ1jRvozxtBbeUK202h01n8E0RL+dmH9oysxk1GeCodOoY
         VUHV21Hb2tfQrkgbrllHfSvjIc3oGY25HoHWKJhOJ2I/p2brNOYRrsqN1X878J4QAsch
         P4xpk6mEwd+F3sSMteXy7iDtMVEvx/8tZDVh8RfeSlLkc2Vc+UggqiHYuAUkCONCvj32
         XLKkDROFF11nQ1z+QjxEbXKWoTElqFFuiRmBsPdZi6bj1TtHvzmIeyA4RbAEw9Dh/ass
         C7UO6tOc32zOrCMHmt6Q8QzJ//yAZW+inGoGnU7U2U4TbTAUFFzG6QjHj1VxjfrDOdmP
         Re/Q==
X-Forwarded-Encrypted: i=1; AHgh+RrNLBrRUyHUx/xqLOvoEvpXOcbCLZnylXeViypCLiRer4nMbdko467kEmi5iq0YvGSqNkjU6Inn3LJmL+7A@vger.kernel.org
X-Gm-Message-State: AOJu0YycuQiP7ylj+Fmox8gTtCay0U8ca9xK16MDvZiJ3PykjZBw2Z/L
	Pods883WwR7xZaGTWUHczo4e4acoyBh+5Hh9c99EorwPLEdVT5kCqmFMA2vMGBMzVRXXMnqHB6y
	TlXbIMZCaA+Yl26T/68VQEzOV29JXbXJcYfwJFRgpaIXcTLdG343uMxp+HlFOzXui5ElrSeQZrK
	EV
X-Gm-Gg: AfdE7cn7PZRoXfwh51lg9KdQNmDCzkKzXq402q6n3IzGnnTFGoEzS8mqBtwShqP/+0z
	QdNLmjN3FrGIb/3vjx1QdxhrwvDZvZJwnB1bWGii0WxO8vHJ2TCJfONuN/E+KkNdCrbAl7zHz06
	YIoWwz+364qfi2/qB8RktqcGb94TbfSmKQ8gMFkIPfkqqiJwBLJyHYeXXQUUHZ5K3wJLess6Zl1
	WnvbdUU3ia6WKPRCXFGCfkD9thLi/KwNxS54KnnB+aaYaDhAG543jr7T+W1Rit3dK5fqTK4WeTa
	D33lBa5QJ0vb5mpvriKv/WHFlG+Rdcgn33mQBgd8FvS4kkNUi51iw29MtzgMXD/umhJWAFfl6Hr
	StRn9c2Q1gNXG2+02P2gy3i6azsSBhXGTEAqI3dfz
X-Received: by 2002:a05:620a:3712:b0:92e:77f6:157 with SMTP id af79cd13be357-92ebb526d8dmr99621085a.7.1783346056959;
        Mon, 06 Jul 2026 06:54:16 -0700 (PDT)
X-Received: by 2002:a05:620a:3712:b0:92e:77f6:157 with SMTP id af79cd13be357-92ebb526d8dmr99615585a.7.1783346056375;
        Mon, 06 Jul 2026 06:54:16 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm619805145e9.13.2026.07.06.06.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:54:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 15:53:54 +0200
Subject: [PATCH v5 3/7] crypto: qce - Fix CTR-AES for partial block
 requests
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qce-fix-self-tests-v5-3-86f461ff1829@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3299;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=0wfULYDcviuc8Q42MEg50uyXBEFkn0s1U0Ju00N6IK8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS7N7gI5aXXYpEKipt/Y+w0rf+4tyX1l7Ki8bw
 zW72Z8t3PCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakuzewAKCRAFnS7L/zaE
 w1tbD/4wE8JoXvinj4zPJBBLSwYcp7FBOuJBP0RUkoUsk1dd3Q0MFIpapGJRoFAHKP92WBj9iqj
 0RbnaMFOUHNCfZQTgL46hhamjt2QLY5ossE5G10wD8gwm4VzdTEOQoKvBZ8fsbhPFSkN5I13CwL
 DsY0BreQaVVujM9pDByPacLGGsizyP9YKLXa4ECD7CiWG82XWDZf55J0Ybe9BS9X/qCRxluJpxF
 mrrHQuYXIaj2NS3WYV9yPZsy4Z/fya1sQzzr8cmvyKyJTs3XlfD/UNrvi+FdxA+HK5tFxP3XOOj
 HzsQjWguLUFW/k4jhGL68wWF4dAiwog9+EWWgxT1Rn7GHe+ePLyqM+ZNje2iQmBgZZw5tVxa0KY
 aM0uaM9VouCqOpNV2uT6Aq/6AufkRSVGuoi7zhnZ1HY/k/ZPotm8A6lsqplcIiuN5M6nlVCnaQO
 zlnovganI/UK4Ih8brRH3NQjAUwFet2bSOx3DWqaHAzpkBTYVu18FP4NArhC/sDOUnV1/ELfNfB
 H0tlh+SlR5r8+P6G2dK9zhhj0+LoR7KnkZr9EiRiUn4M7ThstbYU/QiEzc9Giz9rSndt2jQjIWf
 00BvHJ3fZLwzzvjGs23WkwuDB5GJuZGnf7ZNppi2nVYLwLnYySyWB23pCrb4wm5rtqAzf1g9V15
 t6sAELWLBvv/rww==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 8ChnykmXszw7w_b2iYiiAIYaJw1TRs9Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0MSBTYWx0ZWRfXyjFj8ug0sUv2
 BjwN+Ntaefix5Wt1ye8edGVOGLHnB+1ixyNx1M+g2XuuJrXz+fWjo9vkeE1qdf4KEW3zszBYCG/
 M792vpd144yfqWOTjknSe/8YI3g3twNgKuzZe9ABBGVQGwqmbrDpnh6Zk56x4/lA9n100GQ6VuJ
 BJyRINCEGW73ndT+Gx7WgpqITAGJg+Lc6EyJHHLapRNOtgJHjV61A4KU3Da7xJ/MQm2YchJ2pzE
 TpeY4kEqN0S3926EAaZQ5TvTGi9zCAxEh0vEs7pv+oJRfI5w1KZE9N9K01menx2ZVuWT6DJWGsA
 NGBL2Ow1SvHjxds0YWKbMIWU6izP4g3hoO3u6cWD8yTj6Vum7OyANOpQ+Hg3W/ZtVqedMhYHTWK
 FOkgY1/+czqENsJUrnldlmWQOx0aVPszCavrjNvD26KCcXyU8HsB4XUNbHtDG9jj73V7KQj3JSr
 +9YVlwWEP+EC03RJH8A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0MSBTYWx0ZWRfX3n9/Xe9Dp2HL
 xQ+Cn8cCN6F1xo5errAzHRDQ/x5H2/kIc0l85FTZ5uzdKZTsjkmYWp9C2uxEsZEu+pT5pXIjtj7
 Aafj/591d05MU7mhwYrZ1wKTzXurLrU=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4bb389 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=Y2NcAOke46LZopEJyX0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 8ChnykmXszw7w_b2iYiiAIYaJw1TRs9Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060141
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
	TAGGED_FROM(0.00)[bounces-116878-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,mm-sol.com,oss.qualcomm.com,kernel.org];
	FORGED_RECIPIENTS(0.00)[m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:svarbanov@mm-sol.com,m:cotequeiroz@gmail.com,m:kuldeep.singh@oss.qualcomm.com,m:ebiggers@kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:stable@vger.kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 98893711F6C

From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

In CTR mode, the IV acts as the initial counter block.
APer NIST SP 800-38A, after a CTR mode operation the next unused counter
value is:

IV_next = IV_in + ceil(cryptlen / AES_BLOCK_SIZE)

The skcipher requires req->iv to hold this updated counter on
completion, ensuring chained requests produce correct results.

Referring to Crypto6.0 documentation, Section 2.2.5 says:
"The count value increments automatically once per block of data (in
AES, a block is 16 bytes) based on the value in the
CRYPTO_ENCR_CNTR_MASK registers."

QCE increments internal counter register once per full 16-byte block(for
ctr-aes) is processed. In case of partial request length, the hardware
uses the current counter to generate keystreams but does not increment
the counter register afterwards. So the counter value written in
CRYPTO_ENCR_CNTRn_IVn later once read by software is one less than the
expected value.

Crypto selftest framework capture this scenario with test vector
4 comprising of a 499-byte payload (31 full blocks + 3 partial bytes).
Error:
[    5.606169] alg: skcipher: ctr-aes-qce encryption test failed (wrong output IV) on test vector 4, cfg="in-place (one sglist)"
[    5.606176] 00000000: e7 82 1d b8 53 11 ac 47 e2 7d 18 d6 71 0c a7 61
[    5.606192] alg: self-tests for ctr(aes) using ctr-aes-qce failed (rc=-22)
Expected iv_out: 0x62 (iv_in + 32)
Obtained iv_out: 0x61 (iv_in + 31, partial block not counted)

To fix this, just increase the counter value for partial block requests
by 1 and for the full block size requests, don't take any action as
expected value is already returned by the hardware.

Cc: stable@vger.kernel.org
Fixes: 3e806a12d10a ("crypto: qce - update the skcipher IV")
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/skcipher.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index e1f69057607fac36e8b4bdb5dd9e62a2aabe5f50..35ddbe03cfcd75db7599a5754e4ff978f3528105 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -33,6 +33,7 @@ static void qce_skcipher_done(void *data)
 	struct qce_device *qce = tmpl->qce;
 	struct qce_result_dump *result_buf = qce->dma.result_buf;
 	enum dma_data_direction dir_src, dir_dst;
+	unsigned int blocks;
 	u32 status;
 	int error;
 	bool diff_dst;
@@ -56,7 +57,21 @@ static void qce_skcipher_done(void *data)
 	if (error < 0)
 		dev_dbg(qce->dev, "skcipher operation error (%x)\n", status);
 
-	memcpy(rctx->iv, result_buf->encr_cntr_iv, rctx->ivsize);
+	if (IS_CTR(rctx->flags)) {
+		/*
+		 * QCE hardware does not increment the counter for a partial
+		 * final block. Increment it in software so that iv_out
+		 * reflects the correct next counter value expected by the CTR
+		 * mode.
+		 */
+		blocks = DIV_ROUND_UP(rctx->cryptlen, AES_BLOCK_SIZE);
+
+		while (blocks--)
+			crypto_inc(rctx->iv, rctx->ivsize);
+	} else {
+		memcpy(rctx->iv, result_buf->encr_cntr_iv, rctx->ivsize);
+	}
+
 	qce->async_req_done(tmpl->qce, error);
 }
 

-- 
2.47.3


