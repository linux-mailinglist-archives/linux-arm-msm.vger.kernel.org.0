Return-Path: <linux-arm-msm+bounces-114002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IGBWC2A2OWqMogcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 15:19:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1846AFC28
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 15:19:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=imYVXZnm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XfVmItBb;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114002-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114002-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9F4543013BA4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 13:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BC013B8105;
	Mon, 22 Jun 2026 13:18:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C318B3B7744
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 13:18:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782134330; cv=none; b=uFEl3dKqA82TKuUiHEfE1r175NKxDptvk1KcPlOGqUtjFIgoQfgTpdb3zhRn4KJii3vRqlgjwd820YzEMGHXTY97q8nUL39Thu8DlJ76daYbp7Nd2euezjmzPLzNEKuDiCHAaNARLhFdRN3tyBvYvH4JU8h+xk7ado6EMbXz0KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782134330; c=relaxed/simple;
	bh=q9N7xvaeFpdxSCk21VylCtI8nPZtUNdJ9Z4Mvdcp2Gg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aQHEfc7BJc6NdHmnq2ahyMjNzr0+WuL/3x0keTB6zHd8PeT2J7gzLNrGD7dXww/+u0bPc4msuJ4WG7GF02dn9rpDdMqNbd+9sNeLMIC/rjP0mlwUR4HPsIHOyBTIIi36NI+5QOLiDZgX0jhRbbtZ2OlnELMocEWZfJ5STbG2TU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=imYVXZnm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XfVmItBb; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MDGLo01338648
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 13:18:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	onHSjGInX0rV0mVGlTmmcWeekHeD6EjKdPIS+Vcr65E=; b=imYVXZnmfus0Y5vg
	NJBWVRzQjk+Wx18IZAbgTjry76RlylG2T2hN4Qm6i0rleHQc5c1gi5beR7sHWZ1i
	1Z5aZwrpYrCoiQtSQsupf3Euyo8Ae5AqPq87pL8vMCQckQaNaWyMHEW6r2aIg/lE
	p+2jg4cAH+DedSB/jv37awNxCBJVx4GpPLU5l54upkiqhCz4QpYPE6IcuG2CvhMI
	3MlpoMZ6vIpQWFW48h+4GxaaO/L6HDhq/zeDLTi5nqAh+LCIfZ4JkQ4LJ/p4c0KF
	niL9vHL2ToFkaLiOme6lG0gtj+DKY3H91HwQ64uZT0rm/KJNlP98+A3/zu9Gw42r
	tuzO1Q==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey37h8jpt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 13:18:47 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-96388871d70so4758451241.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 06:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782134327; x=1782739127; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=onHSjGInX0rV0mVGlTmmcWeekHeD6EjKdPIS+Vcr65E=;
        b=XfVmItBbU8QkhjJdBgkVAvNmN4QcWMyALFWfE4OrRjnzCJw8HWElqNk6D5U7tepTOr
         pK1zYdHDBf/dUCQX3OoDlrGlX2hPepQxW+lhqTu746vEOvZgbhRV5s4e+88ImEs2TgWb
         gxUwe2HKyaHou1OX8W2MlfnZnEwDAqULs4hVsNBvwE+ecMjJYY8nb47tn7McQypfv040
         Mmx3BOuYOZZkQN9nEqpNQEeg9Ly0AsR4gTdqcrwVeyk7lud6M6+3jpvCp34JpChHqp50
         UtBDv/pwQudCR2PExlknPRYM+iRj3OzrOA3QtLxn5LgV6kNAPXZDkK4E8vzRhNfSIy/6
         GMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782134327; x=1782739127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=onHSjGInX0rV0mVGlTmmcWeekHeD6EjKdPIS+Vcr65E=;
        b=pfAJzjiDsq9Jd8TN8R5YOQA6qHrfg1gInP8G7KE4oAFnqBjiSHsn4l6mbjEEEomxgI
         Gf6Lmhv36xpXI3Dvje0T5LHWUX/KPDtig2PUiMoSmIOXfKi+eK/4LNa2XQuYEDCbHgJ/
         RW0TIIKEDd/2h+0qNU39t48Ps1Re558E72Bj6ryZERo/L8DFQAag/ZyqfHpnO94Fli7G
         0HzX6LaGo5s4pHNOvks8swybkKNEtvlQwECtZ/bvwJdOzX5A9IPLUB4Gk+5gyKc78jxz
         q4yR4ltBEW0cfAv2/JGozTYWpWkKIZ7NIaKbNf+rDd6WyzNRkASDlHVqAWUVgs5XZqp/
         XJSw==
X-Forwarded-Encrypted: i=1; AFNElJ9GpXP8Nf8cpHRBT2POHUcDZbCa4XxN95f57V03KJHxx1lw/LvSKioooTak5JwdktxEmWPtXfDyy0UAK7EK@vger.kernel.org
X-Gm-Message-State: AOJu0YyEh7nU/lWZfwhleQcIdYE6XC/Ihj+ylt1YN5A2M2rhGHVm76NJ
	HmtKYpRYDFOfsGYHQVa/2UfbYei6IlZuyEJC4O/7GqknFmQl7LQFlcCOS2rPbH/0KbT2BdVcEXZ
	wFvuoyZO3COpHdUsIelB91y/Fbok93Nsccix1JDl90+/vVmI++XcOcIFgVzpCs0r4NfW6
X-Gm-Gg: AfdE7cmXObF2tNbAXcoqR3ZeBLBRnCE9ICpsh1JVrJNI8gSzplMQGOZD3mZ8m0hSdRP
	KacTQ3XulazCleZlRZnVE0ZWrFpzsLfLZRqZeASU6atMc0ztOG8hUYooWEd4HZyaSGQQ41ytSqt
	KnGXKnfbI0mHfolBTDJGRBhWrTJ0cfV9EvPap6bzcZ4t2sZoSWJQWtzyTl+bHm99RzNzG8weDLR
	/zpVWRRM2k1Wsg8OF/cR1dqmDIjypLBG6oJOII8eOcoETa0lOAPUGwXmaK1g8OyFFs3RLvNwzY2
	OS6YmLRm9pwOYMxYBW9DUIdr2BFunnF2fUMpncK5q9IYq82/+2U0KJy03/irhnccr4S/MQ2YEYj
	t8qhp5K2dOqsdDAgGGh7/mUO/CMS3lT9ITy4y8L3d
X-Received: by 2002:a05:6102:3e83:b0:631:4580:6a46 with SMTP id ada2fe7eead31-72a1f0b92efmr8615632137.17.1782134327199;
        Mon, 22 Jun 2026 06:18:47 -0700 (PDT)
X-Received: by 2002:a05:6102:3e83:b0:631:4580:6a46 with SMTP id ada2fe7eead31-72a1f0b92efmr8615554137.17.1782134326599;
        Mon, 22 Jun 2026 06:18:46 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dea2:c31b:2872:1bd1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd30078sm294083835e9.7.2026.06.22.06.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 06:18:45 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 15:18:16 +0200
Subject: [PATCH v4 8/8] crypto: qce - Use fallback for CCM with a
 fragmented payload
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-qce-fix-self-tests-v4-8-4f82ffa716c6@oss.qualcomm.com>
References: <20260622-qce-fix-self-tests-v4-0-4f82ffa716c6@oss.qualcomm.com>
In-Reply-To: <20260622-qce-fix-self-tests-v4-0-4f82ffa716c6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2908;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=q9N7xvaeFpdxSCk21VylCtI8nPZtUNdJ9Z4Mvdcp2Gg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqOTYjW9T8sppX96eyisuYzkoe3JNaDn4WMmdho
 FPQ9WH0OG2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCajk2IwAKCRAFnS7L/zaE
 w/FSEACVBB35BQRHhUTcT2GPng6TFcQ9ybU4wACiYxJbO1A0uKBQV76pZIyooPg+Aq1i4BBlgPJ
 rt5zfuYZEwFpEpYyel+47bqWU20NHCav7zFlJbhckdpDS14dOFVDcClR8jvniz1Mena4+3jbx2J
 YtLlwkLgpdgnhbPiTMxWjKO+OhnMp2Uy1mx9wrVDdLGdh2E1yin0ZC27qpPiMrDSQFJdxhPFie4
 EKxEgqUwMfOQTtaiAkkp1QLWQLK+0E9DpfO+HAv72amR0J86eXv20DTtd6iCA2aIFq9ttnwi6oZ
 DO/qgYs8BaTXArOjWrvg02ttwOjPIzXc3QMYzufliSTsbfQ/rtq3i5zLqcauqLziKb5KB+N+iuI
 xKfXZutqzSHsJNbWDwZ+/zzZtnRDHVRQiLWuC+zyUNGITgb0OFgF+dT18rYCEZ/Tl7jUP72o0Js
 AbdT4CUmmecOm4pQoZWLOoL87lcE8djwga+Rjx/vis3YMUZB9jDHK3bT3eWruR3RKxJPxxN2vZc
 nAF03YzaWb+WxuUeIp6MzVb5lhgWAEfj2gZePpKDikIlHuLXRRI10/igYZPb80TZg1bakdwz7zk
 B1IWsYSH8FyZws6ZWiXu2Qi76os+I4O5tLstt/nXYMzCqI7Tps3INaHNkbksiDg0qX6aMfx116I
 oIIKxfD33DELzwA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: vOpDU5qzEN95LB741sbuO9N8vaWuZbtn
X-Authority-Analysis: v=2.4 cv=ecANubEH c=1 sm=1 tr=0 ts=6a393637 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=phyxH6jkQibGXiXynFEA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEzMSBTYWx0ZWRfX99X+yQqt2DG0
 c7FzD01Am+w06zbr1ED99l2tqYiEiJMnpAhu3RrblunjBBT3HQaEOuA2N3v85oBRWU2zkzdKQzo
 LNRoH9Q+ofuA6EIRx/30VFqkM9wBqPA=
X-Proofpoint-GUID: vOpDU5qzEN95LB741sbuO9N8vaWuZbtn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEzMSBTYWx0ZWRfX9MwJWcE6aQhQ
 boUBm7+/377EB4miBdaEVPG1xiLpVPRnfunYMj6uFtFBrzDl4+K1XvbnVfFNPETm0Z/N6ENObVz
 tR57Z8X8yu5shioNf3QurDdMR14JmXm0B0I+ZqxkenghJeQQcKOCOq3Y5LzKC8/CP5X4LsZ3x0S
 CBrSpl05fZLlzSqnUkFN0wXS2QG2jatea0Cl3R3QXnsgQ0K9DSlMPTSgA78A1JMLfAIcsbk9HbB
 VT9euFFhS4cpNzmc6xbEYYsSdNEcZ5Br2VtwMzlzK1zHb05CnTVCzyNsXHgwGZA6pFa9jextu/8
 LVogu9JQG5ntS+XxlTADnhBVzYB3i9jP4iofu4ZbLh1ZP4OsgWSWVAGucFQpDtbMF1najgbnoXZ
 baveb89W4gAet73IskhrxKkakHMi2uH6nhCz/LM9hRpONcnVRz8v06xtaC/vbtl+bLa6wtU1mOq
 iv+fNqghYjj4hXbm8iA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220131
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114002-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,mm-sol.com,oss.qualcomm.com,kernel.org];
	FORGED_RECIPIENTS(0.00)[m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:svarbanov@mm-sol.com,m:cotequeiroz@gmail.com,m:kuldeep.singh@oss.qualcomm.com,m:ebiggers@kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:stable@vger.kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: BE1846AFC28

The crypto engine reliably processes CCM only when the message payload
is a single contiguous buffer. The associated data is already linearized
into a bounce buffer before being submitted, but when the payload itself
is split across multiple scatterlist entries the engine stalls waiting
for input and the request fails with a hardware operation error. This
was uncovered by the crypto self-tests, which feed the algorithms
randomly fragmented buffers.

Detect a payload that spans more than one scatterlist entry (in either
the source or the destination, skipping past the associated data) and
route the request to the software fallback.

Cc: stable@vger.kernel.org
Fixes: 9363efb4181c ("crypto: qce - Add support for AEAD algorithms")
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/aead.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
index 4fa018204cb628c112f64c45ff6c7407df73b945..9ff8fe2a7efcd2734e4ff029744961a7b1101013 100644
--- a/drivers/crypto/qce/aead.c
+++ b/drivers/crypto/qce/aead.c
@@ -498,7 +498,8 @@ static int qce_aead_crypt(struct aead_request *req, int encrypt)
 	struct qce_aead_reqctx *rctx = aead_request_ctx_dma(req);
 	struct qce_aead_ctx *ctx = crypto_aead_ctx(tfm);
 	struct qce_alg_template *tmpl = to_aead_tmpl(tfm);
-	unsigned int blocksize = crypto_aead_blocksize(tfm);
+	unsigned int blocksize = crypto_aead_blocksize(tfm), authsize;
+	struct scatterlist __sg[2], *msg_sg;
 
 	rctx->flags  = tmpl->alg_flags;
 	rctx->flags |= encrypt ? QCE_ENCRYPT : QCE_DECRYPT;
@@ -522,6 +523,27 @@ static int qce_aead_crypt(struct aead_request *req, int encrypt)
 	if (IS_CCM(rctx->flags) && !IS_ALIGNED(rctx->cryptlen, AES_BLOCK_SIZE))
 		ctx->need_fallback = true;
 
+	/*
+	 * The CE reliably processes CCM only when the message payload is a
+	 * single contiguous buffer. The associated data is linearized into a
+	 * bounce buffer before being handed to the engine, but a fragmented
+	 * payload makes the engine stall waiting for input, so route those
+	 * requests to the fallback.
+	 */
+	if (IS_CCM(rctx->flags) && rctx->cryptlen) {
+		authsize = ctx->authsize;
+
+		msg_sg = scatterwalk_ffwd(__sg, req->src, req->assoclen);
+		if (sg_nents_for_len(msg_sg, rctx->cryptlen +
+				     (encrypt ? 0 : authsize)) > 1)
+			ctx->need_fallback = true;
+
+		msg_sg = scatterwalk_ffwd(__sg, req->dst, req->assoclen);
+		if (sg_nents_for_len(msg_sg, rctx->cryptlen +
+				     (encrypt ? authsize : 0)) > 1)
+			ctx->need_fallback = true;
+	}
+
 	/* If fallback is needed, schedule and exit */
 	if (ctx->need_fallback) {
 		/* Reset need_fallback in case the same ctx is used for another transaction */

-- 
2.47.3


