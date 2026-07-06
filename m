Return-Path: <linux-arm-msm+bounces-116876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fsEkLrO1S2r5YwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:03:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25193711AF1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:03:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Rr9WdsZE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Bkq/mbin";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116876-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116876-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 26947306BBCF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 13:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92C1334D92C;
	Mon,  6 Jul 2026 13:54:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474CF2EBB9E
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 13:54:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783346059; cv=none; b=SPfTWq7TyuENxnsq/Nr1YEEGB+r6AuDQFtznNRPJLFUfG35JB3XRfJCubMMgY/N7eIGV0f/65971XaF3LABm6e2jsTHED0cwkmoSAFX3qIk4rOHbZP/+AftRbNI9Y/DlvJq01MUJ7YEPSMeS8Ly1+6xpwp/ZGZAmWJw29poszHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783346059; c=relaxed/simple;
	bh=gaVQmxW4odSZxZIF7KtMg6KBYyDP5vW8dy/ZepTvgfU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NMV5fzdKr7LWJmEU/3kzQdvs0r/dnIvybOZCCEfkCDT0aSNdbH19A/23OovBS0fCOTdQQIMFRDB+BKxSrMjXqyR8UIxd9FusRovVAOqC4sPiTqKyoo7k3LYoV3k9uH72i3dLzWwE56jgiHVkimgsEeyKxfFtinBB1jx1ecW9wjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rr9WdsZE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bkq/mbin; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxaWi387874
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 13:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	600H1VFIQ0xguAuNOlb1Z+pl8+ujHpSJ/obydsyo3D0=; b=Rr9WdsZEfGyIRtTQ
	du0EeQ4ltr1A54CEGgqfgFZNK2GyiMKJX76YDfVbTiohqkB1o89rgxnasVsl7XMP
	PgyQ1OisuNteazD6BWwvl3xnq9jSzRU2vZAHlndUOE1Tq0a/KYARiG4+FwadSbbS
	l4YbNQNOGQtl5VDxuTH+BisTxAGoXq9l+B4uhFSDcrUR+tmnvaA4Fh7lMnlvxwNz
	Vi3VvQ/dotWplvPbJylNncjLEYjcLPVbxqrFCAnymqa/Ij2NjvSwyJOQJNtDgVMG
	h5O6PFPSyLxHWhGyi1u1rp3OsH9Xm/OR1ePjcc8S82qlKsWm3rEb3wku00wjNWNh
	TIDgsw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r0wxd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 13:54:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e4f946461so317462885a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 06:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783346053; x=1783950853; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=600H1VFIQ0xguAuNOlb1Z+pl8+ujHpSJ/obydsyo3D0=;
        b=Bkq/mbin6D1QIyQK0lr5fGSArfN6m6EDXGIV7NlbHz/EC7eii73jEbez+rlYo+VH9X
         l23qLpRGUhMGRCrfueFhTA4tylHDfLn98bzx2a8tn5JpUVngpG5x+RpKiYboBaXse9eN
         w5yL2EboCuEBgFue9dx7RU+WD0T2SelzrBOpNcmPOasMVz8O5zBiYrcNMJ2/sh+ltSDa
         4ZABmbRYkiapapVSpNTkmEl8c+MuF7Pyci0nE6AnpOq+3CHueuMGR9GBUnLmqa2KK39N
         iuBSPx6KArykGTdxv16KVd52dLipN3mLpvzlY5EsDF1/GhZn6CzF3KUR8NWDs0Ae3wZQ
         FD+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783346053; x=1783950853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=600H1VFIQ0xguAuNOlb1Z+pl8+ujHpSJ/obydsyo3D0=;
        b=IZ117lDhcGsSVj9k2cQUGwXkE7WHbEe6qHgXtlJ4AhsbG5n51e8/oCVRJ3sJyLkjr6
         6CDxmJchvZDCeEVM1ohStWyNObqSQ0yHCAjFX9ah3HF8sY/PGiyvm6R1wL4Q22hkXyMO
         Qay7KGhn82q7FXjk0dIV6PQYYgwBdkMDBbsIxsKTWxfIGfTVcico/UeNRtjAzQnK0C46
         aQqoqk9cpwxxd9b1BgtxE5TzdOBj1ykoGTN5Jufa9EjsE2fbflkJ2V6MWoC0+sf/DcUc
         bgLDfSBGs1CyqGePRnM49pALlJXX+k0hmLHkgSDkwvS+D22aMoCJW2fdbUnW/iUzI31j
         odLA==
X-Forwarded-Encrypted: i=1; AHgh+RqMaAtYQx13c1H7DUTmxKWA0nvA809J7Abk2+WUiedmZiKgCTLXdqI7DuwCmirRlVpK2rtEUCJQrsSP87jY@vger.kernel.org
X-Gm-Message-State: AOJu0YxEeK10ZYH6EJYdMg+4J6fE31ZQ2cc+iZxCak/5pG2yNyiyhbvK
	FW+Ks3oK4C/DYHZdO8TL1RWQ4pDOSB3ZoRF4+07H3+WIc2mX8Cm8c2+VZKWBJOhKcBBqNMNueIt
	/mXkHUgPm+A3diSd+uQUgen4iaOp7ALeWOyxAGBT3krFbuuZnQpFZGX5QMnptd6xCM36x
X-Gm-Gg: AfdE7cnLsHUg2kh3ToNopsPkERtP9EVd8dq+KNYtkfGQx4jdf/2Kr1e4nKuvz57G76u
	A3KsRQD8397PaHcHuVJT+undhL9hGzvRKv8mrB7SlfMNQ+REvlEx5qETysx6tbHqhnEZIQtkS5v
	J1ihl/MKJIW97S100amiPxVneZXNitc1cgg9Y524ftuyDQO8ebA+LZQT7OYeUr9EXySm/pRKFkL
	BqUywqpsJrq+Lp3msnoUwZq2i+MyR1+pExBwCO7MIbVGWCfaoTojoQRrC9rfF59R9s8U/hs6fSW
	qm9jBVpaeIitWmTX2u4RZQOEM2vbEGOZVMmSY2Sko0Jag+TYRlv12fQ1ylRVrW9euOM2vMXwHhC
	ZBGfCIoomg9WjjJ82qWKTJwYbHwYwLCNtMK/HwMwz
X-Received: by 2002:a05:620a:294a:b0:915:ab83:6952 with SMTP id af79cd13be357-92ebb4e1e8cmr95163885a.16.1783346053462;
        Mon, 06 Jul 2026 06:54:13 -0700 (PDT)
X-Received: by 2002:a05:620a:294a:b0:915:ab83:6952 with SMTP id af79cd13be357-92ebb4e1e8cmr95159985a.16.1783346053014;
        Mon, 06 Jul 2026 06:54:13 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm619805145e9.13.2026.07.06.06.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:54:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 15:53:52 +0200
Subject: [PATCH v5 1/7] crypto: qce - Fix HMAC self-test failures for empty
 messages
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qce-fix-self-tests-v5-1-86f461ff1829@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2454;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=gaVQmxW4odSZxZIF7KtMg6KBYyDP5vW8dy/ZepTvgfU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS7N5rXFvVZszOs4rKlHWZNuj2npfq0TJqoO80
 Q0KfZGeoz+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakuzeQAKCRAFnS7L/zaE
 wwo1EACAUvL25XRLezRo8/JjfMnU6W8A3UX3us8rftAn1Mlx9GtoE3n/I2g1Scyg6tg9qEpRmZA
 6uJszR3IvpPM/ibMqGGT6jUYppQE3jwjzfRmbXgB6HaCKV8MWwm63XIcpkrHH6M8OmY+mq3WAUb
 InaCU/dICTdXjs/n28/mxXrG3SwUqfPQ9jBgeOw6VQLlZdo034PF0D+CkNmRFivyX1IwN2RJXui
 t4vzGZphjRzGBb1TAZLEFiFEg4BmqmQFOHOS0VQh201tXKKRUHMjGj+fGyAe5ZMJJjiqwx7aqK2
 44T1YUG4vXlgP3tLcHJ+r/TEjRh9XDgzJULqSW1C4Sf4MVDPHEOIfq1Ic9R7K4zExC5K/L1mHMV
 DGHu488flw/h/RrEZ5ctS28+iKDnEfx8sDy9qcuTCyL3MnlxFVZmYJdhfS71bSO3Idm9UATzTIv
 vXPEjzq/buapDlOHaEUx6CW3yjCpEF+fwyDDYOEQT+O444nJfjnkrEdyGGzB+piWfBA232mukot
 uayJ1o6pe2oFw3xvquTlsWlRHbgJHqli3NsN51GL2c89q674+FdHng+PWjyI1/GtCEEoUu6PYFk
 r5fWxPLPi56YnMLlR9HmSgU3OHQ0lN7h7vk5WHji11ooR2D1h3hC6tsz/GK7sYnPfEqYhrp3YFg
 FuhpKXiAE/5VLGQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0MSBTYWx0ZWRfXzq+zOk4X8ld3
 wuAyWP+VXv1KNwxpmWPkdExrQmCm2QX2mFBRYXzbXPIaVyB2kEBetk1nAiw6soWsp0ISxikpTiL
 l1HiTUr8slRKjKb0R0lnaNa68gm1VFqlCYNoayo47tZ3Ls8WD1YDU/7RC5VNsdK+k4wVPn7o2k8
 aMugBeqimflE4zHGo35UocjX9y6JeV4m0NeUrBsyaUkKkProY0bICXQFMerqxk2i6EOGwOpVFTx
 /JRZ/1o3d3MPzGwGmAOKiCMJzrExWdTYnmP4oqGrkF7De9ROvdMjeNov9fNhE+FY7N396Tbfh2q
 lSPvwqeOJkgXBuSIPrKCRwDprEFC9cQtj1WvVGtyQh0dvBffPz9EPJgYHfq3FsA50JvbMks48V+
 5BMKx+whH4eKghPJOSFGmeeDMzcTg/i++WxKZjSCkzvKPakWrcooUCsVOcdStyYb3FkIEArNQwW
 KWMcBqucn9uk00guGog==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0MSBTYWx0ZWRfX4T9pUBY3m+q3
 gcqBCHs1nq3U5oGh4Qea30Ys4nlsFrotJwjxMrOp9dCO8nkl9D8C75qi0Q8Fz+frh5p7Yrlc7Kf
 5O+i8bw5xcLqYVqIiL/EvpQm8Fd9xo8=
X-Proofpoint-GUID: 7LkPVue_9O_tvz7zSBy0e50cExN4tX17
X-Proofpoint-ORIG-GUID: 7LkPVue_9O_tvz7zSBy0e50cExN4tX17
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4bb386 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=OgKJrOtnYjB2pLVqIKkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060141
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116876-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,mm-sol.com,oss.qualcomm.com,kernel.org];
	FORGED_RECIPIENTS(0.00)[m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:svarbanov@mm-sol.com,m:cotequeiroz@gmail.com,m:kuldeep.singh@oss.qualcomm.com,m:ebiggers@kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:stable@vger.kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 25193711AF1

BAM DMA cannot process zero-length transfers. For plain hashes this is
handled by returning the precomputed hash of the empty message
(tmpl->hash_zero), but for keyed HMAC the result depends on the key and
cannot be a constant. As a result, hmac(sha256) produced an incorrect
digest for an empty message and the crypto self-tests failed.

Use the preallocated fallback ahash for the HMAC transforms to compute
the digest whenever the message is empty (in both the .final() and
.digest() paths).

Cc: stable@vger.kernel.org
Fixes: ec8f5d8f6f76 ("crypto: qce - Qualcomm crypto engine driver")
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/sha.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/crypto/qce/sha.c b/drivers/crypto/qce/sha.c
index 0a3f88aaf5169ea7b47a549bbc10ea87d3ae7a2b..03b58a83e540802e88fbf1394108da35188b68bc 100644
--- a/drivers/crypto/qce/sha.c
+++ b/drivers/crypto/qce/sha.c
@@ -270,6 +270,25 @@ static int qce_ahash_update(struct ahash_request *req)
 	return qce->async_req_enqueue(tmpl->qce, &req->base);
 }
 
+/*
+ * BAM DMA cannot handle zero-length transfers. For plain hashes the result of
+ * an empty message is a known constant (hash_zero), for keyed HMAC it depends
+ * on the key, so compute it with the software fallback.
+ */
+static int qce_ahash_hmac_zero(struct ahash_request *req)
+{
+	HASH_FBREQ_ON_STACK(fbreq, req);
+	struct scatterlist sg;
+	int ret;
+
+	sg_init_one(&sg, NULL, 0);
+	ahash_request_set_crypt(fbreq, &sg, req->result, 0);
+	ret = crypto_ahash_digest(fbreq);
+	HASH_REQUEST_ZERO(fbreq);
+
+	return ret;
+}
+
 static int qce_ahash_final(struct ahash_request *req)
 {
 	struct qce_sha_reqctx *rctx = ahash_request_ctx_dma(req);
@@ -280,6 +299,8 @@ static int qce_ahash_final(struct ahash_request *req)
 		if (tmpl->hash_zero)
 			memcpy(req->result, tmpl->hash_zero,
 					tmpl->alg.ahash.halg.digestsize);
+		else if (IS_SHA_HMAC(rctx->flags))
+			return qce_ahash_hmac_zero(req);
 		return 0;
 	}
 
@@ -317,6 +338,8 @@ static int qce_ahash_digest(struct ahash_request *req)
 		if (tmpl->hash_zero)
 			memcpy(req->result, tmpl->hash_zero,
 					tmpl->alg.ahash.halg.digestsize);
+		else if (IS_SHA_HMAC(rctx->flags))
+			return qce_ahash_hmac_zero(req);
 		return 0;
 	}
 

-- 
2.47.3


