Return-Path: <linux-arm-msm+bounces-94799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BmEGrZLpWmt8AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 09:35:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C31CC1D4AEA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 09:35:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58FFE3016510
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 08:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 298A01AF0BB;
	Mon,  2 Mar 2026 08:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SQw2e1df";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WqtygJ+k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E279430AD15
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 08:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772440499; cv=none; b=WyLjrEyAXWu7qDhJltcsVBDrQ4YLUyZ70vpUvetFEZo/M7zTLZnx2odHcJ1vWsaA/DMDSkOYmG1KyD59faAnb6aFws5BzVMZjaYCOuru3wOMcvoOQu9jbUXZ1RXLFzchZ9AvkbCV567vwkrTsJztV5kkjpQIdOolihHOsHcrbxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772440499; c=relaxed/simple;
	bh=vLLCR2EUmQ3EaNSh7hQMrC/J5ASP3TLh4U5cxhR1TEU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Htfy1ayNs4Z8GPlyS/l0zMjcWvm6OQUVEwrXzwcZq6wfBtvBGDC6FeQYqHoaM9lL5P1BHuWxyQgnLHIpsu9Q6ikDpv3jSRBabNpXR4/cHQT0Sq2F6Ay57j/acaNwqCD55zqp2IQYVRqJZle1yB6fLnYBCIP1hfXZq8yGCxA1qqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SQw2e1df; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WqtygJ+k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6226w57p2159953
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 08:34:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RSgCY2ibQ/SYdWdqT3A1t1
	bquvViGR7aFSVt4FcPst0=; b=SQw2e1dftPaIsZSl4zParHJLvfoQ7mQJ/RB1ow
	h6xyulwIoBwZTlrlDgNCF6XmTuLwUNtFZkbjpcyp+lOQSBBnjatZOtLT0v5rq2Zp
	wUghxdpP/twmhYupH114Gqe/Vy4obgwicZDp0rwAFL5PFRGdzVR/qpOJjB5QF9IH
	H2DUi+mBZfkQfXdAH16JNDpstB1J6/5AoD8R5rtqiz1sjeKiT/Qu56T+JxrMP8EK
	3d+x6XvvU2orJE7QhgkywErWGOj36NHTkyfx8RE94wm26+yP3RQXH1sM9t1+Uayl
	58ou6lxTojx0c0gVOldE30NJgiWPTrJKfKsp3rjuf5REBEHw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmgbath2w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 08:34:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70ef98116so3836801585a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 00:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772440496; x=1773045296; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RSgCY2ibQ/SYdWdqT3A1t1bquvViGR7aFSVt4FcPst0=;
        b=WqtygJ+kCLtarewmYpPVnu8C506edhilqwU1zE23fMat2mXLmS6KE759wH8UWIe7Mi
         nT0ucx3egK8Q11YYqWHoLQ8KI/rNTcqyv18UY8MOrigsk4k18aqFxEQp/Pb9PlMOIoL5
         evjmh7p+k/oZv6FVyWPGCUWjYHp+e5hMNdJgRx3nAwLuUcXkCA/qsfP/eEECJG23uWBM
         HJXmVsbw26VFDdiYsq3LoCulBZaKBGVIUrartQdIOlKG3h1+DfTJs24dRJBKKyLa1hfn
         Qfkt+ud40587CaYYYF/Z/zPY7QpNlffCdD8OxMqlfxMbDEjzjTmaBD/aahAkrn/nHGhI
         FW5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772440496; x=1773045296;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RSgCY2ibQ/SYdWdqT3A1t1bquvViGR7aFSVt4FcPst0=;
        b=vPM16N8/QLx5GbKWCvF5N3O6ASQcPWFmUvZnycoAI0il45SmRvqNhNfawwh4lXY38j
         QoWizCGz10j20+NXtZwPk6UKdAOAFNI8DWjqwxFLNrPvMtMqok5dl03bmnMMhBtTaFPv
         34p3NIyBHDJULNkCARcBTIsYAPiknuO8QyV1f3vs/IdFqGQ/BMxJ7APpO8WeWbWtaj66
         zwI3eU+J+po514f2XTteBPqq49Zoxw7zNn0G5uoPOzO+nGOgw7kXawMB7Y/uiH700EOD
         BL6fE4zzN+Ay1Pn8TxGG+VVhhY1o8j+lIZaRi/iIy076o95mXFgJCidsp67tvXR6CRxf
         L/YA==
X-Gm-Message-State: AOJu0Yy/ZWXAPVJnmcqbrp9BTLWaKypZJbmSpHMZ/Oh8+y058zb7a9fB
	JjRw9ir+wECnCKcnezQqCgz4jewDIFQvJvRokZoFMIqDBGfoy7aByuevI5xHG5TfzB/sX2pojQa
	3AzqIU/if9tz0ONDvvDQmmqMtFF/+lKSHQq6e/fnMj0tdt7nk+Lk2XaDe3uHRyNay1zD3
X-Gm-Gg: ATEYQzwDLlWbZf9NQlYU4hDWp83TE+4xJGF9B7Wjzef4/sWBuNJdvojnfBsIp2VAVK/
	RR7Et5ZVf3hLjsxYl7vUxOy5FztVtE5jIVRflJq/Ef4CkujizJF1UztGGplJ7Yc+r6DIfo8wEkN
	hM9jp1cYY9ed9qO5UOTuPXk94XmhkWohR69+Moj4CZxRFNg4CN4R86ujjUjgc+QHuPHJ3Q5Ogbp
	0AnaKSd8pAa/zehcrxLbEHncsTXNawVQbXxCv3q8nZI40jmuHwDFnl1GWra6+kipMxTTkKituxc
	Qbs3A3olIQzGt972ZYPn7o2XD/nq2B+erU/ph2KL+drP5BXSCzXAZZA72M8FzayBbF09T8dS8sc
	B7PRjOsVAQFBbUmTtXAesNlLZ5vCt+w==
X-Received: by 2002:a05:620a:3192:b0:8cb:3a1d:79f9 with SMTP id af79cd13be357-8cbc8d684dfmr1290230385a.6.1772440495965;
        Mon, 02 Mar 2026 00:34:55 -0800 (PST)
X-Received: by 2002:a05:620a:3192:b0:8cb:3a1d:79f9 with SMTP id af79cd13be357-8cbc8d684dfmr1290227785a.6.1772440495330;
        Mon, 02 Mar 2026 00:34:55 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb776dfsm228285425e9.1.2026.03.02.00.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 00:34:53 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Mar 2026 10:34:46 +0200
Subject: [PATCH v2] phy: qcom: m31-eusb2: Make USB repeater optional
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-phy-qcom-m31-eusb2-make-repeater-optional-v2-1-dbf714c72056@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKVLpWkC/52OQQ6DIBBFr2JYdwygVdNV79G4ADqttCIIaGqMd
 y/aG3QzyUv+/29WEtBrDOSSrcTjrIO2QwJ+yojqxPBE0PfEhFNeUc5rcN0Co7IGTMEApyA5GPF
 G8OhQRPRgXUwbooeKM9UopmhxLknacx4f+nO4bu2PwyRfqOIu2BOdDtH65XhmZnvuH+/MgAGtB
 W0qKYUU5dWGkI+T6FPd5OmQdtu2L1hQUFv7AAAA
X-Change-ID: 20260227-phy-qcom-m31-eusb2-make-repeater-optional-621c8c1c0354
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1996;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Dwso8k6zIb/2PduD2Fq0IzKjrdMHmiN2lXGM/UurV+Y=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBppUuo8fGETG3/NJENugPJUeArWRVflt3X5yH60
 tQJV0wQqGqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaaVLqAAKCRAbX0TJAJUV
 Vl3qEACssR5KcMRfhwNZJim3fNeNU2JpY/gQ0FOzhuVCW7TcZO3Vt+mvq2dkpCE9IUdqQ+73rvk
 Q6gwP8UkKZ6okdyW1FqkK+n6wNAXy7H+xB8ZvdA3m2lTIG8dexkRWB61ZnQ+xM2NbUGg1jfmIkz
 CSBJA+IDEvH6Vd34dZu9IW1KRAYmZE8qlDfOE4reCdnUkRbguLa0+WeUMQLpvOh01iDVNvbIC7L
 uvfhd+ru3cW4vTg6TO3TQqyaSJlrDJ7qDD8wK5jG59byO8BXj8Gw7Wt/Gq23LENUyPEDYtJMh6z
 X3svHrVGkw8iBpIOBItgBMVRyEf1tbKTY9QMT5a+imV7MseWN0Fr5gNtlLbuwuNdJ4VkEgHVtML
 zFA9hQmIBoZmWFQ4kZWIFm/WagN/O27hRlY/GUFKY9E6kkCGGC7DodTvXYJAXN5pu3cwJcjkYqg
 OOuUyDgiBk59up73NLqz9iTJ1zvs5bzvu1THM9QHr/BG+L8EnOw0/KFCUClUr74tKsxQZxBrC6+
 LCN3sKYOMGQnvhC6jX6/cWQP3FoQK1Nquexic4aAzjKGIlFk3+iEWovYWXiWzpivJqBjqNCvuHI
 G4plsrf9peFt3z7ZxjjK4znOEyTQxqK79q6JLGOC4BlNJq3awXVZviq/0qNwpKc4/W5vapBoDyi
 pLMP2oNLu+yAk0g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA3NSBTYWx0ZWRfX19YMuBFr2Tx9
 AdjchesRpCkXanTYEk4+osW7urjRENBMt52y5U2QfBXpKVT+D+foOjS0jSXjxteRB0IRlhjPp2t
 /7Sj9uNKeanjw/V65oaTVFh5+T1tSmwKaSj7wWx0KoaIo+tUW5/a6L/rIJprwuImH4oEjYroRad
 uu7vW/8Fr/BRpH5Pt6p+0ygv1PcOFhi6HnRynyKy3RT/pMA3xyJR1NgPi1mXvvEWj0hL9/gDfb9
 vtrQomDHuDIkUXqzyTsfeWPK6F3N2Liq6wFNIMt/hMbphxTzB4MPvG9LLT3FU8jo7sucmLC7Fii
 4M2v99rzbQeAKVxbp0nwo2NcZSEYuWVwSYyO/0bYFueTJyqJfBPwoq/ab/EVcJglemYxWr0qhgB
 dxORymPtH9THvobVYFdGHVXaASWiXcEuicNHzzIpmfCxuucxXkfO8VBPmGtFxWPblIO15nXn4o3
 A/h9Z2f+uwbXOC7tpxg==
X-Authority-Analysis: v=2.4 cv=QfVrf8bv c=1 sm=1 tr=0 ts=69a54bb0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=-yzJJKm8KVfH7sqCjyEA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: kjNeYwbv9R7etROusznvTUeMEvRVoJ-K
X-Proofpoint-GUID: kjNeYwbv9R7etROusznvTUeMEvRVoJ-K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020075
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94799-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C31CC1D4AEA
X-Rspamd-Action: no action

From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>

A repeater is not required for the PHY to function. On systems with
multiple PHY instances connected to a multi-port controller, some PHYs
may be unconnected. All PHYs must still probe successfully even without
attached repeaters, otherwise the controller probe fails.

So make it optional.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
[abel.vesa@oss.qualcomm.com: commit re-worded to reflect actual reason]
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
This has been sent initially by Wesley here:
https://lore.kernel.org/all/20250920032108.242643-10-wesley.cheng@oss.qualcomm.com/

This is still needed, but for a different reason, so re-worded the
commit message to reflect why.
---
Changes in v2:
- Picked up Bjorn's and Dmitry's R-b tags.
- Fixed the subject line, as Bjorn suggested.
- Link to v1: https://patch.msgid.link/20260227-phy-qcom-m31-eusb2-make-repeater-optional-v1-1-07a086bbaba4@oss.qualcomm.com
---
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
index 95cd3175926d..70a81ab2482f 100644
--- a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
@@ -285,7 +285,7 @@ static int m31eusb2_phy_probe(struct platform_device *pdev)
 
 	phy_set_drvdata(phy->phy, phy);
 
-	phy->repeater = devm_of_phy_get_by_index(dev, dev->of_node, 0);
+	phy->repeater = devm_phy_optional_get(dev, NULL);
 	if (IS_ERR(phy->repeater))
 		return dev_err_probe(dev, PTR_ERR(phy->repeater),
 				     "failed to get repeater\n");

---
base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
change-id: 20260227-phy-qcom-m31-eusb2-make-repeater-optional-621c8c1c0354

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


