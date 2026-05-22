Return-Path: <linux-arm-msm+bounces-109226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Cu3EbopEGpQUQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:02:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B08A55B19C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:02:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 59EE03029A65
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 10:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FC313C7692;
	Fri, 22 May 2026 10:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eHh7X2gG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="csiyx7o0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAA03C6A56
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444061; cv=none; b=DlBPSi+2XOX5sasINesUemGPgygm7Vq2N7iWXq1xOhu7PMmfa1OS7btDW0/2A9kja5OStc2zJu33E1zO4cb64nolRlL4yMdnDukOaXlMaVsmTLJHyTixqt3JWVcI11PavfMmFufiKE9dcjCcsThjqX97VS9wNfukK8otl9tG0gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444061; c=relaxed/simple;
	bh=eEEN3EXZH9+ocSgYvv06EBOEmhgPIImBeQeRcWVT6hU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dT4nClSf6lWRFivii1cOS7+hTowEpi/8gzmyy+MI2y/vGUEjiPTUNEUBF3a+1NgIr2soU/cozEOi6vDuuoIc2zaki1JBbUMygufBhUAlEi8KLYX/SC+3RT5P342CxbbxRwVy6/8z5ZTvjsjSa6p1vrhiWb5Sw3gJmylKzTKCz0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eHh7X2gG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=csiyx7o0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8jdZE399240
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:00:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YR4rbS+4WUMiEynV2sZr8pSzcK/RqiAN6yJ9tTgtN8c=; b=eHh7X2gGrSZekNOb
	xkDmqbEW54k9aNsjuHmVMXxsX8I8pWfkpIefqSA1ncFswM3zO7mNthHR9mPKM43H
	gdAmQwJvnzvcpAHEzUyu5HWmyqySgPIKvuiNNnXArB1Dm6Ws4O1XZvQdrUbrb0rM
	e5nH7dsWC7/h2UU/D6aL/v3gFuGWLccts+1ZPuEuleYzrW0DdofrlBxGwwdzeXO1
	n2Hx1KrVjELW8du55RA5vhG3FBDWrn0xMTbfzGDQr2TFvHW37LDxACLaIp8TgmjJ
	581P1XwAw4f3uPjgmxmq5AAPMezvBPq0QMjka/UXu0OVM2KHvs1t2VIbYinr6PTk
	RKTB0w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea5p9urxn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:00:58 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c82894155ceso9997610a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 03:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779444058; x=1780048858; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YR4rbS+4WUMiEynV2sZr8pSzcK/RqiAN6yJ9tTgtN8c=;
        b=csiyx7o00JbeY2fYsF0w1GZ0I0hnbeB7NfnOT3YR8yK3Jg4bEA71CV8t5zSQKZ+iuI
         aZmJU0Bkg/ytsgihmwTPzWOBj+3auW+IOfDJeBnGM4/87+FwgIoeUScQyxTW3ZnHP0f7
         42vBfnmfoAifMToB8Crnz0bD4aG6HH4+OBuTNzQRcotKkvT7V5fFd8Lk0/303IH3KMK5
         k3ljlorDh5XJVaIsmAGedspSiWqZwRZhqE28S6PmT0UCwrnmdUr/Kda564l3kGejnIWy
         KEzCUFqadpbMAkzvfIMJ8MzQ87oYC0FNa5bPDlXrs3dKFxQ8fzXpBqnZNVOVW2lzoz3l
         TxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444058; x=1780048858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YR4rbS+4WUMiEynV2sZr8pSzcK/RqiAN6yJ9tTgtN8c=;
        b=U4xyOHj0xMLNKFpteNRrQrYMHq1WcIM8cKHjSO+IB4thU/tOWTLyOIdRl1J/O+BBef
         3siCNhgyhpTXpbPJFl5suUW9EinjoAJXbSN+yt6VSjBd3eKaJJp9N6lwinQy6TCeeSmC
         ItdHbfdC3SV/HXcfFr8xDrtHMqzmMeGEDH8M0HqljLFB5RJW5sWkLCuCjWMx0pX7+s8Q
         2rVz3Rbjfsf3XFRi3yVf4/E8AuWSyOFmTxvPA1NcGuI2aChWPFQSICyo8lx3NRq9Rus5
         uVoCGnWGRvp3neE7iJ+c+bUqMDe9SPKDilrF+CTemzWc4nGYRi36zWbw4Q9Zi/9GJLGv
         hwuQ==
X-Forwarded-Encrypted: i=1; AFNElJ8eXYX4YWck/72lfbtrGgjliX3Xu8XbjjVigMjn8XEHV+7BoaxHE4/b9pgP6y2g6racjG+vd7EY+C7zLuV3@vger.kernel.org
X-Gm-Message-State: AOJu0YzHEdXp2gF6IHL3Df8pXOGevaSUiMJTZXXPcdQQY0w4iRlw9quq
	Ic+U8YyFO4fh7+s4k7jyee728NfPrVV3KOU1PzCJdmOvP5Tb6Vgzl89lKVVbKn+BRThfjQ07hPc
	LqXTlwL2ZVRzeDTnJ1BoD071MoaI1W5AzunOkBBd0gJWgzHbpyreupImSPL9Zqg9JRAhq
X-Gm-Gg: Acq92OGuZjxpZQw2JfosC1Hv+ZXVcavjeCz4WQe+qxWN9skANPm+clnXyMYEkuWJMCU
	iLNVVHIdlbFuvv/HbH2GwhZoexy3DKheWRBKadp+66nbTFJjHgWykxoJ0B+KhFKSh267pueEYoG
	oOehrs6yLwMD33eS76RgM6lzbZSamcQs+sPFoGcxGWPkx3B/H2uPozmeo1EYYJnyoYWwqj53iM5
	DNq2hlIanKjL+1y/8sigb+uCx9lUg0F5hwUkVKYdz0+2JTJ2h22eGXuZ+Frc5SG1Nb7H9Vq+bJ1
	eY5pgh1GDgcn/PXyEPbDAQC8Jf9pgGpYJJDAq0n5kZTedtqNLYn2NZJn2PXW4VsPdSGqbjOHUDe
	OYCaZhYyTa9Ft3gWcKATq6vLfQSTMtdyhZuIz8XDNsmOtDoEmihJZ/Dc7
X-Received: by 2002:a05:6a00:2daa:b0:82f:42bc:3386 with SMTP id d2e1a72fcca58-8415f1a5318mr3309590b3a.21.1779444057676;
        Fri, 22 May 2026 03:00:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:2daa:b0:82f:42bc:3386 with SMTP id d2e1a72fcca58-8415f1a5318mr3309509b3a.21.1779444056898;
        Fri, 22 May 2026 03:00:56 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ac9b74sm1516641b3a.3.2026.05.22.03.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:00:56 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:30:32 +0530
Subject: [PATCH v2 1/6] bus: mhi: Replace controller runtime_get/put
 callbacks with direct PM runtime APIs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-mhi_runtimepm-v2-1-fbebf41a82bb@oss.qualcomm.com>
References: <20260522-mhi_runtimepm-v2-0-fbebf41a82bb@oss.qualcomm.com>
In-Reply-To: <20260522-mhi_runtimepm-v2-0-fbebf41a82bb@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, netdev@vger.kernel.org,
        mayank.rana@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        vivek.pernamitta@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779444039; l=4878;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=eEEN3EXZH9+ocSgYvv06EBOEmhgPIImBeQeRcWVT6hU=;
 b=yYhT3RpS8Nz/uaR392bqwxteKBb/FYzWe1XQYz9VQyNj0buTC58NW65aH4cKIQFB4iRyHRzbO
 TWR0AthcqCIB6R0xOUx+HaDt8erCDViPTRy7/AJD6uO/Nw6HrkjyI/U
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=DKm/JSNb c=1 sm=1 tr=0 ts=6a10295a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=A_fZCR7qwrwYhkduS1cA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: qEj-u2PJOy-cYCw0B_yxZf47cO8nV5ep
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5OSBTYWx0ZWRfX43tHcUiPgSrd
 J3pOMmJN0bZ27ksYTsg/9WFlavmacvhKOpp2qUR+FcC4CLejAbTo3tSJcAKyzJv8vxJVi4a+Xj0
 FswQz66nZcAZfB3dgK2TdPivq/YnfuuyA4uCY+5j20dCQ2evg5YA1jByY8SHjkPRqWiDG3XS/J1
 otDJph+tWuhs85BX32gA5eQSu9U7QqKKyb3xKk9Fz3lTk/B6zceq8r45a3uishKXNW9q+qFgeoR
 CzUsy5Szq20zYsSNjG/3Tj0Qmp1Me7wvbomuAiKYFD9o+pbAZmRcy/d5dyF80JdlAZfpPRR9SzW
 POvVjrgLQH+pSSsjxBWtWIiCmKwMDStUqH+f78J8Se48cQooQrKfdQZDDoXYCPKsAvhrmAXawwx
 3o+H1Npb/8pQ3bWogeTgg5/cUtXVnyB4v6LFerrighf4/e8GcuY91fTqlmGzZYs65N/I/eZ1LFH
 Ik8i6VYpA8j/OJ2yGiQ==
X-Proofpoint-ORIG-GUID: qEj-u2PJOy-cYCw0B_yxZf47cO8nV5ep
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220099
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109226-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,sipsolutions.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B08A55B19C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove the runtime_get() and runtime_put() function pointers from the MHI
controller and replace their call sites with direct calls to
pm_runtime_get() and pm_runtime_put(). Also add pm_runtime_mark_last_busy()
before each pm_runtime_put() call to properly update the last busy
timestamp for autosuspend.

The removed callbacks provided no additional logic beyond wrapping the PM
runtime APIs, so eliminate the indirection and the requirement for drivers
to implement these no-op callbacks.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/bus/mhi/host/init.c     |  1 -
 drivers/bus/mhi/host/internal.h |  7 +++++--
 drivers/bus/mhi/host/main.c     | 19 ++++++++++++-------
 3 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index 0a728ca2c494..9f3ee4a14418 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -927,7 +927,6 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 	int ret, i;
 
 	if (!mhi_cntrl || !mhi_cntrl->cntrl_dev || !mhi_cntrl->regs ||
-	    !mhi_cntrl->runtime_get || !mhi_cntrl->runtime_put ||
 	    !mhi_cntrl->status_cb || !mhi_cntrl->read_reg ||
 	    !mhi_cntrl->write_reg || !mhi_cntrl->nr_irqs ||
 	    !mhi_cntrl->irq || !mhi_cntrl->reg_len)
diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
index 7b0ee5e3a12d..a7493aabc6fa 100644
--- a/drivers/bus/mhi/host/internal.h
+++ b/drivers/bus/mhi/host/internal.h
@@ -7,6 +7,8 @@
 #ifndef _MHI_INT_H
 #define _MHI_INT_H
 
+#include <linux/pm_runtime.h>
+
 #include "../common.h"
 
 extern const struct bus_type mhi_bus_type;
@@ -352,8 +354,9 @@ static inline bool mhi_is_active(struct mhi_controller *mhi_cntrl)
 static inline void mhi_trigger_resume(struct mhi_controller *mhi_cntrl)
 {
 	pm_wakeup_event(&mhi_cntrl->mhi_dev->dev, 0);
-	mhi_cntrl->runtime_get(mhi_cntrl);
-	mhi_cntrl->runtime_put(mhi_cntrl);
+	pm_runtime_get(mhi_cntrl->cntrl_dev);
+	pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
+	pm_runtime_put(mhi_cntrl->cntrl_dev);
 }
 
 /* Register access methods */
diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 53c0ffe30070..71919c2e9462 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -661,7 +661,8 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
 			if (mhi_chan->dir == DMA_TO_DEVICE) {
 				atomic_dec(&mhi_cntrl->pending_pkts);
 				/* Release the reference got from mhi_queue() */
-				mhi_cntrl->runtime_put(mhi_cntrl);
+				pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
+				pm_runtime_put(mhi_cntrl->cntrl_dev);
 			}
 
 			read_lock_bh(&mhi_chan->lock);
@@ -1138,7 +1139,7 @@ static int mhi_queue(struct mhi_device *mhi_dev, struct mhi_buf_info *buf_info,
 	 * for host->device buffer, balanced put is done on buffer completion
 	 * for device->host buffer, balanced put is after ringing the DB
 	 */
-	mhi_cntrl->runtime_get(mhi_cntrl);
+	pm_runtime_get(mhi_cntrl->cntrl_dev);
 
 	/* Assert dev_wake (to exit/prevent M1/M2)*/
 	mhi_cntrl->wake_toggle(mhi_cntrl);
@@ -1149,8 +1150,10 @@ static int mhi_queue(struct mhi_device *mhi_dev, struct mhi_buf_info *buf_info,
 	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)))
 		mhi_ring_chan_db(mhi_cntrl, mhi_chan);
 
-	if (dir == DMA_FROM_DEVICE)
-		mhi_cntrl->runtime_put(mhi_cntrl);
+	if (dir == DMA_FROM_DEVICE) {
+		pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
+		pm_runtime_put(mhi_cntrl->cntrl_dev);
+	}
 
 	read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags);
 
@@ -1352,7 +1355,7 @@ static int mhi_update_channel_state(struct mhi_controller *mhi_cntrl,
 	ret = mhi_device_get_sync(mhi_cntrl->mhi_dev);
 	if (ret)
 		return ret;
-	mhi_cntrl->runtime_get(mhi_cntrl);
+	pm_runtime_get(mhi_cntrl->cntrl_dev);
 
 	reinit_completion(&mhi_chan->completion);
 	ret = mhi_send_cmd(mhi_cntrl, mhi_chan, cmd);
@@ -1383,7 +1386,8 @@ static int mhi_update_channel_state(struct mhi_controller *mhi_cntrl,
 
 	trace_mhi_channel_command_end(mhi_cntrl, mhi_chan, to_state, TPS("Updated"));
 exit_channel_update:
-	mhi_cntrl->runtime_put(mhi_cntrl);
+	pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
+	pm_runtime_put(mhi_cntrl->cntrl_dev);
 	mhi_device_put(mhi_cntrl->mhi_dev);
 
 	return ret;
@@ -1524,7 +1528,8 @@ static void mhi_reset_data_chan(struct mhi_controller *mhi_cntrl,
 		if (mhi_chan->dir == DMA_TO_DEVICE) {
 			atomic_dec(&mhi_cntrl->pending_pkts);
 			/* Release the reference got from mhi_queue() */
-			mhi_cntrl->runtime_put(mhi_cntrl);
+			pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
+			pm_runtime_put(mhi_cntrl->cntrl_dev);
 		}
 
 		if (!buf_info->pre_mapped)

-- 
2.34.1


