Return-Path: <linux-arm-msm+bounces-113290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kWEIGdOTMGqcUgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:07:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0972968ACC8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:07:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hbYRMHxY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Dv7W3rby;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113290-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113290-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 001E43039887
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 00:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15C6D243376;
	Tue, 16 Jun 2026 00:05:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4791A9F9B
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:05:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781568342; cv=none; b=oUd7TxsZUM0coM3lqfkdZ3Fq2tSAielrrnAj4EQxa9kytXvCI/EVPjif3tc9V6FMWqnMEi08YiCLFFcNzj/JNTvfOwkLz/HPe40FMzZEcJRYviGIpSK2EzsSk8xTUbwQtKl4yCNaoRbMdOCKAZrk6CnBxm8DOs/G9L7WAuJU55I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781568342; c=relaxed/simple;
	bh=bBMr05z3+hZKyiKnqtJur9lg4bNIQFaGUAfGEfPWSb0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fIa7K/WN6FLElsQITGU3Q7ArFgfC7fI/34zrUDT4ZFKpQUw2cbBGg64cAFl0bgpTaPxVGHgKaYXYrg5suACyToOnAib5H2kNKW8FPKy9eN5mcxJ2x/w3stsY9D6cXwHXBHd/A0T5SUTwN21eqJFPAYSkA/CefVESbjKi9vXWcv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hbYRMHxY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dv7W3rby; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FIxDGG861104
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:05:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AWJObvt7y+kbPGRMk8Pkpq/KWzg0qp4Ve45uTUJVorU=; b=hbYRMHxYe02vlCT0
	X1snr0Mh87ob7zj/yEWy3In1nCSZpwCIeboJPPLhf4sGV4h3/Oa0IMbMrDaUAQWP
	jp9zSmbFz1PibTYAZaPh+1pTGQO4Y8jlYSfKNf0iBaDjQRACD4mKOCqgNJbJAw1G
	Vsb1Rso3nI8MAjDUV4x2xWl4pYAE2OkJ38l0VUnpHHeWpJNvd4n3Ykce6PLfUEA7
	sjQxuBpFBewvhsad5Y0KfNg5iavHT/RpjQVUjq4+JiLFsqrHgUBBpMaOW7txnQxS
	mfQgGp2YoM8R5pLSHNSv+J4zVcuue5VDuT1tvacYF7l//1jf9PKpCTfP0vO3Mw3b
	P3MgQA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eteydbmtu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:05:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9157db42dd8so741407885a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 17:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781568339; x=1782173139; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AWJObvt7y+kbPGRMk8Pkpq/KWzg0qp4Ve45uTUJVorU=;
        b=Dv7W3rbySsPoSONWjBsPhmVYXs0exN5NoUFnVjNzhI736GroNDAYLQojEvbm5H43No
         0G2ZopllZqdgSq+H0u648/O+53dAch2IMG7+bTBpqSd8Nxa3K7ySxjIZqAD2G+RAnUIN
         y99vTJKEMyj7viQTNwBQC3TFzktab2VmSxsN/Uc/Y3T/cIhuGVtVDD+Ake0PsJptbrxL
         usAR2QMgK/d0F6Dm/dVkkBeQM+VZPHPDVsnXV8CCRYDm1ij1HTgaOkaT3elaOQgcF8ix
         oSb/oYGPxaBjbYl9XNrCw77pThYafXQByyMYBxVuO1QnBGxz1qRQj0JTDxG24S5hVapg
         ZP0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781568339; x=1782173139;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AWJObvt7y+kbPGRMk8Pkpq/KWzg0qp4Ve45uTUJVorU=;
        b=GR/7kPPUrtOpama3ChJThVBBOv9hMLsSJseBgakjVOBGMxAu5IuETNv15fTaUS0+lE
         F+O2/gZOJihshyKWZYa1z8wSK3ZAVJwEGdurO7Y4OzxgcHq+JDKcH82udjaHgBZMe2Dt
         /AonIh7G7pe6fBKLd2ZfxbMltynSFFTkNzNeraH84OKMeJamPl7p4CXO8G7bDDQ01VIi
         XOxmFTK0Ro4eOEgKxyAwlKCnucxH3Jqyi3LD9OmwzXbRt76OPVmSpVLLR/IiLhh6nPFK
         YkdyBIKaoJYHMnkll7oUQvZwXZbFPz0lkQAP4yFsoVrkiDPyaXGkc8CF9yZXIhFiT7RD
         BnLw==
X-Forwarded-Encrypted: i=1; AFNElJ9WsOpC6RMb0xWxAPlU5LJGrKra0P3UyERMi5l/l23ndkQUy8oV1VG5PNisAqiDI8O46AulbWMa0Yyz2q10@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ/ystSRqXRIdrvZJiU74GopuILXvZMuC5UefoUI/zAB/nIDES
	6FfJQkp7JsUzH9eE971jUdTV0m0oYDkB4xCRIEcgDEmS8vWNh1A0lrOrQTdakMuTqivUBz0ior9
	d/ox7XEYrp5p6nbBI79d6NtSaXPcP/AeNEVMTSAY2xsqPUKQ2n7PIkuSMDH+GgFYZ9yDF
X-Gm-Gg: Acq92OFg3+CqcgA00YsYqtcDeM4ws6hK8HPwVXn+4v5o+0iSA3lcHbslmiVX3N35RsI
	RrwGGRRNLkgSNzDy4cqpSDcPlQ9A9BA0sTL7SVlTUph6Pyzo3dHK7h2fpdXWcfmk2OAe8tOlY2l
	j35Cc1qxn3/4riOHwvsVodHsAMtyIJS56HKLaxv2+q3/7/4UHONvOJaQGIw475Fy2P0OAVLPAn2
	Fk+9KRSaMLRkVx1NrAs34ivQ9ffPdlFKdBI3+6p8ov/ewhWNjDXaRXntFF6GN3U8NrrXv+hhliv
	qo551ANQ7YIfOvQtOGO8v9mkYoqg9Gu7SUUVz+CGgVoE4DZwJqR3KeFj5lf+8vKbQ54GGjncU5H
	5bdpvnvZC0o4WfO+qmxkJ+9vzggUU0CHiYbykRz+jpjfIAvBh7KrtTpBlQy261dbt10wTq8sRQ0
	B1OZ/kNaSvboKuBSGZkF6WJXab/TEW7r5UVro=
X-Received: by 2002:a05:620a:2992:b0:915:86a4:6691 with SMTP id af79cd13be357-917efbbd2d6mr2192263285a.4.1781568339054;
        Mon, 15 Jun 2026 17:05:39 -0700 (PDT)
X-Received: by 2002:a05:620a:2992:b0:915:86a4:6691 with SMTP id af79cd13be357-917efbbd2d6mr2192258785a.4.1781568338659;
        Mon, 15 Jun 2026 17:05:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a7092sm3015731e87.50.2026.06.15.17.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:05:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 03:04:42 +0300
Subject: [PATCH v5 15/16] media: venus: skip QCM2290 if Iris driver is
 enabled
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-iris-ar50lt-v5-15-583b42770b6a@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
In-Reply-To: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1810;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bBMr05z3+hZKyiKnqtJur9lg4bNIQFaGUAfGEfPWSb0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqMJMQ9jyjI0xtGZm9mkeQcVIITP3V5I9BWIzP2
 B+zypqYjDCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCajCTEAAKCRCLPIo+Aiko
 1ckNB/9gQAoQXZ9c6otmE0V8YpLudu7XUS3NIMxAZq5Vra5YVT7sFL3y94zeBvMGRjioKK5ssTy
 O3Ty2uYR1qpZnWqZnDR261US0PDhbZ0kZyOUvxhoM3FjqvdpM9SOLKimUsyPQvdt7EHnavWdd9v
 pAkFOweeYp4QzGwT6LGBE//jSLILvsDSltX3AVoR+g63mA3WkKCoFAr1RqkrCHlQ5h8uwgR4Rrv
 mGBHpbpQT0vb86PPXdvYYzB3mM29lxjD794q6EprPbEWqtCwYDrYY5Ic1M3akqdjY0kNlaFsx6q
 0gemNMP79cm8yuXiuSwwySiJcG1vjQM+iWbkwZoL8iAbci+r
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: LGEp3PfF97j94v1TVwgIeet31Z0hu4iq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfX78u5X9vuKO1i
 j2da2iV0KfulX5V1NgTtLNK/f/sMYNRETcfPVsrJC0ncD3JrxE2broVRwB16Daukp7XRtOhrH7j
 /20WZfs+XdJdl3K77rLvMggz39cdEkk=
X-Authority-Analysis: v=2.4 cv=QrJuG1yd c=1 sm=1 tr=0 ts=6a309354 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=TAcc6fXARiqENDJ69lsA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: LGEp3PfF97j94v1TVwgIeet31Z0hu4iq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfXx+YzminKYBQ4
 JYCv2Zpzi+3mdZgafBC1cbeX0C0px/ajLdkU1FZSbUc4l6j2gyW9YKlMMFwaZ4ADhfcQLFFlzTM
 //CrlFPdqe8zhMMnnrdSm16DaYbrZXbL7lPYVUGqgkbk5PcZ+qluWrVFZAlEpAv3R2dJg7c66/j
 Cxnbzqmbo5uVxb1WfJ0fpok4TR8AeU1yfmPEHIpZqc/OaFWNKXuyJ+suXNsUzLMfXzxnvWOGtZ4
 CJ75Wd5jJ6wrBfkx/nj40WeHQiIAG9bYFh7WnXYs3QW2GqMXJLwIcXVNMxBPbAxmb32GWnl6d+c
 6ejYG3IHvCyvrp0ch6b1Ddb/c3ZziKHCrOAD9HGtY0P5dEtgJLHxoLL8edqU3NwawxMryfGHZDw
 lbnWZ5ygbJXYD5gVDgIv4NPs5kEvOqeyrhYT7ejs4Q3f2nSwUGMYVqTpL4ynnTs7ZGLnPA/7rmq
 CMrD2Dunz0Zg6+GC/Ng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150254
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113290-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0972968ACC8

As the Iris driver now supports the QCM2290 hardware too, there is a
race between Venus and Iris drivers on binding to the corresponding
device. Follow the approach used by other platforms and skip QCM2290 in
the Venus driver if Iris is enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 243e342b0ae7..3c88594eb1d0 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -1118,7 +1118,6 @@ static const struct venus_resources sc7280_res = {
 	.dec_nodename = "video-decoder",
 	.enc_nodename = "video-encoder",
 };
-#endif
 
 static const struct bw_tbl qcm2290_bw_table_dec[] = {
 	{ 352800, 597000, 0, 746000, 0 }, /* 1080p@30 + 720p@30 */
@@ -1169,13 +1168,16 @@ static const struct venus_resources qcm2290_res = {
 	.enc_nodename = "video-encoder",
 	.min_fw = &min_fw,
 };
+#endif
 
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8939-venus", .data = &msm8939_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
+#endif
 	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
 	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
 	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },

-- 
2.47.3


