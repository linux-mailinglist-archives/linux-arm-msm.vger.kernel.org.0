Return-Path: <linux-arm-msm+bounces-100689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKEvLB0zymk66QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:23:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E2535711A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:23:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 89B723010728
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 08:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77FE63AEF47;
	Mon, 30 Mar 2026 08:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bBJxIgiW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FNGYBBlg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E523AE6F5
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 08:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774858907; cv=none; b=fg6R6Lge/p91FOWDgCuEivpR5Vc6TkIGnKlWUl9psAGbxGVZ3SDvNqmVraH/n81RxYUMJyQIYCvzvXGBdMGskm+TR1zfOfMbuDf19lJvbmhWWbpEIhonHWdF0B9/+9rl0QecSz9LiFLDXTRyqdHRazqQTQCBJldbP305eDpluC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774858907; c=relaxed/simple;
	bh=UZ+5z9w9M74tpzVL8QkykGNl8XDOPEb0MSDzyxWPUz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gHuJ/jeYYSFoJ6d9AbU2K5xo+HlRW9j5fc5rr3ULCoC+dNX3U78RIKWKSolazLlgc9M2I4Xb7eazmuLmQfv66XwrldRHGKx+eMjfj5v2l86ba8yGtY/RmrlU9uUoWmr47dot3B7nYkv/Oo6/Cnu74BddsE0ULcit4JChyq3gWfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bBJxIgiW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FNGYBBlg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U7XH8B3164030
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 08:21:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z0SMcOHJkzd
	ixiTszIUCToSc68Rmc9ZxZaPMuZtsp78=; b=bBJxIgiWhw9krC4Dx8ufPb9ig9a
	qp3vC5/F4b3fskGEMxlLFsXvkWsp1wFbB9ir/ZVEG6Xb230fmit0w676OQ2ubig8
	CjP105qk8zlKx3nRJH+VrU944lH3nZx5z3vjOnKG0dRvfF9DMo6Lq4IEsLxxw2q6
	RU+0t71PokMWCPTX27VMDVCiWqz4sqd4cXKRRS8uAIDeJQupbNEHkx63oF+IcWGc
	eQ7l7MGEKzjGBRFgeVpKNfuoPmKTUaDM1ZteeLqa+1C3RKh6heZMmKwcuh+OFSZK
	YCGePhEYPsYfclqR0mW2qhETRg7qQVmATNhxl+t+F+h115Pb/K+MxKncP+Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6ufmk8ra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 08:21:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b2cbe7223so139844421cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 01:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774858904; x=1775463704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z0SMcOHJkzdixiTszIUCToSc68Rmc9ZxZaPMuZtsp78=;
        b=FNGYBBlgtNc1ftLMhxJGyhjORLar8eFH5lIyXrgWCGdXhnUyruyNRIoSTNsJ4NE2QZ
         c1bY5Lp4AlxHDq+ttbIhs9g2Z5yZz05wKV2nKVzVYSA738UZqdAcDzW7jA9tr/T6k9ls
         THvL66Lo6FVFwa5wJpvqWkcgTno1Xqop6/55e/82YjbfhW9GnrAZLrqfeiqhMlQzt762
         anQhG4VIOGmd2fBH/326xC7OMIp838zjATgxksBIXJHErKZgLtA2ygC5TnjDYmQW27NK
         2fSBuK+lEWyvKjPWW6+9R8BgdK82NznbXtLH8QwmM/Qboqpsgj7UXOnecyNu5dbeQKGu
         Tcyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774858904; x=1775463704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z0SMcOHJkzdixiTszIUCToSc68Rmc9ZxZaPMuZtsp78=;
        b=ayVFb+hkPo5apRunffCOlMUEawBQ2latJGwdTFqoI7hQp+ooY7cWvv+tVoBYGLFlnW
         5NX55pqzrx1EIyXTUVIlm+S/h5ffNPXe3C558ELlSH3/x/64JNdTtUfWEuGgrN5V0tLd
         MbhNipxCDMxct0mmed4mc3I/ng3zKLJCI3/yvrKGNbHEoCtPXoizR5Tm7jW3U+nCIRTs
         7wHvRMqW4xk1caUUNOoi/lrD9Y2bg+9t41nrkBXFvjpOOV/7J/zz2+CpqK9x9O7hWR7F
         25EfPYB6hu9v/sCIcdgQzEPwANRU2CbWms2Rhw6hplCPjjWHnmQ97KfVcNKHBmRNyztY
         Ed2w==
X-Forwarded-Encrypted: i=1; AJvYcCX5ZfwQ80bilUC+F1bTJqqshcYuo1eooHvUUNl2+6NXcDtSgGCfYON9zQ0By3SDG717NfqaNBoGfT3nI2vT@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0zVTNi0YvfgsJ46NCSi6ECq6x0nTlnKmOgYCjzLpa1P73tjdc
	pTuxNjQlpQSFpUvjTlxtSwfGVahgUIplW32T3Fo7CAoNrCNCfm2rUqtTlV/o9f7GHTOqMCG6h7/
	EdWnnu+eHo3jpSRvwqZIf0fNznO1NgXsqG8T6uQuey5AML6jyDtmsEWNUJR7jDKepnAOH
X-Gm-Gg: ATEYQzyEp+1PqcXUX6sC6ogH9M/YnoG3XgLzJHSVBMy0A7L2r8kHp5JIllOUBRblfUZ
	P1oqGr3WNU7WwiZ4Q1vyWttfMKUhuEG1OEtW+MWtVSwuibYc0t6lngsQZ/SAMMFGev927omQQo5
	sfaUMrEdatrssxPJl/EJT3e/bXq4N0gpPxn4jak2p6XXIYa/yMH1DPZyt4heo9wgDnsKV4HFuGV
	rNCDUW2yfPPF9/9SrmIEW6hQtuzh5vK0p5uCLk1auGIhBwNDT5Z/2IhskR9XYEcJ2xpJgLsLZV4
	3SmhQQUcS8JIftbt+okJXrupLA8WJEu+YKmseDySEc8evVNTfqO5nrAA8FQsGJEHnk9B1QAgkph
	DxF/sMCHKo8KgG06tUQfEquU2lWPGiffz7gI/XTnvBhvpjOXa1h7lWvw=
X-Received: by 2002:a05:622a:2d6:b0:50b:3705:c0af with SMTP id d75a77b69052e-50ba394948fmr161577291cf.53.1774858904524;
        Mon, 30 Mar 2026 01:21:44 -0700 (PDT)
X-Received: by 2002:a05:622a:2d6:b0:50b:3705:c0af with SMTP id d75a77b69052e-50ba394948fmr161577141cf.53.1774858904069;
        Mon, 30 Mar 2026 01:21:44 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf1db08e6sm26244773f8f.0.2026.03.30.01.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:21:43 -0700 (PDT)
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
Subject: [PATCH v8 06/13] ASoC: dt-bindings: qcom: add LPASS LPI MI2S dai ids
Date: Mon, 30 Mar 2026 08:20:58 +0000
Message-ID: <20260330082105.278055-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260330082105.278055-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260330082105.278055-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2NSBTYWx0ZWRfX5C10LqLDd5ta
 7scHU9vrHByCREdcjXXHTYieKHFipIY91h6Qz2rZ0UXAalbQpOi/hzdwv8VLGoTGyfL6P3WwbCU
 YQm+BgzPrge6vAg6vyO1hgpQT8ttTkWpAg91CeG4diGVOW3PV9g50u651XB8nO29tn4HWORBw1d
 Gj+xvj+G5tosT6vNNeik4yD0VGKuzTigZIrm4quopSRTMc7Vbi/7USAFIMOIzkfEdE+RVfGLyRC
 CJPane8T26gGGZoapjQuLKN1sPeS6tT13G7je8IJNZXS8mNS4QKARImDZbSOF7/IlGbYaUbegJW
 hvonweWW8LNYxRULeohunJihlCx5fZ3HP5/IMRBza+1TTXN8vqG2PqLtV0n9KCgEENPd6FBva6K
 bxTSn0DF9HPLbmRsQGQeL/UkIELVP5TLSeZRXv1S1pK1Kmr0jzICniFyYax9xju/z6oIM8PBWAd
 uPDPCItfLKEhVeYom5A==
X-Authority-Analysis: v=2.4 cv=aOT9aL9m c=1 sm=1 tr=0 ts=69ca3299 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=6P8UuP444nAwg2htitIA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: NSiWmcNHOI_evPTzV6fIuSRY2Cz2IU54
X-Proofpoint-GUID: NSiWmcNHOI_evPTzV6fIuSRY2Cz2IU54
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300065
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,packett.cool];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100689-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B2E2535711A
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


