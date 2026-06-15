Return-Path: <linux-arm-msm+bounces-113216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CRJHFNMgMGr+OQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 17:57:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCFA687F97
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 17:57:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bGvvymD2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XAnwx9Ol;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113216-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113216-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C018C319ED76
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 15:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 742CA409E0B;
	Mon, 15 Jun 2026 15:50:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5F440B6F4
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 15:50:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781538632; cv=none; b=afWj/mcUj4bYeu5KOwZUgWs17TSSSq/RZFT+nZ8tFMptfgPrUDxGDukGB5GdFHuUE/4b6JsrSpp/EsKOH40GQYz2DXuL9SKbtyPSNbHRm+7BwFBaQ9jhABtRPI3BUcXb206/+tn97sVzWgo9Yy8FSSf/0M1Zjt0Rbl5vcoS6bYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781538632; c=relaxed/simple;
	bh=p2lkPad7k8iHoVjbfy8gEFAEKYRKdaoCK71ypvf9NhI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JhneIJ9voZ/V3cNJRMCx3ozFh+HjAUo5anDPm6NnOZOpSwubWBjJQpKC8imckEP2ZzldH/kaydRbjRBoifOFP/tHPNbSinD0yErnb8+14h1G0z1fXPrzPmLAXNrs3SufRmGr01vaEw1qto2ndo7pJsLpgu33JZh/udOJQFk0sfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bGvvymD2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XAnwx9Ol; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FFhZkQ449240
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 15:50:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3yjUdgaJbaFa6PDJnEExmCea7RaAxdvGuHpd+tJjd6Q=; b=bGvvymD2W+/OgvDh
	1SiV1LivfAMR89G4fHsisIaIefUdxzsnvmcIIT+X4RkTLra6UVIpew81CT8q+jBP
	u5I+3lhqFbzsi2MjpE5qSgU/Yyz3Zu8SScJA1fNA++1zz6qhNbBpq0oqoXfx8b+X
	lrJvxbbPd8cY08ufNfSDDsaNP68Y41QDzakBeCciVsGeEbK1WwXIDIQbhHbfqV1m
	72LAPRUqZFdcXwU/UcM8hAFkS66cNOxZFTTYGXedDJZa1g5hbtj+AiqdHAopK4Ro
	sbf0FfqHL3fI0e68YnQ0K2cdsZnCWp0CbLzUKgdHGzcP3p5maaSkxQDLG+7o+svC
	HDMELg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etfa71eu2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 15:50:30 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6c7b5cf8bceso1347947137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781538630; x=1782143430; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3yjUdgaJbaFa6PDJnEExmCea7RaAxdvGuHpd+tJjd6Q=;
        b=XAnwx9Ol4Aws+YPbUwsXJx3EALe9MdnjIPBLiiHUcwhg7hJ2s8hstruvzIYLnD/Zoh
         y/32dKBiozWbSiwMo/MtUnFAMRnaH9c7JfxSGWRHXYYm22Eyje3BPOgPAwFzyYV07woN
         6VnF6HOVhfRrlQhztisKaSXa17aC4elUneQiQqfVH60jg9yWILnFDNk40hkhrj1N3miS
         KheMkiRL8HG/VVLDeOTm8F2CgV1NufKvDPzWp46f9IdILtBr7o5mVqH96AQmXh5UMRCO
         DuJstKFEtprn4kIKnZ+H4srdHL63ItIq6VOXkGp5slPwyez3a+YX1x4YAtBKyxti+Jj1
         vTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781538630; x=1782143430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3yjUdgaJbaFa6PDJnEExmCea7RaAxdvGuHpd+tJjd6Q=;
        b=NnQpbp0FeIGknCYntcoiQB4ZSUBJVK6dmcxnye/ctH8se1AUHwO2aM/ElBNNCo95uy
         2GtfoY0zKDh4qtsoLJOO/7xRBPU9tYicmiNqdhsXPjZ67WMp7aDniq90KAeLUlE5Klij
         t62pcMbHUnFe/j4JYQIjZFThOBgwizDDEOsMrVSh4Q3cBEKYUgIsqM4Ydm776Bee1Gnp
         51SHv4zUGuEYRVxXO97gbjTvWApPl9sReyi22K2JLL+3vguBErYo9E90m/tY+vDPmQiM
         1gTe2rlI3YFtO5c6i/enr7UmVHYN1Nv9BlJ38DAbizTJYN7EVtDbfkdiSiVXgczR3ILq
         h7tA==
X-Forwarded-Encrypted: i=1; AFNElJ8NQ0Yd/Ijf7UgtW1KVqfm0V/xs60jOGqd0GkPbd1wA80A7DID/Esx9AIQ5/QWF/uTw0QSxsJ+7WiV71ojf@vger.kernel.org
X-Gm-Message-State: AOJu0YzS+FYIi21j/rMY1vPcl0S249UzyA4YzTABrDFwmtTV5nvGHN74
	DPTsZNZFgVkKLNO4toQ6CibJb0A8UYsyogOWjVNAXq9A3cTd2bNZ5Q41p2VgGLIXBcrVMY2G0gj
	2graCSvUkqAogfbqJJDnm6ZwBB/LLF1gC4Kn4k1udR6oUA47TD6ZutBpsQB1U+nwboFao
X-Gm-Gg: Acq92OHChtBtZqL1Ft+ORqbo7/jv2oJE1XZZEEI3+YbEzixJzRleOG8pO4llOieQKDW
	VQWnzb5iK9AyHRiex2qTnx47y5paV2hpoCJIqO8ynwRUxxA2TrRYK636NpC2GBORC9RwbhcadzD
	XvGRSP3XPGOA1KZkJVDt0FnoQYhjBXARoz98pToHgGQvlmMK4IvCdTcYmTlzY9aMpFtDJYqjY+C
	Vb+WSm32u6oBO+PU7dBic9DgUuQmdrV50nodJMc9YuGIvypdpG5nWPsl/iv6yQYJmL66QR6p+oB
	ZrKjhh5SGFkzWSXzHbb99KH0zkkAXnS1H+iBSiydBFAmBLnen/JjLe6yiIn+8O7SWP8LJsdv7YF
	4gJfbti6ZkxRJKau4jSnUHXk8WmtxWw54K1KWYd3xfuhT9BrEw/A=
X-Received: by 2002:a05:6102:5809:b0:64e:32c3:1371 with SMTP id ada2fe7eead31-71e88ae97edmr7413220137.2.1781538629715;
        Mon, 15 Jun 2026 08:50:29 -0700 (PDT)
X-Received: by 2002:a05:6102:5809:b0:64e:32c3:1371 with SMTP id ada2fe7eead31-71e88ae97edmr7413196137.2.1781538629266;
        Mon, 15 Jun 2026 08:50:29 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:7fe3:eaf0:5a0b:2610])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f450sm38643032f8f.10.2026.06.15.08.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:50:28 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 17:49:56 +0200
Subject: [PATCH v2 5/8] crypto: qce - Use a fallback for AES-CTR with a
 partial final block
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-qce-fix-self-tests-v2-5-dc911f1aad42@oss.qualcomm.com>
References: <20260615-qce-fix-self-tests-v2-0-dc911f1aad42@oss.qualcomm.com>
In-Reply-To: <20260615-qce-fix-self-tests-v2-0-dc911f1aad42@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1705;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=p2lkPad7k8iHoVjbfy8gEFAEKYRKdaoCK71ypvf9NhI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqMB8w9UYBQf8k/SKnm8wmtOfEsV351SVcyOtam
 4bNoNgfKBCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCajAfMAAKCRAFnS7L/zaE
 w0jPD/wOXCxa9itukT5y+o6hvqPIfJ09Oq6s90WL64CIcIRsLBuAlO1zm2uYbqKJNOhM0moWCQz
 OLkWL31iOZIoln+fCaCXfyugEeHsiALFzQUAXg8NMUbJ1HyGsIQRLjCQSe0ygxVC8mAUKkNDn8+
 6RONM8eYxhuguf/k8Ycejq1nHHCyYrr9u8hWnyyZTAiLtxAFkKdk3HgNQ25T5qmbdMKLGNbon3Z
 aX4fi6fP7vn19p/DwgZQUfu0ujf/X7LXopo0JVgjIRw8F8HONQWn1+NnlJQeC+fm0MTbF8NBT+/
 hdsoXzH8Vm6dGNRHqErbnYmvXFuljWkQBJoGbeQrbEUAocsWBwaU7DpOb/jVwsNCKG7XHDjyh7+
 LW/9qRJCU4guinuPzLRdkA0CSFx50+a95z0/KU0qJspftAp9VJMhGMANU7SC4yC+m97cNYery7A
 7oJeXPJMI3YcMO6a824zxEgs3OHl9ZqMEeCPz5gKO6ccGCX0vf5Am7WLNij00CsOotTZFH466Zp
 H2bz5ihj1ADsX612GABx3EcuAj7kSZHDcUtxJKqE2NJ2IXfoB841MGWHnIn18tht+J3zZrUvZKU
 /4fWeF5AjYC4WjPHyj3Yr0q3AfcbcHlS2XIWufxG7l/v9Yv0izNOOcR6cCSb2EjeFCepDZ3FPBK
 zXHIS2gHmPCqFow==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: C6ZQr1mpckgVjzlqpM3y54bfo_C-MRST
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE2NyBTYWx0ZWRfX5XYzKQYHo3w7
 89sFnJR97ka/G89WhfX0QPmlJCv0xvlFJ+ehWmacQmA5zlR4+6N/G04in/zZ59XLdhP1yyM9Dkl
 NIUq6Bo+BZ4O4q2YjGXV/08Wnfjwr0c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE2NyBTYWx0ZWRfXykoUuQ8jUf+M
 UfTynwbdLqueASdVK9Sn9L4sPYFd4QY/4i8yBDKkZC+cnqvsPIcbjeyUOTQ/V6jx4KIRtoekk3X
 nnIwsDlLbG65mqD61C+UvrRwKei9F8NSsGJlAMtFP4E5Xjeb4bDuTgmtIC8zSn5dr/pYqxTm9Nu
 A8UTEYJnxMjPYXGOm1sR2q864rEjMlRPG1Mdb4dIdPfPod9Be9UEpvUvHUmuZMCi7Gm4iNkWeoS
 EWlioM7B8qWuniex6emYmdyopHyrESAG9Rsz4RsKFII8SiHBkf9BnnMs6Ye758cVJrhIJqVjKdR
 fyQxza+jWxfcNwDppC0/ZP1gcBpmRY6RqGgHbQxhHXzA5c5wE5JgxQmO+9M/ybODOvSK0kFm3ao
 CfLAD/sJcgqVTS/EETh34WPec/3rvHWGx/AG/W0H53x7Kceu7m43Detq9Ksi48tea1+izmnEZr8
 JJxNxY5cmBZ1VheG3Yg==
X-Proofpoint-GUID: C6ZQr1mpckgVjzlqpM3y54bfo_C-MRST
X-Authority-Analysis: v=2.4 cv=AN2yTM5Z c=1 sm=1 tr=0 ts=6a301f46 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vUpbTSJP45I4i0_vGVUA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150167
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113216-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,mm-sol.com,oss.qualcomm.com,kernel.org];
	FORGED_RECIPIENTS(0.00)[m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:svarbanov@mm-sol.com,m:cotequeiroz@gmail.com,m:kuldeep.singh@oss.qualcomm.com,m:ebiggers@kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:stable@vger.kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 9DCFA687F97

ctr(aes) is registered with a block size of 1, so the crypto API hands
the driver requests whose length is not a multiple of the AES block
size. The crypto engine, however, stalls waiting for a full block of
input in that case, leaving the operation incomplete and failing the
request (and the crypto self-tests) with a hardware operation error.

Route AES-CTR requests with a partial final block to the software
fallback, which already handles the other cases the engine cannot.

Cc: stable@vger.kernel.org
Fixes: bb5c863b3d3c ("crypto: qce - fix ctr-aes-qce block, chunk sizes")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/skcipher.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index 379b45d2cd952a39c387e84af71238b53f7737e9..cf34278da30b1ffccf230ed194faae2352cb8550 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -277,9 +277,12 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
 	 * AES-XTS request with len > QCE_SECTOR_SIZE and
 	 * is not a multiple of it.(Revisit this condition to check if it is
 	 * needed in all versions of CE)
+	 * AES-CTR with a partial final block (the CE stalls waiting for a full
+	 * block of input).
 	 */
 	if (IS_AES(rctx->flags) &&
 	    ((keylen != AES_KEYSIZE_128 && keylen != AES_KEYSIZE_256) ||
+	    (IS_CTR(rctx->flags) && !IS_ALIGNED(req->cryptlen, AES_BLOCK_SIZE)) ||
 	    (IS_XTS(rctx->flags) && ((req->cryptlen <= aes_sw_max_len) ||
 	    (req->cryptlen > QCE_SECTOR_SIZE &&
 	    req->cryptlen % QCE_SECTOR_SIZE))))) {

-- 
2.47.3


