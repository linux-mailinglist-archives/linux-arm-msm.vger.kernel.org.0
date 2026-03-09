Return-Path: <linux-arm-msm+bounces-96284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNe3MrngrmmoJgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 16:01:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E07823B2B4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 16:01:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CFED430DDF84
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 14:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 851723D34A1;
	Mon,  9 Mar 2026 14:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iLumNsvr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QnQv2cVn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9312765ED
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 14:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773068245; cv=none; b=KexkGUTlSonf30RmFfjbG3YjF4QvBgyY2sPsBwJ09Ct7A0hfFBHllZRXacP0OpxAH4rpoArLECdvG/knvGNR2nYjNmh++0fmX1E8bHwQYslzkJUH8RWKR8EkuTEE38p0t6Ik0svLzTdHlEKaLnf9LlgR5bNt9OsA21KKPSnePCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773068245; c=relaxed/simple;
	bh=WE9CKAf1V3Kf1/4zsOiJ2xNFT0naCa7zJkrl9z53Et8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nBG5Bvy/xl6RvCUBpgPj3zN5Wjid+VrXbLydlCBuKZ0yPr4FK6ZPD6CbJSf3tBzc/2hRJo+t08mvNNZIcHXliSqjnr65JlWXv+lMRh2XJ3ZWroyXy7P9zI/ENkvVydn7FVOljRls9ErF3Neih8gS/w0Sy3FiFgM3VX8UT4eG3rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iLumNsvr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QnQv2cVn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629Dql5o2138215
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 14:57:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JwiesHYl6GPFR3KwAnlUOp7/Vte2DfSxI1dQFZPE+a4=; b=iLumNsvrwjPqqI5u
	gwKy+IgqZSLy5D8fNydpWtL7/3oYZF6W7DtNgM3vNIQ8zTCNFwPUtu9QQScIQg8T
	5QvbGrjWOI8WSQyGa6u2Xe6fcuWrnka8z1JHE90bzU9mChZIyS7cEKZU2aPVp+P4
	hLGv01MRMVKOsg8SQ1+DByPoXkpByzzv3I0hZyHkNkuDPxbmuEVjVtSAsji753Xk
	8cI0alBmxa0wlTSJlpSqWnwoXjp7gHk4/+bt8YWFNaGGnwBjgra/cQoPDCRUDN8C
	le2/6M+vBa11/R+WasToWiL+9THz9ETFkkMDg+fkfCFLCU1rdQ8sJj0+4TsMY/sD
	H7zanw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyft06dq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 14:57:22 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89a108d17d2so373963236d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 07:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773068242; x=1773673042; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JwiesHYl6GPFR3KwAnlUOp7/Vte2DfSxI1dQFZPE+a4=;
        b=QnQv2cVnTYI85k+jM0+EW6qINPrTFFeIqwRPVDZENxnjfbReshh22QAUjaKwNPBSGa
         72KvdaaTQIWCx5jwG/ZJbaH5Iquc/7apWCM/cd5qn/mVYpYOMjGPNVJluLfF5PYkMP0Z
         Bmh1d0iUnW3GynFxEYgLjauZ583PlpEmODexn3lPezl46psUNOiwOaTWtwBgCxdFBD01
         OkST0+z7RyTqkjlIYRndbtDTGVDsSWmiObHtWAO9YmDRlrpyNg3x0rWSwVoZLklIX6TG
         2fUWqJcRO/9en5hpovFHvMIl/CqbBJ/sD4x4OKYQxydlU8ibA//OTEgQupB4r+pYsj9r
         9bIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773068242; x=1773673042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JwiesHYl6GPFR3KwAnlUOp7/Vte2DfSxI1dQFZPE+a4=;
        b=iQCK3xaLTiGPsGMlgSbnikw1wXBjcBGIsst6iCtIztwub0Oq65UhJaqUZU7bA9clJC
         oCdNV2O5XbRM4aAwDVzNa9PHjiZgf1tzsDZntxubadkG7D08Q+rpNtIa8uHxPQd/fjt7
         22kKNuzfDFLfOFXL+CTqUgPEn4Y5t7dR0nZHrj9kWpgw7zkz5UeCC6hhGhBeMosASoM8
         xv3ev4dAInxNx3q3s7BKDdHNk42BYlUQ5+hKhDE6YNACexDZzKyTdF/l9Q+NNC7Iogn0
         2nzjQuWKmwuz2D/2e2seXWOLNYGGrHTwi5E+I4NIw3AmYBPpHJCd6gMD6i3xZE0g/lPp
         hu2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXAK334ndZq8ypDcnbe4hggL2o+x01TXjmPYC7VLAUlHXzRhxbTHzs6kP+aSwdCi+Gqa3qNzbTdz3n9OMbj@vger.kernel.org
X-Gm-Message-State: AOJu0YyYIbwT9Eni4x4MrJK13bimoMWHJz1QS2XxNgTCv29bAyUCSMkG
	4VmVK6fVFotpp79RUQ1bmODFdqCVXmGRoJusB0dBlCFsb8F1/+EfTbip70rntfHTKPf9FQpsAhZ
	NGbimDmDQYPmVNXuLzUKwjTYxm+ulE2sZT/qFroaByX6R3iKyU+PjqR0PPZgKjRoZ+F8z
X-Gm-Gg: ATEYQzwy6I4GQYHq4eU2b/ANvSWYSfz564VQYrACIWXRP2PVeZgCskfhd2SsWGyLGX+
	Pss2bRlL+iml2n7axBA8cwFLaa/lK7T20mXIGgbG3CVfSSVje6IZKjUFu1DLReZd65KKn0it+jz
	3RQVcYIKSQPLwqjgVfFkoxcPhxsVrjGDnVGmh6pTPt1kauvKqWjrVWrUhlQinZXZZGvQaFBj6fp
	AX8RVNw6F/h2S+GcnCbPzgWA9yCvo7T3oqDbytMfXoxhzpvQcBDOqsr5KGh+U9SQUShh2eulMfM
	nENBnnlp6pXPmrWAKRVMqDirnBqMEsE9DLU8A2gYTFD+PtJCYTVJkqaJo4yGoMp/qZG3JBb6D2t
	TUzd6iKPtSqm97UuYqy90WLY7rRGDLA==
X-Received: by 2002:a05:620a:7010:b0:8cd:8ad9:c893 with SMTP id af79cd13be357-8cd8ad9cbf2mr410405885a.6.1773068241877;
        Mon, 09 Mar 2026 07:57:21 -0700 (PDT)
X-Received: by 2002:a05:620a:7010:b0:8cd:8ad9:c893 with SMTP id af79cd13be357-8cd8ad9cbf2mr410399685a.6.1773068241210;
        Mon, 09 Mar 2026 07:57:21 -0700 (PDT)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8ec97sm29906008f8f.5.2026.03.09.07.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 07:57:20 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 16:57:13 +0200
Subject: [PATCH v4 1/2] arm64: dts: qcom: glymur: Describe display related
 nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-dts-qcom-glymur-crd-add-edp-v4-1-fe4e33acdfb6@oss.qualcomm.com>
References: <20260309-dts-qcom-glymur-crd-add-edp-v4-0-fe4e33acdfb6@oss.qualcomm.com>
In-Reply-To: <20260309-dts-qcom-glymur-crd-add-edp-v4-0-fe4e33acdfb6@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=14242;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=OUmXBHWadrbNVoJT0lvmZMpKkE15iXwCwDla58XvJ+I=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBprt/LY1BKt0Wv75uu3RnJOGjA8WOYff4T8ofRv
 fs/6larmQ2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaa7fywAKCRAbX0TJAJUV
 Vv2UD/94oboNIjRT5I7M7kcnxwp4s7MMyEmcevL1jgf7b5uqlBSVvmC2OQie+xLxj9TbG4AM7Wq
 ESWX5J8JOFfw0NQ9P06rjUXYGEjFxN1peiRpKeeUEF2fXkgqptrvfWIK/wHnlhE/3d4US2PD14f
 LbWLGllZVYTw+oGEvVx020Q80RCR/65xVLIGJJ6XwwmxPtCDYPwOQPSlgrQDU867Lhsj3o2iyU+
 tELStDShFwUc2LIz4Rbf2kEcUFz4BpabfOmn7xNEzPC92EB43JFVUJ+2jUxKUlwBQ287eVcGNTU
 xuFlZXV8rgD2kIDcyCR95eT0RdjpoiCguRgJ9ZLpOvbFwA5sb2cqieqAiOBd/HnmJ6YO7Mvos5I
 JmNtRIa7fsMSJI2q3B4AsUhnocCCM3688kB77ekaDTQkOBzThN+yXbz2ngsly4ZLI/oEjFC9O0c
 dQHrb7lYI98XdXQuxnS+nItz+N42wUaLgNUl36kEzFAGoXq7zpKGWSHQRwBWJVl57/nyl5C3kv+
 BRsZHDnWHbzB+CBtOV5Mi8D0LmyafrIgZV6iD47bWArCkXQqDeRpWB++NOJcnDA9Vjk4pawb9GI
 GfCguxJg0VEfMTLYixnPN7vTjWzKWWYYMIOcXr7mokGsvmPYNJSscEeEY5e6Yft6XoJFhMG8Ucp
 crAoDXqaaBuC3lQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: Uy3T55k8kgKwtB_mazfWASEoPezS1kMT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEzNSBTYWx0ZWRfX7sxNYCKkTqu4
 lMCBm+mvT21Xuiv1jJ7dR73n06csDg5q7S6G/+TMoUNe2CG7cgJp4cz8eNsco66qGNpZBI632h4
 QVcIqngc4cY29PpJFFXlizhVCirhP5ZFi8/Cz/wU90pvMBpPL9d89wbm33B9d9NpxHXlPez1dde
 hXcAbm5OeDh/wcVd0ctzryggqO1/jKlnMso62tvaZjexUSuDwMKYfg/ZjT5ZIXDL6hbP9P//CSt
 H3p5hzjAAhZWL4NotkN8JaICcTxT2KMECV0rdPA/XBCnpRram0+6I3IhI+n8az3LpqfX9Q4ytum
 PCdNmxb1OfhYC09F1H+shTsK/rNs+zya7kzg3fUeEhTFRADbbgl+qmd+EurrL8hm2KyOEs09NKb
 fUjkwGz+4XLe1Rq0iW7WsREQ/W1Z1f9UmTY0I2xvWIONBSDgjT0sZ/0vOun8psn9f7EiL7g2git
 OhfvemlYwSwQ9y0p61w==
X-Proofpoint-GUID: Uy3T55k8kgKwtB_mazfWASEoPezS1kMT
X-Authority-Analysis: v=2.4 cv=F8dat6hN c=1 sm=1 tr=0 ts=69aedfd2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Nt3j2eaCHLMPKZ4rhccA:9
 a=Y4kR1PUZdprbdErl:21 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_04,2026-03-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090135
X-Rspamd-Queue-Id: 0E07823B2B4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-96284-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.b.d.0.0.1.0.0.e.a.0.c.3.0.0.6.2.asn6.rspamd.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.944];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: Abel Vesa <abel.vesa@linaro.org>

The MDSS (Mobile Display SubSystem) on Glymur comes with 4 DisplayPort
controllers. Describe them along with display controller and the eDP
PHY. Then, attach the combo PHYs link and vco_div clocks to the Display
clock controller and link up the PHYs and DP endpoints in the graph.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 466 ++++++++++++++++++++++++++++++++++-
 1 file changed, 458 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 2aa9af8c96ce..20cc512585f0 100644
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


