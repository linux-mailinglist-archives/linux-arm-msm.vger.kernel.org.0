Return-Path: <linux-arm-msm+bounces-101466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OdpIvgkzmnElAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 10:12:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 012A1385AD2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 10:12:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A027E303F448
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 08:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8F663A169F;
	Thu,  2 Apr 2026 08:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pq/benq1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iVwblm7l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3C039FCD7
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 08:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775117510; cv=none; b=DbJA0Oibl2FRCIq0kp26TRZu9fFATTh2cKUFaxJklwJUJKO+fE5V7qrZuVA8BL4IKEvkrsszc/ljmjtEjdMMotxee/o03+5boTH0KT4KHlNKUc7oyAEeXHxB22+Jlk7dl8sjLhbqyeIfaEzx3VjQ67J8tF3jqCtECxgmWJvy9/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775117510; c=relaxed/simple;
	bh=UZ+5z9w9M74tpzVL8QkykGNl8XDOPEb0MSDzyxWPUz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H0Yw4s1lm/KqdvCKOwNSvOIpWZtSjARPmlA3EZtpKH4Vjk0exAGstP1ik9qjROBP4Y+7F4tRbnBsYfOyQ4T/2dpgRk/k50SVW1qAyphi5Hgnn3LBf2k90FzJBjA9hSFPhIBJ/tnEU4H24pj6eZcqhJrGKFIQK+QflG2NeJ+gRZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pq/benq1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iVwblm7l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6326vZ7q2903305
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 08:11:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z0SMcOHJkzd
	ixiTszIUCToSc68Rmc9ZxZaPMuZtsp78=; b=Pq/benq1fMfs06rJ4mb7MY8GXf6
	fLcAdWWZEd5pBl9orliEbPL+kaBBJb+VwJAI1s+uohaSUVJBylRMT4w284RhvVzl
	9DOptNnzgX3KYR/IewWDTqbUk4lEZKtz/W1LC7EHnxcWszoMkO7pD5kVfVINOW1V
	ZtejkiYD6DlT5Q1GmFVv6dgZBAbJrCegVxqWsSjRlqrDtW6+6fqQvNPocJgq4CGC
	QHMEruQ5lB6ae8AmiY9qoFlIJaPp3pUyBBDgg/vxkVv6cYPBYaO/THWyJj6onbaj
	8KxJvBGdww4bBHdcOqa6qmhhJqQyFCStYadk/bo00OeFsjLqTypY7/baeMA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d954cbp0n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 08:11:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4fe4ff7bso2369451cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 01:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775117497; x=1775722297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z0SMcOHJkzdixiTszIUCToSc68Rmc9ZxZaPMuZtsp78=;
        b=iVwblm7lin8s54c1pQp70VXfrqU7+0p3TcYvC4nlwDPEc3IU+XsgLO9Bkr4T6LiDTZ
         pG1EzWuVUo4/KF6Ju1+mB8TpfrgwhfRt1SOhtb4ozn8l8Vjq2xrkQ1AU5f50B8LBrCJ5
         UKozP/wQ5rYnT4SS46Y/KlxmaattNzXvUKhZs9C3a2uV6YoKpvVoL5cT+ORC7mGDoy2I
         5YGPwlExBQdLAh3g+sQtad0eh65WImVvF7gkOoK2HBNijBVX1Jy9Q7hHF0RFHO5+075k
         dfQrMpHeBmcROSxijXn6+jWDr9sQbAfml3b1OdcF6UH+nbA5OvkpaGUzQeNE26MKYqN8
         p0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775117497; x=1775722297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z0SMcOHJkzdixiTszIUCToSc68Rmc9ZxZaPMuZtsp78=;
        b=WTA/W+npzCWA8rlT9lPD173clmnzvIE+SOr3KwtHj+HOlMgs+/bvDznbsuRC/fBZ/O
         eXDzNLm5Nn32mS3R1epzK1cgaRF2/HSZZQ4kuQfYUWWfD3qncgDrJN66ow13eCQqq5bV
         ly3a+man2umy2yUIKzFcTD7yHGXijVf4mrGwhmiujYqrak3yxqzKenPk0hG2RiDlHnfv
         GIaXXRL9VWi1GbD/neAaxstMJFWADiegxj1eu603afnnWEIZD3Fak17SPU95axRyLONV
         5xlwWpTQ34OeB65Gwb6CsvJAldad9mZGlo8rB79jgEJkXeJyWoYKvE4v3FR9z9NiqXwy
         GAjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeUZeyQV0onHTmOq1xqtRd25ZOFRE2e5oyOsbD0572Qu3kyUALjRBR34jkXsmMt5eEOrq3Fvy8psPePjD7@vger.kernel.org
X-Gm-Message-State: AOJu0YyyQIQUuY5jLXRDJBIOvlxN/hdR/eEH6R+MQvgdKkmjYc8sXk3h
	f5768hrDfrpfcDu1+AF1Z7mtBU21R2xeXTyvTOtIVecqyfc2LMjjNYVbcNule4KLT0fsw5p0DAR
	CLmboRV1ZmlnJ5ZL7yS0IMDQuK1ZHecOe9csbWp82ZmMZ28u5NtbR5V1cArmxHf0Ur67C
X-Gm-Gg: ATEYQzxJnl54cgmRA2GfbrLLfl4nGGv6ncZMPZbN9PfMwIYNxVEWSEHVk2aR9WZ9zfn
	I0Nzjz2N5Eb0/ECJQIwP2qkITFmpCqSrin+cujself/OiXejPAVW4p64+LyTStfQliCWMeL91/c
	jCj+Pn3NEQq6D5lLN1BXOmIy+Vp6C/Ozf1J8Qoui87hzqfC+zwT86tQdJWvTTUA+CSJHg1f4FzK
	CtySJmGBZKKS7XAxMt2GGpmomEyZ5Fbto2tPuc1flFIniuUy6f4ou+k1e1hDS9sVDRp40wSudQG
	QK/MzEZtJHWHCfbuknthYY+98ATgU0G+/ebjYD1N4aMCSM4fUe/2UmlEkRo2W+iBmk+GHiX/NI2
	vt62vKzSfZHrpp/aUSGhx8Ws4LgiYxI3rKsRIAQvYQrQT/EZDfyh2MkA=
X-Received: by 2002:ac8:5a49:0:b0:4ed:70d7:aa5a with SMTP id d75a77b69052e-50d4fc18047mr15913501cf.25.1775117497406;
        Thu, 02 Apr 2026 01:11:37 -0700 (PDT)
X-Received: by 2002:ac8:5a49:0:b0:4ed:70d7:aa5a with SMTP id d75a77b69052e-50d4fc18047mr15913351cf.25.1775117496978;
        Thu, 02 Apr 2026 01:11:36 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c3a01sm5712604f8f.12.2026.04.02.01.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 01:11:36 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v9 06/13] ASoC: dt-bindings: qcom: add LPASS LPI MI2S dai ids
Date: Thu,  2 Apr 2026 08:11:11 +0000
Message-ID: <20260402081118.348071-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WMlyn3sR c=1 sm=1 tr=0 ts=69ce24ba cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=6P8UuP444nAwg2htitIA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: hBAZyTMxrAc_K8wtGFkswMvNggPZX49P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA3MiBTYWx0ZWRfX1NIItSOkPnDB
 3l1KdwJKNvJu6e3ubPMdts4h0qFFs3slTRoDYWr1TcOee+RwB55nBSWgez7+p/QYoMl/yCVvtsb
 hmSykF3qAXkSfTZqJRH1mSKQBPYmGn7+JqZDhV4eBja7getaO7PPuctFZLaJbczDyc7Nc8vfSMI
 IKG8+9RFU+kkL8WQOCTskVM8/IFfWHAxTjRqg/NY0OQVosYss7sK0+G6+BLAK6vukgLqQMXB0To
 DLdd914tdt2I5kffRvNxgGSKjEnL1itjxeR1hvkR1PdigOmCzTLxLYgfTViPV+XtEF15IDqiwrD
 6xPvwA0kwMqSE7D1YlJwyoxNFRxEnmVhdJ8OkvMcHQT8dv1VQDDW6tZ/HXxYBKxlDxe+n2uc56/
 zjm2TdNZieMARd1nQemNV5nViOULyObRg6vSxS4owIw950Ixqgbh1XjdRwLkl+M0GLoMYkhgwQz
 IQGSvboelnBWAxaCVOw==
X-Proofpoint-ORIG-GUID: hBAZyTMxrAc_K8wtGFkswMvNggPZX49P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020072
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,packett.cool];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-101466-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 012A1385AD2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add new dai ids entries for LPASS LPI MI2S and SENARY MI2S audio lines.

Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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


