Return-Path: <linux-arm-msm+bounces-111317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HAxUMp1kImqYWAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 07:54:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F41F645517
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 07:54:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fQbzSzmm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TFTl5LpO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111317-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111317-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AF9E930A88D2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 05:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8611530FF20;
	Fri,  5 Jun 2026 05:46:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412FE3F44D7
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2026 05:46:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780638369; cv=none; b=JQjWxWLECx0F0cxA/iTSsXyMD0Yj6riJbJez77ALSMFWU5RdfHlohQnL0oj2VNcR5EOAKlEuW9uJqFNcjgTrOBwurtg1dyh3g/s1EZhpSh+SWpPa+ZDvn0olfzGx3tUD/yMUUl6akz+MS1JGdF55R3bWcSQ5Ndurbklsix06vO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780638369; c=relaxed/simple;
	bh=hNoDdHVVN8I98D586YtDBc9mOh/0UwkJNkG/q3AzSXc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=INPArjHyLMpQrfbc4kpWBp0N7M33sVUlEMRZi6DLAV4LRKh5WKuI7CF5nVI/RBnDvIDuZM0/j53ZwsnUTOjcGhZxNqC6vBC6YnUI4F4B79Sz7pjxM+aGYlQONYVUPXEECD1Os3NrBuKYRW4timHwUBxfQIlyX+xrN/uI+NNKj+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fQbzSzmm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TFTl5LpO; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654KKxEt2701914
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Jun 2026 05:46:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aKF0JlBKTA3Y/Q72qEhmnX
	LjLL6QWIzPFLpvb4RPfS4=; b=fQbzSzmmOyCHzuHcZCQo/zlmnimcgQNVq2i18k
	xmTWOVibJ9qXI6ZVOfoc1BMpXi+Hzwx9bm9IvxyuMzf2xuaEpDatLap+u7bzZDZN
	gGaGTIVhj6riYEw9HHO99eCCYl+tlZhPYiXndnV0kOqk3UDV0jDL2Ck5tecD8uEW
	KTSfRhZx3NYEt+9v834hk984qxJa9hMvw+aHAcQhoVv1aaMyBopMJJzqG3FrrzL8
	PvYMpTEBoS8Xo1Yj74t81zJB1bi6BI3t250L9uX8LLXvLDJ2jR3EI4i22KaCOpMY
	iO0p8Hib/wdTHPQmzcnAmJDxao8x1jHIssAL5tDp+P2u9dvQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekgaj1v3w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 05:46:07 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304ee7d1368so1416919eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 22:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780638366; x=1781243166; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aKF0JlBKTA3Y/Q72qEhmnXLjLL6QWIzPFLpvb4RPfS4=;
        b=TFTl5LpO5YebhR8xJfPVqS9RncqJ2fprlDGw1R9Eo53B6hhJ+zoGTYLMPbodAfiCo2
         aTSbRy2ELwJExFGD9JCwDAEqmAa808MmLEemVAfX7Mut7WLogy8VKqynppNXolZbMin8
         EBpuLpZ0gFWdKwHJSDH4eGerdAw9w4fZYRMIVXQuoA+yYQpxvQGNG6JlNhQOldRG5+Fz
         HpKXmM7NjbWE5lzTOp+tfcNu4KC80bstKIxpEYEGDB3QJQDRydUwbtyePwhjdyHsGR58
         8Qvc1kNY4N0oFkReJPJXRYoEWGlrXr1A3Uuxlg2kJ8kbymb8cUcP+K7jAHowh6sBW5uX
         GsqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780638366; x=1781243166;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aKF0JlBKTA3Y/Q72qEhmnXLjLL6QWIzPFLpvb4RPfS4=;
        b=sKDG090QxlI2T+BobdyD3AreZpQSVD22ve6in+40Sh8vRZ3O3uEU3FKpnpO+iA2Z2w
         43/ICHaf+VAAq/P6JnRf9/mE7tGXJT075JaChjkjODRwxUTjsAhuK47I1EDu0c69Iy88
         HhUMi0ettKsyD1wmZ0xbAfQ3gSkKT8JKgn/wZufcPVl8qIZWrfxtpZoQeUpGNHFyBi8U
         J/WvSReyzDoNoeC9jB4MlHGXUZv/wZChHC3m4nJPpJgmv3WU4vxlB4fiCNgE/mrnCfs+
         5cBiBupjQ+6nwWQD+DAXqSJbrEFLyG97TWU+fvwYkor7yIgNFI0eAHeDZK9N/R+6Us7M
         kkqg==
X-Gm-Message-State: AOJu0Ywxw13cRD6lv9ncRlUJ+pFD+1sEV8bgJCyMtgqbBEIyc4IESqnf
	j14z31GKJiAVGPlLh1HWs/zV1bpei/AO/6R0oUoJc0nxDl72wBzGbrik8rivsbutnv1MeI1EgCn
	RHJ9cpIGqPCMZ8kBm8aYwKiWsxNp+3wY7zlFnHZ0gl0XIRt1x33qhZR5CKKrxfRSlnwNw
X-Gm-Gg: Acq92OFkVtkvZ/B9uQJH7iyH9n3TDBnwUYKgnP3BUQbg12fpc7Qxsa08LtRu5mBrMLW
	yfoeJYAigwXED5u1+mtFJ7J4aujgn0x7uTseKRVthYgI86M18eHr012UTWvWPsBMoIp7i/EHVr5
	VcxMmskNJsy5B0Qs8m1PfSc10EaTl33eNhGNmk9mOeGpTdSAwRRV2iOMbsgiUc7PJ4g8nfrt5oJ
	Kw5kq5cRM4MLcHfzS201mg+Mu46kaLyj0e+3SAcH2GcVyd/tGZpOij3CGo5MpsqOCSh9n5sd7tK
	tb8U7CxabzR9rfVt95P0Sa30RqwNjZPHvEHBvubue2GtOIsbJ8agiP6u7PaO6jQeHXtf/HuX7ra
	BOrypfwbvQV6cQ8rNpgfB6LC7f8HidTL0czXIxw7PxAoGHhZKYLcBI5IR5M5xqiDRPBybNNWWbJ
	KhOVb9yWac
X-Received: by 2002:a05:693c:2d82:b0:304:9b48:53da with SMTP id 5a478bee46e88-3077b260fe3mr868209eec.26.1780638365995;
        Thu, 04 Jun 2026 22:46:05 -0700 (PDT)
X-Received: by 2002:a05:693c:2d82:b0:304:9b48:53da with SMTP id 5a478bee46e88-3077b260fe3mr868186eec.26.1780638365474;
        Thu, 04 Jun 2026 22:46:05 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dba046esm6259317eec.9.2026.06.04.22.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 22:46:05 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 22:46:03 -0700
Subject: [PATCH] spmi: pmic-arb: Fix OF node leak in
 spmi_pmic_arb_register_buses()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-spmi-bus-register-fix-v1-1-136adda83a92@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJpiImoC/yXMUQqDMBCE4avIPnch1SC2Vyl9MGaiW6iVXRVBv
 Ltp+/gNzL+TQQVG92InxSomnzHjeimoG9qxB0vMptKVtaudZ5vewmExVvRiM5STbBxTDDcfUlN
 5UP5Oijz/uo/n37aEF7r5G6PjOAEEbjpReQAAAA==
X-Change-ID: 20260604-spmi-bus-register-fix-dfdb94bf834e
To: linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780638364; l=1283;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=hNoDdHVVN8I98D586YtDBc9mOh/0UwkJNkG/q3AzSXc=;
 b=i8gLviUOerzhIISqWQsIA3qybUaeTiHrllV0oUS1UelvC4PT3nqALEzuHp97CjkPS73mD6Afb
 WIr9Q4bTQFMAA3V8NA+I0dtuWo0lIFi+8usblvZzDdPMWFWRK1kzjB+
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA1MiBTYWx0ZWRfX0GiYhpmEzGBN
 MoqtV0KSlAwXmK54cHk0fZbOSY0r+N2bMYj36gYpDLeEfX2HFutLIdkZodY/9LfT4bu3b9CBEI+
 X9HYf14KgDMA5EGnxHkw/tv/7jUx8nOX9P7dyEkCWt+LRfUPOCp6Gs4UYyYvW66N0BEOgn8wRyP
 T0Uq/bvmOnAfE/OEwJKHdcD7RQG89UOJsrsYgKQP8GnyBlj3GgYsKfU7PiGJ/4MytyxI4/H+BoT
 7p9Gx8r2jrdoDxzQKweOfF6E7e6OWka/EPKjXqGeMCfwdJhTpMkG7JYw+6W2cH2DRC3nE7KamUo
 0hMHBVhjyNybFUIb59rYk397RjE1KS1wpMLum2vy3dAfv2CJLjNeWEq0f2Njw4YOILnIzeW29qc
 UyuLlrYnzi2uCowViNquwL0Iabkc2SHxd+C9gqDGB10KQJCm4kn17QWkiodyMZHkXrAUZP5tDDc
 P7nYQlRcIQiofvIGSIw==
X-Proofpoint-ORIG-GUID: aJtjIq3CiVL4SqPHC9NOo3rLDCho9_eb
X-Authority-Analysis: v=2.4 cv=P4AKQCAu c=1 sm=1 tr=0 ts=6a22629f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=vTbStt9xRa3esVon5YYA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: aJtjIq3CiVL4SqPHC9NOo3rLDCho9_eb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050052
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-111317-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-msm@vger.kernel.org,m:sboyd@kernel.org,m:neil.armstrong@linaro.org,m:abelvesa@kernel.org,m:gregkh@linuxfoundation.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:fenglin.wu@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3F41F645517

Call of_node_put(child) to reduce its reference count when
bailing out from the for_each_available_child_of_node() loop
upon an error in bus registration.

Also, return 0 directly if there are no errors in bus
registration.

Fixes: 979987371739 ("spmi: pmic-arb: Add multi bus support")
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 drivers/spmi/spmi-pmic-arb.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index 2e2cb4774103..26e804ad95a1 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -2055,12 +2055,14 @@ static int spmi_pmic_arb_register_buses(struct spmi_pmic_arb *pmic_arb,
 	for_each_available_child_of_node_scoped(node, child) {
 		if (of_node_name_eq(child, "spmi")) {
 			ret = spmi_pmic_arb_bus_init(pdev, child, pmic_arb);
-			if (ret)
+			if (ret) {
+				of_node_put(child);
 				return ret;
+			}
 		}
 	}
 
-	return ret;
+	return 0;
 }
 
 static void spmi_pmic_arb_deregister_buses(struct spmi_pmic_arb *pmic_arb)

---
base-commit: 3443eec9c55d128064c83225a9111f1a1a37277a
change-id: 20260604-spmi-bus-register-fix-dfdb94bf834e

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>


