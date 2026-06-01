Return-Path: <linux-arm-msm+bounces-110506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CM9LMtUoHWq6VwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 08:38:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 35ACE61A408
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 08:38:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9307D300828A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 06:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A31A1371893;
	Mon,  1 Jun 2026 06:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kz0QVYzZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O9IIB1XK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7FE33F8B1
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 06:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780295889; cv=none; b=ohBYEGssUmZ6lzXlOg6hEmn6FBmg2cRc809/PKJ6VLybU4tAjgmf+NT1/6RLj19rggfjjZt6Ai+OIC6agCmZguJPmREmDzVL+lchLQjZ7XRCaoTqgkJf7gNfEBI4OP4/CTeLhMn2KBnuqJX+NrGQQqFg6cNOSQql1olFtjATz/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780295889; c=relaxed/simple;
	bh=NxsmgpXqtgg+7aG586diJbRcKlS0Itgqio//rv0yLKs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SBmPlGhP0JpDBwr5yZoB3d8wDtGw8ZusYu/9dpQ7QYkcV6879n4hEFabLPgd5aFz2QD/+vw1/+cU7EutOtzLkstGgoqv/hdJIeKEwZelTYg8wxvKzLv15UbytITk2OLe/Hj9UHVHyRPrmI6DtItghcH+PO3TKPeFYqLzzUqmD2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kz0QVYzZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O9IIB1XK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VKUhse3850001
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 06:38:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yAcgauqzFdzXcLgv0t2zyO
	ijWIG8IzV/EiR5Mvck0ng=; b=kz0QVYzZR8trlEbdUydtH3pszPoSfNYmdlUXAj
	9OX21Dgv1cW7NjVPFeSNVoLQJ2mDYLIC1b3mUSsV/y1/IKpmhJz7kyb37sJRFimh
	ZHkjlx32nC+oniQ9gj1yj/dgbRmwzkjHlrDp8UWtCqKogGCpuyinhbQlU0M1xDfA
	ArgiSYaqfT9huRxIeNkvArG0lslF5koD9zkbTduv7hi90dg/fvWZE7B1tsum7zh1
	+cx4VIaG1bXGv2FYGdMRFGPutnAJKld2anghkYzwYtkwqAxP82SBZR+UWSDb5K3L
	XaWhwRC4/2IV8OsSdC68aT/CKXgFXR7z8e06BJm3Z2wh+fRA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efrnce3u4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 06:38:07 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84237a15547so925585b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 23:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780295887; x=1780900687; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yAcgauqzFdzXcLgv0t2zyOijWIG8IzV/EiR5Mvck0ng=;
        b=O9IIB1XKmRVaOojI9WcgSi0yX1x5yskIBXsQCkptFt6I8rm/08e2vihdtPzyDNu5eU
         VdP5i68eKD260C3Jd6kbHj5lpf1KUYyEQFK/XHCN8/dAhIEUt5VpGd82eu/ZOyQZqtg9
         tChG8wuTiKpKG8ql4ABjcGaqyojrS2kM9l64Eb/zmHavset7gv0JpcQYwwPaMY7z552u
         peNfqo9OnIugNpzVko0c/NRcsBt2O2Dm9ViEuSL3anTQbA84lWqmaY96t1yqgJkBJWln
         TmRpxmAjm5kiKuYZtQ+9STfwwMNVgygTxhursC2TIgE2RX9Tn69e1j6bCCsh9LVOgT63
         ivWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780295887; x=1780900687;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yAcgauqzFdzXcLgv0t2zyOijWIG8IzV/EiR5Mvck0ng=;
        b=e+uGvJIic3tI01CBD+GT3K9U+Eq9TY199b/pAeAxAo1RlVxKd95QfxJu4q2wRxp4Df
         OZ5s9iF6O3Kpolg+l00AzkNH/A0K7OtFlUIu8lFbSZ1J4hTx4g8EAOBiRrmkctQRtoU5
         ZrPI7aOPSYA5SB4fyFQEgT9Tjxx64gPS4bCQBxi+0L4SNYHtn63WQvAuU1Cagc1RdjIP
         Po5hCrO9uRSsoaihjPoJPrVj8+Ab8kwTNVYhr1Dbaab9e3CKYjhsgk6uei5/TpOwLuIW
         EgIofwKU8fIP7kd8D4WCe2r4QjhkkzcjiCHkhZw85lnEKkQkgBvWwgI4O0/N9AGLu6am
         BYsA==
X-Gm-Message-State: AOJu0YxEG5dVeRnMOO4bm7xW/hsBLu30SnZVRRKEj1Z5T+VZhijMPbnQ
	8Vc9lEo2wwxUEzWtl7U/aGjN27zEx1QDK3417PLuwkXC0TXXkqhl9zf+lGALvbiRzYbM1I+3bt1
	NIPUf927hYRlSsHkoyZAuz+mZn9emxXeHAsfKdG1wTZpVgG9d+Fa73rmq765dQluJ6cMm
X-Gm-Gg: Acq92OEhHt6mgzwIQnrYklCdW697NSPMVUKNBAo08e1KShz5TsLVTXgcNOYeS6Gwqth
	5N8S0moiq5AzFlhWnpufAa4EtyrhqjmkkYqbUqcMNLyuFu4cu59xmpp1bXXz4x8wzCM45hmy7SA
	LQTwRO3sb1iG8ZwPWl+GDzGeBZOH3ryFcB5zHKeci6I+TRKnECCVjPzLUfEx/A4mSDMl/J01K4k
	UylX3aKHu8Bf7JZh8TrKgM7cYGLv+Y4Of4xsPbOzXa3qfDXM0Gqd5cZdtmTDrZdQVsCMXdALYG4
	85J7xcNm1vWXczPv5VT0f6Hk9wf1+WzwGQI68tMRVMOtK0cN4YkqfXe91f4XzTRl9/S+eQMa5mB
	UtzgFqTpAdDN8NWK2lBfPn1JhRsIhWemVeQJLlvMpdHN4Iv7LAIMsRQOdB7g1PNAIaw==
X-Received: by 2002:a05:6a00:2289:b0:82f:390a:69df with SMTP id d2e1a72fcca58-8422548f610mr8955718b3a.35.1780295887004;
        Sun, 31 May 2026 23:38:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:2289:b0:82f:390a:69df with SMTP id d2e1a72fcca58-8422548f610mr8955683b3a.35.1780295886519;
        Sun, 31 May 2026 23:38:06 -0700 (PDT)
Received: from hu-priyjain-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214c9252bsm9321358b3a.39.2026.05.31.23.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 23:38:05 -0700 (PDT)
From: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
Subject: [PATCH v2 0/2] thermal: qcom: tsens: refine wake IRQ handling for
 suspend
Date: Mon, 01 Jun 2026 12:07:55 +0530
Message-Id: <20260601-tsens_interrupt_wake_control-v2-0-ce9570946abd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMMoHWoC/42NWw6CMBREt0L6bUlpQgG/3IchpI+rVLHF3oIaw
 t4tuAHnY5KTTM4sBCFYQHLMFhJgtmi9S8APGdG9dFeg1iQmnHHBSi5oRHDYWRchhGmM3UveodP
 exeAHymoFlapF2RSGJMUY4GLfu/7c/hgndQMdN+e26C1GHz77/1xsuz+v5oIyKqTRpipTVHPyi
 PlzkoP2j0eeirTrun4BZeDryuEAAAA=
X-Change-ID: 20260526-tsens_interrupt_wake_control-08be7b86591d
To: Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780295882; l=2081;
 i=priyansh.jain@oss.qualcomm.com; s=20260515; h=from:subject:message-id;
 bh=NxsmgpXqtgg+7aG586diJbRcKlS0Itgqio//rv0yLKs=;
 b=pMvH3R5wSVeUdrd7RfL4fJ5VOoEHi/fZm/+uieHHSCC5PCk8C34F0mYSOVy6bPOImgW3PzPOd
 RlCrzOKjKUcDgaOUsffu5C2E4ugQVPL2v6XbIl2vbu2i5rhsJFfuTV9
X-Developer-Key: i=priyansh.jain@oss.qualcomm.com; a=ed25519;
 pk=xe57jjgIoTuNHN/Dp00kZl1mAJjmROaH7JV9sRxEoEQ=
X-Proofpoint-GUID: sAraDzsG27RldKZu5PKsM99DUxK2lpNL
X-Proofpoint-ORIG-GUID: sAraDzsG27RldKZu5PKsM99DUxK2lpNL
X-Authority-Analysis: v=2.4 cv=FcIHAp+6 c=1 sm=1 tr=0 ts=6a1d28cf cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=7CQSdrXTAAAA:8 a=kC-WkVMnToTUk7kQOxwA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=FO4_E8m0qiDe52t0p3_H:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA2NCBTYWx0ZWRfXwb8+XEE7/RH3
 HWV/UONkkGKnCrf8ykex8hASaXGDrWaDdYO9z2jGjylU3fQakCPlTWFQF6Eve+K7iOgVBzAhKdB
 ySZww4byDk2mvJP9tSa7XF/G2Mj73ehMvPONxl2VRSp7wv2d08pFyw1SRilWrImIjJGOsxcy62D
 xFgvPp8ob1j7zr3SLLXGm6lLzhAEpR2Q50jVnp0SuuW5T7paFjzKwhVXmO9b8Tb51t+Y1Ypwm8e
 tBUKG27REvXVbKFAv6SXLs2HJPdWmhrqCGgHsLfRfKOnWiyy68sERev+uUsDGKxkh4tXIfGv37j
 MjmKAMFbXKooJ6CIl7w559QBP/hTWGAt4wyyv8LY7AoCg3ewJoCKncKawOR4CJvKfc14L3AxzU2
 x2lVGSSTY1ns5m+OvqA9in+t73QV6hlpzBLASLqmxHu5cVSt7ZYYdnoQGshiFZPs08BrjgcT258
 6f1u+ojr8Yh8/ejjVyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010064
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,intel.com,arm.com];
	TAGGED_FROM(0.00)[bounces-110506-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:email,msgid.link:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,arm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[priyansh.jain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 35ACE61A408
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series refines how TSENS threshold IRQs are used as wake sources
across suspend/resume.

Patch 1 moves IRQ wake control from registration time into PM callbacks,
so wakeup configuration follows the actual suspend state instead of being
left enabled during normal runtime.

Patch 2 adds a platform-data opt-out for wake IRQ setup and uses it for
automotive TSENS compatibles (SA8775P/SA8255P), where parking suspend
should not be exited repeatedly due to TSENS threshold wake events.

Series highlights:
- store and manage TSENS IRQ wake state in suspend/resume paths
- keep existing runtime monitoring behavior unchanged
- disable TSENS wake IRQ setup for selected automotive targets

Signed-off-by: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
---
Changes in v2:
- Fix indentation issues
- Remove redundant checks for IRQ numbers since device_may_wakeup() already
  ensures interrupts are registered. Simplifies code logic.
- Patch 2: No changes, LGTM from Daniel Lezcano 
- Link to v1: https://patch.msgid.link/20260526-tsens_interrupt_wake_control-v1-0-6adcd75555b9@oss.qualcomm.com

To: Amit Kucheria <amitk@kernel.org>
To: Thara Gopinath <thara.gopinath@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
To: Daniel Lezcano <daniel.lezcano@kernel.org>
To: Zhang Rui <rui.zhang@intel.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-pm@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Priyansh Jain (2):
      thermal: qcom: tsens: switch wake IRQ handling to PM callbacks
      thermal: qcom: tsens: Disable wakeup interrupt setup on automotive targets

 drivers/thermal/qcom/tsens-v2.c |  9 +++++-
 drivers/thermal/qcom/tsens.c    | 70 ++++++++++++++++++++++++++++++++++-------
 drivers/thermal/qcom/tsens.h    | 23 +++++++++++++-
 3 files changed, 88 insertions(+), 14 deletions(-)
---
base-commit: e8c2f9fdadee7cbc75134dc463c1e0d856d6e5c7
change-id: 20260526-tsens_interrupt_wake_control-08be7b86591d

Best regards,
--  
Priyansh Jain <priyansh.jain@oss.qualcomm.com>


