Return-Path: <linux-arm-msm+bounces-114598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JOZ4GmsNPmrZ/AgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 07:26:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C976CA570
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 07:26:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=isBRxxXH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AWPJwt46;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114598-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114598-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8AEED305FBB3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 05:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF00439E178;
	Fri, 26 Jun 2026 05:20:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5243A7D78
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:20:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782451205; cv=none; b=pOeIwdw1fXmWsbL5wElfyQuibwlIK8xH6TIsk0NI9d1+3jdx5CHN6C6qNNvZlZxBZlj2wUYUdyoMhHoly2xv2vc5lVQQR5mCUTcVappMQNNwWOm9JQxUUyNhX9JE7IX9F0kxlLZtTZY5J2Lj4kcjJCRt4kBdKKhvlGDsa6/OKLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782451205; c=relaxed/simple;
	bh=UClJ5eXS2m0FRvLY29NXZUCpauTf4W4y2CWIGqUPbgs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S4GjA5PCs2flCjjtUQ+fHpAQ/HXlqJTV4nl1ritszSphoF2KplefZWjutm2G91NAnImbyY515PlOaWu5Tysa5eZzqoK3XOI12k+SGV/95BqtmxTXr6fDRiZWnKJL3UIn81hKYyMTILgam7H7DF+W8ZWZ1mXy8uZDFn+hRYJ7oxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=isBRxxXH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AWPJwt46; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q2jB203734523
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:20:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MrKfNX4GSc054ZzYRhPbAU2c3Dx5iXaNm/R6/b5iQu0=; b=isBRxxXH58/W8qhG
	J4u/zr4fhvmFcltDOqqlKizZEaYC/431/E1U01FhrwLSjRTcgP8dzzGVAok8ODpR
	AjKC8hc04dHjtnMsCGI9nujGfy5af8G5HkwygVKVK3kiPHFcxPrMu9Gif6h7Izdo
	djEMTDIHueXx/H1ozzBHvNdRDbFCDPJb5pWCK3t3xwca5MTqgOalJAnDHuCMUt3J
	BffDupr8NpxThsPE4D/BR406z/JyFJHGQPRFUIGAD3/5rzMwOBZ+6fYFY5qXNi3c
	9yyTRolfjczM7BnhjCblMnNPLF6oeDlZ349zz9FTrmBFmP4jNKcLUYoBcTCyyCfQ
	8K8oNg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f16ukb2na-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:20:03 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c93c21752so54486eec.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 22:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782451203; x=1783056003; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MrKfNX4GSc054ZzYRhPbAU2c3Dx5iXaNm/R6/b5iQu0=;
        b=AWPJwt46QFPJp07JQWmLrLGCT+dr7+zWeZR9WfYNciizi9NR1F3rV4uqQgL8kxKnxw
         8IebQcYJaNOXeasrsHcKpdhWOwSZk+9uL05lVQp4gQ//doM8hjUjQZJT6pWGa3lNBeBR
         0whgw5jrdtTyVRrvh50UFs26tPfoo72kfmY1pDL4GUJI1X3Z5jXIemPh9rd1iMgWUTI8
         dusANjNwm8jZkS6zVGERVOZNUrl5lwQwOc90apuvlpq8darwd/M2pL+Y5wzp2Zb70Kh1
         619KbCD+4BmZ4olxaesoWHnoNaToqEni5fhyG054zd1NgXvUzrDGCpbEM7eGjI0eS+D/
         PuNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782451203; x=1783056003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MrKfNX4GSc054ZzYRhPbAU2c3Dx5iXaNm/R6/b5iQu0=;
        b=eN/kvNZ+eXSPlxm9yyavWDj60fiJtULSuB/Gd2+DhykKLPWz6g7xHoVBhiF9/x7G33
         f3nu5GD7Kcq8jNugvP2neCzBHzLCQ0eOxkOhPyMQmH7w0QxOr+5lfyzHhX8XUpiA9C9m
         wZHk2dUghxlGu9bZs/2lDrT5IMraGQHqbaZC3Knbw0xaHRB78Oi5C7puFpxnblGVuaBd
         CXd8r2EfUPWikPsRn1XhSfDvgQy9S97AS96NcNsPzL2Ux4IOLOqM9EUCeN3mMdzD001M
         lsJQP7fbc8MLAynmG/Rx8vxdDskKkecFNzqGvtvEKspdt/FWPOEx5O59F8x5MJxkG5oJ
         WCFQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqv1gvWA4htt2D4cBafIRfiSQIAXIWFE5O6Z3PM3FT6JRUg55r0eFXdU7oibMOoJ28R1fwqH1aG38/Q4nvh@vger.kernel.org
X-Gm-Message-State: AOJu0YyJrCv1NsdBvAhP2Ofp9/VinuQ3EIZrDdZG2xcpIvPkLjqAzKbB
	2HuZBo15uHqNiII1828JBoZW3ofvU8FKrDgBjZ2yJGs+XAInQ5hbpMcA5b9XZmlniB70/BQHNJ1
	GiZILkrz0v6x34CDASwvb06xROqm8pA7wAQThWwtf5UQuZ0q/pv05KdDEjOJxt/kXF9B5
X-Gm-Gg: AfdE7cnTG+HaU4ZdPhi0wTo6+stCXwu0zH53nCoPb8pQMEp34X7zkcVXHrNB7yg6ywI
	0xTWBHg95f0tIFFDy/AqDN7LBdAlmheN5n5n55wbf56RLwkV52uW1dcV7z0jnn00HBTOCGVyYyr
	moQafcb3RRTFX5/4SXWpOBdffKSt+xgpPfd3hRnw7Zae41aY4MbNEfYBFz+a72gdcJj/avokDY6
	LVPqX+rBV3KfUnC1LN6Gmgf5n0Ra/QsbaKNpyY9YFow29q1WJC+JSmwW1JHb0tgGOZDfE8WTQD/
	6v62gNhcxjtqBu2IwDRPCKQETRIvklG86iMHVNtqcMm+psYDyDqYHhMi56TKwXThUgvipR1AEJc
	4ln+FXBl6iE+0RFiJS9+4uPoFAExgVlrRP5xgm7J1p2iKiayHdb6z2QPbWg==
X-Received: by 2002:a05:7300:6144:b0:30b:c021:5045 with SMTP id 5a478bee46e88-30c84ce60f7mr2112617eec.5.1782451202843;
        Thu, 25 Jun 2026 22:20:02 -0700 (PDT)
X-Received: by 2002:a05:7300:6144:b0:30b:c021:5045 with SMTP id 5a478bee46e88-30c84ce60f7mr2112610eec.5.1782451202274;
        Thu, 25 Jun 2026 22:20:02 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4ca240sm14345291eec.4.2026.06.25.22.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 22:20:01 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 22:19:55 -0700
Subject: [PATCH v2 10/12] Bluetooth: hci_event: Log error for HCI reset
 status error in hci_cc_reset()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-bt_bugfix-v2-10-93396a6f7d5e@oss.qualcomm.com>
References: <20260625-bt_bugfix-v2-0-93396a6f7d5e@oss.qualcomm.com>
In-Reply-To: <20260625-bt_bugfix-v2-0-93396a6f7d5e@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Ben Young Tae Kim <ytkim@qca.qualcomm.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Tim Jiang <quic_tjiang@quicinc.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        linux-arm-msm@vger.kernel.org, Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=VuMTxe2n c=1 sm=1 tr=0 ts=6a3e0c03 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=_kdk9pxaj2Ve_5tGLFAA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 7ubfDnl-1RMh4rk9WMlA_hJT9FJsPtEB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA0MCBTYWx0ZWRfX7wCUlMnWatYu
 s6m60eCYS7f/y/bFDRR9yNURndqBsMJnwa7iMdc521FuWyuDnEq5hzlbGzFpuQHQ53k1DWbin2X
 taIOjXWA8xaI9sOBnfTXa25TL2unmDqGquQECclD+Cr0qhW+3Z9VJM5CWsxunZj71S/roCr5R1+
 AtLO1BQiuPJ6ZDByR9YySyEwmxaGQhNrf19x2tGX67aDJLUX1A6yZaC/Un/IhjsChkiQZ9xte+P
 PvPZa0GgMUZgmMcbTE4rPf7HflRmEincv0auHaHYNwNpyEkCtpcEiUujg9NTxUAbb5JguVCVUnu
 LVQ5wypuDXE9JupwzqFAnUc0GEfAc2pXYTzslB+w34DRntBAOaJ+Ojlod+yHKnE6pwnd/pqIVd1
 agAPA4LHXpmnVml1AXOmEUj3YZp3ziR5qb6xZKJ5wxJ44CxRaQtV+bMViGBfB+HtwzNflocjmaV
 aocbnZDZ5ESusBn+2/g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA0MCBTYWx0ZWRfX3Ej7mYyt8GUH
 9U9oqmEdB6hSd9dSlkK5AS5Lec7P+X3jSDyhqPRt2/xF5o+kt64CPHjqXEKDpgHobbiSOdpcaKr
 2+R1Vw4p2Y29znSD7DkvRC8h1cIa56A=
X-Proofpoint-ORIG-GUID: 7ubfDnl-1RMh4rk9WMlA_hJT9FJsPtEB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260040
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114598-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_rjliao@quicinc.com,m:brgl@kernel.org,m:ytkim@qca.qualcomm.com,m:quic_bgodavar@quicinc.com,m:mka@chromium.org,m:quic_tjiang@quicinc.com,m:zijun_hu@icloud.com,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luiz.von.dentz@intel.com,m:linux-arm-msm@vger.kernel.org,m:zijun.hu@oss.qualcomm.com,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[holtmann.org,gmail.com,quicinc.com,kernel.org,qca.qualcomm.com,chromium.org];
	FORGED_SENDER(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[icloud.com,vger.kernel.org,intel.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 06C976CA570

HCI_Reset is a critical command, but hci_cc_reset() uses bt_dev_dbg()
to log it, so a non-zero error status response may not be noticed.

Fix by using bt_dev_err() when a status error occurs.

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 net/bluetooth/hci_event.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index b6d963ce26d0..a90d2c6a6e59 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -269,7 +269,10 @@ static u8 hci_cc_reset(struct hci_dev *hdev, void *data, struct sk_buff *skb)
 {
 	struct hci_ev_status *rp = data;
 
-	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
+	if (rp->status)
+		bt_dev_err(hdev, "HCI reset failed (status 0x%2.2x)", rp->status);
+	else
+		bt_dev_dbg(hdev, "HCI reset succeeded");
 
 	clear_bit(HCI_RESET, &hdev->flags);
 

-- 
2.34.1


