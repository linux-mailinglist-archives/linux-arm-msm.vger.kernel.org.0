Return-Path: <linux-arm-msm+bounces-104579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8H4jOwq47mmMxAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 03:12:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B24B746BD4D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 03:12:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DB2AA3007952
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 01:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26A5624A047;
	Mon, 27 Apr 2026 01:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gII328xd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UCHiNmSo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D290F175A81
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777252342; cv=none; b=ZRenDPPQjoXloEK/Yboki2AqRhWJzWs9vx/3UKMnN6RDEj70Ooj4xAsn8Kh8Lom45nDbqWEIAT4Iab91B5o/sFjP3hol1wqDkoafbJ3sZrrWVNsiPic4b4qhobv140ah69LWxjFEPUIfiufN0VHoi8cWA+nqkg9rYWugjvut6hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777252342; c=relaxed/simple;
	bh=wYK5FouWlO3mk5cCQsRr7TV2jrk08SCEhtmOvT6O1OM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I25QC3DWt12Uq6UUoTjqfiK/OAMG5xTeRLTUC+uUYM1Q10JtxlGME/C3egRXs1ANLi/gdY/PdpFE0ZBTsnPAS2f8M3kAehgmyIsRdtJaGbJBHgYOyGlta+FAsScdAyfP+5GztH8cbWyNdoX7GbS5odjY02fomPlFiHhOZaV1DQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gII328xd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UCHiNmSo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QHreYB2935644
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:12:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3abEdQkAq/o
	rrnyPwmUqAnKNXSf8C1r9m+gP5m1lLcQ=; b=gII328xdwfVBFD7LxqbiMG5eHeM
	DPpgRtE7yI6m4Inww4JJ0n2ZmNkF0fQzz/AYAzFXeM45C4BSRGtVCeZq+uSETkkD
	GzLJogIR0DdmMJcpvzvuzPPMeNPBQ+HA6avqECLCBt4rds5DHS2UPg0ca35oczGY
	bpZUahCsXDef/ccGXSa63W5ry+tsOCKk52eWttz2ZQuBiIBR3MiA0jPqmF1wM73Z
	vwKoENKFk46EcxPPQtEUUG4/ahAl14WyOepsDqsjuAw5ggGriFRX9Qsa6Ycd2BXK
	/u0Mm3UawJC1/F4L3pXuaKxbPMk7GQx/O/fWt/TWXW+jUxcRIETujAP4aAg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drp07kvsy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:12:19 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12dba1e866dso4136803c88.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 18:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777252339; x=1777857139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3abEdQkAq/orrnyPwmUqAnKNXSf8C1r9m+gP5m1lLcQ=;
        b=UCHiNmSo7P82LzNYvhzcWgHk+ZfOUQu30qw4f5aXSavSeqrj6HSy3GmNTNS+TQWgio
         IYYzlcS5bEdZIZl60vk/loHLAEDk1zZOE6FCKYGFmdU/+5XeixDmDanN8DxUcWmAG9sw
         OhCHZd04u7M7V063tZkdrdELxcbxm/tnUYY9d4Xgbu806foJATPrdkDBOKRWUHAHR3B7
         qr6ylSKjXGyp7vpl5jXSw6WnL13jeOdW0Aclx7PS/Q3hvhRErZ/Jsio69S3Y5UmKYLZL
         hysZIU8peQ08fyKxDiv7Jx/pVP5VIDA5tqgvI3RrwtC9YmZOX0cGkB8ezC2HHGp6baO6
         d+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777252339; x=1777857139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3abEdQkAq/orrnyPwmUqAnKNXSf8C1r9m+gP5m1lLcQ=;
        b=XMIzAHfB8CcY5dBo3UtheeooZwUJ2fjjOCzyHsTnmvuihj+4NZl+t4E2Tcx+X8jiWw
         qeWSiBFU1UdErPUMdK44Gvj0eU1unNxsTUDYLobUC+Fwkrn4BLrrLVebhOFdnGiK3cgG
         BB29qFClIJq89dn9subIBC5K+CQXRvweKwehQT+qhUtw2fqmnFbEJhVMvnjMtClRFP25
         KEFVewgOsw2bwRra+D7JaYy/t5NVRAoAcerKXZni+N+QgKEverE2z0XlNnZvUpWXZyyB
         8jYxQmzw2GGRhmYW0npFW/IPIbDqlUesjyNvHeXVlQhrp0z65ZT4dhlORfnyRmaBC1EK
         JJbw==
X-Forwarded-Encrypted: i=1; AFNElJ83ajTonniF6Fj0hcilPNPwDfF5+UdWL946EiETXGm1Pvn1SUVUwvn+Pd/Pt6cf2JnEft7e77JXeYwLe92J@vger.kernel.org
X-Gm-Message-State: AOJu0YzHWC2eBNq3h+hLn9yR6jNx7NL9W2cokGN5Hpsh7UZPEDMIt4Fm
	f30fJmu0drs2wzZAr9liuqEEhUpZ2CM5mUoJMfRXKjbCZW74AInDc35FChUz8DQvShp2HZSvPmW
	xLcF6IJookQI9t296xmY7cF3a1ESJOfLyUc7LzReUUCdtMVrP8MT2Xd9kvN4ygpiOCqaL
X-Gm-Gg: AeBDies16K/mVJ3d+YG6FvDloyxhsTF1LRU347513vNAEujYdwrzALH8oZ0S+GDCyGb
	DoY+UXPtfxmzMeCaQs3us0DPhPAsyfcuQ95gqLZY24BrKehBwC8AkTl8tF9PmuTMHd34sQVPsHC
	/lPxigsa3UUx5W9sfN+RUsrOrNeGZRpW0MLf3A+5OmTQYCv1yfhZwpUcJ7pQB4f4r7LvmHSRgKi
	Gk8kwSQ4qWN+6ykjlM1VdgsUvBHLuIh9DzYfMlhFinnSo4wNMfexZx2SDusAq2lIQwb2331eMeW
	3l7ObNAhXJ+J8wFf/a/cIFmgZxanSOH9M4Fza6mhHWldMYExmM9cp9RzG7n5XB2ySZWmsrq8dN0
	oCS5SscUqwno6ciqZZqopMCAwenev1yXQwP/IXHKkocIJqaX/ngwRk2tbRnvAG3jXQrmbsHUo/E
	ZBWqRwBG4DXcTBua8s
X-Received: by 2002:a05:7022:618d:b0:12d:c3d8:1f95 with SMTP id a92af1059eb24-12dc3d8249bmr5470060c88.4.1777252338942;
        Sun, 26 Apr 2026 18:12:18 -0700 (PDT)
X-Received: by 2002:a05:7022:618d:b0:12d:c3d8:1f95 with SMTP id a92af1059eb24-12dc3d8249bmr5470043c88.4.1777252338422;
        Sun, 26 Apr 2026 18:12:18 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12dbe78e12fsm21720098c88.15.2026.04.26.18.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 18:12:18 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 1/2] regulator: dt-bindings: qcom,rpmh: Add PMAU0102 support
Date: Mon, 27 Apr 2026 09:11:58 +0800
Message-ID: <20260427011159.230698-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427011159.230698-1-shengchao.guo@oss.qualcomm.com>
References: <20260427011159.230698-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=K8QS2SWI c=1 sm=1 tr=0 ts=69eeb7f3 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=j_AYJ78cZ_8DOvKTJOYA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: WjhOUA2vxwOZq4zsLum9ruQilN0ANKKT
X-Proofpoint-GUID: WjhOUA2vxwOZq4zsLum9ruQilN0ANKKT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAxMCBTYWx0ZWRfX5DY+KY7gL6pm
 PSN8jhB4auItT6AfiiADZDOQ6g1O/0b58daXwGFdkHVwMtS0qV9dASGqc0aIzYvBwMnWmkO8a8X
 sbTGE9ASAOpXfx0BL51lmKBRHHfIgBGXtRv3nOEC+v3V/yEypc+Wjp6yONNQXHMQbQufbQNyUrb
 SRwYyQ1S7pMJMLkm4HEOKaCsLZMd8GgviKnEUvtHsGaSsuuWkoMvGX9XI83+NSfrtJWIj5yDisK
 FpVv1BYbve7t5LxH0b2Z/jged4LEq+2DYuVxHhi/f/HBo9Phs0OieWz/I6hUd4nRWZSmWV2s6Lk
 tz1FgYT/X7qEqd2JY+MB6bMF/kYe7GDNT359veExeCKwCzLtVxiQiimdS3CmzLyoxqwfdGmrFkT
 DgU9eIxBtKt9O3ixak8lOehkMmYs0USl+8htNXVIiNk/K5PymvqVH5McDu2Hc0SV8SIe/s2dGcr
 5O0954ILa7VSk9sB2+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270010
X-Rspamd-Queue-Id: B24B746BD4D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104579-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add support for PMAU0102 PMIC used on Nord boards.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../devicetree/bindings/regulator/qcom,rpmh-regulator.yaml     | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
index 58bb0ad5dda4..d93594304651 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
@@ -51,6 +51,7 @@ description: |
       For PM8450, smps1 - smps6, ldo1 - ldo4
       For PM8550, smps1 - smps6, ldo1 - ldo17, bob1 - bob2
       For PM8998, smps1 - smps13, ldo1 - ldo28, lvs1 - lvs2
+      For PMAU0102, smps1 - smps8, ldo1 - ldo3
       For PMH0101, ldo1 - ldo18, bob1 - bob2
       For PMH0104, smps1 - smps4
       For PMH0110, smps1 - smps10, ldo1 - ldo4
@@ -87,6 +88,7 @@ properties:
       - qcom,pm8550ve-rpmh-regulators
       - qcom,pm8550vs-rpmh-regulators
       - qcom,pm8998-rpmh-regulators
+      - qcom,pmau0102-rpmh-regulators
       - qcom,pmc8180-rpmh-regulators
       - qcom,pmc8180c-rpmh-regulators
       - qcom,pmc8380-rpmh-regulators
@@ -417,6 +419,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,pmau0102-rpmh-regulators
             - qcom,pmc8380-rpmh-regulators
             - qcom,pm8550ve-rpmh-regulators
     then:
-- 
2.43.0


