Return-Path: <linux-arm-msm+bounces-116199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cTY8Ko1oR2pwXwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 09:45:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9826FFB2A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 09:45:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RB02tYsJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eVyE3Keg;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116199-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116199-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0A9E30866D7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 07:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9907368D71;
	Fri,  3 Jul 2026 07:34:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BD435B63B
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 07:34:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783064095; cv=none; b=bLrglXiHDeI5pd3xRm6Xbx7qWCuz9nRX1mOqezutKUexPls1XizZq1BrmwCGfQzWVTtGqfuD1PKp0tW0LKPlnzY5OAVuHlUDC5fQIJYv3o3tOi8KCxal8RdpKLeV5GUlptBjPY1xh9MeQYd5DsleRbDGwIyiLfuT5CRoI8GSOWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783064095; c=relaxed/simple;
	bh=99u5Gx55RAHeBQae4JhGigWI76pAnkMT525MBFVpwUk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HE51PJGMW1yOlZLAAg7soWP2dUqkZv4YcHdjwg/cvwg81zmOOIHRbcIBx/cB0B5mrU38iACt/m+u/lfLEoGiMvfEm/00Q/Y+t+McsjQHIM3SXvCe4OSZCSRH5YqYw6K7QzaZZX1aokSQGvLzJlhoQXQb3dWdYcPe3FH1CIT/cqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RB02tYsJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eVyE3Keg; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6636gveR3144214
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 07:34:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WLvbWjfvxJB
	eH1l3LGJwlfv6v3165+AmquAxv/c+yWI=; b=RB02tYsJl/ZkWaTrT6fp9a152h+
	54A3bRkewFgQNXTCD71OP1t8TBGYK029kS+Wv9eO4KgxDLJICJz//2tu7Zx9Ajbw
	hBVsPegKjAKZ3vbxNOEMBG5eZmnC/Z2jLjMhKOQiChSvZ68whU40o2aDC8A638Dd
	lwzcCzjfHE9VOeg0KJedFyvzvTjDU7yfUVG6qQxD/ruorG/fjhtkOOEL8RfyyXil
	9yAMoKEl3QXVJKpFnHgvODtx7fMdLflz+NO1aOF2Fayl8emgQoAQqsZVVgVJBrYq
	/qdn/AKqb2i89BHC5oEnLjTZwQd90ScMtA/1qyc+KPrxhKULiSIJ2/VH1qA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f682br6sp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 07:34:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c7f385887bso5271535ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 00:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783064093; x=1783668893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WLvbWjfvxJBeH1l3LGJwlfv6v3165+AmquAxv/c+yWI=;
        b=eVyE3KegiiH97gYjPODb/C7Hi3j+4OzwDFS6OB5gu3OphLwvoEApDpB3AQUH3Yd+dH
         2lsunpOFi2q19wWp2AN00G5R1MJeGZXWVo7FkKDDzsQ72LsP7b6RezBgQXJocIZDp2e7
         DiHpz3AwNn3bUxj/AdhpSxibOXMcC0DeKloogG1/eNhunmi8MZb4aQATdIcEayRMQL7r
         eE3kLk8cTDE48uSLYmKh3cI97ft0bzGjcJp9CiUXVvgjLu7hKsyxlUFPfVZYFB5nZKpP
         5BTzFFgw5YekoIp7dbOaSHTMCRi5rlc15sBn/zT2/DEv3/udxXH13t2ySmlzPt8Y065m
         qF3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783064093; x=1783668893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WLvbWjfvxJBeH1l3LGJwlfv6v3165+AmquAxv/c+yWI=;
        b=VwAjCUhFi03j8WBTpv93PhbxXwjJ6Pj+ek6SPFoiDaLVeJMHW95uHmLKGWLF6MUDHP
         dOim68b7g5CCCu03gYbyVxvri8yaU5WxYj296U2M4iiE3Zog2VG8q/oDkwhfwlanGQcP
         2KuJwSsHZ1rJgCpqv061kZTDQfhq5nOXwXjiWp6uDdVagb6udPLKC9xLOrkKTkrPo+xu
         NFADSywxo9yVQxTJEqCTf2wM1p6xuNmzSsneeuA+M795WmpoqsFKIGNLfdnaO7tnoClU
         5nuDecqD4RqqnhFVegEzslvt9j42K/JsBM6mgz57DXL83gdkIFWFHtYZsYoD0N/GuIZi
         zFuQ==
X-Gm-Message-State: AOJu0YxfS0U06t58R2UGq1KUsLKPcFJD/bqinmtPkAOZrFPEA7dUIhgq
	ZdgzktxrgTHMDf2BkFLz/wp+UEiXJA6KHR3plCsWHtm5bzENsZcwyBRYUXVaW3BpbO1yrQxoGkV
	BgH271juIjl3j7yyNBQKB6ILQuXW7CUk3S7czGuOs6S0eYPXXUMcXQ+cLt0ggVpGCMmNk
X-Gm-Gg: AfdE7cmOXy0woAtxhpmKbuEr1r72j957g/h5lwL6r7YHeIfuOiKWPuqnApAoR9dlEMf
	idEPdWNmb8T5r8yy0qjpxYF4hcx6Js3/O3dlKnaouAAIEg7HseyOvUQi6OxygUxHK1gMjf44iq9
	SwHuPmynYBZCgE/SvIlUhULMwTwMCjxe7w4UiuFyT+4FR0TigJyrEBZo9zaZfUTQE9y3YaJf0Pi
	XIcWcVUvTtZRWzErWJdYqphBDQSaeJWFgjIIABwnoHd5rrHA/T4CDtoSrjlU1gBhPaGFCOunMW6
	L0GIW8lWsew63N/5EenvTWmmxuBaqN6jsn2Kz5KF9Dvv7bYDRomCb+PlBcslJzeJqlFKpmFuE89
	r0VgbWTmJAo/eVVTbrV4cCLyW6/N5A1l4opJYZSOy
X-Received: by 2002:a17:903:1245:b0:2ca:f4d:eff0 with SMTP id d9443c01a7336-2ca7e675bbbmr95990905ad.7.1783064092986;
        Fri, 03 Jul 2026 00:34:52 -0700 (PDT)
X-Received: by 2002:a17:903:1245:b0:2ca:f4d:eff0 with SMTP id d9443c01a7336-2ca7e675bbbmr95990675ad.7.1783064092535;
        Fri, 03 Jul 2026 00:34:52 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm5225465ad.13.2026.07.03.00.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 00:34:52 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: [PATCH v1 1/3] ASoC: dt-bindings: qcom: Add Eliza LPASS macro codecs
Date: Fri,  3 Jul 2026 13:04:32 +0530
Message-Id: <20260703073434.2589657-2-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260703073434.2589657-1-ravi.hothi@oss.qualcomm.com>
References: <20260703073434.2589657-1-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA2OSBTYWx0ZWRfXxit6sAOOGDl6
 KoSlU8oTMgadiGX3ZMEi7bwsEYcuAQm16ilB2lkGgw2rA6CaxrJ+eWVxFryrBlB+ucsNMW1m9Vg
 zNdMTL1GYWgNWFJJQKb4M8HlLOZoe0X0P5/z/OWYw3uDT1qx7tujwLj7xg7xN0xu81G9HXo2ow/
 /PQW3/mlBkhsCQvs6oJ0lPeDf5qeChe6NiFxC+vBZhKsljW7D3+81u7qCzW8ziC/qWqrH0kw4dP
 Ix496q71XtU2WvSpagIyS4lHbeVUDVy2zNlQIoGrJQXSyG4xJrLOL4PDYHMpQM/LoG1AWtD0utQ
 jCcFz/txvThZSgv1BdL17zfGsfEu5OhVEtmvxKObQHy5cEa8/BzV3p+7EZQr6qVLlXKhqLxpVot
 UFSrCVIFQQ1PXMdwbj2PQCfopV5QO/ybSg86SJG8//25zDHcE3qgm8H2iMju4ZwEK7OKQWKPAPq
 GVcQEOzKOPzkrpQUaOQ==
X-Proofpoint-ORIG-GUID: LdRAs5ietOlCsNLyEVso2vj9D-H59N1V
X-Authority-Analysis: v=2.4 cv=cc3iaHDM c=1 sm=1 tr=0 ts=6a47661d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=l1jcosV-81OWBb0gcykA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA2OSBTYWx0ZWRfXy9HhEH3fyxtc
 yzXoI1H2iDx2w10qJ/enO1vP33xq+zD/It/vDBXTAHyEOrfQmN0a0vAACA/EhduTJLOHvlGLzjO
 6MarmSNCExg5znNHwPy6+U1qZojhApo=
X-Proofpoint-GUID: LdRAs5ietOlCsNLyEVso2vj9D-H59N1V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030069
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116199-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ravi.hothi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ravi.hothi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ED9826FFB2A

Add bindings for Qualcomm Eliza LPASS RX, TX, VA and WSA macro codecs,
which are compatible with the existing SM8550 generation.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml | 1 +
 Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml | 1 +
 Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml | 1 +
 .../devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml          | 1 +
 4 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 2eed2277511f..4988e7ed6e34 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -21,6 +21,7 @@ properties:
           - qcom,sc8280xp-lpass-rx-macro
       - items:
           - enum:
+              - qcom,eliza-lpass-rx-macro
               - qcom,kaanapali-lpass-rx-macro
               - qcom,sm8650-lpass-rx-macro
               - qcom,sm8750-lpass-rx-macro
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
index e5e65e226a02..d8682ff2e82c 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
@@ -21,6 +21,7 @@ properties:
           - qcom,sc8280xp-lpass-tx-macro
       - items:
           - enum:
+              - qcom,eliza-lpass-tx-macro
               - qcom,kaanapali-lpass-tx-macro
               - qcom,sm8650-lpass-tx-macro
               - qcom,sm8750-lpass-tx-macro
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index 5c42b2b323ee..aea31fbdad37 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -21,6 +21,7 @@ properties:
           - qcom,sc8280xp-lpass-va-macro
       - items:
           - enum:
+              - qcom,eliza-lpass-va-macro
               - qcom,glymur-lpass-va-macro
               - qcom,kaanapali-lpass-va-macro
               - qcom,sm8650-lpass-va-macro
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
index d5f22b5cf021..9fedd80532e2 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
@@ -20,6 +20,7 @@ properties:
           - qcom,sc8280xp-lpass-wsa-macro
       - items:
           - enum:
+              - qcom,eliza-lpass-wsa-macro
               - qcom,glymur-lpass-wsa-macro
               - qcom,kaanapali-lpass-wsa-macro
               - qcom,sm8650-lpass-wsa-macro
-- 
2.34.1


