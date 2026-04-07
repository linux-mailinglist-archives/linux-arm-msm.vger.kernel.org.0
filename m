Return-Path: <linux-arm-msm+bounces-102100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLM5J+PW1GnuxwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 12:05:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C813AC81E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 12:05:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D391B3011075
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 10:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E71B53A6F0C;
	Tue,  7 Apr 2026 10:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aiy2ZDv0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LaWbffbN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA843A3817
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 10:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775556319; cv=none; b=UwO3uYQbzpNG7hQTb5TsOSPlbu3wpb5pufT0lOx9ormBerhbXB1FQhbtQs3IcyHFSk3EG6pFNHbqB5G1nY4MUw2GRX4QKRqvY/8hEoNpDWgOo0vROTNdTOE84wVeMd6xVJn7fEwZGPfc8N+DXvIucjSItp7hsc6w2lyIvbbt8kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775556319; c=relaxed/simple;
	bh=v0ytFKVI7y5GUf0WEsI54rQnzXaEfnpUeASMKLOjtSo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TPvCt70eRwoUq7OQT0M1fYSFWlgWhQWOvCEAM/Ko3s9ilYiWhgwxIcKOEI+zIdD/tzy1ABhSyDhw3Idb1NLAJxXBLCRW3GTFyB4v+buc+sQnDSKUoxgu/nDOcKk3Sje9glQf8YQifBQ913YetfY0QOUWr6MNQM0o4Fb4X4iKWKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aiy2ZDv0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LaWbffbN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63775dNC2009139
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 10:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=h+rEtjUTgCpW0G5KO0ExuXR9g2mJWnqQ2yW
	pwt+RMWk=; b=aiy2ZDv07eiQug2FPuzghCVYncZAtb2fGE0UZubgxn/kzDkuDdc
	dhZTCK0CQZwkJke+2Q1P+2FiuaaHUWvwRgxlMqO8tzx7LYOoEg9wzXSOaEzmSOKi
	K+dHKj5M73IpcffRynXSrYAuWg9Vfuvt+geWrzsP36oMkkKEjFou8Y9zEAzvYDAZ
	CL0WQ+zDZPDUwTxSiCwPXckenDszj3adDgcXZgSEpoiAQFBdmKToSH9JNSHHu0VS
	WsZ98E9KfrsKH3FO0G1ALfIXmbwIIKn6+tpv25i5Q3LSZFcBF1XPmWaHMvcWmsS0
	QgsHv8CghWiF7dBYFuug4e/E4EEIE0w3Zvg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrrt6te-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 10:05:17 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82c83bd48afso2785114b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 03:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775556317; x=1776161117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h+rEtjUTgCpW0G5KO0ExuXR9g2mJWnqQ2yWpwt+RMWk=;
        b=LaWbffbNn5WEpuXhu8xYupju2PD7cLZVoFqMTxZeHBd5gTnaWH5/g4GoGg9g9W/tyA
         fDt+RpnNx4rVWl3WZmSUdZdhhjjsSyOIp0Mmh2LAOOkgsJ8tyz1wUn09jM4Acl33RDTW
         JITZhpFKEQvcckOUGF39bSSy9MyqJaALAMeoRv1nKjsTNs4W1zDlXLgGO+RhJ8uXx7Px
         bQJn+p1/xUVxopLDBXgahwrxWXrloFrlyIRet+UYMLmBdP2Z083xkrizQC4mqh62xFDX
         vh/8k5hiXTGk5cvcjDUl7RIiUKsM18OUTliFknRodWxDSzWdREr4AYqrMACwETN5+dED
         8E1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775556317; x=1776161117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+rEtjUTgCpW0G5KO0ExuXR9g2mJWnqQ2yWpwt+RMWk=;
        b=J7UxYIc5gX1ya0SqUsQDYFf6E6JGDvPN4yim8ZGbE8UwIOPO5vrEni/L8VQqOBQeyn
         dF6fYOTYjc0D6k6U5Uvwzw6oMY8YEFjbBBLh4itl6eM592iCn/zpS02Zt6TfTuilhmiY
         N38S6UwvcnNeKyRzlcT9ZJkGrWqsM3PV6PXOQvxM4Us777ZlQaC8DXxiAIqyu+GZHIDu
         na8v55h9EfsodBLvwCNWYkbS6Pkg+tKvGXizV69+Q+/oSXBavGvzBE82bA8jpBJ6EUJ2
         kHjftvBSYb0xd0NVviBIyqK+w0k1I4IEBxAFCbm05ZcCRiqpbOu3YsfHEyPHEXNuFLZt
         8EsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNoE4EA+XFBARuoiZM216KWnjgZsc4Ajv9qB7XtNK/4VTC/ra0Lxgt9XiPBLWORw59Togw139W/jrvcmVu@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp/ezoNJkOUikKYlPwXdp3jFquq2AP63VwIUrNJ7iZsuArZlFx
	PGQAFH25ZWRxD88fkZb3mMETrFWhPGFHUvlcCCUq1Dl5tLU7lrlZ56JKsWfQ2P04pybt8FE6Sqe
	kEmMsdzQaYS/jCLI/WD9w/XdTZisiqQqhWFfSI87s4Dm8r+I/JzWSrGKcVVRA62441q0I
X-Gm-Gg: AeBDieu+tJGGg2D/UrTGt9rPgWWBID8b+9tsYn8oqDMTPQ4wQwZpKl5OJHRs8GBiiGo
	1QjLxgI0ZsKkxulAAKi019nm6olx5Q29eCh7bbjOJDaGrEwaDHMvEasQ1jX6Abo6C/ik7mHtEv1
	a21ul4DgYUYysaL89BM2Pi6c73+GRAO996eowsAHgC3PVJjyJbP4zYQzk53beWZBOHlsU24k2Za
	fSrvJdoGaXAW1BVmHI+2msqgEJpvOKfdNHMqztuz2XCHzu5JUy/jlifGOw1Dk/s2HKCSlYUShN6
	KI3H7/CPg/Bb5zkKSSj+fdYHftZP3C5mUV3GdId2WrdYUiv+tRQTPC4a9/H/NIW4f9iw260CmFb
	1KsnonXlVCSFFYpqF3qbWT+JCEp3qh4pQHbEeEtF2JtkUs3ngg+dagF+fMH22U1jTi/XDpeyoWF
	wFTISR1WYmZ8kRnjVYNw==
X-Received: by 2002:a05:6a00:408d:b0:81c:8d47:33ff with SMTP id d2e1a72fcca58-82d0dbac374mr13870313b3a.47.1775556316538;
        Tue, 07 Apr 2026 03:05:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:408d:b0:81c:8d47:33ff with SMTP id d2e1a72fcca58-82d0dbac374mr13870273b3a.47.1775556316009;
        Tue, 07 Apr 2026 03:05:16 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b272bdsm17844323b3a.12.2026.04.07.03.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 03:05:15 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        linux-arm-msm@vger.kernel.org, ekansh.gupta@oss.qualcomm.com,
        quic_chennak@quicinc.com, Jianping Li <jianping.li@oss.qualcomm.com>
Subject: [PATCH v3 0/4] Add missing bug fixes
Date: Tue,  7 Apr 2026 18:05:04 +0800
Message-Id: <20260407100508.1027-1-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5MCBTYWx0ZWRfX8Dtp+qU6aHfs
 /OZqIyiIRtZHTTHiaiu47GRYWc7SI9W/b+sbuibugPk1Jd55DbAwINHq7bGq+JJ6G8nZuLasCY7
 UHnaDDs+huuRXlfIollaQMIhni4Pgj8ZZn9/wtnYTwz46DNI1Re4mj78yZW6cm+G0elrSZme41z
 LUpygadkai7Xz0hzxlLD+EGrVU0Hu2DlXmgEQvLzb9FkfcI0/ujrH6CXZcb/57HIt06r1ySpMjE
 zmIVSfPvQV7LknAKNy2gRbeoMZaQvK9AzR5m4/z3IT3qgCM1TeVts6fiDaGYverInl1SSbme74Q
 BhssZ9VCU3IM+0Y/afpJJ7POKhGooaBPn20/au/N7nd+OtN9UDoIUxLG+f0fLaap9YXEQtYuyNT
 oPgzYxChuingx/fh0YTyYAmjnptCIRAVJEYVs8hzHWnIuB0FIex6BVZP8BGur/JMedSFsRKyApK
 M4yCSs8fO5pM2yBVpsA==
X-Proofpoint-GUID: 4IVzMtVWVrtakgHNaFqWUNJ69BGgw31A
X-Proofpoint-ORIG-GUID: 4IVzMtVWVrtakgHNaFqWUNJ69BGgw31A
X-Authority-Analysis: v=2.4 cv=LquiDHdc c=1 sm=1 tr=0 ts=69d4d6dd cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=MqLIvlvHgYYYeGUPK_0A:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070090
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
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102100-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 16C813AC81E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add missing bug fixes in memory areas. This patch series carries
following fixes:
- Add multiple fixes for remote heap which is used by Audio PD.
- Add safety checks to fastrpc_buf_free
Patch [v2]: https://lore.kernel.org/all/20260115082851.570-1-jianping.li@oss.qualcomm.com/

Change in v3:
  - Adjusted the order of the series, placing NULL check changes that are not bug fixes at the end
  - Modified the commit message to describe the bug background in detail
  - Switch buf->list_lock back to fl->lock
  - Add locking to the operation of audio_init_mem

Ekansh Gupta (3):
  misc: fastrpc: Fix initial memory allocation for Audio PD memory pool
  misc: fastrpc: Remove buffer from list prior to unmap operation
  misc: fastrpc: Allow fastrpc_buf_free() to accept NULL

Jianping Li (1):
  misc: fastrpc: Allocate entire reserved memory for Audio PD in probe

 drivers/misc/fastrpc.c | 130 +++++++++++++++++++++--------------------
 1 file changed, 68 insertions(+), 62 deletions(-)

-- 
2.43.0


