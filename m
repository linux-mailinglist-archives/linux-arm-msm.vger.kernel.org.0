Return-Path: <linux-arm-msm+bounces-96390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FciK3BSr2m/UAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 00:06:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FDA2427FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 00:06:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9862E30C576B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 23:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24A6840FDBC;
	Mon,  9 Mar 2026 23:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gloHc0jc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jTEJu0MJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B056F38F943
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 23:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773097551; cv=none; b=YNcAae4zj76jJ/9KpaYnGO/r9BMwLG2Lp6J1/E4XaYfatPNYi5tL8gC8QLZDtwvHzUxvkOz7ZU6z1sn0gGt/vVTkTlXAsfIfS56WhX5dlRhnkH2kV6TbO4AqwQ1riqzVT0p9G9OxivciWVVU+yWO0pb8/Af7efo1rK/vmro9jpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773097551; c=relaxed/simple;
	bh=vxfMiR5RjXUasWyw4A83O5C4elvrw071f7dlCLFW+9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LEzrjUao8ZO0j7L3sDTPJmNh8ENB4iTUGXvwoAsV0bObTa4kpW+efvjbQnlri+z2FhW0eU7HpqdP2+ZQuOKnXDCrU1r7Om54avJVYjVR1B71bb7/ciz3WlF2krIvIrCrb7iNUq/14t1psyOLauQY8G2stI6TW7Q/TPjaF7NJnnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gloHc0jc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jTEJu0MJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HC0ll744374
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 23:05:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4nuiFplGeEP
	W6F+CQFmrK11Lx/4N6iGgXoWw2lOEPQk=; b=gloHc0jcRhYOoGyz7DgdnhjiojN
	H9hpeKUd3Kr08GXwo2N3xaErYbMYE0ASu4NTUYcKjZ9ez2A9Ln/ugpg39/yqLKpt
	mJqC7xYLnB5LKufywMAf1lsUOjU0QpQNbrVZdB+sEyfZQPgeemL8PYJLPvILMPtg
	J9WFvV+Y+4Xa9nvrlKx47wQN0VDhAsMxk6T9hBaepKW6iyHsUBePHNABli94ozlE
	2crJCJTHgxTLIb4YTD/Z6PXFQqMxMW/7NsUo2SFXI008JG2dOtvgKhb9qGrKUvGX
	iIBjRfQLrG1MsJtDR2Pool1dBuNiAgVrmfsr2Hh17M6MiZ/6pAmlisLu84Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cstsaarhk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 23:05:48 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-899f6e5b909so543745686d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 16:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773097548; x=1773702348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4nuiFplGeEPW6F+CQFmrK11Lx/4N6iGgXoWw2lOEPQk=;
        b=jTEJu0MJAhxNbmjysgomqhfYcYjYknku0qx7bFVcZoKbwwKDAwmCh61gMEijFL6lIM
         QUpW7k97vzkxS8AaoOVFDhFILXIhQo6tLshwmymfIbSVLO3e6Ipx/pQqVVjDPXGEuntS
         SMKISqVW7DMlqfr/frcyaKaLIiTX4mBkD5elNhbeAYb/CyP1shrlWS1g7li2hcrNGxgt
         mLN4StG4ClTNi7aQ3SwUaCsghA1W82NFQ8csA6mSuVrnM0x0J9tF2dKsIdCVu6lC8QoB
         vCHvAatWnrNVSZcA4MgTBg3mG0JpLxioLewX0hYywRcMHHy/miLPFNQmsXzxoswWIfd8
         Pesw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773097548; x=1773702348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4nuiFplGeEPW6F+CQFmrK11Lx/4N6iGgXoWw2lOEPQk=;
        b=Si2LcIOKhWDJPkh7ZTWmZhBMtIsYk9FSwWMQlBIHMNS1Joq7Pwa4KFRjVGS63ZyAR/
         u6gbkx9CR0IAxtHsRv9u+aZpznHf9aS8sjFrheu50vZOSpZE49kR6K+D4dHOIPaYgUDn
         LpnwI0fQ2f370fYZvAJMQXJA5lnb/2rK9rNQFZFzWKqaFPlw8V7Ca4cr3uXPzj/VUxbb
         B5U+/zaEAGg6dJ6N0PCpzcZZJVI3GS3HKxIAGmWWC+Ado3rA+VOjjdFIdpa3iDspM7hq
         F/kfmOAT5hMZChAOeQ4ZxB/PEwmEZ32nc7TUE9HRvXYeT/uEgLqrxdITMz4YatRHOafZ
         jU9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXO3B1gvwBlatUQnj0+0ATN7E3BSO6OFzo3nnSSWBVLDXbx2vi+lZRYjOYAkM0EHon9kj7L9cTCk2VNV2b3@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4D3sBRYJontjcK9ddxjHECNmr1B+bWtP4gTSv0eByGpgQ4jRa
	B9rrq4yzVqvjzBI/hcchAKlJeZWlTGZibgR3BQJVFoIs3X53S/cFEP6gWiYn5rP3OKOLGhIxXKW
	NgYWOUrmgLqOoMpVKSfIEEqBIKytkO7NIXqbtVmv92M6uEqmyxBb0CoGAJ6p+kz4nBQe1
X-Gm-Gg: ATEYQzwexMCVdicyPGrCcWs/pe0H509TokIztwp1EQn9v/aCocLLqBvCH++R8xEgSZA
	A9rIrODuJGo8jkbnZc3aHd0tRC2fTJ+meNxthFJmbIXAeicfayZqppQ/u5yYu532z0L7vj5Rell
	N0GWfKiowIy9YWs0sqPOdUy1RjWb6ayxX3UaSj7nWKoJPvlERAK7Di7Ew/lBH76JqPLh9+Dmwz9
	05Cp5o7KsSQM55sAAswEXoNaV4xnA60TZ+hgq4Dju594FPyu0L5PpW429IaB/nyf1luDAwewosL
	ubdYQUhsrKJA8u/ryDpyEZ3RHqsoWigaFr9mt28mL67YQWZ9ngn15wQYW8zlR0DSdM7JWsAoJvy
	306AJhiX1QpB+5RXFTc7+2qgQDswLbigljbgG1vXLUgNRGYqJtQ==
X-Received: by 2002:a05:620a:40d5:b0:8cd:8d4c:aa0c with SMTP id af79cd13be357-8cd8d4cadd9mr467940285a.0.1773097548056;
        Mon, 09 Mar 2026 16:05:48 -0700 (PDT)
X-Received: by 2002:a05:620a:40d5:b0:8cd:8d4c:aa0c with SMTP id af79cd13be357-8cd8d4cadd9mr467934285a.0.1773097547515;
        Mon, 09 Mar 2026 16:05:47 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3d98asm33898478f8f.30.2026.03.09.16.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 16:05:46 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: konradybcio@kernel.org, andersson@kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: [PATCH v1 1/8] soc: qcom: qmi: Enumerate the service IDs of QMI
Date: Tue, 10 Mar 2026 00:03:30 +0100
Message-ID: <20260309230346.3584252-2-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: taRfLeAEiAcHWwbOoVjMjMAJZwHlGkqi
X-Authority-Analysis: v=2.4 cv=I+Vohdgg c=1 sm=1 tr=0 ts=69af524c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=NWmyY4P_PqWfpxtJLaAA:9
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIwNCBTYWx0ZWRfXyLGtPqaq1MaX
 2nKcQPhLi2SPG25PWuuORR1IosVf6kfilaqluwJ/QxVrcrcVSbNOZIHGkkNVie0+usBO9vgW5Na
 LxoER99y0gSVBhdHpc5sjO1VVcay1dB2nYQhPVwqRGIOi81wiK+ScuA/ZPd4GtFOyrJTNr6RIpu
 MDLx4ctlmcKMPO9Tb+4tTgRD9RFWpEwxs4zsWc2amDefItVJap+UPZKbcezzWjv7hP9IESdoVPg
 A1vdlA0fKbsDI4aPP9nJ7qTEvaoNoLJWuNTa1QQ0ltfecjjFiyQVMzKKE/XWRtiZ1tL4ML2Hn/A
 E3foCZcgnE5cBtfTTtd+UYgs6VgoCpQwqjPcTsn9meVJ6wXaa2Nx6o0YQSnLwSpAa7VgB/fgWuJ
 yGZH8Hv21EtHQ4//HD7rcZtcfY5Fmp6Ll9nHkI8VonTs+7MTPQs3bVQmwK/5qU5rYhUSiZJhwIO
 3E5WjNofHilAp6reFEA==
X-Proofpoint-ORIG-GUID: taRfLeAEiAcHWwbOoVjMjMAJZwHlGkqi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090204
X-Rspamd-Queue-Id: 12FDA2427FD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96390-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The QMI framework proposes a set of services which are defined by an
integer identifier. The different QMI client lookup for the services
via this identifier. Moreover, the function qmi_add_lookup() and
qmi_add_server() must match the service ID but the code in different
places set the same value but with a different macro name. These
macros are spreaded across the different subsystems implementing the
protocols associated with a service. It would make more sense to
define them in the QMI header for the sake of consistency and clarity.

This change use an unified naming for the services and enumerate the
ones implemented in the Linux kernel. More services can come later and
put the service ID in this same header.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 include/linux/soc/qcom/qmi.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/soc/qcom/qmi.h b/include/linux/soc/qcom/qmi.h
index 291cdc7ef49c..b8d07f2c07e7 100644
--- a/include/linux/soc/qcom/qmi.h
+++ b/include/linux/soc/qcom/qmi.h
@@ -92,6 +92,18 @@ struct qmi_elem_info {
 #define QMI_ERR_INCOMPATIBLE_STATE_V01		90
 #define QMI_ERR_NOT_SUPPORTED_V01		94
 
+/*
+ * Enumerate the IDs of the QMI services
+ */
+#define QMI_SERVICE_ID_TEST		0x0F	/*   15 */
+#define QMI_SERVICE_ID_SSCTL		0x2B	/*   43 */
+#define QMI_SERVICE_ID_IPA		0x31	/*   49 */
+#define QMI_SERVICE_ID_SERVREG_LOC	0x40	/*   64 */
+#define QMI_SERVICE_ID_SERVREG_NOTIF	0x42	/*   66 */
+#define QMI_SERVICE_ID_WLFW		0x45	/*   69 */
+#define QMI_SERVICE_ID_SLIMBUS		0x301	/*  769 */
+#define QMI_SERVICE_ID_USB_AUDIO_STREAM 0x41D	/* 1053 */
+
 /**
  * struct qmi_response_type_v01 - common response header (decoded)
  * @result:	result of the transaction
-- 
2.43.0


