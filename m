Return-Path: <linux-arm-msm+bounces-99129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPL7FOf/wGmiPQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 09:55:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C207F2EE838
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 09:55:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E7903301CDB5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 08:54:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44F26385514;
	Mon, 23 Mar 2026 08:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Trg1ATVi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SrrcSQTp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEB9385510
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 08:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774256071; cv=none; b=fRJLIgar96LH5tmUYyy5zMHuHj/dX1x4HRVOjRj48xd2OZwoGULFcFd/++XZGj7SFC8WdSkTkm1Y+gkX5NJD15YP4WWYDd56LJfDkyitAxCZvh+DRo56q5ZgAF6cDEWzLoqWgxpj7OQaw3C/KDIWD37QFf60O6hMWyB56h8yb2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774256071; c=relaxed/simple;
	bh=ypEi64pFV2glo89XxtZm2HdHHzV0uZjCSiCheKZTlHM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MoJAdgpjCyaQ74+Ik1/0vzO2CzNsS2CSQWgu9VRLdTHivJLJqotGF+DEZxSY6u8LMYseuqLgftnQSDQb1q2kdyeQY9GPZ29v+gv+QklXH37HE/LawEbLU/tJnEJyHV5brog/1M8sH0LlcBlak4wQ7GlgGSm5/pmP3zovCyAC2MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Trg1ATVi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SrrcSQTp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7tCpC2291198
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 08:54:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nd8w5xBd6hNj+LCQVU2FB2kU+tfacWvd0IZ6Q3ToAHA=; b=Trg1ATViX1jTkeCe
	ORPTxOakuW3uQUr2IS5hqpGWLHkhwRvwPiZ/PAUSClerH7f3DE+lJVWKR95lNvpT
	NmRXqOTrzHqNSOfCFXLJb8Na+HmZ6M72Lc8hAISmZLnbqUYoKm77FZtDJ/Xbk1Ui
	/kisGCzupKrDyrcaOGkB8aSTBjms9lgbKKwPo3IGbyv66ZVPawaP9Ek9pDA7ZBrb
	UfMw4KV07C+dSsLPNz0HBuo4Y/idkv+2/I17IZbSGBV52poaX0DyGM1jqTEA9Pmb
	YrNjsjN2ACCVdleNzhYlxwvhoDDDOIWW9YyN1v8NENfzQFQn9Il3hzRKXq8fgt6B
	D2/2dg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31j705pk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 08:54:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5090e08dcfcso362752401cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774256068; x=1774860868; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nd8w5xBd6hNj+LCQVU2FB2kU+tfacWvd0IZ6Q3ToAHA=;
        b=SrrcSQTpDECC5npNShMpfXFdjR7XqyeRJt2N/AXS6IdWGPUDB8+wl01DPWombDTuDo
         ynBBbud9aeQXZK07fhgGF/hBsS5WhGAUlbgWBHkxxpEnVAucAiPnc1nCOjcLrhlTDowE
         8QVfIA5IVjKgDlQUqYhKILQGwUjRC0BMfKo2+oQBhZR6cYM7PveONQISb01Jl6mIkGt4
         /pFp1mb2mNQIGivn/tuoUk+dcZ4t21xiscY9UNR+LYpvorUEZH+3GXZgOWi92MM/KpZk
         c0wmOykWH+U4e7OmSYPQE/jGd63BGSJ21ilZNsE/gvdhIKdyWvBmeaL6lmi+pwDlasav
         GZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774256068; x=1774860868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nd8w5xBd6hNj+LCQVU2FB2kU+tfacWvd0IZ6Q3ToAHA=;
        b=eMZ/2G+Bw6Y2DMukYOFdZE/oazoxsbBdj8gRRppXJPT056gRmYyIK+fTzY8BVCgxL1
         EWia3JEI7GowyY/hoEB6VVhOQJZ0kuuVcyHlHUrhKd51lXC/aMJvSdBTjlBlRAtR8vdL
         AwsqeoWg/BYDbUmw4pODT1xE19IhCZtcDYBjSf6zc1a/hQ4ZfQRuqtQdOEyqLspWseJo
         BRpw35shPG3Ny4NIoJTjDFwekat5CIfwkKqyNe9bsos7XIejx7xvvNa7Pe6f5jTRpwo5
         gK8dR0UXIQLu/KX4tpDZiV8GS4b39A9cUfeQFGO5tWOT02uyQFGOKqXTUnuEwaGU2EJP
         YMkQ==
X-Gm-Message-State: AOJu0YyTVuML7CzG/5jWhcvbSbfe/Ii2oYKObxp5vaBqNW+HqKkVJTf/
	LLp0xUg7OZldSK7uIPiTtFdf0+XdGKF4JHXmglqq0kaKD0vPfz+pLZZjkuZhLNNWn+a2LfFwOO8
	1DLXqckB3EuMYpw40qi5fq3GbcVHmnd7ie1MuLA/sKNDks6eqXJVjV32IXmrASZLe+3MB
X-Gm-Gg: ATEYQzx6VHtyNifkv1M0k0KJye5LiYR5W2HIYOp9B7IuQwoJYaXy4Reb/VQpWPgWKBH
	fQemmA0XIyMaTy1G2yEdCPhjB3NZYZ+p6MZLp2AUGdd15qLcAyu/JbXJADqigLHAGSEt+aNOvij
	TtO51KSGTwJtu1RXTJjxytqtLGx6C8o7PnTUfPwebzEsHSNnP+o/PyPovIxUwoTDUY3WprKsmeG
	G/qGoBDt7+rDQ7JzPJ6VlgKFTn5+l38QdAjl5Q1zNM7TV9bI8ABP+cN3ncgDUidTdfvYPbD9pNO
	rd0Sc7wD7FuK8K6CTJZsXZf/Rz6QQbZ/AJ1flj7gG7MvM7KQ0eJZIS+cyjze+9w6FvJzqKjDJE6
	F25za2OGv+9eK3HmFVmbMpDgR7EudzRynjj9WWmrTujh/
X-Received: by 2002:ac8:5890:0:b0:50b:3f6a:1d88 with SMTP id d75a77b69052e-50b3f6a2050mr152307171cf.19.1774256068481;
        Mon, 23 Mar 2026 01:54:28 -0700 (PDT)
X-Received: by 2002:ac8:5890:0:b0:50b:3f6a:1d88 with SMTP id d75a77b69052e-50b3f6a2050mr152306961cf.19.1774256068073;
        Mon, 23 Mar 2026 01:54:28 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c27sm27911739f8f.18.2026.03.23.01.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 01:54:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 09:54:12 +0100
Subject: [PATCH v2 1/5] dt-bindings: usb: qcom,snps-dwc3: Drop stale child
 node comment
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-1-3bcd37c0a5b5@oss.qualcomm.com>
References: <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-0-3bcd37c0a5b5@oss.qualcomm.com>
In-Reply-To: <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-0-3bcd37c0a5b5@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=812;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ypEi64pFV2glo89XxtZm2HdHHzV0uZjCSiCheKZTlHM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpwP+7x5qZ7osOWOXn4XF5PTSAGBR1RBPDvLMnW
 veTAZzql6uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacD/uwAKCRDBN2bmhouD
 199JD/oCvnbi7NKCL3GwDul/ThBxgn4z+dXPvOmUpd2ICChxlXlzO4tl5AEWNGvpzY9G+glGkhy
 GZZdERFt/+s+fT0KALJGPiFV7qtF3o6wgxiRJD9wSUlr8EeBczLx6LQBBf6MhfE2zsRqNgCKDAa
 UVTQuNGXhMd8PB3B1/j3fLcbvxt5xm7b8r8RhDlYNZODrw/JA1yGQw2Y294bPk4cgDoKf3nRDIT
 M0IYrBSkjUki3wrBiD2vwNMywCaJ8RuBJ/Sc+sw4Ok3ctz7aw2Rs8gtqTLWjo2xz5MaOvt/FmQ3
 txeUcLI9fNy97pTwoBriO99unauB2iiftGngOmL+aiE+gB5Lj4GlKgOL0bjl7PLsxrAiBcp8Mme
 k1fEUEL97Y6/O8tdEV+ziE2AjGdhzooiEmqAsqiEHmdxexyKkHmVY/XKw4w+TyzdvAGGRBUqJOI
 ZCFmCZICYICFQhK/xYgChKP5Jgn4xjBBeWapvLOfwTuCX9FgM3zifvzMUntcpnA0cjFSAQU0I1k
 qd89KjosDo13s6NcmSNIycS5cHE5b03DrrBf1H9NVnEkNqmUl5ILIQesqYSp7G2OtJJIemXumSi
 HtMpyd9g9vGPINqtU2ikftQedihAQUPgdRoMNCWd3h/1KK8JiOQvBLmcu1biutRfppXIkN5FAnr
 PHlPZNXNfNL2UHw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=ArXjHe9P c=1 sm=1 tr=0 ts=69c0ffc5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=OWNo7BSMJsPq8WwrYUAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: eUlXEsqfTQPPE05IvJvyG1mreDNQ8RGx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA2OCBTYWx0ZWRfX5GEn30y97ecw
 CDzRfM7bezwzSvM1wNdUTwSqs2dpZIDImIhc2cOOVa77N5F6VJdpCnjF3jGuDtiwPLPAkm6F4+r
 kpXBjP8Krm2hKCNDP/tOhk5JMb9JpCNUIwjPrHpDrBomHcqVIROJqAdACHzwTax8txEAtAstWOr
 GoTLWvcPaC2nIX+d+dcH49BO9hVo1pthS2Qr1WAhJptnAMy4G6AUnOo2U/EZrRnV+Fr5wBuKUlO
 7W018T47JB4mdNNB98XjYWcid2stUqL+JntW7wf1uBI+IgfgCcK6//6zuRiXJ0TNBOXIg4F7GJS
 zJMS1984SEko6HDwwUQhaoeNFP7zOLXijOwUGShPIX26EZCZI0W0vUZKOJaMblFx3F/IwU+lgcG
 qdGnu1vNQ6f157Y/rpqqSj+HJWSYAuVrRgICiVSx2GaCNhcGgM/XFijLoXGO6eE+GcQwjevKp+x
 Y19BxpobAx/wbHCG43g==
X-Proofpoint-GUID: eUlXEsqfTQPPE05IvJvyG1mreDNQ8RGx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230068
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99129-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C207F2EE838
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

After moving the binding to style with combined wrapper+device (so one
node) there is no child node required.  Drop the stale comment about it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. None
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index f879e2e104c4..2b6a0939d98d 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -153,8 +153,6 @@ properties:
 
   wakeup-source: true
 
-# Required child node:
-
 required:
   - compatible
   - reg

-- 
2.51.0


