Return-Path: <linux-arm-msm+bounces-109775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKwuHSV8FWpEVwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 12:55:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 764555D4732
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 12:55:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E5C0E3009F09
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 10:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F33E33DE45A;
	Tue, 26 May 2026 10:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S1rINjwh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QWkJKKVU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8949D3DE432
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779792914; cv=none; b=byxYvk+j46QWdije0PjS0isMjGn8nlrfQXh0lDUqGasC66EXg6TSxPdzhIOKhC/WdD7nn2agsKpMrXor8z6O0CXdOJu1BwOmprNX6TPhbYn2YFcLrbXl5soUR9+vPqalFeiID/acTFNo7Esv3ugXHeH1Z3kAd/pBc15JGW7npB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779792914; c=relaxed/simple;
	bh=6TgYj7+dyLuIGqcjmPQ6fsYhukq9jZmJafzRBNpGCqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=glTTtOqIzev67LgFA1slxr/U0nV3E4/vLAll3PQOHGC41a5L/lxOGcF0JKDlEsGbq2Z8KC2lVVrbbWTbHNb53kO8EMTXfYytzUMwJd1TvKTxrIFBZyDJWOTuIhdCPD15zYPhyFDmGGhvorOQpSqp0W5fHDgExCedJWNDD5ZCBAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S1rINjwh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QWkJKKVU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q8ss1n3658101
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:55:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pt0vmTRSBM+lg6Dqvgsk9yG/MKi2Q7e3NXM/rFuGUBA=; b=S1rINjwhqck+W2zb
	t946tF8ADvzN3/JVdjKEKlkPH1Oym7lSb6b8s/LTnMg44FccOYWXS66C2JTDpnug
	FTWnG8rn7Dy/9eGVLpxksncYU6hZ5Uc7C5pDJ5Php03Y9s34YjtgNypGmtm1mXeX
	N7GCDw3CMhOjx33KqY4Oir7jw+v57C0LmMaSIkWgQE0ihBxKpKxRhqC9vw5LHZoP
	g6G+Em7vD2pjXPYxbVvVVvhjh+31daR0h6otEj4DW0c/ztx0gqT5sT/ve4pqbxje
	Ph4GHH03LSauFtZwPUDmPWtCxJzE5ROvb2cIwKxd9txCw5GoNtX7k1HaqrkfLG8x
	H/6bgA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqynbegw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:55:10 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba268cb5e6so110348125ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 03:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779792909; x=1780397709; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pt0vmTRSBM+lg6Dqvgsk9yG/MKi2Q7e3NXM/rFuGUBA=;
        b=QWkJKKVUbOrBjvAZCV7PhtsxDhfZJ1r4ILGaez0pCjNtwmo4uqtkQNRY94dcB6Z1LC
         ghsbQMdgKuWLN+gaEb9MZKEXJXZIFTyhKvLsPAT2ijnySGu1wSYNn57gRe0SyzXHEA2e
         1En+QAjo0s3eYYBTfZk4E2ebuQBaqpmb9I1SYRKcbt/S4shhikjMexBX53nFMImZKgfK
         COED+XRQ94crpMelsIl7btsnLtZS1RJxZk7AhMGbn07vCxFQvc9lD6H4QtBTRnbZ1jyX
         PYKhIVrkwBTW2Ph/NfP1P7EijIVPU5LBZh7wG5UA8i3QMadp5JR/Te7vow49uIUO4zgq
         vHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779792909; x=1780397709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pt0vmTRSBM+lg6Dqvgsk9yG/MKi2Q7e3NXM/rFuGUBA=;
        b=XHxrOxIUa0n0r268/VS5YxlVgAw6PXELReEpbqqyIKmG9vxL0rEBLsaJ3j13YJfb6n
         glsjWfuRIGBDsR0J4M1uWU0WJdH4izMssxuJk4RXlYd9FZZF8XmBdJ3Pq1oQkf4y1Ozt
         ssNph6F8/qGbd9EBj0/KAKxcCxEv1coTnWdGeZ8CTY8SgO8s6o019XxndIUAfYZ8meQy
         6sq25bxQJTIc276DRqBL2u0A6a4YX273UBghLk4EAmxuuWrylPhSa/4f0DmXej6t3/nY
         zT2tHci7J8PW0ZJ4+w1SP8O/apGUdWoU1XeWQ8MasFipqLpLLt5MTtZbjUY3nmxthbbY
         kMpA==
X-Gm-Message-State: AOJu0YyexlbTlWpNjrmflG06QGv3yK1FkcvGek+6iXrV5bKLzuwaRXFN
	k+t4sT2aYOEJqBCgmjuRwvuOAivvWH0JOIM9tuRPZLQWpTnK9js7XNPssQZin6f+ufkZeurL2yN
	ye1C5fHrlUFGrtO24SRKJmsJoM+r3LLbUKO3+b0ztc4ebvcsaAaNQpfTI7RqjI4h0/8DH
X-Gm-Gg: Acq92OFDt3i0Ut0fTOWMoC8jDvhCJH1Uq4LIj61cG7FOVISuzNnT9xV8st4Ka4ELfzm
	OrNBiLeqx55VGojczqdDGxlsFxTUVCxi4hRjndI6sXfs150GkaQbrxb26oYEvsl8rOUmGdyc5mx
	/40HHlgh5Dstb8/OYuUYJMNJTg4xSQBYwCAXhjO8mc+GyPjpaTLuaiY7OGmo22IN7U179vde6dM
	SuFAsYaZf45z0hy6lnUPtRebYgto+kvPikzc/lc/8kRzcoB4QmSVUQxsnznZczY/Jek+0kuqrMZ
	cyX9ZEEFNUy1A3YvK5dfr9xbxR1dHHzrf8muBFHcWsZMHLpiMu/IwsSQ0aEGdNFk63FiBzJy+Gj
	LYD0TdrdThnsV/wmJnec2WidjDgOVRrbusZ/vdIRyp8rGZcF8MA==
X-Received: by 2002:a17:903:11c4:b0:2be:260a:592e with SMTP id d9443c01a7336-2beb031b1e9mr185119235ad.1.1779792908865;
        Tue, 26 May 2026 03:55:08 -0700 (PDT)
X-Received: by 2002:a17:903:11c4:b0:2be:260a:592e with SMTP id d9443c01a7336-2beb031b1e9mr185118915ad.1.1779792908325;
        Tue, 26 May 2026 03:55:08 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f3dsm120890025ad.1.2026.05.26.03.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 03:55:08 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 26 May 2026 16:24:38 +0530
Subject: [PATCH v2 2/8] irqchip/qcom-pdc: Move all statics to struct
 pdc_desc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-hamoa_pdc-v2-2-f6857af1ce91@oss.qualcomm.com>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
In-Reply-To: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779792895; l=5857;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=6TgYj7+dyLuIGqcjmPQ6fsYhukq9jZmJafzRBNpGCqo=;
 b=s76XvN6hm8Y9E8EBxBW3yr15X1UPzOSODhA5c2WN2Of44hD/909hT7VacYqz7DPVY47Vf7q0M
 Q6U8T5c/QmNAGVkUqTPpax/Ctem6l8BHUrN0uUtjFoTTBxXsSRfFCca
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=Wpwb99fv c=1 sm=1 tr=0 ts=6a157c0e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Oluqblcdbwt1IXVhtU8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: veO3gA0jGSVTMB-rq-SmyaglJRN9FqCl
X-Proofpoint-ORIG-GUID: veO3gA0jGSVTMB-rq-SmyaglJRN9FqCl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA5NSBTYWx0ZWRfX2ODLmZbw/CRd
 CzDK2vkNpXsY5BFEn/92Rv9BaoqPFlfhF8fy8OD3RelZbVsbF0Q9kJa76LP2hNhuGVl4ZhmZbYa
 YgtFbo4jbNdsfpHSfOncCES8o2s248pfOUgBaiiOi1hrQADP7ThPciUiWC/4zhvUXiHfPUr64cX
 iEv/vbvOWcMpkgNfUPNZhOkKmo5M7XFqt44iJRbWl1VxwZ/RkRY6pi3lFTGgF8bV+CnBMAadPN1
 LvQNIdrt+XMLRSmxbhgdlVANQTwoAOrGZPy18tDIsxvpJo1XkITZWheKK38z0mMJEFDOEopSeY2
 tZnaclqX+jo6Am0wl8Pxrnm+kxxQ9r8aD4C0jN3BGR4sZM+PktVwR8/NqBom6zrHNym9Weq7lq2
 ioGSoGwu4CvmuoTWt91H2ZBpkF5MBg1t5NyxsLMLlRE3/yw+uiZlFsAe8UdEIBuAuMjr7pF4wjd
 hZ5r/rY+gYHH9h7U8Hw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260095
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-109775-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 764555D4732
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There are multiple statics used. Move all to struct pdc_desc to better
align with versioning support. Document them.

No functional impact.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/irqchip/qcom-pdc.c | 68 +++++++++++++++++++++++++++-------------------
 1 file changed, 40 insertions(+), 28 deletions(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index c5b64649b2a9..8f7802139e4e 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -92,15 +92,30 @@ struct pdc_cfg {
  * @base:           PDC base register for DRV2 / HLOS
  * @prev_base:      PDC DRV1 base, applicable only for x1e RTL bug.
  * @version:        PDC version
+ * @region:         PDC interrupt continuous range
+ * @region_cnt:     Total PDC ranges
+ * @x1e_quirk:      x1e H/W Bug handling
+ * @lock:           lock for IRQ_ENABLE_BANK protection
  * @regs:           PDC regs (IRQ_ENABLE_BANK and IRQ_CFG)
  * @cfg:            bit masks within for IRQ_CFG reg
+ * @enable_intr:    pointer to enable function based on PDC version
  */
 struct pdc_desc {
 	void __iomem *base;
 	void __iomem *prev_base;
 	u32 version;
+
+	struct pdc_pin_region *region;
+	int region_cnt;
+
+	bool x1e_quirk;
+
+	raw_spinlock_t lock;
+
 	const struct pdc_regs *regs;
 	const struct pdc_cfg *cfg;
+
+	void (*enable_intr)(int pin_out, bool on);
 };
 
 static const struct pdc_regs pdc_v3_2 = {
@@ -138,11 +153,6 @@ struct pdc_pin_region {
 
 #define pin_to_hwirq(r, p)	((r)->parent_base + (p) - (r)->pin_base)
 
-static DEFINE_RAW_SPINLOCK(pdc_lock);
-static struct pdc_pin_region *pdc_region;
-static int pdc_region_cnt;
-static void (*__pdc_enable_intr)(int pin_out, bool on);
-static bool pdc_x1e_quirk;
 static struct pdc_desc *pdc;
 
 static void pdc_base_reg_write(void __iomem *base, int reg, u32 i, u32 val)
@@ -199,7 +209,7 @@ static void pdc_enable_intr_bank(int pin_out, bool on)
 	enable = pdc_reg_read(pdc->regs->irq_en_reg, index);
 	__assign_bit(mask, &enable, on);
 
-	if (pdc_x1e_quirk)
+	if (pdc->x1e_quirk)
 		pdc_x1e_irq_enable_write(index, enable);
 	else
 		pdc_reg_write(pdc->regs->irq_en_reg, index, enable);
@@ -221,9 +231,9 @@ static void pdc_enable_intr(struct irq_data *d, bool on)
 {
 	unsigned long flags;
 
-	raw_spin_lock_irqsave(&pdc_lock, flags);
-	__pdc_enable_intr(d->hwirq, on);
-	raw_spin_unlock_irqrestore(&pdc_lock, flags);
+	raw_spin_lock_irqsave(&pdc->lock, flags);
+	pdc->enable_intr(d->hwirq, on);
+	raw_spin_unlock_irqrestore(&pdc->lock, flags);
 }
 
 static void qcom_pdc_gic_disable(struct irq_data *d)
@@ -348,10 +358,10 @@ static struct pdc_pin_region *get_pin_region(int pin)
 {
 	int i;
 
-	for (i = 0; i < pdc_region_cnt; i++) {
-		if (pin >= pdc_region[i].pin_base &&
-		    pin < pdc_region[i].pin_base + pdc_region[i].cnt)
-			return &pdc_region[i];
+	for (i = 0; i < pdc->region_cnt; i++) {
+		if (pin >= pdc->region[i].pin_base &&
+		    pin < pdc->region[i].pin_base + pdc->region[i].cnt)
+			return &pdc->region[i];
 	}
 
 	return NULL;
@@ -413,32 +423,32 @@ static int pdc_setup_pin_mapping(struct device_node *np)
 	if (n <= 0 || n % 3)
 		return -EINVAL;
 
-	pdc_region_cnt = n / 3;
-	pdc_region = kzalloc_objs(*pdc_region, pdc_region_cnt);
-	if (!pdc_region) {
-		pdc_region_cnt = 0;
+	pdc->region_cnt = n / 3;
+	pdc->region = kzalloc_objs(*pdc->region, pdc->region_cnt);
+	if (!pdc->region) {
+		pdc->region_cnt = 0;
 		return -ENOMEM;
 	}
 
-	for (n = 0; n < pdc_region_cnt; n++) {
+	for (n = 0; n < pdc->region_cnt; n++) {
 		ret = of_property_read_u32_index(np, "qcom,pdc-ranges",
 						 n * 3 + 0,
-						 &pdc_region[n].pin_base);
+						 &pdc->region[n].pin_base);
 		if (ret)
 			return ret;
 		ret = of_property_read_u32_index(np, "qcom,pdc-ranges",
 						 n * 3 + 1,
-						 &pdc_region[n].parent_base);
+						 &pdc->region[n].parent_base);
 		if (ret)
 			return ret;
 		ret = of_property_read_u32_index(np, "qcom,pdc-ranges",
 						 n * 3 + 2,
-						 &pdc_region[n].cnt);
+						 &pdc->region[n].cnt);
 		if (ret)
 			return ret;
 
-		for (i = 0; i < pdc_region[n].cnt; i++)
-			__pdc_enable_intr(i + pdc_region[n].pin_base, 0);
+		for (i = 0; i < pdc->region[n].cnt; i++)
+			pdc->enable_intr(i + pdc->region[n].pin_base, 0);
 	}
 
 	return 0;
@@ -477,16 +487,16 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 	if (pdc->version >= PDC_VERSION_3_2) {
 		pdc->cfg = &pdc_cfg_v3_2;
 		pdc->regs = &pdc_v3_2;
-		__pdc_enable_intr = pdc_enable_intr_cfg;
+		pdc->enable_intr = pdc_enable_intr_cfg;
 	} else if (pdc->version < PDC_VERSION_3_2 &&
 		   pdc->version >= PDC_VERSION_3_0) {
 		pdc->cfg = &pdc_cfg_v3_0;
 		pdc->regs = &pdc_v3_0;
-		__pdc_enable_intr = pdc_enable_intr_bank;
+		pdc->enable_intr = pdc_enable_intr_bank;
 	} else {
 		pdc->cfg = &pdc_cfg_v2_7;
 		pdc->regs = &pdc_v2_7;
-		__pdc_enable_intr = pdc_enable_intr_bank;
+		pdc->enable_intr = pdc_enable_intr_bank;
 	}
 
 	/*
@@ -506,7 +516,7 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 			goto fail;
 		}
 
-		pdc_x1e_quirk = true;
+		pdc->x1e_quirk = true;
 	}
 
 	parent_domain = irq_find_host(parent);
@@ -522,6 +532,8 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 		goto fail;
 	}
 
+	raw_spin_lock_init(&pdc->lock);
+
 	pdc_domain = irq_domain_create_hierarchy(parent_domain,
 					IRQ_DOMAIN_FLAG_QCOM_PDC_WAKEUP,
 					PDC_MAX_IRQS,
@@ -538,7 +550,7 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 	return 0;
 
 fail:
-	kfree(pdc_region);
+	kfree(pdc->region);
 	iounmap(pdc->base);
 	iounmap(pdc->prev_base);
 	kfree(pdc);

-- 
2.43.0


