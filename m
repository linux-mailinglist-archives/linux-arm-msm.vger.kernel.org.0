Return-Path: <linux-arm-msm+bounces-96630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DChGEoesGlagAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:36:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8DB250772
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:36:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 581BF35185F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 12:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50D7F3BE623;
	Tue, 10 Mar 2026 12:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WZBaOefR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE82391E60;
	Tue, 10 Mar 2026 12:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773145252; cv=none; b=Jo+SleydBoTw5YWpcbLbIBwFICypkTXBDnFlIAmRKcoHVc7c/bBYD1PzNdFBNFuGNE24AdccpRfSwR4DmPuSUR/6YlbGwv3Gcj9Yaky1tQE9sg2EP9PHplCFxjZsu+lNO60eCG72HfVc4Doxt2+1NiPnlSUkKwBoKTAajw/S3us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773145252; c=relaxed/simple;
	bh=Lk6puEmsAx7/PJwNRRqKTDXOXwSlI12+e9eGZmU2mZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t3RMZ3dRDsf4sS1iGTc41C8ahgryzdHKJ2M+xyGQnGVDZsSfsguiUdgdsyilb7/yh3G5/2dHUXLKLkhfLMlrz/rkmeVkaljqy2RlPUAhvl64rVaTZS9HnZPfce88IztP16hp7MtN6l42WOSaKJG7zmYpES162AL5uQvR6cUrS3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WZBaOefR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A9GLiH3587427;
	Tue, 10 Mar 2026 12:20:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=z3i2WdpTSAYFIcgQFN3QtJlt
	3rK5FH7UUKIraiyNCLk=; b=WZBaOefRDzRRvJviDjUAAHEvaqcAgaju3Er1KJKD
	SKd4fA8XH/D3YBV9qJVPukfWsOVqolWlT61HH502aJOhd6kr6MALpDJMZSzdvGH6
	HtO+zpH7hw5X3Dpn1449Ta4MiHAr+ANGf3wtxjfUWrsJC9G1rBnhuLhp0rJ4yQDW
	LidR85M8lHVWWgLrO2CBHV44YGSrwSA/PJEP9HjpHh3RQo3ft2GPMgsvI/y7JQA5
	Qa/BRUzMfR6lZrKOB1sE/xJZxUy6Ea9TmQCYgKhHQ/OA8aXn8Z3mCG/jKimfrnDF
	ycJUd0ls/2GTbBpFt8okVP3wyVIjuQ/2mbZ+77AVf9qWsQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct1ekuth8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Mar 2026 12:20:47 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 62ACKh6h007445;
	Tue, 10 Mar 2026 12:20:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4crd3m9s5u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Mar 2026 12:20:43 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 62ACKhkl007283;
	Tue, 10 Mar 2026 12:20:43 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kotarake-hyd.qualcomm.com [10.213.97.140])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 62ACKgrE007195
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Mar 2026 12:20:43 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2389607)
	id 251BDB02; Tue, 10 Mar 2026 17:50:42 +0530 (+0530)
Date: Tue, 10 Mar 2026 17:50:42 +0530
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: power: reset: qcom-pon: Add new
 compatible PMM8654AU
Message-ID: <20260310122042.n7qwyylbwgodtr4q@hu-kotarake-hyd.qualcomm.com>
References: <20260227-b4-add_pwrkey_and_resin-v3-0-61c5bb2cdda9@oss.qualcomm.com>
 <20260227-b4-add_pwrkey_and_resin-v3-1-61c5bb2cdda9@oss.qualcomm.com>
 <20260228-polite-swine-of-potency-56e61a@quoll>
 <6a304d0d-61b1-422f-bb65-8f8055095c39@oss.qualcomm.com>
 <7118ad44-5a56-4523-baff-9afa8030aff0@kernel.org>
 <ef5a0e22-2f12-4584-9abb-0d3202a58b41@oss.qualcomm.com>
 <a9bbff27-28b4-4ec4-91e7-481eac0c5479@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a9bbff27-28b4-4ec4-91e7-481eac0c5479@kernel.org>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ur5ge7JAZLZHxCoMRXZzyqvbkp4g-ujn
X-Proofpoint-ORIG-GUID: ur5ge7JAZLZHxCoMRXZzyqvbkp4g-ujn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEwNyBTYWx0ZWRfX+lnvjyu4rEfX
 L/K3NbeiTtyccO4MugwnEnJ+U0qEHca+8CsjtNo+IHDupA6HeRckJt/rrIWAZRQ9thyuYkq/zSp
 284qykev4XSCiXNi57picCyAtlhnpsiJnHCtr50A6Yr1b2dWz9Q81tBifiwxZgBqJGMk7qkZfcC
 rc4tD5j4sNNbJJMBHCmCwdOylqP4SA2PvgeXvyA5xND7MVs4lNdTRHfbRFIkSiL92Exk9xZGpn3
 92o2iyI6+KcvdGio3gNyvKMLvZF7QzwmsmCfYLpIz4Az+QRek3t//dyOnf825f51GKPzd6IaAHv
 VDPvYH4Sonl8R1qFumpkcicOxvH27/N009ke7HE+xQqADyCE2ilobgdh9cSamDBUQTb+H3xrSsH
 RTaz0tu+h/TY3Z/FsVtAxsuBk44N5boPgh5pYB80fr5Kddl2wkjUp/ipi/Cqfz0u1Iaix393R2p
 7Okok69PHXpsfMOTcwg==
X-Authority-Analysis: v=2.4 cv=eIEeTXp1 c=1 sm=1 tr=0 ts=69b00ca0 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=HR6y0i53xRgZs_vXoO8A:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100107
X-Rspamd-Queue-Id: 0A8DB250772
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96630-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,hu-kotarake-hyd.qualcomm.com:mid,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 11:11:38AM +0100, Krzysztof Kozlowski wrote:
> On 04/03/2026 11:08, Konrad Dybcio wrote:
> > On 3/2/26 11:28 AM, Krzysztof Kozlowski wrote:
> >> On 02/03/2026 11:20, Konrad Dybcio wrote:
> >>> On 2/28/26 11:17 AM, Krzysztof Kozlowski wrote:
> >>>> On Fri, Feb 27, 2026 at 06:02:28PM +0530, Rakesh Kota wrote:
> >>>>> PMM8654AU is a different PMIC from PMM8650AU, even though both share
> >>>>> the same PMIC subtype. Add PON compatible string for PMM8654AU PMIC
> >>>>> variant.
> >>>>>
> >>>>> The PMM8654AU PON block is compatible with the PMK8350 PON
> >>>>> implementation, but PMM8654AU also implements additional PON registers
> >>>>
> >>>> So does that mean that PMM8654AU has 2 address spaces and PMK8350 has
> >>>> only one? At least it looks, so I expect fixing the last if:then: - you
> >>>> need to drop contains from PMK8350 if clause and add new if:then: for
> >>>> PMM8654AU.
> >>>
> >>> The delta between them is such that within the already-described reg
> >>> ranges, there is some additional bits and/or registers (can't remember
> >>> but it doesn't matter for this point)
> >>>
> >>> This doesn't impact the described size, as all QC PMIC peripherals are
> >>> by design allocated 0x100-wide windows
> >>
> >> I still expect that fixed.
> > 
> > that = commit message?
> 
> No, what I wrote in my first reply what has to be fixed.
>
Should i need to add something like below: (removing the contain for
PMK8350 and new if:then for PMM8654AU)

+  - if:
+      properties:
+        compatible:
+          const: qcom,pmk8350-pon
+    then:
+      properties:
+        reg:
+          minItems: 1
+          maxItems: 2
+        reg-names:
+          minItems: 1
+          items:
+            - const: hlos
+            - const: pbs
+
   - if:
      properties:
	 compatible:
	   contains:
-            const: qcom,pmk8350-pon
+            const: qcom,pmm8654au-pon

Note: PMM8654AU uses the same PON register regions as PMK8350. hlos and
pbs togater called PON module and there are no additional reg ranges/properties
needed for PMM8654AU, While PMM8654AU updates some register
definitions (offsets/bits added/removed). 

Best regards
Rakesh kota

> Best regards,
> Krzysztof

