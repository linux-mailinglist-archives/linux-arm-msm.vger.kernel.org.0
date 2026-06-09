Return-Path: <linux-arm-msm+bounces-111997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HFwAOuKBJ2p8yQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 05:00:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F3465BF1E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 05:00:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QT6cHTm9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jkrHqh9w;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111997-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111997-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C983230B225E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 03:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C31E535F19B;
	Tue,  9 Jun 2026 03:00:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D48C35F8AB
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 02:59:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780974000; cv=none; b=nvXiOmj1Nk4eLD1IpDX5t9vhnBsOS/3ADiFQeKaEj3NPZCajr8VTrhnCFYCjrPCGuu1oybdJuyrKTsbqRDBfRWN4mbRXGA5vnTVdklEhijYUa5ox7ZXfhzKOkzRoxIzWeV5E1NSLbeFYoQVk0ke8FM8ZoSjEFsA5aCcDzCAiTgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780974000; c=relaxed/simple;
	bh=J9nj17thOlGzPahnaTqDVNfO8rb0kLcDs2KR7R3KsRo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RWZJYdCQUKJWC54oqkCa8zVI/byyovw/Tv1fKnqDaROA1Xwy2wQ67qjhAbqxA0LhTbgdjHZZcWnZdgMAHm3pnVfzpK7WRjTTG4vBymVPOM1N0eKRrb9E6t4wxbN3UH6n+i4goKGRRsEhDjUmMlfQ/A5MXyZppHDlTaXK4hpdY1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QT6cHTm9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jkrHqh9w; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6590s9iJ996002
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 02:59:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ElYvFMoGdW9
	Bjq7mp/Mwc7VFbd+iwp1MQ9hRnfKtsl0=; b=QT6cHTm9kd3vTgLWiwXDjrQp42F
	vSktu05K//kW+kT1GQCCh2KF68IvTIaBW/boH+OYex8ZDklrq7be68h2kRVZAryw
	8uKlYYZVneuNsgAWTTwW/5VdEyVUlChbosaPTY+SJOQqYX3A+NQAq19z4tJ8xrWk
	5W+AeN/0tOI8rFqzWDwS4XyT6dpjfkAbxqY1Jt1ywSJo6fmQjKaPfE+frkxRJl+q
	PZ2aTgYrQMSXVLvy1nZw84HI334Mi4LPHv1An6rbNBg8sCsdl64D+3bbna1dX5fe
	aYKpDryfpYyJCKGSviwSrXP0tT6iSYfpq6r4KR3DjnuRiyD0jCt+Vg1I+Qw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enx2rudyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 02:59:58 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36db995d083so3518525a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 19:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780973997; x=1781578797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ElYvFMoGdW9Bjq7mp/Mwc7VFbd+iwp1MQ9hRnfKtsl0=;
        b=jkrHqh9wl0g6s1ZYoMBmbUUCG1ldwXg3Oj8bDraUCh0zGqF+V68g3jnqwqA1ZCfsmh
         iyKpuIFoQM8k0sF2IUEdgxoe6mP0iv7JkHwmi7Au5WetWEIQTDqIAqXLM5I0GHpfb/nT
         lz5qv32jevhcACBm0d+01/vgaR+zFmBhiHiSmBZAmVkQ3zs6nBoveU/f/n1aTAFjSfKI
         i6eX5pohvxX2PNano28xlus01iY8Cgnx9vwilVM6vxWc04NX4ZIe7ZaWlvbWz1mPATKh
         OaKtI0Z8gQog7ftp+qxnzIOL1hMyqNK2W3QLcrLRZvqSh/T49djd8pO8X/iClcOQrhsr
         8hWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780973997; x=1781578797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ElYvFMoGdW9Bjq7mp/Mwc7VFbd+iwp1MQ9hRnfKtsl0=;
        b=nZimc7rMFP2NPNNcxwA2UCfbmLjuaFHXPuKcoOzyYjB0ZXGxCqCZkQh4APS9apA02p
         UviMzcKrpRcc1q+OEt2xwLpyAqNMMnBDOa6tQGVpDtsHS9bGSe//ZTri3b3eYYBaV3wN
         jvSpOLpBe0AuODTSI10hdqAQfcOXOvUayr1UJlsWg3Uuba2An2akiRudN87XgdbAgD49
         OAznH8Q7PLPNloYCbl4l197mtGjVwNTJD1jzP/e054Hsx3FyMiPQ15qQ0aqhNhO3OD6Y
         N8mt8oo5mVog1rWGHy2y7jSeW8gkDfJbm4aJJP9XEQi6kTr5sFF2Prv2Yo8DzgPrzu12
         4D1A==
X-Forwarded-Encrypted: i=1; AFNElJ8GvQvioIYHBKorboc4yotBm8EVmd4qW/NtA4FJvF2y75u1QyskdBtRVEPriWO4av3dB2daPoOafcL3NGL5@vger.kernel.org
X-Gm-Message-State: AOJu0Yzja0Z3KRIybzPrE1bjVq1gPNgnjkUJYnXe9m0ECUuMTjzUZ3HZ
	fdD99tOri+v6H7rvnaJzLXe5uVSCPgeyRB0kKefv2LPVJMyQxZ/GILp2qo4898PYSEdGHyStDA+
	pobtWdci0dvyt/H4jRWhwdKRsOdUJa1BeR0Ytqx0Y3WEkiY2Y5rjhT7SozQbiw7jVypfA
X-Gm-Gg: Acq92OFMBFLdf825qVON4b/X0A9Hj9uHfhfGvO6BybdDKsrZ7//0CIPSABju6iOorlZ
	Zug+AeV7p1aQS6J1qp3lpIRkdkdMCCQ0eWKOV2o5TDMox+adpaJSqB3XdfwamvOjEaEGwGQFH9k
	T5DRoGtECYNCpfeM/xZN3yuGzduiqWOaw4a+Cih152Eb/f83xsKjNZC0e2wrLMJsZA3Tl53XvCu
	b1z3ILgawby2E6hgvd+Ws762c2NBkgHHLCk5vUNwc66YruH5Z5UvDuL0y7zk+yFG3m7haJJyURb
	FTBR5I3TZo/UZpc4bKaIQmQYsV3Rr9BfgTQxxLzWd8DThp6vcS6yfQ31KkVDl+oFUtZ8Fi//IDL
	/ah7OGqgy+2V6O3C6j9+lZz6NYMjRbs84DvICckki9OhGAIV9Qca+PzRkHFYCySWHokJ8DrkS5M
	LyoxffAzfdGf8w4+TSnhke9Ly59SY4
X-Received: by 2002:a17:90b:390e:b0:36b:9835:cf96 with SMTP id 98e67ed59e1d1-370ee643691mr18535145a91.2.1780973997382;
        Mon, 08 Jun 2026 19:59:57 -0700 (PDT)
X-Received: by 2002:a17:90b:390e:b0:36b:9835:cf96 with SMTP id 98e67ed59e1d1-370ee643691mr18535114a91.2.1780973996941;
        Mon, 08 Jun 2026 19:59:56 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3712fcb2607sm8713835a91.0.2026.06.08.19.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 19:59:56 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        stable@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jianping Li <jianping.li@oss.qualcomm.com>
Subject: [PATCH v8 2/4] misc: fastrpc: Remove buffer from list prior to unmap operation
Date: Tue,  9 Jun 2026 10:59:36 +0800
Message-Id: <20260609025938.457-3-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260609025938.457-1-jianping.li@oss.qualcomm.com>
References: <20260609025938.457-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5LvKgLXe4OTe0ZOIRdBe94pbBWvQK-FX
X-Proofpoint-ORIG-GUID: 5LvKgLXe4OTe0ZOIRdBe94pbBWvQK-FX
X-Authority-Analysis: v=2.4 cv=JdqMa0KV c=1 sm=1 tr=0 ts=6a2781ae cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=8ZZxLbFAX5vHFMKIXQAA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDAyNSBTYWx0ZWRfX1C1d29tuGHMn
 ApAmJhsmPkMXSR7GW4frVrlyhHrsi3t454lfUFa1CVrrQyqcUgCDTMF1I25GuImaSD3dDbzE3Is
 SKmfi63j+kfP3E8va58h5d0ddQ7zb/zcQ5QuRdtaruRJ0MkgfALUXqgSQQymZ0fV1bwA9B8U3d+
 wW6Xw5TlzLRckDDODj+OOb3KgRnsGg6gEUgxJHCohC7ttlpIlkFScPgIpwKIfR1A0/hihCPfA+9
 5z1KXjAyI54IILgFV5686rUiWOajnEQfn6VBwNs4OLLLV7Uo/vtK12UKCTHZyHWAiLSLl15y09g
 NNBSSQQDrq/lM20F2UQT423dY6pwq9MqZmrHUd4h4UwimEw5jTdbLqeTEFpufOI277XXoYblCdk
 3wQdoKEp5j46G6Sm4LUl9yAMa4iIMeOZ85rOuad7hSIXYbRp3oV2j/fF0jOS0xz1ddIw7H20TdU
 p/n0NcyoQ4JtoJhjl1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_06,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090025
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111997-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:ekansh.gupta@oss.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:abelvesa@kernel.org,m:jorge.ramirez-ortiz@linaro.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:stable@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:jianping.li@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 66F3465BF1E

From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

fastrpc_req_munmap_impl() is called to unmap any buffer. The buffer is
getting removed from the list after it is unmapped from DSP. This can
create potential race conditions if multiple threads invoke unmap
concurrently, where one thread may remove the entry from the list while
another thread's unmap operation is still ongoing.

Fix this by removing the buffer entry from the list before calling the
unmap operation. If the unmap fails, the entry is re-added to the list
so that userspace can retry the unmap, or alternatively, the buffer
will be cleaned up during device release when the DSP process is torn
down and all DSP-side mappings are freed along with remaining buffers
in the list.

Fixes: 2419e55e532de ("misc: fastrpc: add mmap/unmap support")
Cc: stable@kernel.org
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 96961217b856..517884000331 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1889,9 +1889,6 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
 				      &args[0]);
 	if (!err) {
 		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
-		spin_lock(&fl->lock);
-		list_del(&buf->node);
-		spin_unlock(&fl->lock);
 		fastrpc_buf_free(buf);
 	} else {
 		dev_err(dev, "unmmap\tpt 0x%09lx ERROR\n", buf->raddr);
@@ -1905,6 +1902,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 	struct fastrpc_buf *buf = NULL, *iter, *b;
 	struct fastrpc_req_munmap req;
 	struct device *dev = fl->sctx->dev;
+	int err;
 
 	if (copy_from_user(&req, argp, sizeof(req)))
 		return -EFAULT;
@@ -1912,6 +1910,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 	spin_lock(&fl->lock);
 	list_for_each_entry_safe(iter, b, &fl->mmaps, node) {
 		if ((iter->raddr == req.vaddrout) && (iter->size == req.size)) {
+			list_del(&iter->node);
 			buf = iter;
 			break;
 		}
@@ -1924,7 +1923,14 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 		return -EINVAL;
 	}
 
-	return fastrpc_req_munmap_impl(fl, buf);
+	err = fastrpc_req_munmap_impl(fl, buf);
+	if (err) {
+		spin_lock(&fl->lock);
+		list_add_tail(&buf->node, &fl->mmaps);
+		spin_unlock(&fl->lock);
+	}
+
+	return err;
 }
 
 static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
-- 
2.43.0


