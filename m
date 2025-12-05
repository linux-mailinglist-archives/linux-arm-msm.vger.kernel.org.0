Return-Path: <linux-arm-msm+bounces-84498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B320CA7EF6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 15:25:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB4F03159FF7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 14:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D769C329E7C;
	Fri,  5 Dec 2025 14:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ajoheosN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M6pcwZTP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39E125A640
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 14:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764944629; cv=none; b=q9kfyAdneK1cOwFEbNSWCG7V/nRrJp9fzTgVYBdKYzfedbWW9XJ5dSlCTU1xHmmoLHu5ePgGZwWQwSvcKNkhOAEh2AeXIjJOaCKUl8MJVrioxerIOpgq8roQCQ/WFFHE3qZqwfSMPLMgRzYiNkKye8NtDo7s/jnhUk4KH3ueETM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764944629; c=relaxed/simple;
	bh=Md9TKdx16tqGAyZcKVYrxHIko120WWyVK5V8N8yxhSk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EioCFJJTWfr56V80K4Q1OWlWoi9xyJiJXYS64RiNv1ckCPp4VKflMVgH+8FrHX1e8Kd1xxh4rI7xcWqWUKKS7ZnBbYQl3WG/eSEfzWrGfGM4e2jJWiucUi50/u/hVWW5VH7eg8/Y8XpgsGQOVuLAZeSvC/wOypvjKD7gWsOnLYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ajoheosN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M6pcwZTP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5DZ18F3529435
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 14:23:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KpL1ZCAi/bl6NzNe8EooB2p+xF2dmVy1zpbHfekK8nw=; b=ajoheosNf3z6w+nU
	6xA40b+t68I95QRK2n2ew0Ln//Fyb/lb8UqxmrqRYvgk+knVR6Qc2PcD2kcmbA77
	zcugMwXAVu/BU7C2n0Q3IcYbQBfZnxdsRE5nF0MF6yUJbEi+0tlWhTu4pPw4zxBU
	SA0zuilDuO/M53KfpGpCMRvyTChjQ2eTQKKSpjWs+9ZmqiKEkLpi5OAj2vdZKN3Z
	nyaJMnZU2dAl8HYOoe2cPwIrChIcNuUVx/vqP282cCsyQWyK/YJpV1959ndZgiZI
	yzv7vB8P3ca3R4ouqd8ONs+xvgI77zxDno60p28Auptj8IESRtPDu7wbl9fm9HVw
	PLUbuQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aurwvheyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 14:23:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b29b4864b7so483573785a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 06:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764944623; x=1765549423; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KpL1ZCAi/bl6NzNe8EooB2p+xF2dmVy1zpbHfekK8nw=;
        b=M6pcwZTPmd6uWquWmknf+mdrBO7IUuBJnO0mxzphf3uB9ILCkOllCEwsBZXv/8gLiX
         sDhoefG1WRhIHgFc8RmNz1+cc1T4FBcAhcHs1UfBBQtsY/7ECKesJCUeJxFfO8jIESPZ
         b48qx35pecX1NI2jtlMFmwzySg7lnm8qPRjeqLMd73WEI1x+1NWZte59naY09dSsujJ8
         4xSZR2cLYiyI+XIijTWktQd9GxSVDYyyf/GZADVAhq3CVjFMiEmF9RTOhzr02OI0A3vR
         KQv4/mLWlvuRnsu09hsPqnHhMKTbSjh5kJwiOl/sqv4BKpwHEQSD63+pwoROzc/NXezZ
         iwQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764944623; x=1765549423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KpL1ZCAi/bl6NzNe8EooB2p+xF2dmVy1zpbHfekK8nw=;
        b=F19mPHkrHrRRC7N9KCJPFUb3UZsJ+5ChIZMXVIGNKK1/dLa+3omlnSa7Vngqc50yg/
         RUKk0U9lhtfwZewARzPX8dM7Ep+wsmcArrAo0riDkNtXIR9NKcCA2cpg9LFT0J//5AZ6
         /vpopNgM/3qEjE7K6dinRXHnATIJvOF8IKAXXnOnKOcU1INMrXFcLjIWy5dED7jX6LxQ
         0nOK9WqW0LfvO8UIIwLjJZkkHkQtFR/gSKGORwfjo/33WCO6VshppifWu/GETztt+34w
         sGfNdavLBAIgmsZn1K9YlN2yYUO0nXUSDg1xSLp27LdlWAaTA/zcBDNxWrT2Fqb73lGL
         Ypfw==
X-Forwarded-Encrypted: i=1; AJvYcCWLC9+JLzvZsFGyIWP5fPWsxdIL3kB9Mer0yjekqL9b756Wbx3LK3RaAw+benqWdimwXsJgQcz5tXq3vQKS@vger.kernel.org
X-Gm-Message-State: AOJu0YxofwN/KiAiKO8Moake+qWTd34LDBmUXWcAjVhABKgwtqbEvphz
	WzwNDl8t+r1XbyTrZbfihxMyg93CFUf+PEhZVikFYDGtYUXKwecfPrrxMtQkwZgyTs8nCZpC0HT
	BKiR23CM3fDHVEVb+XIOwP4AixIVRPYFGZyd02anDsrECRVGb9WPlSGfA+2EjDpd1mtgP
X-Gm-Gg: ASbGncv9C21BC+ylTP/+AGVJ3bO3tku8cI1/6cErAwURKjVg/9wlo0HqSvzeL6R/kFC
	MBy2WKsdWW6US2VU+QHy2ekqPGS2WISxHeD6TjaULJ/Ba/Tn3/RW0T0iJMvnbPvy5H2VHYX3rsS
	NgCPPLwmUIFHGUJDQP4udpmQiK+use4k/sH2ZVoZibAfZUKp/7AHEGMquQYG4r9YvFG8qp+Uwg9
	JJrauheCCY1Mj97/oHL8hpicv8EWEiR+VDXBylTqJKfproqgnRKdFXzmPOAY0ofjphIswUG6p/p
	gwTo4UKhtkVsVZgsUCTwNXWbisieQQ70fI9zaDfLt81P/72x1+5IY1scTpeYn0G+1WHMPxLXHBP
	yu2jzhmDhvvdPe8A=
X-Received: by 2002:a05:620a:701b:b0:8b2:eefb:c8a6 with SMTP id af79cd13be357-8b6181ebde5mr1026505785a.88.1764944623197;
        Fri, 05 Dec 2025 06:23:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHup2SCd/gh2IpnEn1N/wtFy3Wz9q8vNGu5VpdX7RGFCFLfkYZEo0Wx7NclFib82W5Vg4TNWQ==
X-Received: by 2002:a05:620a:701b:b0:8b2:eefb:c8a6 with SMTP id af79cd13be357-8b6181ebde5mr1026499385a.88.1764944622632;
        Fri, 05 Dec 2025 06:23:42 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d331df0sm9414161f8f.36.2025.12.05.06.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 06:23:42 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 05 Dec 2025 16:23:21 +0200
Subject: [PATCH v5 2/4] phy: qcom: edp: Fix the DP_PHY_AUX_CFG registers
 count
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-phy-qcom-edp-add-glymur-support-v5-2-201773966f1f@oss.qualcomm.com>
References: <20251205-phy-qcom-edp-add-glymur-support-v5-0-201773966f1f@oss.qualcomm.com>
In-Reply-To: <20251205-phy-qcom-edp-add-glymur-support-v5-0-201773966f1f@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@linaro.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1246;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=AaogKH9/xxrfRbTLXrUVe3RNsCYBntk2k416s/czYdU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpMurlJukjdqWbBNoUet10fKcTbzpwtwke4gNy2
 W2QMH2oAsGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaTLq5QAKCRAbX0TJAJUV
 VlukD/9ogyxLBu6/01Var4hq2k6HhjswBOML6K8oL3KXUdJoJHtqobF6L7RcAUOdJ2P7oB3xq/g
 84cWdRUb54AM68WSMwCWBlpTGZTZZDjnMT6BOph+0jyshswRu4r4aPOXNYEjW3mrZolq9V1DoNL
 HBEpGKEvF1xYihMh6x/cMj2/wLXn8YU7tsykW6Cx7eOzEYPSdvk2To0HQqO/1R5GJp6otHHr33O
 DVG1m/jVFbKsDhidlChBJFZ15wsuiQHjgxudwcWYDgsUCjbJ5FvEqkvBRGky803HoyMFjdHkrQn
 lreDLBRzMdArZ/qLDXiFOD1CQBWUj6L88CiGrWbuxP5TjCCclO7y+ulID5SEbwuPNBy2lS6WMB2
 DqEzqVsEFO1Rz03IEfdUnlpE3bnPl30P5km0MaeG5KcytsvQFJUwHSNry6kGc99IBf3jmeLtnkb
 4lRa92t8aSS3kgJOt9B1HJiHUk1sEZIRR59OFaypcaMbHDM/ghIgfTWQdFPQJ0Z/t18LP3qPLVw
 OM3tPETqt82lnnEWwgev924XpdikRBSiojVxu3/DxikbNbhCaBDUJNO7L8JrD01olGdNdeB6pj6
 ZGvObeJw10ezTk3y1NxztgVfFHvvMEyguSkDxv5qMJDRTKYX1H8P8y2v6VQSyt6zP1nu/yS30/6
 V+b7FnZhqvYv4MA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDEwMyBTYWx0ZWRfXyZsE3kT7Zf4p
 Cyhuh7A88YfnVHS5OvyZNL8cCPMvMbUzh8jqE3mtCIgHcbwURxfUqCbv8SQqa8gxIPjvjajIX1S
 50SCPbfybsOMc4W1BDUBKBcg6EUYBCKm58roHByIO2JY14KVITQ1PRuzuUzW6eif9Ab3xiF4OvT
 aguiXbLgViHtjxkzFcTdU9cExpolCvgOXylYE/FiN5i3sxhicIZrMctMo3cGfi7iH81BojIYUlR
 Xbej0srBMzrMy6iThhXCrtBtmtxvoFEJcLa1mAva6/RdnhgRZi8XJhtzrUU1eGXfVoRzgXVQGyx
 JgMV0RMzj8E1WGUH7vxnrZ5udvJEnnC/xOgrIztBizMo4TRCOFSiz1lVG5Oy+kJ4UquoAYvrhiX
 kPgUNUWqNmuSPPFeJujqbRoLRyJo6w==
X-Authority-Analysis: v=2.4 cv=Yd2wJgRf c=1 sm=1 tr=0 ts=6932eaef cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=EnfBGAjIh6IkBJmaZGcA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: _3IHyVOeZND5GJBiE-vmrmiGj05ZQA0O
X-Proofpoint-ORIG-GUID: _3IHyVOeZND5GJBiE-vmrmiGj05ZQA0O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_05,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050103

From: Abel Vesa <abel.vesa@linaro.org>

On all platforms supported by this driver, there are 13 DP_PHY_AUX_CFGx
registers. This hasn't been an issue so far on currently supported
platforms, because the init sequence never spanned beyond DP_PHY_AUX_CFG9.

However, on the new upcoming Glymur platform, these are updated along
with the rest of the init sequence.

So update the size of the array holding the config to 13.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index 06a08c9ea0f7..f98fe83de42e 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -32,7 +32,7 @@
 #define DP_PHY_PD_CTL                           0x001c
 #define DP_PHY_MODE                             0x0020
 
-#define DP_AUX_CFG_SIZE                         10
+#define DP_AUX_CFG_SIZE                         13
 #define DP_PHY_AUX_CFG(n)                       (0x24 + (0x04 * (n)))
 
 #define DP_PHY_AUX_INTERRUPT_MASK		0x0058

-- 
2.48.1


