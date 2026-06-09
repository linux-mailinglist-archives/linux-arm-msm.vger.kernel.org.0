Return-Path: <linux-arm-msm+bounces-111998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id d3VLD/qBJ2p/yQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 05:01:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5C865BF2D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 05:01:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kYTtSGuO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=S8Ohoo3b;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111998-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111998-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 72FAE30BDA1E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 03:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB86735F19B;
	Tue,  9 Jun 2026 03:00:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4718D3630A9
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 03:00:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780974005; cv=none; b=dPiM7P+5xst9Y3tAueYH9DX8hdanlHKfI6ZXnP2WaICngdDEFsreOwHnaNhtb0hvPaC2qq5ILqpz4UuGnyr4Y3ReIjoW1AOe5uT1VdXeYYwF96Y3zLwxn+GEBrY2VhY3rZK+uVtGMfYnvRcq2KaYCuk6lrThQ0JqCadSrW8rAFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780974005; c=relaxed/simple;
	bh=022V/Cninx7cx1gH4fuokyrh/R4pQocRQgib6USyBTc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WtruLXtgj0csaLecbQp+1umptH0myyRg4oPjCA/NNl0tI5aGqtyQvS+st711nwf/J2ZGRbcSKcdqJ8M8I++Q220fQGHwsgAPoltigKb4x59uAdxP4d2sSK/CcRgvYaXWQ9hOe/c4c9QS5sDfqfrVj3pSCLvR3yTTtBoIPMabHj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kYTtSGuO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S8Ohoo3b; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6590s5V2591854
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 03:00:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CcVm4LVbeat
	o9ydc4x9yKkM2AgVmwI4Qp9HLKCz00oo=; b=kYTtSGuOf387a+MlDoOvtQwDhNa
	bgo7bM/w7cKEw+5Ta+P5ybyKxHiAlYeGZwxLtsqjfUTp8izU2B+EwGh52gad0chK
	Gx8ewTIrMJWCAaw3+Lx9O4A8L/SGG9dIVoh4DQ9RBZ+d0LE/vZeQdzPrJnTfnOgB
	YTbAp710EqOX/YJmvKzP3QPTyBrOuu1z16OsHJSrEl1kRpo213kA0Vsu+gD7TJxg
	oyB9/8pXF9ktDvjQEPx0KDygmysKieKMqrHqbtSubJz3Jpt4u4/wTKMe35Qw3tOD
	J7zEOVQySVb8A/Xm9Yq/ZKxtfTeLAsj7ukX+ok8kXs+z37sWvhFgaM+Hqfw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entrkvc24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 03:00:03 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36b982ec338so5869190a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 20:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780974002; x=1781578802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CcVm4LVbeato9ydc4x9yKkM2AgVmwI4Qp9HLKCz00oo=;
        b=S8Ohoo3bVVJFYBltExmeBn36WRYnH6hlZZ3gNI1Q1gFRlqBtbxYvyQNwq1M+2pSz3L
         YP32EgJGyudObl+Jazso0ZyagbRLZX6mZJ+mfu+354ZrHCKHUutY2JMjG4OzaCp/CDc7
         ch/hB7WM61I0YWzshSqvnnxqQKdoSUVMS2D2tDmcNmUOa7Df9QMr5UaIcYh3OSa8uqi7
         /FCWegkuZ1p3X5BFL91LsvQjBVOQsylHPnNjS6VBhivvtf66zvnWASaO77MpmnqJ8jEf
         9x33/1MiIeZCF8kKjdBpeH4CTQQpPblkqOVcQ90UXR/t4AOWS2rPDPXybvJGCR/jbejh
         Fjsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780974002; x=1781578802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CcVm4LVbeato9ydc4x9yKkM2AgVmwI4Qp9HLKCz00oo=;
        b=HLg8VqonhUrL6isRVgknmhMSU0+jLSJZxJVJ0ilDwARXBD1GyVFWlEv64QxNxBjEp3
         pWx3mZxDhXnozc3GkTGIFlBiVLV2jLRdhRbHrjtehUMPLQERYGMdFvCpwtDm/9nZaVpm
         rz6s2Q7DpGMoSN33iUSRfLT9cyuNlCEA3rgabFyOSQ0rjv11EUEIj+6EqexZ6gONCEER
         aIK1sj4iTH33dBG5SmyGLbiqHOh4d7ES1zrb8sJ+bVU9ztra9zJzf6Mad9CqlxG3B4+d
         DCV8mANeCUqw0aYJldmD6fsJ5S4H/agu7DC6C/ON6jgVi9JzBa6OLLQwIswOwt+xKj/V
         lX8Q==
X-Forwarded-Encrypted: i=1; AFNElJ8X5/iN8uRl1k6VhxC+XoERGqZ5MNKYK3Kv18J28OEcJeQrbNIGVZK2qrFeQN/iGYf3zZwo/aB1kW2FwsIg@vger.kernel.org
X-Gm-Message-State: AOJu0YyCcUi8L9vaG3YfwAW/TZvJgdmLM2jN/4XedX1ik8wBNGIoW5P3
	fI7HCh/CQsxq+lRFpEu+Td8tM6jgwF0NCj03j0fDaR7nKOyCkgYflqyJRqoGOitctGGliZmqdci
	ZOHk7yywca1mwlILvnESxdyoQ+GYgk5XZIBXj27++JKfeUMkajIZcN/dH3spD+LB4TUY7
X-Gm-Gg: Acq92OEFN9NlzRymOTH4u+N7tFYnO+hq2eOviApW3HQ1tjnrHInT8s92yPBbqQaUhJp
	hafyZwKeKxJC8p8YOpdMb96vSV5J1q1TpnoruZE0CeAVkA1NEFUvBUkg+iL375UUhq6JSc6F9XU
	t37vzwhz53zUTY3xAKlCHJAZniJO375TVeCvmuWuPTnLKjGiW7sPi52Z/WdJ4L3Drq0w6Fc6nkW
	z0bsVdI+JVkmmFLVuIMrHIh4LPAvL3/+jnRfiYaOeHZ4lz5F8pykVgL0F+BTJe6SkLK4Gyz73ER
	rUGCwWRuc9NzxY9hdQZ9WXFmO9Vv7qqsNGOzpiH9ITGJq/IAkmfNts15gT27MGDavzzow2kk+oZ
	/SVTp/0TGTNhdo7tBRpQ+Vzsu9ekrmV6mejNTqW5jxh8+uVWx0UGfnnrVLi0IMLH1SLamalef4m
	foQfWjDITBEyM+4ZTF6Duc1E024ega
X-Received: by 2002:a17:90a:d606:b0:36b:5b82:4834 with SMTP id 98e67ed59e1d1-370ee547414mr18903629a91.7.1780974002434;
        Mon, 08 Jun 2026 20:00:02 -0700 (PDT)
X-Received: by 2002:a17:90a:d606:b0:36b:5b82:4834 with SMTP id 98e67ed59e1d1-370ee547414mr18903604a91.7.1780974001960;
        Mon, 08 Jun 2026 20:00:01 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3712fcb2607sm8713835a91.0.2026.06.08.19.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 20:00:01 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, ekansh.gupta@oss.qualcomm.com,
        quic_chennak@quicinc.com, stable@kernel.org
Subject: [PATCH v8 3/4] misc: fastrpc: Allocate entire reserved memory for Audio PD in probe
Date: Tue,  9 Jun 2026 10:59:37 +0800
Message-Id: <20260609025938.457-4-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260609025938.457-1-jianping.li@oss.qualcomm.com>
References: <20260609025938.457-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: GiilNWK0Fy4AMtmsRIuub459fn8W12sz
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a2781b3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=c8cBMUidy7NAwe8AhH0A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: GiilNWK0Fy4AMtmsRIuub459fn8W12sz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDAyNSBTYWx0ZWRfXwYCVxe15SZ0J
 ZmzjIpfbfHz1ot7qcPfrjWX3f4NxTSMrJevcPO9vPwFjMICJQ4lVNMWbmKnBm9s7TTD4fFQqvAF
 PUZ+a6B3v3VfwBW5epKBZjKlslY/zvLR1CQaQbPuQ8VF34A8KcrBm8SS3EyGqU3JqGYDBLkkNJM
 Hshmg2D6Jerd5lFPpNPN9rIiWz1HvWsXq2R8lD88p3Nfzsu0Kxv6OBBbVw/Ij6npmdrHvYB0Vsh
 tAAiwTJJO1n9EWmRYJUzsem4KR+EznK6xFY+carsmGSf3LVaJ8/wNvzyrt1f+1N38OkAuPXWa45
 S/FUVXY7V67JlYQcfc4RAj7BwHcpGksI2qO8z8oC6r1fEqkXNr9GtFBSCVBGul8eZ83udp12pu8
 J43o0tkrlU+RyJCJckXCV5AGbYQAvCW9CXWwc7yveBq5mEtJZmyll5UVUrtG9QTP5ymPQHJNtns
 KWf7eXsPk9Ht9IHdTdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_06,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090025
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111998-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:jianping.li@oss.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:abelvesa@kernel.org,m:jorge.ramirez-ortiz@linaro.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:ekansh.gupta@oss.qualcomm.com,m:quic_chennak@quicinc.com,m:stable@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9F5C865BF2D

Allocating and freeing Audio PD memory from userspace is unsafe because
the kernel cannot reliably determine when the DSP has finished using the
memory. Userspace may free buffers while they are still in use by the DSP,
and remote free requests cannot be safely trusted.

Additionally, the current implementation allows userspace to repeatedly
grow the Audio PD heap, but does not support shrinking it. This can lead
to unbounded memory usage over time, effectively causing a memory leak.

Fix this by allocating the entire Audio PD reserved-memory region during
rpmsg probe and tying its lifetime to the rpmsg channel. This removes
userspace-controlled alloc/free and ensures that memory is reclaimed only
when the DSP process is torn down.

Add explicit validation for remote_heap presence and size before sending
the memory to DSP, and fail early if the reserved-memory region is
missing or incomplete.

Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
Cc: stable@kernel.org
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 112 ++++++++++++++++++++++-------------------
 1 file changed, 59 insertions(+), 53 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 517884000331..1942e74535e5 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -276,6 +276,8 @@ struct fastrpc_channel_ctx {
 	struct kref refcount;
 	/* Flag if dsp attributes are cached */
 	bool valid_attributes;
+	/* Flag if audio PD init mem was allocated */
+	bool audio_init_mem;
 	u32 dsp_attributes[FASTRPC_MAX_DSP_ATTRIBUTES];
 	struct fastrpc_device *secure_fdevice;
 	struct fastrpc_device *fdevice;
@@ -1341,15 +1343,24 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 	struct fastrpc_init_create_static init;
 	struct fastrpc_invoke_args *args;
 	struct fastrpc_phy_page pages[1];
+	struct fastrpc_channel_ctx *cctx = fl->cctx;
 	char *name;
 	int err;
-	bool scm_done = false;
 	struct {
 		int client_id;
 		u32 namelen;
 		u32 pageslen;
 	} inbuf;
 	u32 sc;
+	unsigned long flags;
+
+	if (!cctx->remote_heap || !cctx->remote_heap->dma_addr ||
+	    !cctx->remote_heap->size) {
+		err = -ENOMEM;
+		dev_err(fl->sctx->dev,
+			"remote heap memory region is not added\n");
+		return err;
+	}
 
 	args = kzalloc_objs(*args, FASTRPC_CREATE_STATIC_PROCESS_NARGS);
 	if (!args)
@@ -1373,31 +1384,6 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 	inbuf.client_id = fl->client_id;
 	inbuf.namelen = init.namelen;
 	inbuf.pageslen = 0;
-	if (!fl->cctx->remote_heap) {
-		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
-						&fl->cctx->remote_heap);
-		if (err)
-			goto err_name;
-
-		/* Map if we have any heap VMIDs associated with this ADSP Static Process. */
-		if (fl->cctx->vmcount) {
-			u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
-
-			err = qcom_scm_assign_mem(fl->cctx->remote_heap->dma_addr,
-							(u64)fl->cctx->remote_heap->size,
-							&src_perms,
-							fl->cctx->vmperms, fl->cctx->vmcount);
-			if (err) {
-				dev_err(fl->sctx->dev,
-					"Failed to assign memory with dma_addr %pad size 0x%llx err %d\n",
-					&fl->cctx->remote_heap->dma_addr,
-					fl->cctx->remote_heap->size, err);
-				goto err_map;
-			}
-			scm_done = true;
-			inbuf.pageslen = 1;
-		}
-	}
 
 	fl->pd = USER_PD;
 
@@ -1409,8 +1395,17 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 	args[1].length = inbuf.namelen;
 	args[1].fd = -1;
 
-	pages[0].addr = fl->cctx->remote_heap->dma_addr;
-	pages[0].size = fl->cctx->remote_heap->size;
+	spin_lock_irqsave(&cctx->lock, flags);
+	if (!cctx->audio_init_mem) {
+		pages[0].addr = cctx->remote_heap->dma_addr;
+		pages[0].size = cctx->remote_heap->size;
+		cctx->audio_init_mem = true;
+		inbuf.pageslen = 1;
+	} else {
+		pages[0].addr = 0;
+		pages[0].size = 0;
+	}
+	spin_unlock_irqrestore(&cctx->lock, flags);
 
 	args[2].ptr = (u64)(uintptr_t) pages;
 	args[2].length = sizeof(*pages);
@@ -1428,27 +1423,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 
 	return 0;
 err_invoke:
-	if (fl->cctx->vmcount && scm_done) {
-		u64 src_perms = 0;
-		struct qcom_scm_vmperm dst_perms;
-		u32 i;
-
-		for (i = 0; i < fl->cctx->vmcount; i++)
-			src_perms |= BIT(fl->cctx->vmperms[i].vmid);
-
-		dst_perms.vmid = QCOM_SCM_VMID_HLOS;
-		dst_perms.perm = QCOM_SCM_PERM_RWX;
-		err = qcom_scm_assign_mem(fl->cctx->remote_heap->dma_addr,
-						(u64)fl->cctx->remote_heap->size,
-						&src_perms, &dst_perms, 1);
-		if (err)
-			dev_err(fl->sctx->dev, "Failed to assign memory dma_addr %pad size 0x%llx err %d\n",
-				&fl->cctx->remote_heap->dma_addr, fl->cctx->remote_heap->size, err);
-	}
-err_map:
-	fastrpc_buf_free(fl->cctx->remote_heap);
-	fl->cctx->remote_heap = NULL;
-err_name:
+	cctx->audio_init_mem = false;
 	kfree(name);
 err:
 	kfree(args);
@@ -2415,12 +2390,23 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		}
 	}
 
-	if (domain_id == SDSP_DOMAIN_ID) {
+	if (domain_id == SDSP_DOMAIN_ID || domain_id == ADSP_DOMAIN_ID) {
 		struct resource res;
 		u64 src_perms;
 
 		err = of_reserved_mem_region_to_resource(rdev->of_node, 0, &res);
 		if (!err) {
+			if (domain_id == ADSP_DOMAIN_ID) {
+				data->remote_heap =
+					kzalloc_obj(*data->remote_heap, GFP_KERNEL);
+				if (!data->remote_heap) {
+					err = -ENOMEM;
+					goto err_free_data;
+				}
+
+				data->remote_heap->dma_addr = res.start;
+				data->remote_heap->size = resource_size(&res);
+			}
 			src_perms = BIT(QCOM_SCM_VMID_HLOS);
 
 			err = qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
@@ -2428,7 +2414,6 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 			if (err)
 				goto err_free_data;
 		}
-
 	}
 
 	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
@@ -2487,6 +2472,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		misc_deregister(&data->secure_fdevice->miscdev);
 
 err_free_data:
+	kfree(data->remote_heap);
 	kfree(data);
 	return err;
 }
@@ -2509,6 +2495,7 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	struct fastrpc_buf *buf, *b;
 	struct fastrpc_user *user;
 	unsigned long flags;
+	int err;
 
 	/* No invocations past this point */
 	spin_lock_irqsave(&cctx->lock, flags);
@@ -2526,8 +2513,27 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	list_for_each_entry_safe(buf, b, &cctx->invoke_interrupted_mmaps, node)
 		list_del(&buf->node);
 
-	if (cctx->remote_heap)
-		fastrpc_buf_free(cctx->remote_heap);
+	if (cctx->remote_heap && cctx->vmcount) {
+		u64 src_perms = 0;
+		struct qcom_scm_vmperm dst_perms;
+
+		for (u32 i = 0; i < cctx->vmcount; i++)
+			src_perms |= BIT(cctx->vmperms[i].vmid);
+
+		dst_perms.vmid = QCOM_SCM_VMID_HLOS;
+		dst_perms.perm = QCOM_SCM_PERM_RWX;
+
+		err = qcom_scm_assign_mem(cctx->remote_heap->dma_addr,
+					  cctx->remote_heap->size, &src_perms,
+					  &dst_perms, 1);
+		if (err)
+			dev_err(&rpdev->dev,
+				"Failed to assign memory back to HLOS: dma_addr %pad size %#llx err %d\n",
+				&cctx->remote_heap->dma_addr, cctx->remote_heap->size, err);
+	}
+
+	kfree(cctx->remote_heap);
+	cctx->remote_heap = NULL;
 
 	of_platform_depopulate(&rpdev->dev);
 
-- 
2.43.0


