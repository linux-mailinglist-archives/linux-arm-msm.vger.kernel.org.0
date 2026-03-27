Return-Path: <linux-arm-msm+bounces-100297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPqiBT59xmnwKgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 13:51:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9549834491F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 13:51:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 874D930916AC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 12:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DB0D3AE6F8;
	Fri, 27 Mar 2026 12:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hW3CIgD/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HXhxA3cg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C56322B7B
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774615621; cv=none; b=ZWp+Mjpj6BKfW5FKO6YzeETMP/3lhiE1V7vgOPAJS44hHYCkD0E5O7ijhWEV1gzOKRyxYXOxK0xEwue+vwgtXHuhwisleW5n/wZhKnNLV+IDADEd6OMrmI4t1MMzt8b1uhdCGZFkLP/lWb5AFjApBx2po4CbH6WYTQS+QBggpUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774615621; c=relaxed/simple;
	bh=zYUNGKdFvKSqUGrjtnsoHASKMJ3vhfHxxn/46lWcKqg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=grFY1j094iRT8Qvpzo7WUpf6KNIA/pyDabt4seL2PiNSGWdQEZ6Cj9NXqzPpTu8XaLEnz2gacoELA9vBNdxyaeoXGBXkM//YXGhBh70CDyjIKzIH0ATtiiwgPvYMN336Ddr6XHbiDJzsSEjOjcjrZlKGrI2NW+Dclmcf2zUsTqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hW3CIgD/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HXhxA3cg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6w3o51860216
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:46:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=891+Otgnl2ibIheT+4VX1s
	uXS6wQSuCM5ExyL+E9/0k=; b=hW3CIgD/Bg66W2jSsyWTEvNLrxkUer2EtJEr0J
	91L1w8H7O4OP+bSZhYcxQEBk+kr8cGsv2+iF8Tm/8QJM5Is/nh580D31oMitDSGk
	QlT1a/qn3I7jshyB20LSrQoiraqkL/dAqo/duMivNhIPJMvTUJYoHHFjxk2S06gH
	q6KtV0c9b5e/F6N8tHk/fb+kZh16Lahnj6YK3E/awBOAm/DgmjQhUfirFu2Yzz5G
	CwsgLaWSqZn4IducDf/5dHvjJ7bJLcpDFtwkoGJ5+p0hrFkEUkzhrViFca4IwWeq
	csjCY9PFRpxvjGh8hjeUM/rfozZ3EwmdhoQ5jqHoWwkqCmKA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bxv320g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:46:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093a985e21so1716571cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 05:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774615618; x=1775220418; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=891+Otgnl2ibIheT+4VX1suXS6wQSuCM5ExyL+E9/0k=;
        b=HXhxA3cgTDCpLRmRd87fBEJjE4aDIjjbJbk6Tl8fUqIo4A0RrkeOB9psyEvW/FzIcE
         ZZ+/Rurs4fpJ4yWgGB2hqkyyCyXNFw9N6hLN6cIf+k05Wcalxm21FpqGW7pxukxq6QIQ
         5bqjLse4LgErlg5nmrM8AlpHrxgYnpLGHDkbQU41MMfnP68UIF4CtrekS40KrhSY2V9t
         MPgA5psGt3sWkFYbwTwtVcQLrOs5UoA39NX+Bb0X536U/nrMcTbV3vCbOvjfiKibDHIQ
         lgSnd9mmDoc/O97OZPsnt65D0lEb1qO34kbIGdXn10PYZi6qHq1qSlOjwid1dewEUXPL
         Qatg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774615618; x=1775220418;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=891+Otgnl2ibIheT+4VX1suXS6wQSuCM5ExyL+E9/0k=;
        b=qg5af7wLDA9YAPJox7U2jwS8qAwlTVxmuPCtWxXSx3z7e/TJpia7mwEG98f+mpgk1e
         xbN+0jhSAAD/jqPLPVbF6zqwmA2PDjT+OfDsxMrv/c7E/6mfzzRpkYHoa59TwXScE0en
         /RUsk9TmeDygTWya1ZmjqOllOU1cjBa3wiUbou7cRc3/BAxmRy5dcnTQizUXw0UHiJvh
         v3uo/5RsbVYRMLIOeQnViPS7H6aYLalrWe0B2oCDxcZl5lvCaC6dGoRTpTy5Cs6mlUOv
         zid1AQT8P5h0fDEd/T3urFX1nMckhhWRrrJN1jH4i5KeMfTP7eVRnYm1ZrsG23aGiKWf
         zEHw==
X-Gm-Message-State: AOJu0Yx4q6QfR9WG1qI1zsbuLLi/hTbV2AZBf4rskwOPhUUjJbSSRHRF
	IC43kgGAdvMT7qliyIEzehacruyUSElzzig0mwD9z7JmgqVVFpPUDbHGQGozxA/9yVrr5QVB0fW
	R/lisIe6QBbAqc3tQzOHTBopHPLBZlapMFVyW0XCQXZTnLh3EGFX1Dh6VW4JNGJSJds1L
X-Gm-Gg: ATEYQzzcQcwBI0MNI0Wsr63AiEK2SO2LTNNqqNhiNogeQex/THoFO0BrrTVStql4zIq
	vgv67/olRawoGWfxnesQCQA6c01vUHkb8CTPRKW9vJQcNcuBGDgr//HFSJNVaMmb4ouxDDdyq5d
	p4lkYY3ELTAc4ND3qI7VwpuMXkQASBZC0YYm97SWPIoTwjpjUhrU8ICzQ8gvkEK9StdQXhqpuj1
	EGL+25ZqSmoyvhGiD4H8xBhmmmhuvwczWvVfQkKuTafDFewwBaYbjPiwhsgjPUp2VLOCiKoFrq5
	SQv03TOI5I7EdRHaqSxlnRyavf8lZtL3p0smyvaf7OcNONix25FnmU49VyAajKegpmKgihkf6Ao
	8OlntVxj/Bn7LRNM0j/DGV+hWEAM=
X-Received: by 2002:a05:622a:287:b0:4f1:b742:35c2 with SMTP id d75a77b69052e-50ba38507c3mr30108831cf.22.1774615618020;
        Fri, 27 Mar 2026 05:46:58 -0700 (PDT)
X-Received: by 2002:a05:622a:287:b0:4f1:b742:35c2 with SMTP id d75a77b69052e-50ba38507c3mr30108461cf.22.1774615617452;
        Fri, 27 Mar 2026 05:46:57 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48727c0cdf6sm45225825e9.2.2026.03.27.05.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 05:46:56 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 14:46:53 +0200
Subject: [PATCH] dt-bindings: soc: qcom,aoss-qmp: Document the Eliza
 Always-On Subsystem side channel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-eliza-bindings-aoss-v1-1-70df76adc69b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADx8xmkC/yXMSw6CQBBF0a2QGlsJNB+NWzEOquEBZUxjutAYC
 Hu3heEZ3LuSISqMrtlKER81nUJCccqoHSUMYO2SyeWuyUt3Zjx1EfYaOg2DsUxmfCmlFl/1QFF
 TKl8RvX736+1+2N7+gXb+r2jbfpJEu1R3AAAA
X-Change-ID: 20260327-eliza-bindings-aoss-83a5ab4fee15
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1038;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=zYUNGKdFvKSqUGrjtnsoHASKMJ3vhfHxxn/46lWcKqg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpxnw+xUh5fxocBcdrOhEtOGvxl96RfusD/GNq3
 5vSk7VAPe2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacZ8PgAKCRAbX0TJAJUV
 Voa7EACYnivfvQuXHGEtK3E6cG3npPPKCGAFB2N8dzlKNTsu8rtWNyVdP47TEQfi/hEWExV1R+K
 Ie1gTSJp2x9Ts5eK1r2ZrO8NPpRqagzs4pc4W6QPmLIVc3BB/GOSnE5ytWoNZxFNexZRIiIrrvV
 wNGtsycILUhXsH1qC1tJbJcsoj8BdZR8Xm161sNejyLLIf6B8skGtdHo55fmswjM4zcsCBuhNUE
 AzsgQX8cnoyJHE6FJuXAq6202VnEhDlC7F7xUIq+RzCMhbLQ23k4ZnrLZsHistYZ7R+s8JmZ8/R
 cnog3vZqa0EFw6oM4PUyRC1ekQ9C8Fb7IpkqPues0vVnVoIiKNT6mX4ieFrmCGct/wewFqBI3Dl
 RA8lS+AbHhrfRYuJlgkujRWSHq8ux/Q/myDeQBID8woaIA0LiAKu7bq99JdcqCSgbLKoryEB7Zl
 CPBAEUEzh/VEr8rrupXvruzXqv8T/8HNilnWCqS+zyGb7wdHEkb8ZhtPsphUre0lU7bV1GhegWf
 fATT3JU7UpqS46h1hS9d5kealPAzYcg3g3zahdoCsv7AJvDHoAIzJtXNNPr/kKiu6jVA3QPR/3t
 EV+1hbYlgOJPNnPHS0iN7GQHbpSXG1/ox7Ks+FnZHSoLGFQ7jUcKZRs6/Q1K19mlG11ArnjaJVF
 YBJXYXsdqYOQvzg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=A99h/qWG c=1 sm=1 tr=0 ts=69c67c43 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=O67gKX8sZhZfn82j4YoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 4bgNopfWQkdZkDnIoEH4khn6MAhlKMF_
X-Proofpoint-GUID: 4bgNopfWQkdZkDnIoEH4khn6MAhlKMF_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA4NyBTYWx0ZWRfX6Vpvkfk0/8fe
 59F2oD4pvVj9Uv9VP+pqYER+8fKv6uF7tEuR8FJ1/qf+nAilF1itWUl8sZxh0kZVD2OB6lUPvhB
 L7bolKWCG+3y57PJxeDD0XfMHfjQCIaUOAvddwwq1mGho0awUMl68jZp7YtRrzH3qWp2w/KAgmR
 S72DaWTpRr2mB1y54bIE483mkKF/D0UaLQ2EqPBDtA/D9h9ca11Oa3oZrojdLZxSXrUKpOUZST1
 AAGt48SNr8ggmilDCuGVNZVwDp4c10evy9vwofl4F/jFkgS9K7pvMxfmp042Df1xumf8uhE2d5w
 KZWjBDRswTMAJnU4jd416q1UAI4mPwAaU+W8yvzreJXrEmJjl/2almWhGNL0PX4maP5MrmCqJl8
 FiVFvJF8XI3l+xbUxGwiPYFuTKLREjGvDCvz3SSVg3e7YnQo7JwYGgcsqzR3fmqVxw0ooDyCmJP
 K4bqs+66HS7htYOH/GA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270087
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
	TAGGED_FROM(0.00)[bounces-100297-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9549834491F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the Always-On Subsystem (AOSS) side channel found on the Qualcomm
Eliza SoC. It is used for communication with other clients, like
remoteprocs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index c5c1bac2db01..8496d623c621 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -25,6 +25,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,eliza-aoss-qmp
           - qcom,glymur-aoss-qmp
           - qcom,kaanapali-aoss-qmp
           - qcom,milos-aoss-qmp

---
base-commit: e77a5a5cfe43b4c25bd44a3818e487033287517f
change-id: 20260327-eliza-bindings-aoss-83a5ab4fee15

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


