Return-Path: <linux-arm-msm+bounces-113684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YNm1GT0vM2rq+AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 01:35:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B51D769CD08
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 01:35:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OlDLAru6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eEFsHLFc;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113684-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113684-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F2DB3036608
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 23:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 292E1346AC2;
	Wed, 17 Jun 2026 23:35:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D275933E35C
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 23:35:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781739323; cv=none; b=lC13a+dZgT6jdNXR8CPqtm2ZOLEJqX2gYXS9ox11KZpzhymhNDQvfuhWhXlahfjE6b7A7RyBxYPuTob8fDyeD5yNCRjxVyg0WDiVfYJw0gf2WtAMmSs41AcvRBuP/Ykvl82pPsZ1r7Kq7ZL1kQgvhKMdMBvJLuFx7sP15pyBi98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781739323; c=relaxed/simple;
	bh=sxCJ9JaHTFlAf88jTHeT7bHfpfuZdDYM4bC7eUPd658=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Rpp2px1M9r+x4hCNHtWOpP48+CetpS1LIWvPXO/7SwY1ZFu6fpLmS4PSgSWsRw8IJy5edCqk1h0K8H2T6Zx8IF9tYyi7b7rsjUOhEc2EESX7qBPsW6Uzxtvo9ZvxMfCVLprLjKCQxh0iPPTPkmfeqBE6kyQMumVFnUH6TVMsfrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OlDLAru6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eEFsHLFc; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HJRruY3525562
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 23:35:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6WkFCTGJr0q5T3+bKGuph/
	E2sDRdxEhdBmqEmxPyINU=; b=OlDLAru6SZveBuA9axIjtY2LenL33ZV6JKxqCo
	0PN2QfOqwQQt864ifE28TE8WuzT1nGM0Zge8y0wGLwpe7Tr12QK7aHwDI3exIfLe
	vupJz4j7yLtK1DiRyRtd0GuFiXyzOCIGY+sccZkDKdu4y1QNgP/i73P3IH2ch3gz
	snR0XsAIKzxv3ppK+5Or33zUs22yChyldlFPqm57NoUkmi226PSJ6qS3TKzjq2x9
	/EW74y+oIglVrg9jdXMEhGDlwlgUEnPjeex8JJsI0LNPhouAMdqK8oyaoqiARr/i
	i/IESx5v2SKbZOw1L3oiD9ilCtMNQBQ/N05Ij4Vg/ru+hujA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev1rtrtrn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 23:35:20 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-138156c0492so1287397c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 16:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781739320; x=1782344120; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6WkFCTGJr0q5T3+bKGuph/E2sDRdxEhdBmqEmxPyINU=;
        b=eEFsHLFcPefAVFDXODCj7cqaeBm5s6QzvDvhQsFskr9dYWDy3WM8/7iqHl2JWm29l2
         gM2gqHo2m9eXD+SOTAGH84tQBxW5y31+F3FMaqJjXl4wk0TDeLyH5uwe80PpJ7RUsGbB
         Tr+VoCWvTVXDIrhtijzxQzMW2kNVmNWxk6dngZut/VmNL0rutol0CGdyOzBfduxZHV0I
         CwcJzGkMiR8OgpsnWMTwTJmuGv5z2CisD/fkBxMcv8X0OPyVXvqQwFfj6zQ8e59VDHCQ
         WmIug/Bo2jUAU64KXnc0In0QuhDI+A7m6Udj/EDCP45M0vrvCT9Z0L9XnQDTm0fSnd5l
         B/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781739320; x=1782344120;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6WkFCTGJr0q5T3+bKGuph/E2sDRdxEhdBmqEmxPyINU=;
        b=MNUy12yNrs+snWkk832ncVbIkEhIE/2Wh1cL2wn8PMFQnQElmtEVVtyByurvlFA/fw
         jW3ZMQHvluJWJ6eTYZVXVSC1FtCfhT3J29hpuNDE/nQ7BCfbSl9nZ/tRL1M5xS7D2zE9
         T4Ve7wYkG69/f1wwhkSsyJT/tdI6sp9dl4MSifWyGebDDhK0aDnPVgY35S+yeOSWol0B
         sikHjPUmzL4Z/HqrIC+p/wKGXNBj1zPH9D+729xL69voYEXg8NpXY+cQTPh2XWi0X5Tu
         1JD1lXLKYvkLDew0wtD7D/zKizC58sqoPp5h+AHESwquHakrvtYxtHdazSQqaFW8W+A1
         HVAg==
X-Forwarded-Encrypted: i=1; AFNElJ+7Vc6Dc1fWmR3TpiWImU5xcrBXSHJ5Qrb4wNusY/jFAKhl30y9UWkH2iHJnEmUzZBltiwQrroxXZ3ToMAN@vger.kernel.org
X-Gm-Message-State: AOJu0YzPpBza/RK9pq5NxiRCqCTpQXaKgyRELRtTsWoXosk5RNL8eGX+
	eegTX3j/LUYuwAuD2DahKgeTSAtXZTTTkwCHGziaSa1hu/JKolQNBtRnc/p62LJaTfSzmplOhWL
	3wRtvg89dgM0nyzCEmCwvaZSo3YmLly9v9h0pFyQqOe6uzKJEypT+N3op/YXqEj0tnWvyQ7y71x
	9H
X-Gm-Gg: Acq92OHO3+nx796XtXw70ELMie2BO0ATWOsy1hDBrJ1Yhwx4UqFB8caeg6FsUAvNASS
	WgkpvbRMHU6RleB92xVD1BR0UNiF07NT4lTFIU8P7C5232LMcPvUWqBPIF9J1/1dRPIUyPSlOCH
	yQXlA4jl1HHYxDKTSlvGroVx978pxE0wh1QGN5gJvZlHielZlY+wPA7DzwJbKniJ07hvibUNnM2
	YqXtbYkqKRIO57XED4EX4mspOTYAZfrijaPDOxFq8O2IKnywEs/Zsl05QgbK+Gz7ZfTRrXHWU+C
	swZK76foE0IhfsmUxEBC3iBoYZBhi2woeSL0AWjJveGCzzf5IilRmBhAaIXQrBPMga8IgOoKnmu
	9wUYXVv0rEaFfzD+kXnJqfBrKNJiY9vyZ1qIOxKopUWeeQ3Cr8FL0fKDgBIBQ3MOi4AI+91vs3v
	/0bw==
X-Received: by 2002:a05:7023:b06:b0:138:33cc:d87f with SMTP id a92af1059eb24-1398f66af6amr2858150c88.5.1781739319572;
        Wed, 17 Jun 2026 16:35:19 -0700 (PDT)
X-Received: by 2002:a05:7023:b06:b0:138:33cc:d87f with SMTP id a92af1059eb24-1398f66af6amr2858135c88.5.1781739319064;
        Wed, 17 Jun 2026 16:35:19 -0700 (PDT)
Received: from hu-uchalich-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b9110d3sm18273923c88.5.2026.06.17.16.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 16:35:18 -0700 (PDT)
From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 16:35:00 -0700
Subject: [PATCH v2] firmware: arm_ffa: Fix NULL dereference in
 ffa_partition_info_get()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-ffa_partition_nullptr_fix-v2-1-bc801b4ce34c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACMvM2oC/32NQQ6CMBBFr2JmbUlbTElceQ9DSFunMgYotoVoC
 He3oGs3k7zJ+/8vEDEQRjgfFgg4UyQ/ZJDHA9hWD3dkdMsMkkvFFT8x53Qz6pAoZbMZpq4bU2g
 cvZhSrqyMkarkBnJ+DJjfe/e1/nKczANt2go3o6WYfHjv47PYvN+OEH92ZsEEQytNha5CUfKLj
 7F4Trqzvu+LfKBe1/UD97FqnNsAAAA=
X-Change-ID: 20260604-ffa_partition_nullptr_fix-66f37bb2630b
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        Trilok Soni <trilok.soni@oss.qualcomm.com>,
        Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781739318; l=1895;
 i=unnathi.chalicheemala@oss.qualcomm.com; s=20240202;
 h=from:subject:message-id; bh=sxCJ9JaHTFlAf88jTHeT7bHfpfuZdDYM4bC7eUPd658=;
 b=Wo/uNJjQaEXM7mqbhOxqL7nAfVNSfuVaxC+KNCaSKKVBcN05Atx7t/8GsoFVTvepDq8OM0atQ
 HNpwpZEnzziAW0OdoNLE6ToQKi6BUslfXVK2hMDJhw+HrSH7MZq1kh5
X-Developer-Key: i=unnathi.chalicheemala@oss.qualcomm.com; a=ed25519;
 pk=8n+IFmsCDcEIg91sUP/julv9kf7kmyIKT2sR+1yFd4A=
X-Authority-Analysis: v=2.4 cv=MNpQXsZl c=1 sm=1 tr=0 ts=6a332f38 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=jr3FWET45_D-OIZeFJkA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDIyNSBTYWx0ZWRfXyM37G8mN2LDE
 5J6rJSX1WCfkA8i/oaHd7IyRZXdDxCKUkvkD3eahGf3gwB2WvJxygZfY/MSC8qxKNc7E1qFXQGx
 OXkjlPgMVcA+CmbAEBDmkBf/8ghxBKse8ZdiRXnt3AvmggZ09nUURw7iuVEaaYIa1La+dFBwKNi
 VoKgozq7SR0y3ttkkX1O83h3mVjQGYPJBC25ZnWLArE8aKLLmviGlMwo3u1JvhEmDNTgrhKuT2i
 7JWCVUN74qjL8U4EQSpy/2zdChSdqYZvFYIlOuKlt9ayglJHufHeGYB0cwMnANwIWTaKcTPCmf0
 gYFeEP2B5aKeIYr7eu7JiVuIZaqp72T/dGjsTdX4Z8B/nHodsMqVsiLZpb866xzngodpKDZpJeE
 3xT4P4TaEGLz2MbDMPFmnEZ5sWC/49heFmEKpOsqGWRDXcMqcYgq9uxqwpXdDDN2DVEiQBbUV4c
 c95NEw0OOeRyibUXXlg==
X-Proofpoint-ORIG-GUID: d6fmiVALJ8G7nzyQGzKLuDHMK6B7DSDy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDIyNSBTYWx0ZWRfX/5L7f49sOINe
 +sDXwSbQdOzrrJ1II1eoBD154VA8lxAUMKFd2IUZVCJ8FfBejgUx5oIsIcUGwW0qPdmIXBzUAjg
 802ittY9NJqoPCl4ZlmnXnkeLg0uDBU=
X-Proofpoint-GUID: d6fmiVALJ8G7nzyQGzKLuDHMK6B7DSDy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170225
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113684-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[unnathi.chalicheemala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:sudeep.holla@kernel.org,m:jens.wiklander@linaro.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:kernel@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:satya.prabhala@oss.qualcomm.com,m:unnathi.chalicheemala@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[unnathi.chalicheemala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B51D769CD08

ffa_partition_info_get() passes uuid_str directly to uuid_parse()
without a NULL check. When a caller passes NULL, uuid_parse() ->
__uuid_parse() -> uuid_is_valid() dereferences the pointer, causing
a kernel panic:

Unable to handle kernel NULL pointer dereference at virtual address
0000000000000040
pc : uuid_parse+0x40/0xac
lr : ffa_partition_info_get+0x1c/0x94 [arm_ffa]

Add a NULL guard before uuid_parse() so a NULL argument returns
-ENODEV instead of crashing. Callers are expected to always supply
a valid partition UUID, so NULL is not a supported input.

Fixes: d0c0bce83122 ("firmware: arm_ffa: Setup in-kernel users of FFA partitions")
Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
---
Changes in v2:
- Drop special-casing of NULL/empty string to uuid_null; treat NULL as
  an error instead - as pointed out by Sudeep in v1.
- Simplify to a single NULL guard before uuid_parse() rather than a
  separate branch
- Link to v1: https://patch.msgid.link/20260611-ffa_partition_nullptr_fix-v1-1-ec2b7ef7e130@oss.qualcomm.com
---
 drivers/firmware/arm_ffa/driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index b9f17fda7243..4090be782329 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -1129,7 +1129,7 @@ static int ffa_partition_info_get(const char *uuid_str,
 	uuid_t uuid;
 	struct ffa_partition_info *pbuf;
 
-	if (uuid_parse(uuid_str, &uuid)) {
+	if (!uuid_str || uuid_parse(uuid_str, &uuid)) {
 		pr_err("invalid uuid (%s)\n", uuid_str);
 		return -ENODEV;
 	}

---
base-commit: ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
change-id: 20260604-ffa_partition_nullptr_fix-66f37bb2630b

Best regards,
--  
Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>


