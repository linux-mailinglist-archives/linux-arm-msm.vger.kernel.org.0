Return-Path: <linux-arm-msm+bounces-115220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id b9nqNTjGQmqUBQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 21:23:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB2F6DE44B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 21:23:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kabmzHR4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MGTChvx5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115220-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115220-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8AC2E3004C55
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 19:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DEEE35B631;
	Mon, 29 Jun 2026 19:23:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453FB2F2910
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 19:23:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782760982; cv=none; b=KK/9SVw9RfmQx0esFMiINAcujh8aMwi8Biu9SYtZ4BLCySmsTeKwzDdZnoUVM5YhPZleDX2wq63AdJXpOcck2jIVZ/IazFPwm/n4vSfQPI9EjXOVZdSdvlGF4djI10w6T18zu2/HlM3dvqBEt2aQQieL8JvSsV1GlA+wyLTYi58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782760982; c=relaxed/simple;
	bh=+PQamnoAoh8bSN/wucxyeWwCZ87gnEd+NZDKavs8wAE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GFU2U1JenXc47EMeSlU//42K3lwilDqjUIy6p8JNQpRXf4QEISPDf/h8/GBGbmY5cpYXp/XiEK2DKfyo+SEgfnOdBtELh1vb5xwriS20thkddluP3jZk0BpBuKMmvNRdnx8rXdrFHSIs/2aPVUG344BD5sQOv6BZ6XGAW867QQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kabmzHR4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MGTChvx5; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TITBDu3765117
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 19:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OijjlcajNSAACxDTq1b+qg
	0H74TStsOEsCUTaQJgG1c=; b=kabmzHR4ACxyzUmXM4GKj/ZBbfz8DVbsRx4Am7
	Od+wvds202UNbjLRC07PQa2aJUW5mJzthTNbbw3eYHwnHnWJld+yc5RU7zNuK0MQ
	AlhgY0+A2g61sRkV5eDziKj60xQc+L5jhbQUnEu/mjQ+ztayC6gQ51rTiDaRQd/2
	TCdsgG+/92RO++594gud6zsj6sa3GDG5mlKl8aPdWFwIgVZESyjnHugyCnPdKpK4
	AY49Ctce0N+SBv+w/Edd//ZR20dLQdFuiMSZO5v8UO2ixh768Jol59bc9W0jXVyT
	4DfIkCC6Pugz07OXB3v/AOMQqVkspBwk4P5xujFr+sM/VTmA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3x1cr715-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 19:23:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e4f27f49bso216047485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782760979; x=1783365779; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OijjlcajNSAACxDTq1b+qg0H74TStsOEsCUTaQJgG1c=;
        b=MGTChvx5EpW5hvSBo9o5G1ze2fAm1H/FkBtYFHKgIxnOo0hvLCmLSzVu7s1S16you6
         EmJsQHdVqduq6PVTEl+ND9qfS+AUnR0QUz188XMwDHKfWEiZB6SygjJ4dRMivHcWh359
         6f4SfwVV5d+j1EanpLUpc4tfyH19+FAtAXQLVeUgc5g+rbIbajFSqwnUwIXVaQMwkDsY
         P/b+oAxO1sShOrhpxUvmM6wuu29I1pcRS9Lkmwd7PJt1ou7zzl9Q72ke6Ht3x70swBl8
         XjPlRskrp04aw0FtinWo0ZyriD2QKs4iN5WH3KxgD/s5fBt8uMMhGGOK1H/kcjJRVJU+
         7ZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782760979; x=1783365779;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OijjlcajNSAACxDTq1b+qg0H74TStsOEsCUTaQJgG1c=;
        b=h7qaPYDcA9hITXgrxgYDXoCVzlIIfSncBz0ZbdUoFbP7as6rFczKdKPuD53nYzFIJW
         Deq7ZvrCsyX5HbCmBNYSptZxE/2UinHB1axlNpyoeGbr7NJBUkDdRpimjCK1E4Cd9w3u
         b5Ju2k5jbJ8bAH7mCQDHXUnKKlvCaVdDl8pDbzpO/gqnhVS0V5o5SDqixRAF5AoNLO+b
         5d+sXZrjq2bTS0NSHcb+El78eY1wsxUt6STTeiQ8qsqZvwTOke78Yn+1Ta4AX7BTGMQG
         gLMWpUkONKcf57DP8BH5GeZszQv7wsecJCxkGAv/BKf5yAGNFfexPPQHI8mOKcMq9+bG
         TpqA==
X-Gm-Message-State: AOJu0YxMyZqiOyb31XqZZ/I8suqHUou0M5FPmNCIbOulB2gbhcbF/7V+
	/5qv8lUPQfoNVQr7IKBYlx6KbEm7QdnbE3SDoFxy2iMN61PVAvfcJc7bOhfKkPhLLGrAZ6PjZk/
	TmBE+PmS0dO4D0V+fnxplB4UtNFkK3jL8/frkpjLWIoYhRy0Ah5wiP7MNeno0vNYOIOrO
X-Gm-Gg: AfdE7cloz44xoWVMsrIkw0PoQf1BbzdQHWnunCHMUk+RzpoQNbj7s/U2tHnCXJwH4pV
	t9BDJBBQUMa52T59RetExof4svSO9Hz6HdZzDR/Qpi1noOsNfec1luLVec7KPNyDjTc+3GmDSDK
	abvc2fS/n8iWH9PzHB10l5mLdJDjjIefPHvV+hu0r/TCNawaP/jTDVWW9QWa0u05y7mh3mYwFwC
	DMP4ecaL0HMUrmO8otvR+SL9XzAsJoZJVCNbCRF1BUlovVhsaR+EZ8a7XbNfT51sMJX1k7f8+Nc
	1AkKDGNJyTaNDsf+QqbpVSRWIv/uwg9n7XFmxowjzDYzLA3Y7gC0ew7dxQ0NIl+2e6SYiMEIZAO
	SHqTlt/WMi8Vb0DgFrIWyK5TDhAMPqX0QrmzWe+5epav6d0XkECah8S/xG5XWxtGajrBaxOhX/u
	+tFKGKvrqQ8g9QlEOF9RAAEh7VAmOwW1guVLUVm+VFFttK4UOe2vJQ3u1V1x1eZ2hLfcnlfCQPK
	pMw2TA26nd0LYwLwdgH
X-Received: by 2002:a05:620a:294e:b0:927:a87b:7abc with SMTP id af79cd13be357-92e6286678cmr138545785a.50.1782760979484;
        Mon, 29 Jun 2026 12:22:59 -0700 (PDT)
X-Received: by 2002:a05:620a:294e:b0:927:a87b:7abc with SMTP id af79cd13be357-92e6286678cmr138539685a.50.1782760978865;
        Mon, 29 Jun 2026 12:22:58 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-475674af239sm308506f8f.30.2026.06.29.12.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 12:22:58 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: gcc-qcs8300: Fix suspend/resume issues for
 USB and PCIe
Date: Mon, 29 Jun 2026 21:22:54 +0200
Message-Id: <20260629-monza-suspend-v1-0-b601d8a2f2f8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA7GQmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMyNL3dz8vKpE3eLS4oLUvBTdNItkQ4vERPM0YzMTJaCegqLUtMwKsHn
 RsbW1AC9QUXxfAAAA
X-Change-ID: 20260629-monza-suspend-f8c18aa7f364
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDE2MyBTYWx0ZWRfXyQvA78alLIc1
 kzEDp5cJZhou2R98gG8f/Z2Efw2hSvJFVQ1ZGWwamrLdvAR/XBTy4nN2XCZdlYJa5fJr2I48PRI
 i4bbNgH1mdQGSjMA2zQIjKQCrJnJ5zorcDmBR9vMuh4ltUpgzdBMr9EDUSa5sfxceKSfld6HX96
 Whz3SQtXr04dWSH57cd99evLAiQ+HXBJCJKQB5veZGXC3JPhpObNR5miLoHQuq9GJI9aeXM8R28
 4wf7YMX2YUhqWfdPy0WMWak5mdjKFR5mMn2sybgEAeC6Au+EkafJs5uSKCW+6lbZZDx/ct83lTe
 L5UzyWj+BGWBaozo8HbtU0E3WzXb1tOMWQIbNIGBqjNHEpLY8MBbW4rUYp3kKM8V6Tj2Ph7sRgc
 ydD7LWCNHEnByvlqS3ZsX0uokVkfySgX5nHF7J/UKMdx5oE8UoUqiCUMtWWngkXg+inY1Z2dmwv
 bPGZX4i7b4r2rgcswQQ==
X-Proofpoint-ORIG-GUID: -WgbkA8XXuGbN3cgIDFVeKcKll0PEYyv
X-Proofpoint-GUID: -WgbkA8XXuGbN3cgIDFVeKcKll0PEYyv
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a42c614 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=5AUkEm3hKR9bwltPNGsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDE2MyBTYWx0ZWRfX+XTPyrkhpOFd
 r7/lou5r19dwEQ2k2UhDFd8i7l9lxaGUTE6mlZR/MRqa08LXO65DJzrMCzV8Nk+7TLiBUAt6npt
 ca5ATzMPXjdzpm+ulLeycjZvQrdk4H8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290163
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115220-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:quic_imrashai@quicinc.com,m:quic_tdas@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3FB2F6DE44B

Neither the USB nor PCIe host controller drivers currently handle
state loss across suspend on this platform. To address this, switch the
corresponding GDSCs to retention mode (PWRSTS_RET_ON), matching the
behavior already used on similar Qualcomm SoCs.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Loic Poulain (2):
      clk: qcom: gcc-qcs8300: Use retention for PCIe power domains
      clk: qcom: gcc-qcs8300: Use retention for USB power domains

 drivers/clk/qcom/gcc-qcs8300.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260629-monza-suspend-f8c18aa7f364

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


