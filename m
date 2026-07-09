Return-Path: <linux-arm-msm+bounces-118097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Q2SDIAX5T2pirQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 21:39:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 197E9735170
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 21:39:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lsbcJ3Jb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bS4tNzsl;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118097-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118097-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A72D8304A8DF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 19:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04F183033CB;
	Thu,  9 Jul 2026 19:37:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FA23BB128
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 19:37:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783625827; cv=none; b=SwBoWaIzpPY7gX/8K5CP0Tv2uvLn3vlUN6poZdn5jCUB9WIUfECWT4Ttax4Y2KRDC1yLKsWtEc/JJiee8eFmt9bLR5RSBFx8CMxuAThjfWFgLJi/InWb6n7wD0+Hicp41KlFhZt5GOkrgH8DCpT8ARXQkp3Dihg2xdRi/HZpc9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783625827; c=relaxed/simple;
	bh=EaboPl1ImGf8gie79Ao9VF3kyTKCN6DKXHkklbf9Ibg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Woe1PKtA+f0rbeb0UUh4PBXZOCFsrO2EJKj1BtiD8L4JGnowgJv31Nl73gOi1tSUEomskDOMQi94tU1eYCOvgzFrbG6zlx9ORHRYf++QocP+q0W6yaHZftwPxQl6N2cnThi/ggLlmVNMywLk0l0AvMjOTlgTJBnD8Vta4C2WUyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lsbcJ3Jb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bS4tNzsl; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HXSPT2330204
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 19:37:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nPhm732jBhlGB+peJvi8LA
	pkzBp0th6wSjPdyqnTYjI=; b=lsbcJ3JbP8MGFgEfwPtBAs2/BSdpvQeo8UB7io
	RLQoLVmEboouBguiI6XqmT0H7Vum6r05GOZm2Gb214Sfk69e7qh0p2LcVfryBZHQ
	a6/wcdWjoeZJraWMZBoe2m7ex9p5UFH69DD1EYTb2mOzlGx6xkTD4ga18JbnskK3
	kn/WbKcK6kD9iUuzqp4jLbgFG5hGdA4W3UuagZe2hC+4SOcnhP+GhsX+a8ljVv03
	I8nYoFaQu96IM9Q54oYbA1C26IKKXdqL+wNfw0wxC/lZMrlRhdiN63jbFVIstXZU
	vNRC1edF7SZOnRGOJCRz5UMr5jTAiDL588Lg4Hv8TDigy9vw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf24rx6k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 19:37:04 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-738e5b5ef68so65352137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 12:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783625824; x=1784230624; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nPhm732jBhlGB+peJvi8LApkzBp0th6wSjPdyqnTYjI=;
        b=bS4tNzsl8eRbSzyZt75RhckAz0FPJ2jWbZ5tV8zEmxk7uhnO7gzi2KwkLH8YONU1Dp
         NJkVItP+9uEW0aSfodB0BJ3+v7p7y6kWtjND8giOj92s4vAg7Xx05c2F8Pqr7HiKzKZe
         gHOdRvCijPO7/5FnsSEM5n8iMGMe1shyeA9H2myL5LOStb/PXv3PmE4gIZ89vUTE8ojd
         H3G2qeP9eAZdPrtoIDKxdvt2WodEZPkNTGUuiQZ1A1FRiYqOuoO6+uJSWYbMLIvY45VK
         IySNh0faJ2+w1psZvV54FYlN3i7nC2d07N9c1Gpl2VWkp4Bwz+pdCeWoZS1zDWp9Oo44
         sb5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783625824; x=1784230624;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nPhm732jBhlGB+peJvi8LApkzBp0th6wSjPdyqnTYjI=;
        b=bgiOwBWLhvJoMNmK+x+vpylQUxrmJqNsChpud36jS3TaMW7tuSmkSNFCjWaiDqwhAG
         GFlrrsvkfSlvKOGloQKqWCjXjhqdRusovFMT0N+l2MZlSinqfzziDSVMfWWyTSVMgpfB
         Ea7SXR7OxGKnsrvDZQnH3uHIIx5j9Jo6Gkq32GdnxucQuuSuh1YeGSx49/MelFCNRIXi
         TJXjMlGBZookWx9QMRe7aINNcr0fEg79o33a2k1w7uKZribbXKYFfl7DtmPsDOewC4Py
         3KR4c1U2OgtPWpco5c9snQteOuXWHdsW+d8kFut2GhwIPTTaAIsQ+5JVpZhtrf7LrjRd
         EZqg==
X-Forwarded-Encrypted: i=1; AHgh+RrCIK9BwuBwDsvCgDZRAawDvLSGk8X3niSfqOcAQr544cIRCOT/1hPAQ4khzAwz3Zt9wlgc+mhdR714FxwJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4j9enIxyFwxTYRxU703IP9ZFGOmiorlnB1aQIc/hVl+2O56hF
	pyAe5sbKBgtmd3eONbEU6UIpDg5eDSjgoPcil/M7ltPbZe4gtmUsbYvVqc8Nl5oXseT4pbhjQQV
	c5T04R04icFHnA/REDxrU6jh4JzLHMZBg90E6XWEIj2RheetkQzaZMreoR8wOFXe1157ZWTxAxR
	ay
X-Gm-Gg: AfdE7ckURrFWrXU9L1CNBEmpoOEe1tyUm7DwHCB4UIkL9BMEoGl32NmMV9hB03vvGTU
	gvHomH5CsVm/FdZJOIYdeLbwduTpWcLxlWwml7Ee29iBrHZkp4sm1t4wTv1kmUARxfrvWTM9CMF
	9ETIWoXY/3TVF9iMdmb3mWEIW/N4E2XLQvxahhHV/vCKb9Zt7R7QbCxw/Ma4hE/6FLBA6HFCtRf
	wB/9qQ6JQRW5AIW4+JaD2sldPVC0iSzguojQF1AFG44vnIdi0qdBPR1l42bWYt4AikbQatJTHDo
	OyGgKcLxEcyAywTabl7fV8+tC5yAIfkw8stEVLn80nV7mcHwOhgWWhlRcwRh8ISPCmI5iXzfooo
	XxbqJKWFCGx6wA6cfaaFMSAXioeauXqsfx1hNSm24goNLGDW/jS9u4woyZxkvkEkJ8/ynLFcXWs
	9juht/oDmHvRgffkr4SIHH0TY2
X-Received: by 2002:a05:6102:3753:b0:604:f849:462e with SMTP id ada2fe7eead31-744dff2d5e5mr5264275137.25.1783625824221;
        Thu, 09 Jul 2026 12:37:04 -0700 (PDT)
X-Received: by 2002:a05:6102:3753:b0:604:f849:462e with SMTP id ada2fe7eead31-744dff2d5e5mr5264250137.25.1783625823708;
        Thu, 09 Jul 2026 12:37:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01caa635dsm46400e87.62.2026.07.09.12.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 12:37:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/9] media: iris: enable VP8, MPEG2 and interlaced video
 support
Date: Thu, 09 Jul 2026 22:36:57 +0300
Message-Id: <20260709-iris-vp8-v1-0-6af3ab578a7c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFn4T2oC/02Nyw6CMBBFf6WZtY21CpT+imFRyqhj5OG0EBLCv
 1vBhcuTnHvPAgGZMIAVCzBOFKjvEpwOAvzDdXeU1CQGrXSuCmUkMQU5DUaa01n5xmFpygaSPjD
 eaN6urtXOYayf6ON3/zMY32NqxF2D2gWUvm9bilZ0OMdj60JEhv+8FVs8U8Ued5ypV5Qq19pc8
 tK5rLZTAdW6fgDGfmq+zgAAAA==
X-Change-ID: 20260708-iris-vp8-8130cdae989d
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13100;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=EaboPl1ImGf8gie79Ao9VF3kyTKCN6DKXHkklbf9Ibg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqT/hcDUhCzQkdqXnGLL6KmRBw8GoXPF40QpwnE
 A9Ya2rQ0U+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak/4XAAKCRCLPIo+Aiko
 1QI4CACOMtsIrZUY4h1X8Ovn1PyWtBQ4Pf+QazyTWJTf9qAv/Hlvh16dSZPlKth3Odq862pehPX
 2T+T0ZlOo+oslCjv0pGmkw4rOgkt6+OwmPQK7ho013CG2uWZP5Oo5xPL9MxiPg1c5LIZEasVKgX
 OSDS/C0lv5pCzsPgdUqQ2QQvukSDea+PzHbR/OGW0/MwkoVZ/7lRW1ZIhEM23bulpR94UtfKG+6
 6i3zrFuDfVf1PgJb2ct1eOl9BOkUmSsNtmmp31aRW7nnUcF04fDqnQrk8JWJF4GPMsjCQCFWDrW
 Djg9kgPt6dKkCsXe6+T9evzSbR90xQvo/pDpn30a/dhNe2xm
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: rqErA-vJBuKS0yODwoJwc21JdMvmr5Rw
X-Proofpoint-ORIG-GUID: rqErA-vJBuKS0yODwoJwc21JdMvmr5Rw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE5MyBTYWx0ZWRfX3cArCVbXaFQP
 q2BnBcz0xxROtEJ8fyawxGws8qg/v6cll3w3XObyup3FgIyJ0XzNIsLg+g+Qtu+uiuZN35SDCm9
 lUUlXe4omPz/cchp09nZ81RzB6RkHjw=
X-Authority-Analysis: v=2.4 cv=daKwG3Xe c=1 sm=1 tr=0 ts=6a4ff861 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=QT4WUqlxhLIOK1lYP6oA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE5MyBTYWx0ZWRfX6+iX3WNJqvGs
 JlJyg4Hs3H2kOtBj8V9YZMYQmJm1xh2kxsqSQWqIWJbDlRkiraJeo6kohJYj/QzzMEYkeXzYNET
 4z+nJst1KZvPgyEq7hOONGoRX5UVDy/mtRVw3dvjcNXrtGyWQXvzvdR/V/ABD7e+5rxaBSFKiPc
 gwu4/pEFJnXjle9/9djWJP+N4JdDTPdl37T0pIPav2aPrM1ufZHSRxpRSq/2WqO2aWeCEdsC9F9
 qGxP5pJF6E8HdA0MncvqvbkdE6cqs6FrKG/BDIuaQ8oRhcpk7ckhMv9qvBoYY52OiI+Ch/lpa+F
 MbhuGBubzm8i+/o2BBvOQacOuOyf5gj5MXKdFEVFtMKBYEUUEHKElZnt3NBwXAyX+ixyK8xRhtc
 3Y4nXirWoY7YHwqOURPBNP6jrjKDtqDjYnUgnveyqujIZhlGJo0JQIrTVw+HolY4WBmZ/AOaCpJ
 8aL8Wg08UKtkutKZksQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090193
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118097-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 197E9735170

Bring back features supported by the Venus driver, but not supported by
the Iris driver: VP8 (encoding, decoding), MPEG2 (decoding only) video
support and also support for interlaced video streams.

On the SM8250 (RB5):

debian@debian:~$ v4l2-compliance -d /dev/video0
v4l2-compliance 1.30.1, 64 bits, 64-bit time_t

Compliance test for iris_driver device /dev/video0:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Decoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 7.2.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Decoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video0 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 6 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Total for iris_driver device /dev/video0: 48, Succeeded: 48, Failed: 0, Warnings: 0

debian@debian:~$ v4l2-compliance  -d /dev/vid
v4l2-compliance 1.30.1, 64 bits, 64-bit time_t

Cannot open device /dev/vid, exiting.
debian@debian:~$ v4l2-compliance  -d /dev/video1
v4l2-compliance 1.30.1, 64 bits, 64-bit time_t

Compliance test for iris_driver device /dev/video1:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Encoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 7.2.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Encoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video1 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 34 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Total for iris_driver device /dev/video1: 48, Succeeded: 48, Failed: 0, Warnings: 0

|Test|FFmpeg-VP8-v4l2m2m|GStreamer-VP8-V4L2|
|-|-|-|
|TOTAL|48/61|57/61|
|NOT SUPPORTED|0/61|0/61|
|FAIL/ERROR|13/61|4/61|
|TOTAL TIME|10.558s|9.834s|

Failing with the Gstreamer and FFMpeg:
 - vp80-01-intra-1411
 - vp80-02-inter-1412
 - vp80-03-segmentation-1413
 - vp80-05-sharpness-1443

Failing only with FFmpeg
 - vp80-00-comprehensive-018
 - vp80-01-intra-1416
 - vp80-01-intra-1417
 - vp80-03-segmentation-01
 - vp80-03-segmentation-02
 - vp80-03-segmentation-04
 - vp80-03-segmentation-1425
 - vp80-03-segmentation-1436
 - vp80-05-sharpness-1439

|Test|FFmpeg-MPEG2_VIDEO-v4l2m2m|GStreamer-MPEG2_VIDEO-V4L2|
|-|-|-|
|TOTAL|36/43|30/43|
|NOT SUPPORTED|0/43|0/43|
|FAIL/ERROR|7/43|13/43|
|TOTAL TIME|71.857s|62.045s|

Failing with both Gstreamer and FFmpeg:
 - att
 - sony-ct1
 - teracom_vlc4
 - tcela-18
 - ccm1
 - ntr_skipped_v3

Failing with Gstreamer only:
 - MEI
 - MEI.stream16
 - sony-ct4
 - sony-ct2
 - sony-ct3
 - tcela-16
 - tcela-19

Failing with FFmpeg only:
 - test

The following H.264 tests now pass because of interlaced video being
supported:
- cabac_mot_fld0_full
- cabac_mot_mbaff0_full
- cabac_mot_picaff0_full
- CAFI1_SVA_C
- CAMA1_Sony_C
- cama1_vtc_c
- cama2_vtc_b
- cama3_vtc_b
- CAMACI3_Sony_C (Gstreamer only)
- CAMASL3_Sony_B
- CAMP_MOT_MBAFF_L30
- CAMP_MOT_MBAFF_L31
- CANLMA2_Sony_C
- CANLMA3_Sony_C
- cavlc_mot_fld0_full_B
- cavlc_mot_mbaff0_full_B
- cavlc_mot_picaff0_full_B
- CVCANLMA2_Sony_C
- CVFI1_Sony_D
- CVFI1_SVA_C
- CVFI2_Sony_H
- CVFI2_SVA_C
- CVMA1_Sony_D
- CVMAPAQP3_Sony_E
- CVMAQP2_Sony_G
- CVMAQP3_Sony_D
- CVMP_MOT_FLD_L30_B
- CVMP_MOT_FRM_L31_B
- CVNLFI1_Sony_C
- CVNLFI2_Sony_H
- FI1_Sony_E
- MR6_BT_B
- MR7_BT_B
- MR8_BT_B
- MR9_BT_B
- Sharp_MP_Field_1_B
- Sharp_MP_Field_2_B
- Sharp_MP_Field_3_B
- Sharp_MP_PAFF_1r2
- Sharp_MP_PAFF_2r
- SVCHST-3-r1-L0
- HVLCFI0_Sony_B
- HVLCMFF0_Sony_B
- HVLCPFF0_Sony_B

Following tests had to be disabled because they cause firmware crashes
or IOMMU faults (this behaviour matches Venus one):

 - CAMA1_TOSHIBA_B
 - CAMA3_Sand_E
 - CAMANL1_TOSHIBA_B
 - CAMANL2_TOSHIBA_B
 - CAMANL3_Sand_E
 - CAPAMA3_Sand_F
 - CVMA1_TOSHIBA_B
 - CVMANL1_TOSHIBA_B
 - CVMANL2_TOSHIBA_B
 - CVPA1_TOSHIBA_B
 - FREXT01_JVC_D
 - FREXT02_JVC_C
 - FRExt2_Panasonic_C
 - FRExt4_Panasonic_B
 - HCAFF1_HHI_B
 - HCAMFF1_HHI_B
 - HPCAFLNL_BRCM_C
 - HPCAFL_BRCM_C
 - HPCAMAPALQ_BRCM_B
 - HPCVFLNL_BRCM_A
 - HPCVFL_BRCM_A
 - brcm_freh5

The summary of test results can be seen at
https://github.com/linux-msm/fluster-tests/pull/2/. Test results for
Kodiak (RB3 Gen2) mostly follow results on SM8250.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (9):
      media: iris: translate Gen1 profile/level to HFI enumerants
      media: iris: account for UBWC extradata in the QC08C buffer size
      media: iris: add support for interlaced decoded content
      media: iris: split Gen2 firmware data for vpu2-generation SoCs
      media: iris: move the decode format list into the firmware data
      media: iris: add VP8 decode support on Gen1 firmware
      media: iris: add MPEG2 decode support on Gen1 firmware
      media: iris: move the encode format list into the firmware data
      media: iris: add VP8 encode support on Gen1 firmware

 drivers/media/platform/qcom/iris/iris_buffer.c     |   3 +-
 drivers/media/platform/qcom/iris/iris_ctrls.c      |  33 ++-
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c   |  82 ++++++
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 127 +++++++++-
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  51 ++++
 .../platform/qcom/iris/iris_hfi_gen1_response.c    |   6 +-
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 279 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_instance.h   |   2 +
 .../platform/qcom/iris/iris_platform_common.h      |  18 +-
 .../media/platform/qcom/iris/iris_platform_vpu2.c  |  12 +-
 .../media/platform/qcom/iris/iris_platform_vpu3x.c |  17 --
 .../platform/qcom/iris/iris_platform_vpu_ar50lt.c  |   8 -
 drivers/media/platform/qcom/iris/iris_vb2.c        |   2 -
 drivers/media/platform/qcom/iris/iris_vdec.c       |  10 +-
 drivers/media/platform/qcom/iris/iris_venc.c       |  13 +-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  78 ++++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |   6 +
 17 files changed, 682 insertions(+), 65 deletions(-)
---
base-commit: b9810cd75b9fb56a3425d391cba3f608502bd474
change-id: 20260708-iris-vp8-8130cdae989d
prerequisite-change-id: 20260507-iris-ar50lt-06228469aa5b:v7
prerequisite-patch-id: 8b5a1be5778fb4c7feb069452ecb60e8b8dfc3f8
prerequisite-patch-id: e669517302297a7b315c9aa4f4189e4928091e0c
prerequisite-patch-id: 922bc325dbd9a499a3a209d2f8dbbce6a4166e60
prerequisite-patch-id: a5a49cda4e21d835558fa84f2f6bd25b8f7e72b4
prerequisite-patch-id: e62e8285bcbddade64c026379f23a8c5ae70fe52
prerequisite-patch-id: cac29b25348e2e791638a0286283109f2546f9a7
prerequisite-patch-id: 4dfaff2f9644d7a168b1b35fe947660b8f464af6
prerequisite-patch-id: a26fa49eefecf2b5ba6cf964be9327eb5ba5929a
prerequisite-patch-id: d97c79463fe1487fa7bc9eebd4cfb4610713f44a
prerequisite-patch-id: 76eafea8230160a3b5e6503c68a5c9c3c2d1497e
prerequisite-patch-id: ea9cd9a8e6561321cd9cf338a76da1382ff47e13
prerequisite-patch-id: 26e9083b709cc8f2f1184edf6b39fb89f365a9f1
prerequisite-patch-id: ce4576bd3d20880939a97a1cda9bb8678808ea65
prerequisite-patch-id: 8c94bec467b385c373bd98eb9ee5a5805fc4e6a6
prerequisite-patch-id: 6e258cd475b77927d6476704cbf91bf48a63aa0d
prerequisite-patch-id: 54c8855d0721ba8667d095e6ad6556c2021f89e9
prerequisite-patch-id: f5479d2ca6b850c0c750944a8e0b05a7df2cc5a8
prerequisite-patch-id: 96dfec1c2df69f748c1a4bd741628e946cb7bec1

Best regards,
--  
With best wishes
Dmitry


