Return-Path: <linux-arm-msm+bounces-114364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JFErLwXvO2psfggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 16:51:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 692376BF501
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 16:51:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Bk4ok15U;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MZX43UpH;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114364-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114364-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2121430219A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 14:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 988273CDBAB;
	Wed, 24 Jun 2026 14:51:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1A72F9D98
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 14:51:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782312676; cv=none; b=uWsnh1KsflS1phpkLo2z+IBPdcaNV7XuojSzFaZLE+moAfqGQJW6UxyXvogXB3nPxgEMmAopSd//oawb+6QKV6ucBoIb/EDcNtbNe8VEe/fMWhMl2lPam1roXLimoJYuyDBsI568+li+iZVWGsuDtPi+hjRMcudXa7BJpQqb/MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782312676; c=relaxed/simple;
	bh=Z8QjadXgIGtPgACTtDMUk5aa0NamCujq+Tig0aGsLdk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DqmjsSHJov9FsWTB4/mDsB357+vN2sOfTr4iUHm6OhNj8bpVUfje/bYZf7UORR3iEGdZ5XKKuJ0WDWirlPZ2LIMxOCzGJtI/lc/FJ8il59Fq/b4MhGXYuEKkIE1O0aJEruxldqx7IznvXmFvU1BJwof0/GPNjtgMdRfHfgViO9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bk4ok15U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MZX43UpH; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OEg0Lr3078763
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 14:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QdRom3OlZUqLYrHE52lKlo
	KF1BLACd/ghD9VVvw0yJw=; b=Bk4ok15UkoJD9ZtBz0DcsxzFesht5vH6CauZTu
	zF/6yalTIzKOTnoKTImDoG510/zbUPHy3Fss9T6EQELhASJ+K8jc6Z9bp4q3Wa58
	AnAUZ6V/5BcTENHHqcJCmLu785Dv0M9oqDV6KlJ41IrIzGaK0ZmUwTBvjHwWenHL
	w69KLyAfHXe1tE68B8KxGaIxRdI+GX8b8chDB2yQRm/HL6dPDoe8KB7KrsDU7wMF
	mScFDeSOzGGV9hgdsfCWJDCwGqzAFOKofiHr8/Hibwcz7LooHhv3VxXSVHnmeiVw
	FvcxcJvTUphMgQF1aJEECJ4O2RIrXbOPfadAi5N+zDPmcPdw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05bfarmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 14:51:12 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-845319bb97bso989335b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 07:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782312672; x=1782917472; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QdRom3OlZUqLYrHE52lKloKF1BLACd/ghD9VVvw0yJw=;
        b=MZX43UpHLjytAB5Bqr/fb+BpOvsEjLojUig4D2WfVUbqefYttJtETlVran9ERjpHkx
         DzYgcT9zMm9UDx3uM3SR80hqx05Qk2nfzO+6gozut1utms2Pfy5n2Z/9LjCOSE32lcyL
         hWdx5Hn8jbDo4pCaQAblE5WITvzomxeeqab+xfYwJXB0np+d9nRdlLD0W5WzMFALAmKy
         F0BlkI2Z0p7gXkk5t5rZwwtTv4diPRIe+zfVyQjqNBUZ7vVoPNB575rxjeLYj3aoLAVt
         0iRpjqV504+PGG2pvRb2DbLe22m921Tl7gs26YItvRg+BCE3Yzzl1z15GmIid18Fg5KU
         49DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782312672; x=1782917472;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QdRom3OlZUqLYrHE52lKloKF1BLACd/ghD9VVvw0yJw=;
        b=rEBHkkdbJ1GJ0bHABZULTEXUjBIZmCDQl6m/nUCE157YeAkwuWBx9ydkEh3++TEif6
         ro2WhPQZvHFMxs4eBBzpQ2DR+HoFxeig7JslqNtf4ZIFgLtHk+UBZxySCbmXGKoMnlRn
         bDdQ8bM3/Qm44wUPUi4aNELMyZyN874rylk5ccVNME13oyqmhzMG06WI7ESUJf80hdug
         BcZ4fTZ4gz8ZU+uxDEurtfQVa1faki1XmM/p9BRnwRuf3CYF6BFEsHJuC7Hs3C3fRoad
         drtWK+4HbOUU84MqJPdTOnncmSXKSCI/SSC0a/uyAEbZPl4Y2HK6jITrG1xoKy+wmBjO
         Ew3w==
X-Gm-Message-State: AOJu0YwXPkxesaYUhRVAR3/E6dMGsSR1oOM53b4hLQyFrjjDCa+Gu/8K
	5jZ3zwJV9xWCpYiaAAVNGRAg6I6V8kImDKoNv3iiCJorBscX4O6tr/uYOkRSRj13jyyfbTYVdDB
	939uFFSxHe9V7pWJpdV3l6Av1UBqSpNuP9oK+2MQhrq1S2nsMBeGjhTHIRop54xrQeGTl
X-Gm-Gg: AfdE7cmv065mBn/I+REmJzr7n8ig1sRXGJtOB1+j16SdbV6K1A0+5yDIeoyeVONc+ix
	A4/3Nxt9C/mTPeyk/HqK5v0gaeHNrgjqIEpHA8En8GmvHaarDzFterxHiSQVB6MdkIJjUwr4+KA
	eZGwyMeaLZ5OeoPObEhV12aOfDXYycP64y8YnFgdbV7FWoCjl9OnbOsEy6dcyVtjN4MfHZmUkbB
	6voTGzhyda/o6peXzMhhdF6NWSEkufEyjNI8acdL+186ulDmzsbcSSOmM0wCFgF49I47XBpQSsu
	FhJL0Jlp/oGGNpPID6BOedhhp6sssbmVLPOou391/atp9OoMy7YBi0ffVzKvK556h/kjcCiPeD+
	CEA8S5WFZ/Bn4wvx3fmwHif22VOlEgur560tUzWnQpQ==
X-Received: by 2002:a05:6a00:4210:b0:845:44c7:2fdd with SMTP id d2e1a72fcca58-845a2c7d835mr3912292b3a.34.1782312672285;
        Wed, 24 Jun 2026 07:51:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:4210:b0:845:44c7:2fdd with SMTP id d2e1a72fcca58-845a2c7d835mr3912264b3a.34.1782312671733;
        Wed, 24 Jun 2026 07:51:11 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3fcc839sm2643271b3a.10.2026.06.24.07.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 07:51:11 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH v5 0/3] Add camera clock controller support on Glymur
 platform
Date: Wed, 24 Jun 2026 20:20:28 +0530
Message-Id: <20260624-glymur_camcc-v5-0-a321df74b1a1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALXuO2oC/3XQwYoCMQwG4FeRnreSpjNT68n3kGWpTaoFx9F2L
 Ssy727Vw7rDegn8gXwkuYrMKXIWy9lVJC4xx+FQQ/sxE37nDluWkWoWCNhBq4zc7i/9OX1513s
 vGTWQ2lDQpEUdOSYO8efBrT9r3sX8PaTLQy/q3n1CDeBfqCgJkhfkoHWoyJnVkPP8dHZ7P/T9v
 BZx9wq+GGgnBlYDvA6krDGLzr4x9K/RqukeuhrOKNsFZjTmndG8GpOnlKYalgCcD4E24b9bxnG
 8ASboMlB7AQAA
X-Change-ID: 20260517-glymur_camcc-e230d1bdf3d3
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=X8Bi7mTe c=1 sm=1 tr=0 ts=6a3beee0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NfzWakH2hsC1MMCkln4A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: nk0fRn7Oy9yTAu5XlV0IiauGtMsMrU66
X-Proofpoint-ORIG-GUID: nk0fRn7Oy9yTAu5XlV0IiauGtMsMrU66
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDEyNCBTYWx0ZWRfXy6oxeVjx3ah+
 pD1jcLiEAfM1/Oc5tIiOj6JGaXPdcd9tkTf0V0eZ2gq+O5VJDl3eQRwh7+159hktA8Vnoc+yDNi
 I5TLZpTcF+zDBXfPqwlAL63Ibvs6cQ8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDEyNCBTYWx0ZWRfX4e2M3wf4Dv1T
 2awXUyYDPVm1rc+mFlo4gwJnkrm4E0fzuRy2otzmqjorkI+aMVFPIKgSoPlRvVDm+kP/aOjJAvo
 mdTFpjAoQQfgkaRvWbY2i9wSDi9YeBXFC5DKGQURUBcg9sfSQOapolPjuwOnQHbhiN3Jzx/ITQq
 to8mSZ3yhYI5AsOa8eFF1A+PZQJ4BtjLBA7249+xqu2jT6A5sWoHDyCh+V9pfzepvtPfC3j/08s
 c34atZ7gP+/yRvf5dkG9+NMBFYmgYzRKPlQwJI5w7D0MBR+LfSMLL62FNPT9XuSWbYvDdjdYN26
 TNha0vjecwxS8rjnQ/tRP9nEjfskesUJMJtKomf7vS6jnKrbQc++8zZWot9tuuzUMR643yW2qFG
 sY/UI07x47MQ6tnpHgkMv2Jz1lWP8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240124
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114364-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jagadeesh.kona@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:taniya.das@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 692376BF501

Add support for camera clock controller on Glymur platform
for camera clients to be able to request for camcc clocks.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Changes in v5:
- Rebased on top of latest linux-next
- Added R-By tags received in v4
- Kept PLL configuration settings as is, since defining these fields isn't
  really meaningful to end user & they vary significantly across PLL types.
  Link to discussion: https://lore.kernel.org/all/23e910f0-f996-49b4-9ba8-5acc3bef2172@oss.qualcomm.com/
- Link to v4: https://lore.kernel.org/r/20260517-glymur_camcc-v4-0-9d00acffdbf7@oss.qualcomm.com

Changes in v4:
- Fixed parent src in ftbl_cam_cc_xo_clk_src to align with it's parent map
  [Reported by sashiko-bot:
   https://lore.kernel.org/all/20260513215441.E17B8C19425@smtp.kernel.org/#t]
- Added R-By tags received in v3
- Link to v3: https://lore.kernel.org/r/20260512-glymur_camcc-v3-0-a7196fee2779@oss.qualcomm.com

Changes in v3:
- Dropped separate defconfig change[PATCH4] and included it in Kconfig
  itself [Krzysztof]
- Included glymur camcc header file in the DT patch
- Added R-By tags received on v2
- Link to v2: https://lore.kernel.org/r/20260429-glymur_camcc-v2-0-0c3fd1977869@oss.qualcomm.com

Changes in v2:
- Updated DT node reg property to use hex for 0 also [Krzysztof]
- Added R-By tags received on v1
- Link to v1: https://lore.kernel.org/r/20260402-glymur_camcc-v1-0-e8da05a21da7@oss.qualcomm.com

---
Jagadeesh Kona (3):
      dt-bindings: clock: qcom: Add Glymur camera clock controller
      clk: qcom: camcc-glymur: Add camera clock controller driver
      arm64: dts: qcom: glymur: Add camera clock controller support

 .../bindings/clock/qcom,x1e80100-camcc.yaml        |    3 +
 arch/arm64/boot/dts/qcom/glymur.dtsi               |   17 +
 drivers/clk/qcom/Kconfig                           |   11 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/camcc-glymur.c                    | 2280 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,glymur-camcc.h      |  122 ++
 6 files changed, 2434 insertions(+)
---
base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
change-id: 20260517-glymur_camcc-e230d1bdf3d3

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>


