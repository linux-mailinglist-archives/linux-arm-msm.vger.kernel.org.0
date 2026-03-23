Return-Path: <linux-arm-msm+bounces-99421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yG+jMyjBwWn0WAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 23:39:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7192FE56E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 23:39:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7A1443012207
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 22:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05585384223;
	Mon, 23 Mar 2026 22:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZiVQExZU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="StIdLYY3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557C0383C9F
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774305548; cv=none; b=s/afJp9vfV67dk4t70DV/Ew8Gsr/0dyVXk8heOJqj8dN9ynE21ba3LsVt/gtFcsRolfXfyZ/s6rybzF+rYJKGxQB5a+q3PA49NZYMpiNIJU396BjofTb9DtXnucVoHW1ocmdIzTAz6pr5r5vBgtGp1JvjEey2iT1/i2wxF9GeFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774305548; c=relaxed/simple;
	bh=UZ+5z9w9M74tpzVL8QkykGNl8XDOPEb0MSDzyxWPUz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kRk9ClvfGJ2bfgE5gYIbKpqXeLxAWKwA3Oh8BvG5I5RxOFcW2UKnS4Wh2VmngTw+yO/bMNSVIw7f3Y4/zAJEYGweMIxLKdt2lL8CqY3fQcY1XKGYCAdUGa83BU9S0NJCOxkIoFSm1L24U+Vpfua8Fk4hEcM4cGNgTFC53m4rFiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZiVQExZU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=StIdLYY3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqWCw3817386
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:39:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z0SMcOHJkzd
	ixiTszIUCToSc68Rmc9ZxZaPMuZtsp78=; b=ZiVQExZU1enGt0QJtVH3pBGfkz7
	AfZcWpcNZ1MFuBqIH56MA8oQ0jvA3Fa5BVDD3cw32MGreuVJdKCnE/9pXrAc96bA
	S5NiMfNR4w/MaRiCgkcQUqHk9uXcfPwxwg+eZK3qbR80aXTz0b3QtOUGlrmb+qLk
	AVlFoShZJVkoYrFzCxqzEGzkJqaQDX07+Oy+Miz6m/AKj7V6Auh3J5rEVjD3OC38
	sXDtvAlcCeWmg7WAIBR/fM4lUdB0eMSuA613oqW5sJteWRy9igPtsPZMJStp5dXM
	MNvbGI4bUgl8Lzi/DWzTMO0BHOkI3xf9B98Ffjmjami8yX5c3ki5TuPQ2wA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d355w235j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:39:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b5f675be9so133529991cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 15:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774305546; x=1774910346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z0SMcOHJkzdixiTszIUCToSc68Rmc9ZxZaPMuZtsp78=;
        b=StIdLYY3+IUst2PNg0r/dFHDYqIl1a/nt4g9TRcz0V+ZNmJ3wsNjJhEM/xKYd9aLeZ
         GefPsVGN22b3t9e/38Fjbdcj132CaMLPK0jb8x+PC2CQwhkF4mEWvWb5kVrU74RqQ808
         mGKbiSjZUdQi586bDyuW2lteW1ysY69CemMcK5MGz0r9vrY2rhzV2sb1leaiTKu1CW3s
         Vms34URiYKmZiXvRk69RLHpOeGEIScmyRplvmoG1x2FVNFzkMavxNaK/PMX4mtOfRMAH
         OlnuQYl19k0nePKe98+FA8VQW4MJbXFWx5rUe2Y1UyIEhFZ8PEyy/gkMvT8Lzh2jmHev
         hg8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774305546; x=1774910346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z0SMcOHJkzdixiTszIUCToSc68Rmc9ZxZaPMuZtsp78=;
        b=haXs23fZYdgjQn5zgO0rHuKlr4R/kiluEBRjSaevaiuO26ns6csuxicrJRj3Aybva/
         XKoezVBW6F+LAeFQXIhDPKZIrikQZZTfC7GyMC00dx/fZmbngkGVtwLsTo+wXRA7ZyMU
         avXB/uxGY2OzqEnulFgnL7TtdexYGTeprfcD805ih8KtH0w/AAkdz4zquSXUienxnD6Y
         WJY8TrP8AaRUF4wCW47/B5pV/pxhjt0ocYhBDmilMnVVon3aIla2ZRn11RMtwsvSXMiv
         wI7nYIGyXmrkZW40o9ftuXUybyl+qoTVqqAhMBLcEuGdOG0WgfEebjgQQcxpG2CJdRDA
         snaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFclWgEcOy+XHz7Rr6kNmQ2wd5UWYn4oxzCs09GKH+qbeH2E/KI4mo6K2JuTM6X2lvvmzci+d2LsXqv0Nl@vger.kernel.org
X-Gm-Message-State: AOJu0Ywun8aW96d9ypdoNgDVky2zOQ+JxvdVsa9dyHmNgmjpwELGDbP9
	UEY8k7JPZl1j4lnpAdNaAavnh3wiLf+t5rClTk5EvVoDxJlijQZFqk1xD/ha+j4cT1AGSW7oNEy
	UbTfAf6U40a3GtpBSIaIf0U3axm7PFyWjDFb967YwKkHiMm3s5PuOyXjhvLRXgRSeJJGQ
X-Gm-Gg: ATEYQzzklIBfZWHltT6qVVvadB7gqo+z0dJHXuT+9TG3hJG6sDLT14u0WDlnQmENCk2
	pyxNsQJIllVaSQ9VbFrYjjAPODZIJbOUZDgq8bwlMwDPa6GhgyIre+TL4sNMJDPww7uFbl+8Lmb
	MV9zJOeTZgjSjbRou5idNVd2+YqMjMapJJAC0grIOBk0K9MHsk/Q3arQNyW9vaQ9vxmyNkdoukw
	xIkssqxPgocfZvBZkqWlKv88AKbYTpvyeAk/DUMiJ8rB+xvZwaCSd89Xa4kZbiACtxOJWCA8G5r
	diQIfSLlrVYmhjYnwl+druJxXQuQkoOYxCNja2C3VqQBPOnSVBtS5W36fk3kjLQrBzwGsQ8oVgI
	ZKPEdHoIW2rVxhHapnrnN1+u1ObY+sdPs57+jmnmrxBM9ufe8mb8qD+M=
X-Received: by 2002:ac8:5d4c:0:b0:50b:4001:ae11 with SMTP id d75a77b69052e-50b4001af81mr186283901cf.57.1774305545733;
        Mon, 23 Mar 2026 15:39:05 -0700 (PDT)
X-Received: by 2002:ac8:5d4c:0:b0:50b:4001:ae11 with SMTP id d75a77b69052e-50b4001af81mr186283741cf.57.1774305545284;
        Mon, 23 Mar 2026 15:39:05 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64715539sm33320351f8f.33.2026.03.23.15.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 15:39:03 -0700 (PDT)
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
Subject: [PATCH v7 06/13] ASoC: dt-bindings: qcom: add LPASS LPI MI2S dai ids
Date: Mon, 23 Mar 2026 22:38:38 +0000
Message-ID: <20260323223845.2126142-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fq7RpV4f c=1 sm=1 tr=0 ts=69c1c10a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=6P8UuP444nAwg2htitIA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: GpXBgYdReRrL-uwfukpBh1Z9aRqd0Zs6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2NyBTYWx0ZWRfX3q5RkFSsv4XB
 gWqmxoSjpdGmtUvMxkXFekf6kVw5vrAcUB0QwwZQskQSGoznQDztRJvu2FjyUwAgx8zbi8XJw7M
 5GR1vvsE0JwbHMfsU4ZRp0w9GonalRrcy/OM/ago+7hcAXDoeAtdhvdLFz6WXs2bK+Nycr6gKQW
 kYYmzF5q1diPCLm2ACGoHh166COFI1yPwaH81f/81z6KGg5yKhOf/ptY7NXOKoTZ3vTximlQ9qs
 JmMUvgSsweRf5FjKbVCPB5P+7qqyL2umC+Bzdk6OX40uBEQeUKXgUAMzRELL2ZowepV1/p17yEy
 KI2IV1DXX7ljuT6MrZI+lUJTkRY1IGx+9QjoDHk7QqSX00khlDLD9I+EjqG5UApkfnvbbaie+z4
 tPx9zD1huKA8S+FqtiO0WH1sVdOGPNvBbCAiPcBfmsF3P8AVHFjcDUX9LrKkDLyttmz/EF3+6T7
 mk+EYhZIDRQac8u+RVw==
X-Proofpoint-GUID: GpXBgYdReRrL-uwfukpBh1Z9aRqd0Zs6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230167
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,packett.cool];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-99421-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DD7192FE56E
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


