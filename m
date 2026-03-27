Return-Path: <linux-arm-msm+bounces-100379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iO/bBu+vxmmiNgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 17:27:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 837043476C0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 17:27:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43F8030D0A6E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 16:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B448352FBD;
	Fri, 27 Mar 2026 16:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FDEHV79R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kdWYeqZ7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65C0349B0A
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 16:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774628339; cv=none; b=J1yrjbGJVdgymhOl827VeUnDIeIPSDZfXLm0jqaTgCoeT4+IHym1o9umGwgjXRnm/6KK6jJQ2v/uI/0iEh1wxOlD5qeA/0nLGzzKd/O+bpowOTx3qb6TZd/fQOd5hP4G8RZ0snQQf7FF5OaLeqjDIYpjBDaOUIukyxur6geHxK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774628339; c=relaxed/simple;
	bh=++cKNIal19X4oEh8A764XygzDlFyLlTKyrf4nGOT7Ag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mhPtF115J9NGK1mMy0qCA99DP7AOXnlo0jW6DL6/nLwVLu0gF8sQse418rIgU/czro7WAap8YGWx86pIe/mRs7FZ9WmTO6es88wnznnikHRuTi0sPGqkWnn5sMulnv2bJBJXwFJMFyiNwkbblCO2IvH5/b1Mf+lCN7PoXF3sN7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FDEHV79R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kdWYeqZ7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RDhHAA2769235
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 16:18:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mLOukGpyFsZeSsoE1YKizPDvlsXi3Qkt+oPdKTifW2w=; b=FDEHV79RCAg57Q/f
	dKZUqHb4WULXvR8WW+Lqnh+5CC8U79on2k9978A2FhWK0qJbdqu1bhtR0yBayTMa
	c2BDJDfGlOtJ2eY1cytjcUV+WxMvYP1X0qi6LQqLAdWHcuMfwJmTN0WgUQbcsmat
	12rLu5QuCzMfEsVu/eigKMk1oWInP8Y3w52W/ViGwiBd46DAVkirYA4O9g6jOaYn
	bf0Bzz6hxNOu1uTIYtyclIpFvHXzjtnwSFrmBcCwzzHtdTlOHEdGy2APapctSxAK
	Q9g2uh3IPCYkE/OvvY72cpomyjb4iMXqNE7586bnnjBpTuEMr1ILQTl+2nM3jLll
	M+W4hA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bxv3tm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 16:18:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b52a2d70cso62956641cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774628337; x=1775233137; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mLOukGpyFsZeSsoE1YKizPDvlsXi3Qkt+oPdKTifW2w=;
        b=kdWYeqZ7aWJuV8tc/UwKi7OKr2TTCIdXW2bNJMCIMTE+SDFbBVwkqY7hiGJ/1qHbUq
         Dt8aIy7AEcELiYiSII5rctT3gc3nfAOKTqzIW2IQHOoF22Ka6DoijaqP1dxArUW2k/8I
         Dxj36FznQW73hf9PkxvbSxa52qBhfvs/Vt81X+SdYhrhxjCdUOEhXr+jYECTdZVk89Ho
         NLr0ZlMHhzPHMXsw2MeBUCARX/smF9NDHCh5hYHx6rm/bCmubt/Kj+dNU4Kgtk33LJD7
         xDLPA8qOep1u6e/K0TuAMrholEtk3d5CVPSjXU39p9kN9LhZWTTUPwHPEIJU80hSBXra
         UmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774628337; x=1775233137;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mLOukGpyFsZeSsoE1YKizPDvlsXi3Qkt+oPdKTifW2w=;
        b=aDi67bu+tCRd2GZqlLpr/BIKvcr9sWN8bCB9SdVlgQQBbr2Lgta20POyZA5oILNsyM
         C2HJe/0jwsm5ubsJwMX9xgbjd8lge8Ufr2yP+DizMsLYyBDz38h25ZkvwKQF4Q3rYEUS
         Ftvc65nH75vpY/cgLgvG8QsLn/gUsAOjRNZhf/OPFqbUj2gHpXKhUZFcy4SVLHSxpk1i
         GVkMEfsjAHOSCI/Gk9IngWItplyeNoZfLxhGYioSkD23/s42WttJ7IDPpCre5YoeD+Sk
         rqdYqVMxTjKnLdxhTLbhOvI98po2pfdvjgLWSvhYGJMvBdw9bazM4iIc/F76d6OAJyGP
         ISiw==
X-Gm-Message-State: AOJu0Yy1zAkjxJBc9+VSyg2B6iQPHhDy7UY5cUkSB0iWqZYQj7p3X6F0
	YNgHosOz5N7j3GYxgoMWFgun+ElG55v+32QJN1Ut8jFveU7Jo8EL7cse4exSlowKJZT8OgXH4mC
	3d1C1k7FoZon25vK2O8mikjr5ifa5dGjKdEY0CoqWF3lucsaMaovEGNz0EBMFI0DSnHyKwec2oJ
	1J
X-Gm-Gg: ATEYQzyQhwtwcH/UacW1/oSdVGLz/2OSV5dM5aqyXnSbqndFburxdlhk8oQievYgp/a
	gLjgykNwtguJlczdA3UcWlh849qRj0b5Z/pydzxF1yO3S34DUZDPc9jKqpowDNo9aGDGcjmf2Sb
	hKzpLlA7ixXK54FgN91SI9E0jnkY/CXuoKaLqDI0H62iKML6mjljfpNpc3vzQwbCfxsQvs7/22R
	OXLIXPACgr57PpTuaEwgm+7FAFLOI2n0FQqfl+pc74xvPkBHLUKvScxBi6wi/ZtjzsWtFTug3g2
	IWn6fet4bHAsPutCuEpAvRq8XGTfLW2cFtVQSWf4jMAAcLm43jmXucOwJZHUKQTrrVmN6w5FXzB
	pfRtYiixDP8zjWPbEuw+gNdLtn6Y=
X-Received: by 2002:ac8:6f1b:0:b0:50b:52ee:62d2 with SMTP id d75a77b69052e-50ba391e9a0mr43196711cf.38.1774628336810;
        Fri, 27 Mar 2026 09:18:56 -0700 (PDT)
X-Received: by 2002:ac8:6f1b:0:b0:50b:52ee:62d2 with SMTP id d75a77b69052e-50ba391e9a0mr43195971cf.38.1774628336200;
        Fri, 27 Mar 2026 09:18:56 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c6b495sm205955525e9.2.2026.03.27.09.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:18:55 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 18:18:39 +0200
Subject: [PATCH 2/2] remoteproc: qcom: pas: Add Eliza ADSP support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-eliza-remoteproc-adsp-v1-2-1c46c5e5f809@oss.qualcomm.com>
References: <20260327-eliza-remoteproc-adsp-v1-0-1c46c5e5f809@oss.qualcomm.com>
In-Reply-To: <20260327-eliza-remoteproc-adsp-v1-0-1c46c5e5f809@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=977;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=++cKNIal19X4oEh8A764XygzDlFyLlTKyrf4nGOT7Ag=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpxq3pBJsn8iH6FN97lVHi8+1lzSw6uelAHmp6+
 I1d9xl51GeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacat6QAKCRAbX0TJAJUV
 VtZuEACSrCXxyc9p+/lM+XJuK9Jx3ZUQuMV5x2Kb94bthX+zD0s9fy3I7vjPYIKRr8t3p2Y6O8n
 /CwGbOjZI+BuP1+5YG0RfTvfVCglT5Iq4XZoYeG4FZ+DGTbPk/a8+Tw7EQZHu281fvs2qJZbWux
 9kfDlGt/a724t4vTKwdsIobY6SajuErOfXx2c1qOl6KyMgWomSW1wT6UMUeaprY92ZOmmFMeklj
 kSvonvp+WQsF2O+TkyXYy3Zn/1HOd4pulQPzh54ppGgwVfsF8J0yw7TKGUIjcZ4iYRkqQX8G5hc
 U6MeLs6mhMehRB6Lg8Q2Xur3wcuTU5VRCkXTrbRxvJ8GXKVmwa4WpYmWctxAyWdg7bv5flWvNc5
 6vrYIdOsvYq2hc/OBBePLTDOVoy6A+tRxlNFKsHkVGOzA9e8I0TChKkQYv58tV5g6qokf1pfRGc
 UGmK8k72T6DbMaSQdZhSW5ihLfMIJUuqi2Cfjul+dHGm7P/szEVKivl0L1+VLnmqemjsfhVTap3
 KeGg1IsvHOphXLxPOhCDO19zgGIk8uvv3jGGsWr/LgyKshhLVP8kDZLi2XMwlo1N3uKe/n37lpv
 yV0eJeFBz86PNvj00HygnwnznB9B9UI1GeflMEBDv+7CoFdhmUVX98AchiLXkL/9Oyr70loJzt6
 O6pkOp5n5laXy9Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=A99h/qWG c=1 sm=1 tr=0 ts=69c6adf2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=K58yWSdeSmOVA_MdiSgA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: _9VcsRrHGyhAzuhlm3iuRIOi23DjiRsK
X-Proofpoint-GUID: _9VcsRrHGyhAzuhlm3iuRIOi23DjiRsK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEwNiBTYWx0ZWRfXwTaTpX1mRjMd
 lTsJuoSvWqVUbURUVllrmzWu29GiY04tflyMuc7RxpE1KB98AesrQpod3aORdAWgq8rv5YYGVNI
 blBRUN4iVbgmoxd9E8t2kpp8VjtCqZjgI19Q6/wczjyMWvIBYYZ1cJ/GIkQSWwR+xbXx5KbzSRI
 AarcjooNSBmSO+XVvMwkUkVUMTI5KuGK5yB+OvgN55WfhnQaxUP3p2cjUSPryOjy67Xo1WgiozZ
 7QEJ3JnHfKL/9i38noLayMJ9A+3lIw2KZCKoWkENjyaoM4jAXXMNt1/Mi6qrELpEjwJ51K6HjvG
 UuikjPHjt//xPb0xiPkowgGTX+sVp1lweJBooa+2uuOzCAmss0rmV68BX8I84u2fIv3lVTimD+V
 3eSx+u2xQmla0Pk8nvykboLrNrVx8KX+XtWJGBWlZzIIhFYgrxSPPDlMHE7BkxSgcUmO2XmrXZJ
 R1uxc1OGNy0PkRi56YA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270106
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100379-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 837043476C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The ADSP found on Eliza SoC is similar to the one found on SM8550.
So just add the dedicated compatible for Eliza ADSP and reuse the
SM8550 resource configuration.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 46204da046fa..671e57b47a34 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1531,6 +1531,7 @@ static const struct qcom_pas_data sm8750_mpss_resource = {
 };
 
 static const struct of_device_id qcom_pas_of_match[] = {
+	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource},
 	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource},
 	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource},
 	{ .compatible = "qcom,milos-mpss-pas", .data = &sm8450_mpss_resource},

-- 
2.48.1


