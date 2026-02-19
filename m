Return-Path: <linux-arm-msm+bounces-93388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uM4LGOkOl2n7uAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 14:23:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1AE15F016
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 14:23:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 27FA43024A22
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 13:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D568220C463;
	Thu, 19 Feb 2026 13:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EDyECVB2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M2yCd7lp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FD430E0CB
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 13:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771507427; cv=none; b=J4gvwzykBe/SEi+QCsptgupNUMEDr9rpsVnjf5MR+ITlgm12iQgVGioNxtKGCtswtcI7lFG7qot9Ljvp4CLmvAxdXXYBw6+O9ZXZp4KZIMn9qJeEtqoqyje3tDbuuPchr84NCbsSXqaWETQltXceeQeKREWeg3SCsURwTWWwjXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771507427; c=relaxed/simple;
	bh=Tf2s2ioOrDRKV9la3WETakJW3VpMyIOxdWHrnolT6L4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UKmQH+tB8NIr9seHOu2ExJ9Wn4yYKYnnciNH1efvO0Q+voyMi2piqiXftRXirgvxXY2YD8RB/h6qyg6nBYPos68m0hKgxVblA3rjk4KgiVc19uspHBnNyK37Vz5Su+hXogs0K6GXd1vksusilLU0iXVoN5ET1NBhOqz3vDYg8BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EDyECVB2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M2yCd7lp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JAmSER1623636
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 13:23:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hdElgaqsrEQEm/JlwYpM13ka1q9XzT8KVVd3e8bUd+c=; b=EDyECVB20SQy3zmf
	0vWW9q6UOR9cxpbecCE5+WBHiY4winbv8ESv8Zw8rvGWwE/gDdfK4DE96jrDUFDE
	ova/qh3wtMxkw/f83v7mR+dQuIswY0GkS2unvX8BRWKrh0Upb3YSMnHnUsuz8WoA
	n9+m7KkgDbNtGhXuEWLq+cZrM9GlcOD1Cp/rfQz2IKQZTEidELzSh9ftF9yQuWuB
	S+9oMG4cCp1AheNue1t0YAsalOIA+ak+dvD9TqojKf6ln5mAwWsEpNftMd8T+BT2
	SwPwKzw6HUOX96v80lg2wbs9jZrJwPMbx59lOonHzXv6U4fxzST/NnzslWOFUaAd
	lZ6Gkg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdc7ubrur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 13:23:46 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c6fd07933aaso649244a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 05:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771507425; x=1772112225; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hdElgaqsrEQEm/JlwYpM13ka1q9XzT8KVVd3e8bUd+c=;
        b=M2yCd7lp3OzlZV+ZI8z2hM1HmyF3uUd5UZI15oWh5YPA9prkYSxA3+gZO13TCQ/BhA
         Kniau+B7SNH6VfaerqFKQyKKNxiJG7T8Hgmh9E1WE3piabeVlVR5g6OBgE7ng0+nMwUW
         gbK8LbHkJi3IkECiTMNIch4bEYgLPLFhvBc4AghYJp4N5+08usPjrbvaK8u5fJnLI2rZ
         +WZnHdHx3L5EY2V0FWxQI6VB5k16F5kzs9X7+7rV6w2l7AY46C2FLryCt7PX0irEUYvU
         NDWV4jhTF+677vyoVa3epSz1MoIW064hxZlO34MaVOPEnNgb6WJTh6pcFunomV8OFjnL
         E6UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771507425; x=1772112225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hdElgaqsrEQEm/JlwYpM13ka1q9XzT8KVVd3e8bUd+c=;
        b=uVbSnSzM0OFZaaUg2DJBAAyLGIuci+aDMg18oUIGdosTBfU8GY/jjkYyVro/umjB/E
         ep24LI1RAkemvdivZAVQY/2rErew3m540nMQvAakKaBVFS+NucIFes2ksfe9dQqvFGjI
         zxFU3MJNpGjSC4xqJGn3M/+Pj0q/iI94XmQjPGLIAnZ1asQ95jtjZp1S6DqZcJCWN7Gl
         2B0LGup4J8xzgfMaKByupnIHHe/lJnUMIh+XUk8otUf+Ye1JiRGQY90RbV1Fre55cchA
         zV4lo1VCuRl3RfcHHXTtJw/LfChE9Ok4e7fDh/Xh8T362bK/2XwO30OeTBfwjbZ6xX04
         q1AQ==
X-Gm-Message-State: AOJu0YwJ2qGhAld965+0R+XFF8tgpzsrLuMVRe0fyZ3oSIBBtWmDVKU0
	HEG47/RQgYyVNY8/lJTxHFL+U5U7DRx4Wu9BW8gbsvEZGVoR7hirL26smWIF6ITxrRz/IfE3ezx
	Ao1B4dXRewVdMN9T+J2oHpjHvDU2n4p0Bsfq/LTUaEfam7J0Nit+F7Kd9L4ZGEIvMNX7KYv9Shq
	NL
X-Gm-Gg: AZuq6aLsx4aAcsUPmPR+Cn4juMyvbtAkGN0NuxgYlpDL/tSr14AmUXs6TCmuIl9yN9d
	o/ZHQNWRJmnBTG6CjphbLDi7BWD/DvnsF9RflwhDza44bf0/QCtmyuQIlUtpT/3SKGH8Ojm4ZY2
	Ot08/znY8cIZLkoDME34FEquG4T04An7YfU/MMzEtdUtul4KqCfmTK+PuV6gl3Jl+ALWr92ovCF
	KaSb4iDkGJe1rSnsfkyABpf/koyZ+bOMxMKHx/7T8r5soLBKf85SWy1XKbGNJAb9aMhuQzrj1S+
	5QTHjj3znxoTLZuhMO5JFafkyU5bbdxypKL1QEjfZUr/+FgaeNfw4tVPs1nqwGD7ZzslwSYNoQO
	IsNGkLsopuTivne+Lwk4C8Kgspm/nMwBZarlnhRjfeTBMb2HbAZYQceLgEARZwRyqEax4npHxrm
	A+RagiwkqhbpN+f5zC0VsOCvBhyzaCeI8WyxsKheRMxw==
X-Received: by 2002:a05:6300:228c:b0:38d:ebdc:3558 with SMTP id adf61e73a8af0-395120da3cdmr2390365637.6.1771507425189;
        Thu, 19 Feb 2026 05:23:45 -0800 (PST)
X-Received: by 2002:a05:6300:228c:b0:38d:ebdc:3558 with SMTP id adf61e73a8af0-395120da3cdmr2390341637.6.1771507424706;
        Thu, 19 Feb 2026 05:23:44 -0800 (PST)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e52fd0ecasm18489620a12.7.2026.02.19.05.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 05:23:44 -0800 (PST)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 18:53:26 +0530
Subject: [PATCH v8 1/4] dt-bindings: arm: qcom: Document Glymur SoC and
 board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-upstream_v3_glymur_introduction-v8-1-8ce4e489ebb6@oss.qualcomm.com>
References: <20260219-upstream_v3_glymur_introduction-v8-0-8ce4e489ebb6@oss.qualcomm.com>
In-Reply-To: <20260219-upstream_v3_glymur_introduction-v8-0-8ce4e489ebb6@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771507414; l=797;
 i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject:message-id;
 bh=Tf2s2ioOrDRKV9la3WETakJW3VpMyIOxdWHrnolT6L4=;
 b=lGVPateCHKjrbw+XN3dBb/yJjq7qLlRjdJxLm6bHlishgfVbI8DgyaH/Z9Srx9ldnIiSdTMpo
 oXIB5nlMHOoCVGe8r6krZVQERZerR9ZqudWQfPWjEaMWo4ZyYOos01W
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519;
 pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
X-Proofpoint-ORIG-GUID: NZShF-beYGRELuiV_ImS9SpaIhYnH2VZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDEyMSBTYWx0ZWRfX3BheTk1LsGWi
 C8gHPWYg9wQLU0AjvJH9bS3Lf9Cz1jYrnZ9rFmpSCIcAmrfGo/i3KTpx3R1gVj0dWKxmqPrmow7
 GA2oHSIyaVKiga+ons/XDBQD8LbVD59SfgbkXXjr7/KMO59109U9de80Sc5mggkElb7kU/Mptxf
 NLBG/nxvVkLIRk9uV/h1tuFRj+ekCTTFc5GiXsVjHawymLWR1OQJuy/ZcgX1hXiMJDSFCDIY3YJ
 0VENcybMbqLBuUF/M1E1XSt72aEV/2kG+yMbecz6jwvKYT3TSLUvl6lOaqKCdrHMmFxLIeNGjX0
 bpI5/DJNUa/vboKiHN/WSxQLkkqzVETpWneuTRNOezaNXs6iTHh3QL5XPnRcy+85jegLtOc+i6n
 qZS77DAkVxvylc5S0W9/qYg3XhkJYTJANvVmujKn35DCq/cvYbWP4vC23dCa5rmUVoWU9CswLUC
 gxWrPvdVF/H+NAgt2qA==
X-Proofpoint-GUID: NZShF-beYGRELuiV_ImS9SpaIhYnH2VZ
X-Authority-Analysis: v=2.4 cv=daCNHHXe c=1 sm=1 tr=0 ts=69970ee2 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=KVNckf8Hb-gWPUCTgC0A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190121
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93388-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[pankaj.patil@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CB1AE15F016
X-Rspamd-Action: no action

Document Glymur SoC bindings and Compute Reference Device
(CRD) board id

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d48c625d3fc4..34a19e664556 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -61,6 +61,11 @@ properties:
               - qcom,apq8084-sbc
           - const: qcom,apq8084
 
+      - items:
+          - enum:
+              - qcom,glymur-crd
+          - const: qcom,glymur
+
       - items:
           - enum:
               - fairphone,fp6

-- 
2.34.1


