Return-Path: <linux-arm-msm+bounces-94875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WF19E3xtpWlXAgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:59:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC881D711C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:59:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB33B30936EC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 10:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A88E344DA0;
	Mon,  2 Mar 2026 10:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YfIASNqY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="foQueRih"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EB535AC0C
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 10:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772448842; cv=none; b=VMylw4JLDz1rKBsiOIhcROYLy4xvyt5leZlTS8bwxew1Kirxg9UXh3adGV86UQ1zOEX7VGsPXcthV/O/C8NrOFrLS57hL+hTyXmvG8LXnzU0oRvZLsiF4EEhdUGZwHY81VMr1vpPiR9RzxXA9q32XLmU3vTev48pqIiLZIEpsfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772448842; c=relaxed/simple;
	bh=G9K/hfUGPDsJKP/JccAN6u7KTjQnqlE1JHq0qDmAoF8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=In4qvFYOD5yN8hlLTAywCl0XUiCOvzURUdi/OO50z4BFAU7heVPyfAQlVkigorWM1YeXRWeHSWiN50NzT4o9x9HL5p/NWuW6mb+wcEBcIc4upFcAxNoyqri5BQd8+vuXIZ+VFq9zg0IcLPlcr5SsouGAgpHKq8wWq70H5aVgtVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YfIASNqY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=foQueRih; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622A91hw860810
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 10:53:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=p/JhN9/z48d
	DFlvHp8xGdUBIxR1Gv80fZSaR5kiHJV0=; b=YfIASNqYoGkQomrtKy/8g3fHjez
	ZaAj2H97xT6UjfB9cD3Fnp0GzMXuJ5Iv80IkNwePX+xWYaMUSQVhP/BLSxNVY1AR
	gtUVxS78x6jYsF8GLaa05Nkv6ED/9nVME8qA1C8lSICmfDKRaii8dQ6ObXd0JN6y
	gn9/hq+bd6Hbs1YUKhXHB7k137xtlfNmppim4u7wS4Inw8RcjQ+hrqx9N4fWE//G
	XScS2rVnBaiKWDHhDMhsM8uDUqezutrID84NUnJQvtXbN6TMhlcEAPq9j71m02Fz
	XU4Qjj8GhrCsepVPNdXC/J8aUmZiswYN8cDcSj9OUtEpDXaIpC/wWebedtA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmgbau209-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 10:53:58 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3598c05c806so889928a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 02:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772448838; x=1773053638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/JhN9/z48dDFlvHp8xGdUBIxR1Gv80fZSaR5kiHJV0=;
        b=foQueRihCGEhf7/fB946YQAk8DbyUWKLY0xy6gupbfxzL7MmUDTOSgC6ItNi5ypagI
         Sw74JFWVChvQxvY87VR7Y1lazAABtL7l/4G4rvtgXRq2DXKKpr/nLFrtAamH07hCY0xO
         VnbFz8BRb+16a1w9l2JfdtlbRpO28FARvvT+ISWtlp++Gw5WhZjHOq3QH8mTEG0CycUo
         VPnarE6R6QofLo0/donno274oAcvZtGH6kRzUmsb++i3Dymnn1NB/WFdNSEOP1QVu1G/
         2SV2dPJMagJ7c+PsPNV0ElUbsEIHa8uyDBRvN1aZ8TSZgMxsppAhEHWbX4nmqXQn/T2e
         h7dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772448838; x=1773053638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p/JhN9/z48dDFlvHp8xGdUBIxR1Gv80fZSaR5kiHJV0=;
        b=f3jqWpvmXWc1iS4+SEJwOTCRxmr2EO/sOwgT3X7AN9NOu2jZR4mv/WUyc/v/m5Aj+H
         SUyUaycVB+WkOTemVazQx9ZQeEpHnf+4VC92I3wCw1pNhERbmqg6fzFR+kyNsQwFQi1B
         vmYkO0745y7RPsp87zvqHjtYT79T0Z/kOGnuErEorygdj2tvkY1xIdTedbAFNFiOdSl8
         yalB6+uWrQhd0TReoTpo+HqAH0ayHofnPkwuxlef3A9PotC3mY0B9nNp5Y6dAqcrqy5K
         Bf0cPNdXefdGf814L70qHazpgC9dSuWg+4yGOZBbcRgBqly8RK5aSPVRU/0P07BulgPi
         VBRA==
X-Forwarded-Encrypted: i=1; AJvYcCXMs889NRG5co91RXa3AREko/lFNPBZIx3l7ruuzpldcqSHe4aVvx1TgK1eQMZrin8kEb38muPt79NuM1on@vger.kernel.org
X-Gm-Message-State: AOJu0YxuhV2BCvmRxQh9h10OA5JMZhFgQr8JRm4Fx/STJC8m5C+fy+RC
	WGAd6x2DHSTLbDBjJ3MuRo6XYVkfJOkVVTxcR6AbfOCu0DzSaTgdcVj5NhzHYiOrwb7o7YAADbD
	ZstJ2MVbYxjIfaOmldXhj1o5OFfBUfonmMytva8RgKUFKnhwu/B2vhYveOvaq6ZfIXXJb
X-Gm-Gg: ATEYQzzVdh1A3MqMmrimwX3D7664GkQOq0BNeFpCDMwzWx0n6Qn+i3cMixiMbMplBQ+
	RInNz8kbY8OM9kaGkZWSGTNPonKgNYqq9Ty+O/GRF9SuTiCesP5RHcbeQ4AMjdppiosCjcjgdec
	9fNmAlH9AbPc5DudGLehF7pZ61uw2NjVA9fE0/1bZfRz5qL2lEdv2O1hdGhqUKuZYTp/t1KQ9V6
	yfaskV+ZM+dTRjV3ApafWUVCX//yTHZES+g8A4uJtgnpOoJ9q+EpgTozxPJavAG1KLikAQkHFTC
	APIaPpHNNL67LT/dhF2voOcjRhi6MP0tEa2MpcUDcCMZb1Agk1J4xc6faHX/bmt4JnAcXrZcILC
	5NWh7SJFrwcjyabfs3fttIF2od13iOL1eP/w0/4qqEfNq3GlLqD2X
X-Received: by 2002:a05:6a20:3ca8:b0:364:33f7:7338 with SMTP id adf61e73a8af0-395c39de575mr9990027637.8.1772448837815;
        Mon, 02 Mar 2026 02:53:57 -0800 (PST)
X-Received: by 2002:a05:6a20:3ca8:b0:364:33f7:7338 with SMTP id adf61e73a8af0-395c39de575mr9990008637.8.1772448837260;
        Mon, 02 Mar 2026 02:53:57 -0800 (PST)
Received: from hu-kshaikkh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa632ddesm11847479a12.13.2026.03.02.02.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 02:53:56 -0800 (PST)
From: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
To: mark.rutland@arm.com
Cc: ada.coupriediaz@arm.com, catalin.marinas@arm.com, dev.jain@arm.com,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mhiramat@kernel.org, will@kernel.org,
        yang@os.amperecomputing.com
Subject: [PATCH v3 1/1] kernel: kprobes: fix cur_kprobe corruption during re-entrant kprobe_busy_begin() calls
Date: Mon,  2 Mar 2026 16:23:47 +0530
Message-Id: <20260302105347.3602192-2-khaja.khaji@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260302105347.3602192-1-khaja.khaji@oss.qualcomm.com>
References: <aZSdkGjy2BXUL0bT@J2N7QTR9R3.cambridge.arm.com>
 <20260302105347.3602192-1-khaja.khaji@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4OCBTYWx0ZWRfX6R6s41P05yY1
 iNhg/YNkxLKecPGMCo0XJHE3aEPmZNsj/UQeLUU0DqWdzQHym4BZSUm4utKh2ICVHOZP+BArxhl
 VzrBwyOD487uKx5ke04tJNQu3rGxuDaKDMfdgf7z3R4QJjN9XcEie/hm9DSU/WwSvFtvjQscZnd
 8D4w46P3Yf8KC9oILpM1fElW7KNyVnVq4Y3GPEn56bNnyA53IKLuZmeyEUc+Uw06kAv9HRd9Kh4
 Umfq0bKeFzEeqqU5EWbeT3O601YtjFceNphm4wG4+6Pm0K3BEnAR/WifOPkudVBGnkb8wwJr/vX
 4Q8A50uEErU9ZYfUGUz6D5GwxNE+NHcW4BPL16tZGQxQ1Xad+BiqYoJLVWTrN3S7Uk/UydSAGvy
 mKlXNBayUoc9IWXJeJkCT9hzY9wQ6c95JSI9OpHyz7i6PpI5IMVVYXqbtLjRa0h+W4yGk8sUfL3
 Ybt4vRd61OShl5SpsQg==
X-Authority-Analysis: v=2.4 cv=QfVrf8bv c=1 sm=1 tr=0 ts=69a56c46 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=7l7XfnHKCA38VmfCrlUA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: nomPV4HQEK2psXrixF5Yl8579rx3isz2
X-Proofpoint-GUID: nomPV4HQEK2psXrixF5Yl8579rx3isz2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020088
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-94875-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khaja.khaji@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AAC881D711C
X-Rspamd-Action: no action

Fix cur_kprobe corruption that occurs when kprobe_busy_begin() is called
re-entrantly during an active kprobe handler.

Previously, kprobe_busy_begin() unconditionally overwrites current_kprobe
with &kprobe_busy, and kprobe_busy_end() writes NULL. This approach works
correctly when no kprobe is active but fails during re-entrant calls.

On arm64, arm64_enter_el1_dbg() re-enables IRQs before invoking kprobe
handlers. This allows an IRQ during kretprobe entry_handler to trigger
kprobe_flush_task() via softirq, which calls kprobe_busy_begin/end and
corrupts cur_kprobe.

Problem flow: kretprobe entry_handler -> IRQ -> softirq ->
kprobe_flush_task -> kprobe_busy_begin/end -> cur_kprobe corruption.

This corruption causes two issues:
1. NULL cur_kprobe in setup_singlestep leading to panic in single-step
handler
2. kprobe_status overwritten with HIT_ACTIVE during execute-out-of-line
window

Implement a per-CPU re-entrancy tracking mechanism with:
- A depth counter to track nested calls
- Saved state for current_kprobe and kprobe_status
- Save state on first entry, restore on final exit
- Increment depth counter for nested calls only

This approach maintains compatibility with existing callers as
save/restore of NULL is a no-op.

Signed-off-by: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
---
 kernel/kprobes.c | 34 ++++++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/kernel/kprobes.c b/kernel/kprobes.c
index e2cd01cf5968..47a4ae50ee6c 100644
--- a/kernel/kprobes.c
+++ b/kernel/kprobes.c
@@ -70,6 +70,15 @@ static bool kprobes_all_disarmed;
 static DEFINE_MUTEX(kprobe_mutex);
 static DEFINE_PER_CPU(struct kprobe *, kprobe_instance);
 
+/* Per-CPU re-entrancy state for kprobe_busy_begin/end.
+ * kprobe_busy_begin() may be called while a kprobe handler
+ * is active - e.g. kprobe_flush_task() via softirq during
+ * kretprobe entry_handler on arm64 where IRQs are re-enabled.
+ */
+static DEFINE_PER_CPU(int, kprobe_busy_depth);
+static DEFINE_PER_CPU(struct kprobe *, kprobe_busy_saved_current);
+static DEFINE_PER_CPU(unsigned long, kprobe_busy_saved_status);
+
 kprobe_opcode_t * __weak kprobe_lookup_name(const char *name,
 					unsigned int __unused)
 {
@@ -1307,14 +1316,31 @@ void kprobe_busy_begin(void)
 	struct kprobe_ctlblk *kcb;
 
 	preempt_disable();
-	__this_cpu_write(current_kprobe, &kprobe_busy);
-	kcb = get_kprobe_ctlblk();
-	kcb->kprobe_status = KPROBE_HIT_ACTIVE;
+	if (__this_cpu_read(kprobe_busy_depth) == 0) {
+		kcb = get_kprobe_ctlblk();
+		__this_cpu_write(kprobe_busy_saved_current,
+				 __this_cpu_read(current_kprobe));
+		__this_cpu_write(kprobe_busy_saved_status,
+				 kcb->kprobe_status);
+		__this_cpu_write(current_kprobe, &kprobe_busy);
+		kcb->kprobe_status = KPROBE_HIT_ACTIVE;
+	}
+	__this_cpu_inc(kprobe_busy_depth);
 }
 
 void kprobe_busy_end(void)
 {
-	__this_cpu_write(current_kprobe, NULL);
+	struct kprobe_ctlblk *kcb;
+
+	__this_cpu_dec(kprobe_busy_depth);
+
+	if (__this_cpu_read(kprobe_busy_depth) == 0) {
+		kcb = get_kprobe_ctlblk();
+		__this_cpu_write(current_kprobe,
+				 __this_cpu_read(kprobe_busy_saved_current));
+		kcb->kprobe_status =
+				__this_cpu_read(kprobe_busy_saved_status);
+	}
 	preempt_enable();
 }
 
-- 
2.34.1


