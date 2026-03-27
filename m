Return-Path: <linux-arm-msm+bounces-100294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKkdABV7xmnwKgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 13:41:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54689344749
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 13:41:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2AF0230FD04B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 12:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B315221DAE;
	Fri, 27 Mar 2026 12:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hyMh42v1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KEF6fY35"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B43021E091
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774614973; cv=none; b=rUc8UHlykqSbVrxMLcfgzKo2mFh2gBBConCM4R5td32nqHPzhcawC1+w/MHSb2H6Ms87RA67FkVZyOFi/H8U7oqp+kaVOhLL0nRXIRm483+Wo8EQTGgr5kDWOp0IFhbH9Zv7mH2l/Qn7hATqbKHIzbvjKaeYz9kauq7dXmQLuC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774614973; c=relaxed/simple;
	bh=eJVB71/fTnMw3w7gp3+mKn6hbGuXGI/5sN8E0vw7xyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lqu2QCKDZ+O1MaHwkxioApPn3NDQVBTWPN+k6+x860xy5fFtkU731bnclctqn/5PzIK+oGzIUYyMgXqVcHYdXuETCdC6Uwtflk8fGc4XC+LIO42IEhdmawV9gpmnlUHsuVfb13GhtJH45Dh6xHFKSgirhrKMlhENuCBw5dZdrLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hyMh42v1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KEF6fY35; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6voMO3715928
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:36:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VXmwSEMv3+6PfKWxStlWfD
	lkjgBUJAo+wcRRck2tJMg=; b=hyMh42v1OSvZo002LnIyDipwUN8tnLNnpMcL5W
	Lz7mJuhNn6By1W7ybMidgDmX/e0RC49ZDzW//FXQQtp0E+FuufpLnQiCRrLkWWqO
	YHxdcLSiHZoSUGyvofjlBoqI55Kh/0TYEEZcNG2zNDhVBCa2o+28TOWQmpzM72M2
	rPHIrBEYrqXuQJpSfFGdMhwwLEYj0S/BwPy3ufpP7TGl8OWWGc603eb2uHlVZUxs
	v1thqXPJABKiiTq5jhkMFYQh1JRjOv7oOhElClBvQ2An7MhNsKhzCiB/mt7WbmiR
	Kem75F/jf2XmXy2nWku6ohxI+P2Iv8GzG9qyyGsj6JG8CxsQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5dd6jr42-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:36:08 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5091327215dso36044651cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 05:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774614968; x=1775219768; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VXmwSEMv3+6PfKWxStlWfDlkjgBUJAo+wcRRck2tJMg=;
        b=KEF6fY355Cn9c6Sx5uyjWMxxRt213tCJqLDVahlDiBeIkeZWhBhk4zVQSCx0BNVA16
         90nJt/fgNjP/970KJWzp+jkFv08HYN49zi2NCgR0vQ8W++DuXuJzxINtwswil4U3EEJr
         ISHxAeNeR/XDL+ZIsFjbzNVQBXhkmeTqLuheFaD91QSJE1IXREqng5awVHVEERDXx3er
         y5YF3mjyHoxUO9asJFS1J9gafLXt0KNnpZnMqUTce+kPfXE86s+moN+EW1UjSpZkFMk/
         hI0TbllNFev8H7AbLZteuEA1ssOD8tWmJ/MVl3EISh3Ot4jHlN1Zv3RMXYRbXAYwLtBQ
         Q4uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774614968; x=1775219768;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VXmwSEMv3+6PfKWxStlWfDlkjgBUJAo+wcRRck2tJMg=;
        b=EW2M0Wi2IYpoPNlFZZ4MPsJO3SrAGPu1OTTAdWhNVaoc17btmBeDXOHtVqB2/LxnuK
         x82RSP2ETiEplpiT/sXBLHOZxHR4As/9JCbGK+SuLnfiqRW18YqihEFzUVFpI6gXIl/d
         8Jr3dQVzbWpGohy2RZmA2zRS5YR9BwWGI3TJQsqYOPFMXVJX3g+AvWrcAvzWc7hJ7xoP
         mi4FkvKtICNvgmGkK7u3xRpSx4kWp1ocKL+VtPmlShutTsZnPJRe07uHVqdBRhiVpppk
         uYciBTdww5xDsum+ryvThaSuO6DGp1cfpMJQihF5m7LIF/D7eib5SSQI42hJ5y1cCFns
         1hlg==
X-Gm-Message-State: AOJu0YxuYb+MbJcXkpdiZ5X6bgSNj1yNNfrh1JNKGfV4JfcTVX5fd3tj
	F1QpS+yWDHE861a6P6i9o3FKuot3xZr6zok0VsjrPslBVB8BWDEs2n49FSi4ChQcAQyHmEFYkuc
	yakSjvbBaCJR84/8o9QzS8zd9ge5PONCXOCinHE2Wn5TTg4tAJdAzheke2G4gwDYa50av
X-Gm-Gg: ATEYQzyWHQB2EmZLq3xaT6CcPpbAw7+nY1QS7pcc68EiWGPQgYf0G8lPtgY6MJyx9ez
	sH5K9zMts3sByRuBaIxQiwe5mR9Lic6+E8zLx9C3xAf3zixU0YQHAbZxaqGP/pLryv2G4/tDwSX
	YneBwPtzFd4sY6xMm01EJfIQwecK1x8/tyZPkCKSc2Q+rL3QmHJwzB0TZiDCZdUHTYfhxXG2TcL
	WiqsKVCRlVzv1NNPhuFX3H4+19/dcohMlTynyJSWwHey3zZzwdnb7Wav8gB+6yvjBwdDwrpTO4P
	RcpuqpI1Z54MmMg55PQcH4+ZXJ1tttdWgzb5KK/AORa7VdhiG/e7MdKm88PouZSJAzDEt//gefz
	rvNFFL++3gar7Cr3nmYyTE8JN4a0=
X-Received: by 2002:ac8:5dd1:0:b0:50b:4745:cc01 with SMTP id d75a77b69052e-50ba3979e99mr30843141cf.62.1774614967392;
        Fri, 27 Mar 2026 05:36:07 -0700 (PDT)
X-Received: by 2002:ac8:5dd1:0:b0:50b:4745:cc01 with SMTP id d75a77b69052e-50ba3979e99mr30842461cf.62.1774614966855;
        Fri, 27 Mar 2026 05:36:06 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722be608bsm117053685e9.0.2026.03.27.05.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 05:36:06 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 14:36:00 +0200
Subject: [PATCH] dt-bindings: mailbox: qcom-ipcc: Document the Eliza
 Inter-Processor Communication Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-eliza-bindings-mailbox-ipcc-v1-1-3f1c89bdf72e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAK95xmkC/yXMTQ6CMBAG0KuQWTsJrYDRqxgW/RnxM1hIRw2Rc
 HerLt/mraSSIUqnaqUsLyimVGB2FYWrS4MwYjHZ2nb13h5YRrwde6SINCjfHUY/LYw5BG460/q
 jaaKJLZVhznLB8tvP/d/69DcJj29J2/YBaFK3B38AAAA=
X-Change-ID: 20260327-eliza-bindings-mailbox-ipcc-4615b914d1d5
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1004;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=eJVB71/fTnMw3w7gp3+mKn6hbGuXGI/5sN8E0vw7xyE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpxnm0ib8QCOuUUjrCjWw/vO7MvT3f8n6rwht0Z
 Ry/8LBvtyyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacZ5tAAKCRAbX0TJAJUV
 VmdPD/9dpFMCgU8jQcwtih1X8ALKxhOcReccLiPqXQsj0UW4Cn0YWEwdaxrjZoKzB5yxgJ8VH8N
 7kACn7b5n6A1lwDWNXc5zQf7STCJY36zxNY35I+xdWzrB02iEmLM9I8O1k0zTWK09kpIy1hQXQ9
 hBV90QQk/k/JyHPJv5LhYrLaprNdgQ1lf/hB01kUFIxYxPuihpdIQCrtEcBe8xvvOmUEHaM8Zf2
 yYjvrGupWc0Me0nYxbb7rte8GFrYk+DSSLZOoml+HDU5Jku4ISuvmr2ZDRMT7LxwM+IObDu58NR
 MluuPpx+M1D9ZUdn/V2tzO7lv0LKWIOwwtQpc63eCRncQsUTIAH7Xv6JaR1O4q/A52BiqBnOhFq
 2Eu107hdyMasbSz1yuZwSj3XXde7YuYWA21mVj2oDv3UyyQdLGgM9Tll5gSMVLos64lzxPxuXsV
 MvK0hFH8NR+sor8/HAQxiiIZLaSoKQmMd5e+Ijtez2tF2G+Cefrphip13+wPRfusvtpIjDXNw33
 nX7Cxop40dVYwtg1j+x1Gs/Focg3aJvKVuR1AkpI4Zg+WRBtNy5w/PKCkE3apwQMxLnCy5ghN2H
 V0pEAEdp/5Oz0AItyAqIFf6oTuQDjlARFpb/Cm3xDxXoZpNuksncT496BsXzraqc+2DeK2KpsaT
 OjF/B9kF43N/EaA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=NenrFmD4 c=1 sm=1 tr=0 ts=69c679b8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=cRzeL_u0t5vWdlw5OK0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: VGCYLgclnwhBsQzf4LKCnSOKEy6Sqajy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA4NiBTYWx0ZWRfX4fCx17zXnQKE
 MJdJJSoLqeKWsW8NCzk5dbvXqy8tngvzTSvs4f5GNhDBbItSMJZJDH53ppwC/3G2fZ/ohNj15Sx
 7fIOYYfdECDRglzEybA9p2n75L1PAnqetJw5Wj2YqJeFFTf9xOY9H2nWizqsGkrjmWLjHfH66nM
 9PwXNKocosANBSp0kezGgcxZUtarrhsKWXF3/xSkiCaHeiHr6xYeov69PB1UIeckey8vf929hdu
 cth02/qmmaWDsVFwKuttBpP81EY9Q/jW7p1rg0PFl9hdU9ygRYVgO1lTpa1U83u9d0ak/wimcht
 HxHGxhz4BF73G9GPgbTBM5SigedeHkx24PepIvbURIWZMg31BqiX5C8uFPZTH6In4NwzcbaZedS
 dYQpmfWy2RuZOqCOtQOVzt3ChGYaE+yxdmkd0k1wnhP2aIhIjJLXVgVmiZn+kMJwXwxE5YjzTpP
 dM8QkVsYcoXFvSpYSNQ==
X-Proofpoint-ORIG-GUID: VGCYLgclnwhBsQzf4LKCnSOKEy6Sqajy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270086
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-100294-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 54689344749
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the Inter-Processor Communication Controller (IPCC) found in the
Qualcomm Eliza SoC. It is used to route interrupts across various
subsystems.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
index 7c4d6170491d..f5c584cf2146 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
@@ -24,6 +24,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,eliza-ipcc
           - qcom,glymur-ipcc
           - qcom,kaanapali-ipcc
           - qcom,milos-ipcc

---
base-commit: e77a5a5cfe43b4c25bd44a3818e487033287517f
change-id: 20260327-eliza-bindings-mailbox-ipcc-4615b914d1d5

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


