Return-Path: <linux-arm-msm+bounces-100793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHphFtprymnG8gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 14:26:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DD235B020
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 14:26:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8889D3075896
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD9A3C9452;
	Mon, 30 Mar 2026 12:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oWz3V/0b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NdiSZt/L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AE03CB2E3
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 12:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774873170; cv=none; b=tgULrYfw1DbwhG3sBPYpVD/OT2SWVOqzRfRUA3tDozifkFYrgvzcnxrWGfLl5hPkJKKk9yP5LfN2ZSe9SmMO2fAlj8vnavBq6I1T201yoZwy835XRLtaSng3rEI4lCBJKyyxrGqyqe3twDpKJI5qP3WCa1qye/67KvoRcuhILfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774873170; c=relaxed/simple;
	bh=N8y7OV6b+feOmDqAL8o/2q7Q8/GPG9MzvQf30vf5ACM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Aq2kJsaYDUPyxJHfGVQKwx6H0kO4layIQHaeKgFNRPZIRHM9MD/v9eA2nOcu6KmNvyjQ9LsjVhQ9WbBH9e5GRMjYlB3+wKii4g8RI5CG7FZNgmnCJQdShZDu5NMfXCVZkoHirnDjPnzQPC9TyHdT3YBdb3yrWnVmYBJzmoBu/UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oWz3V/0b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NdiSZt/L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U7KnOD303197
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 12:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aMqFjynZc9+8C7oZM57AGA
	WB02qxl8TCH767XFRNWec=; b=oWz3V/0bLDtAcs9i2x/eDa1he97diZF+q7SDth
	EgjtBb4HG5BcK0ktzKPgy6Va8u0DpwMB4YSWruSkE2N2BLFz3q4WZpHSMYSW/gLm
	vntKwC7F+YQ3VEmOjEkzH9bIUWE7BuPEgZp/3ivWLqmnV8KwWNbY+mjAatrV8xVZ
	pJaNXc+ZcrXaXOOqyUJ39dh6xnsN1UTSdJHsNQecpifDXWkNd4qn+bZc0fvvGO7n
	H/DBntUILfpy8hEsBAL0j7+qNY2WW/BIlMOkSp4OfWIMMvv0aE6/pGONqEelUGrH
	65aJtu0WidKkBEg8AUbbojq0PCuDjrKmhwlZHCyyFCaJwndw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6wqekya1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 12:19:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-509219f94b0so9218561cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 05:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774873167; x=1775477967; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aMqFjynZc9+8C7oZM57AGAWB02qxl8TCH767XFRNWec=;
        b=NdiSZt/LwgwjUWirHfjdusk1JOghAuXiJ2g48CQWRSW9lYtz4l1npKA8h0InHQEq5U
         XYyK4VOfGpYGbDLcAE4Iu1t18duatEZCCJOKsR72P4mFn/uWEk0RDCJchkys3GmaQElQ
         /TxKDhwuwn/WHrROi87ZKav90EfD+cFbHqoyCnjJra3c4h4lm9PfpgTDU43goQO/TcnH
         ciG/AHJonBHn+dtIT08qTAYPaMdsn/7LgBjSn599dniU6uvzua3qHAufS7fK12lCHa4W
         qZ795j0U+gR0ckBCdaWAspCztwDE7d3P8W/6MDcJpsLJwHxuLFGHBPtMKlJD8URn5YaK
         E24w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774873167; x=1775477967;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aMqFjynZc9+8C7oZM57AGAWB02qxl8TCH767XFRNWec=;
        b=Md/8QSsBZl6s8XU6JPHiECtLkPdhxofA5jXq+2fgemNgxhE8E5fROtGQFSt1KuAxA0
         Qo9ssfdT0UQfRIZJuiRFs43nHjfY0u0n5iCjtrX+CL0f8SUsHCnQuieuVLY9dUOGB9FZ
         JO6j5JI71ZHxN1fnESRdFIkM1f05c7c6TOkitv6f8/yC0wL1iDpUldjlFgGM4XJ1540W
         uwD9ZRw2xKN5nTBNjvUod7olG2+21jn2kjiYKRhA8hdT0fx44WYK1o7oHpRuGPijv+MF
         KxI891r9n5TMik3r7xX4Scgwwubj5+VT7x+ZnDPgL0ZxRnhB7Bmp3fRSk5Rb7o44T5E2
         jQEQ==
X-Gm-Message-State: AOJu0YwgG3jYEgoZQkJW1TfueGjUO+UJAsri5H1avKMZiklU+MWanHpV
	jKhvC/r9+7BIf75q8eU+DpxYaKG8Jkosv6FAy/ryhGUqHknHiId/gHrvGkTYT2nmFRAs4JDwokQ
	QzgJzShHnsGt031UVlLFHMyFcHjeRLdb+BzYgSOAwU+pm/JNvVhgiNKt/pCCjVTa/BLXB
X-Gm-Gg: ATEYQzztAC2haQVzntGFrCIIrWF1RIcWI2Vdxp7HAxeL78xm2fwnUuD22dY/XpVR7Ma
	lEod+q18dhzeemfVFU1KA36dZqKEhqCugnA6z+YboMt6xzMQOgOMJ2NcWNd1c9IbO/6NX1EwwqQ
	+412N1HSPUJVF+cpIWDx9nMm9lRtob9vS09FylVeF72vJB6h1R9Zc6y5FOcYgUnDvRWapPVYwtI
	mfg3mZ1To1dC3vYFIh+s4ZArDRHqD7PSNKaa5a070/7ouvw0UNwPKQQ5EzoeHZCoyriG3H3DnT6
	N78B8SDQa9Xnvs3mDlqu6tz9DiYPXS/pyLqeBxD9lOgIxlFXnvKoXmJAwyUph8aQJ5RDHdVbzYp
	6W7nkI14u6jU6Upwfmztx01gU3WCsRQ==
X-Received: by 2002:a05:622a:2307:b0:50b:3e64:9b2a with SMTP id d75a77b69052e-50ba37f5ce5mr166358151cf.20.1774873162443;
        Mon, 30 Mar 2026 05:19:22 -0700 (PDT)
X-Received: by 2002:a05:622a:2307:b0:50b:3e64:9b2a with SMTP id d75a77b69052e-50ba37f5ce5mr166357711cf.20.1774873161800;
        Mon, 30 Mar 2026 05:19:21 -0700 (PDT)
Received: from hackbox.lan ([84.232.191.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722be608bsm413873505e9.0.2026.03.30.05.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 05:19:20 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 15:19:12 +0300
Subject: [PATCH] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Eliza
 QMP PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-eliza-phy-usb-dp-combo-v1-1-2ec11e793a08@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAD9qymkC/yXMQQ6CMBBA0auQWTNJW1NJuAph0ZZRxghtOkBUw
 t0tunyL/3cQykwCbbVDpo2F41yg6wrC6OY7IQ/FYJS5qotpkJ78cZjGN67icUgY4uQjWqd1Y41
 ywXooccp049dv3PV/y+ofFJbzBsfxBfaPv056AAAA
X-Change-ID: 20260327-eliza-phy-usb-dp-combo-5a117520ac5b
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1175;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=N8y7OV6b+feOmDqAL8o/2q7Q8/GPG9MzvQf30vf5ACM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpympDOxOzJJ1hAxqzkUG97Ljfst/WDDYhxOSpm
 X7A6aS0VxeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacpqQwAKCRAbX0TJAJUV
 VnVOD/9uQlcTgEi4Lai1j1rnXdSdBm3Huec5l7i/Rnrnc3wooEGllMNYvdZgrBmUol6p57q32kO
 AwCMx7se1bp6yDYJNA2R9thUqcCrndItojlgcgs+dUhTEx9CmNkntH9IaWg1Eo0KW9UdPHiEtb+
 m3t8CmZXDBrXmPzKYGNsT5ZaIFZnXY9njJBHpzobyctmHYxv+dtBfiu06vlFFwOMB+rOtTnNkjw
 F5b4nReWPv+V3J7zLps0+U3Kaf2E4IZ7d3tWcsHzX6DstD20yvePONZXjcOug65cabzm9utUe8S
 UaW2SbGXJBUUunVnitDp+90RtkPzj0ze8N7iExfAI61jBTpUUWTk2FDJShJY9QlInTl6joYeOxn
 hO+/dYjwvZGEQb9LLyVV0IthuEZFsIJE3+J5E63pBCZ9LuqkJqXyPDhR0EsSwZ9m093BxP6Vnkb
 E8cNkZfEsPfhKzEJrze5k+YkQerXM2EOEDz/9bkffk211+pOqMneBfKvBnewcnzUzQGi19MbHkL
 jjSfaqYjDCJs5zS6I3mCfqmwnO9PAxxFTXo/5df+aKRJ6suhqdBXoJ1H5x7wTz2j8tZurLB5E0m
 P+AYaHcIX3mwKyQ2JOwQwb2qCL3AIjLex9hT6/1J//p1yNKuy2giyOsQWaIpdO2PYal8gua6nBm
 6Oz96iZEzm6NOlw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=Jo78bc4C c=1 sm=1 tr=0 ts=69ca6a50 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=1UCgTMz9MQc3icybWezSFQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=sFrIIvqvNyyY2lCVqTgA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: lT5bwyDtdHtBwqzO3yrtKMdnWiWgQ5mU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA5NiBTYWx0ZWRfXy2rDpiFedFw9
 MFHqz7G+F2e6WqCb1nuYOIVE6N/RA+Sf/ekAW22XrZzxZvmn9sEZNCz4za4IBc7RdswrecGwm+d
 jIPCKyDKbMGx5ehZumB/0zwogFukuE1N4x8xUI6hUvKBdKefPDYhlwNV41UVcmAuup40RmwL2gy
 AqqP5av6of7fmmJ9cvjZq8Hxmt7eX9yUJwmOLLUiqcRslRCwTYujCSyPP3dXaMIjMkbKHnWMbtx
 +4rbC2Iiv3K9DcOFY1OVYLd8xloR7i9hPHTNZIa8xBHVPrGiAzb5ywrh2e3WTWfkYZr56CuMGIH
 LpFo3uXXzYTvHiFBMl3L21nGb+N5RAWxQaKCQtRSPmVJyFUnWuM7uszbNUYNvcBJFmM+v+j7VlY
 FYzkXnpP4aDfu47e5FmkUTGxtserLDCcQG0tacvsMO2nDGuulYrk9V3wcpZglRS4W13EaDiuSZA
 FrhLuXuzXOSI4RmI+oQ==
X-Proofpoint-ORIG-GUID: lT5bwyDtdHtBwqzO3yrtKMdnWiWgQ5mU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300096
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100793-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C8DD235B020
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The QMP combo PHY found on Eliza SoC is fully compatible with the one
found on SM8650.

So document its compatible string and use the SM8650 as fallback.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml        | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 3d537b7f9985..4eff92343ce4 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -16,6 +16,10 @@ description:
 properties:
   compatible:
     oneOf:
+      - items:
+          - enum:
+              - qcom,eliza-qmp-usb3-dp-phy
+          - const: qcom,sm8650-qmp-usb3-dp-phy
       - items:
           - enum:
               - qcom,kaanapali-qmp-usb3-dp-phy

---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260327-eliza-phy-usb-dp-combo-5a117520ac5b

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


