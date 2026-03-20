Return-Path: <linux-arm-msm+bounces-98915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCUaOg0uvWmI7QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 12:22:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EA22D977B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 12:22:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 810F13144A71
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 11:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D06B3A5428;
	Fri, 20 Mar 2026 11:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lAwPxK0e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HU/nD++r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CEB3A543D
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 11:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774005419; cv=none; b=PEO3wmgJi2wz1CWCtcdlibXUpGyBfyhpRP/GbsP1F6p2SF1bJISWWfz/8EzxhWfXjWqulDbp46DLg7KlnpcdBD82eh1wHzE5twmkUD3MbdTgiHaBTLcdvnMFwh1UOvtaadXygdVwLEMV/SUpEkktks2Wy9C616pq4YfGUa04Fx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774005419; c=relaxed/simple;
	bh=GxedIxLixGV8WNQD/M5ytzpbojWv42g+r0q5VzktbHw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ABRq41jv5iqRgdV0Wr9NSbzuW2au1qfcPCmKb6+CHt5KoAsCUPYiycG7kqvkchIwue+vW/mXTMcy1AsZaSrApHT+e3WZtg1A2Ikywp6CtK1sS2IRFY8OGFxcRichvQhnE3xCrP2X865lwJ7/IQwZA+Qp8VAVscU0tXKrFzCvx/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lAwPxK0e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HU/nD++r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62K2XrpQ989591
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 11:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tgLvN27Gi3di4bgLo9Y8nlxabXNv7m6EoUNXUYS2lbg=; b=lAwPxK0exZNpB+u0
	qn2jgWLcVtCoI8ybiqF6gYq+0qm3LQEmgB2kMAP0+XRv5Jyegw7+Pmte/Cikw/Bt
	jnwuAXMQ9PplM5SoC28bVNZT2c6PovK87yc9yg3WjTLywam7yj83bhrVO6zJWnXf
	n4EEunV4JBSdZCcTVc9kosBM8j7eck992KFPRUUJFbKq5AtfidqLiXUN/qXmDhvq
	2V7Ifz96CHTF8uxSStJLTUd3WtdFRosGNpUkc7VPgRMo8+7VFNmeU9PUo+z+OCER
	/6EOw+2CTQpfzgiJIB5OOzcYTFGZbO78uHlyz7zRO8NBtrVbySpy4pX64izds4ly
	6QLW7Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0k0vb635-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 11:16:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50917996cfaso130071391cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 04:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774005416; x=1774610216; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tgLvN27Gi3di4bgLo9Y8nlxabXNv7m6EoUNXUYS2lbg=;
        b=HU/nD++rjiph6Ag3ZEduSAcoUIcMo2QWGdc2H3NsL6PfSfw+B1eREf31A703+pC14Z
         c5vDakLTv4NGc/TAlZi/MmlT3896ovhjHP7395Pq1sQhFbG+9J5WQmIzkWByik83Svkk
         T/fnwuCw+EDerbiCFvmBvEeAai9NdYmf9EiswD0nMR6tnJTp/82jVK0Kod1faqMZ/451
         ETZ+qOp45HlbwgNgcvRDTvU8diUMj10aoZ5GmJtQxqn0BFz3N/YksWHWG82CynN0AJAF
         iqfzchTwdpxxSqyN/AY5XrtS51Ct+nbOseH2YYY6nTc5gILZTduiU88LVuvSLWJhRq8n
         W0nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774005416; x=1774610216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tgLvN27Gi3di4bgLo9Y8nlxabXNv7m6EoUNXUYS2lbg=;
        b=CWtPR7pXPMcuRHXDJIRgc0t/S0yYvc5dp7tT1QfY2RiJT1Rfl27LFIFVpVB+kEd3cK
         nlkMOHagflVLxQ6goMiLg2CaITdMhNh81egTB76geKGNc9pqW/ElRGXRCyNO5+Z3CvCj
         qOhqYw7l5ebR1DOWuy1oQBPrfYUmyRbu0krR9CsCqo6+lYW7XMZYj+t+9c7rWhSHN12P
         c3eymvWA4NgjaoX8Q4f7OiaxmHUB8kkOjg3Hfuh41xMKTU/aGRvMIYnCEdWGhQnkBbOj
         vxdoGcECD8ZSL0cnaVxze6+aazOQl5CfHPQWbPwgZ4tBvcvq/w/pYTfrOgQzZ+mc5xAs
         cjxA==
X-Forwarded-Encrypted: i=1; AJvYcCWyBcbFQsBy8L8cJwzFLD2WpfOe5zDg91jNZTwBANCaWbSDGSkFlGoqwiP2eAhI8XPQnBA6m7+myi7Pyo1o@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6SEjVgDdZWtx6qu6lkoXuTdsfop+acbFB2AwaAnK9T2ZdVUjK
	oPXPzBWIZv3z8nLWQ/0eSYnS6/Ij5f0iIWdjAUkjY0cqRKoC6dbqPU7dQp+0w3oX0GjxcxKlovu
	+dWdro6GEE0FpFgs948NGMLLHfi+NW2XvOKC2CYFOlcOy9e6yjAjfMTIULrYihv0IpkfR
X-Gm-Gg: ATEYQzz2I/EuSza09/JyLiKPoijt6a+n0t8QBVI/5xnSyRfdpJdIJUwDd9SsRMYebXW
	EZgjhXVpvDKRIX7spF4uq+euMGmg4Mdj+jVIQOpByRKfQtjEC1e3ONVZfW9posww1pVF71pYFaa
	8glvLm875lwr6lFs9mqaRMzJEwkno8MJDsaoqaBG9ZuJP5V7RkFF/1+pMexABtI3Lb0t8QYcN6p
	L0NVA3DkTJa/qjNHw5A0EIovn4/OyBh3gQSWETTA7HPyGgikaKsZFgi0B7LjgGIFQiNLPHIG+Hh
	DvsK4qXMOFiYv3M9vFtQh/5DzUZ1VEqehr/tzNilStZbEEcfu+psxD7I1gjUH7++hKMLUj1ebfy
	bY9VOYdLWrcoQ9bVbs+naBu0IrH4=
X-Received: by 2002:ac8:57c1:0:b0:50b:3df1:e5d0 with SMTP id d75a77b69052e-50b3df1e7femr13483671cf.49.1774005415412;
        Fri, 20 Mar 2026 04:16:55 -0700 (PDT)
X-Received: by 2002:ac8:57c1:0:b0:50b:3df1:e5d0 with SMTP id d75a77b69052e-50b3df1e7femr13483021cf.49.1774005414680;
        Fri, 20 Mar 2026 04:16:54 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6470b1f7sm5905898f8f.25.2026.03.20.04.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 04:16:53 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 20 Mar 2026 13:16:43 +0200
Subject: [PATCH v7 1/2] arm64: dts: qcom: glymur: Describe display-related
 nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-dts-qcom-glymur-crd-add-edp-v7-1-ca415560447e@oss.qualcomm.com>
References: <20260320-dts-qcom-glymur-crd-add-edp-v7-0-ca415560447e@oss.qualcomm.com>
In-Reply-To: <20260320-dts-qcom-glymur-crd-add-edp-v7-0-ca415560447e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
X-Mailer: b4 0.15-dev-7ae85
X-Developer-Signature: v=1; a=openpgp-sha256; l=14309;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=eSW0sJloKa1qOFRHolXg8m8qlEqvGb7Sz+MtP06W4z8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpvSyg5CqYLUTfNC6PGhhRuwqlfoCrNh0Rj78k+
 mDNIWR55N6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCab0soAAKCRAbX0TJAJUV
 VuSnEADFrXFIptL8cOkROnoFnaPXcVrY71ovm2klR/LCWxbD4G+6ypsWRgW0C/0xyR1RrSKnT9U
 aYtQ6FDUlP51PLKbo/2WOWGT+4dgoUSaRpPHAib+86ZAeh+j7zpMxPjdayNpt9XVgo1pMLy5KZJ
 F2GBvwN0NUaNr7mP0rLTFoWKCoLtVabUQH902yE8Wtn+MOyqMyGYIos6OQjR1+2yMutY3P0Z2ks
 LrPpkQ0xwZoORrljfg33g/HtWIGBqvPowPQbtlim1rbM1Bdz+QSshhO79y7ksC89IC0OQ5ZsxEY
 TkEHGtiVcysOryBApUqVPfR0tZ+9yFRF4o3i0yG3yGAEiCUX+2wJ9G7CgFOxjlPytLO3KDMwIiT
 KMZn5mjmA1AVXohOOlK6pkTWno2wDIAutR9f55coDppYhjc0I597cJjrfmH8793GU6JdfBqs5i/
 7TpAsbNzgPzs/jkcKPpwhy2yo320ePek76BCpt3LWoDR+/a3liWK7XpVbhxamyFj5n6yfmpZghf
 wSwSzRhDMAt09308pE5GbgVH5XNSL5cH0UW9Woy6bL+W1HSPztmZdlyXNjyOHLL3BlTC/sGujTV
 CigXU7a8wZZ5+usN/2tTAiSbi6L/eDDtDKdmBIUfdUwDLUpugCzNgtywBsu+HTgmD2W2IcfggOi
 xbjXYqjQJaYyVoA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: lRJoMvwfSs33d3FyW3uLk9aGh2UpL8RS
X-Authority-Analysis: v=2.4 cv=EcjFgfmC c=1 sm=1 tr=0 ts=69bd2ca8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Nt3j2eaCHLMPKZ4rhccA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: lRJoMvwfSs33d3FyW3uLk9aGh2UpL8RS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDA4OCBTYWx0ZWRfX7cnl4N07yC64
 sqLUCgbsLGVSG1LAvvqLcH20+81m2IEHQ0XWFHzNJCDqNh8sM4zC9PeBMxengtUTEsCZZwU6l0w
 aYb3oKYB2DjSPtVQ6y3HHZ7ltbIUol19RJl+mZQQdaxqOc00qK+4N+pDxk0YBopfXQ0wlsuH3T/
 UUVpnurj8lCPEieCh7JqIYt2GemtpICWSMmbdMPHBYWLhKU4EWY2JijeddtGmOmRre2iD1K6GZC
 qU5kWJ37h8vLjxPISTlKnUNmwBJaKcZRZrEB/ZnlleIpibKaUbQdNaBO+UjO2x/0ih0m6sCSVvz
 yG4es4I3TRE/qkeWdP2JZe3x/EJdmTz4AzN24fkeOn8fF67EeO/Yy3jUgaVDKwV6RCtG3ABuNzm
 G+yxUgIyxHk8sbsdfVxQMm1g3KsT5k3xJmH6J5g2Tqjmhoi6YSMRQx89BuWBU0Eed4SBfBi6gH9
 KHLpk10gIFm9/WCqyEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200088
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-98915-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 71EA22D977B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Abel Vesa <abel.vesa@linaro.org>

The MDSS (Mobile Display SubSystem) on Glymur provides four DisplayPort
controllers. Describe them together with the display controller and eDP
PHY. Also add the combo PHY link and vco_div clocks to the display clock
controller, and connect the PHYs and DP endpoints in the graph.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 466 ++++++++++++++++++++++++++++++++++-
 1 file changed, 458 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 641707ba1e78..7679e32008bf 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -2367,6 +2367,28 @@ usb_mp_qmpphy1: phy@fa5000 {
 			status = "disabled";
 		};
 
+		mdss_dp3_phy: phy@faac00 {
+			compatible = "qcom,glymur-dp-phy";
+			reg = <0x0 0x00faac00 0x0 0x1d0>,
+			      <0x0 0x00faa400 0x0 0x128>,
+			      <0x0 0x00faa800 0x0 0x128>,
+			      <0x0 0x00faa000 0x0 0x358>;
+
+			clocks = <&dispcc DISP_CC_MDSS_DPTX3_AUX_CLK>,
+				 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+				 <&tcsr TCSR_EDP_CLKREF_EN>;
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "ref";
+
+			power-domains = <&rpmhpd RPMHPD_MX>;
+
+			#clock-cells = <1>;
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
 		usb_0_hsphy: phy@fd3000 {
 			compatible = "qcom,glymur-m31-eusb2-phy",
 				     "qcom,sm8750-m31-eusb2-phy";
@@ -2434,6 +2456,7 @@ port@2 {
 					reg = <2>;
 
 					usb_dp_qmpphy_dp_in: endpoint {
+						remote-endpoint = <&mdss_dp0_out>;
 					};
 				};
 			};
@@ -2507,6 +2530,7 @@ port@2 {
 					reg = <2>;
 
 					usb_1_qmpphy_dp_in: endpoint {
+						remote-endpoint = <&mdss_dp1_out>;
 					};
 				};
 			};
@@ -3683,6 +3707,7 @@ port@2 {
 					reg = <2>;
 
 					usb_2_qmpphy_dp_in: endpoint {
+						remote-endpoint = <&mdss_dp2_out>;
 					};
 				};
 			};
@@ -4047,20 +4072,445 @@ usb_mp: usb@a400000 {
 			status = "disabled";
 		};
 
+		mdss: display-subsystem@ae00000 {
+			compatible = "qcom,glymur-mdss";
+			reg = <0x0 0x0ae00000 0x0 0x1000>;
+			reg-names = "mdss";
+
+			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+				 <&gcc GCC_DISP_HF_AXI_CLK>,
+				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
+
+			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
+
+			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "mdp0-mem",
+					     "cpu-cfg";
+
+			power-domains = <&dispcc DISP_CC_MDSS_CORE_GDSC>;
+
+			iommus = <&apps_smmu 0x1de0 0x2>;
+
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			mdss_mdp: display-controller@ae01000 {
+				compatible = "qcom,glymur-dpu";
+				reg = <0x0 0x0ae01000 0x0 0x93000>,
+				      <0x0 0x0aeb0000 0x0 0x3000>;
+				reg-names = "mdp",
+					    "vbif";
+
+				interrupts-extended = <&mdss 0>;
+
+				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+				clock-names = "nrt_bus",
+					      "iface",
+					      "lut",
+					      "core",
+					      "vsync";
+
+				operating-points-v2 = <&mdp_opp_table>;
+
+				power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						dpu_intf0_out: endpoint {
+							remote-endpoint = <&mdss_dp0_in>;
+						};
+					};
+
+					port@4 {
+						reg = <4>;
+
+						mdss_intf4_out: endpoint {
+							remote-endpoint = <&mdss_dp1_in>;
+						};
+					};
+
+					port@5 {
+						reg = <5>;
+
+						mdss_intf5_out: endpoint {
+							remote-endpoint = <&mdss_dp3_in>;
+						};
+					};
+
+					port@6 {
+						reg = <6>;
+
+						mdss_intf6_out: endpoint {
+							remote-endpoint = <&mdss_dp2_in>;
+						};
+					};
+				};
+
+				mdp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-156000000 {
+						opp-hz = /bits/ 64 <156000000>;
+						required-opps = <&rpmhpd_opp_low_svs_d1>;
+					};
+
+					opp-205000000 {
+						opp-hz = /bits/ 64 <205000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-337000000 {
+						opp-hz = /bits/ 64 <337000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-417000000 {
+						opp-hz = /bits/ 64 <417000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-532000000 {
+						opp-hz = /bits/ 64 <532000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+
+					opp-600000000 {
+						opp-hz = /bits/ 64 <600000000>;
+						required-opps = <&rpmhpd_opp_nom_l1>;
+					};
+
+					opp-660000000 {
+						opp-hz = /bits/ 64 <660000000>;
+						required-opps = <&rpmhpd_opp_turbo>;
+					};
+
+					opp-717000000 {
+						opp-hz = /bits/ 64 <717000000>;
+						required-opps = <&rpmhpd_opp_turbo_l1>;
+					};
+				};
+			};
+
+			mdss_dp0: displayport-controller@af54000 {
+				compatible = "qcom,glymur-dp";
+				reg = <0x0 0xaf54000 0x0 0x200>,
+				      <0x0 0xaf54200 0x0 0x200>,
+				      <0x0 0xaf55000 0x0 0xc00>,
+				      <0x0 0xaf56000 0x0 0x400>,
+				      <0x0 0xaf57000 0x0 0x400>,
+				      <0x0 0xaf58000 0x0 0x400>,
+				      <0x0 0xaf59000 0x0 0x400>,
+				      <0x0 0xaf5a000 0x0 0x600>,
+				      <0x0 0xaf5b000 0x0 0x600>;
+
+				interrupts-extended = <&mdss 12>;
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel",
+					      "stream_1_pixel";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
+				assigned-clock-parents = <&usb_0_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
+							 <&usb_0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
+
+				operating-points-v2 = <&mdss_dp0_opp_table>;
+
+				power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+				phys = <&usb_0_qmpphy QMP_USB43DP_DP_PHY>;
+				phy-names = "dp";
+
+				#sound-dai-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss_dp0_in: endpoint {
+							remote-endpoint = <&dpu_intf0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dp0_out: endpoint {
+							remote-endpoint = <&usb_dp_qmpphy_dp_in>;
+						};
+					};
+				};
+
+				mdss_dp0_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-270000000 {
+						opp-hz = /bits/ 64 <270000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-540000000 {
+						opp-hz = /bits/ 64 <540000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-675000000 {
+						opp-hz = /bits/ 64 <675000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-810000000 {
+						opp-hz = /bits/ 64 <810000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+			};
+
+			mdss_dp1: displayport-controller@af5c000 {
+				compatible = "qcom,glymur-dp";
+				reg = <0x0 0xaf5c000 0x0 0x200>,
+				      <0x0 0xaf5c200 0x0 0x200>,
+				      <0x0 0xaf5d000 0x0 0xc00>,
+				      <0x0 0xaf5e000 0x0 0x400>,
+				      <0x0 0xaf5f000 0x0 0x400>,
+				      <0x0 0xaf60000 0x0 0x400>,
+				      <0x0 0xaf61000 0x0 0x400>,
+				      <0x0 0xaf62000 0x0 0x600>,
+				      <0x0 0xaf63000 0x0 0x600>;
+
+				interrupts-extended = <&mdss 13>;
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX1_AUX_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX1_LINK_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX1_PIXEL0_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX1_PIXEL1_CLK>;
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel",
+					      "stream_1_pixel";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC>;
+				assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
+							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
+
+				operating-points-v2 = <&mdss_dp0_opp_table>;
+
+				power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+				phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
+				phy-names = "dp";
+
+				#sound-dai-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss_dp1_in: endpoint {
+							remote-endpoint = <&mdss_intf4_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dp1_out: endpoint {
+							remote-endpoint = <&usb_1_qmpphy_dp_in>;
+						};
+					};
+				};
+			};
+
+			mdss_dp2: displayport-controller@af64000 {
+				compatible = "qcom,glymur-dp";
+				reg = <0x0 0x0af64000 0x0 0x200>,
+				      <0x0 0x0af64200 0x0 0x200>,
+				      <0x0 0x0af65000 0x0 0xc00>,
+				      <0x0 0x0af66000 0x0 0x400>,
+				      <0x0 0x0af67000 0x0 0x400>,
+				      <0x0 0x0af68000 0x0 0x400>,
+				      <0x0 0x0af69000 0x0 0x400>,
+				      <0x0 0x0af6a000 0x0 0x600>,
+				      <0x0 0x0af6b000 0x0 0x600>;
+
+				interrupts-extended = <&mdss 14>;
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX2_AUX_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX2_LINK_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX2_LINK_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX2_PIXEL0_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX2_PIXEL1_CLK>;
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel",
+					      "stream_1_pixel";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX2_LINK_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX2_PIXEL1_CLK_SRC>;
+				assigned-clock-parents = <&usb_2_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_2_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
+							 <&usb_2_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
+
+				operating-points-v2 = <&mdss_dp0_opp_table>;
+
+				power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+				phys = <&usb_2_qmpphy QMP_USB43DP_DP_PHY>;
+				phy-names = "dp";
+
+				#sound-dai-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						mdss_dp2_in: endpoint {
+							remote-endpoint = <&mdss_intf6_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dp2_out: endpoint {
+							remote-endpoint = <&usb_2_qmpphy_dp_in>;
+						};
+					};
+				};
+			};
+
+			mdss_dp3: displayport-controller@af6c000 {
+				compatible = "qcom,glymur-dp";
+				reg = <0x0 0x0af6c000 0x0 0x200>,
+				      <0x0 0x0af6c200 0x0 0x200>,
+				      <0x0 0x0af6d000 0x0 0xc00>,
+				      <0x0 0x0af6e000 0x0 0x400>,
+				      <0x0 0x0af6f000 0x0 0x400>,
+				      <0x0 0x0af70000 0x0 0x400>,
+				      <0x0 0x0af71000 0x0 0x400>,
+				      <0x0 0x0af72000 0x0 0x600>,
+				      <0x0 0x0af73000 0x0 0x600>;
+
+				interrupts-extended = <&mdss 15>;
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX3_AUX_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX3_LINK_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX3_LINK_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX3_PIXEL0_CLK>;
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX3_LINK_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX3_PIXEL0_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dp3_phy 0>,
+							 <&mdss_dp3_phy 1>;
+
+				operating-points-v2 = <&mdss_dp0_opp_table>;
+
+				power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+				phys = <&mdss_dp3_phy>;
+				phy-names = "dp";
+
+				#sound-dai-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss_dp3_in: endpoint {
+							remote-endpoint = <&mdss_intf5_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dp3_out: endpoint {
+						};
+					};
+				};
+			};
+		};
 
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,glymur-dispcc";
 			reg = <0x0 0x0af00000 0x0 0x20000>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&sleep_clk>,
-				 <0>, /* dp0 */
-				 <0>,
-				 <0>, /* dp1 */
-				 <0>,
-				 <0>, /* dp2 */
-				 <0>,
-				 <0>, /* dp3 */
-				 <0>,
+				 <&usb_0_qmpphy QMP_USB43DP_DP_LINK_CLK>, /* dp0 */
+				 <&usb_0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
+				 <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>, /* dp1 */
+				 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
+				 <&usb_2_qmpphy QMP_USB43DP_DP_LINK_CLK>, /* dp2 */
+				 <&usb_2_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
+				 <&mdss_dp3_phy 0>, /* dp3 */
+				 <&mdss_dp3_phy 1>,
 				 <0>, /* dsi0 */
 				 <0>,
 				 <0>, /* dsi1 */

-- 
2.48.1


