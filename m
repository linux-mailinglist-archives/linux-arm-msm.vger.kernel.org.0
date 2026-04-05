Return-Path: <linux-arm-msm+bounces-101863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GikNPNy0mkVYAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 16:34:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F4139EACD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 16:34:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9AA363006837
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2026 14:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 455E52F290A;
	Sun,  5 Apr 2026 14:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S/o5H1L6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="avenTjJI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9A62F3C22
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Apr 2026 14:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775399659; cv=none; b=TXgiz/XqJCQNiz4EEmLPelYnd0OEMbru6GW19WCCZ0HUKAYRBbHAP0fsyoUl08Q7OMMr50CIV7cTGiRFxnzDPd9Rz7BW+2SH8oYJki3MZ9r6jLDKRmQoZwGDzu6Q1rd2qD3PJ0JJJr0mzbmTehMKIYtEvPAQk3moAW8rObkY2qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775399659; c=relaxed/simple;
	bh=/AwuQ3slvX7u+zXvSCxYc/1viX2dd/v8iApXYini06Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aaHdm7H1RtoqkOkBCmYWkTtRLsm/4iEh4dURG3x3mNz9hy0bW3NQW/mqYejLsGYl/ennhM2F4ntOoMxXlDTR0DtRB0FzOBJNS6doVBJiQ9sWEQ0I22Uzf18j54HHGi/cQUN9abyJAv2evSzt9Ew/ltVcscnNJ73BLdDJSnXnfeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S/o5H1L6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=avenTjJI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6350o1fP057611
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Apr 2026 14:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bjX6VMKyzRBT25xOykCqLKOuijJg+tPjmnlmSr8nHJo=; b=S/o5H1L69bXR6c2e
	UPkgC0eXKB2QLbMxCi04URc7urTKLNMLW6rD9pldZCWx/C7ikkzoDg2DHD2JGbCF
	S/GUMR2ebwaMdNz3AKVRSugMD7XVXhrc3eo7Tj5pxU5erNkf4xQ9navxz38aimYn
	2KhsLqbcvmQdgHpo0XTFyoE9O8Ra4hZDtCAX70jkF5oh/ks8HFAFsHkieQPcUn5E
	bLCAgj/L//vNNHiNZB2LfA989QGFALod8HiD5VNZ7nwnolqNfJK4YdWfmbYyzfX1
	VisKx8zsp4L22zNxjaiYN0jZ6lPqRRLvytLEh7A1gt8XaXvbvjQR0KzQr6i97Hks
	r3Y6bg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4darbfjv1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Apr 2026 14:34:17 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8a0ef4a7021so52844216d6.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Apr 2026 07:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775399656; x=1776004456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bjX6VMKyzRBT25xOykCqLKOuijJg+tPjmnlmSr8nHJo=;
        b=avenTjJI5ERbP+z6YpQgUM50j2pV6rDF6IklBylGwfDkJ/6e+o/T/8I3IS+Hu19Sqd
         AMbKEdqsLEKjc6L68hBNbTHAAdxviUtT31oMKMdWRT1vo9Ey9Jn+k/bmwUrWy2Pm/SR2
         xhxGKv/NZOqdkBIKpIRo3X8wASEKu/qY0Fp/RBTdt2IfCENPvNp3XcQKuBEMOD2ctsRP
         s9O6mANEwyPL1Hp/ZGmt1YGGsHDBOMvMYj3/dQrSv0JKNglfcxSMcLcqYdU+9FHSu/MY
         g1RVUNoHmdDIYkMtV08yN/tXEmHvtDC4tA4xgpF1jDEGX4GLvBvpf++F8/n+PziaDFvT
         mbDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775399656; x=1776004456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bjX6VMKyzRBT25xOykCqLKOuijJg+tPjmnlmSr8nHJo=;
        b=QtGAUGzIuHl/nl6gOJL2pVG2AdA5h0Vcq1lLfWby8cEcFVcvxGjuDCIuVRghAFEz36
         J7U5w7Cq5vi6p60/cQ4TgG+sTdaHPh6k6npIMpyL1W3SKB+pm84mm1nU+eeZ5Ex/4hRQ
         un50MKOHBklLKSPXJu+ZdNORGa+GsU3MSpnqLdKzfHR1+e+gGUHHSTE+GNy1OlRlnfD4
         W5ZcWR+o8zs6+/6MxNP9uHPeRe7hierqrBBq4oTDYyKyfBGQF6aITTWiA/qVs1Ga1T3x
         g41mDJepYCLwTVZXQtJ4Kgr+UAzEPMkSLziofZigtobtPJ7VItplcefhEg4ckqZ9ekAy
         s0WA==
X-Gm-Message-State: AOJu0Yya+MROYtfKP2pIjBgFZQCGbXKIEeu/qbY6aSkznLoECDlGyx55
	Uv/tNXKXEKmWAJXzpuTfAEWEcThPqhKkJy8Gv13Qt35D57DdOMHjioWYHfyHDKb2UBnQLKVhTvt
	MUESkiCps/MbMkTTPEpKA7kqOwfMmgQSeIKG+qxvMWkStw3H5rMsCbOPD6bEAE0oBnX+d
X-Gm-Gg: AeBDiesqAFFg7Q8k/TdYlxFZTDzTm2MYyBhm6pSKDBcNEkuxl0CjtApswEP5k2/+Tcf
	xprvdsFb3jqzYT1KQuQOtbudEoLZUId77smCoqCAya2ImxFJ8I0rVQ0DIkSV+0hxBS3b9DRhqOm
	9dnYfLpOpiKbxCGISYUEiGxtC01ichywHMryPhraQXsgxcLDBSy+2G4ZvUh/VZkzOd8NLFxOsDm
	+HUya/HNhmA1HoFPJNaIlOlvMtADPEQyHC4x3/JT/7DAUxtNMQrL9LPFDuH+8huz/fhQINQA86S
	pwELoWCQujjzuqYW211ZD8T+Drizn+tEeAFZHPG73pAlqjt9Aka10Udm+qyCVGO57ouyuEiyzsL
	M8UgzE/uzpne9eNVArK+YlqdxWMuGZvc0k6D8P6Iu21jg
X-Received: by 2002:a05:6214:5c84:b0:8a1:c536:57de with SMTP id 6a1803df08f44-8a70548708emr136141106d6.48.1775399656102;
        Sun, 05 Apr 2026 07:34:16 -0700 (PDT)
X-Received: by 2002:a05:6214:5c84:b0:8a1:c536:57de with SMTP id 6a1803df08f44-8a70548708emr136140576d6.48.1775399655622;
        Sun, 05 Apr 2026 07:34:15 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a616sm713934755e9.2.2026.04.05.07.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 07:34:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 05 Apr 2026 16:33:59 +0200
Subject: [PATCH v2 3/8] dt-bindings: display/msm: sm8650: Correct VBIF
 range in example
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-dts-qcom-display-regs-v2-3-34f4024c65dc@oss.qualcomm.com>
References: <20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com>
In-Reply-To: <20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com>
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
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1819;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/AwuQ3slvX7u+zXvSCxYc/1viX2dd/v8iApXYini06Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp0nLZ3SSBPm/uvtqMOn+RfGOk38qJUNHMZ36LR
 WPRavBcjZCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadJy2QAKCRDBN2bmhouD
 11NlEACarsGeDw7b1py/JLt8UVRxvS/VgAMCCZYD6oc57Wf4mzv+hCbwSDXjX6zmGav5RC2jwir
 awYxCN3CG+irUPy4UNGXFU46rqIvgLto9f6nxMYBjEAWnsjuumrTUcaNcMnUUQew0NhVK1DQ4pv
 9WbdQLdvCzhPyAzi9uGzTD+HF9Yp9zTzTCk9YMOXjMourdhugsdChVoBKgl++DWCtrbPUUZPE8X
 Ax3U5JeZ4frUg2ZHGQ4ZK4HqEiceR6gId5fG6Pue4Y4Ql2anQ5HtZztDX0XZyvv5RT+MsgbOGlh
 IMlPBOdTsM5LRovKo+M9U+rtXjOF3pSIuf47NxL7QQR4gdjIwP0dlC8M+KwFtX8Abe+C+Mn6Bqs
 9LD/rTM7YTU7JQasvNVbvw6awiWD6xH3B0/nkd1R2kjTJYbOdJ2LjSGSHVBm36Uv41LQp6tfLon
 f6V018d8AXbLr7EoS8TBAMY0f4pHQ4UBeQJDy7jzrkJMO6tVlh+lCeEW0X8HQb2MkM3OUSXEPu1
 Er4to4aVmyJXIDqjwIm3JQQjcYuYB/aCwGZWGyFv5fll5pkpY2YdzVUVFMaNQRjL0/PI10+xzlC
 VJur9JDMKA66LO5dIYKOTurjnuVer81hUbQXx6ftePmx4zMh6pT2mPdgFq45QsSqP0r9L/qje/J
 MAFD2xpfJmOm1qg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA1MDE1MSBTYWx0ZWRfX9g2e5IoWCKMp
 zqlZUTVdc/iuLg1f7ur+FePdkhKgOVatlWDfl0xuK6yZQyON3i9+hzcNzOUT0FBCF9HKBKJD1N3
 MJnoV1Lr6WllycBSFTHtZ1TrQLfxUlWNrFrdwUcBeTI1ZIo0Yg+GKfuUo3u/v68Lxoq68WmHMOb
 AHP22ujgF7t46R8GCO0WrJisIJ+hamFEOmHv2Z2/8NhmkGeZRMOj6cXjpeonWDs2vj+RnlHy9qY
 8TjFNh5W90opR0/dE80P4hOsiSl0660KK6x4fWXAT+mg7yBYwKOFcvNWb9Y6JFnnMxasU6tXNrQ
 970ATAzjU4v87z+jV6uewj7cU8CYzadBZyasZTZLZws902iL1L453pjrZzs7qKehruEOTpT2WyK
 MjmXEpW8B0VeFOOxR+nT8HYH8PED+QtO4uwPGZoEXyl2ta/+SCB/olNKhbo+lvBruw6glfOdGSH
 JDeBlfvTwDAXT0PDvBQ==
X-Proofpoint-ORIG-GUID: ePy_X_HieQSncYF-7AntWlGQGIXfHamX
X-Proofpoint-GUID: ePy_X_HieQSncYF-7AntWlGQGIXfHamX
X-Authority-Analysis: v=2.4 cv=I6Zohdgg c=1 sm=1 tr=0 ts=69d272e9 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=HWmKLdpjvklgZKno_vkA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604050151
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101863-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: 68F4139EACD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

VBIF register range is 0x3000 long, so correct the example.  No
practical impact, except when existing code is being re-used in new
contributions.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml  | 2 +-
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index dccac525d202..134321b50897 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -70,7 +70,7 @@ examples:
     display-controller@ae01000 {
         compatible = "qcom,sm8650-dpu";
         reg = <0x0ae01000 0x8f000>,
-              <0x0aeb0000 0x2008>;
+              <0x0aeb0000 0x3000>;
         reg-names = "mdp", "vbif";
 
         clocks = <&gcc_axi_clk>,
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
index a1c53e191033..0f7f79527748 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
@@ -112,7 +112,7 @@ examples:
         display-controller@ae01000 {
             compatible = "qcom,sm8650-dpu";
             reg = <0x0ae01000 0x8f000>,
-                  <0x0aeb0000 0x2008>;
+                  <0x0aeb0000 0x3000>;
             reg-names = "mdp", "vbif";
 
             clocks = <&gcc_axi_clk>,

-- 
2.51.0


