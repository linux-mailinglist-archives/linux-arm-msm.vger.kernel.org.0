Return-Path: <linux-arm-msm+bounces-112614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id j8kxCZRGKmpLlgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:24:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC7766E853
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:24:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FGElZE0G;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CSgEgjK5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112614-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112614-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 84F4730B1B3D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 05:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A8D63998B7;
	Thu, 11 Jun 2026 05:01:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8877039A048
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:01:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154093; cv=none; b=G+gEjShVdpnC4rD6VZ70YE+D89fi4YbD+DxQhgXERMIisN7zi8j8B3uTPnQCjlpam2mJ8VTBMjoWK2xLjP8SBTbOOadNs7nyTfnrBgsQW0bez1b/DNS46a4NjOWpyelscfJikZ0VkqJWiBOShlEtSmOmiUw0y+Rf675/7k50ruw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154093; c=relaxed/simple;
	bh=EvwFjMdGg48XGE97lgHVA5dnyAPOTMD+iOwYzPm4FBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hsbi7r+dvr8Q6d4dk0pKqvzn4jTet21B9hiiVL2/y3B0KeLrzcejLe7QWYS0C/nIKod7rMbIMgZ9TBIYlYNEQzXCOxBUrKuzj5WTyUDuSyRwjiRoOBq/ULUQSnXGb1Ab3zZHvTVJ39/CLEQ2wzxbqr1pQIeatNh8GXozQWddhVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FGElZE0G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CSgEgjK5; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NWtA3091895
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sDZBgmLDnN0ke8G/yPGmYz0zKi/JoSa4wNV1jrBM8aw=; b=FGElZE0GW/IKRsYz
	fVkb+gQ3COp0Qrumx7V6zWb1DXCUtCicZGhrkaDLwxctvf8obJRhyVgzU5Zt0GmC
	7WIUeqO8dKSkZUZWoa8ZaHgoj8sWP8wglaAL8uR9+RdZ5y5+dV405mE5MBnjS/xl
	Omt0ZbAIC6eHw/VF6/F4iRFf3665LRb2/Kms6vlpWukOEsZadkaz5kkfuTdQQ3Uj
	h0OGvmA79kNvmQ8X/4/52pKsYTccri7UE8IDymrP+1dm8ybHJl1JpMGrpXjPdS6C
	7Pi08f0nF61KQTKBIMi7WLcKmOB52XAbNFhzqXtHewhOXOiJHIpMX9hdzpM2ZCQW
	YaL+3A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6v9ms0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:01:21 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85798977dcso4902398a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 22:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781154081; x=1781758881; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sDZBgmLDnN0ke8G/yPGmYz0zKi/JoSa4wNV1jrBM8aw=;
        b=CSgEgjK51otL+lY7Ub8hl/cSAgZ1nfgR93/WtZ8hJr3F7E9saz8YbHQ1gMgPUXdS6b
         Gg2/rLEbRHQbe6/bdUcj+pR/jmL2aLMduwllktAgyMhlGPKJbmZ6W+44eEke7HmXYsQQ
         /xtNCeKLvveVZMIIrbrQw2o//cl/u2BySxiaUxOU10EpwlpBZ7wL5OdykX96LzYGaXeO
         pYLvvrb7atLh6RozGt0i/9XJYFn+or+qfPHoKt0pnH0tL2s4+DYx2BRZZnzkc3L2tVXm
         mzSqENrQOs2ilGQOYgLoqXsrylFU3RJTCz+w0vwYwrjkXoY4pvD0BBJsa1tgb4AuLvDk
         YZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781154081; x=1781758881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sDZBgmLDnN0ke8G/yPGmYz0zKi/JoSa4wNV1jrBM8aw=;
        b=UXuNXvJdxyWMB4r3x2zx/jQGxJbw3olUFB9r6AJWam/c8kRNlCMW+/kqrFMF66UnQs
         DOYEyywTc2fqewBiSiwmr/OXs4trJHnhAwG9F9c4PLxBc+lwykb4tVrRkIT95zEzSKYh
         8jhayrohkhB5QRFgZ2OXqyYIIBkLUO4w8FYx9NowODbZnfMHBWMHmHTVfJlP66LmKNLA
         1OfLzifX1h2PQgjXCOnzNOktv6+JCYuMl/35VFpA9Oq3vZ60wHvOScFh7BzKkc0iQ3s2
         7JhabJydU+QKsrE35NpWvAdFnJtrebSaJpad4Dgwg/MeozaxApuLZ3WGJS+WpDW3qatP
         we2Q==
X-Gm-Message-State: AOJu0YxpyjWEZNZTThCkqFILokWwA9MhFhLixNCKLKJAAHqw+fCPoEdd
	JGEPTKlO1Q6HTmBMkaTMDkFyWhNcyVosdO+2Mz9C2BdQ7Gh0endgo1fmr1Daws/ONioikDhwFtV
	YBEWHhcidKDEc5NZYNzgqIvQtSNFeiND+T2zmQLj7muxSeR2DKIibCXUh5GP/loCnHy2fIrM/9l
	iK
X-Gm-Gg: Acq92OGzCN2fTjTtk/dGDdCFIyVvhBhGtpP04OOY2WBnCNfKydMG235fc9mr/SLz6r4
	jI0F1RN2ttV++Sh0/Sq2DfL7IyRVvOdGtpozKxWgkNKFOP5Fbfw3D6JB//o8WhIGYj5kMytMp5E
	Fki76GqRUjpixVE03k5Q8YBXeCo8pj7dwsJSYtIP/nOW2IYnp5QSVmunTtC7B4tjl4naYE9SMtf
	rqn9gRzu7StVdX6VCmAQdDaJZiqTVk1tNCHrCcuNPePgYasQjZ6OcST7hJ8Qspxg4plrzJ5hqPO
	/D01IXrPgbRsvt8b7ix+uEh0qO3QsHcwX1xmMPZT0XhNruOMeDn5b3Xs5KDaXT8EIXE9ZQ/TzL6
	Jj30XkslXeKHoakXrxEWOZ+YoyC8NjVGtAZVQb8WH/a9i0QZVAKwxWkTxy0JkPrC8kp0=
X-Received: by 2002:a17:903:1b68:b0:2c0:e7bb:9081 with SMTP id d9443c01a7336-2c2f40da30emr13207305ad.33.1781154080879;
        Wed, 10 Jun 2026 22:01:20 -0700 (PDT)
X-Received: by 2002:a17:903:1b68:b0:2c0:e7bb:9081 with SMTP id d9443c01a7336-2c2f40da30emr13207035ad.33.1781154080394;
        Wed, 10 Jun 2026 22:01:20 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.22.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:01:19 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:29:13 +0530
Subject: [PATCH v2 37/37] arm64: dts: qcom: msm8996: Move PCIe phy and
 GPIOs to root port node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-37-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153929; l=6223;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=EvwFjMdGg48XGE97lgHVA5dnyAPOTMD+iOwYzPm4FBM=;
 b=xxeB4yNR3tnG4KC40NUTsaGQZDOh3iVyYfhElkuhIIIRR/Yd40vNPdPMg1IYKlOmmnxM6LqZD
 A+1G/G3pKHFBsDAHdScI0c5CNu2yauigay8Z1qQYJ4Qw5WIPWkhqTFE
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: Q5KExKUYauTY9uyMM12F8wIQFc-sdrG5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX+3RDrcxY3Odr
 dm6a+iNP4v0IOVwM0lUU91PXeRpMyPkAqJxckVKlqEV9ZaMX/U7DufZKDdZJKts0tNn+cVIRZRe
 +SmktnzXuh5Lqpwcwq9MOP+uwnyldS8=
X-Proofpoint-GUID: Q5KExKUYauTY9uyMM12F8wIQFc-sdrG5
X-Authority-Analysis: v=2.4 cv=UsRT8ewB c=1 sm=1 tr=0 ts=6a2a4121 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=7SwbUlbDHKIDUUknu0oA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX5IH7vhR1GPPU
 J13WM9DOPjxEcagqjdLO0V6omOJ1uxsKmCBNsVE0Iou/XpX9bedOyEMRfVdDHbHYV3zSUnNxaRx
 TCr79bog3jJPQiVtuhxE5uIu1jIp3XhDIVk7N6l/VFaM65ZUqDvE58Vg/OZ/JZwtanVsovDJDzq
 +BUNjoQpPYDdLJAmDpmiexUy2kFaN16o4kU/TjFYEAl871taw1wu++zlqk2UGxgTqVOSnVuNn59
 sORIu8XNmGlmFNTFkt2VsdczwlZO/JTO/Ucsb3EuPWyOnuqusYKesR8rArGLdRdKiT09pES6rCo
 q3m203o6/y5tczdpQOjAaYOZQUwl0xYtJzkLTDojt6V17WVnQZPd1oimkWE1WM2zj+AbZ61M93C
 JYN3W5ot5XOeugDz36nWQQ2WzK9ev+9H8HqO/tUnQZjmeqIbctuU6joHStnGX8urxtzGQuncTa9
 DInmb1bUP706VpaqyZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110046
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112614-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krishna.chaitanya.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6FC7766E853

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys and phy-names from the controller to
pcie0_port0, pcie1_port0, and pcie2_port0, adding labels to these
nodes to allow board-level overrides. Move perst-gpios/wake-gpios
from the controller overrides to the respective port nodes in the
board files, renaming perst-gpios to reset-gpios to match the binding
used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi        | 15 ++++++++++++---
 .../arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi |  5 ++++-
 .../boot/dts/qcom/msm8996-sony-xperia-tone.dtsi     |  7 +++++--
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi |  4 +++-
 arch/arm64/boot/dts/qcom/msm8996.dtsi               | 21 +++++++++------------
 5 files changed, 33 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
index 0c076852b494..ad435a13ba24 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
@@ -458,23 +458,32 @@ hdmi_ddc_suspend: hdmi-ddc-suspend-state {
 
 &pcie0 {
 	status = "okay";
-	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
 	vddpe-3v3-supply = <&wlan_en>;
 	vdda-supply = <&vreg_l28a_0p925>;
 };
 
+&pcie0_port0 {
+	reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1 {
 	status = "okay";
-	perst-gpios = <&tlmm 130 GPIO_ACTIVE_LOW>;
 	vdda-supply = <&vreg_l28a_0p925>;
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 130 GPIO_ACTIVE_LOW>;
+};
+
 &pcie2 {
 	status = "okay";
-	perst-gpios = <&tlmm 114 GPIO_ACTIVE_LOW>;
 	vdda-supply = <&vreg_l28a_0p925>;
 };
 
+&pcie2_port0 {
+	reset-gpios = <&tlmm 114 GPIO_ACTIVE_LOW>;
+};
+
 &pcie_phy {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
index a4dcc88bb01f..7a3f8afae22d 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
@@ -210,12 +210,15 @@ &mss_pil {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
 	vddpe-3v3-supply = <&wlan_en>;
 	vdda-supply = <&vreg_l28a_0p925>;
 	status = "okay";
 };
 
+&pcie0_port0 {
+	reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
+};
+
 &pcie_phy {
 	vdda-phy-supply = <&vreg_l28a_0p925>;
 	vdda-pll-supply = <&vreg_l12a_1p8>;
diff --git a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
index 5b42c266557a..20b5eeef46e4 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
@@ -191,13 +191,16 @@ &mmcc {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
 	vddpe-3v3-supply = <&wlan_en>;
 	vdda-supply = <&pm8994_l28>;
 	status = "okay";
 };
 
+&pcie0_port0 {
+	reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
+};
+
 &pcie_phy {
 	vdda-phy-supply = <&pm8994_l28>;
 	vdda-pll-supply = <&pm8994_l12>;
diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
index 2abcc733dad8..3c70a9be45d2 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
@@ -278,8 +278,10 @@ &pcie0 {
 	/* Supplied by vdd_3v3, but choose wlan_en to drive enable pin high */
 	vddpe-3v3-supply = <&wlan_en>;
 	vdda-supply = <&vreg_l28a_0p925>;
+};
 
-	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
+&pcie0_port0 {
+	reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
 };
 
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 2f67e665996f..8db1448e5e61 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1900,9 +1900,6 @@ pcie0: pcie@600000 {
 				      <0x0c100000 0x100000>;
 				reg-names = "parf", "dbi", "elbi","config";
 
-				phys = <&pciephy_0>;
-				phy-names = "pciephy";
-
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges = <0x01000000 0x0 0x00000000 0x0c200000 0x0 0x100000>,
@@ -1951,7 +1948,7 @@ pcie0: pcie@600000 {
 						"bus_master",
 						"bus_slave";
 
-				pcie@0 {
+				pcie0_port0: pcie@0 {
 					device_type = "pci";
 					reg = <0x0 0x0 0x0 0x0 0x0>;
 					bus-range = <0x01 0xff>;
@@ -1959,6 +1956,8 @@ pcie@0 {
 					#address-cells = <3>;
 					#size-cells = <2>;
 					ranges;
+
+					phys = <&pciephy_0>;
 				};
 			};
 
@@ -1977,9 +1976,6 @@ pcie1: pcie@608000 {
 
 				reg-names = "parf", "dbi", "elbi","config";
 
-				phys = <&pciephy_1>;
-				phy-names = "pciephy";
-
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges = <0x01000000 0x0 0x00000000 0x0d200000 0x0 0x100000>,
@@ -2028,7 +2024,7 @@ pcie1: pcie@608000 {
 						"bus_master",
 						"bus_slave";
 
-				pcie@0 {
+				pcie1_port0: pcie@0 {
 					device_type = "pci";
 					reg = <0x0 0x0 0x0 0x0 0x0>;
 					bus-range = <0x01 0xff>;
@@ -2036,6 +2032,8 @@ pcie@0 {
 					#address-cells = <3>;
 					#size-cells = <2>;
 					ranges;
+
+					phys = <&pciephy_1>;
 				};
 			};
 
@@ -2052,9 +2050,6 @@ pcie2: pcie@610000 {
 
 				reg-names = "parf", "dbi", "elbi","config";
 
-				phys = <&pciephy_2>;
-				phy-names = "pciephy";
-
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges = <0x01000000 0x0 0x00000000 0x0e200000 0x0 0x100000>,
@@ -2102,7 +2097,7 @@ pcie2: pcie@610000 {
 						"bus_master",
 						"bus_slave";
 
-				pcie@0 {
+				pcie2_port0: pcie@0 {
 					device_type = "pci";
 					reg = <0x0 0x0 0x0 0x0 0x0>;
 					bus-range = <0x01 0xff>;
@@ -2110,6 +2105,8 @@ pcie@0 {
 					#address-cells = <3>;
 					#size-cells = <2>;
 					ranges;
+
+					phys = <&pciephy_2>;
 				};
 			};
 		};

-- 
2.34.1


