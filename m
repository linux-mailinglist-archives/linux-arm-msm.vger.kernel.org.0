Return-Path: <linux-arm-msm+bounces-98077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PHoCOjwuGlRmAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 07:12:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFD72A439F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 07:12:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 257A2301135A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 06:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B84137DEAA;
	Tue, 17 Mar 2026 06:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QeMxCgk2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DlSx2UKL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDEF298CC7
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 06:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773727974; cv=none; b=mCP+rHb2Vq9N1IvtTfQb0efzOShB28zUT8kuG046Nlt/pbpl7qAJ+Wz1Q/q4DNGfMC3/Aaz6CUQTDBjasr9w0EqOw5n2a3mHSlWcLFe+5bJE7ChLEqnUCqpMcAoiX84snD/ouDqJ+cJRcapoT/HROu0F3VL/KJKt0ZK8H5qeiec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773727974; c=relaxed/simple;
	bh=05tbdlBlkRu+01VdTCGRGeQ/hSfOdjmtktuELANbCqI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=U25+Q3xyrYtOzGRwnlx/4y+IkeDpoNEPBJS+YE9qe7lxlSi5nz2UcwZPA69QW1p/kRN/UOLJywrx1o+NMTRqSUBnBr6QRRx62jBpFAsjsAA4U9I1oxzjSmR9n9jrjy9b1Mx3+YIsCx6ayVHPvd1FT+4BXtHIYzopEP5DJ+Ks6fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QeMxCgk2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DlSx2UKL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H2ZOWo4022797
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 06:12:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YSM2SMwhyaI38MfGxlBh+X
	RUxBiv2hS8quwXmgbaogE=; b=QeMxCgk22UAwpYc2YyQh6ZAsDB42vln4ieOJKu
	6IvBjOvgtIK2AbhBVAXqBxZ/6/CvfCdUus+LscVFORpuzdK3d1Hq45kfKNL+7uxH
	ZVgEnSeYKW7lAg/Y2vN0i5r3ZM+CzkQFx1ED+F7dwXfgkgIYUJ7MVU/SpG+5GTl9
	vh5Lpjf+CYXLf933MKNLTxaGkzuDDF+oXKrIttxz8Jo0GcQyOq6/0UahgSoOQpF9
	S9OqvXjdnO5x3IARXHmB8tLgvIxih7m21QIt3v/dSm4BwvC9RKxBZS7S4DSU01/H
	+4leMnnbTeYCxSk08HZqyPUE9jSWwLCc+VPVcCbEYOp84mBA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxn3fjca8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 06:12:52 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c7414516609so52731a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 23:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773727971; x=1774332771; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YSM2SMwhyaI38MfGxlBh+XRUxBiv2hS8quwXmgbaogE=;
        b=DlSx2UKLIwCVT6t4vEbz+SCvLoRBV2/AccTdR5O3EcfuBESokIJL8tn1x33I6AxmRw
         MPwfD8ULzOMVzSdg5iaypkD3Bhm1/BKsaR1Kb5h75r2v7qygcXnaLzjDaNwJkDk2dO1H
         FGat+dpRdbvoUEKNDXMCPAbMMt+wd4mrFOkmni1jGkH1bpZiiUxZlaIwqXvtMmytkk2r
         4IHq4wBjtVL/UzhWs/2eKz+O+iUBJ/vd5S2d6xIPJrEmhSL1fzsMdp5w9I2mSDqOzO+2
         KrSTsL0ARNJ3f5o/Jq1AR72UyQdAznrqO8GbSJWgLlprE4CqaSAEv1S7tsnn+bgRbMPP
         u0tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773727971; x=1774332771;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSM2SMwhyaI38MfGxlBh+XRUxBiv2hS8quwXmgbaogE=;
        b=VUKZXucJbQaPaQe0/ftqujCfruzH0zGan5G/1ZtZa+wnyB26W+LQch33dJfwfWg2uy
         KLQmtA7sgoDkEaEGfc2oeI3K+gD+w45SD8mmETgJyh8GPmulJ4Sv++QEE30ArNWi+Y4Z
         EqR2npWalPNWb0mT3D1Uh1A+DrTwUxtqAu6trvg/pigJBQRu43DLjxxxm4COLTq9wpmb
         eowwwG5LniIVaxbuxkIQVREo0mP2+ix7GEcUUcaZGTEfwAiXUEbZz7Bd9N8x4vfVETv5
         k6L481xKPze8JET/EKsGq3mlDOcGlYUKISPkDF2WelROJHd+cGhJ/4h1I/aLOZ2feYOd
         hllQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1j+pI7Q7pokvMNJg1MMmLYgClytjEFeqtG53xbEqkUNmtiWWXpchUE36+IvxglMcPdxx0R3DrEZEFiXCY@vger.kernel.org
X-Gm-Message-State: AOJu0YyyHu/tfWy66cVWrnuKq5t3cbL36fr9bm36XnxHETjF0mvDSr3m
	+H7Dvm0OyaFIqsup24PQIMDIeZQFE9xoS89N9ZKM9cCom+7BNV8+LmWsJGHEz+Y+D/QmtSgT3Qt
	GB25zoq5HerA6ADIdb1cfD+9FYrKnBal+mA7rkYekUNeTjKvhCZegV7wjZ0/V/5xgg8pE
X-Gm-Gg: ATEYQzyigChQERBIlWomxPK0HNi8yijh4SB8caRi/04f3TrSX+YIN97lhMCz6iSShli
	0NofrcvSN9FVjVnxMll4kltDqIg5UMemNzpuzGtUZf9Plq5mRPtf6Gy+9IR1SP+Ou4ZzCE46rmv
	c+rWcZ/8H+Ghh5fpKKp0s+7alQlhDA8fc8iW4xQKokLdM5u62VV6WGWDRl8hjZJupiruJWw0iws
	noDWPb7Z9S+0ENkN+lpwOKvNK6hePGvucmWplyiEHRe/CGuFE2M58U2F6iL1omhcgyvwEZ3vvDk
	RuB1jNpNW0YYTsSzsTAPaWRFD9zKKvma2vGXhZvO0aoztpGNSC7nggq71bung2YAkjVIsLJidfi
	Xzn8iE3Q06tTecffkDK8JOtr6VmXC4DOPn4heDhcWc6cwy4XDG81aowqZOasNjUCnei2GlGFPq9
	M=
X-Received: by 2002:a05:6a20:3d88:b0:398:7357:bb92 with SMTP id adf61e73a8af0-398ec9e200amr15746682637.5.1773727970927;
        Mon, 16 Mar 2026 23:12:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d88:b0:398:7357:bb92 with SMTP id adf61e73a8af0-398ec9e200amr15746656637.5.1773727970434;
        Mon, 16 Mar 2026 23:12:50 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0727e581sm14434149b3a.27.2026.03.16.23.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 23:12:50 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 14:12:46 +0800
Subject: [PATCH] bus: mhi: host: fix invalid free of BHI/BHIe buffers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-mhi-invalid-free-mhi-buffers-v1-1-8418a3ad604f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAN3wuGkC/x3MQQqDMBBG4avIrB2IVizxKsVFYv7UgTaWCUohe
 HeDy+8tXqEMFWSamkKKQ7JsqaJrG1pWl95gCdXUm340j+7J31VY0uE+EjgqcAe/xwjN7N1gjbe
 DHS2oLn6KKP97/5rP8wK+RxBnbgAAAA==
X-Change-ID: 20260317-mhi-invalid-free-mhi-buffers-ba490b94969e
To: Manivannan Sadhasivam <mani@kernel.org>, Rosen Penev <rosenp@gmail.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=C5bkCAP+ c=1 sm=1 tr=0 ts=69b8f0e4 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=foqD8dz_Jm88mIy5WCoA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: CPFzf2BG8UbMH-XKy-op9s5vUBY5CGU8
X-Proofpoint-ORIG-GUID: CPFzf2BG8UbMH-XKy-op9s5vUBY5CGU8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA1MiBTYWx0ZWRfX2C+HSu3ADWtF
 itTXvQBOHPf58/lKeamiaaQfyPagSLpMwuKKRH6YL0HMZ1Q3r55w0lYan/suizMDSjb7u7JT6iA
 hvBV6i3q6RVtSUSzDI2UrL0ZP4Jt/TlQ2t/JASrxkYLawNQS1ZQs3Q9CgLX82uRB1k0ZuhgRPRr
 WH2V1yOrFB0HPqHGeLZnTXWlkbwTS7L4hzmYHBNZkeBbOw2qh51BBYqK95v22N6xYUoCGXUybSD
 Xpn3UGaqu4k5HCNpDoy/xSfAQlgj9/5cYvjLpcWNPtauuiUNMoq4+0eIVPq3JwmX63tJRCUPCxv
 nbs9Xz9eYO1skcXV0vgfGbs8BLATh0c6V1pCwHZQTLavIEJdJZXz9pTCaZH4k63tTcuEtG5TEeS
 nRop4toq0nSmFHgrLKG8UHpZ8zAnKecuU6EcvUY/VsQ+YAQKx/us9huLqlPi6fuFEz6hQivET5L
 mePkDiY4VbLPDacRuIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170052
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-98077-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[baochen.qiang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BAFD72A439F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit [1] converted mhi_buffer into a flexible array embedded in
image_info by switching to kzalloc_flex(). As a result, mhi_buffer is no
longer a standalone allocation and must not be freed independently. While
the error path was updated accordingly, the normal teardown path still
explicitly frees mhi_buffer, leading to an invalid kfree() and the
following warning:

BUG kmalloc-64 (Tainted: G        W          ): Invalid object pointer 0xffff8b05dfb91c50
Slab 0xffffd490857ee400 objects=32 used=22 fp=0xffff8b05dfb90b40 flags=0x200000000000240(workingset|head|node=0|zone=2)
WARNING: mm/slub.c:1227 at __slab_err+0x37/0x40, CPU#2: kworker/u113:0/205
Call Trace:
 slab_err
 free_to_partial_list
 __slab_free
 kfree
 mhi_fw_load_handler
 mhi_pm_st_worker

Remove the explicit free of mhi_buffer so that the memory is released
together with its parent image_info allocation.

Fixes: 2f5ae4827e94 ("bus: mhi: host: Use kzalloc_flex") # [1]
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/bus/mhi/host/boot.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
index e1d77cecd75e..19c84913cfb9 100644
--- a/drivers/bus/mhi/host/boot.c
+++ b/drivers/bus/mhi/host/boot.c
@@ -308,7 +308,6 @@ static void mhi_free_bhi_buffer(struct mhi_controller *mhi_cntrl,
 	struct mhi_buf *mhi_buf = image_info->mhi_buf;
 
 	dma_free_coherent(mhi_cntrl->cntrl_dev, mhi_buf->len, mhi_buf->buf, mhi_buf->dma_addr);
-	kfree(image_info->mhi_buf);
 	kfree(image_info);
 }
 
@@ -322,7 +321,6 @@ void mhi_free_bhie_table(struct mhi_controller *mhi_cntrl,
 		dma_free_coherent(mhi_cntrl->cntrl_dev, mhi_buf->len,
 				  mhi_buf->buf, mhi_buf->dma_addr);
 
-	kfree(image_info->mhi_buf);
 	kfree(image_info);
 }
 

---
base-commit: 702847e8cfd51856836a282db2073defd7cfd80c
change-id: 20260317-mhi-invalid-free-mhi-buffers-ba490b94969e

Best regards,
-- 
Baochen Qiang <baochen.qiang@oss.qualcomm.com>


