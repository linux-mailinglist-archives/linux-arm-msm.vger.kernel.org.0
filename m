Return-Path: <linux-arm-msm+bounces-115767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id B3y+CM9GRWq99woAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 18:56:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F4D6F00C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 18:56:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Ej5Xt0wF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="UqLvq/rn";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115767-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115767-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 791DC3025F69
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 16:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5FA537BE85;
	Wed,  1 Jul 2026 16:51:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914CD3806C2
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 16:51:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782924675; cv=none; b=iWcskqWY/K3/SYP2AHB+e8fXyPpVYhoKt0fy54i/sxYn5SrZk1juy9/DppUVj5KcvOb2212L54csINcjy5fCG9yoTxyzdOiMOMfkenhN6CLawTyvcj/c/jdjGdPep6qLi7nE8KWGlUrtEfNepSQscO/BGCrhJcbRRsrSJu61jmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782924675; c=relaxed/simple;
	bh=TR7+IEJuNG0r8AVi72eMbaZNHEWCYm0qL3Z6EwOAclM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lzGmqeOjGe+PRAbN2l6kd6/4ibRdsQIYvxUJPvYmHqFQttNKQKgiIZUnp1oNToaYn7COgS90Q/NhST9K8S57ujz3hPTXR8UYfrn7m2JH6zTu2K178w7blgYmzQTYvgZFx6mzXzr3R6scz1YaV1yEcQw8SWEgy/4LfvunHJfjvMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ej5Xt0wF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UqLvq/rn; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661GmceD1589773
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 16:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mQA1MLuVYmC
	JM4wnv1k9JMDKSdRHRw9JwbkaWYSTWBI=; b=Ej5Xt0wFyAbaFoqJQZLpIovWyvF
	/guTk2rgClaNxQangJGj+2xMaDuYKaoh/1b4V/pZdMEesCOik4bS8MLWm/xxV5lj
	1kfiGvw8BWuiDvRHwk9+jC3w+XrO9P91rxc/fSXN4H53YgVZ3qC07MEZaeXYeIg1
	z1jcAWC7kyccUTOIboY1zOytH7RLHM4X1UJUTWigbpT59Rq95pB8PErubZVNLKty
	plEmGczqtGPD2wo34DbeZyWYXx8mxyo5B7yO1P+042cEuyTIFXFsdOtyLYS8fZVB
	TBArnvewJ9FTZLkjFbGERSaDYiOkBwAfPuZz0QDDb4lgZQGuDsh8abwFjjQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f53q08vm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 16:51:13 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c9c26587e67so765852a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 09:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782924673; x=1783529473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQA1MLuVYmCJM4wnv1k9JMDKSdRHRw9JwbkaWYSTWBI=;
        b=UqLvq/rnh10uAEEsaTvEHUwdbwnUbiap7+/MR+tStCexc37fyO2s8GPNCPRztn0tGZ
         2KDYG6tXRnUh/tP9DBiaRWzv0wjl6vox3FeaUR76YInFYFfmpn8G82+VzIGgqE3Ozn5T
         Eo7KvOqsgY4vA3z6UYmoOOZR6JtsUTXFVlyWCevK6A7T/Fer7+rMNtdslo4/x7QVOVy9
         WLW34s9Caq4DoLR6qz0fsQH8UphBkOSLF3lunnAncrGA3u1gwywnDsm6BvHAQ1RYTUIx
         f/+9kaYHmrYRobVoJmLfu2jwGRoOnLOXXewQ3vFknVnoW1stXes2z3pX3hbvMQgTg9Ic
         mKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782924673; x=1783529473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mQA1MLuVYmCJM4wnv1k9JMDKSdRHRw9JwbkaWYSTWBI=;
        b=H7U3L3DXFupIhUTipbOOQJ6bQJtB+TPYlogwR2hpBA+jRLRa6eoWFV7ZdRmesikeZ2
         SrNCmKPLDVX4rg2c5shV71Oi+hov+qgGBoVJ/ht8Qlj8Dxu8B7MJMUFr+uCwGtiZFNMI
         KHjFyaV3e47SZOXQ6FjYdYK1d3FjsQisNs7WumlCLJQu4D4JmK1haFg7osijaPKxOcTl
         Crf1gSWORg+fGmFF3jYslPDrMDR3b2eAtf2CTzb//wqbm7G4Zl6xGglcUsRqcxfI9Czg
         zjVAB/BH7C1NRalNoF3xRp7LX06mR4ndrVWa+wQj3RLBuja2oiM+SbfRCEwx8LHnbdNG
         ragQ==
X-Gm-Message-State: AOJu0YzWmFAc4Hn53y8ZLXRGjGPoapB0hENIHZRczzJg4ziUtWzT5LSI
	+ErQDFHBz6JEVVJvUoOicfLlW2z+ONx8r5KziK3rVPht4FxiHO1WHPALHulkaa9OqEbKOMf64aZ
	IVs036FGzw8zF4KGwnoaI9bUyVQovGdYqmz7wBSmwGx5GNKh3yXkDYgVf410Wl84DXQ/6
X-Gm-Gg: AfdE7cksbB/gdoSYR2ijTO1SULZk4obJzAL/M+i+YZkb7jAFqu6SXTrNsiy+7AqlFFp
	1uOpNO/HleNPw7sfCXboecNiXqstMFKd3eRv+HYbsiZDlU9x5VmKD2WFYQ5Yet77IyQrH3hrWp/
	NtjgMDo71vMcsAYvHdQWclNWS7M3FqcB4LUluHLZckSphXKmjMx3IrakxhtYdDqCTvhC2xBKdIK
	S3YC4jammfUKqeNoaBWP7SHig4lPe/Qo5YJ12w5sRyxcnjlB7TfmZcE/Tos4g/r5f3wBzuQc2Hg
	ylo5VMc4E85hQwPkkxLisZZGG5ZDjjnPU33hZaT8tGg4UkUKil8ZY168PlwxWdepP6FD2++r8FV
	0ZoiVGOKa55+ce4xPidEGIkEzrvFjU7Qh0dPwz/Dht3333j69S1ZgnTvLaN6da6/uhmg0YKICvx
	Iz1fLt
X-Received: by 2002:a05:6a21:7109:b0:3b3:3852:6663 with SMTP id adf61e73a8af0-3bfd2849453mr6618101637.24.1782924673013;
        Wed, 01 Jul 2026 09:51:13 -0700 (PDT)
X-Received: by 2002:a05:6a21:7109:b0:3b3:3852:6663 with SMTP id adf61e73a8af0-3bfd2849453mr6618050637.24.1782924672506;
        Wed, 01 Jul 2026 09:51:12 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee317095dsm33038935eec.15.2026.07.01.09.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:51:12 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/4] dt-bindings: phy: qcom,qusb2: Document QUSB2 Phy for Shikra
Date: Wed,  1 Jul 2026 22:20:48 +0530
Message-Id: <20260701165051.4122259-2-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701165051.4122259-1-krishna.kurapati@oss.qualcomm.com>
References: <20260701165051.4122259-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dtnrzVg4 c=1 sm=1 tr=0 ts=6a454581 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=ybcDLLt5cEg1GZjoCqQA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: KnRe0HRk5bWvKGOtWxT_jT9eRjFtCXzx
X-Proofpoint-GUID: KnRe0HRk5bWvKGOtWxT_jT9eRjFtCXzx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE3OCBTYWx0ZWRfX9XUXSyuiCphO
 C+w9NN+vG1lVJNZlJIQwk3VsN3YmKBw40166JXHUquU53b1k7dF2lNNLYb3tTKhEfcU0z0GZSbK
 yoY4+hFRl++7oa8nohN/oQNOQJjiNZODqj/KVHOvkwdYLSWimOJQTfT/CmqNiXUFidXyPfgnX+T
 RQ5GfbXU6PiJ+SXEVciha1vNCsg825hsa766xGEcXJvXSH+gJBmizJRtlB1qba5clhqg/XYxgIr
 qaZIeGrMq+Zlv73l6kXTYxmwc4e/BaQd86tpfRzkaxM0OkFU2z4et76fR4EuSw1T2CqegIBJwql
 Ez/eBqwlJ8RMyWoUkaKO1AZzwoqUm9EkCQcGpMF7gxsFgH+7Wlw1udGRJTYCr57imGQ2A5IPsvb
 vB2OiVb7ArBDDinanhfu9nAW1cVcp9x373qlJN+eT7GCqo5G0mmt4qUkihhLjGJPkY2B8CB+/b2
 xQwt4I7bhLnkQp8m9cw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE3OCBTYWx0ZWRfX4NLLXCU41g49
 3dVFtyQG08K7Sa1IdqOYmwHixTOzYZKc9G6ovKzZS7L5S/CCzuacAUm8VoZqS2/hm8Px37EC+Pl
 aAHGY3E49XfjC7IkNht3EM+dhEAe97E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010178
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-115767-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:vkoul@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:xiangxu.yin@oss.qualcomm.com,m:johan+linaro@kernel.org,m:loic.poulain@oss.qualcomm.com,m:shengchao.guo@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:wesley.cheng@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.kurapati@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:johan@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A5F4D6F00C0

Update dt-bindings to add Shikra to QUSB2 Phy list. Shikra SoC
has two High Speed QUSB2 Phys.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
index 449c2a7e5fec..001fd0ccc985 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,qcm2290-qusb2-phy
               - qcom,qcs615-qusb2-phy
               - qcom,sdm660-qusb2-phy
+              - qcom,shikra-qusb2-phy
               - qcom,sm4250-qusb2-phy
               - qcom,sm6115-qusb2-phy
       - items:
-- 
2.34.1


