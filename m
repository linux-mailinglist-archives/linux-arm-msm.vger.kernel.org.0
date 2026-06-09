Return-Path: <linux-arm-msm+bounces-112083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6+O9GF/dJ2p53gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:31:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F85F65E59F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:31:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JAFsIbg+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WLUgKjvw;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112083-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112083-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E21CB30758DB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 09:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 213DC3911D6;
	Tue,  9 Jun 2026 09:17:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751A63ED3A3
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 09:17:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780996658; cv=none; b=B+lf0C4YrMMLcTsQDJdsPyQUv9DiTvzw2tS1PujVKUykv5rl2obBuMVZEyzroPojw1slGdYxTh9JcRD3YeLHR2sb7nVHkDpKkWL2xJOi7QLaFflrJ7khel3PNaEFo7mVmz0JOXyJGitOp4tvpv/dFvPk7YqypQkzwS6uxf8lDng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780996658; c=relaxed/simple;
	bh=330Zn5ca1hs2v3E8g2cbztx9xr7ZelihicIvV93DrL8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=txFB3M1LLCcbzeBzATVp9lHHSGFg4+9wqbnmcO0i9qekejDXUJLB3wG41A1jIYUQ5PNbYLhI6jOfs1j2GsTmLi+UheZN4v/Rxccle6UqUboQQshjnKcP7CcNQ2LdwZUvhUgoP6qP4P5MgZrxVKd8Tqn6TFpyet7aCgWtKdy6Izc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JAFsIbg+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WLUgKjvw; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rfTS1568412
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 09:17:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CFzxUUzHhYIgdrM9Cp7Q1mlQeQKF/qEFJ+1fHe7CqxE=; b=JAFsIbg+nSsu65G1
	dRHUDnhX9MA5E+GrEMN1cZoxZ4MkCeH0DmMN8Rog/TnVLKAUWc+ZmP+bntEqrZxp
	YUmEY8qwyOoWgFUxfZSEOxs5miMSEvV3rjCo6mhUvvqcg6GasB40LYOKr509H7re
	AqOfKL9IRYLAWrHQp812E1n8ayxgZ/z7buGye+6AsxEoqdaGJBOfQHI7hU1pZUbn
	c2KFLkYjKUu3Ju1RJSTJGTRj4ewc6l8cgrCCF/GfjGfwy1J/jOl/9FRC4T6hd9nt
	tHYOdqwHb65+YfmD84LMO8rdxemx4/bm3DtWGpLwR/k7J6VqRpgT8WEaj8XjmfmK
	c8QFjg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enxx46g8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:17:35 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c859d79c10eso5544837a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 02:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780996655; x=1781601455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CFzxUUzHhYIgdrM9Cp7Q1mlQeQKF/qEFJ+1fHe7CqxE=;
        b=WLUgKjvw+5YNvyXgvteUGLzKARQ5FRkx9jdR6WHq+7Q7vV9uvg/XYeRtKQN1kCMQIF
         KN8QAV3uZRUCD4zNY2RCVgvSPUOBwQce5Exl7YCkq6pozkllLJXw3Up2WpH1Nse7+Lbg
         Dh4k4RykrFD2mDGi7s/1R3bFUrJGkSTYBnrXNvwH9zVSBB0Rs0pDApDlbx1JafK3shzJ
         QfsY7zuAH4PwMu0AkWrlsPOYFgpd/OMPOhWSn/qWhRzPTdbTH+zVPeyN4KLsAeMU3d6B
         mgztqJW49O+sXuoqdakqVKdlPFvSybY8ozUdGWDUglL3p6sqIPqzw/6w0KuHiXQomGCA
         NzBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780996655; x=1781601455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CFzxUUzHhYIgdrM9Cp7Q1mlQeQKF/qEFJ+1fHe7CqxE=;
        b=MkvOVgE88khinxpcgsBRSjchC/XLpOO+lcQgdlg8iMOwbAmCJ7g+YJ6iRw8Gpz4XH1
         QEH0cfZgvDtc4hLrt51XmrwDg1onj0NeSZBjhUWL1RhgfYuOXgWU2NMZ+QB7kdsOjj0P
         ICRF+6AwjUtpJBOZ4o8kEOXgpxarPN63W7sX1tJhDx1A0XrRP/lKoiCn4rA4nts30Giq
         pUyBnNf6okA2XJxl97yM0JyzgVGAkFqGARxa8d6/nBGClboCN2uDD4mwPf+hZHJy+1Hb
         kbNyBjGoI0NpEGSgBnXNqccagyYu+EVqn5+I34xLHS1EO2iXKqvsoWhkTWG7atjPSFiE
         LaQQ==
X-Gm-Message-State: AOJu0YyJNj1GhjMQdGPXa6kEHk5aaNeZaOLsTVhsGLyMMplVp3t5rFPx
	9IiHwBxd6tXnkCWqkhFuyXESefx3iiSJtoyezgpamOUnhmEsQoPDPx5ihqATqSWUZeNPBnWze0R
	kqBuBn/tD9ZKscdBc44zGMnHG2s2W9Azl3x+1v//KnhJlASnJVo0dMRHFYyXBJhCRRvZ2
X-Gm-Gg: Acq92OEoqDwrZGl8n2lqNt7UkxNnxwJ2Pxz7TAEiZJnhRT/To3dgSfmuEtqXbKmFd9e
	678f0Sl7UziHmcSXwNFSpO7WwfrQ08ZCbKqxUNYO+JwPQ6gVblPScWD/6rrUMNMW+PHjmIzg5PP
	luFcoQknIegdQjvVclpYQnzanLvQRW2jnNJpiTTyJwCyC8pIOZFUCddJ8rZYITZXLYHXNj5uxyJ
	k0WUx23hGl5DlboiMcMBXI1nVEPAIQ600/WB2tk3/FeWNHwO2U4i5DgTsd5X466dPzpdBjU9fJI
	mPPdRPWnY4p94ti6snEHMF9CNF60o/ePxvF2AovYGQJ5PyvsiV8CNJaJCY8n54yzKT4BkQtz000
	FLrgM0k7thvV2AtLaAninlQZWZnSJD9hD0idkeJb5Zq+LMQ94GxNNwbnKX+xSRgzwuBoX
X-Received: by 2002:a05:6a00:10c4:b0:842:4982:81c with SMTP id d2e1a72fcca58-842b0d5d2e7mr19387310b3a.20.1780996654929;
        Tue, 09 Jun 2026 02:17:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:10c4:b0:842:4982:81c with SMTP id d2e1a72fcca58-842b0d5d2e7mr19387263b3a.20.1780996654279;
        Tue, 09 Jun 2026 02:17:34 -0700 (PDT)
Received: from hu-drajpura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828fa877sm20974879b3a.51.2026.06.09.02.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:17:33 -0700 (PDT)
From: DhruvinRajpura <dhruvin.rajpura@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 14:46:43 +0530
Subject: [PATCH 2/2] power: supply: qcom_battmgr: Add thermal mitigation
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-cooling_device_reg-v1-2-e15bddcb0086@qti.qualcomm.com>
References: <20260609-cooling_device_reg-v1-0-e15bddcb0086@qti.qualcomm.com>
In-Reply-To: <20260609-cooling_device_reg-v1-0-e15bddcb0086@qti.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        dhruvin.rajpura@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com,
        jishnu.prakash@oss.qualcomm.com,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Umang Chheda <quic_uchheda@quicinc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780996639; l=13463;
 i=drajpura@qti.qualcomm.com; h=from:subject:message-id;
 bh=VJ2CGf/mC6eRUxM8K/QYpGz84W7Qe1qdsXTOg3dFjlc=;
 b=mFfL8llpjCPp7dECJ5J8r5nafgjMt7N0GT5DGNcRJIzYFXMmrGyuJSCKs3PA8ujH2bKDB1H6Z
 tlVWWhKBLu/Dz9WyDIsL2t4/QjqtT6lKZ3voeo0Ifv7Z/l9M8svLO8l
X-Developer-Key: i=drajpura@qti.qualcomm.com; a=ed25519;
 pk=955XCRKkDWtR3Z/wycEd5zolAQt3Q1z7vODzFB/Wn1g=
X-Authority-Analysis: v=2.4 cv=cverVV4i c=1 sm=1 tr=0 ts=6a27da2f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=KCVx3LFSaJSWsAEuBpQA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: mgdMMSOU2pq70BQDm33_noGZ_0nLyHqR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4NSBTYWx0ZWRfXxNSbU7TJAO0E
 EVxviTOCu0y1XCBlVOUpXXIJWOcDYsTYCM/BFYkSNo3thEirhIWpUY7SfXtyyNQbqr6xi1v2qoN
 L0EGN4HAK8cRQH/CU+X0oiU8FVAxgVQfHA3AfYRqutAyeGslj7Zwrt2xVaOzpbFTbr3lpp8VOGX
 fOmOTHTqid5I2JwWPzTLtVDb7XNT/Xz0R1ofW1rCkhdfas+7YvbVWwIPtefelu+LupPfv0e+ylx
 05egY63vC4tZC4l7v/L2avVicE1p/XoJpCSsVNEMLCQD3E5M+RhLbBPeK4Ek3TqH4h4ouqojovf
 hAFTifW7zHld3DrVXw0e9HMeSzSnxBICk1vFFLuwL4Q13y7B5OrvWHIEX/vvZEcGGs0LYIyoqs/
 wycEEBGQE6e9T5Nz0kuKf0bsaSrLkw==
X-Proofpoint-GUID: mgdMMSOU2pq70BQDm33_noGZ_0nLyHqR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2605210000 definitions=main-2606090085
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112083-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sre@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:dhruvin.rajpura@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:drajpura@qti.qualcomm.com,m:quic_subbaram@quicinc.com,m:quic_uchheda@quicinc.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qti.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[dhruvin.rajpura@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dhruvin.rajpura@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5F85F65E59F

From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>

Earlier commit c85c191694cb ("power: supply: remove faulty cooling
logic") removed the automatic cooling device registration from
the power supply framework due to inverted cooling logic and
missing CHARGE_CONTROL_LIMIT_MAX validation across drivers. As
a result, drivers that need thermal mitigation support must now
explicitly register their own cooling devices with correct
semantics.

The battery charger firmware exposes a fast charge current (FCC)
limit property that can be used to throttle charging current in
response to thermal events. Without explicit cooling device
registration, the thermal framework has no way to reduce charging
current when the device is under thermal stress, which can lead
to excessive heat buildup during charging. Register a thermal
cooling device that maps discrete current levels defined in the
qcom,thermal-mitigation DT property to cooling states, where
level 0 represents the hardware maximum current queried from
firmware and each subsequent level reduces current to the next
DT-defined value. Track the last applied FCC value so thermal
limits are preserved across firmware protection domain restart
(PDR) events. Expose CHARGE_CONTROL_LIMIT and
CHARGE_CONTROL_LIMIT_MAX as power supply properties to allow
userspace to observe and control the current throttle level.

Co-developed-by: Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>
Signed-off-by: Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>
Co-developed-by: Umang Chheda <quic_uchheda@quicinc.com>
Signed-off-by: Umang Chheda <quic_uchheda@quicinc.com>
Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
---
 drivers/power/supply/qcom_battmgr.c | 256 ++++++++++++++++++++++++++++++++++++
 1 file changed, 256 insertions(+)

diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
index 490137a23d00..cbc129e9aa17 100644
--- a/drivers/power/supply/qcom_battmgr.c
+++ b/drivers/power/supply/qcom_battmgr.c
@@ -14,6 +14,7 @@
 #include <linux/soc/qcom/pdr.h>
 #include <linux/soc/qcom/pmic_glink.h>
 #include <linux/math.h>
+#include <linux/thermal.h>
 #include <linux/units.h>
 
 #define BATTMGR_CHEMISTRY_LEN	4
@@ -283,6 +284,7 @@ struct qcom_battmgr_status {
 
 	unsigned int discharge_time;
 	unsigned int charge_time;
+	unsigned int max_charge_ctl_limit;
 };
 
 struct qcom_battmgr_ac {
@@ -321,9 +323,18 @@ struct qcom_battmgr {
 	enum qcom_battmgr_unit unit;
 
 	int error;
+
+	int curr_thermal_level;
+	int num_thermal_levels;
+
+	u32 *thermal_levels;
+	u32 thermal_fcc_ua;
+	u32 last_fcc_ua;
+
 	struct completion ack;
 
 	bool service_up;
+	bool thermal_dev_registered;
 
 	struct qcom_battmgr_info info;
 	struct qcom_battmgr_status status;
@@ -449,6 +460,8 @@ static const u8 sm8350_bat_prop_map[] = {
 	[POWER_SUPPLY_PROP_POWER_NOW] = BATT_POWER_NOW,
 	[POWER_SUPPLY_PROP_CHARGE_CONTROL_START_THRESHOLD] = BATT_CHG_CTRL_START_THR,
 	[POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD] = BATT_CHG_CTRL_END_THR,
+	[POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT] = BATT_CHG_CTRL_LIM,
+	[POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT_MAX] = BATT_CHG_CTRL_LIM_MAX,
 };
 
 static int qcom_battmgr_bat_sm8350_update(struct qcom_battmgr *battmgr,
@@ -612,6 +625,12 @@ static int qcom_battmgr_bat_get_property(struct power_supply *psy,
 			return -ENODATA;
 		val->intval = battmgr->status.percent;
 		break;
+	case POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT:
+		val->intval = battmgr->curr_thermal_level;
+		break;
+	case POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT_MAX:
+		val->intval = battmgr->num_thermal_levels;
+		break;
 	case POWER_SUPPLY_PROP_TEMP:
 		val->intval = battmgr->status.temperature;
 		break;
@@ -770,6 +789,55 @@ static int qcom_battmgr_bat_is_writeable(struct power_supply *psy,
 	return 0;
 }
 
+static int __battery_psy_set_charge_current(struct qcom_battmgr *battmgr,
+					    u32 fcc_ua)
+{
+	int ret;
+
+	mutex_lock(&battmgr->lock);
+	ret = qcom_battmgr_request_property(battmgr, BATTMGR_BAT_PROPERTY_SET,
+					    BATT_CHG_CTRL_LIM, fcc_ua);
+	mutex_unlock(&battmgr->lock);
+	if (ret < 0) {
+		dev_err(battmgr->dev, "Failed to set FCC %u, ret=%d\n", fcc_ua, ret);
+	} else {
+		dev_dbg(battmgr->dev, "Set FCC to %u uA\n", fcc_ua);
+		battmgr->last_fcc_ua = fcc_ua;
+	}
+
+	return ret;
+}
+
+static int battery_psy_set_charge_current(struct qcom_battmgr *battmgr,
+					  int val)
+{
+	u32 fcc_ua, prev_fcc_ua;
+	int ret;
+
+	if (!battmgr->num_thermal_levels)
+		return 0;
+
+	if (battmgr->num_thermal_levels < 0) {
+		dev_err(battmgr->dev, "Incorrect num_thermal_levels\n");
+		return -EINVAL;
+	}
+
+	if (val < 0 || val > battmgr->num_thermal_levels)
+		return -EINVAL;
+
+	fcc_ua = battmgr->thermal_levels[val];
+	prev_fcc_ua = battmgr->thermal_fcc_ua;
+	battmgr->thermal_fcc_ua = fcc_ua;
+
+	ret = __battery_psy_set_charge_current(battmgr, fcc_ua);
+	if (!ret)
+		battmgr->curr_thermal_level = val;
+	else
+		battmgr->thermal_fcc_ua = prev_fcc_ua;
+
+	return ret;
+}
+
 static int qcom_battmgr_bat_set_property(struct power_supply *psy,
 					 enum power_supply_property psp,
 					 const union power_supply_propval *pval)
@@ -784,6 +852,8 @@ static int qcom_battmgr_bat_set_property(struct power_supply *psy,
 		return qcom_battmgr_set_charge_start_threshold(battmgr, pval->intval);
 	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
 		return qcom_battmgr_set_charge_end_threshold(battmgr, pval->intval);
+	case POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT:
+		return battery_psy_set_charge_current(battmgr, pval->intval);
 	default:
 		return -EINVAL;
 	}
@@ -791,6 +861,19 @@ static int qcom_battmgr_bat_set_property(struct power_supply *psy,
 	return 0;
 }
 
+static int qcom_battmgr_prop_is_writeable(struct power_supply *psy,
+					  enum power_supply_property prop)
+{
+	switch (prop) {
+	case POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT:
+		return 1;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
 static const enum power_supply_property sc8280xp_bat_props[] = {
 	POWER_SUPPLY_PROP_STATUS,
 	POWER_SUPPLY_PROP_PRESENT,
@@ -872,6 +955,8 @@ static const enum power_supply_property sm8350_bat_props[] = {
 	POWER_SUPPLY_PROP_VOLTAGE_NOW,
 	POWER_SUPPLY_PROP_VOLTAGE_MAX,
 	POWER_SUPPLY_PROP_CURRENT_NOW,
+	POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT,
+	POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT_MAX,
 	POWER_SUPPLY_PROP_TEMP,
 	POWER_SUPPLY_PROP_TECHNOLOGY,
 	POWER_SUPPLY_PROP_CHARGE_COUNTER,
@@ -892,6 +977,8 @@ static const struct power_supply_desc sm8350_bat_psy_desc = {
 	.properties = sm8350_bat_props,
 	.num_properties = ARRAY_SIZE(sm8350_bat_props),
 	.get_property = qcom_battmgr_bat_get_property,
+	.set_property = qcom_battmgr_bat_set_property,
+	.property_is_writeable = qcom_battmgr_prop_is_writeable,
 };
 
 static const enum power_supply_property sm8550_bat_props[] = {
@@ -1434,6 +1521,11 @@ static void qcom_battmgr_sm8350_callback(struct qcom_battmgr *battmgr,
 		case BATT_CURR_NOW:
 			battmgr->status.current_now = le32_to_cpu(resp->intval.value);
 			break;
+		case BATT_CHG_CTRL_LIM:
+			break;
+		case BATT_CHG_CTRL_LIM_MAX:
+			battmgr->status.max_charge_ctl_limit = le32_to_cpu(resp->intval.value);
+			break;
 		case BATT_TEMP:
 			val = le32_to_cpu(resp->intval.value);
 			battmgr->status.temperature = DIV_ROUND_CLOSEST(val, 10);
@@ -1479,6 +1571,25 @@ static void qcom_battmgr_sm8350_callback(struct qcom_battmgr *battmgr,
 			break;
 		}
 		break;
+
+	case BATTMGR_BAT_PROPERTY_SET:
+		property = le32_to_cpu(resp->intval.property);
+		if (payload_len != sizeof(resp->intval)) {
+			dev_warn(battmgr->dev,
+				 "invalid payload length for %#x request: %zd\n",
+				 property, payload_len);
+			battmgr->error = -ENODATA;
+			return;
+		}
+
+		battmgr->error = le32_to_cpu(resp->intval.result);
+		if (battmgr->error) {
+			dev_err(battmgr->dev, "Error in response for opcode :%#x prop_id :%u, ret :%d\n",
+				opcode, property, battmgr->error);
+			goto out_complete;
+		}
+		break;
+
 	case BATTMGR_USB_PROPERTY_GET:
 		property = le32_to_cpu(resp->intval.property);
 		if (payload_len != sizeof(resp->intval)) {
@@ -1583,6 +1694,133 @@ static void qcom_battmgr_callback(const void *data, size_t len, void *priv)
 		qcom_battmgr_sm8350_callback(battmgr, data, len);
 }
 
+static int
+qcom_battmgr_chg_get_max_charge_cntl_limit(struct thermal_cooling_device *tcd,
+					   unsigned long *state)
+{
+	struct qcom_battmgr *battmgr = tcd->devdata;
+
+	*state = battmgr->num_thermal_levels;
+
+	return 0;
+}
+
+static int
+qcom_battmgr_chg_get_cur_charge_cntl_limit(struct thermal_cooling_device *tcd,
+					   unsigned long *state)
+{
+	struct qcom_battmgr *battmgr = tcd->devdata;
+
+	*state = battmgr->curr_thermal_level;
+
+	return 0;
+}
+
+static int
+qcom_battmgr_set_cur_charge_cntl_limit(struct thermal_cooling_device *tcd,
+				       unsigned long state)
+{
+	struct qcom_battmgr *battmgr = tcd->devdata;
+
+	return battery_psy_set_charge_current(battmgr, (int)state);
+}
+
+static const struct thermal_cooling_device_ops battery_tcd_ops = {
+	.get_max_state = qcom_battmgr_chg_get_max_charge_cntl_limit,
+	.get_cur_state = qcom_battmgr_chg_get_cur_charge_cntl_limit,
+	.set_cur_state = qcom_battmgr_set_cur_charge_cntl_limit,
+};
+
+static int qcom_battmgr_register_thermal_cooling_device(struct qcom_battmgr *battmgr)
+{
+	struct thermal_cooling_device *tcd;
+	u32 prev;
+	int ret, i;
+
+	/* Skip registering thermal cooling device if thermal levels are not defined */
+	if (!battmgr->num_thermal_levels)
+		return 0;
+
+	if (battmgr->thermal_dev_registered)
+		return 0;
+
+	mutex_lock(&battmgr->lock);
+	ret = qcom_battmgr_request_property(battmgr, BATTMGR_BAT_PROPERTY_GET,
+					    BATT_CHG_CTRL_LIM_MAX, 0);
+	mutex_unlock(&battmgr->lock);
+
+	if (ret < 0) {
+		dev_err(battmgr->dev, "Unable to read CHG_CTRL_LIMIT_MAX ret :%d\n", ret);
+		return ret;
+	}
+
+	prev = battmgr->status.max_charge_ctl_limit;
+
+	for (i = 1; i <= battmgr->num_thermal_levels; i++) {
+		if (battmgr->thermal_levels[i] > prev) {
+			dev_err(battmgr->dev, "Thermal values not defined as expected\n");
+			return -EINVAL;
+		}
+		prev = battmgr->thermal_levels[i];
+	}
+
+	battmgr->thermal_levels[0] = battmgr->status.max_charge_ctl_limit;
+	battmgr->thermal_fcc_ua = battmgr->status.max_charge_ctl_limit;
+
+	/* Register Thermal Cooling Device */
+	tcd = devm_thermal_of_cooling_device_register(battmgr->dev,
+						      battmgr->dev->of_node,
+						      (char *)battmgr->bat_psy->desc->name,
+						      battmgr, &battery_tcd_ops);
+	if (IS_ERR_OR_NULL(tcd)) {
+		ret = PTR_ERR_OR_ZERO(tcd);
+		dev_err(battmgr->dev, "Failed to register thermal cooling device ret=%d\n", ret);
+		return ret;
+	}
+
+	battmgr->thermal_dev_registered = true;
+
+	return ret;
+}
+
+static int qcom_battmgr_parse_dt(struct qcom_battmgr *battmgr)
+{
+	struct device_node *node = battmgr->dev->of_node;
+	int len, ret;
+
+	ret = of_property_count_elems_of_size(node, "qcom,thermal-mitigation", sizeof(u32));
+	if (ret == -EINVAL)
+		return 0;               /* property not defined, thermal mitigation disabled */
+	if (ret <= 0)
+		return ret;              /* real error, propagate */
+
+	len = ret;
+
+	battmgr->thermal_levels = devm_kcalloc(battmgr->dev, len + 1,
+					       sizeof(*battmgr->thermal_levels),
+					       GFP_KERNEL);
+	if (!battmgr->thermal_levels)
+		return -ENOMEM;
+
+	/*
+	 * Element 0 is for normal charging current. Elements from index 1
+	 * onwards is for thermal mitigation charging currents.
+	 */
+
+	ret = of_property_read_u32_array(node, "qcom,thermal-mitigation",
+					 &battmgr->thermal_levels[1], len);
+	if (ret < 0) {
+		dev_err(battmgr->dev, "Error in reading qcom,thermal-mitigation, ret=%d\n",
+			ret);
+
+		return ret;
+	}
+
+	battmgr->num_thermal_levels = len;
+
+	return ret;
+}
+
 static void qcom_battmgr_enable_worker(struct work_struct *work)
 {
 	struct qcom_battmgr *battmgr = container_of(work, struct qcom_battmgr, enable_work);
@@ -1596,6 +1834,18 @@ static void qcom_battmgr_enable_worker(struct work_struct *work)
 	ret = qcom_battmgr_request(battmgr, &req, sizeof(req));
 	if (ret)
 		dev_err(battmgr->dev, "failed to request power notifications\n");
+
+	if (!battmgr->thermal_dev_registered) {
+		ret = qcom_battmgr_register_thermal_cooling_device(battmgr);
+		if (ret < 0)
+			dev_err(battmgr->dev, "failed to register thermal cooling device ret:%d\n",
+				ret);
+	} else if (battmgr->last_fcc_ua) {
+		ret = __battery_psy_set_charge_current(battmgr, battmgr->last_fcc_ua);
+		if (ret < 0)
+			dev_err(battmgr->dev, "Failed to set FCC (%u uA), ret:%d\n",
+				battmgr->last_fcc_ua, ret);
+	}
 }
 
 static void qcom_battmgr_pdr_notify(void *priv, int state)
@@ -1690,6 +1940,12 @@ static int qcom_battmgr_probe(struct auxiliary_device *adev,
 			return dev_err_probe(dev, PTR_ERR(battmgr->wls_psy),
 					     "failed to register wireless charing power supply\n");
 	} else {
+		ret = qcom_battmgr_parse_dt(battmgr);
+		if (ret < 0) {
+			dev_err(dev, "Failed to parse thermal mitigation levels ret:%d\n", ret);
+			return ret;
+		}
+
 		if (battmgr->variant == QCOM_BATTMGR_SM8550)
 			psy_desc = &sm8550_bat_psy_desc;
 		else

-- 
2.34.1


