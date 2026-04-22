Return-Path: <linux-arm-msm+bounces-104016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJuCMXJk6GnXJwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 08:02:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EAA4423C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 08:02:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33BAE301B71D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 06:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E02AB2DB7B9;
	Wed, 22 Apr 2026 06:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cf1Olo02";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TRTjXQUW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8EA2773FF
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 06:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776837734; cv=none; b=qkD5SYqhXJ213obhNjr5EHtMRAu0rEZx+nedZqcZuFmi0+WMlMKg8bLYft7DqQsEHnuyx+yo9/bkv+OwDtlbj8atxp1fAkKWwG0Ns7SaHYN+8BmgpB4xkpZLDZJcCCyU0+eAiuQbNvnjgOFnGe8tQjqS2Gb18zDzhYe2W40sFJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776837734; c=relaxed/simple;
	bh=aFSvRHF5TyWCpuwZ48kSZW9StI15Mat3A1Go9duK9TU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kODVcIAxiBZxVLyguBi2qRmaQEq5Fs8NFCR9iu7d2VQy8tdxXMo8I5ZeHfBWVjM+7BYMjKQb++HlZSarTabcPyasxI8u90UtKe1F6pqVXBddd+p79O/J3YVrLWXFg4AknDqmY6ua+e2bOMUUkYXIUbm/PVku01JlBpR2iL6zl2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cf1Olo02; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TRTjXQUW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M5Phrp976184
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 06:02:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GDn9/QN5j3kDRhyol4ojzl
	wNnIM0CIsP7N6m3h6CsA4=; b=cf1Olo02ApM9jNheKk0PZBB/HWXybNOKYUtZTh
	CqnG0bJ/tC0/EA97S36a7AVunn1bo9vYirXTWDLMldmkwMbU74w2UFE6hPkk54Xr
	Hn32MkGo+YgUDcGjJHofRFNrsZJe3+hYdVQNRW7ijCHWlhrgb4MAHP3kVRE1qZ/3
	kEP0APDx1D8powJLgA+A2USKyiY4QKgGNBjdcWDVYK6DOX8hIXFgcgerw/rS19lb
	zfMqDwFxpmiS+ag04st4ItS/Zu82ezkpmr6n4PownNWI75zjRMBLcjdTi0sL1nSj
	NgYB+5N5t4DtaprGsGOphfk4rx8/3lRSDMlNtp7MJ+9vsVeQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpene9w7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 06:02:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8d5b5d607d1so977101585a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 23:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776837731; x=1777442531; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GDn9/QN5j3kDRhyol4ojzlwNnIM0CIsP7N6m3h6CsA4=;
        b=TRTjXQUWerQLiZYytaU2JYm35aDBy6t2Gy6a8NOxPIefq3j/26rSlhyo5SEIsdkFhD
         btHJwmdQcDvZdjxzkbjeDLMa2WJT5dm437yoZGRlbIK+YBVfbKsYQSYakRgH5arWyrFf
         G54GCF+S97XaiHFfJ0NHN3n5G1AIfCV1Pmi/sBN8c1aFkoYZLDODTPWSSlkwxoOfi6EX
         hJ6MBatH4NiNvSetes5vNjqauJ9pvcY5x39wCyS80dkCyXQZYHhZAack6Ur65d5o4w94
         5/NCTjKysrCK8RnuU4R33reW1oTXBillZ36yjxLrBRelDwBEq+IzYqYiGoB2lhV5zm05
         14Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776837731; x=1777442531;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDn9/QN5j3kDRhyol4ojzlwNnIM0CIsP7N6m3h6CsA4=;
        b=WeoP5EJnaXLnGrAPbk4H+qKsFZBxilim8QBaB+PmDBzhHBtxxNL0LBEj20BfWDd75o
         3A0AbHq7WfAsptNGUwD/w6RHh4cg+6gs/v1oPdbW7rKZCyftZyHwgQ7H2A3EPW/UsJA1
         F6kWwjU3LATKm3SueU8Qi/oduDcxk1eHu6v3+1TGihtOLQsH93jzh0TeBYeMW0xhFzd2
         obHyaspTX1zUXBOAcZcMUkLjir8nC6nSf1kZJ/ybmMh3ggLfwqEQ9KrDbBzbTIKEqHFJ
         2F777ePpa+C9ZF0KxR54HMno5wXTl8kKEotDUOu4PODOod2jef/TWcO2gWCrcrl/C9Jl
         C4tA==
X-Gm-Message-State: AOJu0YxBl5x9C02WdMtocepTjnB1dQCIwpCXTiIdPrzkDyoEBVrIoPVf
	Y+mJ81s/wTEljLqW+hNr5K+Gt3tmF/yEYhkiKsWCKCDViRXjoHe1kkfMCk9Vw7k4HScIg/X6s4F
	9H10rp/rEW8sqybLRLl+qHFrA5uzMvA+PK4Dp3XoZdskdtom9UZuoz/3SLCDjRRAa1DFr
X-Gm-Gg: AeBDiev/KHfqKwEgaBinqZ3GlomQilKrMbrWeQ+3IxKur1QWrCNjh/mcJotDlQ0Afqd
	UAI+Aju+2SQfWIXCF9YAhA7b86AhKPeMPRrfnCP7Tbc/+w2GP7dbi2usQWakOcHnJI8Avb5JnSL
	z026ONMREZIlS/x0TAdUV4wKsDaesLn/pnzviaT3pyVqDaIUEruJGnH2+WyoUbQ8POg4qjDGu6H
	+YeIaVNBaiEhhwBjB9Hk2eLzw+oQ316oMROsqDRsdO7impW5dtpwpk37qlJ69rxrGnwSoYhJAjW
	aBHAf7gknrfmtFay1ZT/kByjuQIXin79ej1+aRv69y9+gN1ANzejnApTbB0sh1ZI+RGGl4pmDlD
	AOw6TLtQWduJlQxC0mZJYhYFyWTEII0HDCVj5K+BmiaBGmSAlfvkpghJf1A7PqSfIwRCQKYD2nA
	mVcQllD4zhaq6SYIQvMQ==
X-Received: by 2002:a05:620a:284a:b0:8cd:b317:b464 with SMTP id af79cd13be357-8e792b596b8mr3051064385a.61.1776837730911;
        Tue, 21 Apr 2026 23:02:10 -0700 (PDT)
X-Received: by 2002:a05:620a:284a:b0:8cd:b317:b464 with SMTP id af79cd13be357-8e792b596b8mr3051059985a.61.1776837730333;
        Tue, 21 Apr 2026 23:02:10 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ef12122800sm237379985a.18.2026.04.21.23.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 23:02:09 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: [PATCH v4 0/5] phy: qcom: edp: Add DP/eDP switch for phys
Date: Wed, 22 Apr 2026 14:01:50 +0800
Message-Id: <20260422-edp_phy-v4-0-c38bef2d027b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE5k6GkC/22Oz27CMAyHX6XKeUFOXIjLifdA05Q/zhpp0JKUa
 gj13RfKgQPzwdLP8vfZd1E4Jy5i39xF5jmVNJxraD8a4Xt7/maZQs1Cg96Bhq3kMH6N/U0q9hY
 5gGk9iLo9Zo7pdzUdP5858+VahdNzKJwtLP1wOqVp3zjmHVsE35IhYkXYEkIXqVMcyEYXjQFtv
 Xi4+lSmId/WJ2e1yt7+mZUEqVERaeciRnUYStlcrvbncXJT26qa8YUj6BeOFfeWagXToYN/8GV
 Z/gD1kGrCMAEAAA==
X-Change-ID: 20260205-edp_phy-1eca3ed074c0
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>, stable@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776837726; l=1988;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=aFSvRHF5TyWCpuwZ48kSZW9StI15Mat3A1Go9duK9TU=;
 b=MSd8D1kAFZdRDD5N9Rl1pwyDYZX9J8ByeFUAmw89nBvWXN3I6O1ASr3+aPNgxY9IXcztW08yL
 tTsfP8thnR8DASNNZXSBNQwgXfp8fHMNpdfpEu1NKpkYo2BLcxNb30/
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA1NiBTYWx0ZWRfX9m1C0N0FUIK/
 bMq2lJQNGmql1ssXnguwXrunFSBvQGn1C+TdlGdrAC372/WBZkItiFKmiXvUGtZThHfj9Aj1eqE
 FvCaXzGGsw/p9vC3JGFUfHN1+Jm2rK0Qys+i334DRZOtt/sYyKq78tfMGDkYOxlPR+nbdJFV0Fc
 CBy7R0urHzllKGF2RNh9Z6bKgU9ItTIxLAyQlRqw8xG4k/L6iixUdmN0FZvRQeP2RXhKX57kC1W
 iqduM/zqt1oQPA/0a+/XNRQ/1PTZ/6Rg/f6JNdVjKzjYgxK9wwfNKy79F6OZbFSEK8cB8C+0X/W
 gqM50t/5VrVb9KpylK4VGcvpkdHvNr1sPTlKIYoWgeOHD9T6haA5CNjq70guislgomKxDwlYrkD
 SQW3dtnvb3SqixLIfCtLlHvz9uLAU98YOhATmscADA8tx9bxWm6klaE4LD+kqIUOpTdVjpSi5lO
 3yqM26NsgRxFRAkPnuA==
X-Proofpoint-GUID: KsTuyQMcq-KwDJfwHsrg-Q28anl5uBI4
X-Proofpoint-ORIG-GUID: KsTuyQMcq-KwDJfwHsrg-Q28anl5uBI4
X-Authority-Analysis: v=2.4 cv=RoT16imK c=1 sm=1 tr=0 ts=69e86463 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=M-2OMZX0rM6BGFiE4MwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220056
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104016-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 68EAA4423C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently the PHY selects the DP/eDP configuration tables in a fixed way,
choosing the table when enable. This driver has known issues:
1. The selected table does not match the actual platform mode.
2. It cannot support both modes at the same time.

As discussed here[1], this series:
1. Cleans up duplicated and incorrect tables based on the HPG.
2. Fixes the LDO programming error in eDP mode.
3. Adds DP/eDP mode switching support.

Note: x1e80100/sa8775p/sc7280/SC8280XP have been tested, while
glymur/sc8180x have not been tested.

[1] https://lore.kernel.org/all/20260119-klm_dpphy-v2-1-52252190940b@oss.qualcomm.com/

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
Changes in v4:
- Splite changes.[Dmitry]
- Add sc8180x tables in a single chagne.[Dmitry][Konrad]
- Link to v3: https://lore.kernel.org/r/20260302-edp_phy-v3-0-ca8888d793b0@oss.qualcomm.com

Changes in v3:
- Rebase to next-20260224.[Dmitry]
- Only enable TX1 LDO when lane counts > 2.[Konrad]
- Link to v2: https://lore.kernel.org/all/20260213-edp_phy-v2-0-43c40976435e@oss.qualcomm.com/

Changes in v2:
- Combine the third patch with the first one.[Dmitry]
- Fix code formatting issues.[Konrad][Dmitry]
- Update the commit message description.[Dmitry][Konrad]
- Fix kodiak swing/pre_emp table values.[Konrad]

---
Yongxing Mou (5):
      phy: qcom: edp: Unify generic DP/eDP swing and pre-emphasis tables
      phy: qcom: edp: Add eDP/DP mode switch support
      phy: qcom: edp: Add SC7280/SC8180X swing/pre-emphasis tables
      phy: qcom: edp: Fix AUX_CFG8 programming for DP mode
      phy: qcom: edp: Add PHY-specific LDO config for eDP low vdiff

 drivers/phy/qualcomm/phy-qcom-edp.c | 221 ++++++++++++++++++++++++++++--------
 1 file changed, 173 insertions(+), 48 deletions(-)
---
base-commit: bee6ea30c48788e18348309f891ed8afbf7702ac
change-id: 20260205-edp_phy-1eca3ed074c0

Best regards,
-- 
Yongxing Mou <yongxing.mou@oss.qualcomm.com>


