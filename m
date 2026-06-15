Return-Path: <linux-arm-msm+bounces-113191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4OYtCI4JMGoWMQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 16:17:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C06D3687087
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 16:17:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RdxzjBx3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=R5epxaYz;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113191-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113191-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A5E30304095D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 14:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 658583F8EB3;
	Mon, 15 Jun 2026 14:17:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF933F9F50
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 14:17:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781533033; cv=none; b=b6pQo7Qxh9QTbO70oYVM3pHHGFoasu1CBD7a/YZ3to77dexwAbFsPdyxJ9GtPIsF+rhLf40SIXobtmYlz/6CeK6nlj1PKL6n72Cli1UoYq7MwjBj5qPFrpa0lX+P5TG16cEQ2UbaHRun1UBYwIE4bdE4ehrvCnoWDVgf8mp+1AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781533033; c=relaxed/simple;
	bh=QHuJbNfZclwAUqET6A1WfhO2/jqOdVEs9Fpda71LKyc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tOaoEMK98NW+odb56zMyjyjH7mnlTPDEQPU2A5SE7LmEj7198JO4XkfkjAXgMT8lDCBOkTKr77Y8hDjhrPK9GnaT8o1HGtZnni1wOP9Qd1dT1IX+oEKs5STwFN8ayOz4b3dyGu1c7QzpKEDya8KyepDicIZRdKveDC4dh2XIJeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RdxzjBx3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R5epxaYz; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FCZH0f023472
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 14:17:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8uZNp+VwhVSjExHeT5LvpX51VbIe9sjYP4PbK25Inpk=; b=RdxzjBx3vPSj+4Fk
	O35DdkAQivu0MDI4s114/uZR73tLeO83J7kWQRaZHoDsGMu/s3AAQ47PCbXNb3R5
	J9cKCet35nYh3DS1hF/C+/wPAK3BTFKQXOao3yjV/LqwDM3ngWiZ/BqqQAcgxeGB
	3NbZazocOJsCvFX64vLjy2vn89JTHc+PqrhJjyaa6GQrT3bqNTv1nm3ff9Ih5mDM
	dA0uP8P2iNNYXujqpMTDIVdpfW2GTYz1ogziayDvbckS9Z+2CfnGIgvAOiFWe2lm
	YQHBR4Yq1KGCkPJh5JS6A1kydnx95EIt404FO+CAV8rmcjhAABvmfyUbOAwblvXI
	cjA9ug==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etew0h38a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 14:17:11 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3773f1eaf91so2426767a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 07:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781533030; x=1782137830; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8uZNp+VwhVSjExHeT5LvpX51VbIe9sjYP4PbK25Inpk=;
        b=R5epxaYzHXJ6zVCrvYdwBM5X91xWdgQ8bzATIvo1Nmp2fkS6Va1MxY8sMInrh/3dsI
         BuFoqkA6WptDASu/M1BdOvbo7Hr/DXdNBGDYrYCk6om5/l7abC5wiac+lY625xT4XWwj
         77+CromcPBWRuc7o9bW/Oa1RKbh40BFaSmfXK8fPWsVa1WvaDFN9yV3ciVgv3AdfCe1C
         7cRNwULl/HK3W82MzYX1/FFn8xEMPSrQjvgmD+tOdz5ajL2TQ33eDyrrhS1jK7MTqSIP
         q9ohA/R1ikubUWBZCEJQLycj39kDISYMxbQGWRObFay6FjD8GqvQX7bwdWQ2ndKUs1rR
         qOdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781533030; x=1782137830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8uZNp+VwhVSjExHeT5LvpX51VbIe9sjYP4PbK25Inpk=;
        b=l1q02OD7+3JmhRQ19d0+u0ET8PxJe8nNCQ23ofozmAKQS9c/zek/Wnr7Tj48Zej++N
         /PkdIAHCvP3EO1+upHqZooJZnF6CN8+8kkWBY5gBUNU67Xa4zTLc+hNevPNgR4CeCqAg
         no9sE2R83LXYQvx9LjpN0BX+vFQVM3+5jcWOY5uMPCX7qMMAdMQuqze9q9Uit9oafkZq
         LLRdhyA9bCF+r3COX4ObiDg7tJuWyCI8vIJKU+qaolfN8S7ilnDrKQGDQxhl0gkUZQ6p
         WEke3qQSl0bfV3jYmXvUwC+9vCSAQIYNuY/0zEkJ9oIN1wfG67DBBMafkQIxMvVrXSxi
         IIJQ==
X-Forwarded-Encrypted: i=1; AFNElJ+whfEWAYCMMaPBIHT1Kc9RwU0eT6EpLLM4YGLAxd3qnCJBopjQC8pjbucakqQ+Q+ie+yPErbsfMeUPtNkY@vger.kernel.org
X-Gm-Message-State: AOJu0YxLUUHyr0YQo5QbWpVkTFwFPV/yGgG68DszylEqOVSGL5rKN1eC
	XFnN2PgcZ7S2Ger9UhzLi/p06xd3hoUibv8hy03aWUJgq1UCFoNJdYFZJaoRwh6FJXk4T9FSnTF
	XAwKz/Bg1OXEhsLiRpCWo5LyORq8g04Z2gu629d5CnyJA8oXpTOeCBhCeUg8w5X1/J+Va
X-Gm-Gg: Acq92OEKY7N2HwswO5oIzUGT9JdFwZneSJpXNUYnlCNkWn3g2GMEdOSNw1vZGqnY1H5
	+ClbY+N4WXBqD+M4qHfuxcEKUvP9pQVBdtTUQeb/etknH71RnAJBmNNfOfkKsQdSv6tqqX/QXHh
	2PQmHBAOsChQTLLph384j8VhmG1uNjngMrksH7HEvsAkLtcYQ5OoaEe8YuLqWJ/RAfFPHizq0fQ
	kV3Kwc2ZzJgT5856k6Lf/JmohfDQThuacDsvdAG+9rYr76/X8/7JmgWvV51nGBjAus5qpYr4tlD
	gUmrlphPeP1YhPV3pIYvjNDeX2AkCbs88HeOASTymWrP2EHDZ5SoGU8E9OB8UevL/PdFHYNdbox
	7iR4sVtfYsoSQcjqzJcmS9S86bQzB89EavK14bMQ/chs0UUIVCl0Ynx8=
X-Received: by 2002:a17:90b:57eb:b0:36b:ba9b:7efb with SMTP id 98e67ed59e1d1-37a01a3bfa9mr14972749a91.5.1781533030387;
        Mon, 15 Jun 2026 07:17:10 -0700 (PDT)
X-Received: by 2002:a17:90b:57eb:b0:36b:ba9b:7efb with SMTP id 98e67ed59e1d1-37a01a3bfa9mr14972697a91.5.1781533029836;
        Mon, 15 Jun 2026 07:17:09 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379e8cc467csm7172476a91.2.2026.06.15.07.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 07:17:09 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 19:46:52 +0530
Subject: [PATCH v5 1/2] serial: qcom-geni: trace: Drop redundant len field
 from geni_serial_data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-add-tracepoints-for-qcom-geni-serial-v5-1-2efa4c97e0e2@oss.qualcomm.com>
References: <20260615-add-tracepoints-for-qcom-geni-serial-v5-0-2efa4c97e0e2@oss.qualcomm.com>
In-Reply-To: <20260615-add-tracepoints-for-qcom-geni-serial-v5-0-2efa4c97e0e2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781533020; l=1611;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=QHuJbNfZclwAUqET6A1WfhO2/jqOdVEs9Fpda71LKyc=;
 b=LwNaeHXnoABG3t/pEhTPPctahozCFsxBP/IKBq8jFegkPwyzPiCxL7Yo7rTJOBH3ODTmsdmzd
 FmB9mHxSnI+BXmKaBGOvcbCvfn8r9msx+EOYbf0Ftnnq1DKmQmbQyCB
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE1MCBTYWx0ZWRfXwCiUi6JKjYOt
 rkg/3mx+/wbaJSvK2aulmaQN2SzfzyIaajaTPOsjSuMjHUhOYop8npTtLQBsrrIKJ+Xk5klckAk
 jGkOB+G3ap/sJghicDYWAZ/JhRJnn4o=
X-Authority-Analysis: v=2.4 cv=QLlYgALL c=1 sm=1 tr=0 ts=6a300967 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=lKnyCkGSJWauGj82uDsA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE1MCBTYWx0ZWRfX1eP8q26XxXDx
 +czo7HGM5S6DpmoIa0Ct0QrJk9qzNfxT4s4axEPqIXkrZm58X9wivwrgRcKZXOQq20DcsaA917c
 LR2i/i/s5gxRobP+CMSTzrueXhjV3y42RsN3YQqzXKlV8Jb5ksqlwPCqEYYtMA630HeQXpYZeJ0
 pEbNAD0DnJOrSaKg0k42S4Ofo8bbQX1D/RS5wmwrxgSPzyX5Mfz9GIwnHe7atjcSga+dgGcVL7U
 vhYtn9VSStffSpaSy+lQnEMCpsU62t2rW5IRym6rBCFy12o9EiRVv92KaF66BNf0fxDWKFV02YP
 +WjNbktZj8gi+VnIww1xoDoGV7JH8ML+EFIVg+EAxEZMAzysABboL6ViuP3faK6KpDXrbTXi9NY
 ErmrZs6huI4fJ+Qss8McwPEce8tBcQXG4uumyf2Auby/i3BXlp3NB43Wx+izxt6hahoABzr5bn2
 nprWnSSZ2W4Ibmm8ubw==
X-Proofpoint-GUID: YFI7b5AQaqkEamczz0DYpXj5s46bhcwH
X-Proofpoint-ORIG-GUID: YFI7b5AQaqkEamczz0DYpXj5s46bhcwH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150150
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113191-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:praveen.talari@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-serial@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C06D3687087

The dynamic array stored in the ring buffer already carries its own
length in the array metadata. There is no need to also store it as a
separate scalar field in the entry struct.

Drop __field(unsigned int, len) and the corresponding __entry->len
assignment, and use __get_dynamic_array_len(data) in the TP_printk for
both the len=%u format argument and the __print_hex() size argument.
This saves 4 bytes per event on the ring buffer.

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


