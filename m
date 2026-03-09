Return-Path: <linux-arm-msm+bounces-96125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKCZLh9urmnCEAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 07:52:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C256234698
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 07:52:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 762A83014626
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 06:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BADBF363C67;
	Mon,  9 Mar 2026 06:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DoJ5xzgA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VKVwrhK+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0303E364949
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 06:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773039112; cv=none; b=TkocsfTSSny4RUjcWdcmYj0p5QMfurBf8FWcBwd5kPJYlQzJ6Go1aUCyETC6G0edtIkHae/X0qYNm9ffZkzqkUKhDfiV1lZM9AXkg+c4RTBBBZAzwSz3XPW4ODay+pYHs51qgZnTnJZMxggmdCRftbba+CTEvMAwhg/icccXAkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773039112; c=relaxed/simple;
	bh=Q0wXZHoOMoTB+T690k57Jhsb7Luaf4VYpMrf8ZeVddo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OBOAsfnH/r+uylPPSDGxhDjwxhPJ2rCeP+8+FWl1S7QoRM+VQtjwAz0XOo78iqchS786qePPkuNMheKgZWoQHHoTfu2zmqfMkZxe3oQDbFCZxA2syy1CzpqosP6NavbJshAn8bTJDlqUyxdo6a9GXdtMVqmTfjy/8EozHyBSKfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DoJ5xzgA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VKVwrhK+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628Mx8DO2555744
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 06:51:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7gKUJDT6xhi
	+yOTV04urRjKQi8RIrOI9pXL1mbTNlng=; b=DoJ5xzgARXDOCmbOBlyn/WqNXtI
	9V1JHaflc/i2CQ+jXgNhBQ8dQpFq4DTWGEOfg8RGpjC8hFlx3HTDITBCAqA1yDT1
	aI7GDhs7LqcYE3kA1UY6PO7KAch3PDgg6+2Ji6roMXobJNZyHBxPkDSFKxkBw4/s
	ZqsxfonH8KHh/BA5xfN/edQRbo5r+zgRnMhGpdV+5NTUolxdbdcz3Asr9ARz4DYO
	AZiyu0azcS54A580ip2LXswqY3w+2v9B5OS8iFluJjrhXsJqa3WW7cxDyjxpMka7
	L0oSDx/3yNGF9afcRiNzHfVWNRNfdG0s3N3srTiuI9AXB84RyHjVviuJByA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crbbg48kg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 06:51:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd83cfb36cso745328885a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Mar 2026 23:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773039109; x=1773643909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gKUJDT6xhi+yOTV04urRjKQi8RIrOI9pXL1mbTNlng=;
        b=VKVwrhK+MbxVr6hIDcDyVxpRAIfvoZvKB+ztWYDJsytyfX9BF8jPlbgy7yvH1jFcFy
         wkG2bAkZKEOIpe0sg05WPvlPa6xo6ghN82fHCkO44k/KOSIIImRt2LxnHADyF1rQ5B8a
         FDrWKBt1SlI+ToJfwEq2qj1PVdWA7LF18c2JLRyZyOz8CdPOUYjO8DFMfgoWgwcqqua0
         0j7iWuy/c1vtR8MP5zCiHciNX/6SsYU28Sao1wYJ6w85Yu13qeREjPSb7V733NOLvdQJ
         27nNlTs4uEt10GAPV0vO+8cHjlCkMfoLZcKgleH/3+tUS/ebppPAafoVkTWC/Ttc/l7J
         O6rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773039109; x=1773643909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7gKUJDT6xhi+yOTV04urRjKQi8RIrOI9pXL1mbTNlng=;
        b=cAzkIf0z48p4O4Wprxpaj+2JHwcPNz63H//NSoB1M5zULu33Hk0T9YJSGjMHTb5Cbx
         +rOacxDCj608CpNja5sXcgnK9FpkRSpZn2epLCIoi6oAf2U0W2wclbLmjPEJhzGLX3QO
         o9GZppdl86OFoBmxlr4cF4+5Qomg2eCXWXtJMRstC7pnxH1O69ndcCfQpGl79x/8kWfZ
         plAjgzDMOmxakJ1lGvxh1JfVDE1CQ4/8iP9OREK0KbT2KZfwMwZe7c2j/w/HmJuq+PSr
         92XOyN24BLtIgXP5wFwlekY1E4zxetsMfHyTr7BnnsFp9kpDLpkrOwUyM3YynqzuaMRn
         XOIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUef2yReiu8SmkAQlmyukISE7BuW2YkQdPHDX4Oyd3SergIl3N/JtDEzK3BdU9b/utxuDoVY6HF8Tdx0vEw@vger.kernel.org
X-Gm-Message-State: AOJu0YySd1G+p8ZoprzRG9SRswruZQPClFm5AA4b3ozhAnLRWEEv+d6D
	uJWXQedPziExOYQOK+VjS7ldqZJR4AL9gzR1boowOCxkBlEBCOxR18pumL7ABH9v1r7SkmgL4et
	9siPWrl8HDaKO7GBcicQ3jXefPrNGTFfcARz1ShJ46YXwvH1B/Nw4bsty78YJKkc/M/6W
X-Gm-Gg: ATEYQzx06LBmZm/bMFXNZ5oKKIeIP9G37cc3+wXJJUNc04jev+lRn4gYu3xMO94XTGx
	vEANi8y4Rb605JJPPP3EDsWTdNeRAas44GROsFBPQJqBVV6aKXJR7kvxD3fdoil7aY0X6EVcbKB
	2pn/Qnf1sM7b988CD//nkL9jGcEUKoAMf79ifKNjEV4+TfHVEL5d0+piB4IDKL5TDVMP85GZ2ql
	plCaqcPB2Kl4hpXwfm6xAASWcDbOlE+NH6tR744piELYTk2jqybUScNtH5kbYbgID9Me3183/2M
	Q5+VefOEkcn4x7oxd/tb2ww5ZNvHht4aoJYILIO3qqObNIpfhyCyBVYiaN+AxgmxFdmXGqBTwpM
	iL9/PCwRp6Ir5vWMxUDdimCDzn2xOMASMR2VPcJUOJ/MFwtNkJB/aaMg=
X-Received: by 2002:a05:620a:468a:b0:8cb:c897:6839 with SMTP id af79cd13be357-8cd6d36dc9dmr1387562185a.26.1773039109386;
        Sun, 08 Mar 2026 23:51:49 -0700 (PDT)
X-Received: by 2002:a05:620a:468a:b0:8cb:c897:6839 with SMTP id af79cd13be357-8cd6d36dc9dmr1387560285a.26.1773039108933;
        Sun, 08 Mar 2026 23:51:48 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48529f01997sm80449975e9.14.2026.03.08.23.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 23:51:48 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v5 06/13] ASoC: dt-bindings: qcom: add LPASS LPI MI2S dai ids
Date: Mon,  9 Mar 2026 06:51:30 +0000
Message-ID: <20260309065137.949053-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260309065137.949053-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260309065137.949053-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WTsnuB_GGrTqIvmpnmPQcF7P24NSP7Vc
X-Proofpoint-ORIG-GUID: WTsnuB_GGrTqIvmpnmPQcF7P24NSP7Vc
X-Authority-Analysis: v=2.4 cv=SumdKfO0 c=1 sm=1 tr=0 ts=69ae6e06 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=6P8UuP444nAwg2htitIA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA2MSBTYWx0ZWRfX5WprL5ZN0vu1
 M2+/Mmghp7L34NQwdXCCPIPmLRQ3thL44qFUEdYqKOJxWYuB+hW77TO5AIIGZFearL02v8ruAxY
 dCtSHUnz/2Mp7+nM0l8ONXNml9PhuLK7XnfFUDmblYQAiHs7N0PebitG193YoYwdJi7VufccMmu
 UAsrQqL4tAdg42wKch0bBIUkVKKtgTmYVS5JoUN5dxTejoEBcb2uN2MVMFbe5awyR4WaulRHne8
 C2vtXHVXIfFR03wBuhl/DCl3TCiJpN+p4SxtlcAwaYcDIO3QD8/oVv7UUffSOJSi0gO2phJsnld
 J+4m13eAa9tg+sXdl/sCfCtri5S0l7axKDJsSilZJLHFc1rznA9Qq14sMMSB2ctDQkaFkdN8ymi
 /7vX5fbIrO13MKx3KKMLme+ZCI26VoLZu0tMi8nxooYPVb+eaNzgwY91WSOmthOSDunRFmClkuw
 mUEONnFljA3YIVrb4Lw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090061
X-Rspamd-Queue-Id: 5C256234698
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-96125-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add new dai ids entries for LPASS LPI MI2S and SENARY MI2S audio lines.

Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../bindings/sound/qcom,q6dsp-lpass-ports.yaml       |  5 ++++-
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h   | 12 ++++++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
index 08c618e7e428..2b27d6c8f58f 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
@@ -126,13 +126,16 @@ patternProperties:
             reg:
               contains:
                 # MI2S DAI ID range PRIMARY_MI2S_RX - QUATERNARY_MI2S_TX and
-                # QUINARY_MI2S_RX - QUINARY_MI2S_TX
+                # QUINARY_MI2S_RX - QUINARY_MI2S_TX and
+                # LPI_MI2S_RX_0 - SENARY_MI2S_TX
                 items:
                   oneOf:
                     - minimum: 16
                       maximum: 23
                     - minimum: 127
                       maximum: 128
+                    - minimum: 137
+                      maximum: 148
         then:
           required:
             - qcom,sd-lines
diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index 6d1ce7f5da51..45850f2d4342 100644
--- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
+++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
@@ -140,6 +140,18 @@
 #define DISPLAY_PORT_RX_6	134
 #define DISPLAY_PORT_RX_7	135
 #define USB_RX			136
+#define LPI_MI2S_RX_0		137
+#define LPI_MI2S_TX_0		138
+#define LPI_MI2S_RX_1		139
+#define LPI_MI2S_TX_1		140
+#define LPI_MI2S_RX_2		141
+#define LPI_MI2S_TX_2		142
+#define LPI_MI2S_RX_3		143
+#define LPI_MI2S_TX_3		144
+#define LPI_MI2S_RX_4		145
+#define LPI_MI2S_TX_4		146
+#define SENARY_MI2S_RX		147
+#define SENARY_MI2S_TX		148
 
 #define LPASS_CLK_ID_PRI_MI2S_IBIT	1
 #define LPASS_CLK_ID_PRI_MI2S_EBIT	2
-- 
2.47.3


