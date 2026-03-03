Return-Path: <linux-arm-msm+bounces-95140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOBVOLbdpmkEYAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 14:10:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D1C1EFF13
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 14:10:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1099830ADA4C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 13:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B37B1421F1F;
	Tue,  3 Mar 2026 13:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PkjnB4sR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pk8IZCNp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81591423A67
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 13:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772543313; cv=none; b=s0ALErtUwuaxIXoEYNImjY0f0ePUT62sR6aCTgyfT0wC6PFa4Iddz5qQPmp8dKpMVermXgrc/f2ZmzJ03A8JITdDYUoMvJ8cFdRczbaX7qNZqMb8LTvtD3WH5ZlLemCgxihz+U83DJzQbEjEsKGDASh3UH55mnQPlO+ryhWX6Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772543313; c=relaxed/simple;
	bh=a04VvScGPy8agTNS+26kjliVeVh+QgZ02tt89F9pBKQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pAxFPt9Bar5UBW65BwSJ5y2txyLNC5n21Are54rSP/suZyb/zR2Fj8bm616i9a+K5BRHGa+Kq4hnBxs9T+o2y9V+2/4lGzszamBrLa1Plh7Y/ap8uSiqbxldOhVHdB3UToYI+QKRsin2LDD3o7O5qPRZknuI0ntiWLsxXMdj+tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PkjnB4sR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pk8IZCNp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239mwU23996541
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 13:08:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EKM1A0OBXmPdZyZjolZrK4PtsUrsUB25P42bpvnjkS0=; b=PkjnB4sRyh0U6jD+
	ySRH7n8BSFrKW9Qe9lRzHswaZxJol0aFfaJ/pYTma73PerqdPHgFa4X2HujSlmAY
	yUluBb5XLwB1sCbwuL4U+nFX3g/O831u34fGnghJp4oyrDiRTrlHNWe2+0nWdqeE
	g6WOa0vWBmzoMSFs7dJztYCyDAuzih5YR+JUwXSozyKURlAw9Jv2ERTl9a7HKBKx
	DFOU4e6joiUvF+MyZB78ygxaOyXZMdWLlqdrI8FNWcuvC8ZW2qrnEq3MSzhfekHJ
	6DKe9UD369Hnq2LvXULNoqn8TlO8jcbXFJpbmXaNyJZNrGE3c59BIkBAn0ttDhap
	bQZNUg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cns5fshb9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 13:08:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3a129cd2so4534088385a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 05:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772543311; x=1773148111; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EKM1A0OBXmPdZyZjolZrK4PtsUrsUB25P42bpvnjkS0=;
        b=Pk8IZCNpH58JE57c10DKvAWyk0LXztB6hsafO1RSikbEobfjdw5QhT1ulNhmW/zynu
         cPoWeHOwllSsZ1N1KTOS52WcGSOaSruWyePWq0aEFGl4i83L21kXMottm2yqXxLYGFtB
         Jc2kHoD2Reku/ToDyw/DOiHlIFoowHwI0AzvBuDPGOmuo6L7vXwkfIL77QOEzwgid8HL
         /6pv1BElz7/QGouayjO6UKKrvoHDY8T3hyAc0qS4e2ZIeZm1ijisAJW4z6ujg4XNydc7
         l9us6MLg011Wo0m9Fh92/ahEyegj4oHF1nehnCC6qF5DOWAUAIgn6VPf2Os+xfGgG+wB
         7RHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772543311; x=1773148111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EKM1A0OBXmPdZyZjolZrK4PtsUrsUB25P42bpvnjkS0=;
        b=YSJ2oWnjFP75eQq9XgzaxeLLhmp6cIbHx9EiA3SR/1fJ4YRy0udZgfySQ6zbiv3Faf
         QwRH/91We2olLSgwo/P0xyH0bmB1O7bhjU97Z0sxUW1hzf1DIR7E5hGmJ2/tKlT5Fsgn
         91qSljaqwrXAGdzIFehk5eRjHjRPYzftPabzguyaCOxVBPnjpCWvnpPPBEUr6Uxf9UaA
         DWB/8aWdoDoQ8xHM4vjbFriITRCZIznEgDDrZm7EnmK3Lqb7L/GVyRKVx0CKA61Kp/EA
         euyZer6KJ4gvZ8SazDshPZIqucvqv/6NKCBeqWPMBP96ceYKBHVKFGRbq/aL2QLZLMU6
         ENBg==
X-Gm-Message-State: AOJu0YwVUIhwuzcqHvfkDtcnIQ28StLup3dT6Kp3pFQKWvbV+C23ubLy
	i5LLQS0+I+et6o8wrCLO4u4Bb09bOxbUtvkGbohoIWmtcbVs2aJL8py2PfAWCaDpE6kgWrl2jom
	0cis7ZG0q2BV2rso6rAWmw2HWUcyBs4mieyAkFERRR9hmwgiQ9BmNG+Ybex66obDputUN
X-Gm-Gg: ATEYQzxUgWs/OpstG4mfNJR3HbfsFvVnQ3blQwSkHWBSMuytuZFoqUjPCNAi1xcN4vL
	H3suJplJhl77WD/nQrCeXDv1d/jN9LtaEJ63ZgqCOdyxvzHPuBnEcOqIgyHGAzYTbLBSqvZs198
	gZkD644XEApfkn3LWE/MW+M86pw6Zc0HiRhhdxBI92BXy3ZpUwTpu8ZNsDkuehuYDUI4/GJ0mHw
	ZcKFbAui2db72BN5zCQZBAUn9eQ+eT0olgOnip7h19oXGZ94WLNSkF/eeLKv07GxYI6lfIG28yW
	ZDEf6CxJKZnxkAmPNZJIwlUheJokndoOlX09ergdqV2m645D8qyvqaruw0YSQrZW/CwxoS/XJGK
	+7yXpBLnN0Mq+Snj6RkdWmvUSnSMkXMqeNgYb0mgVpcJ7
X-Received: by 2002:a05:620a:d89:b0:8cb:1e3c:96fa with SMTP id af79cd13be357-8cd50917db1mr199826185a.11.1772543310733;
        Tue, 03 Mar 2026 05:08:30 -0800 (PST)
X-Received: by 2002:a05:620a:d89:b0:8cb:1e3c:96fa with SMTP id af79cd13be357-8cd50917db1mr199820685a.11.1772543310151;
        Tue, 03 Mar 2026 05:08:30 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485126563ddsm26253495e9.3.2026.03.03.05.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 05:08:29 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 03 Mar 2026 14:07:56 +0100
Subject: [PATCH 6/8] soc: qcom: ubwc: Add configuration Eliza SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-drm-display-eliza-v1-6-814121dbb2bf@oss.qualcomm.com>
References: <20260303-drm-display-eliza-v1-0-814121dbb2bf@oss.qualcomm.com>
In-Reply-To: <20260303-drm-display-eliza-v1-0-814121dbb2bf@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=967;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=a04VvScGPy8agTNS+26kjliVeVh+QgZ02tt89F9pBKQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBppt0w+e8kZdLFm81TaK0gDpWNMnyVUTIVLqqmU
 MgAlA+Tix6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaabdMAAKCRDBN2bmhouD
 14jYD/9Ud50BEEesW23DcIVppmrbC2UIVuyhv3fn+5VFk17pVfPJUlqg35n9lsHfx8epiy0N+Yn
 8DLCRPmVECNELwwS6VCOq5UpBc/kxDNbOsOLfX4iLAAGSVC+fxkqgvfPvNf5ZOO7OSSi8FAf4Xm
 oUCQlR6R5VTeLV8xbmvlbKAEHnXFVzJ6ZdWj0yEZtXusPkEkLHJmbUl0Bdl3hFJWnKmfsB2PMi8
 HrHe2VkCjl8gnOeamsdPj6uSJDhtS0oyer3eBiQd1TfnuWz0QiOXwWw0z5SFaiEoW13Kwwbnpwl
 vwjNpL8/asijrsHMoE7SVuHw04lhqE9SOBjhUufG2QMzq60o7XG1Mr4lwff8k8D46dm4px2KeyN
 lwOIRDwE1XXgmGjBGUN11UgowDnrWjLuG0zeWVh352BB8V1e0sh1oGU4PTYP9GQJrKLIG6PqABW
 b1NeqdKwM99aZ82q8f0jnSxXwLpOw9LwyfaHtFqbte7uPpuFXUVdYQ84gX/XVvtqokcPV33B40T
 pgNx6Xrgv97RazD/zGFWK9f7DhHaZ/yn4ACwS7XrOi/eHd+0Z7DJSgHw4oCrokBIW3CTV0472uh
 P0hIq/81N9T2hH7teud1T4DHxbhRwJRPzyjJg1IvUo87dQit0zhM8pZK/M34kie+wVZ1DfiSXGr
 axU5Hwa7IXYZ0pw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=Pv2ergM3 c=1 sm=1 tr=0 ts=69a6dd4f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=vC3vRzACQ60yIF8bxv8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: WafcWQbyLQroij8Aj7mTXZ2GVsAWo7hm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEwMyBTYWx0ZWRfX+cg9daVGZUf+
 TzGSOZMYnGq/kGdvAS0TOdJEsygPFQDOgbQykBINf2f+5kmUnu9+6CwDgGXGdrLHY4RHw94Bp3x
 SslY9aEIahRWiqavopkVYXUQO6gnfx/c+N5L17zugYWkZFIEzw0+B3bsotiELCPst+j55wsge9/
 naFbCkND8y8OIRHhVP3+FJ6wAcOPXCDy00TGptQ84KiyYmJol1JZVFJr207uA3NvRoRj9GiFffg
 S25Pt4bl6CHjRbQL1AEK8Ix5paiBkQ3XHuO5fBaI7G7P/T5k4YoT1K3qYrD6OfSZmvGnRJrD/8t
 YKGNAHBuPjO7dikBDOzTy/P3lNKwF78rNCLk4O8/v2RCufI/tqb/4UVTWri6dcg+46ADnb3skt0
 jBGTEid6wSnjOvJqw3eryzXcivYsfEVtJKUrh4kdHPOvza4ThN+xrCTeBymk/Ejo/At6ksrZ0mQ
 Y+meYdQFRVkQOcUcKxg==
X-Proofpoint-GUID: WafcWQbyLQroij8Aj7mTXZ2GVsAWo7hm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030103
X-Rspamd-Queue-Id: 62D1C1EFF13
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95140-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add entry to OF table for matching the Eliza SoC, using same
configuration as SM8550.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 1c25aaf55e52..3f32622aedda 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -245,6 +245,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,apq8074", .data = &no_ubwc_data },
 	{ .compatible = "qcom,apq8096", .data = &msm8998_data },
 	{ .compatible = "qcom,kaanapali", .data = &kaanapali_data, },
+	{ .compatible = "qcom,eliza", .data = &sm8550_data, },
 	{ .compatible = "qcom,glymur", .data = &glymur_data},
 	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },

-- 
2.51.0


