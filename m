Return-Path: <linux-arm-msm+bounces-103240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CdUJP1E32nzRAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 09:57:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1824019DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 09:57:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6191A30F6F7F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 07:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9AD237648D;
	Wed, 15 Apr 2026 07:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WbP23mwN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WMwN96ZM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2E73B635C
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 07:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776239606; cv=none; b=RTW4ZskM9VZ3xLr6ukmNbesv2CjKiT0+0iniKDgwla+/HZmV/zHssYQlHOv7R/LKv0Rq716R9L5kQep9p5KQJqVbr9FHMBHM7WouXcAYycO03QlGgRNvFmc7CMrjZzsH5qfj9A0zWfuvlH76bUNqlgTlG8Yb50Lb+hyCejLvGnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776239606; c=relaxed/simple;
	bh=8zRTfEF4CehqwyJagoIWUHsJDEYqApSqkqfkf1mtDno=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PkjaaDNiIQcTPW7Ty1GG34+ue9ALR2XQf/ki4SpZJCslGJUI0HOhmephypTKma3WdsJb8Xx1rUSwcQZ5EQ2u7jBcgZOVEznX01+9zESz/7X3v9F8fZBB2il6/CmMcYiks9FcByJOruC14oxvAZHzDXO+9t2znJ9KVJnqzrNKZMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WbP23mwN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WMwN96ZM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F2YW5O2005540
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 07:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nv29IfPcbVh38YsQRgaCkmMWuzwgC9dZJtGbM5/40Fc=; b=WbP23mwNcAaoitKC
	ht1X2v6EqhD5UEijOK0ixD/HVCM/DepewSwqctfOeGYv38qiODD7upslaT6qzXxt
	UBe0gKUu8tZnHqOe3FhtOg+EWibyd/IRu5X1D/2d0JUVyUscti0hvSgAvEOIRm2C
	1HzdNFJPInKaSZFyiPqK6vVCZGE+RkrYtd656TMfiOe7sAZ2JplHTYk6oSwrDmEi
	972HQlKbWVeOMRk/DiSgIV7G2hrQBbbvux39jyT2P7rAw7FAnqgJwhEsC+fmq0tu
	k+ow0mbGi+WWlrT6PLTH/zUbHcox3FZPYIT1NntJc7d6gJbXphvrxeZ0klChF6pf
	otByIA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrsjtr3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 07:53:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e136aff17so27797471cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 00:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776239604; x=1776844404; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nv29IfPcbVh38YsQRgaCkmMWuzwgC9dZJtGbM5/40Fc=;
        b=WMwN96ZMuXthHyy2O15WKQWSJmJEFtd5bMNd1nejRfLeTdrtLKHBXDfTLSggbEh35H
         xoCcH+AGZrQfvR9zPkLlCmz+F1jBjbqKsyHX2nT12qNZrCGFUJW7xCPrZOOSq9OZx25y
         4d0/3SO1/bskU+BXj8O9fMTvOdzph+/iGJNc97aHllmj3u7mO+sz3jXyKR8ON/rXjrdX
         0qFMvqzwi1gNm4f+oeQUr3urJzEdCccOpc3yGA3ij16i5yF86D/ILGjadGLWKBWhoDaa
         SmgLFsZD+4/CGiJvqxVN5nydj5e7TfxY+m5qpBrIRw24YNMJxWzHjS2YNZRs1bBKsgdc
         Vvsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776239604; x=1776844404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Nv29IfPcbVh38YsQRgaCkmMWuzwgC9dZJtGbM5/40Fc=;
        b=NelCbx+bCz1MAuqFYG6FGqoMxn4CfiU4tSDq17c//C8xS4eDaFRnwuK5zuJNoDi0yy
         NthEHQWsdCtIe0BvLENtA+/umAk/s1P2EAJrkzim23ByM3Ezl3HxsIlRcboTshSerOsP
         i4iafMmEszQ/mc5jXJ8N2Cg3k/W09uhYJj+ejRMtzqPQKwDx5uw7X+oicoR3N3riPwlR
         uj07Zhf8hWXymd1Miz9U2KaqONBq+FapI8vuiAXkPMUj194y+NG0AprHLAVbPqZgFtYJ
         tLltTpaj+LmVY/BSgy6qO/wZtpoRElsPo9hkwj4Md1YZfufH/be5jjGbqVrBKTITdiLv
         Fl5w==
X-Forwarded-Encrypted: i=1; AFNElJ+cc1+N6MAych+vxXgkm1e++agXOwc06gGuqR8QgL0ecSoNUy0BpmZMmC29mt+dGCTNaxj47U03dvF24YcN@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvr5FDADhPgADMH1qg7adiNFeBgQl9Tbzup3Y4vm6Je4nWxAXM
	iJBMi32zHV9/aye+ekKv8xVHlTa++Fa4TVJwaSSHAeQuuCcpInmTPEA9wan77qyHA4s++J60biY
	i2K3eeIMYmPBmomQzppMx8/pUSJ0nd99R2hybzckglttPXi8HZf4ODyUdAHKP/DMZZOJG
X-Gm-Gg: AeBDievYETJZQfiAvHCUSLjmbSnCCF1LtB6iIdbzH6qhaR5511FCFSKG13Bg6n5nNp6
	1maCHFCncbRS+FzFeqBG0NqijIpnGP+rjMtLU9P8IHvWnJP+JFnBbOnS7QzWPlGKmK2bImQfsiq
	Q713oJ7f9h6vPo0hQBTLlup+y+9jP9l7UljNFf5YSJjpjZVUzets4/lvezfmfy0NlcaBgJvGGCZ
	PZmdLMwNFeYkWMTLGWD2HMulc6SNx6rZSC4B59n58EDl+59T2E7Vdaxq6FHXQ6EXXxt3pCGblsh
	3DEWSjNjGu6XcOgdgyvrxbnp5apYFDK1YlOJt8FOrZC1I3z+xXIFcX/SQnT7D+pJhG30YOtfZnh
	NIpbs85g6chXL8oEpVOt8pOI84gkrBpWGANY=
X-Received: by 2002:a05:622a:598a:b0:50d:aae1:7070 with SMTP id d75a77b69052e-50dd5c12803mr291845641cf.48.1776239603856;
        Wed, 15 Apr 2026 00:53:23 -0700 (PDT)
X-Received: by 2002:a05:622a:598a:b0:50d:aae1:7070 with SMTP id d75a77b69052e-50dd5c12803mr291845381cf.48.1776239603441;
        Wed, 15 Apr 2026 00:53:23 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f0e7ef99sm19334975e9.8.2026.04.15.00.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 00:53:21 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 10:52:57 +0300
Subject: [PATCH 2/2] arm64: dts: qcom: glymur-crd: Drop forced host mode
 for USB SS0 and SS1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-dts-qcom-glymur-usb-role-switch-fix-v1-2-409e1a257f1f@oss.qualcomm.com>
References: <20260415-dts-qcom-glymur-usb-role-switch-fix-v1-0-409e1a257f1f@oss.qualcomm.com>
In-Reply-To: <20260415-dts-qcom-glymur-usb-role-switch-fix-v1-0-409e1a257f1f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=898;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=8zRTfEF4CehqwyJagoIWUHsJDEYqApSqkqfkf1mtDno=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBp30Phb1ViBV1sV1AgElOG66Uq2HBjqTs9ATkoa
 eeMYnnRyN6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCad9D4QAKCRAbX0TJAJUV
 ViBiD/9yAxn2sfAtI28hQfMDydBXe6uPYBp3V3Ns8CgWlaKiBnRj2kMRfeTTzcgx/Z8u4fCgGes
 aNb4TOEz2u2RugeZL0OeJDr0MN7X/Uo/Nd45PKRC4+lxb+N55WcFBP0yFjwR5dfXldInvvcmksL
 p7efTtfw5gSFvAUjInvzf59zACRKn32k3ib7JVJUDg1t13tBTxxFXP7i4Yrgji5qtfhQHMb2lqQ
 nADdUSCcKPSHQJPJYZRjXFMG08TCrfmzJwFc/cfSbz8HBS4nvzvGv21sVid0AtJKwtQZypU5d5H
 lnJ627izVGRLdPczRxTK9Ydyl05/eCW6bBHh5YEoh5H2oySfjcWJDxAhw+9Lokz2Uiss3wNHiwA
 m2+F5PGrWvrROsic0asesgIlYk5tgRsIe17Wgi8iMAm1Hq2oxzysjeoNHJxfNZNm6lPd1RTmNCP
 f+74unhW7y06GpliFy9OIVqy0nslPCmadg5XQtbrDoL6XhAnm/KMdctN2Rxg01/sEfhX4xWZL73
 6k09oG/kZ9EwKh5KSpMYqOrg5ORJEtYeZUvuhjYVi/ntUXypPzSxmIMVBPSSi8fQSYLg7DYYCX7
 pEmB6W1iCwEYbxSjMGyioTHm7+Qrxo1F/I2u25bwImkofXCkR531SlkXviKgfs0L/xf5jSs1vIo
 S/SFJMsZZUSlflw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=WKhPmHsR c=1 sm=1 tr=0 ts=69df43f4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ub0iOiB/G/eXZwGovfl9ow==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=WUssqNGjtvDNWL2Wm2oA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 9VK2DIhDdfsXqPW3FsclOqaVGV6UXc93
X-Proofpoint-GUID: 9VK2DIhDdfsXqPW3FsclOqaVGV6UXc93
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA3MSBTYWx0ZWRfX3208+U/eZFD8
 wpW7qsiwdl1k7n2KU2UfQ4gOysXg6L+f7ZyEI9mmaEc3LZe7Err03cl6ebdLxZl2+6N1o+ge07K
 QVWW10Vkhe8oNQvSzenqbZPYHyZ1Le4RwOi8+FmGV5meNZEkwdJ3qG5XUC8J0pdUkuLL1YO53Zc
 VDaAbydrN23EIb39xO7UqQUShb06Qgi9Yp5Y0vdYdbeQ2NOKhZJfWoH9xQx00mQ1CYxtMRqm/8U
 9YAWl9ovPsiNlb0ZZYCLkd+SzOPn9ll//z/tElfdkvpGJ4Ep2p3hkukdSC1wmKyADaqDIfQARpd
 Jo9VSrob+E/z5BH82gyeRplB5jLhtl6a/kRax6WBjbF+A9dcS+J6YnM2JwetmVLvXRuRA+LHPQq
 HfBufnVlAsZ3E+R35+nU/kv0KA92jtAyhtNTf2hHOBBFKuDoTSM+Fa20s8lGn1hpNZjZPXiLl6o
 I5CcIbMp1RHUyNfUZcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604150071
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-103240-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ED1824019DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The two USB Type-C ports on Glymur CRD are dual-role capable.

Do not force their controllers into host mode. Drop the explicit
'dr_mode = "host"' properties so they can use their default OTG mode
instead.

Fixes: c8b63029455b ("arm64: dts: qcom: glymur-crd: Enable USB support")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 35aaf09e4e2b..c98dfb3941fa 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -322,8 +322,6 @@ reset-n-pins {
 };
 
 &usb_0 {
-	dr_mode = "host";
-
 	status = "okay";
 };
 
@@ -353,8 +351,6 @@ &usb_0_qmpphy_out {
 };
 
 &usb_1 {
-	dr_mode = "host";
-
 	status = "okay";
 };
 

-- 
2.48.1


