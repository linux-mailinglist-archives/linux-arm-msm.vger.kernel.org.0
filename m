Return-Path: <linux-arm-msm+bounces-99873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCVJNIPXw2lwuQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 13:39:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B258325043
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 13:39:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1E17630E669F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1392B3D6694;
	Wed, 25 Mar 2026 12:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hedlNCHL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dDjufTO6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6813D6CB4
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 12:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774441029; cv=none; b=XNaboXo7ilszNXppSyqZky+X12KUdp9VgUBJMkQR9TD+z3fUq3nZ4S0rMRsDNNtbXeNNNvE8DliZL/bMHH/8rrSpxZqvwck75Bz5+IAD/4oZnHEu0sa++j08b2PfiB/WbCL0v34q7aUMLZM+yI8ZImjIy4ZPXyn7xpd7mQWTsGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774441029; c=relaxed/simple;
	bh=d/okUxTNaM/IDldvLB6GVpWxMWbJO4kMfCR0JuadaFY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JmZA3VbvaT3YeKEeDIvQIF3vvUQofI/F0DBcRnp7qtefRIxUb6gPEBp8fFZ0D0vFCDQTknNGsL4gHusuFz6MNtX/z+uExRny3l8hezCIUHVT7YLVMr/rHswAeBbMJEbEzfmFVLEWVPZsCv0vwDCeNQpTYnX4z4vuHl+e4XBNGIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hedlNCHL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dDjufTO6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGak3876402
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 12:17:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PMrpbBdlyE2XeeyO82dhVGX9eOY8ec9Iakf8KN3jnbs=; b=hedlNCHLeleO004B
	57n31liYydxdUIRHXh5sRG3u/qpGzpVpaTohO/c74r1U7WcMO2YVC+EFBa88YjjS
	LX2vg2cx0if6TzJGkD09nXh+xDn7vLzhQ+6iTyoeC4aMQ9cgHDFNbYteRMkA+fo+
	OCAEmymvzBA19FHZTzj+SwPf9H6T7d6YES4B9K7Wvo7byhGIDJaM71Tigm5kK/Lz
	1f9OLMsnMYaSioRz3ByCHmDk7O1B4BwaY8tM/aU5cDhKmx8lq1TXYFpudISRRbjR
	8PZcnpXGfvuZRDXx2Q2nDXYsjtC7aPeLeRzj2LQnCuQy98p8vaGuirzoyThm2/+p
	ZuuCmA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d40f4k43v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 12:17:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b274f94f8so29416121cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 05:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774441026; x=1775045826; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PMrpbBdlyE2XeeyO82dhVGX9eOY8ec9Iakf8KN3jnbs=;
        b=dDjufTO6PvrO5YuAet4KQPIOoQl5LgmQb/UTk1eZr+x0NlCsNTEi7o/2YSo/igE+hW
         NXe9VuBmiAdI6OPGrooim6Wzgx2tW02WMBNWPBJF7lm7SgW8r/bK3mVtPNalILn0VmM3
         Qlns8QjMKXOIobmnJQkMaoUi/EW26jeloUhULVDfPz5no2wzxrvHBhTYJtETINoQvGOq
         sEbWUQEJzXv5Ee21SwNPZioG66FwFq2bZ9+kIk/L1CBJidEsDz2Lppmj2z85VTNxOoG4
         GSG6WKUjhC4ZAlHOKDgLBklhzG41lBYg4kvdCXncQVu/4Q4C0ZuA/vFWqbJSUVAImezC
         +/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774441026; x=1775045826;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PMrpbBdlyE2XeeyO82dhVGX9eOY8ec9Iakf8KN3jnbs=;
        b=RGCcHOSEHJ4XE53hLANONf+C1v/ssq9S8KZHop3cV7xXENkekZkaC68RcWK2VARphW
         IhvKhq9SAcsuNdFTQoH0HaVPdp1m0DgqJekC8W1d9T7uhhOT77dC5GiK1ZnzeFBY8wQk
         +BIe8kDz6QMRv7fQd6S3FocLPgSfx3Z9oL4SqLntTrPHTvcP2FNFe0PAgWhTI/jbqWwX
         st0zfv6HcMm4yTBjgkDkBXiy1jZr7A4vE5KjumE9BWN3eFZ7CW4gjcsEORUccn4CZg4N
         moLefho3aub8Sh9Wx8uQwLpvD698YgxIZ9uHlm6XQhm0x5UMmwrIHAURrPjQdyGnnVNV
         deqQ==
X-Gm-Message-State: AOJu0YyVmSgMPKTZWDGPe3ftrXwz1ptJDcWBemv1rORpGqpJsK05Bw4K
	zZS757CpFZ1KNNOqOTtrq6KuD79ZZS5/SMbLkb/nMTiD5WuW92dxugD6Qv7aL0jY7DNGYCGzHj7
	/Hvlyd1Rry52VIwGWYKFitcfnpat2knj/BzLvcGhekFYG5DVQEQnBOWLWK5lUTCuDJV71
X-Gm-Gg: ATEYQzxkzv0tJI6f8cMo/a5W9pCfU4zI1JM7pQ01c7weRWz1leNodN7+iFdr+tPWyZI
	bn9geIU4z6xBByZA3nCdLWxYErKe6dTLsfIDkkmGZ38n7blDKPnLl/YBotatvwoRY1NdrqNPK76
	IiMxeK+MOMwi8c8HcK79X9SNqg4kxcq48qEEc0QWlBCMadB2Ct6q0g2oIy6rMQaooUgf7TCG+wv
	BinjN/mJTRgIXumixpctZztdaI8TsCrAKRyHYCeId1+mVrxhFJajOoFGFchfemkY4i7LuSHnf9f
	XN6p9M4u2cYlWqIzqM9HacgBEuTv14qewu5/f6abBDUzo+5JvjLiiyyitLPWN+veRdbYQ9MneZq
	yKwgkuuPYPj+Y8xOv9mi39KY/b+nAwqpB73WCrPD2mIVd
X-Received: by 2002:a05:622a:d17:b0:50b:8c01:210b with SMTP id d75a77b69052e-50b8c01272dmr10153641cf.31.1774441025983;
        Wed, 25 Mar 2026 05:17:05 -0700 (PDT)
X-Received: by 2002:a05:622a:d17:b0:50b:8c01:210b with SMTP id d75a77b69052e-50b8c01272dmr10153151cf.31.1774441025421;
        Wed, 25 Mar 2026 05:17:05 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b8a106339sm6480356f8f.36.2026.03.25.05.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:17:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 13:16:44 +0100
Subject: [PATCH v3 3/8] dt-bindings: display/msm: dsi-controller-main: Add
 Eliza SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-drm-display-eliza-v3-3-dc2b2f0c74a2@oss.qualcomm.com>
References: <20260325-drm-display-eliza-v3-0-dc2b2f0c74a2@oss.qualcomm.com>
In-Reply-To: <20260325-drm-display-eliza-v3-0-dc2b2f0c74a2@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1204;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=d/okUxTNaM/IDldvLB6GVpWxMWbJO4kMfCR0JuadaFY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpw9Ix+0ehZQmyCFCLUtJAq1ccOum22GeVUzY6n
 I08Yx9lOcOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacPSMQAKCRDBN2bmhouD
 1/X6D/0ZPLgw6eKyTv3UdmXt03oTKH5HsS+wvm/rjriwlGD3UUHcL1MOC73u3hlooVXO5zUHeN+
 ex0o1ZZL5EYr8U88fzSPbIHAwSRVEgadOTqIf75FLND9UFeVNAuYsQFHut34CuY+Mj9PRdNyOsi
 NBzrB+JohE94HVIoEFC3WT4zkOXq/GA1rVQLSyyVQx+QeKNltLCe1yDdhbfqnJwdoA6Xe4bdeJj
 ZVvkhrpieuQGD1TzbMtmxwtgD8NaSEeTwkPJep9+seWsZKK5L559ilY0vkYedg2JG/cK+84D7Pd
 IL2rC5YxQtEB5Y0nhfEGFbzLkDfngkSY4lSWawht5P9aUdwofwwkfAJ78gn1og+QZyp/tqWUriU
 bMIT/7gROiau9Dv8t/+fbKoWuwL7BUb6aUNznOWP/nqH/FX0zUNDxYbphTCHWJFskj5hxXuvy56
 12hKTo6dnFvLSD0jECQsxX3tsR8Owm5Qfo1u5VNJVeJOQWfCpwBea2C4ldyPA3zT7Zvu7vMLg8f
 S5QYysi3PZzRPG8TDed0wGirnQLXrim2JLr/D8xIuhepSFfdaaO7Wlo43qvYL8smBuCCvAPUfQt
 URPMDaTYXxbaL9N68yZXlAr6AKTo7MpWhuQiUnTKQOzM46JRHcEMYqxOaPh4nxeYpP5+KkzszdW
 /2dhLjkWVCF+2lA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4NyBTYWx0ZWRfX484U2U+BL5Us
 a4q6d9IIDqybzTbUebJaG8Iy44Un5Acb9Yeon5qZdeOAUZmlQLIzuAo4VGmiDLU9EvHVPZHtl/v
 jzh4t6T2JUbHP/g092ZcYNiMJ32OPxfglmpGf2j9EyAUBhi2XyHHomKyNvvgO3lnQ2EEkinn2T0
 /c6iP3FWSNxaOLXXu7es2NFMcYYKT3nvdLb1rxPdFhQqKWgnzrbysPxsdWKe4l5xxKDFAcQBQaQ
 8f0m1kPzCvF4+4GDDOjjlKpVLn28hZM0Pq2V1u3XBc4m1M0hi2y6EpItUiA6SS55qtg7P6YSM4x
 XzTcqgLy0lqm79yRnztQXK+ymSHm5VU8F0HzLkSf9BrEssIm67cBnfWk7nkid3/xE9ktcZt/mQB
 Z7TPAmGhHEDLnASul6jtN9zPeKQ/28CyP+3ktjRtDo9WqRrISMMWSZzA75KHDCkMSSX3E38Lp7i
 m7+KieRC6vw9B4L4sQw==
X-Proofpoint-ORIG-GUID: qtjQMr5YBi8k41A9tzi8TIdFFugaqHv9
X-Authority-Analysis: v=2.4 cv=Cd8FJbrl c=1 sm=1 tr=0 ts=69c3d242 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=o3bpWG-eKcXMc0DUatEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: qtjQMr5YBi8k41A9tzi8TIdFFugaqHv9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250087
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99873-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4B258325043
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add DSI controller Qualcomm Eliza SoC using exactly the same block as
SM8750.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index eb6d38dabb08..49b8b6db45f1 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -51,6 +51,10 @@ properties:
               - qcom,qcs8300-dsi-ctrl
           - const: qcom,sa8775p-dsi-ctrl
           - const: qcom,mdss-dsi-ctrl
+      - items:
+          - const: qcom,eliza-dsi-ctrl
+          - const: qcom,sm8750-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
       - enum:
           - qcom,dsi-ctrl-6g-qcm2290
           - qcom,mdss-dsi-ctrl # This should always come with an SoC-specific compatible

-- 
2.51.0


