Return-Path: <linux-arm-msm+bounces-106071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mO63Gz/0+mkTUwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 09:56:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 305314D77E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 09:56:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 80337302A1A5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 07:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2041B3E025E;
	Wed,  6 May 2026 07:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QJzVOnlT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O/s536bx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED56306B31
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 07:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778054200; cv=none; b=colsHthzL9KVAxqjysSgge9Apo+4cN4LRQ0dZVdi5+JPy84lVP1Sx8IyFMDUV+mywnig5ds9J2P1h3YZRau8NTgdrgyQAjH9OCyz67pkowQqv52Eae+0VEgGWfaQG+PmxXLSWKPZVoJXbLR5u4eEZZdQ5JT8Z4Tml0pufM9dpY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778054200; c=relaxed/simple;
	bh=pz4s/1/oJMi9iKJkDVcTfZKyKF6zjrnyeoMtyBSkst0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KI99ARv26ys60+YJVX9IVwJNAa9DLsk7lx1w65v1iHxJSPPj2pHKoCC/w6VGIKunPgaAg7yfCFoivg6o/7n4HQzXPCY7jAWdsxTIzFXiunsjoWmJETcXVBqSvZDvxvwDqiDY7dtXxL1n5AsskqXsjjJv3HMcRPqSzLIROtUNYIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QJzVOnlT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O/s536bx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6467Cch31527783
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 07:56:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VNDSHHfgjfrPvXuQV8MhERJkwZXDzFJPFjc
	aPzMVfUE=; b=QJzVOnlTpiHkh/j93PlOF4LVWhmIBNTMd34GiveaXDCVyoxXn20
	/gODzRb4xFnlVeYmj0Z7Duvj5PdwN3VyEIbKB0JNVNb93bJmyDsRBbli6kMdaLol
	ZNDsxtT6FZKff2x5DhupBPzZPje8sn4+RKFFiShTSVkTsig8KINz2Jf5PTHY0gqd
	VfgqCY9cUCYoEuxunaDvRqetMYbDcQy6u7ywEx5bkqqMp2jbmMwpdVbx4my1V9xN
	NbRK9Y0BRmi35j0R7a6E24H48xKW/LFSKuXjX4P4lytv87KFxn2T8ZCKvli2UeYE
	rZMFF4+TKZGx1LTAU6soPGOPkHWOTRTArSw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e012885rr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 07:56:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba838d3fa4so2989365ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 00:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778054196; x=1778658996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VNDSHHfgjfrPvXuQV8MhERJkwZXDzFJPFjcaPzMVfUE=;
        b=O/s536bxla8EAULAGzxD5y2ah5bHZK4PAhcEmQRCoupnX6B8h50E+tobxiV2srVulJ
         kHTGWoRSjm5yNcx4/Vabv5KF/h4A9EyPzp6qNzm5VSmfblM0xpW1BtiF2at+D8kZyR40
         rHdylGgcrF4Ad0JVQSs5LfvfcAmttvsaDxuhAL7OTEjJMixXHJDFnZERYgD4nUDu8Tub
         32a8f7xzQJsFUXuNs3pm7AeBZxcTizvdU8wW4iaAS2It8tQGmjJ0B7usy+nDq/s7Tm5C
         UKllKZfDu0vmnVMHSfajrUvUGqc/q9DKoMn8iXvdypM9vg8l33EBZTEerjIUmIKggHE4
         go2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778054196; x=1778658996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VNDSHHfgjfrPvXuQV8MhERJkwZXDzFJPFjcaPzMVfUE=;
        b=JH91dprDmzlv9cQZzF/bKAIotclQESI1obnm5AJMqpKsft8VeUeECVA7DL0ZosSlJ5
         r3CyDxHEUpc/zVZGsWv3HWK7UQ3xV0KVWuZuIAZ7c8z+57fNLTKOktx2ph0K5jeCN4p9
         YCnukTIRfPP02na94/6808W+WVQKpKHbv9iQ8m0fC/Mei+j771a20AaTJzOhSocm6jB3
         ZaxatMqML5b9G7xUwtlwS7L7/aW6Bgu4Yjpd2k78v69XPEeRSkKEpMTe6x2GpMS4B+4R
         sF0cLNHcsUNZgEWmrsHXYyCd7/k8Ea2E9zn+EwZ8H3aYIiUUVjzb4ymS+xuOIdXiBh6i
         Tawg==
X-Forwarded-Encrypted: i=1; AFNElJ+gQ1dUZUndjn3Zu5o/Sa6pBLki1UfqcEUQLL4HNcZ6uUt/on7nieY9VO7t4imPCgprbjz8rAeAHy1MhEE5@vger.kernel.org
X-Gm-Message-State: AOJu0YxrYSEC6WD38qP5ckhUlf+ibm9H/Jyn2cSLEg/Xno5Uei8ag0uL
	wDjeQ2biPInrjV5BTSsglbp4K1ztcMOoONIF+ZgxbiMIJaVivNuW/iSLu54qmhcrdmfMWGK8w7V
	ftiiO48ra7rOR0PSqdFhPnrMAxrLkIQba2vc0TOwxSh4LKcmIHpPnFBLsZypw4zpK0Iih
X-Gm-Gg: AeBDies08npc8QHck2n+2yXvcuUk5wkLtBT9otx3jXg0Z2H48RM5+Y46eDVef07O051
	lDLfgCCuJ+F7XbLrQT1KbIT4OoeRKm3GF9q+mC8pG/WchG3WOsXfuJPtu7jSWZmG1uF/ayfqsw9
	rYP+agPJZtaZDR8nyBVIXmVVeuNLLgxiyYoPIU4+hP37oaMHGoIuC1sOPVzXqNijWNkcLdtQ1Qe
	rRw1EBWmSPGy8obgJJbX5igq7NG/Yr9onQ/pDuUI2JoOItApbZxTKyiKgJZ6o2G2K4nbrR7XhCf
	pkLOhbw3Kl3bwdz36KnsLSPDVGGUGsfGJ7/uD+xWW9J08BTL2MzC4pSsWlYJxsYTz7zWX6Qlrtg
	JNLOMuJ33muiQ6swaA/pqjn7wblVpU/V4v4NAbZnxd2mwGBA=
X-Received: by 2002:a17:902:ebc9:b0:2b0:445a:8c7b with SMTP id d9443c01a7336-2ba7928e644mr23775595ad.15.1778054196355;
        Wed, 06 May 2026 00:56:36 -0700 (PDT)
X-Received: by 2002:a17:902:ebc9:b0:2b0:445a:8c7b with SMTP id d9443c01a7336-2ba7928e644mr23775225ad.15.1778054195788;
        Wed, 06 May 2026 00:56:35 -0700 (PDT)
Received: from work ([120.60.67.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ba7ca216a9sm15914205ad.70.2026.05.06.00.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 00:56:34 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: robh@kernel.org, saravanak@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Subject: [PATCH v2] of: property: Create devlink between PCI Host bridge and Root Port supplies
Date: Wed,  6 May 2026 13:26:25 +0530
Message-ID: <20260506075625.8490-1-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: OlK3lSvp157aoU3aebz6gIQK01pnpAEY
X-Proofpoint-ORIG-GUID: OlK3lSvp157aoU3aebz6gIQK01pnpAEY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA3MiBTYWx0ZWRfX8K4PME/3wgnX
 M48qA7wxuQp9BDPwHGNclokCikcFCmClSaT30ruOUFDPGTE8wzKXpf5vu3Z0eb6HhKVerOOqgTe
 Ju+o5ir5jyRysOwIvoVAO3WQE2/meLrUo4ZTiSZKCfz0sFyE5v1uCvKaUUEIUrzQAp95fGaIuC+
 BSFe1lBoWUxNWqurYp2tlmMQm9VSfpKLCWrV+9MGuBM/3i+MfdJ2/BlmH51uc5eUM0SK5AS3Z2s
 CUVfpfqSlp9nBzShCCTTqqX3fXcrV1cnlSCDZVmOJy1HL/4ArAA1YpwmU2VVOwcydzTJApDiMP1
 5Oi36eS7xZsLNa4ZBvF+/vMrZawFDtDBmDeJDZj2A2b6Fcy7/OfzWuTpSNGGYzUxp3fZqxFg8P5
 a8FzT/Nl9jbjX/p0Y104yYFeey5kkThPiaAtDe4mzGY0DC7yUy7GqXUrc9JzZH0mDUZWXaLvx4e
 1vkIQQIlkSClzujqpNA==
X-Authority-Analysis: v=2.4 cv=A8xc+aWG c=1 sm=1 tr=0 ts=69faf435 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=SQtj7D3ryojUavkWoQJ0Rg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=n9glyVbX8GFbeWSgBHEA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060072
X-Rspamd-Queue-Id: 305314D77E9
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
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106071-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]

Recently, devicetree started to represent the PCI Host bridge supplies like
PHY in the Root Port nodes as seen in commit 38fcbfbd4207
("dt-bindings: PCI: qcom: Move PHY & reset GPIO to Root Port node"). But
the Host bridge drivers still control the Root Port supplies as a part of
their controller initialization/deinitialization sequence.

So the Host bridge drivers end up parsing the Root Port supplies in their
probe() and control them. A downside to this approach is that the devlink
dependency between the suppliers and Host bridge is completely broken. Due
to this, the driver core probes the Host bridge drivers even if the
supplies are not ready, causing probe deferrals and setup teardowns in
Host bridge probe().

These probe deferrals sometime happen over 1000 times (as reported in Qcom
Glymur platform) leading to a waste of CPU resources and increase in boot
time. So to fix these unnecessary deferrals, create devlink between the
Host bridge and Root Port supplies in of_fwnode_add_links(). This will
allow the driver core to probe the Host bridge drivers only when all Root
Port supplies are available.

Reported-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---

Changes in v2:

* Reworded the commit message slightly
* Dropped the "linux,pci-domain" property and used PCI node parent check to
  identify the Host bridge node as suggested by Rob.

 drivers/of/property.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 136946f8b746..6aa1d3fc2165 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1561,6 +1561,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
 /**
  * of_link_property - Create device links to suppliers listed in a property
  * @con_np: The consumer device tree node which contains the property
+ * @parent_np: Optional parent device tree node requiring child's supplies
  * @prop_name: Name of property to be parsed
  *
  * This function checks if the property @prop_name that is present in the
@@ -1577,7 +1578,8 @@ static const struct supplier_bindings of_supplier_bindings[] = {
  * device tree nodes even when attempts to create a link to one or more
  * suppliers fail.
  */
-static int of_link_property(struct device_node *con_np, const char *prop_name)
+static int of_link_property(struct device_node *con_np, struct device_node *parent_np,
+			    const char *prop_name)
 {
 	struct device_node *phandle;
 	const struct supplier_bindings *s = of_supplier_bindings;
@@ -1598,6 +1600,10 @@ static int of_link_property(struct device_node *con_np, const char *prop_name)
 			matched = true;
 			i++;
 			of_link_to_phandle(con_dev_np, phandle, s->fwlink_flags);
+
+			/* Link the child's supplies to parent if needed */
+			if (parent_np)
+				of_link_to_phandle(parent_np, phandle, s->fwlink_flags);
 			of_node_put(phandle);
 		}
 		s++;
@@ -1656,7 +1662,26 @@ static int of_fwnode_add_links(struct fwnode_handle *fwnode)
 		return -EINVAL;
 
 	for_each_property_of_node(con_np, p)
-		of_link_property(con_np, p->name);
+		of_link_property(con_np, NULL, p->name);
+
+	/*
+	 * Since the host bridge drivers parse and control the Root Port
+	 * supplies, create a devlink between host bridge and Root Port
+	 * supplies. This will prevent the host bridge drivers from being
+	 * probed before the supplies become available.
+	 *
+	 * For checking the host bridge node, first ensure that it is a PCI node
+	 * and its parent is not a PCI node. Only host bridge nodes will have
+	 * this structure.
+	 */
+	if (of_node_is_type(con_np, "pci") && !of_node_is_type(con_np->parent, "pci")) {
+		for_each_available_child_of_node_scoped(con_np, child) {
+			if (of_node_is_type(child, "pci")) {
+				for_each_property_of_node(child, p)
+					of_link_property(child, con_np, p->name);
+			}
+		}
+	}
 
 	return 0;
 }
-- 
2.51.0


