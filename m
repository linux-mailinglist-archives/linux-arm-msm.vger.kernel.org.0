Return-Path: <linux-arm-msm+bounces-115586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I/zvIGS9RGq/zwoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 09:10:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAE46EA80A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 09:10:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZTck+D9h;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gfCui7+y;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115586-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115586-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9FB3E301600B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 07:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 403693AFCE5;
	Wed,  1 Jul 2026 07:10:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5172837F8AD
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 07:10:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782889802; cv=none; b=TawOT/hwCDz12pW5pBS5wOYwqD0dhUrcWqlU51ksziqWZLgKEVI7BWa77Ninc+QpQO8MOJ/UyWK+7UKWiWbc91Leh173NlbyGiFeBluE4SQpQUdFJjsmaeMNw7T4fvn68GwahX5xwooa0qoGbXR+X/r+44T4MpICRGZZJc8dJRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782889802; c=relaxed/simple;
	bh=5MKFt/zaYcFq7IKuke7jKlaQbD9tKD2HGDHqp3vOFnU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bwlA6chB3rDrA95niJayFCXgHBcfdHRQ3828sEN3z0SG+rAM48z2EZEmY3YV59W4bIs4nwrAPInNh1K+fGfK6OOWGZOomDuGE1RGiNHi2WP9QJAvwodTWcAGShxkxP9eEGRUqP1WCO/27MlU+VKYd3gQymzn0ObvZge/OMLSN2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZTck+D9h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gfCui7+y; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lZpR154276
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 07:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7NCJWTnRs/jLLCrPUstOfZ
	DTejQrI7BQ7/YfnIbBOKk=; b=ZTck+D9hKsuTr0ZCuipX7Qka9QBg2oQEtRFADS
	++i9iehiNQ05GHEQdkQXY1+KaDhLmT2wXhadk/p7LfwMP8GYOgJHjLP8L3jGEcJY
	CLXteC21YxEynWlscW4RRPoZc1nVQalSA0WZL+7zDmDef9YjH/LubTF/MFRHF+Nk
	mMdwBlPj6DhoSzR/MGQVIJkIsKiLPT6ER/rXc71jjENduk7Up7D2Kq/IK67LNC1j
	zCkUxp5fOKwkDpV8y0CjJ8VgHZCcF06+F4A1QsKu9lCcM9ZRmc5kA66JUIZMDKtp
	jofmkoSj6GQ7rlUxSC2Vl8Z/CBtGEyuVnvUVVG5zY/z/VXuA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4j91305b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 07:09:59 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30cb5001ed8so719309eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 00:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782889799; x=1783494599; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7NCJWTnRs/jLLCrPUstOfZDTejQrI7BQ7/YfnIbBOKk=;
        b=gfCui7+yv4nLL2+Af8IcKVZ81nykOXya12nBkwNlKys/qXHALDeb/V4Feczc5HBowS
         hgeYW9Kih/6vapUKjoU5or7CVxIBCn18rjyIuhAzXqPvkXmaJibTgIxmufnxsrJdCUBY
         /EbTIhKdyL1pZKLEJDIgNJdri6Z/AGTsAyA+ckq43vf3+4E645SWOpEn3GBpLZ6Q1cId
         +0z+FFoHoSmayZ/QcJAV2ZBujndJYvJBm32ABRXSodm59wOyqX2iwQijwXilZyJLcTDO
         5L8i5Vy7I/qgvRt1d2BDt6ApMdAdu5KemiSIi7WK4LHO0OCLaf6bCNVqKhr/sjPHzmn9
         BPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782889799; x=1783494599;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7NCJWTnRs/jLLCrPUstOfZDTejQrI7BQ7/YfnIbBOKk=;
        b=gGEi90CpRO0cFx942RwtIseRnYv7hNY5+wWf4v70pYwnib9k9ecTX3gZg23Aghbk+l
         B8tBpFMGDHUuYhkCbIwH6X6ZfeFYwLXrN1RlZ7yV2eTgl7I3KCzGdquJbYt3DS8TIWxG
         G2mZpGHvs/Mw8NgLIrE+Zr97oWRpr1RUvXMe/neifMzZprbsszaKQcVYXiYoZUWfqN/g
         bsjYYG1Mp/SNDfaqT8nI1wGn095j3nEU34qnL3hjevNp5OBLHgvZfCYlnFXlh9iVo4wF
         7TAzRQTNks+ebRTDHUdLNyISFz+MktVUQJo1GF7Id5KEr9l8t0lzKDqdJIDugpHgvw3I
         N2dA==
X-Gm-Message-State: AOJu0YwoiLTk27i3L0qa5tEsIYS+YCxdqjkvWndpWneO9WhewqJx89xf
	J86eFPt1DMj+ViU11A6cxu7/Hk7mXD7wCNZQSmgB4FENMNYeMiqITlJgU6vfxiDl9TV6S+9M773
	JZDbsf6FUxZU3zalVJehm6G1L1lIn/kMNBK8zgDII6ZzjBkTe0/YZJSxdMnrUc1qDLk23HHsS78
	/9
X-Gm-Gg: AfdE7cm4DPCSaRRAr3reB5k1eyTypALlPRKVChEDhxjvWWKEVWXH07d2ztPZz0yL7ID
	SYqmyWOnWDIlZ+ln9H9T089biscs2p59bYu63dt2rj8SMPqEvzQ7jY16C1G4TWngbIRIh2wX3Q6
	/saHFHzy3BZ7Bamw6Xw/JiSd8z9YqA/N5/Hbxl4HNaMSjRK+runv2gdF921yBDqEbuaJemYk+SE
	4rgAtocfoUg0x41w3UwojvLneJsIFjByropdrJoS7HzmBFlIfOYkd590dGXmlm8FZp+a1TZ/10E
	PKctMTsaZCGNICmHWttTsc659N5QYdzoSWxd7Bzd7roWjMx1/rrIBqH+zi1salgXrP4JZ1b0XLc
	urQUYDUINJkcx7pE7GzQSnPfZtwGS5E/gXBNYGyiEzG+wRqR9rCvSujgy9CObJvtB6CO5INmzI5
	Nh6LNJE4pt5tbFBBcDFdvZVFceluc/rMf5WADcpUOs
X-Received: by 2002:a05:7023:b83:b0:139:ed5a:eeec with SMTP id a92af1059eb24-13b36e0d71dmr564882c88.43.1782889798383;
        Wed, 01 Jul 2026 00:09:58 -0700 (PDT)
X-Received: by 2002:a05:7023:b83:b0:139:ed5a:eeec with SMTP id a92af1059eb24-13b36e0d71dmr564829c88.43.1782889797880;
        Wed, 01 Jul 2026 00:09:57 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2ab2dc1fsm14426709c88.6.2026.07.01.00.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 00:09:57 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add APSS clock driver support for IPQ5210
Date: Wed, 01 Jul 2026 12:39:40 +0530
Message-Id: <20260701-apss-clk-v2-0-776d054ab8c3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADS9RGoC/0WO3QqDMAxGX0VyvYqtTtSrvcfwoqtxlqnVpopDf
 PfVH9hN4CT5TrICodVIUAQrWJw1adN7ELcAVCP7NzJdeQYRiTRKxZ3JgYip9sOwinOVRFglaQZ
 +fbBY6+VQPcuTLY6TN7qzCS9JyJTpOu2KoMfFscsawx5oNDljv8crMz8S1zz/X505i1imclEj5
 5nC5GGIwnGS7S4OfYFy27YfWCpgstgAAAA=
X-Change-ID: 20260625-apss-clk-ed39c40ed468
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: o5laS7B0KarPZaH8nThc7X5_IzVn4WYU
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a44bd47 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nZJT0DbqkGW8ujxwV40A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: o5laS7B0KarPZaH8nThc7X5_IzVn4WYU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA3MiBTYWx0ZWRfX/LRuwpKJybJ9
 mTu0SI8SQHAT/x9p3hWlHZ/dpG6HLqWx2V5+sVP/FXEciQIMrRbbdt1YRvfKijRwiR4GcAuTrma
 y61bOcPNZiEZBN7Adt7W3u2MM0kFPCTuqSNQ9d4JUJOadzC6kQ82w6PaJD5vyf2MCK3goN71Azb
 j3OsNTy1nd7nycYH/dmZA7huDu6/88zCuZkt/WGqGV6iuG9ux9zH29I1zAx/Hg6pa5RPxKnXZFK
 5LCPRWhP28CGyKiCMDbWWyay8Zx1KYKp4ZjBRIuJYeNuVJFqtUlIPZZC80+JBwBUNHD2OzZ+Yc2
 PSVihnFoc3TRcrAunjJ8HYh+NlhJ8nVfu2V94wiQLp3FYV7A5YIJlX8QSi/2o7SxA9dhkE3kSeJ
 7vQs/QEn7UZf9rTOu0i9g/LIQM9c2awC+M4fOt3z7Qgimudh4nypdEvN5hy5p7rkMBJ2qoXdInJ
 wN1U4zK/Ryq4Abl6N7g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA3MiBTYWx0ZWRfX8uQTPT1X1Cyq
 b9I7N7FQWErDIi4zPM6h3XfkFDR+MuBFx0xHjJTDmom5LY7MQ8iYbUOz+EWov8EdPEYRLHjlUwL
 uQeoUI0Cot0KhncttXS+4XLF6ImhunE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010072
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
	TAGGED_FROM(0.00)[bounces-115586-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:varadarajan.narayanan@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EEAE46EA80A

IPQ5210 uses the HUAYRA pll for the APSS clock. This series adds support
for the APSS clock to change the CPU frequency to one of the supported
frequencies.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Changes in v2:
- Remove incorrect tsens dependency
- Pick R-b tag for driver change
- Link to v1: https://lore.kernel.org/r/20260629-apss-clk-v1-0-8c92fe118ce4@oss.qualcomm.com

---
Varadarajan Narayanan (2):
      dt-bindings: clock: qcom,a53pll: Add IPQ5210 compatible
      clk: qcom: apss-ipq-pll: Add IPQ5210 support

 .../devicetree/bindings/clock/qcom,a53pll.yaml        |  1 +
 drivers/clk/qcom/apss-ipq-pll.c                       | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
---
base-commit: 533704f3c28c3f5f9e2542aa3a6a326c32e6f5c0
change-id: 20260625-apss-clk-ed39c40ed468

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>


