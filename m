Return-Path: <linux-arm-msm+bounces-107415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJPbF0TABGoeNgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 20:17:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3499538C20
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 20:17:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 704EC309DC7B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 18:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 511674E3796;
	Wed, 13 May 2026 18:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HdpOtto+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OUyY7Sfn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B857F4E378F
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778696058; cv=none; b=SqgLyC8qj/0AN0EPErKztIlUrZ6+RsRBuvufhGLg5Sjabi43oMr9iJMGG8GmHOeTQFSc/U1ploBAZime7CpxVzC7Rr/OUqFoCrFeP9pLVZrx9Yk3MN5X9Be2vTnX7KLzSSgFfXqex20a+B6C1ki8ThVWlfihF9iRPSHQ63UpioM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778696058; c=relaxed/simple;
	bh=utaWKPqMFCAQ6A3D9lUtcp1dz1XaesiuCD80PEH5ikM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=COl1AaE6HEbGPhZDG1Icm5FecCj0w8MTU8BxcvQ10eUjNvgfErvV2UQm2vkthFW/GasKkHeKsfexBMmjnDdqou/cBPmmwrUTw9dfAipBvFs3GGIHiqFrIl5RqPKlDTPshbEBxdkxpvw/sQcLX8vEyWUD4l8bL/WyRiy1Uh16vSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HdpOtto+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OUyY7Sfn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DFdtDe1242989
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:14:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/rxOjF0YX/LqRk0erNH1VM1reWsG38dZ2KsYX/zC7SQ=; b=HdpOtto+23WHnld5
	m9XsZSf8vjqIqTFx8IKn6RUtD7/lsk+4EKewrWV6rnrS7L1hI2vSiygETvsvEngB
	MlR9inW+DbF7P+L5pldV147XYKVHXEJQPLscb60CDKVozMPwk/72DZ4rMNipITRD
	gqJubpp85cAnD1FnvAWVm018jiVRJDNdwq/701YVPr3B6ezbb+VlMdhw1B7GV20K
	32N1kSE47y25NB0KPnmOORDanknYymTFonQ0VMCk7l/aal5lbLw545PxL+WNYFKk
	wzIbgR/ILhzLPQAl6Glv38U3cs5eBNATc+y/Vu9lvc4i0U6gl7x9AuKkMlIVDxUY
	nr3J9g==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4v4trkqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:14:15 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95f7fcf4f37so2986735241.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778696055; x=1779300855; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/rxOjF0YX/LqRk0erNH1VM1reWsG38dZ2KsYX/zC7SQ=;
        b=OUyY7Sfnq53MD+agSnijVGHXPtxyXLJc/8sV3uhV84hmvarUi7+HsYfk81iTJ3AuxK
         9+VWlzjqX9Eic+1Jr7mrMMF0aduFxGzNmh4KTf79CPEU5qOr6gGsI2HtvMzjoYqpHLsu
         RmcpAfj1HqdOa9WmwQbrOybhb5ZC/v88p29VsPdo6/glaWoq9l+MqU+0fm1m08TMDoR3
         EDNu8wsQWPhcPLYRWpQSSZFWjNMoNK072s2eNe5y5BC/ydXLWSpSCyV2w7+wDW06U9eQ
         hswgVQqsZoZcl7VBgcIcCSndCwREMfO24k0doyH1VmhE9ppWszY4+7uvKFFnmihJUKtP
         4LVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778696055; x=1779300855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/rxOjF0YX/LqRk0erNH1VM1reWsG38dZ2KsYX/zC7SQ=;
        b=Eqa9kZx8PSKruQ+lB3axn2jzEOzQ+b6/c+hYvyKcPdM5SKj1RgttIQRaXMsmygJtLK
         /Xe0uS7ALI0EZ6uOKcMWKoWF1zTa0kCsbyfoO01CFspot+H9txaIsRs9rUFkJg2r7M1W
         dgUpWSjpyjp1ZoUDd4bUi2lFtit0jbLqKn5QHhBLd4cVBuxOog5B4rus+MIO6HBmSTzT
         IHt1SPZKRw2kMqfaXQLFTVTIxga9skxCT6HmtTopTlfUpy4PcadPiBOL+idFcEAj3Ywh
         HS08EimsV5E/UniafLXFJxMyST1/d9itPYL+6ArnLCbEOOjo1Vs9spnZL55BbFleB4CH
         RpoQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ReUVNfDWxiQ3vJ2iqAIcGW/oLyeWYK8WkdNwYG/8pUqZPh+bF7VdIFEbrEPnmqNFQhJ1z95fBQaxJX1jH@vger.kernel.org
X-Gm-Message-State: AOJu0YzAUG6/DIDm3SpWWdMtJ1xnGSNwsaGDWBsSUL4uDyqsrAu7pQ1m
	/TjWQg1I8fDdQZ21jPGPV4eh5rtsMWdxSE1AFvyfzXTalOqpaZYH1gS49m0/jHBYDLTC9dW3KLZ
	f5wcmIx492z+8uo6XlwBYcVK97q9SrDzGuuLqWmwRiejg+ArjM/a42x9YxpLh0rSOEE/V
X-Gm-Gg: Acq92OEqQqd318dGuGD2by/SnipE7z908hg+2GsqRlTVcc1uG/n5UWvGrKf/jw1u4gH
	hJoK5RczPN1cPKnb+cpnu0iXXwBDnCcED+FipbXwYLHwfdVZhVYFvQV9vO1l2Ovy8/N4wn+CCsA
	K4RVJAOh9wP7bsVuu8PSBT9hoB1xI8Imoor0pWw1U3iqLQPRDMOXLDMwVyiuvS3WVscGOmWEE/A
	d5ATcmn13tQpxT58jpzA1EVcvysZdUskUNrUGnaFPZc9Qc5D7hsXT5gcMIOQH6FMrrXyFzj/qd+
	UEL+OpLcHei5AXjqb39Y7+RcHXK/WQk6e6hV7WzB9jnc8vP4wW/nHtG09tWVHzVEKrJM/3BbGBL
	dEtjDu1I208Kkdak5EFj+DsWrQZKH34oyqJDbKwyA4sS4IK4jiADWD5ivsWWo1ZTbds7vef6RKg
	nAXofwJfJ7kb2kiyeByZC19Teb7qMkCPCspWo=
X-Received: by 2002:a05:6102:3e0b:b0:637:ad7:f57 with SMTP id ada2fe7eead31-637aaa5a6f5mr2136045137.25.1778696054972;
        Wed, 13 May 2026 11:14:14 -0700 (PDT)
X-Received: by 2002:a05:6102:3e0b:b0:637:ad7:f57 with SMTP id ada2fe7eead31-637aaa5a6f5mr2136024137.25.1778696054522;
        Wed, 13 May 2026 11:14:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8bd7d8974sm3174770e87.64.2026.05.13.11.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:14:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 21:14:07 +0300
Subject: [PATCH v9 4/5] phy: qcom-uniphy: add more registers from display
 PHYs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-fd-hdmi-phy-v9-4-ca98c72f1f9f@oss.qualcomm.com>
References: <20260513-fd-hdmi-phy-v9-0-ca98c72f1f9f@oss.qualcomm.com>
In-Reply-To: <20260513-fd-hdmi-phy-v9-0-ca98c72f1f9f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-phy@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2924;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=zXUnJKheGLXFIh2NeGjJnci3b8qeGjvnWTuieLLb4mc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBL9t68jSUNFaly1KX3iQ5b/7/WNJg90DoXXSF
 URoUFQz3aeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagS/bQAKCRCLPIo+Aiko
 1XUfB/wIlFw2c2IYwvDoS2FUSiaPjh3z/fuDn6ICL4Z65bKcyRXkqDKfFscu81X085BbcVczwkG
 kqiPpIT6gYmKtUbpCWMcpxMDhYNoE1WJEsoHg0S1piUbeqJBMSPMFfUZ6Irt9QaaG7i202FYTBU
 pcncuJXwDLEajYKKk7GNdK59AJM3sxwWaGzfpV76nZtBxz+BTyrSmhKr7rQ+FBe00+cRsPyu8mh
 mUkZOSBrAIjAUDzsjIr0S5mYaSBBrmTv+T/cjOiGqTbi+mJeXwY6LTQxxtT92n4xrVdU+HX6A9p
 leqYJo7jpCehRzYwoyxal9cQ8KwoBxEoWKpiIeR90o6AqMX4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=XIIAjwhE c=1 sm=1 tr=0 ts=6a04bf77 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=NWzoLV28igjY6Ppe7YgA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4MiBTYWx0ZWRfXwwmYmuAXfKtp
 6qA5e5nveUN2kjkKjKlRJVg3E/vSpR3AN050/GlmCDPXYzlzcOFYWwkT8cwkqvHxJGlLkwxA8kE
 FcGK5fvgItW+Z/je4RhZfRJlbi5xymG97QvhoZ9RxrE0/izenLoF/QH+ly4qYIb2CTKlX5ASSu6
 RZMCQiDY3m+AotviaN4ibBTcMJAdjLT/JHpoLrlTkloZoZFG8vxSkRZbwfOiMgPNDRxNkyDXaT2
 ZDr/6hZ7pf0rx8ZDAsAG/5jMUcmyhrIsHkbMb0DWWylLFUboQV7SP06cVSdCJOpdFkG7AYDPARM
 d/cKOL2CQZ3a9vyyb3r+WmYTiOYEljGWXxICjbcFfTJi5m2J9XN7IEOHkH7d7g3DDMNwKHwzO+t
 jLA+HmRnj77mmlw/pQBtiYSLFKhkzcbHw3PZ9s+HWc46spVfPHuceqQe7ypWpI9Q8inEF/7iixG
 FQ1+1KPU9YJR5EdiqdA==
X-Proofpoint-ORIG-GUID: rsRi6dC6K5DKXVYev6RRCNFOP3H7yWPj
X-Proofpoint-GUID: rsRi6dC6K5DKXVYev6RRCNFOP3H7yWPj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130182
X-Rspamd-Queue-Id: D3499538C20
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107415-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Import register definitions from 28nm DSI and HDMI PHYs, adding more UNI
PHY registers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-uniphy.h | 43 ++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-uniphy.h b/drivers/phy/qualcomm/phy-qcom-uniphy.h
index 5f18f9593cda..e02bcc5e8150 100644
--- a/drivers/phy/qualcomm/phy-qcom-uniphy.h
+++ b/drivers/phy/qualcomm/phy-qcom-uniphy.h
@@ -8,10 +8,30 @@
 
 /* PHY registers */
 #define UNIPHY_PLL_REFCLK_CFG		0x000
+#define UNIPHY_PLL_REFCLK_DBLR			BIT(0)
+#define UNIPHY_PLL_REFCLK_DIV			GENMASK(3, 2)
+
+#define UNIPHY_PLL_POSTDIV1_CFG		0x004
+#define UNIPHY_PLL_CHGPUMP_CFG		0x008
+#define UNIPHY_PLL_VCOLPF_CFG		0x00c
+#define UNIPHY_PLL_VREG_CFG		0x010
 #define UNIPHY_PLL_PWRGEN_CFG		0x014
+#define UNIPHY_PLL_DMUX_CFG		0x018
+#define UNIPHY_PLL_AMUX_CFG		0x01c
 #define UNIPHY_PLL_GLB_CFG		0x020
+#define UNIPHY_PLL_POSTDIV2_CFG		0x024
+#define UNIPHY_PLL_POSTDIV3_CFG		0x028
+#define UNIPHY_PLL_LPFR_CFG		0x02c
+#define UNIPHY_PLL_LPFC1_CFG		0x030
+#define UNIPHY_PLL_LPFC2_CFG		0x034
 #define UNIPHY_PLL_SDM_CFG0		0x038
+#define UNIPHY_PLL_SDM_BYP			BIT(6)
+#define UNIPHY_PLL_SDM_BYP_DIV			GENMASK(5, 0)
+
 #define UNIPHY_PLL_SDM_CFG1		0x03c
+#define UNIPHY_PLL_SDM_DITHER_EN		BIT(6)
+#define UNIPHY_PLL_SDM_DC_OFFSET		GENMASK(5, 0)
+
 #define UNIPHY_PLL_SDM_CFG2		0x040
 #define UNIPHY_PLL_SDM_CFG3		0x044
 #define UNIPHY_PLL_SDM_CFG4		0x048
@@ -22,12 +42,35 @@
 #define UNIPHY_PLL_LKDET_CFG0		0x05c
 #define UNIPHY_PLL_LKDET_CFG1		0x060
 #define UNIPHY_PLL_LKDET_CFG2		0x064
+#define UNIPHY_PLL_TEST_CFG		0x068
 #define UNIPHY_PLL_CAL_CFG0		0x06c
+#define UNIPHY_PLL_CAL_CFG1		0x070
+#define UNIPHY_PLL_CAL_CFG2		0x074
+#define UNIPHY_PLL_CAL_CFG3		0x078
+#define UNIPHY_PLL_CAL_CFG4		0x07c
+#define UNIPHY_PLL_CAL_CFG5		0x080
+#define UNIPHY_PLL_CAL_CFG6		0x084
+#define UNIPHY_PLL_CAL_CFG7		0x088
 #define UNIPHY_PLL_CAL_CFG8		0x08c
 #define UNIPHY_PLL_CAL_CFG9		0x090
 #define UNIPHY_PLL_CAL_CFG10		0x094
 #define UNIPHY_PLL_CAL_CFG11		0x098
+#define UNIPHY_PLL_EFUSE_CFG		0x09c
+#define UNIPHY_PLL_DEBUG_BUS_SEL	0x0a0
+#define UNIPHY_PLL_CTRL_42		0x0a4
+#define UNIPHY_PLL_CTRL_43		0x0a8
+#define UNIPHY_PLL_CTRL_44		0x0ac
+#define UNIPHY_PLL_CTRL_45		0x0b0
+#define UNIPHY_PLL_CTRL_46		0x0b4
+#define UNIPHY_PLL_CTRL_47		0x0b8
+#define UNIPHY_PLL_CTRL_48		0x0bc
 #define UNIPHY_PLL_STATUS		0x0c0
 #define UNIPHY_PLL_LOCK				BIT(0)
 
+#define UNIPHY_PLL_DEBUG_BUS0		0x0c4
+#define UNIPHY_PLL_DEBUG_BUS1		0x0c8
+#define UNIPHY_PLL_DEBUG_BUS2		0x0cc
+#define UNIPHY_PLL_DEBUG_BUS3		0x0d0
+#define UNIPHY_PLL_CTRL_54		0x0d4
+
 #endif

-- 
2.47.3


