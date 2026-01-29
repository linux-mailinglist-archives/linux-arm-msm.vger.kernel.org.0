Return-Path: <linux-arm-msm+bounces-91122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SD5cO+QIe2k6AwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 08:14:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93579AC80A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 08:14:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EF75C300615A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 07:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DEA737A48B;
	Thu, 29 Jan 2026 07:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TDIJHRnx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fr8IGQaD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFA02EDD57
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 07:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769670882; cv=none; b=MrVUg3aZXmU/SZrNwTx3foMWCUVMkf9DQPJDOru9InhGo8QBf4VPyIzaWaAS9CcIIWq7S4frLt7Iu/VE7eSgDywccOqHNC8ez/+qg5GbXOgkfEOU/E28vVb9vwjZ+T8rZeYUxQ4X3ZjZ+gBKVQyAod5P0GXlwKebKYNhLbdWZCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769670882; c=relaxed/simple;
	bh=TzEbhNiO3m1kv0iBmTKjZdsYicpOtSOAFcV9ephYJow=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TTybI4IqAWQLyouhbuidk+0yrf+OLv7x9KL3O72u2jShGI0nx/xnsAQxUgs8I/ZmyKC9hIbqNK/RVoFoZQrptFNY1VdkcYo4J/nSdKvJHMmb8g8OVbPIpwzAnfoJ0lmB3uaaVN5WMIbwt1/WYTAk0iE/pzd7mdWZmK9FJG7un3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TDIJHRnx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fr8IGQaD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T2ol5m2373364
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 07:14:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=BHw4E5ImxsbwzBkLkDbQKI3/8jLqyDosTcBL/JZJaIs=; b=TD
	IJHRnxd3gmlJxCriuzXw2n0EOpGaQ+UJksHyOkRHVzOEeKdKx9J/Vz9WaiuI4NWR
	A3zL4vV7ehv+8mmcXCU/ylGNqv/jItzhhnDw1WL4JyYYdEjCyaI8u28l5/wgZXgc
	7C0WGknd5RBYD1/U9Wv4uHqyP9X8UfjFymXtjxpf0+exaw3cKljOQWRYZQfivn+G
	4kc6/SSbwX2KYJ/Gal1LT4xelg/Z4evOSKk088pEAryDEveuUGvh3krqPznBLmgl
	MJVpRKKXefgfSfCidQuQvPDGugG7EdofUcayFbHaY0leiNX9xIgRQ5uSNYpa5Puk
	ATFqJ7cixFOrx2XpH5hA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bypk22ac0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 07:14:40 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b75222e9easo2549620eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 23:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769670880; x=1770275680; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BHw4E5ImxsbwzBkLkDbQKI3/8jLqyDosTcBL/JZJaIs=;
        b=fr8IGQaDLD4mFJ3HQ3rGQzlWx5NB13xj9GMkxriMF/5w1vsCftDCn8N51bx7wwwmjG
         JQJmMKwW6Q5oUlQYdKB1oP7NUciOt6OhstAsK2t7u+sRJXsY1DUVY8rrvC2wYBjAoBA+
         XtyNR0NP3GENjxJfZpsBal+tR0QlxQ7lewtk3QBM9lcObWwVF8Zl4z+3jjDCsD3jhEOx
         vMmsagr2ySLiHAMbNYlPTwWb9bZjlOBXnLyadm2WVHMWtiAxUc8aXbTmb9+e+XXYW55d
         tTQr6chg/1gheR++bdMkQVZNhmtQrkEyjfLZGS+8a1RGqKAS5ef0Dl196kxJO3+jmyA/
         nDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769670880; x=1770275680;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BHw4E5ImxsbwzBkLkDbQKI3/8jLqyDosTcBL/JZJaIs=;
        b=Cti9BRoleSCVi/zP3KYdmEEJ+5CfqnvJ0Ak+u7P0CSRGTUcJ4T5eb5CgMSPgUHSeSe
         /wlQi0S1l6vKkPyUEOHBNAtDo/kX10eVKQQlim5CvjJkltzfCM9rYNt91zbSZ1Xygl+/
         cWZeMKBxB6QPt9dVhkQ7bDcIxp7s1hYyJPVue/6PGNx05eAmuZwrBO0sOrxGcDJQynzf
         TyOgQQD6S2PnBNngwLCM/mbtosFW3/kp6wZ5YajmQCQZIs1FigCCIYWrDTLDL+L4dec/
         NrhlXEJpN/bMFqC4ph9W7Kz7p1ViCA1BZQvJw1DbCgS2yQpxHueAOCAOv4lS33cVbWXZ
         09HQ==
X-Gm-Message-State: AOJu0YzN/A5AmXmwtccl1CsLdr2duz4HvLLovNyuQC9h2q/248bDB+6E
	bVO98c+bex9pmUDpAakKljK9e7oe3K4w32tQdwL+X0CYiaYA7C36Pu3mo5wnIo08y04BJi8sKcU
	OkfKcyXxRu+GVlozvQwtkDM5wxfJes6p69oSagxylShvhcNYuugAuE/TclriIFURI05W8
X-Gm-Gg: AZuq6aL7ohTIQJE0SDDY6fe4FveWj+j9aTIL9bSYnFWQYJlEERVqyVMQv3pUVWffCm5
	JrpkG3IgnPntuD9Degrmn0GqGs/5pHQJ0o+p7g1dMSCRVC5ZCo8TEqpl+mKPr3qlAFcpwmG/jl3
	wCOuQM1NZrHQ86DWQlyFDaEtaBIWv0fLzi9IxW4TZAu5db53NfQYUWgr2IjZ4Pv5b0nzYqjexTf
	SbEEnIwHnwnymwQTMWbJT63G34NChLj0GhG15PP5LcIE2jL0g+bhcRtlZ4NGGVF0lyIRlm3dJ+N
	gTwBu+tuiMqRej5fCBCiEQbsomKBIZi+8gHhkhoNEqNxGtLwyOVuDY1geiUP4KueHxsQ6bUZUoz
	CrIhUUhvxadTOvK7aINaIJTc5bODoqGkSexz/dC6wjuStRApB20kPv6VZKeE=
X-Received: by 2002:a05:693c:804f:b0:2b7:befe:3748 with SMTP id 5a478bee46e88-2b7befe3deemr46582eec.25.1769670879480;
        Wed, 28 Jan 2026 23:14:39 -0800 (PST)
X-Received: by 2002:a05:693c:804f:b0:2b7:befe:3748 with SMTP id 5a478bee46e88-2b7befe3deemr46570eec.25.1769670878947;
        Wed, 28 Jan 2026 23:14:38 -0800 (PST)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16d01c4sm5879760eec.2.2026.01.28.23.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 23:14:38 -0800 (PST)
Date: Wed, 28 Jan 2026 23:14:37 -0800
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ananthu.cv@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
Subject: [PATCH v3] dt-bindings: sram: document glymur as compatible
Message-ID: <20260129071435.2624252-1-ananthu.cv@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.43.0
X-Authority-Analysis: v=2.4 cv=PfvyRyhd c=1 sm=1 tr=0 ts=697b08e0 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ff_ejXsIRRER31PdSKQA:9
 a=CjuIK1q_8ugA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: oduaaasEXpI3Ji8rQTE17ZEbRFRKspEs
X-Proofpoint-ORIG-GUID: oduaaasEXpI3Ji8rQTE17ZEbRFRKspEs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA0MiBTYWx0ZWRfX+Dfd0XkLVsU0
 4bsBElFZX5OHrhcqONZwlemD7lDFVmCoCGobLhzPW2I87gP8YT0DNp8CCChRIfijfNCGf7putbY
 a9pf4T784jKkxmDOwkVfMNz0j0Ry5ZIjZOPXFy2HB4qvXRjqNq47br0rQ84OF0e90IPFvJGiz/f
 S6KXpMqxVm2yNYmthpg3+H/sYVTHutMEIv1CxO/vkRIAbkZhLRbssTstec5TGRMfmPieg9MQe1i
 +5dXaROSJ5ZNOLymUG2n5ky+nfWSRiV5kwIMKcR1ga+Ppkc+9ABUuiqmWfOlrDjZ4nUSJxuM1+l
 VzJxY/E1kHhGCfGzdMGd3VkP0A1BkHkUkbFKMn/9/W0dKI8gEQ7KHRSuA2X9J/55nQSYUs7Ayvv
 u2L3PAQ2zY9DzIZ1n9DH/Yvd3WNQr2c8Nc/kK154KkjejGKe9ty4zETdETG7+2G88o5i5JF3iM8
 DLcOsMq4Rktna+N48Kw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_01,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290042
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-91122-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 93579AC80A
X-Rspamd-Action: no action

Add compatible for Qualcomm's glymur IMEM, a block of sram which
can fall back to mmio-sram.

Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
Changes:
v2->v3 moved to sram.yaml for mmio-sram fallback
v1->v2 alphabetically sorted the placement of glymur in the list
---
 Documentation/devicetree/bindings/sram/sram.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index c451140962c8..bd62711dc630 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -34,6 +34,7 @@ properties:
         - nvidia,tegra186-sysram
         - nvidia,tegra194-sysram
         - nvidia,tegra234-sysram
+        - qcom,glymur-imem
         - qcom,kaanapali-imem
         - qcom,rpm-msg-ram
         - rockchip,rk3288-pmu-sram
-- 
2.43.0


