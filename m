Return-Path: <linux-arm-msm+bounces-115140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4TYWKu6AQmri8gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:27:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F726DC07A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:27:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FvBtcp93;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LUlB19Li;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115140-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115140-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19EF730575D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43C9D40FD87;
	Mon, 29 Jun 2026 14:16:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45214192F1
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:16:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742571; cv=none; b=jVzaPmyoDwkyn67/hp4T94nV1z3LiTyfuadwrnmidPRcE0Lq9DMGcwAwmfVmISUqX8xQSNwBmmwZeoQOGAxouAjvsSCwgYhFSCZCKIDoZqN4CREG3rbw3WWxJnxpnd9YPmRqAW33SlcPSPsWZJfzgljaH3VTaOoyAw+nioN6RUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742571; c=relaxed/simple;
	bh=Nf1AvzGaEEpEYSX9Gph5/QaTlWnimXF8lHPYzXfiEKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sKkdJhVlaw/z1CBiXt+pN+stF7KBPw3cVxVCjOORKYlzgotKMHYhK2WKroJzSOoGB/RF6QiBLC4TviG1BOIEERTZwAhtv6cojmGu9YNlNAMNgU38pN/dO7PsnI4dZSCd8h1r24SHV0sFTu1nw5CVqw4nMi4cUwtRg+TIaqKtG8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FvBtcp93; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LUlB19Li; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATEHd2647844
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:16:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9svuRAUWKf4Cq1A1NpmrcreySoHCCAmo74eRJpf7Vus=; b=FvBtcp93s60t70/g
	rDJHI02+YFKeFdjKddP8ayK3ki6gyiIpgIXkpCkIp4h45xyP0PdGxgYWfDFTOFsA
	L7jaQtPKeIqu6ulLAFFnH289+kKxeXZIefSf++XMYnUUjSgxPzDe2tnMyUlsX0Yf
	w6GEhxo4eceQ3rZaM7S8EthwbsjM6HmTxM1vywsfDoZfMOmsQ0ehg/ia1CfBTgKL
	lAnGwcflsNydJp6hiTgoz6z29JAIJcQ3kXHZu2Q2W7beJ1ART39mXLd0yVxEzUQE
	GiS+pExAKOOtlqkmyJJboBd4N0UDuQILcD0d3QQRDx7G5pB5AXdurumBrJ8kOdwk
	5R8Qkw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kyjhp0j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:16:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92d1cae5740so190200085a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782742568; x=1783347368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9svuRAUWKf4Cq1A1NpmrcreySoHCCAmo74eRJpf7Vus=;
        b=LUlB19LivY8TWFmTqI8drxBODCHE6qh7e8itF3wrtkoaHKyKaBFuDyi20VnlbTJcOX
         A4pxi43gj91lmvNily36XnnKd2jgz4TVQAQljqsGdvsTHl26mK3+Ni6xzVqoxhW+VfZC
         Pj1MMCa+RJvb6OU1ilGhmHf6HcT/2MHYs138h5M5gK4JY1Ez6ZnTXYMkOFSrQgavY2N6
         1DyPjonGWOpIPQEibH/FzkqyDnlGbDlVXAQ2ah33rYnyDxsRxXno7ns9WN/D8NUVc6bv
         2ciQdUASt+/ncMoGnTmEB5u5MMspXsatiB64hbruKsYa290V7g880Q3qekfjVl6wStXa
         r3ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742568; x=1783347368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9svuRAUWKf4Cq1A1NpmrcreySoHCCAmo74eRJpf7Vus=;
        b=URloXnhGOaLK13RHg9kRrhKNVylikEyhU9Z2ByuFt7udbPaMoTh1MEdfEyxKFC4WR7
         eAFPt867lXT0CBL7DCwLEbouyhGggAs7u6f63r/WNTV33x7TWPv4j4u+3deDAIjZq9gR
         bIE7aftJDkUPHt6HDjE4WK3aNTWjh3C2zdRbYaTIj/G6ZXIhKQ0T55N1Qd/z39COTMQH
         v8M4FCaN3XiHjCKApvi1kuNdx8Kxkrw/y1Lq2KJogjYafOLDNxP0L76kZSqkUUssrFVx
         FduvOc74FVl8ViQ8v5lvqahRcAaoBDO7JcoQbdaD6VJVhpqIdluWZF3v4101080y1xsi
         v8sg==
X-Gm-Message-State: AOJu0YzLdEJywtGJhz1zax93nfzw8ym90n3rBOqIxfQjFltOGSpaPU5C
	Zz/NRakvwMAQ3mEZ2Ki/IKrO/vfckPApktQrz0TKRgf8h3rX5kVcq22eYyR9cMGy+kLj+n9COLR
	yLexoEC5tZgxuH47z6bYnPWVXzTsD1hGIMEhtsQRgntl2D3PzGB18I1UTPNob/9RhNDyQ
X-Gm-Gg: AfdE7cmriTcfzKhAMceKnUHR8xT2n7xnYRjEUFYzyCxJjL7hrjCakoHAVOvwy3GOZVx
	6d5YlsGIoX5CgtHjKT+ZYgEN/ObH5YEOUCv2x00mSm36JPg6yi2CfyGdyXuRvv7c3COvfnnkg7x
	n1XNX60BWyurTby7jaT3F6RzerGzk1BQ7YIOxTavCq52RusinUbTkC+jfZ3zwjNEl/fZ2yy/uI7
	CR6tISMR1xF+yy6n/4fmLv/W6gSKMwsFU4EpNv5LL00uoKJ0MtdIeckjYgeGRGWZm2wUZq+fUM8
	SvYLpZvjygsf8B46b5o1JUzXBsHaRlvCIlaHfkgLhiQkX9ALtNKxOGk9PYVcFicIt6p/hVBkTZB
	hsviGFMp1Fc8qEu5QZ0+m5dRaWmAdKqYKnMf8OSppgyUd+s9LevfM2GDNZvqr5kDcg9kyRw==
X-Received: by 2002:a05:620a:649c:b0:92e:583d:245f with SMTP id af79cd13be357-92e583d2685mr226504085a.9.1782742567408;
        Mon, 29 Jun 2026 07:16:07 -0700 (PDT)
X-Received: by 2002:a05:620a:649c:b0:92e:583d:245f with SMTP id af79cd13be357-92e583d2685mr226495485a.9.1782742566595;
        Mon, 29 Jun 2026 07:16:06 -0700 (PDT)
Received: from yongmou2.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9260079070bsm2143165885a.40.2026.06.29.07.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:16:06 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH RESEND v5 12/25] drm/msm/dp: factor out _helper variants of bridge ops accepting a panel
Date: Mon, 29 Jun 2026 22:14:33 +0800
Message-ID: <20260629-msm-dp-mst-v5-12-2ed6aee1867a@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260629-msm-dp-mst-v5-0-2ed6aee1867a@oss.qualcomm.com>
References: <20260629-msm-dp-mst-v5-0-2ed6aee1867a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782742144; l=8495; i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id; bh=euWeALUbmMzdGUkiE/Q/aV5WnjeW32f7QOdos3tj6qM=; b=fAjkaZpkbNRnCfGR5EIRi4ljXey4d1pcgi2ob2hEyPJ0JJRkcBeLFHuUbSQnQ2VBsT8iEQv/i JABrtDm7QI0A/k1lX8pD9lt6J9xFwwpzN4lugnnTzmJFTjFrHMPbWRD
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519; pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: eGwHQ3pf-Ix6H4jX1FhMQnCDfPlxnfWR
X-Proofpoint-ORIG-GUID: eGwHQ3pf-Ix6H4jX1FhMQnCDfPlxnfWR
X-Authority-Analysis: v=2.4 cv=Ftk1OWrq c=1 sm=1 tr=0 ts=6a427e28 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=mu3EkBhnCEQeHIwj90QA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX5CLFmIeF2O/8
 7J/EsjEeANYEBdYE1w4oKbHoSU1WX0xtK6R7zQ4t2DqMRD2MceAQp4MaMQe8RZ8q/Spqct6nYIt
 zoShet0hsxTvSX5OJS6Q7RMIaA63DHk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX7tn4W7O0cPQO
 Y8mlQzi1pmVDUZ4jcqOy7I9LgH4EEfYQX05VqFRgKM9BW2NfbUfI30vrkTYoPHWl1fnFP+FpvZF
 /TIZDmWWhYU36XO3GkFSXMy0E3EplzztfQ50tId09DlsFvVSKlhkSSUoWoSl8R9GMS5RBeZY4NX
 rKJ53xsm4Y2b9Qn9wNjHIMF0s+iU8Th6Ps6FVyGjjl50Mm3VDUSLd4y2SehBAulQqBiPLZm0RSR
 Mkk7IGvpYjgk6A+2Ty1lAgSE419JkNdkvoJ3jX0bmSz56K5kXClmnx35lYLaNfAIeszKkAiksCB
 8tDUKrF2UJirFeUSbF9imuUI04M0AdEb6cf0Rft1903MbZls1LVpSPPPZzr/yKMwFgKEu3mLzFk
 9UGuSs1GpCYCndSN9GaBlulO96jaYvqurAScbX4BkoMIdp65KSHkqv1xsXwASXtnNMfJpRlDYhR
 CLTOeE6LGY+993Gw/ag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290118
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115140-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 01F726DC07A

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

The atomic bridge callbacks (set_mode / enable / disable /
post_disable) on dp_display currently hard-code dp->panel. For
DP MST every stream has its own msm_dp_panel that the MST
encoder owns, so the same enable/disable sequence needs to be
invokable against an arbitrary panel.

Introduce *_helper variants that take struct msm_dp_panel * and
reduce the existing atomic_* callbacks to thin wrappers that
pass dp->panel. No SST-path behaviour change.

Also drop the static qualifier from msm_dp_display_prepare_link()
and msm_dp_display_unprepare() and change them to take
struct msm_dp * so the upcoming MST encoder code can drive
link-level prepare/unprepare uniformly through the public API.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 93 +++++++++++++++++++++++++++----------
 drivers/gpu/drm/msm/dp/dp_display.h | 12 +++++
 2 files changed, 80 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 1680a67284a7..0e432f35cc51 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -628,12 +628,14 @@ static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
 	return 0;
 }
 
-static int msm_dp_display_prepare_link(struct msm_dp_display_private *dp)
+int msm_dp_display_prepare_link(struct msm_dp *msm_dp_display)
 {
-	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
+	struct msm_dp_display_private *dp;
 	int rc = 0;
 	bool force_link_train = false;
 
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
 	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
 
 	if (msm_dp_display->is_edp)
@@ -1457,69 +1459,101 @@ int msm_dp_modeset_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 	return 0;
 }
 
-void msm_dp_display_atomic_prepare(struct msm_dp *msm_dp_display,
-				   struct drm_atomic_commit *state)
+int msm_dp_display_set_mode_helper(struct msm_dp *msm_dp_display,
+				   struct drm_atomic_commit *state,
+				   struct drm_encoder *drm_encoder,
+				   struct msm_dp_panel *msm_dp_panel)
 {
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *crtc_state;
+
+	crtc = drm_atomic_get_new_crtc_for_encoder(state, drm_encoder);
+	if (!crtc)
+		return 0;
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+
+	return msm_dp_display_set_mode(msm_dp_display, &crtc_state->adjusted_mode, msm_dp_panel);
+}
+
+void msm_dp_display_atomic_prepare(struct msm_dp *msm_dp_display,
+				   struct drm_atomic_commit *state)
+{
 	int rc = 0;
 	struct msm_dp_display_private *dp;
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	crtc = drm_atomic_get_new_crtc_for_encoder(state,
-						   msm_dp_display->bridge->encoder);
-	if (!crtc)
-		return;
-	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
-
-	rc = msm_dp_display_set_mode(msm_dp_display, &crtc_state->adjusted_mode, dp->panel);
+	rc = msm_dp_display_set_mode_helper(msm_dp_display, state,
+					    msm_dp_display->bridge->encoder, dp->panel);
 	if (rc) {
 		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
 		return;
 	}
 
-	rc = msm_dp_display_prepare_link(dp);
+	rc = msm_dp_display_prepare_link(msm_dp_display);
 	if (rc)
 		DRM_ERROR("DP display prepare failed, rc=%d\n", rc);
 }
 
-void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display)
+void msm_dp_display_enable_helper(struct msm_dp *msm_dp_display, struct msm_dp_panel *msm_dp_panel)
 {
 	struct msm_dp_display_private *dp;
 	int rc = 0;
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	msm_dp_display_set_stream_info(msm_dp_display, dp->panel, 0, 0, 0);
+	msm_dp_display_set_stream_info(msm_dp_display, msm_dp_panel, 0, 0, 0);
 
-	rc = msm_dp_display_enable(dp, dp->panel);
+	rc = msm_dp_display_enable(dp, msm_dp_panel);
 	if (rc)
 		DRM_ERROR("DP display enable failed, rc=%d\n", rc);
 
 	rc = msm_dp_display_post_enable(msm_dp_display);
 	if (rc) {
 		DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
-		msm_dp_display_disable(dp, dp->panel);
+		msm_dp_display_disable(dp, msm_dp_panel);
 	}
 
 	drm_dbg_dp(msm_dp_display->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
 }
 
+void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display)
+{
+	struct msm_dp_display_private *dp;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	msm_dp_display_set_stream_info(msm_dp_display, dp->panel, 0, 0, 0);
+
+	msm_dp_display_enable_helper(msm_dp_display, dp->panel);
+}
+
+void msm_dp_display_disable_helper(struct msm_dp *msm_dp_display,
+				   struct msm_dp_panel *msm_dp_panel)
+{
+	struct msm_dp_display_private *dp;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	msm_dp_ctrl_push_vcpf(dp->ctrl, msm_dp_panel);
+	msm_dp_ctrl_mst_stream_channel_slot_setup(dp->ctrl);
+	msm_dp_ctrl_mst_send_act(dp->ctrl, msm_dp_panel);
+}
+
 void msm_dp_display_atomic_disable(struct msm_dp *dp)
 {
 	struct msm_dp_display_private *msm_dp_display;
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
-	msm_dp_ctrl_push_vcpf(msm_dp_display->ctrl, msm_dp_display->panel);
-	msm_dp_ctrl_mst_stream_channel_slot_setup(msm_dp_display->ctrl);
-	msm_dp_ctrl_mst_send_act(msm_dp_display->ctrl, msm_dp_display->panel);
+	msm_dp_display_disable_helper(dp, msm_dp_display->panel);
 }
 
-static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
+void msm_dp_display_unprepare(struct msm_dp *msm_dp_display)
 {
-	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
+	struct msm_dp_display_private *dp;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
 	/* dongle is still connected but sinks are disconnected */
 	if (dp->link->sink_count == 0)
@@ -1534,11 +1568,9 @@ static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
 		msm_dp_display_host_phy_exit(dp);
 
 	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
-
-	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
 }
 
-void msm_dp_display_atomic_post_disable(struct msm_dp *dp)
+void msm_dp_display_atomic_post_disable_helper(struct msm_dp *dp, struct msm_dp_panel *msm_dp_panel)
 {
 	struct msm_dp_display_private *msm_dp_display;
 
@@ -1549,7 +1581,18 @@ void msm_dp_display_atomic_post_disable(struct msm_dp *dp)
 
 	msm_dp_display_audio_notify_disable(msm_dp_display);
 
-	msm_dp_display_disable(msm_dp_display, msm_dp_display->panel);
+	msm_dp_display_disable(msm_dp_display, msm_dp_panel);
+
+	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
+}
+
+void msm_dp_display_atomic_post_disable(struct msm_dp *msm_dp_display)
+{
+	struct msm_dp_display_private *dp;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	msm_dp_display_atomic_post_disable_helper(msm_dp_display, dp->panel);
 
 	msm_dp_display_unprepare(msm_dp_display);
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 45e2cc2d6add..55ffa22bb233 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -45,5 +45,17 @@ enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
 					       const struct drm_display_mode *mode);
 int msm_dp_display_set_stream_info(struct msm_dp *msm_dp_display, struct msm_dp_panel *panel,
 				   u32 start_slot, u32 num_slots, u32 pbn);
+void msm_dp_display_enable_helper(struct msm_dp *msm_dp_display,
+				  struct msm_dp_panel *msm_dp_panel);
+void msm_dp_display_disable_helper(struct msm_dp *msm_dp_display,
+				   struct msm_dp_panel *msm_dp_panel);
+void msm_dp_display_atomic_post_disable_helper(struct msm_dp *msm_dp_display,
+					       struct msm_dp_panel *msm_dp_panel);
+int msm_dp_display_set_mode_helper(struct msm_dp *msm_dp_display,
+				   struct drm_atomic_commit *state,
+				   struct drm_encoder *drm_encoder,
+				   struct msm_dp_panel *msm_dp_panel);
+int msm_dp_display_prepare_link(struct msm_dp *msm_dp_display);
+void msm_dp_display_unprepare(struct msm_dp *dp);
 
 #endif /* _DP_DISPLAY_H_ */

-- 
2.43.0


