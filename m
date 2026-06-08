Return-Path: <linux-arm-msm+bounces-111752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T0xVAQyFJmroXwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:02:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC1465454E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:02:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cRusCZqf;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=daWoOtuv;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111752-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111752-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 02610301EB05
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 08:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5B983B8D70;
	Mon,  8 Jun 2026 08:42:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9933B83FE
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 08:42:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780908121; cv=none; b=qfaOxHqKhSdn1C2ARP0L1AmRE88IGg1eXd+xvc10dbUdjYmlAAl0XvzG5jQ9LsIS2hweikjJg7FToGrp5/diJ733MBIfpw/SA+gjDdnwdpNtNVtt4UGikEqAJVf0aCGL4MKuki1r2kUqGZRMZoCQfkKjogImA51ZnAxyfTfjNE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780908121; c=relaxed/simple;
	bh=euUNlkXptP1BKsR52Ex8E4lhLtd4sd5aWmiA0HQ2IOc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OzGW80aCGDo9FCgq+lvROgm1Mza/rFkZdxPdYWKIf7F6Ca6qwUhtgpCV2Ky2/GqtB8C4gmfHYf3QAh0GGfu/ezi9rLJAaGN2FoKTY9ax+KUsKxioEK584udBJUkwtv138Y9+gl5q2Hyef3+TtRxmFFwDy/4abiY74qNxYTWtmpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cRusCZqf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=daWoOtuv; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Qr2V2771589
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 08:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=adijQek5+CvTWZBuO/lX5cQ575Z71N3sAE6
	aK/sdH/M=; b=cRusCZqfq2xFtT5hv811kBpqTqPBzIbVOsFPVtjly7ErVqaHNo+
	uaCV2ZnNJWtyCPAr+xzF37/ZZ3aXjyTZU4nzfdLAPTNcdrLb9SqdS1FWW6C7zHKq
	f71nSBUe1P+siAj85+/+X/37OmR5ChG0OZicnWwzklOCJXs0Pk/UGj0oKdfiOIBB
	a7NjQ75fRIJp5i8AMuJE/d+bSytZ+q4uKjTo8GaMa5Dl0VJlfiuRpPFYPyBgxfZp
	1F5bNckDi8nnxZ7f3LCI9cdEBnL46qlKGQpqbCozfT0BF/bWl6ZQmP4FtlrI0lqy
	fGhneBe+4OdIvi/cEXDDUkV/A/Df++PY29A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embx6esrs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 08:41:59 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85a2bf5388so2247680a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 01:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780908118; x=1781512918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=adijQek5+CvTWZBuO/lX5cQ575Z71N3sAE6aK/sdH/M=;
        b=daWoOtuv/yw0Q/GF7ZLieQlgSdWrqr6lY9vnJWKPq8xd5xObk0f8o7Bt2BhayIWn32
         8zyNCPa3eFpueTNGQZDFeMSdpKfi/Jfxq9HRTEGg/nWJO72DvDsJqMGM79/KVfUARn4S
         KPbu4D91WbuzPqqdYXD/dF6B6GXjI1MPMerTjNR4RCPFRmyjtWxBCu2RP6Mj7FoLseSQ
         WZ00PPAWN6WOTNrouEmuNuL5+6JZ3vUh9yOvC6+PSLKkp0bt8UOx13eRAW7/WJcyLqWv
         ZRl5K6RN2MBjW50jOxu0GCWXUHhynssrZDVOqSzHn4bq7X2e7uolCaMH99Xm3INBRThp
         9+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780908118; x=1781512918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=adijQek5+CvTWZBuO/lX5cQ575Z71N3sAE6aK/sdH/M=;
        b=DAAf8Q9jlHcsbnI1BQRptbZAnTQcGUArkvHmX0j6Gl32RM3nvXA5pdSpiFU05XhvV3
         q9+0OuAloiepem7OfrQ2/dDjwRE1VhOTt+fUQq59VuIblYVEHH23n/7Q0iRLs+ZlRR6a
         kytbHUZAOq2arJffCsfATY112x+3g30PRk3FbPjANp9fPKptp6tSxatfMyuDhNjQP5TU
         XofRVa2V74BnaDnHvkHHFO8CNZg1nueUbmjRCeZdBiapMdg44/9kazEYK+td7StQAJ9U
         JxuB0efEZgf/33Gv852739HNT8kXlQhkRoGI0wQW4hwUWjoiUaIy3CZsty+hDluLpV2x
         Y3RQ==
X-Gm-Message-State: AOJu0YwNf3uX752tgNt68dVOOJ930pdBcSDjDMHLsQ/KnLKTZGcwVkuK
	aXMUFT3PNqUTooYoLYJaTF3nmPnmhN7V7j2iS/1dKrQNzcMxPvO5/3D6k6dGyxeftF5A6NGmqTd
	hd4gm8QtF5+IjIJkpTBZ2lbxXKkIdmoc0QVLx99QaSoCQdQOe2cUk+D+Xwcq8t6PPvDSR
X-Gm-Gg: Acq92OGks4A1ULQ/lzS3CeY0/BqdaVi9ylFKhqdxjYgNM8HO9lcs77bSUmdxGLU+t/a
	mkJJEsc1XfUeSk4tooNfJwCfFxCLRRYYC6+T3nnTgRnRNkRUtzwYZkwewY8uuTYoy/+1P7ozZqs
	1+xm90BTmp6OUXdlGXkkwRf1nOQYs4jUcfajEj6XDgue6Dve5vplQbNbKA07su8iNdrN2hUMMs8
	GSLXGIjgLeD/wBHhCPaDnb+u/4Ca4sz1KCv+3GE4CkPYLB5eUMTux+e4/xiKIsR2z7wO+8xxt7k
	IadKfgwA7wxuezm0B+Rtg++1fAG+Oyy2WVX9krrhq2fZ2IXFBUsOOUAUNX1LezV82azI025TqUs
	f0IWx6ECu3rf8tIb+0dZ6OBQmLWhSnK8r4E2lBfwx/Yg1SbLv+rmAEHq6wU3es7gzCNC7
X-Received: by 2002:a05:6a00:348d:b0:842:54c1:8e15 with SMTP id d2e1a72fcca58-842b1065838mr15146300b3a.29.1780908118560;
        Mon, 08 Jun 2026 01:41:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:348d:b0:842:54c1:8e15 with SMTP id d2e1a72fcca58-842b1065838mr15146279b3a.29.1780908118086;
        Mon, 08 Jun 2026 01:41:58 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842822222ccsm20520980b3a.3.2026.06.08.01.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 01:41:57 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] soc: qcom: pd-mapper: Add support for SA8775P and QCS8300
Date: Mon,  8 Jun 2026 14:11:37 +0530
Message-Id: <20260608084139.1468000-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cvmrVV4i c=1 sm=1 tr=0 ts=6a268057 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=mhgcJRBCfqJr4nURsvEA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA4MCBTYWx0ZWRfX7ErsQIJXm3pB
 X1uyICl/eZDq5MWWE4JuU8T0Pp75+igryzY2fjNlcIBzz9AmTBP2S8r66sZn5rErqJqUQz4XMJu
 4i04Nya6rc8umvvqbixc6Mh02EIMPQHnUJyfr2ngsc1FIfhMIbMIE1mD6wr8iWwnh1cYwLfBl8/
 /aubscNZHVM3bxfcokex8dKhBVBEeJ85Ub0IiUg1SSUhVfKHNNunZ3uzlgfvHC+u2CG3exHhCNa
 0d32LJWRiuiNtRKK8wmX08PB51295WIH85783vDQuJTXF+cf3T2H0h2o4hzWdVrliSise5R4VVn
 cIs0OR3tTdcx7BYTCPmdGiBrYi0sLoJZTO6O7dmltUd9/+QqtUm8R3R5HlnTtltohzNozpK2x7X
 VPiSmJtjr7+23QKN7wf1DiN0IMnDleWFhn1aiVXJLULB2j+mies+866di7Et1wBg792OrInfUIs
 wH/3QfE00Kglwo4E/Yg==
X-Proofpoint-GUID: N4QaikKX5EqhN-5jBKtGWbvSX5EHGD3a
X-Proofpoint-ORIG-GUID: N4QaikKX5EqhN-5jBKtGWbvSX5EHGD3a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080080
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111752-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DEC1465454E

Add support for the Qualcomm SA8775P and QCS8300 SoCs to the
protection domain mapper. Add an entry to the kernel, to avoid
the need for userspace to provide this service.

changes in [v4]:
 - Added a gdsp protection domain for QCS8300 and cdsp1 for SA8775P.
 - Link to V3: https://lore.kernel.org/all/20260209112947.930853-1-mohammad.rafi.shaik@oss.qualcomm.com/

changes in [v3]:
 - Added a separate protection domain from QCS8300 as suggested by Dmitry.
 - Link to V2: https://lore.kernel.org/all/20260127144315.4125110-1-mohammad.rafi.shaik@oss.qualcomm.com/

changes in [v2]:
 - Added missing GPDSP protection domain configuration as suggested by Dmitry.
 - Link to V1: https://lore.kernel.org/all/20251230102508.1491296-1-mohammad.rafi.shaik@oss.qualcomm.com/

Mohammad Rafi Shaik (2):
  soc: qcom: pd-mapper: Add support for SA8775P
  soc: qcom: pd-mapper: Add support for QCS8300

 drivers/soc/qcom/qcom_pd_mapper.c | 38 +++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

-- 
2.34.1


