Return-Path: <linux-arm-msm+bounces-99960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEJCDDJjxGmBywQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 23:35:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC4732D122
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 23:35:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 81CF8301DD22
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 22:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8008837C91E;
	Wed, 25 Mar 2026 22:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dJ9c/021";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JeNubUxy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6837635DA7B
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 22:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774478107; cv=none; b=FyfwHOTvMKJV8SNyNvuh1ENuEBeIR/SDNiR263zpkvDXz30HQ3vNeHjS8E7gvUlY8cTFbRSuAoAut23pHIAUhCVaOiQWNRpWj/yies68J0lSCI/gcJEZHLdizcT9BN9pN4eOFYRpftRr4Bwg4qayf/nZ1d677+ZZ2DHC+4p747c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774478107; c=relaxed/simple;
	bh=9Mi1LyZ0CRmlH/xauf1MyyNVj3nK9VxB5VSm562tbig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LoYMSdQawTsF5E/UJRYy+5Pcn5/RM3Fq9K6PoAQfpXM9FxzbRvVxrLBEnn5W5b+aBkBh9NAyC+POd05P/tWem8IwLtx4tdeUQULfwlDyssvqmWt2epyZQZa7eMgVAa/5wXMwcw/nEELe2Tnw3PprcUWMGdxx1uVTA9NLxWsaQuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dJ9c/021; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JeNubUxy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PMIUNG3070923
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 22:35:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GdgoPnRjws7G6AuGtjDaOV4ZZn1uyPCoT2CA12uFxjg=; b=dJ9c/021sQosB99N
	zcJXNFIqv0JipWSqXEE+3zSGcAcsow+d/68RAisIHGXKfGj0BxVFz1DuPcCr8hNh
	QVN48QpYcc3s5SC43TDAoVFSs0E165F8y0qfpqoKafxSHXM6Tmj6ErpKaw9Td5yu
	cAN1TOgqD1tUtXNqBdtVlwSwSa1UmVR6GGobLaTV7u+PeTMvhdh3UK6d75ZZfZ02
	jLpywm8pmhkEuPCNRC8cssqtAJWJdZObGV0xWuwP8Nwo1GnvQExbWWhI0OgxX9EK
	xQg7uY8h8JdJQ73fN6Xe6cdQsX5SIk38ByEqgc4yus/AXRG8jC778CeVrrEnDJdt
	B5WddA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4rcn01g2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 22:35:04 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-463a018f61bso506966b6e.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 15:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774478103; x=1775082903; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GdgoPnRjws7G6AuGtjDaOV4ZZn1uyPCoT2CA12uFxjg=;
        b=JeNubUxymCmeCimrpZOgO7cDL0HPXVzw4WJ8a9MhIvoPG/2qNIwGKFVpbCzWYx3Qil
         GfWgI6RxFrWTDk/3xk/FMOZ1aPW2qNvnAyffZ4hYjUgk/k1aCzcGWrJo42Vz0Z1kibot
         WH82ela33qoBVD3S/gNPCf3Udki43P2o2b43GV7B8l0X1YRBgS3tzJeMqMxDl1KsKXI9
         oy38tchB2fvQL1iu8dpO9qERpCgFntbDV6Gm/Wjz+WL/kJ78DqTYnQvYW+S7bfmL6d/I
         jvQQxDDXSV/XlXBshwMq3uiANxBrD4+66NL0gCWPdQRXiV2A/1ALxuYGCjMwCtWvN4KF
         5FFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774478103; x=1775082903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GdgoPnRjws7G6AuGtjDaOV4ZZn1uyPCoT2CA12uFxjg=;
        b=GNyaRy+mG8o6ceAw3tjBGdsAZxI4JjWhkSvuG4Vk1iV8yW0qUWNUcY5iBSd40ra4QV
         h4PK1f41jB+lw+CH8Mt102OjotRJRh8RPZV5JiQResV65ul/ciAauPpI6skedUq+XBU+
         YDKPwFrGgkmg1IAypg/xGkRahgKbu4FFpxqp/+X/kLtVBGjTSQ902C3Z2AvjWYaPZe0O
         lQFyPb7BsFl/CIVCN6PrPzkY0jHYWV+zJlhSrbXSqvnOMFL92Jaqa+sdHajGwS35nln3
         dP3ypGWYTGy/YuE3b5eINi/h+cBkVxdW/ZCIqgKfl0pGC/SqeQCkZl1qxFRyx0fmxG+l
         5L+Q==
X-Gm-Message-State: AOJu0YxPxekAFjgk9yXOA+m89PDpcm5DR4U8TSom6b9ds8PW9lNQMJiD
	RVp+23AaLD+eSgKL4igOvWjWj5WSpZVz/+QktnnaSzBp2slYq60Prx1NYn8/DifcqdRDmMpoL2H
	wP4B83toEChIREpswxIhZUO9ELPT8HoVQBJRhdMUq9jugZFFJVpRnN5VntWFMTx9l6KgzNy1U6R
	sE
X-Gm-Gg: ATEYQzxLssrTkd8U+aabfSl6bL8BPDD5tsF7/gr0iwra+uzS5IfByw1m3Zy0cjSqVi6
	3TxP2qDhuTzX84vojdL7SkkH1xaAoICwWfVd1ogc4p9PXS6pSUGcrtWOz7fc46E/tQ6u7mDYZWj
	T2xLY2w2RzLAcRQ2LxNidn5sDFcEw/6hBdD10gyap8EW5azGyPJKKjWdiNA+YRLP58Ou0R9FGXJ
	kYpQrkaphGumEAqb9cVg8Cbp35DYnOWTz7Lst5dS4j404+GfjuBzbZ+TYZAuD7QmdwYGvFLC6dK
	PdD1q25v9UTmFGFgRmgPzhzyPm9mkG/pCR5cUX47nasjCZQ0vanI7YzeT9ZZzZ58zdkxjwmqhjZ
	ctJkvqqLUjx65bTha6QX7VMeBnJJbbIKk4U73vHTajzU=
X-Received: by 2002:a05:6808:23cc:b0:467:f636:23bd with SMTP id 5614622812f47-46a5c7448f7mr2518435b6e.42.1774478103468;
        Wed, 25 Mar 2026 15:35:03 -0700 (PDT)
X-Received: by 2002:a05:6808:23cc:b0:467:f636:23bd with SMTP id 5614622812f47-46a5c7448f7mr2518419b6e.42.1774478103076;
        Wed, 25 Mar 2026 15:35:03 -0700 (PDT)
Received: from [192.168.86.59] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-46a70634941sm565790b6e.3.2026.03.25.15.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 15:35:02 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 17:34:50 -0500
Subject: [PATCH 3/3] firmware: qcom: scm: Allow QSEECOM on Lenovo
 IdeaCentre Mini X
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-ideacentre-v1-3-768b66aaef30@oss.qualcomm.com>
References: <20260325-ideacentre-v1-0-768b66aaef30@oss.qualcomm.com>
In-Reply-To: <20260325-ideacentre-v1-0-768b66aaef30@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=987;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=9Mi1LyZ0CRmlH/xauf1MyyNVj3nK9VxB5VSm562tbig=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBpxGMS4WVrGUZynoSJSQ0o/6ZamnMM2Wm8KDP/d
 20UzSN0VyqJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCacRjEhUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcVzMhAA2DFiJqKiTUZn9kuQJj2pFz6jPSMgw3vk84u/uOe
 td9lMDfv7XiB8oIWFXLRKeLyHvrjsOI4nS11aGEVIDwL+vbPQLvy+XTwVWSfE6b3ygVKAXNX475
 xQTFlOoHVAFDIn62/2YihZXoEFFYMuJcf7f6M0XWuHVZbHqFrkVJV4hPev+FXlvCBJtIOyTvK1d
 U9jqIGX9UTzIOV77/1tFjLJU54IaejdY58iKIhpNzEzZTVzNqymcc/4OTf4lryrGnxiLoX7HRTq
 kp73499ZkUo83/iZOWbCvEDkbn/bMX2u6ycq6aa5uA0zTdOnu+6MaeTJfr7QdLEHWn4daYszBWf
 cetQq3XiP/nPnN1IwsxKuvHh4ZMJF7rOJ2HbEbESls0XSlFVG/YVBq1I54zFe9UVner85UJNZXT
 UNOlCaH3j/Uti4kl5zZRk9UOh6/l1kRieZu8fv7dlJ0I/+tXp2dGdpZLcUg/vG7/ifjzdvU2pJX
 +ycuUtdzJIgqC8AGmlpMq0mERaWvu1cCoTvsRHnIfzWkePHKbt7mDYH5PqwBipp7CvevA2H/DyK
 0tAbQhqoL80Uq0VK7sk5ui5GNxbBibv5udVmhanhHrHVzSPMVq6Q8okb4rPHHwFDoC+7z4H6o1K
 PYQiEbYLx2tBZqg7ftC5Qcj9rs0cy9WWuzwEJZoacviE=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Authority-Analysis: v=2.4 cv=Vdr6/Vp9 c=1 sm=1 tr=0 ts=69c46318 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=hN4kT_9W8uNvSF8dpVsA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-ORIG-GUID: 9ervviyg_Lsy4wzU5Rr88Xh8Mon-qCMI
X-Proofpoint-GUID: 9ervviyg_Lsy4wzU5Rr88Xh8Mon-qCMI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDE2NyBTYWx0ZWRfX8uK1i5aUKwMF
 PD2d/axoedsBzfztZ2BS1i7k93heV1o8DZLMX7/FB5s1l6f37mUKagbTpRzQOQExzWALN4nEUue
 leH5vZwK5bYCWRd8rF9i46LsEvEckZlx6vo4XqImQ+4S6LD6WcqNnZsiO/0jeHZ08aFkm4x4iWX
 XRuSOGGO6hYl6JfDuulbIa+jDaAiOjMDg1gWew8BXtPnJv4SW9PN/kl4jjJ6NLdAS97ygRlRBLp
 faHHqdbDSkgwhssGgZpEzBH316HrAtWyEI1K5Xc6ndhsZT0Xgs+yOx2MCdn1UFANp+14n0hAcrR
 ABeuP3QmPqmoKQ6/unLHLXjeSY96rM5WEZMFCgRzvab8G8X5cHGEp8ljO0cdgeXvwIdm8H7EoP+
 R+tE0AQqJZQRVXg7xGcoXqnw2UeBoxLziphkIglEYzaR6mk6QVTYq2nWst5C6q+oxrZxThxkLxo
 B2KJQsHLw5Vbx37H8dg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_06,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250167
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99960-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[bjorn.andersson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3AC4732D122
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Hamoa-based Lenovo IdeaCentre Mini X provides the same UEFI variable
access through uefisecapp as other Hamoa devices, add it to the
allowlist.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index d1082695ec38e180cbb37fa6231018be6810da0a..a6cf36ed28c402dc09e6f54963687fa3d0e5d45f 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2299,6 +2299,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "hp,omnibook-x14" },
 	{ .compatible = "huawei,gaokun3" },
 	{ .compatible = "lenovo,flex-5g" },
+	{ .compatible = "lenovo,ideacentre-mini-01q8x10" },
 	{ .compatible = "lenovo,thinkbook-16" },
 	{ .compatible = "lenovo,thinkpad-t14s" },
 	{ .compatible = "lenovo,thinkpad-x13s", },

-- 
2.51.0


