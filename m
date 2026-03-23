Return-Path: <linux-arm-msm+bounces-99379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMwXBkeTwWnuTwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 20:23:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C2E2FC26D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 20:23:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6460D3026ABD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 19:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71F2E39478A;
	Mon, 23 Mar 2026 19:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UFFSUpz/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q2JbPKKq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE3B389DE6
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 19:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774293820; cv=none; b=Sl6OzHm//oqHpP6/SPnVkQQjsS4FYVcHj7PFW9wPHtBTAgX1uG9HHlYiWSfUEBNq/D+9qHEZIekMJGtfKKlEoabvLbBAhXLTHyP9drh8xqDLfP2CSusyCUBIFBwP2eAs4OpPDTroLi2DpWrdflxak7UD/OtdkKAmETkoVemhb+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774293820; c=relaxed/simple;
	bh=2OiuwC39r9WAYMNgOQIQbsFnQFBXiUcdl29tWIk77dc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k9ELcLdKXJuBcaxOgAP3t7TaSB0NMoHdn3gY+5q1PGo1QTp1UGlPPiVMeXn43oh5Hxxskt5Oof1Y+2c/IzAzk4Z2taWWvui8+bQ7QUsoM+EJ4JDGDdybhusWkgi3o/FvlvdYLrtWET890kXzov+Y0SzjDNNG1kq8psRekueeEpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UFFSUpz/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q2JbPKKq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqcD43817779
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 19:23:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UTq/5O+jBlL+PdEsQhURbyRBWv7Zin4EIwuvMYQLw+g=; b=UFFSUpz/E8v4jDB8
	FuahP2ctUzQuw4Tycupg9iXR1zFXT2UfkXiOlqhDBwMCnxHTzQhjli+fNws+bZUc
	vbsfgHykJWTxFhXKWnzIN/173Uzm2Nd404z9ZH5oTlCEQHpepIDmdUYwFdo4rFUo
	KVn0ySlIDMpkEj2rbV7jrm3+D2vRdHoPKX+7n+eLulNIxeMIS8hBqTFXRrK6IRrd
	yBsuLPKGZCrSNIvDQjI1qSJ1hkM4GCyGe31mi/uzs+bR+wEid6p5VnpJJiDIZvY7
	LDl6sg2pJo3Ot8JwvDQNy0NnE91hVLUHQOQ0NpKHlBK+Z3dcShUnG0nsSW6ckRsZ
	mQWQTA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d355w1hdy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 19:23:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b5f675be9so118262331cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774293817; x=1774898617; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UTq/5O+jBlL+PdEsQhURbyRBWv7Zin4EIwuvMYQLw+g=;
        b=Q2JbPKKq1b1L7FKNvVkEDt5p+exC/QpziqQ7E7V1bW5vfMYGqEBojLvKqfwIQ5ub5p
         wFeMGxgKbZobb7frskaMoGkFHpZsDw3Wmv3KDW9Jh0ZwOjf9OeJHJbY5uUMNldjQjaKQ
         d2CbTaXzuOFo0kfwu2igKJd6m60TDrX4Y6wc/g4LR6TUwaAhBEMBRkXoFFvV0pCptuuF
         qlfHh2on3QxkCNmXOpEm2gYjFnyaaEcKYf/pD7uRr4gHwPZ5d/nWNmBezido/N4XX/Ji
         tUdILJY0y/IFAb/XB6T+lm+apMmfgcEiP2IgtNxovsTylS0X07LNTj+VzocMcwkeOZHz
         DgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774293817; x=1774898617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UTq/5O+jBlL+PdEsQhURbyRBWv7Zin4EIwuvMYQLw+g=;
        b=mk5X5krungQVUEWEm0Zhjee0jd4yDza2EetnWkDtNK4qHgO+ze0BLow3aaA9YRWwhB
         XicYgjbYNqTNuEbq/ld841A3Tfih52ztxHZcvg2z2/rngzoVxiAuoDycT9lfJzVWuNzK
         mWGtaeYp6EvK46pBQyUzP7nZStrfUEFazeKI5nncutJMTz2bs6UPrFaT1/3rACwPCR9U
         gAd+TQpScMR2kzOUYxRCwaaKGOQfnc2cMbaos9Z5DzydAX1r+uAkR3MdTwm861yvjm8K
         Dnhs8xR71urp8+yXcK90WDkn75g25sxRfdBzu8eJT0q9jM3JH0I5iSqlvWFWjklDRLCc
         hISA==
X-Forwarded-Encrypted: i=1; AJvYcCXyNGdS/OBNWv05pYKxUJMZ0dHa2ohDQ7lyuh1KiWxVWFaJc+yI8VzfcLKRHq1hHrOecrloinwwMoQZoLQK@vger.kernel.org
X-Gm-Message-State: AOJu0YyNwXgfVnINlxrn332OotyGvta1v1rNhlbtCUnKZYWwgHb95v2i
	SzaMfROXnaS2jBJ1t4sT5xSd4X5XLvSsCII1ARmvHSUreTOl8NQHPD5X/xQvhvqxl4pjDPxHcwX
	smjARVQC5CSQYsJmAPUIEK1u8Yvr5ZqhLzNymQIEi/MyzNw5QH2vc+ihKmXPcnKw7OJWT
X-Gm-Gg: ATEYQzw+4HLTVQvmj4O7pPiZAlcAhzEh+ZP1Tgl9jUFBknIhZaGsskCIVy6Wzga+Yfr
	kYP1MX+rvAXBmaUMCWfZvaPA3Q+wbQ0ZfHmqnAG2pOIHU6Azr1n0Yyl1aTIvhaHGpGbiGLgDb4z
	08Usn3gBeQpDC0yssyZHzuFDxrrvn8ujjNgYw7xBBNNyr+dbAyVxaEKtTmKU88CRXFpPsYUcBgD
	6i+v01VJPh5xYG40rlvlTUzw2znR/M+pN7dtd7tPr7/pq/COmfWLkXb4YIppd2fkgYf+DNyH5A/
	JYzD8cR7YxLnsgfotkQQKSwTkqS18YNmSWsho72f+VmvAtnWrO08dbpkzS9YdP15cy9Z9Jwwzg9
	1WIXhmYx0ezCtglMtUnACL19xM+0=
X-Received: by 2002:a05:622a:4c86:b0:50b:4ccf:1367 with SMTP id d75a77b69052e-50b6f8d4ce2mr8199331cf.37.1774293817300;
        Mon, 23 Mar 2026 12:23:37 -0700 (PDT)
X-Received: by 2002:a05:622a:4c86:b0:50b:4ccf:1367 with SMTP id d75a77b69052e-50b6f8d4ce2mr8198801cf.37.1774293816652;
        Mon, 23 Mar 2026 12:23:36 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644acb52sm33388113f8f.7.2026.03.23.12.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:23:35 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 21:23:25 +0200
Subject: [PATCH v2 2/3] arm64: dts: qcom: eliza: Add CX power domain to GCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-eliza-base-dt-fixes-v2-2-59af0627b7c2@oss.qualcomm.com>
References: <20260323-eliza-base-dt-fixes-v2-0-59af0627b7c2@oss.qualcomm.com>
In-Reply-To: <20260323-eliza-base-dt-fixes-v2-0-59af0627b7c2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1121;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=2OiuwC39r9WAYMNgOQIQbsFnQFBXiUcdl29tWIk77dc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpwZMwJVEvwFZtd5WgfIj0WAYBfQORM+7gZlHnQ
 Y5h1oRMyiuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacGTMAAKCRAbX0TJAJUV
 VocCEACy6KIucjBD6iuTkcei53kBfNGkq0jNhl5UuEg/6tTK8W1blMBF7KwAFERRujW7sohEAgg
 92SFVYJtS9VcKOkpf/gERQHWitMuzYOEFAxjOpwlAJ9iHXgrLlLQSmB6Gx6H1ZlwK+J/LXJmAF6
 PQa8Dtc4nZd+xxQDBfEA6Fo6VHqmCQbEBL17UgV2FQM1YHztBXrgytKYgt+RtnN9JqO5wKl1Ah6
 1m07mLpDf2sNaJRoMwZcNKZjhXBNNaM5jiU0QWdkarPGu1vvech8rmb6KJUh5eYwR9lxfw2hZSS
 G1pDERGlkZzByDeXEL0B37uW0O/KeEnZ4mB1SLKYQxTwtIyYeeSRbPVhnBkFJ86yD8Z1ykaO08U
 r3RMFBMq+FFem6LLce+uQoWCYvjh8x8620tkFKeTynz/6mvRs8Wy9UsdblbZyGXQ/WJD9kCha+W
 +Rcc0xoRTU9w6NmKJPLxvYIPApYIovFBe9KoBwhbzIOEbJ/krTmGX90Wo6Ic56//7HlNqQbgWw2
 kxD3H0SOixN3+mSbzhFD12W59zsuS8Dk/7bgQuQO46CMWLsxYxPAhb6f3HsT723/mQ8r0fBTe6t
 3CHmOx+ie5aVM8vWJPdLkUqtl30dPwNEcdl8++a7LR1/YCbqeCuZRHTEebgButlvfwiVj1G0Cyg
 5udO/canOs7jjUw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=fq7RpV4f c=1 sm=1 tr=0 ts=69c1933a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=eWTIzzE_mSYKg3fclygA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: zvfr-g3O2X3LwLbY1Yuo-YPrhKvaC8M_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE0MyBTYWx0ZWRfX/kHtRrtzxVzA
 2uUeQl6jJS9AziIj46BFmsGiKy16QJmnDFevL9OUWbFdNMX6BvVGn5JaVLhxCSmYRchPPhXbYmz
 F466G2M8QyiBclHfEPIdVBeThLt7pHp6IazG+ZGKmFop2hVrhNKlWjw+PV0QrPz+YBF7uaVNd/m
 zysA108GwnXX5NqDQKSjslQRuG/SN4qvqKT4hhSsaz6SBz3qmaxmcAnTWs9BkqGk2ZuA8ajni3Z
 4NfFyKI4/+quLgOFywDN/abPKjomB8YwQpgc6+T+JnyrfD9FbTAHz+cuBrZ/XR9Heq+Ck6aZ9P8
 PJoCB3/ecmdCRFE3WhQ085gZe4rvT5sA5QEcvLYdUZrMSSqsa8xQ1NCRgRyJXT1RjTjjKGZb3wl
 xbUMdlvzpTKe4/b3lWBx/K7j82nk3fJzY2yQnLGAGz2NIfGKd/lRyy2isp2ghi3HM6tDYpAlpch
 39ltIeTn8F2j8kKNINA==
X-Proofpoint-GUID: zvfr-g3O2X3LwLbY1Yuo-YPrhKvaC8M_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230143
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-99379-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.1.134.160:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A7C2E2FC26D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Recent discussions off-list highlighted that the GCC should vote for the
RPMh CX power domain on Qualcomm platforms. Without this, RPMh may not
aggregate the correct load for the CX rail, potentially leading to voltage
drops and system instability.

Add the missing power-domains property to associate GCC with RPMHPD_CX.

Fixes: db7fe6963466 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 5dc3aede6842..fab603cd8e42 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -617,6 +617,8 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 2>,
 				 <0>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.48.1


