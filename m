Return-Path: <linux-arm-msm+bounces-101285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHU4Dr7rzGk/XwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 11:56:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1BE378123
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 11:56:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9300A318F212
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 09:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 885AB3DEFED;
	Wed,  1 Apr 2026 09:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YfKTMToi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RZTLf7tI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149F83DE450
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 09:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775036509; cv=none; b=par0gvhIWcyhlgIBoKU8eFI+1UI+1e68I5geZwjrNgrqesJ5hlwQrIXGeIJ5lLEeB8mxLI5LFC0Do+q72ennKbZWipnbdFetof/dXyuUOFcwqbGOgzgprAZyFz9DLAhtinHrcjZYICciR/6f/VEnnsn+E5PMQNRKnUhqVmBy+xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775036509; c=relaxed/simple;
	bh=FGLJTuxQpvKxCu6rHEzZ0bQiQmbetGuGjY0whQEiSXU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fW56A5XGx8Z6m37x9qf3SWxyvr2HOpl0uuhdc4aQ88Xk8LRFE0AS2osDWUdFSSGdjp9/LzXUGSGAcdvSv8zbfMLZVx2MQU+ivQLOqFsiXdGPyF3cJ9ixVfE4I3RdnPkmlSHB7wHLKEHon4gTx5FrSCgYR4i0hXHvnbz+gjVW2sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YfKTMToi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RZTLf7tI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63171dMC1285924
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 09:41:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u78N2F1YA9yJQ55Air5ug41Inqx6WLIV5npOpHjoKqA=; b=YfKTMToizpqAeZZH
	fQc1FtI922cbZlqx7VzH5fVkRVbDSriiGOhqRxiEUuCY8pTw9L5TIaenbWrM8qCi
	SazGpVGSB65muKQJZcCHBN5Eue9f+zFQF7cUEoOOUuhCMxe4gesps0Z/uABPr8YI
	8raWsfhpP731GI4An9NUniT/RcOfx38LQ0MGygjoDDSrOHAckWeCghDl0aqNf1Oh
	ExltbZ2m6q9iI6JirwvnZ9AMNy2x406yidWLJiuY5SZLRjvootKL+nlISp3XlAb0
	55da96UwMqN9P6CLkT2oJdBWxBfEg91KsLS1a9DFS6ykXO1rEUDlZgFcQPdpX5/7
	2H6hwQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8xm3rkmw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 09:41:45 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c53605fa3eso512725eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 02:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775036505; x=1775641305; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u78N2F1YA9yJQ55Air5ug41Inqx6WLIV5npOpHjoKqA=;
        b=RZTLf7tINuVxzYcoaIuVIE+tAslm0+6EVXW8BN+W9enKAsC/XiR/EZsXFbKvirKa9s
         C1P/TLOar0wFbhn/s2RBKXtdJLcv9GTPhE6DvbepF2C549VnDW0Bg6vzIAYlyyIJJ0Mx
         /5hZPprS388sHjZC1PpHenSogGT5t6ltGqYmtK6PP+hABnrRqM0+hzVk2UVQme4qfg85
         //XaKt0+Dnz6YVRwuXDFBXb8hHZDv5Yg597oR03SuNxgt6n7VIO01hwn1vCpUtAFY2r9
         ahhKL6klbNcGW6PCM0mBjd0jmeJrILC3VPMV2YVtmt4/M2HJPzrYwLWtv9suuN+3OyJT
         1x4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775036505; x=1775641305;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u78N2F1YA9yJQ55Air5ug41Inqx6WLIV5npOpHjoKqA=;
        b=bqqdb2dN6DcZ+3lZ8n8WtCMx4rEWegvtzZpush7KozkpVjNyLY5DN4sQcxA8jD4EV8
         Ph7fJDSzm5+ANyW7nPWMbsIieG+6YljZsRqCK3l3xoFrzg4us11RagPCleEyPlXM0u8D
         pgAIZDS3/7zJ1k7txaABAUdTo9M7SlU4H0KaTSdXZABXQw5pMyRn2G/W6RLTzcIXChbS
         AKkxj7gI26Iq44oTxG/2GGMdC1AyFpVYw5rsno4lqOwOw+2OEx9FDG9sp1C550Jdmjmc
         oPDOdEveCtnnOEM9/XvPc0xo1KaT4cT6XkaoIo7DZa6/rkrXGuDAS987mdqBQvz9PMzr
         R42g==
X-Forwarded-Encrypted: i=1; AJvYcCVfiYNscR3vSpo2n9v6ytrGnm4lHekY/tecpqdNkFHhgW+hXw2agihK9TcZ3zw+FxOjva1jz2w6BLYeuZbz@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6WAlboioP697ezTlNLv48IRx82ImDsQNVwiCMBnls1gI8/dUj
	BtlzeKwf4gsI2FCjyvfSk7VGxF7iDVZthYEClJVNip2GBaD39EgZtvvCC8AhVAfAb0CfA/tfiG2
	zJ9UsxrDfk4EEa5zS4GhiEIkgCVkzeRDgu9S1/0GGC5E8pC5ksOm96JQDl2hBy1KYyhM5
X-Gm-Gg: ATEYQzyxjAMXKzU718Vm6d6DqNMKgIJ595V31OMkkWSwd/oSHZ6TvJE+87SVzewYkKz
	ttI8GLgVd1A4A948X8HnpUmjAsdgiMRoIoaMTIqQ/YanwWkIEHdfQPBprNiBHSebb0FTW11L1Zf
	fBN4D/TownDcLu5QLx4YqfhnsAb5ME9uh95fckAuX2Tzvbos51e1pjJ9JbmYYWggEOFLr8Kgz51
	Kc0CfSqD191m8yjZcBfMtKsxH5j4z7XWXzdAXiDbasT2t6JMek3+VLLL29afX9jlBkgjNsOavJV
	98fZ5rI+cG2YpzJbLDCM99YZLqr7HvcGh7DnX+AcDO2g619qTKuH98mTwFomSUhxqOjxiipuglk
	CnVN3H8Y/2sjKqFV3HG45bPH4PwvPRO20wZnCZZJpSwP+Lx05t+mSwlyUeuUCS97X/9RTEwCIgA
	==
X-Received: by 2002:a05:7022:6b8b:b0:127:5c3e:3ed6 with SMTP id a92af1059eb24-12be6822784mr1331529c88.12.1775036504953;
        Wed, 01 Apr 2026 02:41:44 -0700 (PDT)
X-Received: by 2002:a05:7022:6b8b:b0:127:5c3e:3ed6 with SMTP id a92af1059eb24-12be6822784mr1331506c88.12.1775036504362;
        Wed, 01 Apr 2026 02:41:44 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab983f9f3sm18982647c88.10.2026.04.01.02.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 02:41:43 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 02:41:23 -0700
Subject: [PATCH 1/2] dt-bindings: spmi: glymur-spmi-pmic-arb: Add
 compatible for Hawi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-hawi-spmi-v1-1-c40963041078@oss.qualcomm.com>
References: <20260401-hawi-spmi-v1-0-c40963041078@oss.qualcomm.com>
In-Reply-To: <20260401-hawi-spmi-v1-0-c40963041078@oss.qualcomm.com>
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@oss.qualcomm.com,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775036501; l=857;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=FGLJTuxQpvKxCu6rHEzZ0bQiQmbetGuGjY0whQEiSXU=;
 b=64ePanpjXAb4B4p2W6rNaV55CrwfAIuVUX0ZgZDT0jTYRzPySLW7TPxmAA4XKdg9MBwZR+Azp
 6Q+Lsg63nQtDQjKTt6LUR8WRJHqerHznqI2ZvdmKxo11hM83SEfVsTc
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Authority-Analysis: v=2.4 cv=L90QguT8 c=1 sm=1 tr=0 ts=69cce859 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=-XePK0cKrgyqo5WlPnMA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: 83mEY7n4IOzZpqrFKZh7-lwQ9kkDZfyX
X-Proofpoint-GUID: 83mEY7n4IOzZpqrFKZh7-lwQ9kkDZfyX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA4NyBTYWx0ZWRfX6FNit5qYo0Fr
 uIf14pc6TYvBsKfmpMwoZD9TM3hi6NbXhKxnHrca+rK1fFLCYvXxNhna5asncSj9ZQrlk12Ily4
 NYaiaY2oka1CpA8X1GJuRwLOj53WygeHlHdQ1ukOMHMjpt8lAZ36iLDOwqx33QnJC8wTSkPiY7j
 5TffQfJTgRE71Lp2Hy6Jf//U1OgdRBIhPtU4H47p62/NOPQcUWGdJReTwuyeV5DI7atVNMfF8nV
 ueE3FHKzYt98xK35b5thz5wV5uvDjr4ECC47Kf5O/dHccipYW+kIf2pXeFz5jgajjZeLIzibxLh
 wnKCMzK/VFRMFYymY4N5AjfYNO2RZULEryWp0htFC3vCYUq+frtWrSbX0CX9w20ZD1Xc0329ocO
 m9YaVbRGddAfwO7Q5Dgwj/ademN6kWhge1B3BQ+V8rL1iHfsCh3i+O863RIQ9/nNtrRwM0tHMTQ
 8q3p7cePSSDQq3OEcwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010087
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-101285-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AE1BE378123
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a string for hawi-spmi-pmic-arb which is a compat of
glymur-spmi-pmic-arb.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml b/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
index 3b5005b96c6d..1593a1183a36 100644
--- a/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
+++ b/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
@@ -25,6 +25,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - qcom,hawi-spmi-pmic-arb
               - qcom,kaanapali-spmi-pmic-arb
           - const: qcom,glymur-spmi-pmic-arb
       - enum:

-- 
2.43.0


