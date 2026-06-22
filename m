Return-Path: <linux-arm-msm+bounces-114028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Fo9aEmJMOWrZqAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 16:53:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8866B0810
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 16:53:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WAHaLH1i;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cdq5NvtV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114028-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114028-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D57FB302AF14
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 14:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EBDB318ED9;
	Mon, 22 Jun 2026 14:52:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F247A30FC27
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:52:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782139944; cv=none; b=T0Dmd1aR8JUmxgnS/HlhLfOYY4qLgl6/vR5p5o9IZk7AgHRZH3e3HOlD41nD4eJtr51eKmCtYtQQE+feauOUSnlnCTtt94jtcGkNJ/VFGevg/pprNaxTfob5F5g57UpYjNcqnqG79QfUus7IVh7r1WW2j+bxRHC0an9l6ahyHdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782139944; c=relaxed/simple;
	bh=6NMQB6IDMD3/GAL65iyq1WL2WZiGM77Z5OQj0LrXioA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=an3Rw0XE57FiVMT/CX9yOaAuysXaWw38kqmpX31pVmrWMUg8kz4vOGMVYnBXh+hCc1MyeUaZdOUP/zN3sMQPXUkEoL2QsdXD+b9g8CY6pt3HiD9XV0fpb2m9ns87c5gqd/pDO4myw8zMwlPsi5xGE1VaGsiAxgQWYB4mPPmTV70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WAHaLH1i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cdq5NvtV; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MEgoHu909932
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:52:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3fSorn+BUeVEJzi+hjdN1IIZmHl/0iEbRgi53m7QPig=; b=WAHaLH1iTA1W9/xk
	tpQ2LfuDE7ia35wM7C1UbD8MA3b9F/0K/nFeR36kACD5/B7L0cP5W+AAVrlC2xB6
	3rY0sCSxP0EmDZIOSBGkRuDVq9HohuZlZoBPVQ0tcOy6VT/n6J4rWtoH7temZKjq
	yJQ8oLL9xwfTYgvRKyqk/xUlAz3dYGtscyjXPB0WM3QnRCFDkHmF5RSIh2+Et6A0
	zqa38p5pg3M/kuC7hLThtdl2OYsJMztnj8cb7wXVNvpfILW7TfYb9NL62Y7qq3NE
	SlB9VfyIqBlHhxGJ7zL8NoryU9/A5bWrvDAsxjvC8bDdeUlQ5J201zPVZkzkXnET
	3hk6tQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey729r1db-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:52:20 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-137eced000dso291629c88.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 07:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782139940; x=1782744740; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3fSorn+BUeVEJzi+hjdN1IIZmHl/0iEbRgi53m7QPig=;
        b=cdq5NvtVQnLKB9+cUBingEKUHdZPLuE3Nh8ljc0qTyYWh5HGR7kCXV4wNwIMUjt1jk
         peSTmbIwvUgdI5P5RKrbUgh7AvOgbbpE5/NE2APUbDEPo8v6ScroXWLxZXSR7Czb/5sa
         nDpb685q1UR09fimvt2TrCb9l1OvWYlrcTtTQpWieV665PMSnRilyB+Iq4nBkWLtKirg
         MfwjHb0EAOBikid+Lfe7TcYvTTctBdj+4IgoLYy69oHZjEQF9v4CyQ4GlevE7afLPcBt
         1/T8OcAB1+f1NkTZEMIbJaPzP5Z9lFK1aYJ48SGowx47uM6LzsnyDaOPaREjrcLuGPZt
         UXbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782139940; x=1782744740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3fSorn+BUeVEJzi+hjdN1IIZmHl/0iEbRgi53m7QPig=;
        b=BulR1K8jSDJvkIfdF+1mXpCD6MJh6ghH+YumY0BLqWrl9wglvDofHD7W7uzEmjn3Ba
         ty/1NZsaikpjnYmxppn6otcLebW7O1NvQQXXOkWv5nBlQ8+wwT73jFgZYAwNB0ys4VTl
         vh3gPSl/Hx+HsHU2UOi2aP0Mo2HQPz6H0TqAf/E29I0+NPnD1mhDgrRHQvtEL31tIbyx
         UwvpHFIkeTmeuLRSQqnFrHYMJQR+Q61vtINnVL/6OqYjqMYsXrF/oMqHTnWxRrwjVTda
         f3PkIPO14NmdVaA4DO8jiFjh6NjIrdsjUkZXXpoLpVp7v71w7XDAcVo7ayi+i0UDKmTB
         xBYQ==
X-Forwarded-Encrypted: i=1; AHgh+RrXlEYThND+OtLF3vjHIyFLGib1sMn5jSKNa3hSzSa4Nbbw0CPaIDu9tCkQZJ5U2R/rZWt/wolQ68W7/mdm@vger.kernel.org
X-Gm-Message-State: AOJu0YzAXF8uyV/8yw+9yt58aXtipNZKp5XMK6n/8UGrdf8rGYZ88Pgj
	vOVXgEG9IW3GrxJIkLaocJsU8h8+DtNmtFs7hNXbdTNT7A192Yvb9i9XdhEy5IP94P/JaymL4Wk
	H7mG0+Q7YmewBB2KUmGwpS/ae1ibLFgArpn+iGqp9a5RG6BVXSyVHDrUpZ4TdnP3zpx/J
X-Gm-Gg: AfdE7cmhq2eRmOdwlvJF0gulERDHNjZFnIkkjpeMarsWjPg9Hhbeay9g3oKJgP0Bmyo
	NclY+fz+x+BtjQv0UZxFRABk7P2uBr/q2SQ8ARYEmlmQPzSuz/0YeUQgLsVCIzzgblPqGtuFEcf
	QgHDUV9lFcy1ciE53IL7J2ddTLD4fEu4YzeTW4nBoJONz6viUOZVEbcEv69NFajJ1py4WNIH3P+
	5ooOnnv5lqUbn0BCHoWk1fuS9tkeSpyEKoAQ9RBQKkUL6++mj1brP3Wuvb9KUDtgZ09xv3zR0SY
	d8sJ1SwzONkZ5Wpr7wAUveLSwXB5zJzxHljp37NCY6O+0wOUmVd3xifBYE6O3A5VBn9iQUZzIfG
	kfFlKsKav5ksJ4OKlj1l4oL0HL1M+34oRlbQZxTTHpLzhuEx0xiaZo2BzTw==
X-Received: by 2002:a05:7300:2153:b0:30b:e4a6:1aab with SMTP id 5a478bee46e88-30c52443905mr219724eec.8.1782139939966;
        Mon, 22 Jun 2026 07:52:19 -0700 (PDT)
X-Received: by 2002:a05:7300:2153:b0:30b:e4a6:1aab with SMTP id 5a478bee46e88-30c52443905mr219707eec.8.1782139939294;
        Mon, 22 Jun 2026 07:52:19 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1bddfe34sm12025561eec.20.2026.06.22.07.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 07:52:18 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 07:52:17 -0700
Subject: [PATCH 04/13] Bluetooth: btusb: QCA: Do not populate devcoredump
 fields on ATH3012 or QCA_ROME
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-bt_bugfix-v1-4-11f936d84e72@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE0NyBTYWx0ZWRfX4HshPkhvoYvi
 isaZAzF2NOTzKXowfNOET/FkThwT5A0lB+NLV8fHPs/Ef3hZrjvFHsZUr4pbYzjx8r8cuYrBtRm
 BRdn7GQfKw5dbFg1GQon+O1r6G2yYAU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE0NyBTYWx0ZWRfXwWvW+Mhqwgxe
 l6zEngIIYUO6iZKIRdONYHZowGDlvnlpOb3IQwGU60J5pjldm8Tvi+j53Bb00GfsWeygykZkv2e
 rLLPao+A96Rngo0CwVVFxp8vHw7i5Jj8i971BcHI3ikxKkTEuTytVP1PjIHbQwr6Zp55fxE2mKh
 XD5TyKBe+shC/h1N3mJJQyW/dy1Nuchf7Q87YbMCljakDMeQLE9Uw5FFpM8xxJkAw5GPiq9IP42
 sU3ku/6N3VXGpssNBP68qyw6cOmyRC69RSTCBjfLcuqHwzAOFHXUHINcuH1a8qyzl+wUM7akccv
 rEHSOOdjzO7n9rQbOX+kgdTYSHLYdpgr81bO+RZ+4zC9uzrNBDq9Sz1uukyKR7jm1wjfnrZG8ZM
 NfmgxTmDHESW9SissRtbwJ7h8TG8BhvgnL0QNrjbc7EAcNb/17Fy4IulnfSjiA1Kt6TiiNzJeKW
 2E1QzP/QBj8lRZqDelA==
X-Proofpoint-ORIG-GUID: JTFJbyWNfMbOyqMNXahTFgREgpFlByG_
X-Proofpoint-GUID: JTFJbyWNfMbOyqMNXahTFgREgpFlByG_
X-Authority-Analysis: v=2.4 cv=eN0jSnp1 c=1 sm=1 tr=0 ts=6a394c24 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=j0w3eOB3VtzsIZiBwfcA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
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
	TAGGED_FROM(0.00)[bounces-114028-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: AA8866B0810

Devcoredump is disabled on ATH3012 or QCA_ROME, but btusb_setup_qca()
used by both unconditionally populates those two devcoredump fields.

Fix by populating devcoredump fields only for BTUSB_QCA_WCN6855 devices,
which are the only ones that enable devcoredump.

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 drivers/bluetooth/btusb.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 6a90f012b226..184a87d1234c 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -3708,8 +3708,10 @@ static int btusb_setup_qca(struct hci_dev *hdev)
 	if (err < 0)
 		return err;
 
-	btdata->qca_dump.fw_version = le32_to_cpu(ver.patch_version);
-	btdata->qca_dump.controller_id = le32_to_cpu(ver.rom_version);
+	if (btdata->match_id->driver_info & BTUSB_QCA_WCN6855) {
+		btdata->qca_dump.fw_version = le32_to_cpu(ver.patch_version);
+		btdata->qca_dump.controller_id = le32_to_cpu(ver.rom_version);
+	}
 
 	if (!(status & QCA_SYSCFG_UPDATED)) {
 		err = btusb_setup_qca_load_nvm(hdev, &ver, info);

-- 
2.34.1


