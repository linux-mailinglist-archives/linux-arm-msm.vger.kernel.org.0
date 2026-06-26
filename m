Return-Path: <linux-arm-msm+bounces-114600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id K3+lKQENPmq2/AgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 07:24:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4174B6CA518
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 07:24:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CgQuQDKv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=T3ep0IzA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114600-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114600-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4642C305DEBE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 05:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 461133A9623;
	Fri, 26 Jun 2026 05:20:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87143A7F4A
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:20:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782451209; cv=none; b=FdjzVs461liVttHzW3hX4C3VCh5aI9x22Nw1RNBNDSjqBGZzoSvZ9CakcC1KVFtnLznLDV6BvUpue6IVidBg+QVBr2/Ft0aO83KV/TtOIHyDYa/b77AFAn+fj99VOdecnUEvuOY3aDJ7HrGdjU6OkRObHjG++C3782pvfj+BhBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782451209; c=relaxed/simple;
	bh=l/Gk01hGJg5kUh6ChWLEKuHFQ9rggF8h29m1ZgMwtfI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=clLIEWs2bOVGUOk47LUSYvTJQTnbUpce3nPbX5RzFpbnF4KFp4F+BF0l0/uLGVKRKJEcC6d/kZMP/+P18YbFkLLyqlAwFRakQ3bd4DU3ELEY+HJqeikK1KAk/yCCGXvz9vzLACf6HbYIvtTTYHTq28wcShd6kVufe0a0b8gxRTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CgQuQDKv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T3ep0IzA; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q2ioN6120273
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:20:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ssOA6Sr9m4gdmZekHWnuBAc3GlXZcD9QEaIV9uWjRxk=; b=CgQuQDKvpyj+x/WK
	CAUYbrIitGxcez3mJEanDq28Nv8TmeH5qxPD62pt2THnsPANT0kGAu+fYDU8LYBz
	GUxGijcPfBj9/IRMWrNTrZwyOcyv6dXWVy+amcgQi7sDbpR0SqGaJObhtcySl6h0
	xK2c8ugvp6EmwaqpozXt2o1QWZ+hzKRnV17S6Sq4+mxjGVJgDfswuTMH4tSl9d4g
	GP70fPnWZIDlFl3I6WnD2FSGAuatFNKnJARVAR86U8TxrkKUpAGbCL4UUFki2/Hk
	Fum+ZHDUwbq64VH9E2cv4D6Gf9BVpVZqDTF7aiJkim8nHDPbC3ilUAmK4S9rgd2q
	bs2bzQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1askswy7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:20:06 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bd2951238so64908eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 22:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782451206; x=1783056006; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ssOA6Sr9m4gdmZekHWnuBAc3GlXZcD9QEaIV9uWjRxk=;
        b=T3ep0IzA2KHbNHni8OqI8W5L3KxiZdszb5eKjFLBMF4BYtvezs6arIbrjE9pM5vMIi
         hGfrAhHXqK76zJ5d56+zvmDCRJNRJHwR3diKBYZOqaXFKOrg+/RQFJs+L4+NEDWPpyuC
         47OITrIC/F0Cy5rtabSsMaMnYnJy3JRtaL/qwea2nJi4Op7785vKSrZ1SZsyUYrQIdjk
         hGz6OSo7RrOu+WdC77Xh8+4zD7CQs9EfN06l68M9lA7M5CfcpxaSgVz0xg9b3ooGKOgC
         TXY4zkaZR9b19xF4bTPGTcZY8oufptwDl3/WqduMGq3Lb9RQCntHtgPXdUOxCfeTuTk5
         x+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782451206; x=1783056006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ssOA6Sr9m4gdmZekHWnuBAc3GlXZcD9QEaIV9uWjRxk=;
        b=WYiRcOzeRXQf0Pl8+Q6ov58xIhoTCbBg8pMx8uJWuobw2nDULAaf0qE5qU27rdu9HZ
         /+WEQckevxrJ03ztSNhrHH7hCF3/8ZNWIwLwdvUtLna+y5TeDWO9Jyo4G8iyMIaIm2ye
         oMeHEcGxNc2Ky/nBuJPqGF7C2YBec9JYz2Whud3AK1eI61jqao1/Zqe/+tZH0Dy540uA
         XIEQzUNxh5fLiBGpy2RQsq68PBcYzNYgjP4hD8A8jx0iHul+oVP5tHzhnB/EyGWPMCqI
         xHUsh6RNao20OUNc/TDKDag0nl47lfzWEvMDaG9UsvO5Z4li0TwofXxb6btOW9MpcNc+
         j+GA==
X-Forwarded-Encrypted: i=1; AHgh+RofleRs55b3Ms+nn+dtp/rTtwT0s3e8nOAozYBMbh+KmZt4Ws5x/T0ZYjYMjHROhJdTTl90NPDhukWcM8pu@vger.kernel.org
X-Gm-Message-State: AOJu0YzlK6o7X8IO+Q8mjN3a8iiz3NPzR6kvJJQqM7B3d/1fXaFBA7Mt
	vXTdU4oxBiPjauXt7nwTkpjzTBx0rOswVBgoKgq5NdnzvSOPN7Tj+aG7VA/eLivaO2vxp6Rv+R9
	UMvdgmtaADc5aLJND9BeF/zNo+7IKY9TTxyWeFTBuut+fW96zo6gTqMIZhNwI7HTQB9qX
X-Gm-Gg: AfdE7cld3/FXkMSq2tcMwVIhao/EKrl04VutrXGHJySyAKN/2bQ4Mv6Qs7YXv5VCdMe
	6nOByDbeDWFh2qgzHnIDQXXk9I4xpHkVsTko/qk81q/o5hSN9lIJ8IdkbhKRkMUxTa//TNI5SfU
	iCXRuJVyPrFkh5v+CU78lL7h57cf92gU6BApY1r3a9RKCR3H02ixkUo8WdG6thDkwEYvoTYOyjl
	lqWkt9v8IMAmUNH08JZlIRbz3J/ueOmS7AKNhthgV5K0Rz5WT0ImF9s7a1i3SeSIHrI1/ZF7KYe
	qQIOdSf8aQc4XK8d0YII0dThC4t0B8VDjGEHDED2iGwK9Xvas8utOjd3NTroRwqg8TcEmGKUaqb
	m0oGRgEUXo1svFNxmhmOmrrTusYwWn5upk0ejF6ce5BLOTD2hAKirpkK9zw==
X-Received: by 2002:a05:7300:2211:b0:30b:f3b8:3e7d with SMTP id 5a478bee46e88-30c84c9c952mr2313351eec.4.1782451205686;
        Thu, 25 Jun 2026 22:20:05 -0700 (PDT)
X-Received: by 2002:a05:7300:2211:b0:30b:f3b8:3e7d with SMTP id 5a478bee46e88-30c84c9c952mr2313328eec.4.1782451205124;
        Thu, 25 Jun 2026 22:20:05 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4ca240sm14345291eec.4.2026.06.25.22.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 22:20:02 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 22:19:56 -0700
Subject: [PATCH v2 11/12] Bluetooth: btusb: Reduce a redundant assignment
 in btusb_probe()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-bt_bugfix-v2-11-93396a6f7d5e@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA0MCBTYWx0ZWRfXxB4nohzVgWqs
 aCYgwmlm51JFlYnBwNDGDWUXT9vMID0Okta60t0aHOzuMVmUvcEwOuAM+bdM33C7hFt8Dcs4CP4
 T2UVkUq3TflWWZRHZTM5lT/KQKg9bgo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA0MCBTYWx0ZWRfX9ZC0JxIUVJ8O
 65VjToSpGbv2A8rLZAnn0YMQgMah4sE0hnVT61/t7dwIROJKya9LtJjM2Ce33N/9lxXNUOm1mtg
 kkWJmFgtn2QHuu6CnyVX0EFL0t8zNUP5QOjikvATxOOhJmTOzacX14rU29GO0uY/kh9nRoeRVDa
 p6jtAiz3o83ykUD4NJtns/deyWDEnCTbx73JhA8mssSQpupb7qjknuA/YJn3qWCaFm1LCR7vMcY
 j60lYhjOdXIKTK1Q11pozj1B2O9NiYNBOlTYcoK31ey2YFFKVYSvWPJX1KgwkJQRo/6vlQNvqFi
 tPofTOilUBcQ9B9HrvILndXuA4+e00Byd0EBPsNU0WvjiYO2IaqvJkIPyXVhrKMX3KdrMm2XMxu
 9mbztgOJZ9U79G2p1IiZTBhQAhYC8dt7PF0Ld6QTYMahhXyk0fdJHoF5dIkzvB3R51JBDvrUDiE
 JC9ijZ8vJ450/1wIPhg==
X-Proofpoint-GUID: AzOnJmirCdQc-1h8sMqBHAAGrztIPTcn
X-Proofpoint-ORIG-GUID: AzOnJmirCdQc-1h8sMqBHAAGrztIPTcn
X-Authority-Analysis: v=2.4 cv=AMxnnMPh c=1 sm=1 tr=0 ts=6a3e0c06 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=gj2qSTqXcDC7yxDT8GEA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260040
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114600-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_rjliao@quicinc.com,m:brgl@kernel.org,m:ytkim@qca.qualcomm.com,m:quic_bgodavar@quicinc.com,m:mka@chromium.org,m:quic_tjiang@quicinc.com,m:zijun_hu@icloud.com,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luiz.von.dentz@intel.com,m:linux-arm-msm@vger.kernel.org,m:zijun.hu@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[holtmann.org,gmail.com,quicinc.com,kernel.org,qca.qualcomm.com,chromium.org];
	FORGED_SENDER(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[icloud.com,vger.kernel.org,intel.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4174B6CA518

Initialize @priv_size at declaration rather than separately:
- Simpler: one statement completes both declaration and assignment.
- More flexible: the variable is immediately usable from that point,
  so any new priv_size += can be freely inserted without caring about
  where the separate priv_size = 0 sits.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 drivers/bluetooth/btusb.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 25bbee8f5d93..d2e15a91584f 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -4090,7 +4090,7 @@ static int btusb_probe(struct usb_interface *intf,
 	struct btusb_data *data;
 	struct hci_dev *hdev;
 	unsigned ifnum_base;
-	int err, priv_size;
+	int err, priv_size = 0;
 
 	BT_DBG("intf %p id %p", intf, id);
 
@@ -4161,8 +4161,6 @@ static int btusb_probe(struct usb_interface *intf,
 	init_usb_anchor(&data->ctrl_anchor);
 	spin_lock_init(&data->rxlock);
 
-	priv_size = 0;
-
 	data->recv_event = hci_recv_frame;
 	data->recv_bulk = btusb_recv_bulk;
 

-- 
2.34.1


