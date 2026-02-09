Return-Path: <linux-arm-msm+bounces-92358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBdpH5RIimm+JAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 21:50:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2801D114955
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 21:50:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CA922303B96B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 20:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D53D428461;
	Mon,  9 Feb 2026 20:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oJ7NYo9L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bTakVY2Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E65041B378
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 20:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770670164; cv=none; b=Ernr3YYJDOVbNii5t7TcG2tod52MRhwVIlhnR05/Kg3kwINxHhI8wUvka4nK/AMx5GMM0wo/mPdZy3b8HgEQ4ijCRr0nw7XscKmp7vNKzkrzWwhJWphKVeEys+/PLdvztFz5h51MeDrEOYmdfCRZD5NCAWMIKVh3A69AadFP/8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770670164; c=relaxed/simple;
	bh=lb15+faF+Bj4CyuaWLPe2aYw1ThfhxhGP+DnBVjNajc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TsS1g/uJQQWUemjwwPZ6TMaB9v83oAA+8jczHeiLlX9DSOrbK86+Owy2g/IqPNq3oPlwWoyDXQLdBfodUenZjb4QVorD6mApeFXiEMhhIHBrklkuAR+5dJqRKX/iswsLQcBGhiGVDkSUiGvk/2njsjqTW5RwM3zM0pubbwsRRZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oJ7NYo9L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bTakVY2Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619HifTo3699994
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 20:49:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=z6wBMOBlY1A
	ZaU9EBufQxC3HeY99WrDaPrtxx7GrAmM=; b=oJ7NYo9Lurrahnludv2xZWKeap3
	mhg+dr+YCitsAGu+FYRQrveWltQDiMeJRZb05FaOWsz42iE0fzu11xuBQ/QsPTw4
	exq4RUCY/oSlPIz8flwzmiBKQSUddBW3aDvfddsZ+SC6gxc9TkP9x4mY7tcKaPpz
	CCZEG2irt1CJWpiIwLvybNJrrXeZuTWwveTSTqD7GLL7/5H7j7yljhw38cjKOTrL
	BP7GUhRn9sc+k6Lz2HXPPBwy343ZJBhS/L639rTT3Krob8bxKnAFYsUJr3TXIIM9
	uqBFuDZu6MrzoKFpH+gZa8E3iC8eRcLjJOZKLJ1aYVUMcZRkrriofVZ96Jw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7e4m9yba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 20:49:23 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b86addb8b1so93457eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 12:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770670162; x=1771274962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6wBMOBlY1AZaU9EBufQxC3HeY99WrDaPrtxx7GrAmM=;
        b=bTakVY2ZbjV7FSUpIiQkjKhs7oKVwWXUtY0pSoVg0n2R26aztRlBV9ZlpJgTFa8KWY
         LbnNWgJQhKwDugufndaosisUQIhivFUfcrLiqaigf98TOs5JJMnmEULlqE4ti7CD0PSh
         PCl7t8Y8Alv5gzs4LMD6Uqwms+7gHvEERvSr2PTokcoKqHcnuRH/yH+DeUfTQHtWUjVP
         4Spt+rGNZPjxjxVXItZIys4IgtIntebzEokFUdxkqYoT21vE5lkayCYrZB6Uh2rETn0o
         wszb7HAEEha7jXYacVbIpSx4+V6rUSvcesLrr9F1OqcKYXn0XSFwK92abt5rGPQNnKM6
         OgTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770670162; x=1771274962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z6wBMOBlY1AZaU9EBufQxC3HeY99WrDaPrtxx7GrAmM=;
        b=pzerILZdANA5VqkKaA+QLta3hN7bApDDXTiuJYgt6PgJc6+9wOUPCO5UkjYoWeZPK+
         isBS0yV7FU+i89a3JYEIHC9moRE6FiBGej+Fsj1gxJfwlsI5gx341iSljR4Sw3c2UYxt
         7r9tfeLzDrNW90c9BmgAGcECPh1quQoitYjSqBTYA7FquhusBRoHHx+JbAbLvmtw8KcA
         VrnT+xrAsetRdZt5cplEFPvEHGuDf39hYvAATZw21VKuUQRIQPfJkvzA1l9FtdJranML
         mvvHlHi6XNWKfDHY+hMU7B/KOTBns/nKQ1t7pWtLS4puL56aXJVnxckYLN+CjnYjW2+g
         ehfg==
X-Gm-Message-State: AOJu0YzERQp4xOhHMbZjn9wCOYzDTXiUGAV2ZmF0nDYQA8S9b4r24ESR
	9onkZa2B/yuNNCEYROZGyD/bdLAE0C5TrK5sWg5k3/jVtsINq3YWelWpjuGKmYxl/rsQ5LEy6Xr
	JCujtf1bWBB/8m4OmVBoUnRmg2+pPpljuXopocdoUU+K/TNL4C7TWY98XafYrZz9vyt8Y
X-Gm-Gg: AZuq6aIj+GQcw48sTkc5cyvYsPWZMcJx/u3yiGAbMUjNG6Z+qAQXEx2lVOjt/SJWPQT
	Q8xJOvZMlYsvPGw4sMRtjnmxgWQmdmc9L5qpr0qCjwNDK0xPm97tWXL5O5TSJRdpoTq03wyAXN6
	niOM4CQvhY1gj5mtoxz8QyrLcOco4UBWabHw8RqjbO4q9Je31vcKbULoqFw4l6WBR+zGTPnmA6o
	OJjJPgedfIW10Vxdlw79Xia+qRSYS4JKzW1phyydbE+1f8gdZslknV+k6WFtpjO7zM2oSWzK5Um
	a9nwkNNacL7oKBWBrNa5+gcBxYMft5WhYzEiStB7UlRYFaCWcnkHbcTGR50dhwJKaMgPVvjjjB3
	Q+7pEh+ff8azjDsBernJIXmHyOFIf8kezUocjWupP8mIBQFFPsCRBqM5XRR1yJNNRhoTEHSR1
X-Received: by 2002:a05:7300:2d05:b0:2ba:640c:e238 with SMTP id 5a478bee46e88-2ba640ce851mr1874328eec.40.1770670162379;
        Mon, 09 Feb 2026 12:49:22 -0800 (PST)
X-Received: by 2002:a05:7300:2d05:b0:2ba:640c:e238 with SMTP id 5a478bee46e88-2ba640ce851mr1874319eec.40.1770670161797;
        Mon, 09 Feb 2026 12:49:21 -0800 (PST)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ba89ae14c9sm106247eec.29.2026.02.09.12.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 12:49:21 -0800 (PST)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, sre@kernel.org,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: [PATCH v5 4/5] usb: typec: ucsi: ucsi_glink: Add support for Glymur and Kaanapali
Date: Mon,  9 Feb 2026 12:49:14 -0800
Message-Id: <20260209204915.1983997-5-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260209204915.1983997-1-anjelique.melendez@oss.qualcomm.com>
References: <20260209204915.1983997-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: YCUQH4bQFC-igIxXwgRGie10rBCDWXAC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDE3NSBTYWx0ZWRfX7I3kx6hlr45+
 T2PFge6KHAki0kQGZQ4ZOWaJhwt4w4FZe69JhbMGPtX5X/V6Y5TEVhRyPr0RhivW7eYaWRJpeJ3
 tvXXBnh2Fxolz+cCAB2m9KGWxhAoZh+R7y01caDi2jdlZsVNL4aYAClQ6uVNBZ5nyMS4EVK66wk
 9bYJ2gQrxhKe1Nzl1WkVdAx3oGQLfFspf/YKvLVcAR3UQgsHNdaoepchBcN/2jhmJBnPuIFnP09
 lcHbX6fQIECg3yvpbXpvuPXseUkbgqLEupqxLJ1NpqowqTnSy9ZMCJKCtfoUEViNaP0pdeNotfX
 Bm8uH3ahbDnqO3JDnl8Ork2JfCK/3ueEZcTAS7CxzBZJD2y/vvvhUnEIc4eZUps7SeL01XJLsvo
 8NezgJCqkMdsN0H4Ats7MFIjGCiWACtvx6dC1rQOQi3xjZiVb2ky30y5JZR7qBubIX3yPlHVNyj
 mTENqJCqV52pjeF3eCA==
X-Proofpoint-ORIG-GUID: YCUQH4bQFC-igIxXwgRGie10rBCDWXAC
X-Authority-Analysis: v=2.4 cv=WecBqkhX c=1 sm=1 tr=0 ts=698a4853 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=-sI-HX3K5ndwM-XbIJcA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090175
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[anjelique.melendez@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92358-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2801D114955
X-Rspamd-Action: no action

Add Glymur and Kaanapali compatible strings which both need
UCSI_DELAY_DEVICE_PDOS quirk.

Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_glink.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index 11b3e24e34e2..c7878ea0d37a 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -373,6 +373,8 @@ static unsigned long quirk_sc8280xp = UCSI_NO_PARTNER_PDOS | UCSI_DELAY_DEVICE_P
 static unsigned long quirk_sm8450 = UCSI_DELAY_DEVICE_PDOS;
 
 static const struct of_device_id pmic_glink_ucsi_of_quirks[] = {
+	{ .compatible = "qcom,glymur-pmic-glink", .data = &quirk_sm8450, },
+	{ .compatible = "qcom,kaanapali-pmic-glink", .data = &quirk_sm8450, },
 	{ .compatible = "qcom,qcm6490-pmic-glink", .data = &quirk_sc8280xp, },
 	{ .compatible = "qcom,sc8180x-pmic-glink", .data = &quirk_sc8180x, },
 	{ .compatible = "qcom,sc8280xp-pmic-glink", .data = &quirk_sc8280xp, },
-- 
2.34.1


