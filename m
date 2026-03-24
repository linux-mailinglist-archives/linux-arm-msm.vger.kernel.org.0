Return-Path: <linux-arm-msm+bounces-99699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDMSE7uwwmmRkwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 16:41:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC253183F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 16:41:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0836D3155F84
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 15:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB2D6407105;
	Tue, 24 Mar 2026 15:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LoPmQ4Ja";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xbjw6B2l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFE2406286
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 15:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774366203; cv=none; b=DAZ3qhC4tOeuMuREpYJbKIqK7URa9u/NuUF/33OaobVAvFSOGFE2TyPYEXXP9zzbMTHludbjI8YFB2PBF0zUvqs9GRYVAWITGS9E+FQviZHT/kjN2QnmgkYKGmXYxmPAWH+UDRkPUCufukKjWV7ult1/OOsBmI2gi8K63ExLT0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774366203; c=relaxed/simple;
	bh=dVXlVPcA04DyP9oUgevgrw/HZIC/ae7SA+cQKGx8Dqw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uGPNxJ0O1n4StUfYdp6U3GweXmbBraLXomibKEumDC9fMiaOEb1ii+VO81Lw15R3Z6LVvFcIQz0Cp31rWczOIMiuAZ362H8Zlc52/V//pDj3LmcfNbAoMrJDpBDCnFVQvl9HRuv4mfWCRAEmCyEwl6gejXxPz5OxujszrycZaQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LoPmQ4Ja; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xbjw6B2l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OEbktl2488328
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 15:29:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HkzJ0T8fa9uK4+3MCKlsnAXadbIsuNrKwWDc/A14Awo=; b=LoPmQ4Ja1bJjyd9c
	Wn7Wcvh5MmIgVBVHBNDxjerqtr+Uw02dBCNeCvbR4RsEECEyq4C9LxVpNLBAjCZE
	Nw7q0TvxP7hBIp/PLxrX283QQ5JkNMBrjEoSkJwCqQkFeD/hXitW53fTiIcbWFHJ
	bz9hvLp5iapaeOjChbzB/wWPPf2gNhn4BfI6LHbVbV7Nm0fGpvPMCg2xUjd9pzRa
	QxXmMhTS1NQLHIlwDu3+F8krH49akoal+/8cX0cpWF82iVTSahHTVO0O0ie0Vhdi
	LsB+CGUA2HGd2cmxW7QY5KP+ddZTb3W6RQpg1787fcP1bkUb60P+n7uOzNfjch6S
	KRI3nQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3vhvr7yh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 15:29:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4987c698so294505051cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 08:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774366197; x=1774970997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HkzJ0T8fa9uK4+3MCKlsnAXadbIsuNrKwWDc/A14Awo=;
        b=Xbjw6B2l+K2MRiSqeqTC3Oly5Hmtk4JYcPl3Es2l4t0axLy35ZhcQM/WNq1VxWWYXX
         rbQ4+XtH0LM5/GftDlYwFX7j53EaBuoFSXWWoWWCKDCqjJbbOedjmNaLGRp2cDWZJFoU
         GapflAgy8WPjZjkZXPSG2+19jKVk4/KUaArLqn3vr04/8Ppb13xNzAFZLXovKv5BSmWx
         bHggjJGBbGhO2ONTX5E7rD8TGpuIiQJyzccSsDQp4VTWwT/3upIF25T7hzXi+av4F2a8
         OOPvsGP/76sKOonhL3sOujYuDoORkg8JotjlnApEr6QSnmyB3jBrcM1pn1I1ixSQ8cAh
         0GKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774366197; x=1774970997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HkzJ0T8fa9uK4+3MCKlsnAXadbIsuNrKwWDc/A14Awo=;
        b=Azmcn4HSgEhj6tSDm23dujOxxAbjgL5tKblL6EzfZ/LRngLOUmo51CRysCMtkeZVDr
         0jS47Lj6cez6QNE5Tnlx1JCxR9rBLlIvK/eiH+/TwNgg0/b2b76y/xzsnkh3O7T2Kgbd
         kXv543DHSbNbd3zocVloOb7BWH7Ot5aPAdZXxFiYHfB8xsuFfajf8JENRxeNV68L2o/a
         EQl4yeZwJZThA/8D5MUDHxLva81zAzfC49DUiPqiuqobtJXJJkFO10CaeV1ZLL1u1Vqx
         p3ZRyURRqKCvj1wtUpKvS0hN5lySlbf/MAL/x3szsQlKvBaLux2lo0s+U+QN3tQWSyoN
         DfTg==
X-Forwarded-Encrypted: i=1; AJvYcCUmmyw+cwkGoexkZ0RB/RwKf08RoOiOgZCCB49F6KryR35Ki5Lncp8fACezJGUt0eeFlibBP0MP7psjByXF@vger.kernel.org
X-Gm-Message-State: AOJu0YxztJcsdQKxFlQOHgU2mw2Tsx5cATpcTSyjy51jg7VbEMWeyW8n
	O3jgadjCEClw6ACM/dkcY4dQeeFEax9KXtjzUW+2SoJrenCfp9P5cVYzqSPxTnNj7xRYAhm6hFX
	UCxkYDG1TZdCJueaqoINqT5gSG7vxb0CRqPCOHUxNhJzC/0FhbZhOliDqkRai4wbppF4I
X-Gm-Gg: ATEYQzy888CrzU52Ock9a8yT0ruywcADtfbY9/BXweQ+pwSJ1w7e9pkYmpu+c5h9WWW
	t/LLsLDsgZgE4rd6MBgmuMyfjR/4jXrsQNzF+Alrz1qsXlG84VVqDKHQr1zDMJ90Oz1B+GlJv3N
	sTFK9N0zBuiYNddjxVleVcmCppjQJ0WCKOyR/T+++1ellCsBH4ZSWcYx4vmI1vMMCXz8+dOMxPG
	1COE1YB1Kc6qxtwBegjUaHvWDhy1EWXZM8P5qLVrtZrm8XZ6wQU2VndoP1SYexc5u2vVN6yBvS9
	R06LmIRqBA78qLcJ1aEon5qjzTOlyga1KXIUbkCxcMOjUT+z+GjyAcLYT/Pbo3zrYCKKJuy0YE8
	qFsVVuCh9d/9mCGLpGHU4luH2ZZw=
X-Received: by 2002:a05:622a:34c:b0:50b:6fbe:62b9 with SMTP id d75a77b69052e-50b6fbe6b75mr41833451cf.28.1774366197148;
        Tue, 24 Mar 2026 08:29:57 -0700 (PDT)
X-Received: by 2002:a05:622a:34c:b0:50b:6fbe:62b9 with SMTP id d75a77b69052e-50b6fbe6b75mr41832971cf.28.1774366196524;
        Tue, 24 Mar 2026 08:29:56 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4870f6e9ce8sm36943385e9.2.2026.03.24.08.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 08:29:55 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 17:29:43 +0200
Subject: [PATCH v3 3/3] arm64: dts: qcom: eliza: Add missing msi-parent for
 UFS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-eliza-base-dt-fixes-v3-3-3a4a03e72f8f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1057;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=dVXlVPcA04DyP9oUgevgrw/HZIC/ae7SA+cQKGx8Dqw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpwq3qXP7vmDGr6fzD6NzprXtmQbMOt2GrpkNjj
 i2ICbKrw2mJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacKt6gAKCRAbX0TJAJUV
 Vs8LEACSe2xuCnISaq92gESLGoa1aKTglu0UN37a3tdiAV4gWeQyrW8iDq5oBPqhiDkQBb9CeTu
 2s24dJ8AzTSRwzOz3WjOdFtAKFFxRBoGcNoFRSaM9lFU5MAaT7d93x88C2nAJw1qNRog/F8J+Ke
 j3AleFQ2SIXmTM1VwXkJClVbG0wHIsKw1QoREHIJIBtfeY5fopp+IF2rg3MarYu9zc4wJurGdLQ
 C7WILrfbi7d3q3EU/o8WS8z+SKAJGBjemsjB50FIUABkml8RjJujEKhY9/K8f3+pQwOhJfn2kRT
 epqK6GwsmFH7Ny5bd50gS+cQRnIWlY4iXmg6KUwxMD+wcVGnD5tWXgf+VarYaMmO6srJKtB0y5D
 WXARM6/8LcLabeZO66HPAl+/oxeMfBdoybhCEpL2DX8cI4mUOsZd7iMOqKNlrdAi3a/tgytknPL
 OADYGmcVsAYgp2AEM6rrLKnoIsp7dWc9resYeNt24T4PHqo3UTVswJq79pScLoOAodTHVjdnaRk
 8ps79HOHbBvgWyPQyEBFIBBM71rPdX4qbMzSgYDOTptYPQN2UA35888QyqblSiDVULGcJXSBWXg
 fbAZmlZ0tI9gBUfPhYsiNjKHGe03s5bnhMxjZdZs2mex0TEOMM7lSXzw6bfC5pKAtaVabHouiR5
 gqiBUkreSRt4LOw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEyMCBTYWx0ZWRfX79dr276UsTt3
 fJJiUEnLzVGOxTD1oJujPyXa/d0TWrji1kH3il/AHieakIEh4ybbtBjc6QB1Kl48vID28T+sETR
 BvvdvsRdzedlbtPck/h2Ov3i3HxTEIeN1ZYIlS1cLh0O5aFGWyAOTQyscxhAVx+8aJfwse9Q53F
 9H/1yZJCGp9YsCbB4cs3VNzKs3GXc0uXTjG7q/E9rVHYVrTiyd0Qzk881+pg9DPnMjoJS1pvVW/
 zX+/gDYaBlIsC8IYzgml6QUE0Oil2a/Zu7zkQzMv4AB47qLV4t4E8jb5/Ugy7hX/ekLko9vNBim
 tX7Rz9sE8DzsHUJiydFRNJExF2UN+71Zrm45d1phQKUoOGyFGoo0TGDBu4eRobb+Maucbaq8sf9
 748QexnOCEUFP8WeljA/maNia2FagbrdPEtdRZVr83stQCc30/zzB4awySGdzksPdyix5bqYi4j
 cy811EE4y59UvNQv/SQ==
X-Authority-Analysis: v=2.4 cv=P5M3RyAu c=1 sm=1 tr=0 ts=69c2adf6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=kG0iW9uiJ9BVmnksB5QA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: lyZfk-OZsLyVXsc8ntqkuR5GMENqbfMN
X-Proofpoint-GUID: lyZfk-OZsLyVXsc8ntqkuR5GMENqbfMN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240120
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
	TAGGED_FROM(0.00)[bounces-99699-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: BCC253183F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Wire up the UFS controller to the GIC ITS by specifying the
msi-parent property. The UFS host uses MSI and requires a valid
ITS mapping in order to allocate and receive interrupts.

Add the ITS reference along with the device ID to match the SMMU
stream ID.

Fixes: db7fe6963466 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index fab603cd8e42..62fccb43a7e8 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -785,6 +785,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			iommus = <&apps_smmu 0x60 0x0>;
 			dma-coherent;
 
+			msi-parent = <&gic_its 0x60>;
+
 			lanes-per-direction = <2>;
 			qcom,ice = <&ice>;
 

-- 
2.48.1


