Return-Path: <linux-arm-msm+bounces-114032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3UofF7NMOWrtqAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 16:54:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0993C6B0840
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 16:54:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=P1whjjWy;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="UzE/asAO";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114032-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114032-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 76BD2303E121
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 14:52:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53A4231DDBF;
	Mon, 22 Jun 2026 14:52:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6A5311967
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:52:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782139946; cv=none; b=n8GS94hHIbD+I07C/+Pl+G97db3RiH4+rQYBvTb65n9lCUjAh2bX1Qvy+zITPhmF0sdzE5Q1Uv8MxwdcYauiN9TdwN/XDVD7lsIHR7rcaX53VEyiKrK7sie3WgjeS2u5fgFDXEJKc58BZ3bofGl07Gt120MJ3DZlmT0DN0WHVNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782139946; c=relaxed/simple;
	bh=BE4ypfeHsjBgQjbsJixHXPZKHbTF7YpSfUoFv/8oRvs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rToIBD3ga5X4q2ETOAary6q6F9a5au/+oIR48E4tR0ja6qRqVkR2Twu6JGijTa0iu7wnBzshp1Pl9NszkebO7lVul4SCMBNCO3arw9KSRwjPCeIdjH3O7dtpCyJbXy1ASlanEe4yxd4UyVZvzqVvBDh2e+ZqlKnopNhqdoROAY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P1whjjWy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UzE/asAO; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MEgofv909943
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:52:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bAGyxtUFV9OfbTbFgd0iuyiuv0DCnat+0LV9beFY0Rg=; b=P1whjjWyIcuYsXSg
	GpuweiNZQzxA1t/Tq9BTxYavie2BZ8zJU9YlebEK0mvNYnTTc5sMA9aEjM0EGhT9
	9mv+S2YhTCDO+ClHt7NJm67/iXtsVm0QYtNx2sj3ZBGDmNMrWiCMUNgxn4nC6YJn
	Zh7y8hoJNDotd1t9YUvAPoiECYtzUTr0ajM1PDl+v3eNmzsvss/MogCmSvLkEV3+
	H+hKf10236cUgGcS5v59m0OBInyDX+4Jk1NgaQhh5AhYpwV1MIA+9kRsUv4HtM88
	h7i+bryce+GCmYBZxOomHmWsW6WauAE3XUjL2elYhahsdzkAa40wTZzcuc7NqzvI
	pg1iAA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey729r1dh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:52:23 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30b7fe4d3f8so709117eec.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 07:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782139942; x=1782744742; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bAGyxtUFV9OfbTbFgd0iuyiuv0DCnat+0LV9beFY0Rg=;
        b=UzE/asAOcPmV+ZMVhEFI5zNl/wRUa9MmhX/E6tRI4oZLvj3+/t/Wx3w7vS4CEkpL3r
         2NzsyqE5ZYqh+k6siXSGAiQzpmbou4a4WXZelZ+oLzHL4O6wRiGLMJcIr6EBibpgx+Ma
         4aXAr5lzHYinBBKT3QY4OUqWgduI9xs8OaJo/yRlXDmICPfwdpmTfgE65Fgnl5swBy5i
         HiIqDBlPzTDsJ8CSmHXtRyPbqPZ87qd8g0JxKZWfSFmEPfRXO8nTSMpKFvgu5dFMahSM
         0CilsbQNmRLwLtlz6FTvlY1ssQ64nsj8myEX+RzwXrIAviU5N//yJGJPXZ9LPaO4Ybzz
         IPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782139942; x=1782744742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bAGyxtUFV9OfbTbFgd0iuyiuv0DCnat+0LV9beFY0Rg=;
        b=b6aiZ/DVFhqKphOHGS/UJdc1y0q2dTiQj11UQmELYUfRo6SUpEqX+Luj9hezKuuiTI
         HcKTn7dNHPF+LRRP3807RxRMoT/fnXrxMiMCOU6UVAlkp5pHjCsVBzHtHuIqIJ6lo9cn
         T905oPkEhWdRf3SRrh2zV03ywc9j7CMyb9BcNZ9+kAtazTLD1hMz9BJ1CouQTFV5vflV
         LDpKnB82Rh35i7QLV+leFQip06JMtsdZGRd5zLzltepeRfJWc27Ffyn1koXU0zHgOZsj
         F4xk7udbaVhKQPWx0oUFhtLzTpVb95I8QDIXQsvJ2X3BEDDiFbRYxEfVhHQQrzkYYRdQ
         pFkw==
X-Forwarded-Encrypted: i=1; AHgh+Rq66XXXy49oFSC0ZkpxQBCMj2SsvLKn23+gXdMECpqaAAx7JCgHOqUKr+ys5wik5vwppa13gYgNnGU0sHW9@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh5flUlaE2hZPGIE+d5AmDGg3ncyATCLcItPP6w0nXmP/BHszP
	FfKufDAlqVbg8/bl859VdXKalRSlcel+JnwqlmJYKbCiomh8yeDuOXBME3/ReIsXJiE2hzIArd0
	pdPFqYr2UmkxjyxhS+Gc6mrMP1AOtKAHzeR6WRdqkcMn7nf130f3NoVWg6gjZbT8aGuZ+
X-Gm-Gg: AfdE7ckas4N87euMmiHU9MR3tl6CeqtAqgHpFkYo8hnCL5jjHdGei2Kz43PRhDRXhsH
	JePfHcJxd9bQExHs0oPjVtlj27L+rfwHu5U3JgBZ3cEz2uloLS7t/0y/P8GxN0sNr2Cq8EJzb9K
	ej5OFnxw076BFOTH+joDl30c9bm/2QESXtdGDfFoOFGYTnBmJpxhTkmeyZUvrFPACGf2VBqZUqE
	4ulgxSGFBod6Mc3u4PdQI8Bri4WhVG7PPDpSP0cCFl5lTCu/eBy7stmfbuWF0WGHqQxmiWdJBMr
	K1Io0Pw3JT0sUJuxsFnBtVPBElwg4N1a30goeNKnjWMO5l5zJKsj52fiKXIgxdVYvnkNu2++l2J
	ILEYH0oHX5kVFViE+JVQjog/tU6IFgoPqR4+SiVJq08Dk78ulnh/Gw0agRw==
X-Received: by 2002:a05:693c:25c8:b0:30c:496e:982e with SMTP id 5a478bee46e88-30c496ea017mr843560eec.6.1782139942340;
        Mon, 22 Jun 2026 07:52:22 -0700 (PDT)
X-Received: by 2002:a05:693c:25c8:b0:30c:496e:982e with SMTP id 5a478bee46e88-30c496ea017mr843553eec.6.1782139941820;
        Mon, 22 Jun 2026 07:52:21 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1bddfe34sm12025561eec.20.2026.06.22.07.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 07:52:21 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 07:52:20 -0700
Subject: [PATCH 07/13] Bluetooth: hci_sync: Simplify hci_reset_sync()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-bt_bugfix-v1-7-11f936d84e72@oss.qualcomm.com>
References: <20260622-bt_bugfix-v1-0-11f936d84e72@oss.qualcomm.com>
In-Reply-To: <20260622-bt_bugfix-v1-0-11f936d84e72@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Ben Young Tae Kim <ytkim@qca.qualcomm.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        linux-arm-msm@vger.kernel.org, Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE0NyBTYWx0ZWRfX8QSRVF57P4QL
 UVKpCeRn7EAaSAofvSjjQ6Tk6EsW+1A6shEd2b5grnRokvM5qALfhscQugw3J8op0Yml4GEwKqS
 kCBWtUKoPoXkDW8uXArlnOMG6dkeA1Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE0NyBTYWx0ZWRfX/HGcX54e8bol
 TGZCzAAwc6FaSCljkQKYFjtlqxegFNpZDafUuAt/6uDpncdqPXfjTdfb75iQElb/Xms6yrz1Mb3
 TjwzE0omJXLOsadRgFN94VwmJ7yvSScekIv8fsq7TBe8jUxZNKGVhoq1no9ZfBq83DQOvC4OZcg
 06MdY5McJCYcqyY1uP/AFWGL4cUcyPxbdMNOEAAThQW9RKse0203t72xmwRTpFieIZkAbYPU/Yz
 9CINsVMnRWeQOOUUkzzUGmDM9hPKg14mpmL+Ttysf1h6QiR/tBQetdDldgVsc4qiCUAvpRCgyxK
 rLMW6DxnUM+STWnuzwrEm3LGq7EtNGyxR56opkySVF4CILzrZ0Bp7gBHbsG1MM7Ujd6Cr+I1oAs
 jkPmiR+f1SfF6L6dYxZA6cHYJblxArvUXA91tvZDkSF/d75eU1v/LI+9B3QkrVbSL5XoVasbqsG
 Tc+2Mz/PK/0eN2hSa2A==
X-Proofpoint-ORIG-GUID: rW5mfsqtkG1ypvSFt1uFCvjPgvhIw8HA
X-Proofpoint-GUID: rW5mfsqtkG1ypvSFt1uFCvjPgvhIw8HA
X-Authority-Analysis: v=2.4 cv=eN0jSnp1 c=1 sm=1 tr=0 ts=6a394c27 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=JW6sVIICzvLrt9BNRHgA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220147
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
	TAGGED_FROM(0.00)[bounces-114032-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_rjliao@quicinc.com,m:brgl@kernel.org,m:ytkim@qca.qualcomm.com,m:quic_bgodavar@quicinc.com,m:mka@chromium.org,m:zijun_hu@icloud.com,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luiz.von.dentz@intel.com,m:linux-arm-msm@vger.kernel.org,m:zijun.hu@oss.qualcomm.com,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[holtmann.org,gmail.com,quicinc.com,kernel.org,qca.qualcomm.com,chromium.org];
	FORGED_SENDER(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[icloud.com,vger.kernel.org,intel.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
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
X-Rspamd-Queue-Id: 0993C6B0840

Return err directly instead of using an if/return pattern.

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 net/bluetooth/hci_sync.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index 3be8c3581c6c..fce9f9526cb5 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -3678,10 +3678,8 @@ int hci_reset_sync(struct hci_dev *hdev)
 
 	err = __hci_cmd_sync_status(hdev, HCI_OP_RESET, 0, NULL,
 				    HCI_CMD_TIMEOUT);
-	if (err)
-		return err;
 
-	return 0;
+	return err;
 }
 
 static int hci_init0_sync(struct hci_dev *hdev)

-- 
2.34.1


