Return-Path: <linux-arm-msm+bounces-92855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id vBDRJ13mkGnndgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 22:17:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA68313D43E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 22:17:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DC99B300D63E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 21:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FF20278753;
	Sat, 14 Feb 2026 21:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jCmuJz/d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jK7sUjtu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6409E548EE
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Feb 2026 21:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771103831; cv=none; b=pK1oWr03lGHrWvtF2iSeY9O6Tm7P0a20XbGfFzYMWqnsEZsv648P+431AKkIsD7PqHPn84/qcaTESVSqwcbrJOxKXrqx3qzPhUaBjkCahcxSeripBIJqIEGOlNx1qR7ZlqST1Ju4CS06uzP04wsBMmMeSrZXj8el9o1QRU9FnyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771103831; c=relaxed/simple;
	bh=K2uDAMHdi5wfHgCVMR4Cjd/gWfpwKvVYS7Zi+Y3rjoY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PS29ht+UlMhy5QDgyKi8v6267S85EEpXJGFoOWliVUL1qFoN2HPpgOeOx2soVRqTmlHakJz3b/LrO3tXdjQ7WuyJz8UngWUsSVeGI0yw48PO4LDV0TPkj5PDmeWDj/FkMVnStSsZpz9baM7OPLC3jMaIuHwWTNoYU3zSou8d1Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jCmuJz/d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jK7sUjtu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61EKolE22532304
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Feb 2026 21:17:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Y9RlzeCHPr13p1Eui8wdqD
	imvfh1mg2uAFahA+UU3Kc=; b=jCmuJz/dERBqCNuTseZDxUAs6oLBDHaflSeIE6
	bbUNRp6Hh+3xBd/MlUsr2FGbluSCpY85bZmhtSNu3O0ZiKbZB0xcatQoejX+4rn6
	OS02fU74Bqpel3B+WvoLRzetb6PYNmDegxTUikyNl0v49Ob8FHfZGO7H+JWKIg0G
	V96fWz+oy32uS8h4ZEOLSbn1z2Chea8n49MXunXcTWLWVYwGqAr03q0VVnzKXNxU
	uGPmG8UwSulFJbbQjlOyS9KXI05TzsV9gNNZbISKklKI48R+C53HcpqMC2PHvwCq
	PvpyxMSGGKIT6TIIuQZCKC+lz8s6rz9+t4M6JXz2o+hm5iNA==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cajb8s7sj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Feb 2026 21:17:08 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7d4c2b7f4caso10245223a34.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Feb 2026 13:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771103828; x=1771708628; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9RlzeCHPr13p1Eui8wdqDimvfh1mg2uAFahA+UU3Kc=;
        b=jK7sUjtuhxYsAuEZYthgbY6MLPBodAJfQ+AVQwUiKdqCedFP3QPvSwascZBk30rjsV
         YqLUsmBXoD7RXABXWNmyZC0DVtJTTP/rHWdenEplQKOL8SpRhTu2Aquef6ktC1VdXHqz
         QXi0oI56Ob6kmehgP1j1zjaAeE2OBFvEHv1wfI0CjqcSfxA9PzgeOUkXzMX6V0z82nGK
         A8MZM6y1UM61rMhAtPZT+0ROmX3YUWcaqrCRQrFnYfNHs/DcIminSqhqhkLltLPOpai2
         tji+IXfSzDJju7z7DvMxEzrUJpYPhu6bbbgG89VubP7sBW77ZOreBjhteP5R480+4vNv
         nvxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771103828; x=1771708628;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y9RlzeCHPr13p1Eui8wdqDimvfh1mg2uAFahA+UU3Kc=;
        b=kZoHh9ryHPYAAbgbRNXXlljAmid4ZaU73sO8lklfUtOsHWnhTSN8BrRj7vgwOlY8wV
         WWNqiaD0IPML8hXBsIpbEPd1VAFLD5RIxlQP75DtlD3xbwQZd+MicwoZ/QtZH1qgpcPA
         tZjSXYinxFSXfqG7zBDArAj5a5LwQtZRktgk8r66dO0XLQM7D2ae6eZGZXqzwVsGSvmm
         t+BMNtWSzi/888Nf/OUOJPUCVfXkuyELHjgk74GGKyioGCAn4CFjmexb2LgP1vb9wk44
         5R+pD/x4vR/agnZq5VS8v8qgXm0wu+gBDlfMYoDoNGk0Rl+luAyfuL9gJc0Of4XrG+K2
         R2cg==
X-Gm-Message-State: AOJu0YzanfgAsFTtYglvplNlXrJaIZi+MHNidl94835DA5S/lsSYMuKz
	qN3fLv8F055PZXJIWsEVBBKxf8RdPbrk/GgKPS9+YlvP89OK7hckWqjYK2latW1pLHgNVdcDnzm
	9QxzrMsZHlb8OwriRT9WIkznYjXN8MIgKTfvP0Z+8wODreycUBGwELvkEQsiTjCcVgQYfq+98Db
	Sd
X-Gm-Gg: AZuq6aI3PeItnDgWiNWKQYS/e/aVStA+xFyAQWuq1aN8reJ8WONnk5X9Mcn1SB1PXI/
	PVM/gN4m0aSKUdGjQAlc1zNG0BckmJAn8wE43rqvKz/ZSTNi6peo5qiE6SpnDRCL8TJIelZAcNM
	hzhK3awP1BEph7GcWRYwnGb9o0D8SVTOSzgzUxuPajQBZN3Kk4YFtkG+QFfg0jUad622ufySipE
	entrGG63uLTgqgOcTL/IOHlwkVdinT+1AAeVb/uxP2hXif0kNSJRkz5SFXSz821FOkTSDpMUeve
	1kZYuaIDRiEpyxZC/f47r8gdhmCKZguS96oSmaYlVMSX4bIzXAXvNjtXKQHtiCg8EJaUc6ENhsf
	TqX9BMjeoSNZI2uCw6Zz2hpk5JnXvbhtdQ+pC+7ah0iwEfsBGVcPjVxJBR5U+Vfy266rHoYudaJ
	WRdcpC6WmnbQHQaIohhEyh
X-Received: by 2002:a05:6830:67c7:b0:7d4:c263:8495 with SMTP id 46e09a7af769-7d4d0c2ce1fmr1855547a34.26.1771103827782;
        Sat, 14 Feb 2026 13:17:07 -0800 (PST)
X-Received: by 2002:a05:6830:67c7:b0:7d4:c263:8495 with SMTP id 46e09a7af769-7d4d0c2ce1fmr1855540a34.26.1771103827406;
        Sat, 14 Feb 2026 13:17:07 -0800 (PST)
Received: from [192.168.86.59] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d4b9f04181sm5913130a34.5.2026.02.14.13.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 13:17:06 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH 0/2] soc: qcom: qmi: Fix endianess-related issues in encdec
Date: Sat, 14 Feb 2026 15:16:54 -0600
Message-Id: <20260214-qmi-encode-invalid-length-v1-0-780cb4e98b0f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEfmkGkC/x2MywqEMAwAf0Vy3kBTH8j+iuyhmKgBjWsrIoj/b
 vE4DDMXJIkqCb7FBVEOTbpaBvoU0E/BRkHlzOCdb5ynCrdFUaxfORs7wqyMs9i4T1iSY65rCtQ
 2kPt/lEHP99397vsBdTf9FWsAAAA=
X-Change-ID: 20260214-qmi-encode-invalid-length-310dd551a186
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=617;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=K2uDAMHdi5wfHgCVMR4Cjd/gWfpwKvVYS7Zi+Y3rjoY=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBpkOZS814aDAfgPRwetL18ooEfmJcsQc+wdAFSm
 iQT48hGZjOJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaZDmUhUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcXG9xAAopCAHMenipjTUSX86LBKNYXfTvmm6aFhCOh/PD8
 btjCN3I48CBURXE3rnElUXlT4AxdcF7o0V9EFqqt9d05MYyNNZge0bzrHrKKFOTvQzUCl7kZuv0
 731Fhm5PtNeDMG44AqdaaDcLcDtl5S4amwajhmLxc0NJJ0ciGvSFN0PvyEk2qUqqEGF57Coqz4L
 A5cRtW5wm1YDB0m/95h1+/HjujCFeAiN54l0SfbBzMT0lPabutmMMGEUONEzlQjySl/Vok/H5PU
 eDZJhgkERT6MZJpAOlviXO/CXE77DpM3JXoSy95sgmSzm6UJFB3vowS2oS6ANEqHPPvQyy3CnPW
 8lRGmp7TbpdnKNHqh4LmfhFU04f4wCiTKCCtcmI4afPpbZjBAeLnftjUTlNwvS1lZYLJIw2UZtD
 lWNVyCIWUkyzKQgCtR79R4yhoAGxARuon6IsJoXAVY05xiA0O9yBBK/iOrX31Av3p4PbmPbtYeU
 21jOYc/ukyWN76LVFMWj06FgHT0KlCQLSwavTYVmvI8EwBgtw0A1Yk/p4Ock7DKI/+TAjSxRv1+
 5iqjIixRIGCCWxVNlCqX4zNtGSybOY2wuD99DSYQlJEh91A+YTTM9shmqDWSj6B9rGL531dldKc
 ItOCaxl3CsI0BktQK3z0jXHBO1mckXB52SMTyV3f7+4s=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE0MDE3OCBTYWx0ZWRfXyDji9P+sJPui
 ZBJCjX+23HI2XgrkfTFg6s3hh0EUAwdbJNKuhwTIh6RflnVzOyMckpKZfY1kO5Y0bFsOj7s89Ax
 TgmAPIVo695n+YHYkBeZXfjye5Th9Urqk9XJ08GKAzBow6/caeg2wKZgmtw8jucUtLXUl6kr3Ad
 7ZAp1wP3+tDT/aifOvm5v00UeF7ZYET8dsHxFW3IxP0nMlfWcbVAw50MQ9peH1TnrZ4wR2A++Qq
 shzwsPUzgkD2o0Ai92SN/wg0kdzGqlgkSH37EGoCo8OCA6nTZSfL40LEk+hTg3Pzy0QimpdUqsM
 kNagL0WGmkWx+Oa8Q7bAwSIJJXXJGY/BdsJqGl/xVm28i9qo6gdFVQtiDQcuCnGKUjCDb1YSJrE
 AoMQVBKbusqcXscZK/XZEJZ8XeB011M8wf6kmftN087XuQCufmP0e0hgQNmR8IbYBgQxW8I7vuV
 EuNNJOmchb4KobBKk0w==
X-Proofpoint-ORIG-GUID: cooL8TyZTDLan3653traWCgh1ZS19eUD
X-Authority-Analysis: v=2.4 cv=Pe/yRyhd c=1 sm=1 tr=0 ts=6990e654 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=SSnYddtK9NkD3JaiHHAA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-GUID: cooL8TyZTDLan3653traWCgh1ZS19eUD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-14_03,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602140178
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjorn.andersson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-92855-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EA68313D43E
X-Rspamd-Action: no action

Fix a regression and a bug in the QMI encoder/decoder logic.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
Bjorn Andersson (2):
      soc: qcom: qmi: Fix "invalid data length" in encoder
      soc: qcom: qmi: Avoid splatting the "length" destination field

 drivers/soc/qcom/qmi_encdec.c | 52 +++++++++++++++++--------------------------
 1 file changed, 20 insertions(+), 32 deletions(-)
---
base-commit: fd9678829d6dd0c10fde080b536abf4b1121c346
change-id: 20260214-qmi-encode-invalid-length-310dd551a186

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


