Return-Path: <linux-arm-msm+bounces-107528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBQiEIdsBWo+WwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 08:32:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D67253E59D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 08:32:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 93E743057526
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 06:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB7A23ACA49;
	Thu, 14 May 2026 06:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ght6Zgnw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eO6tN22U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0F03CF68E
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 06:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778740117; cv=none; b=QNbHDC/Xp5XjGGDfp0Gn7SjiVOthsHC2kcLKz9hR9j1IIdc+fj9ccFXH53QE19cPxyBJPlxWZYsoUNURlucEi2akDSgu5PSJfQ9EzpJBWjfyTsoHQeGCfwHDjFcKdsW3ktueRMTtWn+z85UHfjofi0NXSs0Sbz6ln51lhS8u5aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778740117; c=relaxed/simple;
	bh=mtCwnWjGp5/5vEDvpfmsOg0fGGq+DBhDLgNwoa+olGQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QYB1Cvfzx6BFbGZuYVIsDvuVmkl43K8ywRqcaFG5TB4ABH2TZmCBzgB/pO0ebG+6J636AtF0jcvMRVwrU/CnrH2sHrmnWhpjT5e4s8izDCgtAL057AfyzDQCgYOQHfBeTOfkXTqZvjkkdk167Goy4QNu2hdeoWSBHJsruG3Lyyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ght6Zgnw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eO6tN22U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E4gpci3014691
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 06:28:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ihdQr/IQNRjruM/C0UDOVxKDfKTmzf/kZ6f
	pH7xLN+Y=; b=ght6ZgnwxHaE6wCqVOZuicIPZi0zKOXc00OXvM2ckqa4Il16QuN
	UyB30zPw/SGNFP7RfRO793C83PNsMHQHDQaBm9Mig4znJnrazpvgGVG4eGsWCGHW
	cKhEFvSjdaxjTqYKaqhrANiBc68bUmv8mfVsQek2O6UtPGzpPm4tWgdcfuoE3iba
	lMFmnnMh7VniF3dek6pbekMDpXLINW7zxORTib3XW97LLfYR9BBSVT5J3v38PnR4
	88BlydGemztRFRTf+WXuEM+aFRDS01OFZqYgShsXDFk331HFNZpj4rDpQ03cpkjw
	KPG7l7G+FtPUGdFlmMDGjaAj80WErdgpE2g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e57ksr9se-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 06:28:35 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c827c880e39so2800612a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 23:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778740114; x=1779344914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ihdQr/IQNRjruM/C0UDOVxKDfKTmzf/kZ6fpH7xLN+Y=;
        b=eO6tN22USG6yjPn0wBNu/brz9CfZCtu1McFi5IkEDmE2HEgaepjeXMhrU6YD/SOhXY
         d4qrC++FuDIx4vM5BBmp1F7VBRv2OzPpibUafiNgYK/kuWAFGJLlzCMJ6yLwrNM7ZvPP
         ozv6xRA4gMMIfxLFHxFFAB9rxrfSttTEfoyqcycz8rA+A/T9XjAFL5wYIkGjGISkMwlI
         J09KYfk5kKIgjoz9Fewjh0MXoq7bPMuxB3nV13/hFcwjFMWzCLBDZ+3wQvCeQlstO7Ak
         lx1puZ0qoXIBHcjqaNPb3PQnvRx4GBUN4phmPdXI8IntdEj2kvyVjQ4zl6jC8maas9wS
         AgcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778740114; x=1779344914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihdQr/IQNRjruM/C0UDOVxKDfKTmzf/kZ6fpH7xLN+Y=;
        b=CHYpcLyjVldV6vmylet0bBWRW8z3iBlIoonUUp0oMPo2tpjCtGBEb4jqk70zwC2aft
         8qj8DrS4sJAdQ6PAmqnkBRnXtpOhJ4KOoIazNakwFso8j/W10PedD8HDh4M1lD70YfgO
         zZIYfvekQnpMYZhyYtMN8xdpy2Cs2A0/IiLpXETPZvKhGTDEWj0lIi2jDgdJVh6kjgC0
         un5yUhHCadFpEcjDJYghZ+LxaK8AX3wnAbkPARjB4dA2GYADMeflLjwU7bzijmGPu1sr
         qSRH99+lddvw9tlx8cKuXqzjgY0klCA+jwsRmB9KvrIP8zfi/5W131cO/8DP6QKLw/SO
         H7mA==
X-Forwarded-Encrypted: i=1; AFNElJ/uUrX6fKa71cT3uTOcbv48f5F2P9oAHQMdLSvaSlhRDKg5fo3vj8aUSC5okzib4JUCnS0uGCX/58P58iB5@vger.kernel.org
X-Gm-Message-State: AOJu0YyrfI1kqdyIuzlu76DnUrSMKN0CYOOjZH6UiinMIBX/k6HYHAjV
	bQp9C+GXzuW9WsamqycFE1n3yHK1lzVrx7tKBOuGBN36dFJizdEU8Uh0eh7CymMgAEPPLRdzH82
	MGZqE0UXIqoDil9095HjdRicZfCYVzNYruu/cie0FF8QnAlXz/fQH+37jGBfV19byn8sB
X-Gm-Gg: Acq92OGEPcHku6v1SeGdVPyC/K84T7Pr2qhlwQEu+tJfo/XVKDfq5/nNqOuBanzigM2
	ACtAK/oiDrA96lIhzT2Qrai59U2u18e7X0l6y8BbDq7brqJoQ39av8YAeowfCFgGdryhY0Du61L
	pZnT5Ein4Zw/Ri4vEFFYBX5n+SA1J2n7wMKz14+uYV2qfLSEDB8NUnrQkSYrgfhnCmRGAseMhHj
	+tOa7i0XL8eTIfvc7G8Ll3PX++oiP8SX/0McZOHcztXr1lxc4jwXgr8qNww9zCo4tgskLrS9fAb
	3Ft4Zt++TrH/wc5CjxHMisgQSYmJzxeZHVUqmEijyoPOptzgM21Cwmfo6nY6lx5DdsSdCRJZtTO
	1A4I3J53idgrAV71gIBkvmi2etV2W799wm2+taZh/KYCeDwhYmAtEGC1xSfhyLVzYfOnEZaya1Q
	sx0nDQkHed8q4wbPpsA0k=
X-Received: by 2002:a05:6a00:1acb:b0:83e:e03a:f926 with SMTP id d2e1a72fcca58-83f03e910e2mr6451208b3a.9.1778740114384;
        Wed, 13 May 2026 23:28:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:1acb:b0:83e:e03a:f926 with SMTP id d2e1a72fcca58-83f03e910e2mr6451176b3a.9.1778740113707;
        Wed, 13 May 2026 23:28:33 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f197995absm1434904b3a.27.2026.05.13.23.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 23:28:33 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com
Subject: [PATCH] fastrpc: Reduce log level for DSP info and reserved memory messages
Date: Thu, 14 May 2026 14:28:25 +0800
Message-Id: <20260514062825.50172-1-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0qHRPw1th47B4ht-fg2R5cBQZMPTAma6
X-Authority-Analysis: v=2.4 cv=KZbidwYD c=1 sm=1 tr=0 ts=6a056b93 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=H3QoRsm3v3rqaJNjNxMA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA2MiBTYWx0ZWRfXx3Z2/AzzZ2F0
 W1yeFLvM9yXozB3Dwjpm/lnr2i8mFtUYo271eMG/qwWlDJbK1ALJswdzwVD8lWxVHKR7mjS05RO
 ScWuTB/vECyYxEK/zZTWmTBJgx+4BdWXZDnYSuA96BtJSZTz4nghJb9VHw6UzwKoD/rqv6m+1Nf
 JZ1TkijY53nTkY1ydLhFVNaJ3CJ94V8nvmtrsfiRncz4UyE/ngi7m6pYQL2BrspfXWvd9RHV1Pj
 iPwM/RXi5LXq+3/JD7S1B2irgRGLCsibRZDJ8DwBkQDzHCPl3aGoJYzsx3hKJSL3+d2KZkBFiIF
 kTN0mS3DZZm0KhHXavvp4n5tc4BCBoPPd/YSPih3j3/sQRfvVSjPNUdCXBGeTvSHNPqxp6cCiiR
 Nf6sg9zXtfxC1ZqmH7TSksbNyV4N0rtr+SVgZ+dSOCGnFVe1Yo9f6CDpZA3ZpgGNg4Qrb1CH/en
 YJI6BYZ7ta6NtgwqzwQ==
X-Proofpoint-ORIG-GUID: 0qHRPw1th47B4ht-fg2R5cBQZMPTAma6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140062
X-Rspamd-Queue-Id: 3D67253E59D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107528-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On some platforms (e.g. QCS615 Talos), fastrpc may temporarily fail
to retrieve DSP attributes during boot, resulting in repeated
"Error: dsp information is incorrect" messages printed on the
console.

These messages are observed continuously during boot when metadata
flashing is enabled as part of RC releases, causing unnecessary
log noise.

Similarly, the absence of reserved DMA memory is a valid
configuration and does not represent an error condition.

Since these scenarios are expected and do not indicate a failure,
downgrade the log level from dev_err/dev_info to dev_dbg to avoid
flooding the console.

No functional change intended.

Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 1080f9acf70a..05ec14c07fd0 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1802,7 +1802,7 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
 		kfree(dsp_attributes);
 		return -EOPNOTSUPP;
 	} else if (err) {
-		dev_err(&cctx->rpdev->dev, "Error: dsp information is incorrect err: %d\n", err);
+		dev_dbg(&cctx->rpdev->dev, "Error: dsp information is incorrect err: %d\n", err);
 		kfree(dsp_attributes);
 		return err;
 	}
@@ -2361,7 +2361,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	}
 
 	if (of_reserved_mem_device_init_by_idx(rdev, rdev->of_node, 0))
-		dev_info(rdev, "no reserved DMA memory for FASTRPC\n");
+		dev_dbg(rdev, "no reserved DMA memory for FASTRPC\n");
 
 	vmcount = of_property_read_variable_u32_array(rdev->of_node,
 				"qcom,vmids", &vmids[0], 0, FASTRPC_MAX_VMIDS);
-- 
2.43.0


