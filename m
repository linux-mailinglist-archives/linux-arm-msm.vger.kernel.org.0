Return-Path: <linux-arm-msm+bounces-99058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MEGIUQUwGnMDQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 17:09:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F10B32E9EFF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 17:09:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 08B16300A103
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 16:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8B2A36AB44;
	Sun, 22 Mar 2026 16:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V3ZbnYLw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MX58eWUZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6529936921B
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 16:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774195721; cv=none; b=i+rdfKjyt1wqsTxUIn88wEoNeY4pmhzcACyh22ueI63yGBdnL6o3Bua5eurROE1wTMwbNKcMgs7rT6XslvJcNL9UEvHL2Fv3sssYedVAccSinc+by4ARriPIZTXteJppQTz5JlhabgoaVOVNu7NP/5oXJfXLVO9RvN6bZH710Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774195721; c=relaxed/simple;
	bh=QgVgXe7CeHCCGHRYqA99NXgol+TWPrEGIroxY/e/mAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D/ht7awk+olLKfH1VlQCYdctAHqT6k6BQBhHpGQU8caKIng3ECewtBEaqX/E3P/9pINbzAAfNYi59dwu13OjjpYyeNkiUZ6iLbNwCNg82C6ucNzJq9kgIhavt1mfKl8CgGk18kDSvUdm3ii0Gk3hZcxVOkKBSJxTT/saqYA0kwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V3ZbnYLw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MX58eWUZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MBApYi3451637
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 16:08:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	386IQlpt2NLafS/qXHiiXgv7Fj0hJuSYuk0U8G2ja5c=; b=V3ZbnYLwLFUOrw5A
	qWc8FWunYPqAtDioh3ZRPVAjTX2LISiBKTWXxiaFbaEPZdm9LpDN1w28lCozInoF
	uKZsoTTKx3W7Ss4lIfV07tuH1q8kGyB+mXN5V5I4fnSwAc9w+GciffLmtmMFSoQa
	8c8p8h8J/IC1E+XogWkh9BJko/CpKH3tPfxB1pOWvwtI+t66HNMMdtsMNhyPeb6w
	wRneZU9KmILacQLEl5KgY9W4JlHnPBf3CF/9OlYz9W5hIguTSL9aGT7d/T6sz0Se
	uulpDp7irnNtCSz1iifat1HFWWXV5jxaJYdTYM+SRiBeYGLBDWqwSQdn08MLHlpX
	goIvaQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jwvjnhu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 16:08:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4661881eso19770441cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 09:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774195719; x=1774800519; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=386IQlpt2NLafS/qXHiiXgv7Fj0hJuSYuk0U8G2ja5c=;
        b=MX58eWUZdmoU5CILizzGqrt0hymmoKRyg+t7BUuq2RL8Xzm13S3wbPTSivWb0NKDc2
         s/JxxVuCox9D8+l9w+MF4dTKpv8NIAb5vOvyj+QM/E5swawU+GRT2SAJqxCbZ/vKJDfA
         04dFvvAtgBR3JnebgDM5WGbRrGaFsHqUGbk6LrwDezFqniLZSwNs7/lHBehPK7fa8k6G
         5gdz1qmhINVtZuzyANDgnjPoY9aznnGXu9hUWvwfjFIpQGuolqXQEuq1oGWLa+kY8wYd
         TLfh+P4Pkvq3PNOL5m5ZR9Vh5xm1RlZChaiFF08JuybYPVCzXt22Bbw6m2ivzTT+sbVP
         ca+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774195719; x=1774800519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=386IQlpt2NLafS/qXHiiXgv7Fj0hJuSYuk0U8G2ja5c=;
        b=mPjpFwyb3K0zqGy7WIvQnPYdZNhOsypZrSDemRp9M1RxjmNwcuVAiV8VEXRsBHXfYF
         mO2+DfMdKct4gLs24piJblJrITAMc50BjXrOgobpJd+1fUqrCZx5rqBYrAXLa94y+anu
         8DrzPJ+QEUZ7hHYWB88aTjMW680qPu8yoVwRykJ48Js3BqrrbSmvLjlvgv3hJ9Kx7wNV
         QyaHflIxOwZMRGLlYpyNEOjpPO7wBRe93SCprjH1LZUDlCjfJnQUhkVtu5MHTvwNB0ep
         0bimX90Km7Xnvla7PwZa7tRRU9GV+h5keAEQ282TQIXP/U9G3vPPdKLgnF7jG+ggba/h
         otxQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0DOjaYKydOx2bRCIKi0i+wbtbtNWDOmB/sxaxYd7+61sDu0vRebvlE90+B53WH2nbq7mkfITo6G5jPfF6@vger.kernel.org
X-Gm-Message-State: AOJu0YxbprfOwi0jHsNmzDE1eg7d3eUxbbTc4U47xNrtDcx9bkhLmwl3
	B7YIwpzCiCAB6tKWj/Wf9sEHuiqN9wJwx2jKXINQ67pdL4pspyDZdXbrGDNHS+SxQFjOdYBydeh
	yaEG3Vk+GsH8ttdgQVvwImZaLWRBvpWlDIjc6RFCKF2uh1aFhOpSj1JvC4ltSwvQaqgJX
X-Gm-Gg: ATEYQzy4dm/6G/1/S5Hh1lkyVV5kKZSm8RNaN3hAkvfpMqAMXNod5wqGjToVhMLCMPj
	9iVx1uZkXlWxNg0P6ytR8k6iC38S4oFQ88P8qI2XvmDT5Ck9cxUUf1F6oG69o4AVZiIqHof1gby
	jmQtmh7x3Kz8mhRD1c6jD7JABW7MjiIlEoTHIRJ3/vAdQ3Q44RPS54skouJ2uPgEfIlsbmHP+lz
	YlKj0yFvaMPyWookHBVpuucKPFbVvGw7uEp1cCmI+pzwjIL0S8n4fecvTLjBo8wzGJA5zaWhzA0
	A6ZHKgasE2ViCONAgX2Z+/EbX8Dxh9NJ33BfqplhXsKyaGCs9JCWA9brWd2R0DqoQ7o/ZK/KOKl
	AXnv6mDbkcyxx6sjUzmLTQUzSZWc=
X-Received: by 2002:ac8:7e8b:0:b0:50b:4d74:6614 with SMTP id d75a77b69052e-50b4d74669emr64263601cf.63.1774195718629;
        Sun, 22 Mar 2026 09:08:38 -0700 (PDT)
X-Received: by 2002:ac8:7e8b:0:b0:50b:4d74:6614 with SMTP id d75a77b69052e-50b4d74669emr64262981cf.63.1774195717963;
        Sun, 22 Mar 2026 09:08:37 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe8159dcsm79087155e9.0.2026.03.22.09.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 09:08:36 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Sun, 22 Mar 2026 18:08:21 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: eliza: Disable UFS MCQ mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260322-eliza-base-dt-fixes-v1-3-c633a6064a24@oss.qualcomm.com>
References: <20260322-eliza-base-dt-fixes-v1-0-c633a6064a24@oss.qualcomm.com>
In-Reply-To: <20260322-eliza-base-dt-fixes-v1-0-c633a6064a24@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1398;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=QgVgXe7CeHCCGHRYqA99NXgol+TWPrEGIroxY/e/mAE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpwBP8zfeTk+GYyGdR9Rfp889wufg4QHDUGR+mA
 vTcyHzckb6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacAT/AAKCRAbX0TJAJUV
 Vox9EACiSvwQYEqh5U0UNCPqDp29nnoblS6RDdcqAsLiiI5moF9pKw7tShHc4PXbq8rHg5ZC1Y/
 jOThm+NN7QZMfMwL+NwwTcejC+fh+wD7U2tKxzjefR43svHb4YSD8GBd3x4H/bZoBog9gKtyyf9
 9aC5E3VTfdeBYxX97b+Zek8miIFc61HeRQqqW3cZZ1nGUqBQBx6UfeL/qNEREeagDGjp8y8Lnf9
 v63bXVvy8flcDDxUUv3UAtdXX/c469eceBien8vwpr9g2EADvWpNCAF0a36PQpct+WypABOTrj4
 pjpq5kh5RSXLgz/IvdtxzLd+fHrlLCcIDUXnBVun/VyA5cw7yR6CmJipr6clkgkTPN5n4eDJl98
 dYLJxM4T3AYFI00dWPNTWhPD6ed1OWfaxGnb76jDZ+tMveLigY+CNtZuSC/aFBYAqdJxW3gzu9p
 3nPQX61i+vU39hnTnrluqSdpgn3J9J2EqXKX0pXbQWbYaRLVCLzlVBaMX5aTZQrU48ttyi2irFR
 LDvShb+YTs7HE8jkxyhhgCE/l9iIRk/i6etTaVVQjioJC1EPdMqgpkkjba0VKAX203btTjliOe5
 ynVC6LH7PprjTYJrsXApodhMKNtEumJeVF8/oJEwL4ct5196JTeRvBMblZBmAqGH+QL8BCBOPq2
 tD4EYYVN2vqPq5w==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIyMDE0MSBTYWx0ZWRfX3/q3POlCifKu
 4pVR2LYpepG+hrt9w9wWu5Tiiwc0KsMRI1hMBm96+vI6JNdCE0RFMd77U2vp4MH48pEGFyTBn0P
 pxzOVgD7zd1VFVuPT3WsejqXN1XE4GoFWjZE3ar6zgM8MS++PmeqXnd9AyWsYynzzYebVvrDd7S
 xKxPl5oq0UXdhQIeA3xv3G21BqK5ETqVfzfDF5AIlXlpdl5FHLL6vu1FtjeiqTpZvnsBmFeAouz
 P9vvPSZuEf125U0uwRDVARGGW9vSZUe0HgekP57T1gf6chr8jSqvRBabXabour+75NIT3F7GdWQ
 TygX6oeVubLBd6w2YeieIQ2tD6zeCZijIAfOmoxHMrqudkdvrY+IkPprFlBKwoVCbJpqlaf+SSh
 yzs4Au20z0fGeIFrqUgcOGg0SgoYjw1OaUbVBeDB2NiObsLuoc94f4kQv24D7213Bs9zqNiXJTH
 l1wiFdeJeTSl3+1m/YQ==
X-Authority-Analysis: v=2.4 cv=bcdmkePB c=1 sm=1 tr=0 ts=69c01407 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=EAnBn6KIKeZtCtzaVbkA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: x6rO7Whe6HgOiNhFXDdzK9Ospax4KqGl
X-Proofpoint-GUID: x6rO7Whe6HgOiNhFXDdzK9Ospax4KqGl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-22_05,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603220141
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-99058-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F10B32E9EFF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The UFS MCQ mode is currently not functional in the driver. Eliza is
the first platform enabling it, which results in UFS failures at runtime
with errors such as:

  ufshcd-qcom 1d84000.ufshc: ufshcd_abort: Device abort task at tag 4
  ufs_device_wlun 0:0:0:49488: tag#4 CDB: opcode=0x1b 1b 00 00 00 10 00

The failures occur when accessing the UFS device, while the controller
and PHY initialize correctly.

Disable MCQ mode by removing the corresponding register range. This can
be reverted once MCQ support is fixed in the driver.

Fixes: db7fe6963466 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index fab603cd8e42..60a3c861a5c0 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -743,10 +743,8 @@ ufs_mem_hc: ufshc@1d84000 {
 			compatible = "qcom,eliza-ufshc",
 				     "qcom,ufshc",
 				     "jedec,ufs-2.0";
-			reg = <0x0 0x01d84000 0x0 0x3000>,
-			      <0x0 0x01da0000 0x0 0x15000>;
-			reg-names = "std",
-				    "mcq";
+			reg = <0x0 0x01d84000 0x0 0x3000>;
+			reg-names = "std";
 
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
 

-- 
2.48.1


