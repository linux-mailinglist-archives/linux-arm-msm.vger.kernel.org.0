Return-Path: <linux-arm-msm+bounces-116350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6EpOFlHRR2rjfgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 17:12:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB19703BEB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 17:12:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hgJ+5XTM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ihvs00Qc;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116350-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116350-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1416306BA9D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 15:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0810416CE2;
	Fri,  3 Jul 2026 15:08:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C973D25BC
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 15:08:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783091317; cv=none; b=jRizXBF9L/MHo7ZrC1y4PseOcNYQankWgRDdiSVrMEw7tBNOAeM8rPGH20Rnyl5W2YJhqX9hPsIg5GZPEGAq4uoO+eEUKC1DxbtYW8JtcYgUh4M9GXk3G0JirIWtz0Yl/a5j767wzbAON1RoCULOBLLkm+YQYqtP8wwl/8GKMtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783091317; c=relaxed/simple;
	bh=5QeoQ8TXJ2eWRKCulVJNBYD2hW0MNG0GXK/uGsHOHF8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dGXNHIsBvesezGP5NmR2RgsQR2p0rcvTkkLyQnzLUcBCOOHtjbI/oZdccqyMG+CTOIPVVU8Dsf8MqX+IRkpADRqQo/3lO562ExOEVaaLvVhxfbGpcI1e7+6jt1ynxn3A/Al0BmpcjcwgZLA0MZo/lOqtqzR8cmBrP8QVQKX5UxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hgJ+5XTM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ihvs00Qc; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663Bqhaa4091025
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 15:08:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	68zuQffoeICSOePaMqdl4NB4vCyqD8mj3IAHDnfcNUk=; b=hgJ+5XTMVyqXw9Sy
	VnmE8sRX6T/JPLnWfQBb8Jd6cLisRnw6d31hwIvGrCGEVgAhFjpTJy1R0enEtK9N
	l52vx+MD+hkfnUm5zAsUdHiDxyF/SLP+ERrYXR0PT5FLQdH5H4T8LayXDPBGb2CX
	c7PLTSRO8jmOpnu4O1civmMrnS9sbdsbNOVJHy0+IGSGT4d0Y2x1F8Gx7MRsjozY
	UwyqmSTsfLre2/v8Xgh/Dji8OUXkzPzU77vGk2a50LF7MeKxiSRfNK8GD1JnV4AR
	wf5iutX0VWcpyKFyKmy/4QwyuYkqnWkBGJEoSAJtdPskgETMB2AvcuDjZOaNUeNl
	AfQQYg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ckj0n7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 15:08:28 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c890bac374eso1156819a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 08:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783091308; x=1783696108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=68zuQffoeICSOePaMqdl4NB4vCyqD8mj3IAHDnfcNUk=;
        b=ihvs00Qc/y1y19noa8hXr2E7S4zBJ3pEEOaBDtrsxx8tM4MQr9WVv0GQWycJ906m5w
         1snUqQ/j0eSbBnkU8IBdKry1mYnjrsFG19Bm5JCR/QK46fGgoK8BTNviIps3f7eOj8O3
         92Z9iIwpZO+wN7YJu8lHD72BuQuqvmUgsR7KBh8kdrVqtba8OoHp3bzwVUuRmYQ9tqNB
         ovaOzIFH5bADNDH6uVavWLqk4uKaitwXKfMv3JEAzSlkCpc7Q6XzPAXFjaN4Ym/ATeqH
         IG6cSQrAPUKWESr71jNhcMKS3p1JdZTAW6dictlpXA/xno1fTqViYF6UIUn+vvqGVF42
         TDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783091308; x=1783696108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=68zuQffoeICSOePaMqdl4NB4vCyqD8mj3IAHDnfcNUk=;
        b=B3qU4ZcywYY5O1ENJOdgpP2XM/ydqe6hEXRVmrAgrySTAeylYjFC1le90HHr0p5JB8
         ONrprYCVZWlsMU0yRi4bs9rwQ6nB/9pn9ksKjA5QadD+dCB6vLR4+th6oAG3VOL/vrIM
         KTUUJAGFQaHV6Webj2A5cGeEKEPuNCfjr+3hwJtxyYu+nM3MFOazhwGi83rHaWojv4f0
         bce/4CPhB8lBfZ+zEG/7xJB23Kec4wvIDYMYwoPiCWmGD/yQlYoUi/xRRIBMLi8CLJNU
         yGdcaye0UVAImmBgV96ZDOf6E6FHHgwJTaGGlInhehXmoJH44T/8npRoHeWoxVneahho
         wziw==
X-Forwarded-Encrypted: i=1; AFNElJ82fiiYBhV4Kj8Rl9GTdzC7mrIKmgiq44dP46mR45Z3Z6JSqCoiKhqOs88oXZfzXPOwNP1vc6PL1kIVG+ZF@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5PNLUEn1Ul0482hBQJd7XxbrZOHVANFvzvjQd6Qom/1ISpvIS
	6wHbrN/rYRPCL9oatARaoq944d4liIHauVI3nNNGmeXRO34xOGYE9JfONnEVNutYri8sUPfDmZ+
	849KNe4i4xr3L+g7vlog9D+muIIE8ON1Gwb+Vn+1+2Xgv0PmoNNFxwEh4AF/2isKv17W7
X-Gm-Gg: AfdE7cmp8WwQ0kwGPNj4+gBpnipMvjUm+XJS8+MEPqv2ZIvhOX/NswP2iP9yRVRDMoM
	MxsfH3GIDH4oZcmO2W4dFjl9Gq/Ozqe3hweIHOC2opfX0Yv6uZqlfXRmiETrQI2EDdYzcMnfOAl
	yACHs492FNWOXURmua+CAlRVvImgv59XxTWWM0J4424VLGW2Jjte8zhgGwRMnjSSfRlrW3tyQyF
	8ahpdg/WfjweR8WdGfK/a5sfOYdTfYhfwMflXxG7LV32+0Y30bPnyeo3UvBFLMhaipJI/yJfgLJ
	0dqP/44gFB6XRUvQjjxlvCZZib2D0h7oZvflyuTqofMnut8x/Aipvo7sAk5pEhL0SJchHjmKQGf
	d55Yqdtce5id92pQ+1FyoyFobLfNKOlSgFzCReCsoX8wn
X-Received: by 2002:a05:6a21:6191:b0:398:7ed3:a001 with SMTP id adf61e73a8af0-3c03c457672mr276009637.2.1783091307552;
        Fri, 03 Jul 2026 08:08:27 -0700 (PDT)
X-Received: by 2002:a05:6a21:6191:b0:398:7ed3:a001 with SMTP id adf61e73a8af0-3c03c457672mr275943637.2.1783091306833;
        Fri, 03 Jul 2026 08:08:26 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b816a42sm37007808eec.9.2026.07.03.08.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:08:26 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 20:38:09 +0530
Subject: [PATCH v2 1/2] i2c: qcom-geni: trace: Add trace events for
 Qualcomm GENI I2C
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-add-tracepoints-for-qcom-geni-i2c-v2-1-e8bf8b178290@oss.qualcomm.com>
References: <20260703-add-tracepoints-for-qcom-geni-i2c-v2-0-e8bf8b178290@oss.qualcomm.com>
In-Reply-To: <20260703-add-tracepoints-for-qcom-geni-i2c-v2-0-e8bf8b178290@oss.qualcomm.com>
To: Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783091297; l=3246;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=5QeoQ8TXJ2eWRKCulVJNBYD2hW0MNG0GXK/uGsHOHF8=;
 b=TRAW3IelPIMSyF0NYXNPzhAQLEYVuT27+/yMOfHFHYswg5RHanAQrpiyP7cEqxbScnUhXmEmp
 lOtJuvK39/lCUrh8ySv7Q1k+WlFwibwotS/qC6ZCCHBbaj70J1678Ay
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE1MCBTYWx0ZWRfX4S4bIdI8Uz9E
 489peuKZslYoFjd2VZhDA/csChQSgEEI8Fdt4JhIl4tzR+MDrhTri9hJyKJN6uf2OKSNNNQfhMt
 c2rdzrn7vWMca1K67kzdF5vHVUeqbLg=
X-Authority-Analysis: v=2.4 cv=E8v9Y6dl c=1 sm=1 tr=0 ts=6a47d06c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=meVymXHHAAAA:8 a=EUspDBNiAAAA:8 a=CL0R8eYuxTG9Dar42d0A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=2JgSa4NbpEOStq-L5dxp:22
X-Proofpoint-ORIG-GUID: KUVd1HW4IqNu0zJS_geB_nH5e4gHRwHH
X-Proofpoint-GUID: KUVd1HW4IqNu0zJS_geB_nH5e4gHRwHH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE1MCBTYWx0ZWRfX7ymXZbWXR3xB
 xIYI88b04LAWuLeJsG3kWsuZo4Hk9ZEz6+U3FAqaAfMILRRgeW1kFxJRj2M9t4zjKAbKW0X3J3y
 31p7CwQLUA8AaEy35XhCB2I0d/uimtd6xTDrPG2/rbjG9dqDQK0vSXmtsjZdZoj6sxLk0fGr3C6
 UpeTfnp0ilGzHwBxya7zk2mc3aZJjv0xxA80RxbL/g96nnB+JCidFv9ryoAA6iYg/FWfXeuxCwE
 EU8aio8LWeyT8YJD3ysjJ7/FD3BbpZ5SJ16yHQQn8GzmzEa/9/NPQX/jDnpc/GJI3/BQupVlTqH
 Mnmh37zp/znYEd16KOnBzyb8yN/Hhk9e1tiHvK9f2Qo6OyFm8BeAYiQXWVWBv5Gp4dzhPBj5mZa
 Al/wyf781ibq7o0MF/iB+SEJppt5mf+Y96qKGqT2b2vvt2qYgyvLivPnMcWuJqwc84haj4u1jrk
 XBOiLwRdgjOBzl9atrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030150
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116350-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:mukesh.savaliya@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:praveen.talari@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,goodmis.org:email,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DDB19703BEB

Add trace event support to the Qualcomm GENI I2C driver to enable
detailed runtime debugging and analysis.

The trace events capture I2C clock configuration, interrupt status
and error code and message.

Reviewed-by: Steven Rostedt <rostedt@goodmis.org>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 include/trace/events/qcom_geni_i2c.h | 82 ++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/include/trace/events/qcom_geni_i2c.h b/include/trace/events/qcom_geni_i2c.h
new file mode 100644
index 000000000000..c7e7984f3620
--- /dev/null
+++ b/include/trace/events/qcom_geni_i2c.h
@@ -0,0 +1,82 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM qcom_geni_i2c
+
+#if !defined(_TRACE_QCOM_GENI_I2C_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_QCOM_GENI_I2C_H
+
+#include <linux/tracepoint.h>
+
+TRACE_EVENT(geni_i2c_bus_setup,
+	    TP_PROTO(struct device *dev, u32 clk_freq, u8 clk_div,
+		     u8 t_high_cnt, u8 t_low_cnt, u8 t_cycle_cnt),
+	    TP_ARGS(dev, clk_freq, clk_div, t_high_cnt, t_low_cnt, t_cycle_cnt),
+
+	    TP_STRUCT__entry(__string(name, dev_name(dev))
+			     __field(u32, clk_freq)
+			     __field(u8,  clk_div)
+			     __field(u8,  t_high_cnt)
+			     __field(u8,  t_low_cnt)
+			     __field(u8,  t_cycle_cnt)
+	    ),
+
+	    TP_fast_assign(__assign_str(name);
+			   __entry->clk_freq   = clk_freq;
+			   __entry->clk_div    = clk_div;
+			   __entry->t_high_cnt = t_high_cnt;
+			   __entry->t_low_cnt  = t_low_cnt;
+			   __entry->t_cycle_cnt = t_cycle_cnt;
+	    ),
+
+	    TP_printk("%s: clk_freq=%u clk_div=%u t_high=%u t_low=%u t_cycle=%u",
+		      __get_str(name), __entry->clk_freq, __entry->clk_div,
+		      __entry->t_high_cnt, __entry->t_low_cnt,
+		      __entry->t_cycle_cnt)
+);
+
+TRACE_EVENT(geni_i2c_irq,
+	    TP_PROTO(struct device *dev, u32 m_stat, u32 rx_st,
+		     u32 dm_tx_st, u32 dm_rx_st),
+	    TP_ARGS(dev, m_stat, rx_st, dm_tx_st, dm_rx_st),
+
+	    TP_STRUCT__entry(__string(name, dev_name(dev))
+			     __field(u32, m_stat)
+			     __field(u32, rx_st)
+			     __field(u32, dm_tx_st)
+			     __field(u32, dm_rx_st)
+	    ),
+
+	    TP_fast_assign(__assign_str(name);
+			   __entry->m_stat = m_stat;
+			   __entry->rx_st = rx_st;
+			   __entry->dm_tx_st = dm_tx_st;
+			   __entry->dm_rx_st = dm_rx_st;
+	    ),
+
+	    TP_printk("%s: m_stat=0x%08x rx_st=0x%08x dm_tx=0x%08x dm_rx=0x%08x",
+		      __get_str(name), __entry->m_stat, __entry->rx_st,
+		      __entry->dm_tx_st, __entry->dm_rx_st)
+);
+
+TRACE_EVENT(geni_i2c_err,
+	    TP_PROTO(struct device *dev, int err, const char *msg),
+	    TP_ARGS(dev, err, msg),
+
+	    TP_STRUCT__entry(__string(name, dev_name(dev))
+			     __field(int, err)
+			     __string(msg, msg)
+	    ),
+
+	    TP_fast_assign(__assign_str(name);
+			   __entry->err = err;
+			   __assign_str(msg);
+	    ),
+
+	    TP_printk("%s: err=%d msg=%s",
+		      __get_str(name), __entry->err, __get_str(msg))
+);
+
+#endif /* _TRACE_QCOM_GENI_I2C_H */
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>

-- 
2.34.1


