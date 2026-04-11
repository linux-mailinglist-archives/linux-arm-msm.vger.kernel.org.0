Return-Path: <linux-arm-msm+bounces-102771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBNLEmwD2mlJxwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 10:16:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A97883DEEF1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 10:16:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB75730875DC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 08:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BC9B3346A8;
	Sat, 11 Apr 2026 08:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HCzFYd9I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OIM35oUW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EFA336ECD
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 08:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775895152; cv=none; b=gBlXFM7AvKtCfQXxmP1fPZEsMa+7j/6ffhSYF0lm7wFdoasLyuTcm/k0OFiEC1kywklDwnp9XNEucrnHYBzgtQwH4WGtoIEGLraQko2ycf0my2XBA8CcrSdyAEzQa0unbMhR7mrJfCMY1AG7BW5HV16WlSFA6KjsRq5/3fHb+ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775895152; c=relaxed/simple;
	bh=MA03LnHAjOcvrM5mKxM9VHVgHQ54gpGwmJ8aVHg0TVc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EbBg5eJ18LvaCD29VkltXoMD04aWEEfcpF9C4odnopRWrNfmgUfzKeGVNhGSKN2YLlgM/ta0D8w98FMrP8H/EfcfFXpQ0p09BPZ130UZT8/4WarUvI6OXkFdTGcreqnDQWEKftldVkIhAZxr18j6wxVIk4DUkx58Hd8Au4xvZR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HCzFYd9I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OIM35oUW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B47qf51200725
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 08:12:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XQs3/vhNVlE1qEYG7AJugEMA0XRV65iB16Q7DxAeW+c=; b=HCzFYd9IdjJUvnub
	/l4LSzoGQC94OgVWsKijUENulihc/wYEv317r9t9OCjc4r/1p+mlI+Xb7QBwSMBs
	aAuPgs1vNcjtqpoqmBrp87WdNMpMgI9L0tgZIeRL+tokyT0FTKwuoXjXjHLBmWw4
	6eyc28zMijgGPVUpFKsr4C2wlCanAyn1kOLyevKrXCmxiTT6Kj6m20kV9z4HPFnn
	dP3xUZkfIHK611kffqMLjTa8gMZA/QK3b7NyDZps22NhA9v1RTkZVB1SFGcqRcDK
	wuuDtWEWX2ofV6eNrrAjp4M3OgkskeDMR/9a6N1TCVyd26DPcuzVhMFbRPyXqwaI
	c5Eiew==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff0jrbvx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 08:12:27 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82c1e1a6cfbso2086355b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 01:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775895147; x=1776499947; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XQs3/vhNVlE1qEYG7AJugEMA0XRV65iB16Q7DxAeW+c=;
        b=OIM35oUWKTtUBCen+Ro0nDFrtCaXoVHVV89lBj2eqVZ77Ll+6nUq3zibg7jEzmcMHg
         yeGZy2klsSMUpg5uHf4kpPzFlZOtJ7DN2UXeMFNIuJOFbvCq44mGasP6ydccRfTTv8xY
         hYdZP3p7WQbYMbBQAJJLqk2+bAU3KhdV8/fgSsxcthtKSlRyoADxRs7/u1/8eWDMuYM+
         PQ2TqtvcyeG8qWvUbTmA+DFy42Kmar7h8bvjhvZMht3QrQk4aYZGKRKTN4HG8a4+1VFU
         cqO/HNzCXoRvgz6vy1ZTIPTJcVcdGvC+y1nawzEO/0Czb5kbOeGg/U519dSEeIom1idK
         /XyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775895147; x=1776499947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XQs3/vhNVlE1qEYG7AJugEMA0XRV65iB16Q7DxAeW+c=;
        b=pHBGF20s3+Ylpxl5AkVmRyix28GHZTk1jSop0THK+fPjHMhGAamGy5DmAeHbW+b/2/
         PNbNS/q+Rk3tCBQTrG6q2Cbq29ypd+uC/flBUYSEpMTObOIshfzQPuH/H1BY9TjFH48p
         ncOaAp8tF84GdWCjO0sLoaAYbcvF7aIb1v3jY4861gsOMDAunq6fjMuVTMui0TfdamJv
         WXIxm8N0r1wSHQde1LWAKvraGhRZuo1dSJ5Dgi+JfNxfgvQzv8Uqub237agyJxm/rwUS
         aecsQ4iS2xSMTgFIk72CVSgp/z2/9mvMzSLwAOeBcGEpP1UH7RVBNqghnvk7kYlG1TWC
         aAyQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2c8Dbr/CTNvtf0Youw3EFGd5WCCDG+bujMyNI8WVfadvFhnPL5HicriT+E1lJ7nZvxyzt2jPyvi87PiVC@vger.kernel.org
X-Gm-Message-State: AOJu0YwFqaAMste7Tkc8WJsvsK88OTfZezMdcaEJWpb8iMwFr7z6e7Tn
	Yzkkdp9CgPmotX8YF2/Wk/MKxq3q4KPUR1hD8KPCNhN4PwwNV30BTD7ELGApBvzrFDi/esN8+aw
	nuWaGgSp8zUsmNv4YWvSdgypA2oddPUVu4kyCIz/P9bV5/xIPDzEkYa+SDdPJykzjrYYo
X-Gm-Gg: AeBDiesvNNW3G4W8DtNz7klV72XkB6FYmhplXBjjIwyG31zO8qbFcUmNtfKpoI7qBQh
	R2oRQXK23BMKil3yBuzbW/fsvzyofq8Wrrid49PsIK3AxF8kqz9hOJyBtLL/5zfuPecwSOrZfbr
	qRXwmJr/o5GV5JGQMbE0BlzeTD5mkOBtyCKYqJ1j5dM4Ty77AGoqafmFgOcw1TrpD8j7PK++Qx3
	CCIlgtHZK9cAG/mXfgcRDfycH+qYwRR61ibLiP2leWWnFTm9NoCdo7KUZyKGZibeQZ9CJ/E1tE4
	TKDPF8yZJpbfinptYIgeQMpdZuS7xCbksLalRuoAw7sVTKoD318R/CDAFsXm82xxTgJnLG2dS/9
	qrAiplQ4rUatilZk5OXTUVJcd0YV3zNxeq5S9p9pIaoAKu9ZjowmNx+Dh
X-Received: by 2002:a05:6a00:140e:b0:82c:6f07:2d8e with SMTP id d2e1a72fcca58-82f0c411dfdmr6928555b3a.54.1775895146569;
        Sat, 11 Apr 2026 01:12:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:140e:b0:82c:6f07:2d8e with SMTP id d2e1a72fcca58-82f0c411dfdmr6928529b3a.54.1775895146067;
        Sat, 11 Apr 2026 01:12:26 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c30ee4bsm5410996b3a.2.2026.04.11.01.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 01:12:25 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 11 Apr 2026 13:42:05 +0530
Subject: [PATCH v2 5/6] bus: mhi: host: Update the Time sync logic to read
 64 bit register value
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-tsc_timesync-v2-5-6f25f72987b3@oss.qualcomm.com>
References: <20260411-tsc_timesync-v2-0-6f25f72987b3@oss.qualcomm.com>
In-Reply-To: <20260411-tsc_timesync-v2-0-6f25f72987b3@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775895126; l=1869;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=MA03LnHAjOcvrM5mKxM9VHVgHQ54gpGwmJ8aVHg0TVc=;
 b=jRgjuD5LRCxWLZfAioVQJ+gfVkC0jXv7TrTMQtg8I15aCDEKaPfgMlt6HH8QUZOHDugyF2Quw
 UTTkzywMCFoD76x0XNp5OUWSL/sdKmQAZJK/Q/XW7dcwm+ohDWcxI1/
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDA2MiBTYWx0ZWRfX5fLhzQzVYs+I
 KmPoIBs2J7cmigtr23Dqr9ynzFDJumitXnb2AFsm2xd7+d+Lhb/7cPGcbRttQ/RAgif6mCpkz18
 mwvm0sajuLgOF6nHUic/WZzFHhoVduXbU3HUygNTg4B0egJj49ypPC09meGo36jkhYGO2qcvj3H
 fLBPnSMVd2mUVFjzH2SHtcA4QvCqph8CZHKBG0vqJDvkSFW3haGtC7n0I+QQZCjhi9VnBd6T0ue
 i8qcm/g9PZmnaV6CCJQXcWTLLuaR0sJka3DT4LLu+0AiboCA1Qx8eg7TJZg99t1RPPcvN362YWp
 DtIEFzHpVLu0MdQDB2ggPz8fuu5agh2DqgTF+HX7qW9vwATv+KTIgnaUF5yHon/YIPojKn9UhVS
 b61BHH416vZmFcChJWeINQxzU6i0YHZshmgI9DsgFkV8K4NV9jP4FsQvzsnh/ySzI3b3Rkmcigz
 rDiC+IQnMPWK7HMlNuw==
X-Proofpoint-ORIG-GUID: 52ULMz2KaUBx8bAO_c0cQfAAmGx9ymC8
X-Proofpoint-GUID: 52ULMz2KaUBx8bAO_c0cQfAAmGx9ymC8
X-Authority-Analysis: v=2.4 cv=d/LFDxjE c=1 sm=1 tr=0 ts=69da026b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=51wy-JC9mB198bzmU4IA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110062
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-102771-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A97883DEEF1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Instead of reading low and high of the mhi registers twice use 64 bit
register value to avoid any time penality.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/bus/mhi/host/main.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 99917593e1da06f1dece7b5b0037c2485953410f..e853419a0195dff4a18123631cb1f74242ab4428 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -1643,6 +1643,7 @@ static int mhi_get_remote_time(struct mhi_controller *mhi_cntrl, struct mhi_time
 			       struct mhi_timesync_info *time)
 {
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	u64 val = U64_MAX;
 	int ret, i;
 
 	if (!mhi_tsync && !mhi_tsync->time_reg) {
@@ -1680,15 +1681,25 @@ static int mhi_get_remote_time(struct mhi_controller *mhi_cntrl, struct mhi_time
 	 * transition to L0.
 	 */
 	for (i = 0; i < MHI_NUM_BACK_TO_BACK_READS; i++) {
-		ret = mhi_read_reg(mhi_cntrl, mhi_tsync->time_reg,
-				   TSC_TIMESYNC_TIME_LOW_OFFSET, &time->t_dev_lo);
-
-		ret = mhi_read_reg(mhi_cntrl, mhi_tsync->time_reg,
-				   TSC_TIMESYNC_TIME_HIGH_OFFSET, &time->t_dev_hi);
+		if (mhi_cntrl->read_reg64) {
+			ret = mhi_read_reg64(mhi_cntrl, mhi_tsync->time_reg,
+					     TSC_TIMESYNC_TIME_LOW_OFFSET, &val);
+		} else {
+			ret = mhi_read_reg(mhi_cntrl, mhi_tsync->time_reg,
+					   TSC_TIMESYNC_TIME_LOW_OFFSET, &time->t_dev_lo);
+
+			ret = mhi_read_reg(mhi_cntrl, mhi_tsync->time_reg,
+					   TSC_TIMESYNC_TIME_HIGH_OFFSET, &time->t_dev_hi);
+		}
 	}
 
 	time->t_host_post = ktime_get_real();
 
+	if (mhi_cntrl->read_reg64) {
+		time->t_dev_lo = (u32)val;
+		time->t_dev_hi = (u32)(val >> 32);
+	}
+
 	local_irq_enable();
 	preempt_enable();
 

-- 
2.34.1


