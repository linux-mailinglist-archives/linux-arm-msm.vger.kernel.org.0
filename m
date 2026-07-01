Return-Path: <linux-arm-msm+bounces-115560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OZQpO7pzRGobvAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 03:56:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 879926E922C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 03:56:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=d1HOLFYH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kDS+4cyT;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115560-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115560-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8332230C25F2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 01:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A119A361DDC;
	Wed,  1 Jul 2026 01:54:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5623C361657
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 01:54:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782870877; cv=none; b=gA9EU4bq/u3zOaArXuYQwarwWoHS11rHvChEnKUrutiRm/IonrewmUiPnW8OaK5tOziOJFpDrxkmkfETAGYmmeJN8tLhARedz2GWQHQ8LJsBZdk1kY2Huw8YwQR+FIM1m+X3nkGDOVCfGloyGPxUuMa96AJYjUaSwz7cgXnJ6TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782870877; c=relaxed/simple;
	bh=UN1+XndgFoWu6KIBACkmLA4ik7BBH53rNgnE7Gg8Qy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QvsL/tkc3fCn8uBwOGvWOcsEip/xmngGozzbg9C9n0J/6wJvGwboynbQpHWlc2g9gikuNiVa+CYFWHaxjVTUHodLk256K7xg7hmwMuQwp6o1OS44HSE9aANNU52M+GHp+IX7C2QuSNBib/hp7rLpOisbL3E0HpABl9aoOXUKHTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d1HOLFYH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kDS+4cyT; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6610uZXK3682389
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 01:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XjH1jV1M9hoGtGfFOL3DiSQcmeoiGuojoUXT0ExAk58=; b=d1HOLFYHKrEZJw+P
	E5L3IQNBM27NpRQ0fmE7yrUopMV5tYTqgjimzeQE0vcBnbkv/iOy6x5wo3YkaMAz
	ewawqP441vut3ziMLmndYzPXC8A9g3oFTpu94kxjCjQ2nz0oFqXgBmt8Pb/4E4eH
	mOQk2m2cRJYrLNOLx9DfOBirQzemO5hVMESNAPJLiH+oKKUuD9Nrjdo5tcyLxrsb
	n18eg7KIFtTuL+e0QzFZxETJkb5DwjSKKSy2KIAFgu/w0IydJMlAiNwfoNbA/ol8
	LLnB1z2etT397kZDxv4ISmNzPdq58x05gg3CLKyOUNlHOARHn8KZlIBVL6zbw6SK
	g8DNxw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4rsy04pk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 01:54:35 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c9960cf96cso1892865ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 18:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782870874; x=1783475674; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XjH1jV1M9hoGtGfFOL3DiSQcmeoiGuojoUXT0ExAk58=;
        b=kDS+4cyTUauA6sWmBsE0O9ZfFq17CGM2az7wrhkwhjuANJsCzyrhzHN9Y3MeIfyMzd
         K6zu0dEcWgzWTNtFBSwrsTl9mzCn/IJHylG62kqJE5j8vo7SsAuYb6Q6E6p1i6YW0Icz
         1mU+2CezXs7P3M5ppNB0lel+YnG1bMRNaYg3C6HHdbSbarPY4feFRb4XjeHqc2gc9Yeu
         oLHyVhRJhxsjUn7b3fa8dnu1vGTEDX86IhKiYq2K6Oyy7TB5sBCzRSyr4f0ayYtW2e43
         AHm5WDKdG9KZusDpFFZUpGlkmakisjYCgdNw0kmmmXWg8nJJRiWeRBCb6EQlVhfTkEHl
         K/Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782870874; x=1783475674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XjH1jV1M9hoGtGfFOL3DiSQcmeoiGuojoUXT0ExAk58=;
        b=iqy4yjQamk9zzoERO7d/6B+luSQeVCpzdQIjcE5Kn7gqNI5JWT5V7MeudkSOYOWO87
         rNSvugU6nQXVBzFg9drM8aO1LcBiYLfF+z0fBlp4hhlYmQde2tumQ+eDlfd+JdWGaYBk
         1uPrEuzzJWrgYuV+svk9+8gMsG+We+f61qk9WNjpxB3vODPDMi0nCta1uFXsFcHk0OgR
         fKXmnWPrZAmn4K72bMwGVG4JlQKyIKpC2XEP/4xja418VhzKOCMhaaDwOkvlgUJu5dXc
         gR3w9E6FmQPwRm0BVci3HJZftnnCQwXgRzpbW63KE1ckmc9w9G7up044cGtrL53ClT4m
         U8iA==
X-Forwarded-Encrypted: i=1; AHgh+RrkARLVDdDKuaxObd1GwgNt4/kai9juYL5QWDbbLkDdVLnSFsMbHaNkroE74Zrxi/Knt6pgb8XuyWgXHHT2@vger.kernel.org
X-Gm-Message-State: AOJu0YwWHCfGLDA5G0QqXR1P9szczqMTo+05LIvaE0uOnJc2OSwY9Q40
	E6DgIWxqw0MHKsc90EAS/xWyR6GilMLLIKcx/ZPlrT0TCUDYOuiR+zaE0FUIteTDUupfevl3Yh0
	XXtSG/EaHAyIITfvVgjTS4JiGYN2uxZoR9HGHzGxCS6l6lqLn10ZwFV5Ucd5I7aYXA6Yk
X-Gm-Gg: AfdE7cnHuP/1VznwYwU/fU5rv4F+KlohxcBNWCkwoy5PiHCz9e3eWi7F3yO0ToRQMeS
	k3G9c8hRVQVC8DKaNt65NVgukslJcH9wjZ+CNs6yhz+YRsh7LDHNQNtbu8AFVCoE5OjPsaus65i
	DLcGDrHNFf/nSsG62/bYob2nS8L2AdX0TMAjwdiBLWT4xO5hP+QxwWB6rKY4eroloKcU5My94Ne
	wS8Jrq6rgLrkOOfpWBiZmCi/M58AGNKE0b4UmcgevfI+UxXQwlicYciFvNr3qafghAdCrTvLR6n
	nVpxignSUwTBDXCeLOn2U+cMacTPc/v8VjvZd03g8IDD73G2l4i6i5ZOU7jaYlF/vWS8gMrG98p
	cVcvPrkb+74KbJCk+/6LmdHwGFyyvU5q1NXArxn8cnCEGk6dlaxspoTG6TK2TtiL6ZaBQ5QIfMA
	==
X-Received: by 2002:a17:903:2448:b0:2c9:feea:4e50 with SMTP id d9443c01a7336-2ca2d52e930mr52741045ad.10.1782870874042;
        Tue, 30 Jun 2026 18:54:34 -0700 (PDT)
X-Received: by 2002:a17:903:2448:b0:2c9:feea:4e50 with SMTP id d9443c01a7336-2ca2d52e930mr52740725ad.10.1782870873570;
        Tue, 30 Jun 2026 18:54:33 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37a7102esm23040315ad.6.2026.06.30.18.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 18:54:33 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 09:53:43 +0800
Subject: [PATCH v4 3/5] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-fix-tracenoc-probe-issue-v4-3-aefab449a470@oss.qualcomm.com>
References: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
In-Reply-To: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782870847; l=1646;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=UN1+XndgFoWu6KIBACkmLA4ik7BBH53rNgnE7Gg8Qy8=;
 b=sbrpn5D0WoIXPJr3xlIlgYYxZwy4hg09s34OElU6B/9iYKSPMpySzLDXd/hCsG1HtB0ZU+xsM
 Ni6Zc0tQ2r2AZ8fDB6S0i8TwGjUtr8JQhL/FuQGBVatYsLakUbb5bd/
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: NuKxvTa6IoQjwnYorE9CNoNkOOG2Ga6B
X-Authority-Analysis: v=2.4 cv=fLgJG5ae c=1 sm=1 tr=0 ts=6a44735b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=5VkFZXXe0QlYWD9W4eUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDAxOCBTYWx0ZWRfX7DRACfdT4Q/N
 GyBMgwDLEttrTLigXBHaMdyJzzy5V1pPg1zoq5+kwvRt68FU53emCMOpFiwnQlVxEX7pDZ0Ff/6
 ORU9O+qJr90m6uC8/v8P2R4nhy1BUsbmodYaAVrtDALtlsZQobR7/9P3TMdNWfNGEm5VhLcREcm
 50enWbJQCfaY+nvmoohcLtnKyTEGVoGuYVMBn/Y63hJmpFVq8K/KL5curhBQayJoc2N+SHW2L31
 FfQw+SLWQRIiPcsPw6qHEPLz4qIXeFR6EBsWSOUJPPaSM6N7OhuBV7OP+P+BPYYmKvxCtNGZwRJ
 uWLFsFiwOgW4JtXbpnqbXGrlUZ7MmGqZnq5eWS6kBLPwADjEbq4lFRbPkjqRkkcp3RfIntTfTDO
 NW0qQDhk/k5pVzQoVoJ3ts/SnN2HRHxygvhcGyfJWCvOUJ9DPe3l34VvV3r1ARvg0nTvq+5As/x
 NI3tSLcHmV8DbKtZsBA==
X-Proofpoint-ORIG-GUID: NuKxvTa6IoQjwnYorE9CNoNkOOG2Ga6B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDAxOCBTYWx0ZWRfX0hqgcwB7qGC9
 nJPI1I0OaNo1OUcVKJqYOoWJhPMpbJa/ixuM8OKpwrByGcFFaoqR3R9J49WGdTyR8Qs2rd53fLY
 EzBOlsSD+buISdOChWrmWo5p7AA9NvU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010018
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115560-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:jie.gan@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:yuanfang.zhang@oss.qualcomm.com,m:abelvesa@kernel.org,m:alexander.shishkin@linux.intel.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 879926E922C

The traceNoC node used the "qcom,coresight-tnoc", "arm,primecell"
compatible, which places the device on the AMBA bus. To bind an AMBA
device, the bus first reads the peripheral and component ID registers
(PID/CID) at the top of the device's register block and matches them
against the primecell ID. On this platform the traceNoC does not expose
a valid CID in that register, so the read never yields the expected
primecell value, the AMBA match fails, and the device is left stuck in
deferred probe indefinitely.

The Aggregator TNOC is fully described by the "qcom,coresight-agtnoc"
compatible, which binds via the platform driver by compatible string and
does not rely on reading the primecell ID register at all. Switch the
node to that standalone compatible so the device probes on hardware that
does not expose a readable CID, while remaining an Aggregator TNOC that
retains ATID functionality.

Fixes: f73959d86c15 ("arm64: dts: qcom: kaanapali: add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 7aa9653bd456..e98f4aa4b141 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -5004,7 +5004,7 @@ tpdm_pcie_rscc_out: endpoint {
 		};
 
 		tn@111b8000 {
-			compatible = "qcom,coresight-tnoc", "arm,primecell";
+			compatible = "qcom,coresight-agtnoc";
 			reg = <0x0 0x111b8000 0x0 0x4200>;
 
 			clocks = <&aoss_qmp>;

-- 
2.34.1


