Return-Path: <linux-arm-msm+bounces-99698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Ak5LmuvwmmRkwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 16:36:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF9831828C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 16:36:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E18143095C4E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 15:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97E2140710C;
	Tue, 24 Mar 2026 15:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YqdZ06DH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aSIEdzQl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286604070F6
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 15:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774366199; cv=none; b=SgMPviRj/XMnzYgSTYiFDHjYR3U9Ef02wc6BAYyx9AdVv1wbc42V+S7Q667D0c1CeGUqwU8kMpmb4PFhIe4tbZUQe9rT3eaSVgRENsfyLswTnS18jiwW+Zd6wY3q/DksQQsI/GAjZO6ezRpKPiMhZ7JhMx5T3xXJwfGs70icnIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774366199; c=relaxed/simple;
	bh=kOIkEPFZtloUYwpSi+XaO89aEWxmjyAfSJyVgmXGN74=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qYIM2Fe3wtkGRgYHyoOvLFZQTXQud+QeiyISIE7VN8ByhUXuMohnaKdyPNRkwIC1HseWWajnMVzoJpAToj9IMiBqJN77yV0TdfHz2Byd8eBT4Q7C/qZ2AWP09Y9Rx2QVpAaLb9XikKL/5eLB5bUmn+P4E/e3PrzqwimE3iV7lWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YqdZ06DH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aSIEdzQl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OC38ah1817331
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 15:29:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OaF4t5wF8sB8MPDX+QqW+3BaUm7DeWm64V4AiHh+uH0=; b=YqdZ06DHR5WcdNnz
	6HP4HiIl1lZeVVXNI3n8eiZEVP6CwGW6v5TqTEeKfR4tWDYHpm617QkxYu23B/6U
	WGeMm3tGVQonOQ1DWNK/FEFwU+4ooMk7vKRDw1L3MYt3Dcv8/w+frklGpJDGyMrb
	qRCsf5XI/CHW4hqYF2X9kWNH+FhOAEZ/jcdGwatUe2Bwb5oldeT6kmmzwnCTBhAl
	D8roGhOC96lEY6i8cb7JBdR32P9wt36/zXGSqcqpsppVvamlldUwUHhAHiJuvmQj
	0UoM6H2juougHmtM6f8um5/TeQCBvNLnjoo1RyX+ftEe6gkhztR8bSXBwUlfA8SL
	53ylLg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3t9egu19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 15:29:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b2cbe7223so84604031cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 08:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774366195; x=1774970995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OaF4t5wF8sB8MPDX+QqW+3BaUm7DeWm64V4AiHh+uH0=;
        b=aSIEdzQlN3kB9Ptv6d8fKU7TXnyt9N1yScxNUsYNjg6ZcKkTqonUdQhftwIBA9xPpk
         U3PRWd09TQIbA1238ISCkIAPfE+R2Z4b+4UNn6E63DoUf2C57STEn0e8sS9+AgzznXyp
         UgqyxUm4m/3SZLT7zQ7Sm6NHaj6gB+7LOVt6i3QvO6hnb0Jkb3PCH4DG0avSxQ40rOYP
         88vh5o9g+YaUZ7An9j6XEJl9QtCA/vAZZljWuBoJzXzpMQeeUkI50BA43r1S1z/EHsF8
         wuoV4oUozydl7DGAzC/XaZX4ntapLnJz4ktXf9U/vbZpkNBcCexOmhunu/M5lTRbT0Ws
         2LhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774366195; x=1774970995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OaF4t5wF8sB8MPDX+QqW+3BaUm7DeWm64V4AiHh+uH0=;
        b=itCST8p+SHpxw+Lb+ed12GoCpmcQGYuggqfsICmqb14GySHH+vKnpW7l0j3d2Fek0f
         +rEEpWV0M/xz47x5gRm8GMNDUhz2td9tygty1o2cu76DW4IflqNYZyf6zXy5hG8h5dZv
         vOF3mXF1PF9L1D33etYZmauH8rudyFeL3Zd7TN5NZrCNtzlCKM0AX67YIEoJVYttdZpS
         0JzEXuMsB3tZ0g36DT3d61CmKZC6p7SRWvXT52znmMvOkzLqpEssBfL3aFMKa5k+x4kK
         IAeKTplbsm8ua77H5EPCKpAH3D9jaYzK4XM86bMSpd4UKV2SqCRThqYYs8ypFmRxLkFY
         DEBw==
X-Forwarded-Encrypted: i=1; AJvYcCUNFgI5laoU+Q1skwI/F3YLuk2Dp3GohDl1q11TXaZwvZnV0E4fTDRXf05F7qPgyInvKgjOTl6xZdWhJvy8@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1SCYSa4k/oU+PWXxQbY1C/IhO5ZfZJyZ6kyorDNb4afa2bkiH
	uJXB+KcrjljtiiH9GbXvBgCy1m5z3f2PlfZpqpVjCib74FMcssl8KAi2aA7c7mb+AELnvnYodsE
	IJsWXTykN/hUdBUJQu0R9SLV/vfoh1suw4NuEltoYoKNxe/hiXERKFcDIalVK6xBnKrvG
X-Gm-Gg: ATEYQzxz/Rh5Q6PNRJYKvp6TxUHwJ+YniqbXmYrcWSNk5SjOdmNg2fXD+q0RpO/T9UV
	5PTF4QF1jOr0pktWiUsqISZWrCSu6WK3+XuXmoq31L4nHbcaikdJaC5fvzbzTWVNeWiE0ywILGa
	qjwYbUJuXm8DTmkYES0Xrhc30dC4QIMV89poWShPW8lTOgeHUAXYKDpD77MiqCaX2wf9zBScZIn
	EZX/2TIj/eyOLDTAoTL3uc0I0Qn+6kjB/U/88ktSD2muEAw3jlsSGBBdMQ0fSu06li+Nx+77qy4
	lrhWr3JzryFJWzgTrxAQFYFNORXf5iV4dKPjlC0yqZF+MtUmmDxfYE5rQ0a8upQyOC9xhi5Quc0
	vB/JNGpZb0kqdn/vI1v1b95Ia4is=
X-Received: by 2002:a05:622a:4618:b0:50b:2e09:8c6a with SMTP id d75a77b69052e-50b80f2a9f9mr111571cf.72.1774366195139;
        Tue, 24 Mar 2026 08:29:55 -0700 (PDT)
X-Received: by 2002:a05:622a:4618:b0:50b:2e09:8c6a with SMTP id d75a77b69052e-50b80f2a9f9mr111091cf.72.1774366194485;
        Tue, 24 Mar 2026 08:29:54 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4870f6e9ce8sm36943385e9.2.2026.03.24.08.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 08:29:52 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 17:29:42 +0200
Subject: [PATCH v3 2/3] arm64: dts: qcom: eliza: Add missing CX power
 domain to GCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-eliza-base-dt-fixes-v3-2-3a4a03e72f8f@oss.qualcomm.com>
References: <20260324-eliza-base-dt-fixes-v3-0-3a4a03e72f8f@oss.qualcomm.com>
In-Reply-To: <20260324-eliza-base-dt-fixes-v3-0-3a4a03e72f8f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1054;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=kOIkEPFZtloUYwpSi+XaO89aEWxmjyAfSJyVgmXGN74=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpwq3pw+lsLedvhS2V15+gClRt+ze5oVD3+LT0b
 Hk1K+0THV2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacKt6QAKCRAbX0TJAJUV
 VqRiD/9g66WDbaBcPz9hj8KolrUZl0VMBNffXZHTXZyMNjd1rcVk1va0+Vku7I6tEryiyGM/Qq3
 pgf/UdAHQBMIB22mNbxl4nNJd09JSd0BQl9C3KhNlvKM0BFIN8vPj+M+iAy5IuDqIjpDNEi+FFb
 bCz/xIkZ8U/fDmoPx2Hvagjj0jF+oC24QasZByStsnVxrgrPRPv0Yfkk3Y0qJmsV89FZ7gGODhz
 45v/dGNXsUS97rdOMqaQ6dbP0VEc9UK6+N9XqARBKxaD/+ogZ5sZQ8hlGQk7CL+pAK9ksXiDVZ6
 GxuYpJCX/vxvDeThpwEfh8jGUupAsP0VZ3ySLfCK9U4jSU9pRqwl3X+4ldIqtMNGnO9nBkd6wHN
 xcBQMDzbnVeK70y8BYSwD0inkDI58O7li0ZYTivxHSihVnxdNjaISMCBxoP7lnPn2Scxv98AN0e
 a26Fpauu5vXN1UBV1XcAVr48RHKxngcRkrp5HgfQACqIy5UJ+8O9FguuHFk7ZSXwfOETHizNYFN
 Gz6Id6R1h4MoQgWfioEu376LuuSixr3LX+tklVEdoWZ+FAUwHU8TKJgoaCYjs/rhUu0e8QLAwNY
 BYp35wlHsWWqgAuCbbUqkw2eEKKJ0ckHuXSSthqjjxSaxi74Qf2WWQuDgkIZdG+uxgtn/secPUv
 /Z5/ccIkjAdSAKA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: nJ_CeT40F2ImrqMZXifmdAuL7f4romKE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEyMCBTYWx0ZWRfX4zmHD2gOjnmd
 UXfWFwdlTYkVML6fUJmW0lp8gBR6NH4xVX1vJHjGk6/aZgFosHsmhXvsejHaSxbDz/1kvU/9As0
 7dyJQbpx4sOxvzVG5TBbupy5RsiPl7J9FnpderfwVd9KnMcq6GL9GePkkWNauC7DPyb42AC78kf
 FQcvRh+iyp2hWEzj0gWaGWO8PAVbINrdGgU7m62x9OOBgjf8UPzJxEOJit1soUN3EaHv2J1U0Gw
 0n4dWD1Vbjmv5fyPmEC/iWNqESuEfkpztWDum8ghRa7WIwaarQJE2JGciDS0YzjlIAAonzXkD1I
 Jk4PlCJncghbDQH3nU+4DGmWQl59OEWJbpugkjbBVb03GnYfTHBvnHeTOyahQN/GTq2CJlMiZcd
 BnSGZM7c9hd0Rc2UFen9a8l+bl8cTHVEbcTMFE2nI3r03Vlcm45qUw9Ux4IFJNIa0w20pD+6W02
 fpMmX03VAZNTkDd1VdA==
X-Authority-Analysis: v=2.4 cv=DdAaa/tW c=1 sm=1 tr=0 ts=69c2adf4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=eWTIzzE_mSYKg3fclygA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: nJ_CeT40F2ImrqMZXifmdAuL7f4romKE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240120
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-99698-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,0.1.134.160:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5CF9831828C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Unless CX is declared the power-domain of GCC votes (power and
performance) on the GDSCs provided by GCC will not propagate to the CX,
which might result in under-voltage conditions.

Add the missing power-domains property to associate GCC with RPMHPD_CX.

Fixes: db7fe6963466 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 5dc3aede6842..fab603cd8e42 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -617,6 +617,8 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 2>,
 				 <0>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.48.1


