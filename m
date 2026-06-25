Return-Path: <linux-arm-msm+bounces-114506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YWs4DrkHPWpMwAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 12:49:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C19C6C4D55
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 12:49:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UpahMKRB;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gEI6MQvx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114506-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114506-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 05E0A302F699
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 10:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01E24368D6D;
	Thu, 25 Jun 2026 10:46:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB1C2F5474
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 10:46:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782384395; cv=none; b=Wds5TJ4b7IfVtH39WmU/l5CiwCz+n4BWgk/g4ITva+CCd3HXRvK4SUNQ+4L/w+iSJNJK7KMrVF2mFcEdxPWwAo1wk0oi522POS6sT/pulR5Q9TmLDPWhyO6ylOWkBTTc7R4wcta9ia9FxJazDK4QWgjSTaLYYoPDZPwsDidkVUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782384395; c=relaxed/simple;
	bh=9EezabmICKllxnPSTbMv0/+FBj6ysKrEUMz0dUQTQTI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oxZDwVmYTDJYndmSCqyCEsICSE5Y5S/3fA9xemBWHirnp15Kcn6pgJIfqEfsX3YpwYRxv34NPu1cQV6JmJ9OlGJI8PdqrOMqC8MImeWPmF1ijZKCHFLAgxxprQO9Szbm8Wff/aDWQ9VNkpM1LHuv0EcbBP3GRgYwqXyzAJYdqCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UpahMKRB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gEI6MQvx; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9juNN1753960
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 10:46:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qkjyld+701iCJkcBnuuBcYNMLRsu6rC1sbHUZIe+tYI=; b=UpahMKRBhKE0Jbk7
	7iFFbDjh6eck7v0y0FOKyFvfcv0LFtpAWw8G9Ue2SrV8JCoRARH6C7HdR2XRDAo/
	Z4EaX0YLc33H9iO3dLY9jypQ8d9+w2iZtqBjsKMQZBvPkiDTCH/qCB+qNSGBSuUm
	HHzIjnHH+jkd5zzixMyJ/OVKCyrQIalWIWXK2lXtvvRmwEy/N/iW+KaS+duJF4Oc
	CElZkRVmSk8mW3or4FSB0nuqlL0xH3NaBsVW9cqzKfZHE3B+iiXnHcOeV49b/k44
	QZllIckG17fQlRS4wtTVV5+rVIE6Wt8bmfk6FHshpXEIBBtgRf3aC8iaRXcyEGuW
	Rkmq6Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0w0q1dv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 10:46:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c6b7d5118fso31340785ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 03:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782384392; x=1782989192; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qkjyld+701iCJkcBnuuBcYNMLRsu6rC1sbHUZIe+tYI=;
        b=gEI6MQvx4zXirfS/vRCCd9/t3jlAV8N8e99UrPaB0o7eeaYD10mpx2viF40PKihDBT
         AMAlgv6unOOLSeVI0PjWQe2tXMitdpRDPT97PlS1aB6VA6Rjp7Deoe+sYpWG2uaE5d/T
         f1tiTSFx8U6klgmkK/d89CbdaIqCjdNftwhjI7nM9TTjdB3KW1pFDU5EvHMpvjTMSYJR
         wCTzjgSnVrYgalKR8bjwaqz//bWxI552mGhdYIvOM7GltkabNjWK0bis6QXD19Qyf6XL
         mzFIpT8sGpkXIXiUl2v5IBRmDeEqGSE23L3/eokMM77kRPNfsuqSU3k6HMXSVlqPiqWG
         X2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782384392; x=1782989192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qkjyld+701iCJkcBnuuBcYNMLRsu6rC1sbHUZIe+tYI=;
        b=NFw4MKqb08kE/rWcgL2Yd4NyOkQKAjrhQ5fcKBNIkzZxstpTFEqP6zZjbEksctGj2L
         63llYEZUU6oNzAYVyxBn/4k56G0RXtm5sz7opTfXIUwqXa+cqsikJa0X+rtT27oP+HfN
         OSx2hcmr942HGpIqpJM0jLjPsQSYAa5xWZ1BLGEEhyN8rhEziNl5WDSYMOHwm+UQD6ge
         EH/dzp1mklsrWWYCChVVUp5bl92sd6KYyCS4c5pa7hEpcd676BJ16r9pOj7HWWt5tLVy
         Vc7CaC6afoIKl7jlQ7QJ/nPWk5vVagBOFS61nkYxQDjsvZJSUBho/hnEWbgFmPehRnWR
         Zvig==
X-Forwarded-Encrypted: i=1; AHgh+RqtRr6qVgapiPPJ1NTezn+sbRN1klXnt/coDs7rwSVk/rsvE/K3spAhPJuC+IXnsh9z3/ADLkl2h99uH3xJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyEeH4T2J1a/suu2OroT8r96hXz+S36bg78GKfQoMJHDA7hq+/b
	EqznFE9Th+Tb1/U4OMj9oVsRaRDYrdXSMapZxHPNjoWmRlrDzZpNcGlBrXrH/gIe0qsSQSHHnyq
	UZA8aQICaeqdGVgJN8Ggxy3H+mQnce1lMmPabNli+HsbC3VJkmfWwrXz6Lm9Qu0l3i7nH
X-Gm-Gg: AfdE7clca2H2jPIm8NGVWebSG/dIjNu+xjqUulO2PHR3yJ+VKzIF9NdtyLxExStpvop
	bOyxalYZ3Sf7tQIbDG9g1pzzU19qqwqB+eEWmtf1UAvaCli9qeEgxDDOFkzW65ELNqi/5IOepGW
	FRGdI8VhJ4BGSfg3opt2R4eo4FQIUY881k0yJhDx94lgWmzwwE38wnCwM2DqP3GwXa0AS9ynTOG
	5S9KZ8xzWj2Dw3FZcAHrtx7XUcM7jFZG8AL/o98Xe/HwEwOczyXbV8qyHWOxhqqrW+sgNYj1yob
	o/jFS1UhPvXZR8DjcSY+IPNAPm9wY+RRKg+FIfFemh06eOERiIFT88eNXV4fr1LlEfHfkfq0KlS
	sOX60BsbUEKjcVPhP7O36t0SGdHaIkDAGkONH0ylYHJuI5Z/3aKMgrBeTfXqjr8HH6nC5rhIQJQ
	==
X-Received: by 2002:a17:902:f681:b0:2c0:cb90:1dfc with SMTP id d9443c01a7336-2c7fc9eedf1mr20851655ad.12.1782384391912;
        Thu, 25 Jun 2026 03:46:31 -0700 (PDT)
X-Received: by 2002:a17:902:f681:b0:2c0:cb90:1dfc with SMTP id d9443c01a7336-2c7fc9eedf1mr20851325ad.12.1782384391397;
        Thu, 25 Jun 2026 03:46:31 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63d58e9sm17114035ad.60.2026.06.25.03.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 03:46:31 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 18:45:52 +0800
Subject: [PATCH v19 2/7] coresight: tmc: add create/clean functions for
 etr_buf_list
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-enable-byte-cntr-for-ctcu-v19-2-8fbbf22e8381@oss.qualcomm.com>
References: <20260625-enable-byte-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com>
In-Reply-To: <20260625-enable-byte-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782384372; l=7649;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=9EezabmICKllxnPSTbMv0/+FBj6ysKrEUMz0dUQTQTI=;
 b=1LmRdhr8uVlX7Vc805ZdGTqNtrE1gUymPtTdzVqNYrHsQqInykK2P0mFfoWdInF7GLHmDKilU
 xmtu+0reVpRAOJ5WCriGuc/gSdL/d95AECqwpWXsxuOOEud1ANPHZaM
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: cNDxsjU6VF3pDlsbvvy4Cx9mgGikvXl1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA5MiBTYWx0ZWRfX2EFHdFXkuTpb
 RZZ3l0vqcz7DAOXN1PxNUlc3ed45iCE/ViaQxiNM2ObLcLTcIGVWJFsYZHLsR3kdrnU0oZqQ9Wg
 O0TPnihLY0x67T3glFUNT73BAFSC0no=
X-Proofpoint-GUID: cNDxsjU6VF3pDlsbvvy4Cx9mgGikvXl1
X-Authority-Analysis: v=2.4 cv=R6Ez39RX c=1 sm=1 tr=0 ts=6a3d0709 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=wY6pATnJNnZAKtYNhpEA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA5MiBTYWx0ZWRfX56eWlJ395Hx8
 yxobOmttO681DbMJzRwOTRMofnBmzioJAXV9xbrZAMmRKfM6tHCe9ZhgTmPif/w8nnIvQ1idCO4
 lhRCLbNx0Zh1VGu/gTz3UHSPwKuP0EOCC7tiBN/y24DWhZhlWrKZT5FHhgYGB5EemXZTIkAr74I
 HTJdh8D3b2GbgWulJIeqhlGTbnH+DFhjxnVkPaNiVmfoYzv/UafGbjHLfFABo93iWgWxH37x3t4
 PWOp49RQgCpXxH8dEORkVFXJxTxiu+QbGfw4PwrmVkuvMR8b9lKA5jwDu1XipW9dtFH6KOrxOVi
 fI83o51QpiKz/I2ObLWrdMD0gNCWjGQiwBqO+SERBYfx+9eHAMHfsqqTz3/JsSSaf/hj3+iUtEr
 YkVMzxoRXIlvXNG/J6yMqK5ldVZGJMgnP8r6PYJCBNT77KUuLJvm0TKrE1yiUejJ5DXirjO5WVd
 B12NpZltC/dXvnaL1vA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250092
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
	TAGGED_FROM(0.00)[bounces-114506-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:alexander.shishkin@linux.intel.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jie.gan@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:yuanfang.zhang@oss.qualcomm.com,m:jinlong.mao@oss.qualcomm.com,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C19C6C4D55

Introduce functions for creating and inserting or removing the
etr_buf_node to/from the etr_buf_list.

The byte-cntr functionality requires two etr_buf to receive trace data.
The active etr_buf collects the trace data from source device, while the
byte-cntr reading function accesses the deactivated etr_buf after is
has been filled and synced, transferring data to the userspace.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c |   1 +
 drivers/hwtracing/coresight/coresight-tmc-etr.c  | 126 +++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h      |  17 +++
 3 files changed, 144 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index bc5a133ada3e..bc7dd676da47 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -835,6 +835,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		idr_init(&drvdata->idr);
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = "tmc_etr";
+		INIT_LIST_HEAD(&drvdata->etr_buf_list);
 		break;
 	case TMC_CONFIG_TYPE_ETF:
 		desc.groups = coresight_etf_groups;
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 361a433e6f0c..9b3ef73e9cf2 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1918,6 +1918,132 @@ const struct coresight_ops tmc_etr_cs_ops = {
 	.panic_ops	= &tmc_etr_sync_ops,
 };
 
+/**
+ * tmc_clean_etr_buf_list - clean the etr_buf_list.
+ * @drvdata:	driver data of the TMC device.
+ *
+ * Remove all nodes from @drvdata->etr_buf_list and free their buffers.
+ * If a node holds the live sysfs_buf and the device is active, the node is
+ * removed but the buffer is not freed; ownership stays with drvdata->sysfs_buf.
+ *
+ * Locking: callers must guarantee exclusive access to @drvdata->etr_buf_list
+ * and must not hold @drvdata->spinlock. The spinlock is taken internally only
+ * to serialise the @drvdata->sysfs_buf accesses against the ETR sink
+ * enable/disable paths. Must be called from process context: buffers are freed
+ * with the lock released.
+ */
+void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata)
+{
+	struct etr_buf_node *nd, *next;
+	unsigned long flags;
+
+	list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, link) {
+		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+		if (nd->sysfs_buf == drvdata->sysfs_buf) {
+			if (coresight_get_mode(drvdata->csdev) != CS_MODE_DISABLED)
+				/*
+				 * The device is still active. Keep the live
+				 * buffer owned by drvdata->sysfs_buf and only
+				 * drop the list's reference to it.
+				 */
+				nd->sysfs_buf = NULL;
+			else
+				/* Free the buffer below through nd->sysfs_buf */
+				drvdata->sysfs_buf = NULL;
+		}
+		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+
+		/* Free the buffer (NULL is ignored) and the node out of the lock */
+		tmc_etr_free_sysfs_buf(nd->sysfs_buf);
+		list_del(&nd->link);
+		kfree(nd);
+	}
+}
+EXPORT_SYMBOL_GPL(tmc_clean_etr_buf_list);
+
+/**
+ * tmc_create_etr_buf_list - create a list to manage the etr_buf_node.
+ * @drvdata:	driver data of the TMC device.
+ * @num_nodes:	number of nodes want to create with the list.
+ *
+ * Locking: callers must guarantee exclusive access to @drvdata->etr_buf_list
+ * and must not hold @drvdata->spinlock. The spinlock is taken internally only
+ * to serialise the @drvdata->sysfs_buf accesses against the ETR sink
+ * enable/disable paths. Must be called from process context: buffers and nodes
+ * are allocated with the lock released.
+ *
+ * Return 0 upon success and return the error number if fail.
+ */
+int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes)
+{
+	struct etr_buf_node *new_node;
+	struct etr_buf *sysfs_buf;
+	unsigned long flags;
+	int i = 0, ret = 0;
+
+	/* We don't need a list if there is only one node */
+	if (num_nodes < 2)
+		return -EINVAL;
+
+	/*
+	 * We expect that sysfs_buf in drvdata has already been allocated.
+	 * Wrap the live sysfs_buf into the first node so the captured trace
+	 * data is preserved. The list is owned by the caller, so no lock is
+	 * needed to read sysfs_buf or to add the node here.
+	 */
+	if (drvdata->sysfs_buf) {
+		new_node = kzalloc_obj(*new_node, GFP_KERNEL);
+		if (!new_node)
+			return -ENOMEM;
+
+		new_node->sysfs_buf = drvdata->sysfs_buf;
+		new_node->is_free = false;
+		list_add(&new_node->link, &drvdata->etr_buf_list);
+		i++;
+	}
+
+	while (i < num_nodes) {
+		new_node = kzalloc_obj(*new_node, GFP_KERNEL);
+		if (!new_node) {
+			ret = -ENOMEM;
+			break;
+		}
+
+		/* Allocate the buffer with the lock released */
+		sysfs_buf = tmc_alloc_etr_buf(drvdata, drvdata->size, 0, cpu_to_node(0), NULL);
+		if (IS_ERR(sysfs_buf)) {
+			kfree(new_node);
+			ret = PTR_ERR(sysfs_buf);
+			break;
+		}
+
+		new_node->sysfs_buf = sysfs_buf;
+		/*
+		 * Only the drvdata->sysfs_buf write needs the spinlock, to
+		 * serialise against the ETR sink enable/disable paths.
+		 */
+		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+		/* We don't have an available sysfs_buf in drvdata, set one up */
+		if (!drvdata->sysfs_buf) {
+			drvdata->sysfs_buf = sysfs_buf;
+			new_node->is_free = false;
+		} else {
+			new_node->is_free = true;
+		}
+		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+
+		list_add_tail(&new_node->link, &drvdata->etr_buf_list);
+		i++;
+	}
+
+	/* Clean the list if there is an error */
+	if (ret)
+		tmc_clean_etr_buf_list(drvdata);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(tmc_create_etr_buf_list);
+
 int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 319a354ede9f..6e994678f926 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -208,6 +208,19 @@ struct tmc_resrv_buf {
 	s64		len;
 };
 
+/**
+ * @sysfs_buf:	Allocated sysfs_buf.
+ * @is_free:	Indicates whether the buffer is free to choose.
+ * @pos:	Offset to the start of the buffer.
+ * @link:	list_head of the node.
+ */
+struct etr_buf_node {
+	struct etr_buf		*sysfs_buf;
+	bool			is_free;
+	loff_t			pos;
+	struct list_head	link;
+};
+
 /**
  * struct tmc_drvdata - specifics associated to an TMC component
  * @atclk:	optional clock for the core parts of the TMC.
@@ -245,6 +258,7 @@ struct tmc_resrv_buf {
  *		(after crash) by default.
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
+ * @etr_buf_list: List that is used to manage allocated etr_buf.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -275,6 +289,7 @@ struct tmc_drvdata {
 	struct etr_buf		*perf_buf;
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
+	struct list_head        etr_buf_list;
 };
 
 struct etr_buf_operations {
@@ -447,5 +462,7 @@ struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 				   enum cs_mode mode,
 				   struct coresight_path *path);
 extern const struct attribute_group coresight_etr_group;
+void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
+int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
 
 #endif

-- 
2.34.1


