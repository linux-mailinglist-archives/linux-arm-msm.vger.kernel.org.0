Return-Path: <linux-arm-msm+bounces-97573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IF9fCKA2tGnTiwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:09:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C993286B2A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:09:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7F8B30A4AD3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD9FD3C2770;
	Fri, 13 Mar 2026 16:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HFh1t9r5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F3+dSy/g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0921D3BD251
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773417813; cv=none; b=IoCVfKsb/qy3+VYDAHF5FAKWowF9CKVUpqt68Vp+cJofxbfV7Z01irC6e8t3RDjnRH6pAag0xg3vIk5LGmqZyUuL54BwGIRy+UgCsRKaoo96azjZ3d2s+2Tu2tyhikl2MAoqrbtlkA+q1eyPsPSodk0xAKxicj7G11BzvI8qUxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773417813; c=relaxed/simple;
	bh=vFhTWj1Kam9OsLR/TmQxnydejTbhwadm6/oHv+GjKc8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qiRyn3PR2V/HIKer4LevkCez8JXqPHPE0rL6wz2DjZzjKhrBZUQy2eqJho9RpxXcEQ6qAmDsIJwEMIKbzj/VaUInULKpvVCCsCw0l3nchOPWZFavErukBEvx31ifb157PhT0o/1qXJ6K5yqNzn2hiO84BHO48Brlj7KhW18Eoqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HFh1t9r5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F3+dSy/g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D9B5ZD3906306
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:03:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wNIaLz9L7fJPRgrVP/Wgn96wI8NlDDrpGxn2SZ27rJ4=; b=HFh1t9r5biwBFSbk
	u7Dz6dkEluwUg+U84RFgboYGm4Idg+B2pjtqTSqvkzZslrgPeTqYqJLud5r+fpit
	tpndzrrp2fy/L6Fqrsb1PgYB6ZHiDuHZZBNN0Xtpr5ndf58rPJpCvMS37dpfJMK6
	kuXcOGNFlB7rUUGd1YS3MwB5oVso+BkRLM/4vQ1bGI7s79Ej/8ZtRVIrWkJ2KFz3
	P8mzJX01JplOp2H4Cb13Y1EEUIGzDt+M5guB6lESE337nw7owKr7rSk1AwxyfnFR
	mOuAGWC2I1xzAd/cy0cmEAwu0BSmYjwA1hsHzEo59bNlBpvIUfzxzflGVvo1zBYL
	b3lyaw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvfqs9caw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:03:30 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82988b04c5cso7279937b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773417809; x=1774022609; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wNIaLz9L7fJPRgrVP/Wgn96wI8NlDDrpGxn2SZ27rJ4=;
        b=F3+dSy/gqR9S471dapFcffNsx5Q1dLoKvucTkHtEUClK5JiAJ/1fiPJ2b2X/f2DWpI
         qmIUV0c10pJyNvgS2z34OmjR+M6ZuKeKrjFFE1RvG33P1MBXJSwzmdYwC3q7sdDDNhVN
         026mwqJr525Ai002RwpLj/ZrPXtc7EMogBKNG1zbmuQAeV3EMoDj1XlEEkXO7CGohgRI
         r37M0SNajXytWCSzGdCGU7Jwvuzh4QGGSXzVtNHlgvLxnd3eVOT5GkN3qJtyEx0qdcB3
         pF46ehouxBLErI0oEcpTzgrGHcb0pmCl2F25NvrrAp3f0H3sQSN0gValkDSsmeSo0B/v
         Ezog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773417809; x=1774022609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wNIaLz9L7fJPRgrVP/Wgn96wI8NlDDrpGxn2SZ27rJ4=;
        b=TcXKu4LxJ+uynOSk4OU5nll9bcexwu3SZG/5y3wnEP9eSPswac96i2EqL0QUvLj4pf
         isaJp4nRM6uzU6UeLFzH+0rBqXbUHUd4o9mzfWN58yOL6ElafP5MraMBYXVXuquO23bo
         FHqnxnac/gEiahW7fuM9DdRap6F8FXMqoVt+tLwtJjbWSKf2LSXvrX+7rfMm2Bvx5lti
         3G67QrkkT5nfemaa1K+4TYMV1sjO1up6Fd0r4DuGpOlvl80QYf1Gr6RVgx+2UxlgFcRA
         RH4VyYaFxymKIqB7yhmJJVmUd0ckmSbA3RM1E3kMPMOqfVoFYVLvvXlI5sKLDUmYQ7GA
         Zgag==
X-Gm-Message-State: AOJu0YyNpe2xknlj34ygaQe+9qYtblfbnNhtqb38T6CBQSSNOeo24wTu
	+2uNt+U5fkcKNsLmawj7FwsOHa0ozSIqfKGy10k7IKalRaWYhC/IkhaGivLnJUiA2M6UKj/66Ec
	jUL+oFCgXAtKkFnQRzHurH9V/7jYLr5zwbEW3OftqIR+3CWo8AJfVS9Vi+fwsTh/nqCqF
X-Gm-Gg: ATEYQzz2WT2R+YF90bYc6eTwRI8u882FDe3pMzg4rwCqWlK5YXYy77Vy6v05BOdUajV
	ERF0z9PC7oHSiEHmN0M1Uq2SwqSqb/4vAOOBXCsW0oelzL+EPqmdhsc6tPOBusaADPpoXV/x2Yr
	nGjQ0R2yQ/HG/nrQxEuyvhRssEwjq0j6fLgNeGK6kGb/GVU7li7vI35bHoHc5K2sRfappghZXpQ
	BDSneUIKf7DPY9ed0fNmy4Uz69r66jhWYoiBbgixpt+IJ+OKsZekgdER8pZdSzNLPebrfrIXcOY
	FvZIVYkuZynTURPedoBRxmnJY6TjKMz4Ub9vhMOnwQ/9ufPJr5hKz53/eTALu5fJZbp3F0MM/jE
	CvRte0OcMVecnnttCkf4TSSRis/x+oedAtEJAIX3vCYtniLtufCY8GdkpXOl5qcMhoTFSMWMj6I
	TDnTBYTsMYBVEo1z3R/Tosszj8R2E1xP+fT+veS7PW2kAEGSkdw6lA59as
X-Received: by 2002:a05:6a00:14ca:b0:829:88e7:c8a0 with SMTP id d2e1a72fcca58-82a196d375bmr3408971b3a.12.1773417809041;
        Fri, 13 Mar 2026 09:03:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:14ca:b0:829:88e7:c8a0 with SMTP id d2e1a72fcca58-82a196d375bmr3408933b3a.12.1773417808545;
        Fri, 13 Mar 2026 09:03:28 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a13a2f2d6sm7617470b3a.9.2026.03.13.09.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:03:28 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 21:32:57 +0530
Subject: [PATCH 2/2] soc: qcom: socinfo: add SoC ID for IPQ5210 family
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-b4-ipq5210_soc_ids-v1-2-97faae3fef95@oss.qualcomm.com>
References: <20260313-b4-ipq5210_soc_ids-v1-0-97faae3fef95@oss.qualcomm.com>
In-Reply-To: <20260313-b4-ipq5210_soc_ids-v1-0-97faae3fef95@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773417798; l=1075;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=vFhTWj1Kam9OsLR/TmQxnydejTbhwadm6/oHv+GjKc8=;
 b=Lysx9Ed+3mWqAeTQkvERMXE5I8vpPn+xbjrg9OhcxdI6SFzbr5vEsAzNJ6c1PmR4HoyyxFTZa
 /aZ3W0RT4mlCAFADukGFf9kmun81R96ArgfjtTyh1kOP8mXyF2u6ll/
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: o4OG_EbpIJyVDXBQCU2JiXZiOVAjjyC3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyOCBTYWx0ZWRfX69fN2/SsxlMM
 wF6GNPMFncBY+wLUUTJNN6++PY5+OcBt/PIEu7T14GNp6Zgg6txRJwTvnKr8I/ejUwNYOkcX11c
 +BHBnW631RZsMBMey3rjOUv+d7eLRyxDkaCfVEtGGZfim8TOc75+X8fDv6CDYIVXeIF51S7bM+i
 /98TSHbKLKgrKDsm1mQJnfS2Y5fTR5SAgcE3taT4awP7YWuccLXpWG1x2bK7YqVNGKuQ/B6aLKL
 K9NbM7CTWWGpd36ASrPSN6KQpAxdNdZgEgfBOH1jJm7/vnl0YjzGsGNb+VYP5lh473Z90tz8hJS
 W0dyGA7VOeTqVmEeZrbkjzYdOZ6Nwtq26ajT70QfgYjW8Y17KBXCUBeHXOYjOW6YtDk8Q3PrcBB
 vGd/M+QW1dmPLiaARe8luMqbnd3fwfmVJUDlnaAjevVFO2NT1RBCAtTp8C7QCPHcNEnIhdIUw8N
 Sk8NPGNt4sci68IqjQg==
X-Proofpoint-GUID: o4OG_EbpIJyVDXBQCU2JiXZiOVAjjyC3
X-Authority-Analysis: v=2.4 cv=GoNPO01C c=1 sm=1 tr=0 ts=69b43552 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Fu2THIaEtsgb9gtVlWYA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130128
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97573-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9C993286B2A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SoCs based on IPQ5210 is shipped under two different naming schemes namely
IPQ52xx and QCF2xxx/QCF3xxx. In the later variants Passive Optical Network
(PON) interface acts as the backhaul where as in the former it is
ethernet backhaul. Add the SoC IDs for the same.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 41867601d2502f7e6175d6a22d7f508668704385..a6489e43fab79d9415243d5d6dd2e1d00c347c7a 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -524,6 +524,11 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(QCS615) },
 	{ qcom_board_id(CQ7790M) },
 	{ qcom_board_id(CQ7790S) },
+	{ qcom_board_id(IPQ5200) },
+	{ qcom_board_id(IPQ5210) },
+	{ qcom_board_id(QCF2200) },
+	{ qcom_board_id(QCF3200) },
+	{ qcom_board_id(QCF3210) },
 };
 
 static const char *socinfo_machine(struct device *dev, unsigned int id)

-- 
2.34.1


