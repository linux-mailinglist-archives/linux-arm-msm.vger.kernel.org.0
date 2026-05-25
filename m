Return-Path: <linux-arm-msm+bounces-109596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMbvDikOFGpeJQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:54:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1BD5C82A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:54:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B1829301AABD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 08:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B653212566;
	Mon, 25 May 2026 08:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KS83IpjL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ibIKk/8Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CCE3E3DBF
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779699228; cv=none; b=hkNPCkcdIvM+NlVX0wETUdno7qao4SOw1JnbahasOU9D+vyxz6VTfbPa5ajafJLP49VKDVF/wWkQOK27Cp2/eMdFBHhEBqGjRAa0VYitP/2cX6LfStMChYh1astbSVEiiAEDdakXULMDxccc7Fh6gNB4Ndpc7Mprm5VROqZPyBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779699228; c=relaxed/simple;
	bh=WBCoYLmyZFiNh2zUKegeQ1u9X2ezTlViEUR9q3uqS/o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YOZ7me6zF1df7U0vd/YAmagZaILdatYEoyc84jRKd0buMnID29qoRYV2gMowoqj65LFRyxL3vbIT38z/nCSEP8kfiNjBAb6ip4p9C6LpIx1H1uXjjRvh0n6GG6TUk0YuLzzZkkpDJmbzB87tullzKgl1fNZ+6TMnNIxDYeHPWX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KS83IpjL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ibIKk/8Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7HYoO1779602
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:53:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0h/mhahRgaE2Bh/5+3ts6a5CZf5wPc0/y4q
	da4eF7uw=; b=KS83IpjLOibDwQEkZZFc9OXI4lIvCWu2K6cCWbpElKDGmK+UkM/
	j3O6Nh/aHzOuYwUEdMR8GrftbKlsH9TIp2FKdb0WeKatUA+/eddxq2lC+/3TsPtX
	rnZLlbs564vqoZizSMJCYEpe9tkL6tP9xJYQTm4NwxDi+PLea8qdxf95PdA+hIuh
	Cmh+VgGk5r2cpqgUf2p8BJ0EvaHnNNs/p8YLNkZ/mt1qi2kGT2BpKFVmDaBAO5cD
	gobyWGCTKVSPFGFozOFcELP44HWP6WqOO/Oc24zVrM0A9wu0u0ECXeBxu3aEgVsh
	+Ga6WXecMsJo2zFpT9fY2taAAOTpt6wWC0Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ebba0w3na-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:53:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-366ded5ab5fso18521618a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 01:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779699226; x=1780304026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0h/mhahRgaE2Bh/5+3ts6a5CZf5wPc0/y4qda4eF7uw=;
        b=ibIKk/8Ys1SNyv2D+rDcDxXXWFUSlgKQKtQuu3YlJwPIjcKLleviz6FP8O+pGdxhuc
         qT8OE/TY/RE5NgjZKJa3uyWP/JmH4+B30zjRXttXITkvEJekq0eir+eUzPbzf6Ogslmy
         EK8m2H/uKNyDpHx6oj4mXOonzb3i0W1bANcBdGlKxPvgoIPKM17YpBeDWeqZJ0ttTDGF
         75tOYvLYZ4ibqfnqJ7ZWlNVmImlWEgKSlrHjJib6dnNvKfGOgp31eQ7vpzDGLfhWH3ZB
         k+b0BE1lsb6jjrAfno1sd+1hKWWnq7p76K40NpaDshFvHjSuhkrodevDTPaS3N9CliOF
         ieCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779699226; x=1780304026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0h/mhahRgaE2Bh/5+3ts6a5CZf5wPc0/y4qda4eF7uw=;
        b=AhrQ3xvbp+AYJoxVIGoeeUaX5fWrxf/kBYBBcddfNLfLO/pYov+KyjH6F5XDdoWh5d
         UOapF9ONqgzAZKoL/VeKupqs4QEnGq0sMIuBA/Cl6Yri6i707cCDHq8A2Y/Tklfz1rWs
         KmqtB4Y/2RCAyl73Ac2R7VJm8kBWlJBMlLgrBtNgOEI9Htu+0umiTxsOvgvKZ8+0Iewe
         XxINnU0Xpe1K/rxWSG1YDqILlk3ntwqtLLqhGj5kZsITScBtey5IFVDYyM847mGFacC9
         Eqpyr2sLh1udWFs6NfGMRGETKbfE/CjIjoKTmIkeLqbSyBS2RFxMxonp/uCKUZ0LJn8d
         d6Tg==
X-Forwarded-Encrypted: i=1; AFNElJ9d4Cg6UMfLNdicHi5kQF+EPcJZGwGGhGenO2Eq04h8a2+Jr/cBNmJb+DVXSRmhZXE7chnOMjTrmNiFJoG4@vger.kernel.org
X-Gm-Message-State: AOJu0YyNFkV8zN6lylBP9czwBFuo4yceg+EVoi7bc1RhLM9joJ8YTwb1
	emToZRGf3KOkQq/Cngci8WCudi08gSgVYUFVn2zgupF+sKMeRVsSnuKZI5CVtpO1HgulURaE2Sz
	3UOc2ZI99HPuv/K08hwaVT/63v5DumSviQXGUGeCMt/CNc22TX83mO5ekyhne4LOlyhz9
X-Gm-Gg: Acq92OESFYyzD3TsVl8fls2mKohbfEe5Rx+PMd82wy9yOLWT8VrudP019a+8AzspF+t
	qu0F8C/qxG30ynuM7OnUflQ1MuykGblqdadKH9ECcKK1qxaFIukjaosCCk661CWWj1E3TLjd4dU
	HWUiqdRgVpJrjQPzdiydhUxm11KPeRGJkg52og8nGuZCx1DSm5+2nVRjvjgvCa7V87vFVsmwKv/
	0kxKBz4I6ZDvuDToaBmZ7hzIiX9R8h2mXT7Qupl1publaN4BlfB5IEqdwlKp+YFHZ5EJNLtQqUb
	0uUali1Xr3eaDK9xbm9NrnDpoef16ba51cBMRAcvON93SUhP+8+J2vHolQyGscVSnZCYYwkN1Tp
	2p1FHWOUtFv71/pCy6Bcuy853/6q4TsDSPM3mY4oUew41
X-Received: by 2002:a17:90b:2d44:b0:369:7b04:49d1 with SMTP id 98e67ed59e1d1-36a674212fdmr12480809a91.1.1779699225719;
        Mon, 25 May 2026 01:53:45 -0700 (PDT)
X-Received: by 2002:a17:90b:2d44:b0:369:7b04:49d1 with SMTP id 98e67ed59e1d1-36a674212fdmr12480784a91.1.1779699225277;
        Mon, 25 May 2026 01:53:45 -0700 (PDT)
Received: from hu-anane-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8520576972sm8062249a12.29.2026.05.25.01.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 01:53:45 -0700 (PDT)
From: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        ekansh.gupta@oss.qualcomm.com, stable@kernel.org
Subject: [PATCH v1] misc: fastrpc: fix channel ctx ref leak when session alloc fails
Date: Mon, 25 May 2026 14:23:40 +0530
Message-Id: <20260525085340.2734738-1-anandu.e@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: jJh6i8LR6srxUb8L9_kgOO_Rki-gzcG6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA4OSBTYWx0ZWRfXwMZINK3gTZDe
 lF/W8Ju9jnmgVx+Z5kdib6B/aqL2AMEwmH05+auKO09Txwller76VwbRqnhBDNmdLLM5FFmeF0H
 v+hLF6o7ge7V1gdLuBukBG2SnmaQuBHpw7xZYWXnsVyD3BbvRzya0PFSum4/0Lh0haPllaTNylT
 pVMtkaRG4LaPQirQW9Qlj3fPGyT3pBPW/c9q67KaIGJwFrUE5L0DcWEYGhct4O17ul69IFjaGKw
 waQQPzNOHtTfSicNeBdCuOhiQS1A1Gy+vJmbbB7UNQ6qW2OHNisfHQCKZ5IauI5vxyFhHV5SMHx
 Vs4xc/KHn3pJKudcx7ucP+vMQUlUQQ5+dHvtdtB1jYB6k1HBVAOY8hCUU1ptjxfOLp4qY7H+2f3
 1urWAmsxD5GrvdwqcTAE0Bd213F0l70A/G+JkQKPdMLvtEzHRixRq7ajDO1Vnqxvwh83GHHl83m
 MVEqjC+Bs6wnmzwJ9Vw==
X-Proofpoint-GUID: jJh6i8LR6srxUb8L9_kgOO_Rki-gzcG6
X-Authority-Analysis: v=2.4 cv=Xca5Co55 c=1 sm=1 tr=0 ts=6a140e1a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=2IMaJKnPo4bYYrUu6c0A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250089
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-109596-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[anandu.e@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AB1BD5C82A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

fastrpc_channel_ctx_get() is called in fastrpc_device_open() before
fastrpc_session_alloc(). If session alloc fails, the error path
returns -EBUSY without calling fastrpc_channel_ctx_put(), leaking
the reference. Fix by adding the missing put.

Fixes: 278d56f970ae ("misc: fastrpc: Reference count channel context")
Cc: stable@kernel.org
Signed-off-by: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 1080f9acf70a..9442db2c7aec 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1648,7 +1648,7 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
 		dev_err(&cctx->rpdev->dev, "No session available\n");
 		mutex_destroy(&fl->mutex);
 		kfree(fl);
-
+		fastrpc_channel_ctx_put(cctx);
 		return -EBUSY;
 	}
 
-- 
2.34.1


