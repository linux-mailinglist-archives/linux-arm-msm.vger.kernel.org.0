Return-Path: <linux-arm-msm+bounces-112812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qWFMO+QYK2p22gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 22:21:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFC367519C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 22:21:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BeHWUk6n;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HXFrf0PH;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112812-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112812-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B8FD5301E6D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 20:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BA2B35E1A0;
	Thu, 11 Jun 2026 20:19:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A8A3998B7
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 20:19:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781209172; cv=none; b=JoMVZfIEJalq+kTJ1zfmGojxGsdWkNIeI8yylFpL6h3Pk6dSmN4ZbYvMz6EsMwPvomBX6WHkqJEzYA2SCrS8RqzpyR4pYyiYCNCB6bIH5MQn3ULVTORquto1BMxyk1VqIGU7rzXaIORSS/7XgqrSwdLUek2UGunQOWIrtFs6yA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781209172; c=relaxed/simple;
	bh=ZOe2EDXU3HvsveItcr3dovmSWgaERH0mLdAj1V10jA8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=j7VPrMnBIGqua1Z+t+P8U4gal3KLFdxmM0OcFtFZlLdq5wc4vTuUXFD5YqRyoX+CHNICz/CpzJ5xTgrDbzwIk1D/gQdENT5Xnl5zexE1mZLbCvAYipYA/rExTztp3AhAK9/SOvc8gvGewoYiBnnsSfgdRyWbP7kP0QS0HkW/0JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BeHWUk6n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HXFrf0PH; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BJ3kiu1483490
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 20:19:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xsHObREKbSdD+QU63I499i
	xe+MAp/Ig/XpnZqBETjO0=; b=BeHWUk6nMly+ArnGiv5yR0XoL5qDVISJ2LohnU
	3SWuptIr1ybJRqcUIZ5VbVM74jhT0MUdjXWrt1iOKYs8nKVXQ30O+2OMyKvkt6Qf
	BsatV9aaA9Io1R60grJ53X25Kv7GbqPQvQhzlM5ivWoXuBrhrXmQIzf1LWEF013y
	mUcNQ3TQkSDk1r1t1VA8OLdwgBavOM6k52zAdX2vyB6NaiDlin1qzPPsQsPlTfkt
	PHL7X4QizfKxwWGU2z4hccWkXCRHRepzaGIsbCU7N9vjdjkg1Zh5IUf2gKTEhr2Z
	8Gx5lakHdG7nXB0ILB7IGfFk+V355UppxooUh5o5rdLHPH7w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er0xd0w8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 20:19:30 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304c652be4eso953980eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 13:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781209169; x=1781813969; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xsHObREKbSdD+QU63I499ixe+MAp/Ig/XpnZqBETjO0=;
        b=HXFrf0PHxue31vR8X0qhRJqWGLSKzz5h6kokDd0739p70g8cxYdOZgaHa4fYcURGdD
         D49yW/3PalV7eZHTpZcPHqKn1PWssRj46HLIki2gZiVWizcmO9laKoZLYEt/nJ8FxmQY
         l0fjUiwNhyjqnfWNttE8daVSXbFUlJWhCdRUFS5G157Et9kkUjkUBwhK2Qv3qUlgkn8c
         HogmlCBE13TuG4kyrN9blWlpWKMTZzU4FWoPw3qfxToIKKkLJl5ND4YN2Z/uajzXE0If
         jUJ7Vmfis1hZY5mYfO5Y83Irg4iZH1Jk9JlIK1ZtxhsJcfgFx8HkimrgDL1mOUJmEiXj
         Irtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781209169; x=1781813969;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xsHObREKbSdD+QU63I499ixe+MAp/Ig/XpnZqBETjO0=;
        b=EkYu10+cQhhu0Kc3nPKJqenVCzZM/jSX4ql1aWFvVJDe61wwT0s9/b80Ig/xKGNmL1
         1bdvxV21NEjbM9IpWJ0jQBOj/sJkW1RGHyXnixE8NliqK+dEMLpSKaH+D6LDAWadLu09
         qhy9a8NZv7zA4F2O670d0uJfnMC168imrxkrDhte9TzxkaaGkubXLbFknjdxfwZpxkuR
         hKO7y7s7eZzghqL7sPCHQP9d1AzQJ9un2QFzds6pEfO4nyYmo5GBdjV+2T/f0D0KeHiL
         n6l1AqSXpzTLw4ItC/InPHKCdEQx8YXWqGriBhY4d5UQIZ2FPHlxREeiFwyM+SAJd8KR
         n5hA==
X-Forwarded-Encrypted: i=1; AFNElJ8Sx0dz85eX/IWOeop+JZtM42Yc0stvGz9J1+HIDDVCnHuaztg6dXA1w6h5Czj2TxjARjRWCcPnRkeDo7jS@vger.kernel.org
X-Gm-Message-State: AOJu0YzZcFJMhQcDZU6NXkB01P/YMGkQbJ5JssrSScZjMNhicEykZqVE
	EH+dQyGR0NVIAssbdzIt+uoIa2qw2HpFa97QjEvCu/HvtWt9m0gqcj6IfC/SZACQXPEhGR7+Ts9
	4PHiriisqZAj55drFPby3TdDKZWvJzgvOGZZcfiq4Y6oZimLsaDYb4CIO3LuuSEAAejuv
X-Gm-Gg: Acq92OHGU4ZIwFxneGyCSWt7gjEZhijHou9FVISxxH2wyerIaJjwgLnBORo1lYXrOCB
	cgndba4VTS26sz6fjZFPfRoJxQc74X0btD/zIG9IDpcYg+1NMoclaS0Z7ln1g2GilW7hEf2/MoE
	g8Blh/XPUEr/zfXvLBGiJYOzTbZi5oz6IYM+XUoMZ4H6i6yTCuqslGO7G0/SlAr0NPrm65b6qyy
	bjEgK3LOn85Bogx+YLQ2dpsbv+MGWlRFlmqmpYcUrKdJC/IGghlB+vPl4ztpu6o8c+mCbVKfqUA
	oh3zdK/ivVQ/lDUtW8f92Xq7Lpp/6OeEbruY/nq0ESftQlfCQNlnwT9hJh2gAtr7vr3pydC+Dgo
	iHpHKKrwCdkFTvhJasfeFXQWQalbMYisS+zYYdxs3lWcHFajuliVNYa43DFlMDboyZrZQIDsFtO
	hFTCRbguzx0CTY
X-Received: by 2002:a05:7022:684:b0:138:e4:c4b5 with SMTP id a92af1059eb24-1384b41db5cmr168611c88.17.1781209169461;
        Thu, 11 Jun 2026 13:19:29 -0700 (PDT)
X-Received: by 2002:a05:7022:684:b0:138:e4:c4b5 with SMTP id a92af1059eb24-1384b41db5cmr168584c88.17.1781209168884;
        Thu, 11 Jun 2026 13:19:28 -0700 (PDT)
Received: from hu-uchalich-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384302569dsm2658204c88.10.2026.06.11.13.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:19:28 -0700 (PDT)
From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:19:17 -0700
Subject: [PATCH] firmware: arm_ffa: Fix NULL dereference in
 ffa_partition_info_get()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260611-ffa_partition_nullptr_fix-v1-1-ec2b7ef7e130@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEQYK2oC/yWMUQrCMBAFr1L220BMZQteRSQkddOulBg2qQild
 3e1n/N4MxtUEqYK124DoTdXfmWF86mDcQ55IsMPZXDWoUV7MSkFX4I0bvr0eV2W0sQn/hjE1A8
 xOuxtBPWLkM7/9u1+cF3jk8b2C8K+fwEThrsxfQAAAA==
X-Change-ID: 20260604-ffa_partition_nullptr_fix-66f37bb2630b
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        Trilok Soni <trilok.soni@oss.qualcomm.com>,
        Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781209168; l=1739;
 i=unnathi.chalicheemala@oss.qualcomm.com; s=20240202;
 h=from:subject:message-id; bh=ZOe2EDXU3HvsveItcr3dovmSWgaERH0mLdAj1V10jA8=;
 b=CZMhPQ3XeMogd808DQ+L5MTnTajxIAoKl+ZCFcUm46ejXXYUO9Pe3NeRdx4uXtIv77FJ67O9k
 awkaH8lBTMSCmpe46Wc9bROjAghTcsxdOBOi3kGJU8aODjwdv3Wiz0v
X-Developer-Key: i=unnathi.chalicheemala@oss.qualcomm.com; a=ed25519;
 pk=8n+IFmsCDcEIg91sUP/julv9kf7kmyIKT2sR+1yFd4A=
X-Proofpoint-ORIG-GUID: o3xl7m94fR8kVVh5by1K3l80PJrFAwyl
X-Proofpoint-GUID: o3xl7m94fR8kVVh5by1K3l80PJrFAwyl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDIwNCBTYWx0ZWRfX2kTLscuLlpeA
 HfNh3hRe7c3rnK0Sc2qKJJVkKmCydeq+/3O9egoSLq2+hRV4xrv+OyWbxDgQcgIWQ/iC1WtOM3d
 ebf8X6ekeXwDLmOR4NQYQ+4tpXeYJebVfxWA/sxpvzGxzpJ94eKaCsjFunIexfVkFrC+70bGDqO
 KYqU2GVhH5KGDqWLecJRRdW4nWmYsWpBUc92zW/shnek4xNY8BHp7MMvqtakord7mguANo9+ugp
 Hh1chzQKOpg/STYdEt17713OcWj3+S1Vv42kT6ocBr1wWNfNtVKT/iM2iMct4zK60ZnAFXAA5vy
 dKuETe/m/rDrNlSYoj2Q8e4YMCJDjYG8nnI/bdwUh5OvB0rNZnoCQzMgY5jplNX0peMRPacpTAb
 yGmKntsIlpRlRgoLMWpKP6+15fCyoX5i6r9vCk9ApdXI9p0cqqHNglHN8WjMLXMrj8IU7Jx1mPg
 q0KyfbJRb+fRqTssL4w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDIwNCBTYWx0ZWRfX60Pa2yFJtY/A
 0+qkAvRZn7ZCS1vpymMzSx1LC8OIhQRW/UXzofsk733FRSwFvkKOmhUqRuep8mgU8MkE+Z/3nV8
 7UeYNIifzAKiX++JjAPwIbZxVfGG51Q=
X-Authority-Analysis: v=2.4 cv=O6UJeh9W c=1 sm=1 tr=0 ts=6a2b1852 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=DNyTkGw6iCim7eFMS8gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110204
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112812-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[unnathi.chalicheemala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:sudeep.holla@kernel.org,m:jens.wiklander@linaro.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:kernel@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:satya.prabhala@oss.qualcomm.com,m:unnathi.chalicheemala@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[unnathi.chalicheemala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EFFC367519C

ffa_partition_info_get() passes uuid_str directly to uuid_parse()
without a NULL check. When a caller passes NULL (or an empty string),
uuid_parse() → __uuid_parse() → uuid_is_valid() dereferences the
pointer, causing a kernel panic:

Unable to handle kernel NULL pointer dereference at virtual address
0000000000000040
pc : uuid_parse+0x40/0xac
lr : ffa_partition_info_get+0x1c/0x94 [arm_ffa]

Per the FF-A spec, the all-zeros UUID is the defined wildcard that
instructs the SPMC to return information for all partitions. Map NULL
and empty string to uuid_null rather than crashing in uuid_parse(),
preserving the intended "return all partitions" semantics for callers
that pass NULL.

Fixes: d0c0bce83122 ("firmware: arm_ffa: Setup in-kernel users of FFA partitions")
Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
---
 drivers/firmware/arm_ffa/driver.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index b9f17fda7243..dd500fb81b79 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -1129,7 +1129,9 @@ static int ffa_partition_info_get(const char *uuid_str,
 	uuid_t uuid;
 	struct ffa_partition_info *pbuf;
 
-	if (uuid_parse(uuid_str, &uuid)) {
+	if (!uuid_str || uuid_str[0] == '\0') {
+		uuid = uuid_null;
+	} else if (uuid_parse(uuid_str, &uuid)) {
 		pr_err("invalid uuid (%s)\n", uuid_str);
 		return -ENODEV;
 	}

---
base-commit: ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
change-id: 20260604-ffa_partition_nullptr_fix-66f37bb2630b

Best regards,
--  
Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>


