Return-Path: <linux-arm-msm+bounces-113695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PK3LLGCbM2qpEAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 09:16:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C38B69E054
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 09:16:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lgfYkfVT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YdnNpzEf;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113695-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113695-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8AF643005982
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 07:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6C4730DD30;
	Thu, 18 Jun 2026 07:16:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C44D3655F5
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 07:16:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781767005; cv=none; b=cD/hECbcQqASQFy1wPqEI+GH9YGfPyvv6wvrY2zdcqRIJ148T04gcGIx2d1/CgOij+maaak2SaGaYA3ti1VVqfzRwDyEgueuVuIZhGP4fuuUHgMCvtVXBczToJG9dcLvtTKSvAtBvH2cF/VL3KzKOTVqx4Zd9jmKYV5w5FpRkUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781767005; c=relaxed/simple;
	bh=hvOh8cEClaiB2vFMktW+2r7QZW93RLGLCpI2YW05JOI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=uwB36w6Rmj9CoWTq2CXKU+3fkoclyfxPHE1VJS2Z3spwf8/mXnc8KesZATJJk+Fb0EaenGdJrKacxEvfiQ7ALXOr15Xi2TxmtkMoeBlRlVbJgSc7oas/qdImncVGHtgfaWBBlG8isAgIcKIlPTyua05aOhZvBfYjRFnBdTIlrVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lgfYkfVT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YdnNpzEf; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I5rNqR3525647
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 07:16:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ShDllGPAIl7Vq+gPkwo0Da
	oUO1L9IDh4ObT/0q4ua4w=; b=lgfYkfVTR0heTr2aKIWDoJLQHU6psB53OEBhMI
	pp/ByugsWlDHzv+AcvVqflykj8FFqTFBraf37zyeoA/3XkkFmJxtCy49uSdWSlyX
	JCeesSWARtvQdyQkHynsd3aDvFYnyoGkjXVi5Q+VkCNIc/RxGKd6Izf5+oLHyrk0
	bceKS5FeBtSj6KfXld45T7yzm8Fitx9nZVX4/TWEz77I9YoQ0zsh/iIMYkHnzCAD
	J9F+WiOj7tgXOCpyMk6xgdFCE5PDgSHwAcE+TCJLifUusvf5pn8TjlIXCxOfK6lR
	agensCWxIZ2/cr606cy6ONTXZshqm8G9HjpJSagk9JEzM7FQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev1rtt3qq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 07:16:43 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bef75a41eso2864419eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 00:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781767002; x=1782371802; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ShDllGPAIl7Vq+gPkwo0DaoUO1L9IDh4ObT/0q4ua4w=;
        b=YdnNpzEfGHkooTz3bC94odi4E7aAhLooZW/YM4G1dc1CwKNcBu+PhU+OgnHqv13AbJ
         XzAr3PjoDEDwWWWXGhXp+xJYwrNW+2mOE7HRjw+iNGw0hpa7CHpeHP9uPM134sM/fg2E
         G45Ea+v/RurSitYPQ//jzO00YLsDQ6PhGz30iKFahhmkE8rLnAIQW8JvrzzOW+bktZt/
         pX6GB021aBMnqIYDESmTco+Zc3duStMdGMp73qF7ucmtxrTQLzNX1SWNpTYTRlrdCGDQ
         nM3wfqV3T0zygNM76Ii38Mck/hPRu6u69c1IeKevyGxpkd9cdhDZfaR6dcueMxrsgVyZ
         Q1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781767002; x=1782371802;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ShDllGPAIl7Vq+gPkwo0DaoUO1L9IDh4ObT/0q4ua4w=;
        b=f3hnfaUZiMKwMpK3vmub23PFg4IC227ePU92Vnhm6s1vcueUup3qWAm18fxncj9f7C
         P7KmU55LvGop9YtEdm7CQ8PuwRx8Y2ejsD+psFpLASZ56TSiJu6wlDQ6jq2tqNMtEj7M
         sd0K4jg2HZpztONp8qJvtdV06MlID5RRkIzFi3+BDLSARDgFRbATu7BtEPD8T/NlULyk
         pTJXgLi7eGSntsFZ2QI4u3WhiRyofXzdG5jM1/Jsck/hEppXd+B9XQaBMsgvj5u6j7yK
         ySCFDKsvfFtfAxX6t2WOKLsPwB4/hjaWiSk4I2Cxj2SRH3Z9gmLiCcb+1iM+fuAdUghR
         pDaA==
X-Gm-Message-State: AOJu0YwWELJgRsFN6c7Vbs39MFF7UoKkn3xo0En7ZzyzWzHOZIUF9Kv1
	uHZ4HQDcu3KcJyGhmuG6CH6JAmnX48+hkGwtyc9EfHlN822PTIVn3aFLzuewwFslkewAHMmFjwI
	vv4xQ88gmhbdxpdULC1v863bKPCfggYkZobcI3MdGAVu1y6dK6eQVgw69QYuGGrrDC2qM
X-Gm-Gg: AfdE7cnE5vMxZzwheqLuQZe0C/UO0ljfwvwwJwt0EC8pqMOevh1AKHV+eVW/qaAqGtm
	ZvLS+eACP0a3MyjWk8CdVf9j81e6iMv7WQZFXgxRDGwzxEaKxq16cL1izIXjylyO58jxZf87tcv
	9k5KxOrgV+JN3OtgVQ9ImZOndcXloDEDSrQf77WKrSfrI/6jLiKFO1tDKGNZOnI6lmnr90iQa2w
	/XtPClrS37/8hsW21x0xvPgpXc1ingUaYO7hmsBoFap0an73dDoQQvzGKUid4GeOVgkuH6O0RJV
	AJJwtG+nGtmadtnaas8qZhhbrupOSD+D/qzg0m4dhTbjzvvZnaFxqCVdYA/pqJl2Vgw/EpdDici
	CkjYGwqqYqsYdIKWloQEWCveo9WluqvL2umsD5WP0YP5TPL0E0fIlwGAXKHwCJ5z4/g==
X-Received: by 2002:a05:7300:2302:b0:30b:c502:23df with SMTP id 5a478bee46e88-30bf7175348mr885305eec.13.1781767002306;
        Thu, 18 Jun 2026 00:16:42 -0700 (PDT)
X-Received: by 2002:a05:7300:2302:b0:30b:c502:23df with SMTP id 5a478bee46e88-30bf7175348mr885280eec.13.1781767001800;
        Thu, 18 Jun 2026 00:16:41 -0700 (PDT)
Received: from hu-chunkaid-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30bd677ff31sm4089851eec.16.2026.06.18.00.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 00:16:41 -0700 (PDT)
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 00:16:39 -0700
Subject: [PATCH] rpmsg: glink: smem: order FIFO read after availability
 check
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-rpmsg-glink-smem-mb-v1-1-68a026453a69@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFabM2oC/32NzQqDMBCEX0X23BVj8Iee+h7Fg8aNpjXGZlVax
 HdvtPdeBj6YmW8DJm+I4Rpt4Gk1bNwYQFwiUH09doSmDQxpkuZJLhL0k+UOu8GMT2RLFm2Dssl
 lq9KilFkJYTl50uZ9vt6rH/PSPEjNx9XR6A3Pzn9O7SqO3n/DKlBgrQulMy0ySXRzzPFrqQflr
 I1DQLXv+xcvMPNuzwAAAA==
X-Change-ID: 20260610-rpmsg-glink-smem-mb-3b63dc278358
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Arun Kumar Neelakantam <quic_aneela@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        tony.truong@oss.qualcomm.com, chris.lew@oss.qualcomm.com,
        stable@vger.kernel.org, Chunkai Deng <chunkai.deng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781767001; l=1751;
 i=chunkai.deng@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=hvOh8cEClaiB2vFMktW+2r7QZW93RLGLCpI2YW05JOI=;
 b=CyC1+P4gLTNiG0GCQOxfrjRtgg6Ue4lxkOwxEGVYWbQRpaeYKJeG0NZaWGjaFEp05XZKrfcTw
 0rL0I8FJEITCUulKK2OTq8Ts6a7ADjaL3m7LvZpJ59vuXNmKKYfr8Rz
X-Developer-Key: i=chunkai.deng@oss.qualcomm.com; a=ed25519;
 pk=wWxCpsJRKQeVRzpZ8GLRnUX6ozLMowqE3hiz/j+j9O8=
X-Authority-Analysis: v=2.4 cv=MNpQXsZl c=1 sm=1 tr=0 ts=6a339b5b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cA7Ack57fQK9oI2lPcoA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA2NSBTYWx0ZWRfX6TG1vAln86iw
 DRLHtmVSt0WXBqdOTjPMBGS96dXz6cU6XWSLS1BrJ2gx0Yi53kQyEXdiA0M46z3+ZaEjkZegoxU
 dGVTPv00/ba+Ov1r7VC6nrq59vEqpAUB1E0fvpQCXqrXwzsn1KheJTalWi1aFiZCfz7y0XEvZud
 PX6EdA9ktQiG6U/BjJduLh2yBKHCuglS6C938gQV4CFGOK/YVDHOI6Jnv2lkQRGD5L2RGfmHKed
 VutnFreM/2BcefbM/mJf4LmBhT0qskfQ3TzQKVX9sxfFoqBdcPgeVFkMm3kZkIPJYe0+3oL0g42
 ZeC7t21nVXEr9J+Lr3zJMbJ7YRHrflrXCIAcWBsivapttHbOiO6z0zKmND1ShoaftnHXwsXxRGN
 Vi6MRj5Elk/BIRicaN9V6EeZ50kmfpWiGRbmS4i+xp5cRQeHFRFbuXA7Q/a/dtOFbVjwA9AiTxy
 V99V7D+33j38cOKvDVA==
X-Proofpoint-ORIG-GUID: HZwitxB0UvqANre8IeJvhCjS6BvHR9o_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA2NSBTYWx0ZWRfXxmmPolfaEcz6
 y6LTtxb6JK+xXb9alOLcy7X7ZwSmSpDmMMAQiyJ6fa6icqZysKlxLsP69YGsEA96dpWVnDOe8LG
 S4ShGyLcYTIZq8SYF+PMoKhWFF0bwz0=
X-Proofpoint-GUID: HZwitxB0UvqANre8IeJvhCjS6BvHR9o_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180065
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113695-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:quic_srichara@quicinc.com,m:quic_aneela@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:tony.truong@oss.qualcomm.com,m:chris.lew@oss.qualcomm.com,m:stable@vger.kernel.org,m:chunkai.deng@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[chunkai.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chunkai.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4C38B69E054

glink_smem_rx_peek() reads the RX FIFO payload after the caller has
determined data is available via glink_smem_rx_avail(), which reads the
remote-updated head index. A control dependency between the head read
and the subsequent payload read does not order the two loads, so the
CPU may speculatively read the FIFO before observing the head update
and consume stale data the remote has not yet published.

Add rmb() in glink_smem_rx_peek() before the memcpy_fromio() so the
availability (head) read is ordered ahead of the FIFO payload read,
matching the consumer pattern in
Documentation/core-api/circular-buffers.rst.

Fixes: caf989c350e8 ("rpmsg: glink: Introduce glink smem based transport")
Cc: stable@vger.kernel.org
Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
---
 drivers/rpmsg/qcom_glink_smem.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
index 62adc4db2317..35bb03e67ae8 100644
--- a/drivers/rpmsg/qcom_glink_smem.c
+++ b/drivers/rpmsg/qcom_glink_smem.c
@@ -103,6 +103,13 @@ static void glink_smem_rx_peek(struct qcom_glink_pipe *np,
 	if (tail >= pipe->native.length)
 		tail -= pipe->native.length;
 
+	/*
+	 * Order the availability (head) read in glink_smem_rx_avail()
+	 * against the FIFO payload read below, so APPS never consumes
+	 * stale data the remote has not yet published.
+	 */
+	rmb();
+
 	len = min_t(size_t, count, pipe->native.length - tail);
 	if (len)
 		memcpy_fromio(data, pipe->fifo + tail, len);

---
base-commit: a225caacc36546a09586e3ece36c0313146e7da9
change-id: 20260610-rpmsg-glink-smem-mb-3b63dc278358

Best regards,
--  
Chunkai Deng <chunkai.deng@oss.qualcomm.com>


