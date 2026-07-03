Return-Path: <linux-arm-msm+bounces-116349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pGAXGXDQR2q2fgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 17:08:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC0A703B92
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 17:08:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nkqb+VLf;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="NVIk/Ibq";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116349-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116349-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 639D63011070
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 15:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F3E1414DE8;
	Fri,  3 Jul 2026 15:08:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132A5413D99
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 15:08:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783091308; cv=none; b=RQiO6YsM6m3yecQuXvY6kvUO6jYLfS0gTPR/s/FHalAeU8SML46hmw5yvBnhO8xyCx8T1RxHEJu5dSjCARbHDrd21lX0923SiI0B2Df6r4Ow0V7/NtOTRcTDy8XSZG8+cE4aYHTpC0+rrOEpwWeEzl4fem2IIped1GrRuEHHhrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783091308; c=relaxed/simple;
	bh=5LefAlIjcE/PzYIC0Xzc1u6687PAblmcgOZr94jJsUM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BwDCEXim0OGUJVOOvngLv3d45picvV6OSInUHt1t70PMLSHgHbacT21Rf9x7wP81yUee3hdQe9cL26gz8Nm7c0jWjtHOX5Vrwy7g/sL4vFrqRZxenDuwhwvtLw7QNySkwRikoWIkpsf2DVylKnPS1lh5GIzcFStd9Lqt1CF3kxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nkqb+VLf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NVIk/Ibq; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663DWH1c3195235
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 15:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LvBcjeyn9vD9s8JRnZz8Km
	rSdZM+Hn1S3FaRZGhvGEk=; b=nkqb+VLfthfcEw5lsJWR7+XCb47gdjGiS/qcti
	kxxrlFpq/3iuEpzfSUuqAfEg6gi/T8I8vt8md5q3agiibnpto+pnLdKP0Jnu+U9Y
	DZFkD67R3FfCTx2ICElEmEX0q+iDimE0kjWjMznsrKeI1g5LadUJoiB38c0YYZfo
	BGA3EUN85J87YhXIPyBru+M2ds3hmUFsd12N6EG5As31Y7vkjl3o5oI8LOiVKJa3
	qfOgk3Ziu/CX3n2j4toBx5Y297q7icRlDHi/2ddb4qq7P752RpzXu1KJvW7xOUM0
	PXhqBGqKV62NhRJAhlnzIpAeqOoUobqyKRx9Rx8Vl5tN/nEQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68jyspqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 15:08:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3810fcd9adbso1056286a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 08:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783091303; x=1783696103; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LvBcjeyn9vD9s8JRnZz8KmrSdZM+Hn1S3FaRZGhvGEk=;
        b=NVIk/Ibq108/yZGN+Havw2v50Rgh514mH+/LGPwruDMbYyz69QZvUa+O9+hwWJ9YD+
         pFeIQhUDXTNHaSxhmHuMd6hSQNxUmoRBHBQ7FzPkoaBVbWngyaje6jxXJh00mG/RVzju
         VmZri/V5nhijGFeKPSXpUIvOUezzV5Y7DG69OCpMEMLO78Aj3aqYXSdEpU13Uhwx+pRc
         0u/kjMxHlQqUeOOcQ6jl0TdEs52rgt1msBKfoWgXRUk5OKUfWpZg4uF6d77/+y8ASTYA
         mIsaMSBqGtCAgB9jQNDXty190NqYHI3qsVOuivJjNBXRKhEvvFodkq+B1ljqKIxHBy2Q
         WeRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783091303; x=1783696103;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LvBcjeyn9vD9s8JRnZz8KmrSdZM+Hn1S3FaRZGhvGEk=;
        b=JKBe68E+6cxbCRQlqWi+lJ3VSCbfOYly4uZBu1fswEyP0YSp/q3FcHlXduorZvj311
         ppdhjOFVIecAudNHt9U8gOB9UC8yOFULkF1SsMMH2ptg2tQ7xSh4TQyCUP0Mua2QEaon
         TdjdWbzSPaYlNIaVkw51fO2n2ya87VnVQKQWH9sBQXWflYKhjxHoXpcfnnd3/xFesWJs
         mD10tVMrLv8G3JMFLM80H9giIMOWikcCIkwLK3zTjCyPGSd1cjiV1z97rxS32h1HJ2As
         hFpze9euXJdyDq3/zfm89W9fs9UCgG1t4Yi4ZZNxya/93PoEa0ERUQCOT58wAS5hQP7z
         CUCw==
X-Forwarded-Encrypted: i=1; AHgh+Roa3BR9ZqeC3VROePoj/tBaE59Y1zsefov//evselLEVFjLDZdyinJX/AieVz/HDZh2MECXfzUUMcR1spHy@vger.kernel.org
X-Gm-Message-State: AOJu0YwdDdMxHYLAJu3jGH8DZKwc12USLhjjXklXupA3CL/AKEWEtcMW
	A4UsN6vlf1UtXPAfqemBCWE8RVEt/0LG6CbRqMf59Xi39Xw03m8+CkhYOh7HOhiPNf/yA8/w07f
	XZNRDOX+JxrhggcvtfJDsu9UB6Fbvpksy2kSqeNgZnKMv2Tt5mec76E675Aa3tWQjGe5S
X-Gm-Gg: AfdE7ck3QnJywGODJpXtynxKdgPXxWC+xQroG+shlq87k4fVzjsPNFmo+9wYQZl3p6c
	uiNFrHLgQWo33V6wNv7f+zynzB/Z3V/UfZtgUpfxpVOr0wOfMZQe4j4P4ax3KVN/2pchurAR+/A
	0mxBz/MeZ5ru6cAX0t1vLjPZBdogIoScbSFFDEspmPAQtuT2jvhe3Q8hLMm61s9I7zROWdR+j3a
	WM1ce0O9rz2ERR1W/QsG5gXsHrntiqyO4XWZ6hcHRoUTOKhayaFmZ3aevrIwxmvBpaR0fE5Za0O
	4g3xkTMja0DK2M2uyD+KO8xVKYU6dzS7Sj06LWB02egU1fr5auzlalJX9jY8nOLM1ltZyWmpZlh
	jnxOfUmHx15lo9nccYEDMgRqktzDFbQOCAeBk4rerVBbN
X-Received: by 2002:a17:90b:5404:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-380aa0c086amr11735966a91.8.1783091302595;
        Fri, 03 Jul 2026 08:08:22 -0700 (PDT)
X-Received: by 2002:a17:90b:5404:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-380aa0c086amr11735910a91.8.1783091302020;
        Fri, 03 Jul 2026 08:08:22 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b816a42sm37007808eec.9.2026.07.03.08.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:08:21 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add trace events for Qualcomm GENI I2C drivers
Date: Fri, 03 Jul 2026 20:38:08 +0530
Message-Id: <20260703-add-tracepoints-for-qcom-geni-i2c-v2-0-e8bf8b178290@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFjQR2oC/42OQQ6CMBBFr0K6dgiUCujKexgW0A4wRlpoC9EQ7
 m5BD+Bmkpe8/Dcrc2gJHbtGK7O4kCOjA/BTxGRf6w6BVGDGE54nOb9ArRR4W0scDWnvoDUWJmk
 G6FATEJeQZSoV51JwXjYs7IwWW3odjXv1ZTc3D5R+H96Nnpw39n08saS79+tlyR+9JYUERCGky
 qVqkBc341w8zfUzaEMcDqu2bfsA0nVezesAAAA=
X-Change-ID: 20260629-add-tracepoints-for-qcom-geni-i2c-33d14584228b
To: Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783091297; l=1679;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=5LefAlIjcE/PzYIC0Xzc1u6687PAblmcgOZr94jJsUM=;
 b=HN2zlAN7FWoASXQeWDB7aoyI7VEkpA4oLeiY09i0kGoTcQ3IkBNPAaiS/2JZk50QDZTp4bEJO
 iH7Xc24a6VFBjVY/Jq73CxvrHRAPwuFrHTFF+wjLAEeOhDU9lk9/T7H
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE1MCBTYWx0ZWRfX9+gonTUoYQg0
 +zEgHulLHcjbghdEo8WjDSwoWJe45y+kp/DpnfReF2QJhh0g83p7UWqAeRGEmtRL57TZzyB2XzN
 4K+qC9/8TU2o2ntXh9g6dzAOIdhFSgQKbuQkhapDbjGR8Y/KB9d2VBYy9HFV3G//epUSIFdwpzl
 Vux9NqqKMqbC8v2hiwHaZ8RIlOOwIKViG+Er/FgBAoYNq71NiaW35bcqLQMqNfmnPmNu8x+2cmi
 jLF76rWPoQIDZxpwIgjImzltE7p2P4N+Zx5ALviEtFe/a74gGlbJx516Ue/swlYGeqjfjJfJ85p
 qF+LZe7MaSWXLSLM8SyahuBg9iMjLF8VY5tIAR++I46Yd7mAEsg+dGqdmcLYiD50NYfFQBegmby
 ZcjNTNU6Z7xBWNjtDqD2BmK0TmEpWPZSBGikH5cO5rztB+WWOl2NipXGzc7Z5jedIAiFNCScIsd
 JMKiWFlCNCrRF6ot0xg==
X-Proofpoint-GUID: 2QUZjz7FI8ebyKK9eyySkOsnSoRnVT-x
X-Authority-Analysis: v=2.4 cv=QbFWeMbv c=1 sm=1 tr=0 ts=6a47d067 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=pfqdL_FptRF-L44MAtYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 2QUZjz7FI8ebyKK9eyySkOsnSoRnVT-x
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE1MCBTYWx0ZWRfX9miwEixLEfw1
 WNb8SWRytqe3aUtIOZVtPYC/o69tlGVpKhB6cimilipIHgyUNIQEtjsj6hDyjr2VYC69U9Ho7z+
 RGtPuI2NuJXLMGnNEJXXkCEY32Gk8U4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030150
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116349-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:mukesh.savaliya@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:praveen.talari@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,msgid.link:url,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EBC0A703B92

Add a new trace event header providing tracepoints for the Qualcomm
GENI I2C controller.

The trace events cover controller bus setup, interrupt status and 
error reporting. These events enable structured debugging and performance
analysis using ftrace.

Usage examples:

Enable all I2C traces:
echo 1 > /sys/kernel/tracing/events/i2c/enable
echo 1 > /sys/kernel/tracing/events/qcom_geni_i2c/enable

cat /sys/kernel/debug/tracing/trace_pipe

Example trace output:
79.737075: i2c_write: i2c-11 #0 a=057 f=0200 l=3 [00-00-3f]
79.737075: geni_i2c_bus_setup: a90000.i2c: clk_freq=400000 clk_div=2
   t_high=5 t_low=11 t_cycle=22
79.737084: geni_i2c_irq: a90000.i2c: m_stat=0x40000000 rx_st=0x00000000
   dm_tx=0x00000000 dm_rx=0x00000000
79.737201: geni_i2c_irq: a90000.i2c: m_stat=0x00000001 rx_st=0x00000000
   dm_tx=0x00000000 dm_rx=0x00000000
79.737211: i2c_result: i2c-11 n=1 ret=1

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
Changes in v2:
- Updated Reviewed-by tags
- Link to v1: https://patch.msgid.link/20260630-add-tracepoints-for-qcom-geni-i2c-v1-0-474cd6cdbe27@oss.qualcomm.com

---
Praveen Talari (2):
      i2c: qcom-geni: trace: Add trace events for Qualcomm GENI I2C
      i2c: qcom-geni: Add trace events for Qualcomm GENI I2C driver

 drivers/i2c/busses/i2c-qcom-geni.c   | 15 +++++++
 include/trace/events/qcom_geni_i2c.h | 82 ++++++++++++++++++++++++++++++++++++
 2 files changed, 97 insertions(+)
---
base-commit: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43
change-id: 20260629-add-tracepoints-for-qcom-geni-i2c-33d14584228b

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>


