Return-Path: <linux-arm-msm+bounces-102412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2F6+N6BG12mTMAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 08:26:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E303C691C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 08:26:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D9FBD3021E93
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 06:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B882030C63A;
	Thu,  9 Apr 2026 06:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BSVzLYry";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RJFDMLF+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76837315D3B
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 06:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775715992; cv=none; b=EH0+2tb36zZIFR9Q+AG6gFS4hJYw/YiOez/9RJtJ55jmAsNdTZRQiz6LpFEAMRGNIsuSVO42qBToUs1ocEupNK79aueDYH5L8zWVuLT6NvtMcN3PzZDgx0cKnWlsMzmu5HHSZBnUUQN2U+Pn5PJt0YpTekcv+V5Sgz7CZJTk8FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775715992; c=relaxed/simple;
	bh=FjAiT5EfT2IuOb3K+Pty499OGRI/ikRMlJtPIYoV5qo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nHSzusfv1eiMzjhDo3B/4cF/I7NdHDoFDQNDAmgxAXJoThMNe70gy/6/lyNYGn19JV8C6g4pY4+SGdzRJcrAeemM9s6VGgn9W+yVazw2pyRyhAAAQxyaeYMl98GysnI11zKxZnESa1F3R/d9Y4+2AK64nmBfSRVSWavtQzOBke0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BSVzLYry; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RJFDMLF+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6395kTPF1613662
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 06:26:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wFzA2omutyD
	gArQT4+qbnS5naimicpEKr+NS8iMhMfo=; b=BSVzLYryvsrTo/GxIOrH3jOLgjs
	NNZ9jVNo2pl3yNpZMsIEYFt4AsxJ6l2fqN7V6duPE6gnDvLK8mf8xYgwkOldcW7L
	NGVabh5IOKlcG1SRwrIetZojLldQePi5+XyPF/hXOjGHFmCt5xm4e+U1lbZlaRpe
	YR7+ko+p9IIptQeQhfawLcWah2wxOjwx/4Xi3lWyeFCS2iGM/G3xooIRTXX4jea/
	yuQzbmc+skof3xAIE+hgxHsXGqQkZRcYZFfy9TulErtorXzerIZKTl9HA81APUPB
	aREOUhewgrLlADmsEId0KmZixsaeaDmSBj3k6PIj1GyzYoPDLTOQ2uraC/g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4de68v84fd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 06:26:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b0c30b51bfso11367445ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 23:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775715990; x=1776320790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wFzA2omutyDgArQT4+qbnS5naimicpEKr+NS8iMhMfo=;
        b=RJFDMLF+7I1OyM6IrWfE+92ArCADfVQAVB1oa9tKMKABBZjTBPclpLb1LbH4S+U7jM
         TIyGNqBOqRj6S8OJ3PRkdA/uAml6aNqZ8FUPUT17VzuPQ55Lmvs7OZX2UiO2Zcwh27Hi
         atoKt4TocFUQw9xWAvcNs7aEV4o9EK4DFOmurY8SGDe5wAYy+ocMJAjtbTgfvUenVBMY
         x37/cUgIs0YtMd/hF7lsfaWzbGSa6wjVnefIlghBh2DxNBsSmPSrIHM8NF+KPC8NddoH
         0OvTlgDSiJSOXrjwo0/a1tNmQFn9wIY59MODXCkwTgeTxQmr6PnB/jw6oCOLUKkapPk2
         4iCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775715990; x=1776320790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wFzA2omutyDgArQT4+qbnS5naimicpEKr+NS8iMhMfo=;
        b=lQtqTD3WXFp0Gg0/dOa/AX2YJmf1eaibDfsC7OneqwEATAashTcoDHYMBj3gt4KRrj
         OIGEAkFcKyWRxghSgpFb+k5qICMkSj3/5dkW0yd6Ce9U9bypvJMcgGyvF8EePexER7ok
         YTT7VJegPSEwPHWL7XVy6ExvLW9dAy2KTuUdF5hBgFpMgCmkqu8wwdtOtKiZZkAMHvvI
         vijovUpGT24NClTVUjaKFBLjwViGlE1Z4mCb2CuUFLdo7vOUwnIDQffxXFAK60iDPWbf
         UPFNacEcXRiWAgp7vKiD1tMzMJOFV3oJyz4axW3fH3IneGk6IwzfNkPax7948KvyGRRl
         7QXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyDGb9ieCp7Uc25zT5QkCNRBOvxxgsTito8uRsCY4ac+3U4wu0bI6tkBvaCs4f0Md3kxqu/d7JidtVJiRr@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8brDxQUCy/qeJZ9ziuEeAVMlDkBg4dd5ynMAt5hVFCkGUAgfI
	1spc+Z93yg87VlaDv6mR6vgOOE3ZCjfb+8xYeKdDj8VyHqwqN48MUGrIIksS30NCSqgDtHK7uBt
	zzKgj4oi2s+SAyQhuHwuKtYQ5LtbofyxhiLPj4srlEmQ8yFE6QDtI+NxoK6IocfrX7cAC
X-Gm-Gg: AeBDievWfWWhVMAzvm7ovlCDrraIldupXDiRG0PF5J1oo9pE5J78C73Om9M+rSoRo5b
	TucmN7fH6mCByHXHK59cw8GmrNaTsCxHo+03KNcizsIBwxfMjEE3cbPDia7Mbji8NBhrEJi4x5A
	4paZGVv99L4tX1yFv0ra82llBX/ttfJ1qInOrFizXhGrd8VTKup/Y4yJOehwaOmJD5VpbRWHUCI
	28UE7090AITsDmrvMtVSC1/O+CCE8xHKeX3VdU3+JGI7Xw/lu/fQqh0D3jS7qyYg6+IBD481O9t
	FR+XRVj0+p4Vh3mPpMI//DXoksZxzZxqozbYUq+QH2AciDCIHbMEolvv9a7EfZIdlJeBc1zR60d
	cSY8ZUa+JBMiaYa6yflwzuPM3mSZy6coYIA+kDdviVH4A5LhgNTudNsxdhHqaFva9KHqNeeOE37
	MIF4Z4V1RksZE4gN2vHw==
X-Received: by 2002:a17:903:1a90:b0:2ae:8272:deb0 with SMTP id d9443c01a7336-2b2c726c892mr25970575ad.15.1775715989735;
        Wed, 08 Apr 2026 23:26:29 -0700 (PDT)
X-Received: by 2002:a17:903:1a90:b0:2ae:8272:deb0 with SMTP id d9443c01a7336-2b2c726c892mr25970285ad.15.1775715989234;
        Wed, 08 Apr 2026 23:26:29 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cbd4dsm220786795ad.76.2026.04.08.23.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 23:26:28 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, ekansh.gupta@oss.qualcomm.com,
        quic_chennak@quicinc.com, stable@kernel.org,
        Jianping Li <jianping.li@oss.qualcomm.com>
Subject: [PATCH v4 1/4] misc: fastrpc: Fix initial memory allocation for Audio PD memory pool
Date: Thu,  9 Apr 2026 14:26:14 +0800
Message-Id: <20260409062617.1182-2-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260409062617.1182-1-jianping.li@oss.qualcomm.com>
References: <20260409062617.1182-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: P5RVe55_uW11SqgG92QKUnpJLUfumj_I
X-Authority-Analysis: v=2.4 cv=b7OCJNGx c=1 sm=1 tr=0 ts=69d74696 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=Op9FgWJ_R3wbKKMAuNAA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: P5RVe55_uW11SqgG92QKUnpJLUfumj_I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA1NSBTYWx0ZWRfX17fSF7IOBELi
 H7lh4SMIedPqNmb/VJ3yQVKfidR5mYc/NPnjapIW966krwTpHAj7XEvKq1rOEYwmFKs9RY5fYG7
 /RfAJV5oQB9GP5mhwEZyRGw2XTDk9uRpXhv/wuMFJBqkWI1O/CJ+R+HWKO7Nk8bpQS4M5kZUBdb
 TMqZyjYuA/rYXueRIOM9iqE6w+32mZ7fnaMaKdb7FaTtnYIawesUJeo968Yeeb4b4w74I8rhwr9
 00FuHSHH5qnDt1OOvnHJj5QBI3RDCGWq26OV+zKOdC9tjYcYJ8AtPIqF7PhIIjnuY1OnXinKOtR
 opQWKX4vfppexgyI5bOANjpCcI52ru8ZGzvI42bXmnazNPG4ltC+qwwHnlSnQAGmsEzSOedMT5V
 85YOmnDxgJZ9c2UbYh9Irl6GEZgxzc9g2j4VtmyeUSQKESW/Z3WYQAktu0rM4K6vOqVJBtVYBl+
 dWFRCMYmp8z5Y5X066A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_01,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090055
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102412-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 76E303C691C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

The initial buffer allocated for the Audio PD memory pool is never added
to the pool because pageslen is set to 0. As a result, the buffer is not
registered with Audio PD and is never used, causing a memory leak. Audio
PD immediately falls back to allocating memory from the remote heap since
the pool starts out empty.

Fix this by setting pageslen to 1 so that the initially allocated buffer
is correctly registered and becomes part of the Audio PD memory pool.

Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
Cc: stable@kernel.org
Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 47356a5d5804..b87a5f97c96f 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1324,7 +1324,9 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 		err = PTR_ERR(name);
 		goto err;
 	}
-
+	inbuf.client_id = fl->client_id;
+	inbuf.namelen = init.namelen;
+	inbuf.pageslen = 0;
 	if (!fl->cctx->remote_heap) {
 		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
 						&fl->cctx->remote_heap);
@@ -1347,12 +1349,10 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 				goto err_map;
 			}
 			scm_done = true;
+			inbuf.pageslen = 1;
 		}
 	}
 
-	inbuf.client_id = fl->client_id;
-	inbuf.namelen = init.namelen;
-	inbuf.pageslen = 0;
 	fl->pd = USER_PD;
 
 	args[0].ptr = (u64)(uintptr_t)&inbuf;
-- 
2.43.0


