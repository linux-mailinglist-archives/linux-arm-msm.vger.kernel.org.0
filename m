Return-Path: <linux-arm-msm+bounces-109562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gN7ZCCvtE2pCHgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 08:33:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6C45C67C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 08:33:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E5CA303A8C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 06:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1633939B943;
	Mon, 25 May 2026 06:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GeNOIOoZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SHnGrwkT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3C939C01E
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 06:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779690595; cv=none; b=M/r5CpVPxs5z77hdKxcUanAtxcHT32fkjjrmoWHTuoJfBn2OQ6eEbUwZfDWIJGWxO9f47vVUQO5zvnlMZd0w5XJR6KPezWUBIB/RUGRRXqegRrAKq1+RgrgBjNC6rFDn835q5g0hBVGq1xilgzurfuC/gexfu5EgNphXXbAFRdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779690595; c=relaxed/simple;
	bh=Tva/THzHBTqT2ONF1mJDs2pzgPcet8fzDuKUep33HZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=snR8FBQTQZCEPcdIrNc0KMD3bckZ0f84ixBxiC7fsnSCz+oiWLWbOqxJnpmm9/G6uSJAGPdWZ25Xn12SI9WLenSux8/W/MV6GphvMeotB567NJGkOK7ll79wQk5BAb9qMepslLMQQmpATHzEn9bbfdtIOLMlNFbzzJlBb/bBQzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GeNOIOoZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SHnGrwkT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P686sV803976
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 06:29:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J+gMWLEMj8dIYBFuFbm1S4Zeb9oR0rkjHmKZnsKAxvI=; b=GeNOIOoZ1kqSyQAQ
	nB+fh9IUanxMAbH9F+mYq2D57kDsjSCOiAq/jSbQt2ddOEUAdqlC742pIf6R4uUu
	k9koFq5djjchQjavIpiGKx9Vxvxa14UxYjB3oS1raLRqbI3T/cTSNnC7DbTb9vwZ
	U5TbFU2+qadZkyxJjT8IULMml8mCl9OMn3ltLTNXYeIfwdrYFYmcIsX+5MNPR9+3
	AlI3KTfF+Q40/epzStXbH76OG1Z3ismg1nRs8qGoQ5/0e5KFxyGPXSEEfvNuw4kJ
	J43HDOnryTQNI3UCDTa0OYwl/14CXdzqyyr/3hNFp66048mWDlgWY3ahd65CteHD
	AJuyxQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ebba0vgba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 06:29:53 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2fe1cf409a1so14784681eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 23:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779690592; x=1780295392; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J+gMWLEMj8dIYBFuFbm1S4Zeb9oR0rkjHmKZnsKAxvI=;
        b=SHnGrwkT0q72iVgLPL6FxmFIDkyb7GMFzITRty92PV19Zh5CAauiWLAvppgdKR0Cre
         rX+fr/XbhgaaBRB17Jj9O/nsOqjdJ5WX75GWESwqXqR0fWnKyS7Dj7acpF8iVqeEWS9A
         a8et875ox+mUMAK0RaWv/hg4sfEnya1Cy5O8VJUd2g7SMA1DJlSi5sY4WA/bydGM7IkZ
         ef6vIntEXvNRaFBQOkT8aPnWCZ7Do1vWg+uwu0wYXLD2+WOE7tbVArnlUd7eX9gRewa2
         uBArQnkwISXdFk8wC29F24ztF+uhMosL/W0E7lTZQJkD5moNmxtDhzCFR0r3WkXsBHO8
         p5dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779690592; x=1780295392;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J+gMWLEMj8dIYBFuFbm1S4Zeb9oR0rkjHmKZnsKAxvI=;
        b=FuHVVaIkwvB++E6+gvaw8iT/XcUFomHRAD7LEd7xM6sPeeCUOSVw9t5tyadhht7/8l
         sf1GbZyHe95qGSbWNEv8V6KEdG/VYwrsCYWGFG4hy/A17yGkAqnCOm7TEAYIIOckx2h/
         EIMTVl7A2GjIYx3/yDH1gA6cbu8b3rbiVITU2JQ9sdpkY/EL+45gnC9mOJBWj87X0Ixr
         ITORA+c4Jr4SkDAkA361bZ+oxI0ewAUxn6Tjf0JB2tPM1fGdF75GE0Ae5+GLMUfq/7kF
         iItD/t4ggAJn1J1cVeVGIOrGp78Du2CBTzC2J6Kp7c1aAf1RRogyR6j4qsMlqpawlnzl
         1sPQ==
X-Forwarded-Encrypted: i=1; AFNElJ9I0HcMHYlMBTTIDcyA3B3aoq6p87eRkb93zztJLMx6/p0sDsmZ10YLTQCTuvZLbQdyFAde9zKhmShppqBE@vger.kernel.org
X-Gm-Message-State: AOJu0YykF5+5KEKbCGEDvLd+FocFuifr90wkuNu2VHz2F0GYnCgYzSob
	0+d1BEVJhiNzgc09kjg5ry2SRCNjoCek0OXr6FSOHkfI07ZhgtXNpH1s9ZA/4dCo0I34XdYmIjv
	Xw3Ts8ij/E4tg/e/gjqyFpOweItZvn2DV9IvwfDYxTEwQZzMKGJVa8yOhs3V+MTI8bnsg
X-Gm-Gg: Acq92OFyWkRD6eQtmIQUPS1SnIsxMC21Vb8yeF9U15S6+H5CWNVsR4c1c9vjDieHp04
	9wLogm6meFhmKrQbBpLoKa+Auv2phUz/dGCoTtjOcvPfnr1x9F1mVw0ZbsvZPnrQR2CtVPsXyTn
	gcZClXG/nKdUPEYyNssctaNnfR24dP0uqESng5xjCTiD2tjo8Bf1MM9aTShbxKZgULwmW5O5aPt
	frO1IMLu0Epl3nhJEIzXkmwfrCAb/X8A6PtdQWwSTVf+TazNLWuqrGh3BZQAsb99kmbo3EwK7kP
	0t1DKR7eM+TSNHMhqaP+nuW5ejxIlCDoyn+vm/ib/YTUPZ+aM45mbv9+TF97D9pbsR7RGr4vf+2
	a80n3ohv0RpuLDO35bbQpsIdWsxy/y32nOWsNgoRHnFWbPGw1zY2wx6fy6xWN5+NSvdB10uWqWU
	HNmeF2C84=
X-Received: by 2002:a05:7300:e781:b0:2d9:5cd9:b8ff with SMTP id 5a478bee46e88-3044904e131mr5748000eec.6.1779690592300;
        Sun, 24 May 2026 23:29:52 -0700 (PDT)
X-Received: by 2002:a05:7300:e781:b0:2d9:5cd9:b8ff with SMTP id 5a478bee46e88-3044904e131mr5747986eec.6.1779690591799;
        Sun, 24 May 2026 23:29:51 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3045223103bsm6918036eec.16.2026.05.24.23.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 23:29:50 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Sun, 24 May 2026 23:29:44 -0700
Subject: [PATCH 1/3] dt-bindings: firmware: qcom,scm: Document SCM on Maili
 SOC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-maili-soc-binding-v1-1-fdf9f9ff1b23@oss.qualcomm.com>
References: <20260524-maili-soc-binding-v1-0-fdf9f9ff1b23@oss.qualcomm.com>
In-Reply-To: <20260524-maili-soc-binding-v1-0-fdf9f9ff1b23@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779690588; l=1059;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=Tva/THzHBTqT2ONF1mJDs2pzgPcet8fzDuKUep33HZE=;
 b=3vNwXJJKk1nnEHXT0Xla8nq2YOM4sL+OikLSLNip6PWNne6oDCAivAGEjH2EY7ExwoX0byuMm
 2hCRR2GwuSdD5I1W+W+bPn7cmI/Ensng3bk0f1aRbzr1kcEd4qKQRKj
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: Q6eCswttHx5lJIliiurCZl8akupJ_Fon
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA2MiBTYWx0ZWRfXwF+7E0KQP2yz
 VMHSgYqhy+5HaKc0loIpzYAH6ev3zce7/AC+Q5JbRsOShkL0VeRHCjxNVP3TQbNngiyCIaNy+ES
 wEMqfxsMm/38puZFJQxYWM78GkVUTBoxgg8+XkXwRJXZTaycq4TDI3cMZ8wXdvM/ROmN0HjNfVp
 Xs1GuQ7G3Bz7tVFdiCtL15SPbwn65ZG9kT7dty0H9DDASF9sHi+MGk3JLm72LYI7wEgLSCWrQe3
 QDHA7p3C5lJQMASahLcsoC2xvPYUm1DMVpXWWqJ99m30aSTnowIajQuxRi+LREKfr7g5aPmBS5s
 Zyb8RGh11EjQeyBYJvBK6m9G1QRXsmp9BFPFVJRNNdix7gfSmf3nDTgQpU2xBdTZMITKhlpakGG
 9PpSl/QTFZULajPC1l9sD+YH6pq+4yYEGXGZdoUdSAp3/ljJDRg2JYkN/zocczWYbMU8FfU4qp4
 GiM5zEdzE6NQvVJn9Gg==
X-Proofpoint-GUID: Q6eCswttHx5lJIliiurCZl8akupJ_Fon
X-Authority-Analysis: v=2.4 cv=Xca5Co55 c=1 sm=1 tr=0 ts=6a13ec61 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ffYJIid-Q94gFHaen9MA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250062
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109562-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7D6C45C67C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document SCM compatible for the Qualcomm Maili SoC.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 25f62bacbc91..f344d1390b1b 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -37,6 +37,7 @@ properties:
           - qcom,scm-ipq9574
           - qcom,scm-ipq9650
           - qcom,scm-kaanapali
+          - qcom,scm-maili
           - qcom,scm-mdm9607
           - qcom,scm-milos
           - qcom,scm-msm8226
@@ -212,6 +213,7 @@ allOf:
                 - qcom,scm-eliza
                 - qcom,scm-hawi
                 - qcom,scm-kaanapali
+                - qcom,scm-maili
                 - qcom,scm-milos
                 - qcom,scm-sm8450
                 - qcom,scm-sm8550

-- 
2.34.1


