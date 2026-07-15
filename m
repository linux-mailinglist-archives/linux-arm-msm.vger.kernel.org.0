Return-Path: <linux-arm-msm+bounces-119172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id btjuB+A6V2oOHwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 09:46:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D7375B91F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 09:46:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IELsDjao;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EjKcm9iw;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119172-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119172-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C607302DA1D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 07:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98B3F3C2BBA;
	Wed, 15 Jul 2026 07:42:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E263A9D8F
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 07:42:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784101365; cv=none; b=BrXk8D105kxAqUHln7EJvkkzerJLSv0CM+EnYNIkY19pcEOGIoZydnBr3BRf9g+QXjdtMW4Y+iKi+Y8O35tNGuH+xh2AaUZ7VR5UGaYjZcg1htSORfwHCikkUGsfvMuuUqowvuioxkw1LlfvyYjMZQaW5SHzcekJayNkQl5I1zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784101365; c=relaxed/simple;
	bh=9oH+Vjr1g1U59AVkJn5l7M12ohmJl2e6vcFjAWLVw/A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bGnUKWIhyF/uDOIfgmmsSfFzPJe6H3N5b1CYz6H1vF5fSNB9kLGGr4Gc/XQQafo4rHIrrBL6WkVf41Z4kNnOU7kdd7WFeIc8b2R6y3EmTYlk0Ehx9IqTUoEPGxE1/n4+t9IiD7iWwbDcDQzk23BG8PSFAGTbMnee/eBm32ELto4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IELsDjao; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EjKcm9iw; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3lJO62680218
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 07:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XRJYKP2BClcZKgSVOR9a78
	XzTsM1xElWRlbCfoWXGk0=; b=IELsDjao8l6hth97ASykS/XpQE1wCnsIBzndJv
	q7pBTVAQ7EgWnPRc7dqBoO8G8IpHWYWqG+LtNwJmsxL/WWAIo4KqNazo6ai6Wc4j
	JPEpM/dT/v6XaLnArqZTyN0n7PETJJ3oqJy836A5F8SlZDjug8TMmLhPmU0MXk2/
	ERwgsx8+ry/eZfTdxYfQ5IbiBUmzZ32Tw6T+JH/JkdcL3q5Wnfqx8CYDlX/gT6A7
	GZL65bo9l1OPd/CehjbQnbBbK3PSwUszNS/HblhABdZUXXTmCD8TEcVeeeiNmYS/
	W/N4LjxaqiB9XHhEO1FaRZtc5jv7imB/HGTH/jJwSSgLMSMw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnuum2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 07:42:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cefa1a2be6so15395995ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 00:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784101363; x=1784706163; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XRJYKP2BClcZKgSVOR9a78XzTsM1xElWRlbCfoWXGk0=;
        b=EjKcm9iwKhj02pDV6aC/AwT8I0ibuhr0IoYiU0BRwoTKKYd3IZxCjRwg8d7otDLJyk
         lih8u+sokFzw8cInEKuev9SGKEAsSsiwjvvJg4faBB8MVSDy23LEmeAm4/S4feRLO2P+
         WufBRnLR+E6tPdqOnUwItaHjE40HEw/d56eXMIvEGUxbp5afi4dxaidj5rw6+FLeSM0F
         5kn+Hbgsvo3zuLrW8D2dhe0W2gKKNfIpXcMm21Us/zaXPJu/zeTAlKIWxZTrEyNYN7UB
         VPKi2QvF2ga6r7kpLPojQF7O952JLBGT5JfaxhCMtmN8WpWI3FEsj1Dx8pNIAxo4mrHg
         OK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784101363; x=1784706163;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XRJYKP2BClcZKgSVOR9a78XzTsM1xElWRlbCfoWXGk0=;
        b=BYEICwr1X6r84xiHvjFbuawaAMai399MOX5b9HniyVniuK5RdLq/Ue68Fy6c6u+KZn
         f+nNbG0ws3IfFl8W4NB6EdLDZUTDHOcmvVdKbEQ42kFuGnDcEHDNfQM5FdoiOkorDtqD
         xmt8HKRjuk9qpxkqXRRzNzG21R1WG6F9mLtdjSyBqTaryb6aE5wP5t3bYoec5/DdfXre
         8T39iPi8/aRg9sTlD6uzBNqUWNQjMRpS3r5JKPbkngN8G98561LTl19yOrXc0eub9ar+
         hExsicIOqbbZKvWnmX+x9StBxstKgkofjKrT9rflLWjeF5kOOI9d09R1bTnOBavCGju2
         GsKg==
X-Gm-Message-State: AOJu0YzGWSv0J7SN8VF4My5ZgHDwYDDIwMiF7aUFPKAo2eDFVv+fIPJL
	O4jlESgGGkiqx+6gQoUEOyxnPlx/k4JA4baTrTr5X+QL4veBVO/AEJcqrPTNZcSfr8CTKPE7kxG
	bu1yk+Frk6LOP9OWQ5m5cCBqkWFnBOvAEddr6pa4GaYSWoMXXPd1ryiB4If9fNXz4R6Np
X-Gm-Gg: AfdE7cmBc92DQS8Xo1cFp0kFiKpy171v0kbkj0Q+9W4x9nW016DjMD9k6BEHrox7LKx
	E/0h0Bry2pMJ3BduqMcyuGGi/87C1J1p6l6rSl1QL+8p3yOArY+LwgnR4CLhJweNTkKZ/aVfD3a
	Zz0y8Q3EziUdYxyXrNqT8sOajbpfCKYVXJXPh/cARz5vAr4CPUPlduv2dNeMS787axEVAi+RPVP
	SSLIRmmU4MWMNOKVAQ+dhpSr6GUDBQffTnCXAIcMWWY9WYurnxspumOS5af1jZZk7vsVf4ZBYOk
	9AHg4/7ef+CwBR4bAkZ5HCojryT2CqItcTkMlZRUmEoF2aMWnXGrK0UjY2iUQvPD96exHEfm6FD
	hRyPCx7dpReuLjm97j97shAa0UomXRw==
X-Received: by 2002:a05:6a20:6a25:b0:3bf:a0e5:999f with SMTP id adf61e73a8af0-3c11063c389mr18411416637.22.1784101362881;
        Wed, 15 Jul 2026 00:42:42 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a25:b0:3bf:a0e5:999f with SMTP id adf61e73a8af0-3c11063c389mr18411387637.22.1784101362380;
        Wed, 15 Jul 2026 00:42:42 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af7d58e8sm10921751a12.2.2026.07.15.00.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 00:42:41 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: [PATCH v4 0/4] arm64: dts: qcom: Add PMIC thermal support for
 Shikra platforms
Date: Wed, 15 Jul 2026 13:12:20 +0530
Message-Id: <20260715-shikra_adc_support-v4-0-5e07b6d21429@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANw5V2oC/33OwW7CMAwG4FdBORPkNm1Sdtp7TBNKE2cNUFLit
 gKhvvtShgSHjoul37I/+8YIo0diH6sbizh68uGUQrFeMdPo0w9yb1NmOeQSZCY4Nf4Q9U5bs6O
 h60LsOYDayhKwVtKwtNhFdP5yR7++/zIN9R5NP0uPiYjnIV3rn2ONpz7E6/2VMZu7b6+OGQdeK
 luiNMoVyn4Gos150EcT2naTCpvVMX9KCraLUp6kylotKqdqJ/6TxIuUwaIkkmStqQpwRoOGBWm
 apl8h112FdgEAAA==
X-Change-ID: 20260613-shikra_adc_support-0079650eb76c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784101358; l=2403;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=9oH+Vjr1g1U59AVkJn5l7M12ohmJl2e6vcFjAWLVw/A=;
 b=QzLvuvD9GgQG+dj9BeW/MTl4QA1BDPA2oNGyiDpQxlsDeAlqAluw5NsPVolsSX+Ha8PxFLSSR
 dJz5PBGPnahCswTrtazUFUBzYtyksy80Id+5ICe8TCQq16BY/6QkG2L
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-ORIG-GUID: ILacfXkoqrUUxTLP87xmuHl_Qc9Bj353
X-Authority-Analysis: v=2.4 cv=E+v9Y6dl c=1 sm=1 tr=0 ts=6a5739f3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Ehwq6YvRiQ2Q07RnrmwA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA3MiBTYWx0ZWRfX/LKfiBf9swOT
 DPpefOVqLbgz9PcpwSxB0/IG1ZPxf3YdPZoxWoBuxCSt3AjDmb5UtjvmbbC4RBWXAzhAsQo0eiB
 qyl8GuyQFoDThv7wHFTF4OO0s5Iq/wLRi88PQ6dYcjw4xi1RObQF2nVy6ubcOR0LxtoI3vR+8ie
 RlDJG6s9/i8WRwXbjupZoWYhFW1xtRKoujFX9JMpG7fXL9VtnuRsYbd4BkxXs1b6LTgGrsnxyq+
 NR+/r441bQ8PbtTn4shxTpGK3Y0R+vtJzN0S0qz/w3RGWv38pooqIiKwBWSuZ4Vh2ZDlKuiVYPO
 8zjiLdvRAXNJws/Etiezltx5Z1kpxMGnZB5332SbDKVsOcT8euj+e3rrDznEz319wTnWQ3oaQkh
 WAKE3LZ+kB0byDRs9tw8YRfEW5sWBaNPTTsGfp3d3WN02KelEvXxWuHtE+9kbWgzrSMmeo7vmXO
 tp93YQI8K4yMofhWY5g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA3MiBTYWx0ZWRfXxl0KLEWgGMug
 8mDOSFBz845uf6fMX910cSrQ1VdyOgL20nus+7D5D5cq3kvkT6ECf+FvZ134Dk7CsGRDbqPNJUw
 OP/hIpW+WfQxe8/K5h5QdT2yCyjm4nA=
X-Proofpoint-GUID: ILacfXkoqrUUxTLP87xmuHl_Qc9Bj353
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150072
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119172-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:rakesh.kota@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,msgid.link:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 81D7375B91F

This series adds the following:
- VADC and temp-alarm devices for PM4125 and temp-alarm device for PM8005
  which are used for thermal mitigation on Shikra CQ2390M SoM platform
- ADC thermistor channels and thermal configurations for same on Shikra CQ2390M SoM
- ADC thermistor channels and their thermal configurations on Shikra IQ2390S SoM

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
Changes in v4:
- Collected Reviewed-by tags.
- Updated the pm8005-thermal trips to hot and critical.
- Link to v3: https://patch.msgid.link/20260710-shikra_adc_support-v3-0-ddc840fca0a0@oss.qualcomm.com

Changes in v3:
- Dropping the polling-delay = <0> property from all thermal-zones as suggested by Konrad.
- Link to v2: https://patch.msgid.link/20260709-shikra_adc_support-v2-0-8dda38f7bf3d@oss.qualcomm.com

Changes in v2:
- Move thermal zones to their respective PMIC files (PM4125, PM8005) as suggested by Dmitry Baryshkov
- Rename generic-adc-thermal bridge nodes to therm-bridge suffix (msm-therm-bridge, pa-therm-bridge,
  quiet-therm-bridge) as suggested by Dmitry Baryshkov
- Update commit messages accordingly
- Link to v1: https://patch.msgid.link/20260613-shikra_adc_support-v1-0-57d5e6c7f47d@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Jishnu Prakash (4):
      arm64: dts: qcom: pm4125: Add VADC and temp alarm nodes
      arm64: dts: qcom: pm8005: Add temp alarm node
      arm64: dts: qcom: Add PMIC thermal support for Shikra CQ2390M SoM platform
      arm64: dts: qcom: Add PMIC thermal support for Shikra IQ2390S SoM platform

 arch/arm64/boot/dts/qcom/pm4125.dtsi         | 104 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pm8005.dtsi         |  35 ++++++++
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 120 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 113 +++++++++++++++++++++++++
 4 files changed, 372 insertions(+)
---
base-commit: cc2b5f627e8ccbae1188ef2d8be3e451d7f933a5
change-id: 20260613-shikra_adc_support-0079650eb76c

Best regards,
--  
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>


