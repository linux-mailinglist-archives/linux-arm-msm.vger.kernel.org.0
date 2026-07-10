Return-Path: <linux-arm-msm+bounces-118334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SlcPDQUpUWroAAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 19:16:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1B573CFB2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 19:16:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ewx7vady;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XTq1OQRQ;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118334-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118334-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED02630315C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 17:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1D2743B486;
	Fri, 10 Jul 2026 17:12:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA5343B4B3
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 17:12:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783703557; cv=none; b=JIpuusFNOs4g0tCWvRBIgWD5+iFFDRhfDZwnUYdHmQH2p7/0GDudcthqwAlL4cln8XY1/iIrXfzfmwoup7+H/F/DZQ5ExLNPQiFA9m0rUypPnt7yPJCzBD7v4FiTDeIcnKSf6PDMc9z6rk8nrQSfSszPQtIZhM7t4eeWCUaR2ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783703557; c=relaxed/simple;
	bh=KaWEDOpkUuVKoVg9qHrT7941BE+j2QnbfV/wJwii9NI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uy6jQTIz++eb6j5gFAA7rQ7S/S5Bt3OK7ggi2WCORy88o/VvJooDfU3gTVIrBtDOpPHaR4fk1zHG7Uog0WxCejOVPgxBfsEpTrLaROE+4BOng+6hmNC58WjI/F69VSLjVVSOoOIgyzwz1EGDO/GWGiEfj3z9Sdn93LI0ffC1bq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ewx7vady; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XTq1OQRQ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AH45Ur1326531
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 17:12:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sxIr88wu2w6WZwojybE6NAOi4XgPpY4LktqZVJRtIYw=; b=ewx7vadybWw9WIYN
	CLeYlqnO/B0nFGmPPi9AjpZ0iEC11DIMQAX3cgTNCwO6NeCfJoG/40rKrxT0x6hs
	Ai3UdrBRCiAdQwkiNUa6GV7QBq+6MQ/3i1VEZLloA14oFP87X8ZsJpmDmJC/4C1y
	dMGwM8d69tMRbHXPXx0qSln20Oe+ACgdmhPNfyK2uaRDKc/dAxORkJ55/L8qB5bl
	E7eiJdixxIZOJhaSb5IRJMOleFkhp/7tqoYDAcUOwezD/y4O0Y4qb31mihl3gApk
	JX9/y1YeaZdQs8/QN8D2IW7p/PrZkKd8MBLsPIgI0SE9UkNDBKq7wwGQ794s51U9
	xoj8Hg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fb339rf2p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 17:12:35 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c860544c077so2820838a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 10:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783703555; x=1784308355; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sxIr88wu2w6WZwojybE6NAOi4XgPpY4LktqZVJRtIYw=;
        b=XTq1OQRQT+XckvtSvfuMG1y8v0Ux5hXt3oCkLxtfwk7+CBJgxdBRJ7EeJXreeWGEIJ
         ogB166PtGmWO0Aju2h+8rAUD7n6x77f3Fa7y02FrU9VneAb1ADHcr+TZ12SR9CKDxjic
         NI+6sOruMYNueMoJ3JU2y78sZE8n9Y7f0spcGm7zYQbVbYDjErT6dN2syvWl0sY1bafp
         eyfGLGNEpW0sGmLDjN33bZxzqKrnCTyr2vFjJ2rvXwZ8QYXCTqqNdWGtzu9lIGc+8EoZ
         ssZKdnCkzttNoqliTdHB/QkWuiUbhPvmByjTJbMGU8lMZkl/mAKNVi3lAmWkiwGPJAf3
         bFYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783703555; x=1784308355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sxIr88wu2w6WZwojybE6NAOi4XgPpY4LktqZVJRtIYw=;
        b=qvUiJ4YuWGgoLPdvD3qzzYI9Z6wORASGgVwpc1upUhACm+Kb829aF7Ks9sL9wNlIZG
         QXaZkM26pxiV9yJyUlgu5yyvpGxIyjKkrEkBoV81f5P1xwit0rRHft8Ulphnmd6Oi5ps
         A8RXI/e3Lpc3xDeyDQHYGYOq6MF1R/nfB6++3SdNcBb0hKeWwE37/wYPPYlggIQ03edu
         a3xkoh+oFdic+lFCqrHgSvAuaqavcpCvcHYHAOQh3zMacHQs8gXFdo9lR3fSmXLn8CD2
         yw4Wg9eQMmHQfZBBe1AzGCJV6xQMITxZnkGC7HLWKk8iPHlUuZ9h3Ug2RUwqpj7gebja
         EL/g==
X-Forwarded-Encrypted: i=1; AHgh+Rpfd3UhhCoz8SJINs2SaWhaiDTYqdOn1iSrlGZ4u3QIbBmevA/5qSk9SmAO5ZN/3BAJ5Vn6dkWgbWHhahEI@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg/LwiUaF+6m+yWiwuBP5d81OMDogcj4ZDhqbHl6+rryjKG9fZ
	7l2PnpH9gfp910GFIkEkzM3FoLX3ULOET6vf61oeVOinK18n/cr5jahLTqqT9ebmSngqP8nd2gH
	I4UWtG//OtthdD/sPTMk5s0NK9R8SgskkdloWbWjyu+J+kePP+nF3FhL8MZGB+fbmG54J
X-Gm-Gg: AfdE7cnr0bNfT7DLGhj01WkmM5g4UpkfpxJqMHzd8y0XygFYo4p6XVQ6MuD4lZxv3oJ
	JNNN+T0nAoNWnmiJv7mko2IXinqXTgo10RGbnj5Ces1+xyarNDox4oXBtXC2D1nybYLhcKjNsjF
	yVlJi5Rh28RszzMWl1YVQWt4pScipiRYPolcTTitMI+MiEJczVI4xBejwK9+1TVIwmabsQgLdz9
	StcsVbJ72DMM1w+R6jqyeEXb7NTgwkKqS83PwgvDe024xPshjO1JMXZyzWUDbvD+Vlop4JB5oRl
	ddJllNB/5hXDNyrJUsxUzE1R9ImAcDk0y602F641KP5uPWSbuQgliRUn+MhN1uaEuwury3QyGNT
	hQxAuOnrkJ1gi1MnGnz7p5jaAb4hlI/UhAvnj7HeuiIAD
X-Received: by 2002:a05:6a20:1587:b0:3bd:203b:b587 with SMTP id adf61e73a8af0-3c0bd1a82c3mr14635698637.40.1783703554873;
        Fri, 10 Jul 2026 10:12:34 -0700 (PDT)
X-Received: by 2002:a05:6a20:1587:b0:3bd:203b:b587 with SMTP id adf61e73a8af0-3c0bd1a82c3mr14635674637.40.1783703554405;
        Fri, 10 Jul 2026 10:12:34 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d7c8bsm46636277c88.12.2026.07.10.10.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 10:12:34 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 22:42:12 +0530
Subject: [PATCH v6 1/2] serial: qcom-geni: trace: Drop redundant len field
 from geni_serial_data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-add-tracepoints-for-qcom-geni-serial-v6-1-2bb6b6836dfd@oss.qualcomm.com>
References: <20260710-add-tracepoints-for-qcom-geni-serial-v6-0-2bb6b6836dfd@oss.qualcomm.com>
In-Reply-To: <20260710-add-tracepoints-for-qcom-geni-serial-v6-0-2bb6b6836dfd@oss.qualcomm.com>
To: Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, konrad.dybcio@oss.qualcomm.com
Cc: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783703544; l=1724;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=KaWEDOpkUuVKoVg9qHrT7941BE+j2QnbfV/wJwii9NI=;
 b=IjfH90zTD7gkrIX1QapOnydV5xa43e3LHKBA3+2+LybTDgvWiz8fLKL01CFhC4xNHxh68dAQ2
 SmaLSRFSxEzDC5iyTmuEo0edgjoBDQR/2a6fsR1b+9TPsHDn75QicvC
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE3MSBTYWx0ZWRfX6gc3AFj9xnpk
 2+4tvCi7Akug2T7jeonDW/Otfjx+1Dz07NAaq7feBH7k+EmXyI6GNXJ5eedja8PGdOYDcGVnu42
 QCDD7Guus2yCMFV7AkFNykyWnn3ecsM=
X-Authority-Analysis: v=2.4 cv=Re6gzVtv c=1 sm=1 tr=0 ts=6a512803 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=meVymXHHAAAA:8 a=EUspDBNiAAAA:8 a=lKnyCkGSJWauGj82uDsA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=2JgSa4NbpEOStq-L5dxp:22
X-Proofpoint-ORIG-GUID: sTT-hT7K_ZukgsKchaDRx3vEh_7tIqoT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE3MSBTYWx0ZWRfX9n7LjcGfdpr6
 YN03DbIzkgBAH8XaaaSAsgqf1mmb4hHAOcP7RUB0HJ3Jthjhu0wPBipEBSBn6T/pyMhuYO66VNY
 B//dW1Xzfj1v22RjDA/EoEx4k/xl875XwN8VHLmXl1xEaHPMumXaIOuxUgBwXBwwvLieei+LbDN
 qLZaLm/7rVVO8liSHpD7pus8Slg76eOFlXSsX2nE4M3RHSnRArrRkAqz5nIWyBDtR55y6Tx1X2J
 9a8UaRK8xX4777V9IN0p9KBXRAsXEZ468GmttBfyB3VafeIKIqpjvF0IFmap6yjbFRXfofInvbF
 WWBjhMGHmsewTytbTl0ttc35WgbJGPPP3Vz/ZcUHLXKaCV+Z4pPiOcrRkFQIpc+O6qF8G9+/e2A
 Sabnr2HPWd3vcgm6OZoZmZ+1x4BbqXXXGPU7mssyIz5Ktt4TF7UGM16k/Towq6udaA+CgC8Z/ol
 IxZNkNDHGIEk7nbEc8g==
X-Proofpoint-GUID: sTT-hT7K_ZukgsKchaDRx3vEh_7tIqoT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100171
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118334-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:praveen.talari@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-serial@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: BE1B573CFB2

The dynamic array stored in the ring buffer already carries its own
length in the array metadata. There is no need to also store it as a
separate scalar field in the entry struct.

Drop __field(unsigned int, len) and the corresponding __entry->len
assignment, and use __get_dynamic_array_len(data) in the TP_printk for
both the len=%u format argument and the __print_hex() size argument.
This saves 4 bytes per event on the ring buffer.

Suggested-by: Steven Rostedt <rostedt@goodmis.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 include/trace/events/qcom_geni_serial.h | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/include/trace/events/qcom_geni_serial.h b/include/trace/events/qcom_geni_serial.h
index 417ec01f9fc8..e1aa551d525e 100644
--- a/include/trace/events/qcom_geni_serial.h
+++ b/include/trace/events/qcom_geni_serial.h
@@ -97,18 +97,17 @@ DECLARE_EVENT_CLASS(geni_serial_data,
 		    TP_ARGS(dev, buf, len),
 
 		    TP_STRUCT__entry(__string(name, dev_name(dev))
-				     __field(unsigned int, len)
 				     __dynamic_array(u8, data, len)
 		    ),
 
 		    TP_fast_assign(__assign_str(name);
-				   __entry->len = len;
 				   memcpy(__get_dynamic_array(data), buf, len);
 		    ),
 
 		    TP_printk("%s: len=%u data=%s",
-			      __get_str(name), __entry->len,
-			      __print_hex(__get_dynamic_array(data), __entry->len))
+			      __get_str(name), __get_dynamic_array_len(data),
+			      __print_hex(__get_dynamic_array(data),
+					  __get_dynamic_array_len(data)))
 );
 
 DEFINE_EVENT(geni_serial_data, geni_serial_tx_data,

-- 
2.34.1


