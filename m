Return-Path: <linux-arm-msm+bounces-110574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mP3zG+5tHWrlagkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 13:33:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E20EB61E5B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 13:33:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 526C8302A4D2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 11:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A40E35BDAA;
	Mon,  1 Jun 2026 11:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bLjOvhE5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e9ef0M37"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3508832ED24
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 11:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780313560; cv=none; b=u6X3yYYxa9kfJmXTUwBanl9ccY3H+YUb0iLPM2JRJx2rXdBQEVVNqsSBHF4sLlzfNySm48EWcCwPjcL4DHPC45KOrlXW8d5Ryg1tG7B+jl/1Fl2Rv2lv+rRNZ7iK9vpDfXAkuuIcM4c8xYFGq45tda1gqYvGSv0VrzCVuO9ZA1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780313560; c=relaxed/simple;
	bh=6o30cdAL6da64erM2KNEFfKyQAxJbYvFAnMJ4X/B2To=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ze4f0FzD8EwQqCNQv/okqOIFpixtD2GMJQcWUhrDbv4yMLG29Iad8FSIq8Vac8K+Cu7m09kTzuJqQCNNsp+EDDBAAWc1AQ4Gt8xI5NgvoyufSeuS/lTUwLS6P96Mxqrl4jsy9U9PPV7jEtwN+mQFFqB1EUr+Cz+OIBNiuULQOV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bLjOvhE5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e9ef0M37; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518f7a12740401
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 11:32:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B3ZGJB1FTG/N9elrkQB7UE0RwCW9ibLrwGuzABoGwo0=; b=bLjOvhE52cfjaa85
	hCMdcW0Ev2l1F6LvnoKeUbdS/Lvf/pPS/Me76/3swnW4fXqxxZTdqVRP5RdeJsnm
	1r0h801tWFMf/lZ+Siu53UgS0fPQN+oUEx7pfAk6mjNeEfOOE0vAQw0tALmSFzGn
	+Wm9HzpJkyUUMGi0D9OcfvbW1QId7+e9APOMYVGCu7aJ5VpM8nAVfTrsjyu1dqy9
	hTJh7IiTpXg9g6JSVLlYhtfUrDf6Za+mhbwpBYNFXm2cJYAPiLHdQZmrjNgjJafa
	T4XxlOjAhm2F8jpV78JCZs3mpbK2iGzMkLPk7E9aa9jf5sK6ZhliiZ+KMG3PwW4b
	id7tAw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6sqgp1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 11:32:34 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304dd29553aso397649eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 04:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780313554; x=1780918354; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B3ZGJB1FTG/N9elrkQB7UE0RwCW9ibLrwGuzABoGwo0=;
        b=e9ef0M37BfUBVLZi9M809iRI/7aWKeabQi/AT6WBXQruYUU3Wrw7FS7D2Hom/nvX3B
         5Pbj6Az7AGoeH5AE8x+KndiJWxYSseh1hHRIlmvLo6bQwTRkuE75bCAWiN8ftrAeqa2T
         LXfRWzaUaB23DbACZGALHPDirVy2oFkJUq7z9k162CVBopfHMvmebnl0WOOceCPL8BSL
         /nGmfO0E48ag5FkzPQHBjhGKY6NSnZqhX7T5cp2Cj7mAF99ni5dIDfPYc176d4Xx2rms
         fkQj/pFxcD3kiVI6A+cdNdDFb7/QLtzf9s1jV98CC30yIWvYdajvefwSfYPGFbqSLmF1
         h2gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780313554; x=1780918354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B3ZGJB1FTG/N9elrkQB7UE0RwCW9ibLrwGuzABoGwo0=;
        b=I5x3605xK5yJuoXpGmsaZ72CGKKyn6niHh0CgouJoD/FQ35RuK1ew7om/NTLK23hNU
         xl0kZyCG6GydgejmN3tv+pPnLmLAbcdrZifBquiQqSDkzhoiEgLGZfVmDwF0XqhbG9bE
         CDtOnSK6wLjwr0/CCW5sJMlNJC8prlfpwLgUqBV+S/rTavOZtanW8/NXRappw33LPxgK
         nSIQ8wjb93zNFspCZjAgugd9k2cDpwNI7IyfHHKO8Vld/2s49vwgoJQa4VvcIvOitrBp
         2EAAFe5jU0uw60B4Z70Chfc1KD8B/Z39Akqwvmiope7cbjZtXt2z5SEJlVaZB3VGyhcx
         W4hg==
X-Forwarded-Encrypted: i=1; AFNElJ95fxmhq/xgTW9RaYDhQURidgBn7WW+CuIQETw9qJ51pgHybbc5bpXyzna1hQST49lM36VujkdtFnIRe/yb@vger.kernel.org
X-Gm-Message-State: AOJu0YxK/02a2IYIyLb3ruSVpjYWGv9vL/93cyEdcsOeINR+UUxAAh+S
	IuKr0HstZH57gHS7csswFDZY8hVsnmTtRZ4Om1uiJ6H8406TPaYhFOxVIpvFlyQ+3Gj8wmHna5n
	2bUW+1RtYFO43HXpBms2pQn17YY+jzF/LBsqsdEJ3elN1jITYxJBNAw9Dkqmo4YlArxSF
X-Gm-Gg: Acq92OFK1GB4JmkIv1Jxnmr6OwVT2iU5CnrvxiVq9Y/AFp2f8t1zwON1DACWUS0/uTu
	QEZ/VLD/y9iCDKzg0bgREIV/sQ2qgpW7cwxNqySmRfC3vJwp+M2odW1H/mZqh0gJliRziecbHUQ
	UY5kiZ07VziRyPn6pV/B+26HTvTTDZaCmKOsBefab45OXvE5cViC779MsJ6osGPMuCAEXWH8LxO
	EH+5EMaaxdwY1ZpZh56aCcZWfrw6JAoFG2sV86X8sQO6X8+vhYkBT9tIvRnHfNwhpE5KnOeu+x7
	DEJMZ2pCgqRK1BJEZIUNjH4HLGPl65HDdq1BmpCUKOYuOOBB5CT7q6GymmUGp4806pXlRI+UkNv
	c6hdz3r8/+1Gg1dZV/YwJw63WDv9Mo0RMtbMEs0SsPC7Np/5ZwDlvOsYrt3RD9ytasNdudXtgI1
	z+Ca4=
X-Received: by 2002:a05:7300:cb13:b0:2d5:9438:2a02 with SMTP id 5a478bee46e88-304fa4a48acmr2304739eec.1.1780313553901;
        Mon, 01 Jun 2026 04:32:33 -0700 (PDT)
X-Received: by 2002:a05:7300:cb13:b0:2d5:9438:2a02 with SMTP id 5a478bee46e88-304fa4a48acmr2304727eec.1.1780313553303;
        Mon, 01 Jun 2026 04:32:33 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed2f2904sm8667431eec.9.2026.06.01.04.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 04:32:32 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 04:30:55 -0700
Subject: [PATCH 1/2] Bluetooth: hci_qca: fix NULL pointer dereference in
 qca_setup() for non-serdev device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-fix_none_serdev-v1-1-8d0497ba83b0@oss.qualcomm.com>
References: <20260601-fix_none_serdev-v1-0-8d0497ba83b0@oss.qualcomm.com>
In-Reply-To: <20260601-fix_none_serdev-v1-0-8d0497ba83b0@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Mengshi Wu <mengshi.wu@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sai Teja Aluvala <quic_saluvala@quicinc.com>
Cc: Zijun Hu <zijun_hu@icloud.com>,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: Eqo9tcgJY8uxoeiXQJzdU8arhKvTIQlm
X-Proofpoint-GUID: Eqo9tcgJY8uxoeiXQJzdU8arhKvTIQlm
X-Authority-Analysis: v=2.4 cv=eqnvCIpX c=1 sm=1 tr=0 ts=6a1d6dd2 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=EPjRy8lAqh_CNP4ImRkA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDExNiBTYWx0ZWRfX+RoJRBGGwP2j
 wNsxaT2Y/VDgJhPZyz8lg2x7MBeVtN6lsq707KR5j+4idHVHYNy1vD7ryNq+LB8CMC+KJXsr0Fh
 Wi3Hz/JpBuCow+gk7eL9NzS7Gj3gQNJlZGGL6d1sd3dU7EUjq8uY07neXkgPcp8usp/NDbHMUHa
 uejrqCJXc8FajpxNAckclPLX9dbTOWXNFvfh4MRt3Bxe3G+v+ZE7KVWqO6QSEy/hpOaeLsTxYLA
 VlcjHRNy3Dd5vVRqH/vjQXciw48Df3Cg0R+XRkUiUtqUWE0KB2uPQAciYnwCHzW6UzcKWjyP9TR
 F75Zz/e0SCwV92XhjpEHZEG/OuQv7fuYAD/OnkIlmpMRvz9Y0rkmGrCXBV6IdSkfqBN/Mb9tpXR
 fzVcJToTJrUPs6F4q3rS4eg6ps6xDeDrFj2rMZEVasxWr2qqCtK/Bt33aG8q96SXc0lC9VldoUd
 YJZQpoHY9InjHmDjeEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010116
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110574-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com,oss.qualcomm.com,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[icloud.com,intel.com,oss.qualcomm.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E20EB61E5B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

hu->serdev is NULL for hci_uart attached via non-serdev paths, but
qca_setup() unconditionally calls serdev_device_get_drvdata(hu->serdev)
and dereferences the result, causing a NULL pointer dereference.

Fix by guarding the dereference with a NULL check, consistent with the
rest of qca_setup().

Fixes: 22d893eec0d5 ("Bluetooth: hci_qca: Refactor HFP hardware offload capability handling")
Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 34500137df2c..cc7b34a61fa7 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1916,9 +1916,12 @@ static int qca_setup(struct hci_uart *hu)
 	const char *rampatch_name = qca_get_rampatch_name(hu);
 	int ret;
 	struct qca_btsoc_version ver;
-	struct qca_serdev *qcadev = serdev_device_get_drvdata(hu->serdev);
+	struct qca_serdev *qcadev = NULL;
 	const char *soc_name;
 
+	if (hu->serdev)
+		qcadev = serdev_device_get_drvdata(hu->serdev);
+
 	ret = qca_check_speeds(hu);
 	if (ret)
 		return ret;
@@ -1980,7 +1983,7 @@ static int qca_setup(struct hci_uart *hu)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
-		if (qcadev->bdaddr_property_broken)
+		if (qcadev && qcadev->bdaddr_property_broken)
 			hci_set_quirk(hdev, HCI_QUIRK_BDADDR_PROPERTY_BROKEN);
 
 		hci_set_aosp_capable(hdev);
@@ -2073,7 +2076,7 @@ static int qca_setup(struct hci_uart *hu)
 	else
 		hu->hdev->set_bdaddr = qca_set_bdaddr;
 
-	if (qcadev->support_hfp_hw_offload)
+	if (qcadev && qcadev->support_hfp_hw_offload)
 		qca_configure_hfp_offload(hdev);
 
 	qca->fw_version = le16_to_cpu(ver.patch_ver);

-- 
2.34.1


