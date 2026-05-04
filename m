Return-Path: <linux-arm-msm+bounces-105781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mH+jF3LS+Gm41AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 19:08:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2F54C1C0D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 19:08:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0DDF73028EA8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 17:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A1EB3E3DB6;
	Mon,  4 May 2026 17:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ReY+r8nM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P+Qds9yQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450753E2778
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 17:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777914438; cv=none; b=Hy9bFfDa2hl8DluD0L6VkiW3M2e36bS1K1aoi63FXkW/2wgmCqmLObtX1p9ullk9BITLobPgnXXz6n3CW50TQhmPUGclFqYeXrS9+Lwjo2nlsW9Ti1oMQ8/8IE6fuaZsRZdRPMD+mkCM0S885teqpE0RQylIUHeUfanKCnvsGN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777914438; c=relaxed/simple;
	bh=FJZo0Et9Ge7zPzweNtmgpx8X3VvZyD/yo2q6nwgqe48=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pa3BEq2tIsbnTaGD3cCo1Yt4U/c1WmBDyHr1RlqQXbItLDm77HMdoNWv6gXY8K3LFuqPLzNn2y6/Cs955gtvkJZxFVE+wwJsh/ykLmbBw4okq6b2d3aApIoGxK+z5tksP6mISi/NUBmBOiRAwAD4Pdr9UAOCiqU/EaWmpvyutGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ReY+r8nM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P+Qds9yQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644B4GkO4128856
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 17:07:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7Hcpw6i2pAT
	sENpryDxAQXYUopirQwywsIEKKqL0g/s=; b=ReY+r8nMq5FtN2czRVMgeCUSJyx
	cALaP7MCrcE8uep3GFh+EILEm5wTgc8kfz++3aHLvvTWvPG+S+uZEZTF87aM6B8S
	e8g/NObeyViXeKUt3PzfskSkCvT/foTClziCApO9Y9Q2gbHMgUQNepbSWwAyOHI6
	j8eLIU80Ii4XTMgDfoh/hXqrTewGwHBiOjlmTNacDtjAJzNv7B/TjGKCodbdQr4p
	taIBes+WIXqHI8bCtYdb48G2T/YCiWhHimVFpPmdtEbSHd1iNNo5aZv+JS071biO
	1JLDtVl08MBo1QXw8o9m0swUb2IA62cYs7/gjxeMIeQp6Kv7CWZnCZXJ9wA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxsdw1dvu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 17:07:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-365290bc5adso895086a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 10:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777914435; x=1778519235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Hcpw6i2pATsENpryDxAQXYUopirQwywsIEKKqL0g/s=;
        b=P+Qds9yQFevlFlCdWl8OxF9t5MRrwu79RtXUPr141EsYs9J6Itjpi8RSLoIFiLaWeY
         1/9E+SBQwUApahADn43DZKPEFAKlHZVfqB70sJj7jr/WXt6y+1eyoihxSzRFPIfaVHj/
         +avlVDC9+2zUAR9GOpqRr7lFByTq9P7wV458HRHDfdU39wk11V1WFCR1BPs3G0xT5PuW
         QN8Rm1KgXR8r9upDPsJ+n64CZbYLf/D5x6eDo+fylDB9GSFg4DETiS8Km2YuGHWp0uUW
         7Dq+jexZRJte/3f0M7ABxwQRV8zk5qznH5pSIjINNe5zuyMo/jrfchtknxaJgvs+zNwd
         po+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777914435; x=1778519235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7Hcpw6i2pATsENpryDxAQXYUopirQwywsIEKKqL0g/s=;
        b=e6fyzFw1m1F/q/29GUGq+gqOUt0fTUdOJv5pR8Nt1knmJaeu9JcJ1jHPelsjQp6UNG
         t79h1Xr5M8hLcU+ikpP+wfJUf3lddpr2InEUBBbvbPYwOdK6xAlOes9aDIYFjM0K05nD
         4x1v8qIx9kxI8B3/g+oPzy110jm0hbK3UwrHMEp+/fzzdm2zAiA3Dyxb1xNfhyFEFeRu
         vrDQpuHzrtasW6TWPTS9e4mkAayEn9xUaIpOnMqV79mEwKpnqMd/QTKLMAkOLPpUMaW6
         vhmkeeFr+2ao9Df4rBkeFvoXzRTo2eR7xc5jspYWki1NBVGIGt6f7ESQwRyEJOGKvJVq
         8aww==
X-Gm-Message-State: AOJu0YxZtixvfJ0PdA58yT7J0In/p6f0GcnJoOOgnL67/mBBxfyBZIJc
	UCmxVaHJk4hFH093lFKEwGrzjCV6b9mq4PsJq8KbF/QOqVn6O8uy4lfWTH0t5G/f4gSODE1lSLN
	/Bfv4qA+bB+EN3l66mkP40UplU1/0LPFIQOQbSGkzNuSVe/boQwOjM2AUYwGUGlwIAi/9
X-Gm-Gg: AeBDievmSn2o9AzaYYbUMXyt1VPomwn8GqWUGc+/RlSawTCvrHavCjHzmkfOxV+Kh/m
	FN9an3IVZS4AqHXvvRb7p5Ot12N2r2jJ35vnKShJjMS9Pu6RHP/h1IaXeJriluRzrLkIGmfW2zf
	GVio2INz5fn1/zq45yv3yW7wkYfRBuZxoChDg7CH0qErD25e9oxzvNkAX3wAvSVJdWcZhKPyj8U
	ZE+M77Rlj9NtlLawtdMh8E3kECH2MgesaEMpCej6Z2hV1NIADIqKzuq8Tt3Ry458NFT/SuMm9ji
	kuaa51j2WEXZEq035WSGguYcqJIwmlnV5DqgVQlhPQVrxiwhqKjg8U/HHpc7ATMgEq5FjkH6Keb
	jXGa1cANmbfMwhUKlFcL6oIIpsq654AcWM7z5YG98Ix3F6var1sqzLaQbjn1uGYPzjdaVGPAW3c
	fnLxP5PPPux5lxy6MVUUmTe210sQ==
X-Received: by 2002:a17:90b:254a:b0:35e:577a:73a9 with SMTP id 98e67ed59e1d1-3650ceecfb1mr9817617a91.26.1777914435224;
        Mon, 04 May 2026 10:07:15 -0700 (PDT)
X-Received: by 2002:a17:90b:254a:b0:35e:577a:73a9 with SMTP id 98e67ed59e1d1-3650ceecfb1mr9817583a91.26.1777914434610;
        Mon, 04 May 2026 10:07:14 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36528ad3154sm6256847a91.2.2026.05.04.10.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 10:07:14 -0700 (PDT)
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
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v2 1/4] dt-bindings: phy: qcom,qusb2: Document QUSB2 Phy for Shikra
Date: Mon,  4 May 2026 22:36:56 +0530
Message-Id: <20260504170659.282532-2-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com>
References: <20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=a7AAM0SF c=1 sm=1 tr=0 ts=69f8d244 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=ybcDLLt5cEg1GZjoCqQA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: y3vAURcK3eBShIm7S4LfoAPMAh2LRaoL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE1NiBTYWx0ZWRfX9jw8hfGOy/DM
 9y7KEgHMoWTpoypDKMjzU68RLhXpSsAPHO7HfMNr46UdehPZ2RSeaP4wkqf/fP+5HUqg3RcZM5F
 q3boxpDnNvhbvI2wBGNIW1GZwbRZjZsT3uraM/YkZ7J/l0EA/cVhRvgByeDsesx1r7oOvMkbdBd
 CtTeRM74etz4T3/C2R7lT4RpMr01pMdQ+ZSMgpj58I5fsGFvRpxD1iQeUxvIYXmXMgy84M6tQEg
 n9I4Et6CcXwP69zL018OcnqStXoZdoxw8ZQUjpU7D4FJDwL7Io8dMEugByCdlHzlNNeTrZrEJzT
 9Z69CnxRaDl7AtqBV+QKgdFTDFYZBistldS1ZXgS77Eko/cIJFyeIxRUz36dF7BQ1F89/2UjOH/
 H5NTOmVWITw3JaR2wViQhslH1SVlnAEmW9k9zhoYDSoEXXs5noV8NiO7MtWz7ALSsDwTIueGsSN
 BUVDwTwnjrah6BOG4IQ==
X-Proofpoint-ORIG-GUID: y3vAURcK3eBShIm7S4LfoAPMAh2LRaoL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040156
X-Rspamd-Queue-Id: BC2F54C1C0D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105781-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Update dt-bindings to add Shikra to QUSB2 Phy list. Shikra SoC
has two High Speed QUSB2 Phys.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
index 39851ba9de43..ddbddeec6fb1 100644
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


