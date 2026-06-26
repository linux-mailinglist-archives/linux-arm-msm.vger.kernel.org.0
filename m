Return-Path: <linux-arm-msm+bounces-114599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id k2LLNWwNPmra/AgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 07:26:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 801BE6CA573
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 07:26:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VjSEEJPa;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RL17uv2L;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114599-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114599-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0994C31049BA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 05:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3B763A5E9F;
	Fri, 26 Jun 2026 05:20:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428363A6B66
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:20:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782451205; cv=none; b=N4CtTe6A18fIXx+XaB4H0b3QlVLPMl7mih6z1Dhnq4Yhoy2Le+yCPjMDj1rszUJWgsZdC1hTcsiFYhRI3wBGwrf72gVRBVwDef2EN4f3Og0XiQjiQEVEBrqnMch+zJMKKusmVdaGCh/thvFxswAvpPdoSeZo6uQ1sIrImfK5F7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782451205; c=relaxed/simple;
	bh=2YjVjrPaycCrqOLQL1JI2zg14+YaOO2rcb06GzOcsTM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=atro1zRKRFyWsV1PDx+wgeZdv6YZm/PeH6G5Cr4XBFjc1PCTmeyfBVgHIfElpVklgnXdJVi3jSzlkZn5GoFdzw2v9i0cvLxVcHI2Eqd70o3XHDPovDd6UQENCBG+loCvJFPYsOGvJiWbFSaKNWb3PFfaklnoYaqudjhc582B+wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VjSEEJPa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RL17uv2L; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q2ijNr003553
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:20:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3TeElaidC7wbFnX8sGpOSxYLOegsMSCKkcm38P6ttgI=; b=VjSEEJPaxUDnK298
	5UtKIQPhF2NU/2oy+0WnQ/wuwjvPZts7zkf+SzjBhUdpvm4di5vQZrOD/los6vVf
	lQ5LeRNRYSz64agcHbx+WaT1FUTZCZPxdCdzR8gERl7OSG55QWqXtbf1RMlVWKjW
	8c9/c39fzvzufpfxN/eo0SBrDeFDf9KEOsVoK8kWEzhCXf9PGgbyVaFgoHc3Jcr8
	u+c/WDjpdWu77dIZa0ZJJeKHFpxnSS8E+uldQc5/R/vaRl8JaAhCtRbV47wMVR+K
	Q2b4s32sYJVaOLHGnAcB3UiRN3gLHhaHJX28iuu8xRvAg0hd4S6PajS+483wzj7C
	pKKqbQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1fct8t3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:20:02 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bd0d5f5a4so61893eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 22:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782451202; x=1783056002; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3TeElaidC7wbFnX8sGpOSxYLOegsMSCKkcm38P6ttgI=;
        b=RL17uv2L9o8ChLjU/vNIXJPhkGcp6K2YekE0XY72DWphmfI2eGA02fWYy96Ne2guGt
         KsC8VjlQqtJ2FNFc1ZjrvkW8OsMvkOAQqvxtWayIuUwpaRwl08P3/bqYXfwcs+De0Mwm
         DpTl0mDeBR+h+qFKivVka3UW0sz8HVHgFcYcgsmusprMy3nUQ7CYLfr6s8l9I7jHVJeP
         Q+K//G2NHifwJgn1It2pXIN+7qvEyfxRjtZ6ASCXK97kyUJvOJJrQJqx3vaJV+ixz7hR
         Zmn3Jsoc+1jV+v7B6HkLVoMy+Aqd9q2OYaRSddgqSPSPRhAJ+5DocYnLj8W3sgUuhNCU
         6wiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782451202; x=1783056002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3TeElaidC7wbFnX8sGpOSxYLOegsMSCKkcm38P6ttgI=;
        b=NCol8e+pGw5P5/KUBeCe8RILPOxJ6O5yozlgHNG72mDAfb0Yo8HAGtAwdEQaN6T35U
         OCbLWAtvbW2ULG5GKZJvMKQxF0s/Oub/f6/MUEwnPOoeqGEgYfMlYHjzGiiAPaP4/2Sv
         groP5V1o97bDH09mtHg/m3EvOOYb80X9IByMMBCrACLlsZhoAZb1njgb0fhxKHoPztuF
         a4SVAwnHA6wGHm3bCHcHnVTlpvOKjFuCJpHoRD1C6xWLiruDX4xm8xbQdRrThzIvLAfy
         NKTgoHH+Adelqqm4+STFNP9bazpd65gt6ykcdH/oAOm7gQyM0q9coW8er/DJ7vl86tl8
         GX8Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr4n3LW8lAzy2+i/EFQqPrB1bscWGc2SticQNIzDi+y9shYJgN7OrQrTUYxgFWWC8exuTzT1Owpbgg5Vb/w@vger.kernel.org
X-Gm-Message-State: AOJu0YwJb/u8G0KxjHnn6Lk7RgbGcuwVjdmB8oyPqQP8z7LbU1qsFAeq
	5eDmT0cGMz2xxFnohUTm/tjSS1WY6t6W5fZB8u7u+EAbNejL45Cq2qEq/G3iZcAILL49pGQWCln
	QWd8vGeNX4KzcqcBAt/YDAzMXsmVZgtA5y3ht64WHnaF0MtQcp1cz9WZQioXcHU4QqPYx
X-Gm-Gg: AfdE7cnmYd8iwYMRHJDcoLqhabv71dcJGOC3C7Ixyovi2Q1UHK4svEynzDN55MUaJC0
	Ub6mYKWGAmmCTNvr7ULladhGgwYuGgXqS8pohUyGPv8ETmDeC/b3TASQjRzM35S1+rz6ERqXwie
	dUkbgFmG8B4AnnbTlWrSSEkWG/lJW0A+xDcRfPSvDj1gsPMveFyNKP0eAUPgAXhvx6c2vm3osP9
	1x91Jt/jMKPjLP0584Skz6b2b1fKkXkAFVb3p3rCvhsngIx7CrPZ6OJ7d3uvh4u9ILqMxFZjE6v
	hGF/IWV4Y6uuKKu1RIhN5Rr8W8ZCreORATWvQUsKQAPFtsWvEnG/KYNzUp8bqE5Tgbb+2NcGCf8
	6qbVpm+o1tUwv8HFy3usn+T4+u054P1MA56lyg5u2jgUJJkA6ysCV2j9nmw==
X-Received: by 2002:a05:7300:80d0:b0:30b:d2f5:d503 with SMTP id 5a478bee46e88-30c84d6c82emr3141140eec.7.1782451201868;
        Thu, 25 Jun 2026 22:20:01 -0700 (PDT)
X-Received: by 2002:a05:7300:80d0:b0:30b:d2f5:d503 with SMTP id 5a478bee46e88-30c84d6c82emr3141116eec.7.1782451201313;
        Thu, 25 Jun 2026 22:20:01 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4ca240sm14345291eec.4.2026.06.25.22.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 22:20:00 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 22:19:54 -0700
Subject: [PATCH v2 09/12] Bluetooth: hci_sync: Simplify hci_reset_sync()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-bt_bugfix-v2-9-93396a6f7d5e@oss.qualcomm.com>
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
        linux-arm-msm@vger.kernel.org, Zijun Hu <zijun.hu@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: 3pBEehpTHGSj1vvJeLC7vFPLXgwiSL8r
X-Proofpoint-ORIG-GUID: 3pBEehpTHGSj1vvJeLC7vFPLXgwiSL8r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA0MCBTYWx0ZWRfX22DQ73pfy+6r
 VqAK5dBS9WB+VSDvEWeatcfMT4R35Ghbxd+RwsOvVEEq9TmsHLt+GrC3Wv1xWlDQXzLiKAC5YU5
 bm+Z4UfDIrOckxNGdO0JaRNnjfXmtVEEcq6K/DZdaYVDtwexaPvl3NgPWprR2SByOLnTn5FQyWd
 A3Htbwz/NpooiKl3vuw851KkEWtGLjEQLhDihdA6BlH+YSwNd5UJsFzNRlWG5j59NBfXU/gqQyd
 CeY8N/QwMLljVw23BDLYZDWNjohUHRoRi0ZW+Ay18HTspPpRul5ugNS4HdageFwkIffjMyfDfKf
 QueHIeQ5heBGu+mKxf2AlV+qh8/qjtBpdGXLVxLJcaRWibvcQ8hCiMcMbAXwDlCtZTHxZt7vPBV
 3f+yJlZTuxtE2SG6NCL1ToYomfPoLB/5FdYOtZ1tBHba05PZjdga38tw72lPlmbMnPaNE3nboT4
 ozKlgWEaZoHe3GcwfUg==
X-Authority-Analysis: v=2.4 cv=FPkrAeos c=1 sm=1 tr=0 ts=6a3e0c02 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Hgocxy9eVv-WOgHqIg8A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA0MCBTYWx0ZWRfX8YnA7utzPDL1
 X07qhfbGHCEZreTk4HzHzZDjHJs4QuD1PnU4u+vY5UxiSXUeLo1aDfyU9ACLShWoL7VeuDmDNRZ
 +Pz3RnyozQRd8qmQ+l74F3HIlZHIejs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260040
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
	TAGGED_FROM(0.00)[bounces-114599-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_rjliao@quicinc.com,m:brgl@kernel.org,m:ytkim@qca.qualcomm.com,m:quic_bgodavar@quicinc.com,m:mka@chromium.org,m:quic_tjiang@quicinc.com,m:zijun_hu@icloud.com,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luiz.von.dentz@intel.com,m:linux-arm-msm@vger.kernel.org,m:zijun.hu@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[holtmann.org,gmail.com,quicinc.com,kernel.org,qca.qualcomm.com,chromium.org];
	FORGED_SENDER(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 801BE6CA573

Return the reset command status directly instead of storing it in a
local variable and using an if/return pattern.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 net/bluetooth/hci_sync.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index ca1ee6c89739..97caac7a1963 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -3672,16 +3672,10 @@ static const struct hci_init_stage hci_init0[] = {
 
 int hci_reset_sync(struct hci_dev *hdev)
 {
-	int err;
-
 	set_bit(HCI_RESET, &hdev->flags);
 
-	err = __hci_cmd_sync_status(hdev, HCI_OP_RESET, 0, NULL,
-				    HCI_CMD_TIMEOUT);
-	if (err)
-		return err;
-
-	return 0;
+	return __hci_cmd_sync_status(hdev, HCI_OP_RESET, 0, NULL,
+				     HCI_CMD_TIMEOUT);
 }
 
 /* Send a raw HCI reset for use by vendor drivers */

-- 
2.34.1


