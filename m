Return-Path: <linux-arm-msm+bounces-100290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FhrIKx0xmlFKgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 13:14:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE373440AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 13:14:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 35560302DDE7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 12:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADB1F394477;
	Fri, 27 Mar 2026 12:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b/1V81IR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dyzTlwFM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58397396591
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774613640; cv=none; b=HuxmMtwfr6iH3SkaUcpxlwgAftJ02lPo2LS+CCfHX/fL4fIiSijwu34+QvmWyQjzlml9c8fb3HuAEUhvy1E7C8cxXY9Q96IMdgaIS3aYnEnpKpEFKG91oCe68iXucPOudSC9yXkcAlO7WU8bQtlPFF6L2nQ2qnGPDyyybdWZXOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774613640; c=relaxed/simple;
	bh=YNvTTlq5vkItMcCXQuT/uFo51kQdpZLWjEa5KRc3EX8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PslgAzcOpObvr4gloYQRcZTYPIaWGYuwJCX+c/jnpb2d7WltadE85EcqxsvAfWmjlMGAjAbP9NsKLHfTGoX+pgxaRzU+tGTqmzoJL8jqBG8lv+8PySGF0Y3AiY4fw1BYAn+uGx95PI5JXi8uWog3MqX0U4EdnX3d9eS3m+TEKw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b/1V81IR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dyzTlwFM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vnqa3713728
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:13:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J/Y8f9F8d6MnzN/Ao8fr1u/+8/IhBITpA4ZYwD8uZcQ=; b=b/1V81IRWGnsnJZA
	t9AB9AsGUNbWiutAFbSeh5T5AaHXTl2KezMJhRxLc+TQd1NyYCexK/rBeaKlx1Tg
	2Rc4wfSm3GQVut3Yjjv7BLAZne/feGjv7C3px3ZMjn+fMTraitSsMwByzM54uJJu
	hAL9mD4CMPDj/Ev1ttGFXyy2MqO0UjHg0/P6wBSLKqltqkc2NJV2Y0R7jUJvqVI4
	gJXDpC9LYpxbKRnjFkD96Pzke7WY+mDNAFxlDlL7xJsw3rHWu4DtpjSmfs6ziDLJ
	0aMGwaEzQXt2f68xgJpbOyuAyJ91z9URFNfTZdT1dCAhbQjowXniZdvr50s/iV78
	rfssMg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5hapt105-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:13:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50911c94db1so47893061cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 05:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774613638; x=1775218438; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J/Y8f9F8d6MnzN/Ao8fr1u/+8/IhBITpA4ZYwD8uZcQ=;
        b=dyzTlwFMLClHDs/i5FqVjCIof613ZQC2suzDkjGjv0Dvl7Zcy5B1Msr9nayDNkiBkN
         kdAo4SxuwUN8U+I1yn259S7+5AhX5jpiNJSLxRoF9X3r9aCDCMm6lOWr7wzlcq1QHuJT
         fF+8/TtbuUgRu5w4cfRjXOGPCIQtzvHdwrbL4GFzk0tO5p38d7u2l23KnB0zsQocpNGd
         /K+sUu6rT86QnncLrfoyXNTRiEuWBIE+djGPlmuSoqKI69D+pk7HqrbZTnR2sLAtoMLp
         mtf6zMzvM9Q0iB5GmJv7yH+4j3s126xtxWfSfg+3Ovy/una8reifEkRzbEqNciGx8RpZ
         xBoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774613638; x=1775218438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J/Y8f9F8d6MnzN/Ao8fr1u/+8/IhBITpA4ZYwD8uZcQ=;
        b=StGxvbq6fZArhbZh+BMTa+u1Y5l72HRkyFlZRXxZGlc4II2WXK3uRO61v1CGqKHlWC
         sS4C/KUrbtNsjXI3XAfzf4XWLIH+sBsxBGVHy4xRkrXZg9AXJDrEzRqfYY+MgSUJ0SqL
         zFpuCDKt1f9DGqObI6lRcg9HK/o2Ch51xeib/BkFTBre0+LEW2bN+ByX/GuwaJ3hVtUi
         MAnLyVIoqMoqTPwEvSHzMCyqQ40vJSbztdt8ao8KDB8kBgPKPdxCtLCceYtbdjCvuPQf
         XlT8RgrUfoEXrw8Bb/KFjn1yIici5tv4L3PhfipkiMdX3es4q+P0hR4CWXctJG7IzJ/3
         rlXg==
X-Forwarded-Encrypted: i=1; AJvYcCWdASvDHQrakxyjh7TK9DkwjLG/jBTJ5fqrdRRF0/64Mh2l7RV8bG0PnVntBo2oeinK5gfBB+BtV8Nv4XbL@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0qAkKLedGY5g5cGWfGHbIOtcbDhFslmO5T3YEfdME/rtRk7GG
	UQqjLsuZF8TnMHxXhpw7xPzR25v1kNOy+5jyEoYBmM3FgCWM5Ae5hmQT4SHKsxS/O/8/30iz1vq
	MSTJ1N8eI4tOC9OeXeyvs3rWDoeDeIjz/AOtD2uBmvN5uzzUG+ulKd8kYRyLjRfQ1UAMR
X-Gm-Gg: ATEYQzwCUjAeRUvfHPkW0a27/KNQPvmZGmbkbDS/CLwJL9U9ahbZqCgPIPjVmxbREjZ
	5A43rp+g0gYrg7QeOdxf1DlQlZPrzHSYpklpeHwatgeTukA+0xT5YejPbe4fAHl5jLhmlcmoLjc
	ujlRP/C3WsBK8gl+GDWAJc9GVvoT+Ou2XmFfYw5NzoY0I1R3ejiI27HHtDZL+D94yauodAERdPV
	bSm0Q2fFyC4aUM7QIlo0AnIA58W8QY3jo7S3lYIHkoEf+gk4z0tfUM76r1UX2EboslkhaOqZfyW
	7Ho26r0UxSwSkTas1yBnLXZH5+paf4WlJGeoV4FFFV0FPl1EcNd87/FRDdZV6OUdCHerzJaCJym
	HdyQHyEn/3nXPm0DFO9MmMrfrC38=
X-Received: by 2002:ac8:5a11:0:b0:509:379b:d4d with SMTP id d75a77b69052e-50ba38167b2mr29836701cf.16.1774613637576;
        Fri, 27 Mar 2026 05:13:57 -0700 (PDT)
X-Received: by 2002:ac8:5a11:0:b0:509:379b:d4d with SMTP id d75a77b69052e-50ba38167b2mr29835971cf.16.1774613636981;
        Fri, 27 Mar 2026 05:13:56 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919dfb54sm14647927f8f.31.2026.03.27.05.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 05:13:56 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 14:13:41 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: milos: Add missing CX power domain
 to GCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-dt-fix-milos-eliza-gcc-power-domains-v1-2-f14a22c73fe9@oss.qualcomm.com>
References: <20260327-dt-fix-milos-eliza-gcc-power-domains-v1-0-f14a22c73fe9@oss.qualcomm.com>
In-Reply-To: <20260327-dt-fix-milos-eliza-gcc-power-domains-v1-0-f14a22c73fe9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=961;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=YNvTTlq5vkItMcCXQuT/uFo51kQdpZLWjEa5KRc3EX8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpxnR98TaIEjadrLY9rnUrxzDBIaaL9n1HGicPN
 vMidT85z7eJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacZ0fQAKCRAbX0TJAJUV
 VmBtEAC571rd92jiixNzGpJXLBv8Vm2mj7oP0cUrkFmL6UYiQEtY6k1BoujNMd9BMUyC/AMPy5m
 6U/weKeNXL0Bo7HQdV/J/8RYw/911bA3nqzQYGKswzP7nxTUneiGLExshnN+jbw8fGe2DgsxyIq
 cC+BNvjDOUS6RpwcyckvUGeQ6U5oyRysz4NH+9EfhalL/vZgKThhVG7J7Xrb676CJZRjTtrKvsG
 lesqf3PUmmR7vMv5Nu4kcRoni4bba3KGl/4V18VPNqIHQxIWnT4GZBrmXOd7NEhoPBhWN6O0HF1
 7ZQW+wFL17KF597rCSvvOwmuKG6eGSIIrUTzOwtsXWqPqUawKF1bxglXEg4AVX+4HG8qZMKyTZ9
 vuRSALNBqtyS44PyHnu6ApWLtZW1XMINHld1t2uwxHNSfPG9s3qnCJsECqL2LtsZDzduJq8sjMn
 GbE7FGAsennCCKUVd/sPD3I/CmNADzXRvcNsznpRetnxds+VJ3eIMzzFrwHEfCrWqeU8K2HMyZy
 d6jQMPCdBYJBi8qG6FCFPvOpBbCx5gLkE7aXDJ+ouCNV/+6T55mFPwW685k4kcpVI4Vp1GYlmqg
 Ufw5lg1crCl7le5uq+T4T5s524REHG+14uZ97Xawv8yB1PgoQRwVGNZKw7ei1oIJ0u8mAqQmQQd
 Acq4TKSyiWdYCRg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=TqnrRTXh c=1 sm=1 tr=0 ts=69c67486 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=yTESgr66MHD1aPHvgagA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA4MyBTYWx0ZWRfX4FdIompCu1B4
 ZrZ4baynGTVgNfNmV45cWEb/QkV7TljILVnzVyxX6uNXZ/LwWwtctWZS/dPPtbN0qQsMBNPlbrR
 MD4PSd2yIboQooYRBI/MCsN0ZpQYXnHxEzdSm8pwLaMWB/9isJRW4X88kaRPVAnykpF4TNDNkvq
 +drEf9ShXtyoRzBkTH1B8AyE+a1jKao8J35xkfesbwD0nyj7lMmVNLeeN+5uWG8QiBaooHhA7N1
 YrT5vpVXmlAlUqw8euRt/ig2Equ+BIYfkCZF+oomdSZ+vuQkSOq4bMmoF2u+jBrpsGt3VGrscUC
 El8oT6O8vaFgS4mMYW04RvsnYSqrb2Yd+vCCTIFlbzgCpwsOdFq5Av5eO5bBaJQUaTsj/dEvatN
 ZnYvG85VrGt235F3LX9OwXO98pOLLh6MdwSxYeDTkaNhGhHEei5F5XUml7q7jYeTvLeWk/Fv9hv
 s1o3RjL2QYdEQHHN9Ig==
X-Proofpoint-GUID: 5rUsm5ZByKJK8yJ9rVc8xf1HamSXsCrD
X-Proofpoint-ORIG-GUID: 5rUsm5ZByKJK8yJ9rVc8xf1HamSXsCrD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270083
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100290-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,0.1.134.160:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ABE373440AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Unless CX is declared as the power-domain of GCC, votes (power and
performance) on the GDSCs it provides will not propagate to the CX,
which might result in under-voltage conditions.

Add the missing power-domains property to associate GCC with RPMHPD_CX.

Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 67f8ef4d524a..eec82a69ddc2 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -804,6 +804,8 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 2>,
 				 <0>; /* usb3_phy_wrapper_gcc_usb30_pipe_clk */
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.48.1


