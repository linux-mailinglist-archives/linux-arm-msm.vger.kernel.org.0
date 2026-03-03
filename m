Return-Path: <linux-arm-msm+bounces-95138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHTCNJTdpmnRXwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 14:09:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E681EFED6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 14:09:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 98CA130A4ED9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 13:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B92D233F8BE;
	Tue,  3 Mar 2026 13:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M7tMzMeH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MlrFMMQ2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E9C425CCD
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 13:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772543308; cv=none; b=gg6SF6x2sQe4ePg+mP0veVK8irfU1WU1vtU9qw82krRFPWW55P0G/VgP7RZqA59yTOJvjXVSgjGq6TUAr99kW2H++Ne1U5O+U4vWP2L/xwep9pc42hCtKCtiItA/S/dIp57z4Pt/oRlBsaRQsrYifUyl/sgfRL7+trTPyyLB0H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772543308; c=relaxed/simple;
	bh=rBeHOx6F9m6NdTQIVIlJ5ueXyG6WKv5A3h4KFzfYNqU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jb9ndGxntjt2qJ+i7bCLgsQ0rugnmctaR2A9rKEMpoo+WUonjzPADWzapBxyjwRrgfbmKvxJlyhk1DcAFdN21NMwY5mB/+Hn9m5fFzlcrww+bc8G3/HnqFm7dT7cbkeL2OC4nDt7pETZuKrR3LJe1NakuuuAnlajc9ZE5210kSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M7tMzMeH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MlrFMMQ2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239nGGu3349574
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 13:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RAE817eOkoFlssgZD9qvItbxSD0wQHT8mpg6XXPbDoA=; b=M7tMzMeHfrXeEfGP
	mfn1VZNmc8kqDEFe9ywMRt5qxlZWM4859at6FIq3eovf8c31g0j8wZ1YweQvR1Oj
	tJY7UloyUp4bsCcfaBQ9rjArDWCMVp3MwphVlLu+zBE6c8eXpjBMsG6924Iy40iK
	ckbx+oxmkvHiTMkPgHqSoFac9UiCD37S+LxZTk/4sSmEOCxrRuxcJiSg+ZPe9FHb
	Txu1EJNpRklL+NqsTu0HAr29ylX+gGxY4lLRZTSims74pwA693RLUO0nUnEoyL3R
	FufzdKAQqnA5oaGTOXVrsUKArCdZHNP3gXIh0mXHsN/GR9LE0zQcs0QnTQmRsxiT
	EO20PA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnhxsaujs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 13:08:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70cff1da5so3550083485a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 05:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772543303; x=1773148103; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RAE817eOkoFlssgZD9qvItbxSD0wQHT8mpg6XXPbDoA=;
        b=MlrFMMQ2picmmaBVI2rCl16WYF8dYcZwf7Huquuft3DkWtxq2MjsOIMu5HBGGcxNQG
         xsdbpzBh8IIhkPPcXBYnvVFlxnJTupj3DL+WuqBGhUq/cUhVoUmoVHvPethRQq3r0w/b
         JbRt/5dmhabgsSN3ub4g4b2HKTDJX3fxqrAX6MRtmbN/XS3wsPkd9v/Vr7vUZR42U93I
         VqT9vBBCSMBz1FGmcjymGJhKSpXNPWIJEiy3Tv7dldQgm11+MEtgsBy2wV8BgUEsdwqy
         Z+8ExTCUoEXpHWfFGWHkeV4IfxgjzqiS52P/8NpiU13H7ZhJ2U30Nwa0Nw7zVComIKaf
         Le+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772543303; x=1773148103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RAE817eOkoFlssgZD9qvItbxSD0wQHT8mpg6XXPbDoA=;
        b=wEOQNOoRmKNpkHVLTQ+OA5/Hbd6SlXzna8jLbip2xttzPeTjNFhT+stcB70t1LaLdy
         JlKSR9irQmtgStlQS13HCDwnxSfdza9yXk0ZM//pIubpw46qTQJLn1SrvcOjg1GN7LKJ
         HyUUNXVdfd7Lk5PESJDj87AwP1renm2HQmZo41De+D1uIeTj/aUQ7c2SmZWVkskejCnm
         2p7TQhiJKQXfto7F+7FjnznQ63ojWm/A31lzoLl10V4Spf2znLDty/6c49psHAdRpmfi
         +jcCGZsbqQJXNqeQkvxzTKw5ySNJ9/iP6pxcKD0ijiZn+KO/WSSWxBav7itX6v+0e00e
         9ODQ==
X-Gm-Message-State: AOJu0YyL1AXq+DpZnBagZ+UgfWeWpd+7g6gRgsLwdlqvEdlIztVHmnZK
	h7KOcLcRW5qYY2dsJX7+O7a2NGrAqB4iUZXjBgv/MTY5kq31TjQKozOMrcH81Z0rDWbunmS6zCI
	Eb4ulyBm/rVU/YerlUUyhIPvvKTYBrsxTlXWH1myYbCve9kLhXFZgajOm/0apFu4dhvjCZO0dF9
	vz
X-Gm-Gg: ATEYQzwACKQM5UP5GCEQOv8Xym7LVg9LtTMOcqMab953jaHEgTJp00vP8UICdb4CzY7
	TsRmOyVpikEpAbVue6NBEZMceBRBH9EIUxzwlhjZOThR+84CgdOfBVEyjWRq341L4hNEWwXwsQl
	nEz+Cy9315amxoFW2WHYLaKSuUPga3IYQOmSxvT6dKLtXlSXXIejRXk4TAzobicB+Klc5yjsILJ
	Y9tCii+ocKPdVlISOCzmIF0fOm/uhqSPO/HVQAqzEA35YUF0ygR6ZkmBk/xB9BPVXMqk01LznnE
	hHhsnw6P5ymZw9zOFRPgFUtq9YE7npgJbZg3X87OJQzV9TNzCtiCPvtO6kbG1ab0uRaa5fuFX17
	goLDgoxd2IPGCOZ9/gCAspEd8RW+BNtVV4TzCXuna+t4U
X-Received: by 2002:a05:620a:458b:b0:8cb:c897:6839 with SMTP id af79cd13be357-8cbc8d999e2mr2076168785a.26.1772543302773;
        Tue, 03 Mar 2026 05:08:22 -0800 (PST)
X-Received: by 2002:a05:620a:458b:b0:8cb:c897:6839 with SMTP id af79cd13be357-8cbc8d999e2mr2076163285a.26.1772543302307;
        Tue, 03 Mar 2026 05:08:22 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485126563ddsm26253495e9.3.2026.03.03.05.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 05:08:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 03 Mar 2026 14:07:54 +0100
Subject: [PATCH 4/8] dt-bindings: display/msm: qcom,sm8650-dpu: Add Eliza
 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-drm-display-eliza-v1-4-814121dbb2bf@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1027;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=rBeHOx6F9m6NdTQIVIlJ5ueXyG6WKv5A3h4KFzfYNqU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBppt0uiRASLjzocGD6W+PgQ9ZT+E09PuHdyD4JZ
 /BDtkzAcaeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaabdLgAKCRDBN2bmhouD
 15skD/4pO1wbWknuEyHHcse+SuZHM5VK8jW1h4NIKSdxK/t55TGFfetmTgHjCig44dQyCNCUOay
 GCpZU80ZGYLajIUmft5/aLrCS0+b/pjnnxt2QszffgTuKFQpS/kfuPL8C4argLCxrvUsS3tbm45
 sFz3aEBctxIJ1owJn0SB4dLAmvLL4FvT2u5GQKab5N1Nx1Zs6n45R0kN5N0RfKo0jStKcEBUoZD
 eiK14SynEBrZM1lGaR49TWST91mDo3qhYtdoTAI+tfEN1XQNTNPfFDTS2DHuwHmJh/WmpxpOoC1
 t4njSSKSBLlOYXaYsX4KoZupNBG4u+Un+5iIlWxaBoLLhsaPjXj8bGTe7EUXo96ihP/GD0ozXH+
 po1FVzhAsU5jjVKOg8Lfjb/JyfExxGFiMrN9yXPxNTWXBqWeprSsd1MBTItmdy9UPlxmAy2s5lO
 pG8kpunOjIZMJaU+iqwbowevAx4138mwNiZJ4sFwst1jTR++hc8KCOm5cgRVMX4/FavWk5TBz62
 O2zB51tnQ+eU9KJP4Y6do3QQvajZiTUAEg27AY6gov63joBX9kolsNb93gG7IR8SxEzsukLbpxk
 1OwNUUm1ZlhJcAKUrg/NaWZd5mwxREvkYLTm3wCFuRhP7WZIIKBPMSU6mb9NPDx4/uD+BuMUYt6
 88mOMMM1j9G4Nnw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 6N3aRTTNqhYzQZDZ8Gy3hMrDzdHorVUz
X-Authority-Analysis: v=2.4 cv=dfmNHHXe c=1 sm=1 tr=0 ts=69a6dd48 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Qa_SlUMgUoJhev3IiQkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 6N3aRTTNqhYzQZDZ8Gy3hMrDzdHorVUz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEwMyBTYWx0ZWRfX3sVxO5GrS1NW
 gc6f+bbBJRPHdDb/wGdWw+7ONZ9GkTk72f7pZUj1OrwPcnLVJIdiNWA6osjDFBt8dH7lwuva9sk
 Jm4OFlneau9U0zKRQ1zcKdSimiIPPym8pCpb+NrIUMy76cGgeBdz+1/kFvkt0vPTwPtFkN+e2Zj
 HQEUFgBehJGwuduDqhNjfR46XL2cVgmzcVO5dvvS9YzIMGnyZWHlChIXSp1/ZUzB+cGBei4F2eU
 jCNQFbmaReVrcci8bm37fwxJsOUtrPd45w8xOq9iMK++sH4ueUd9Rn+b34VLkQgGRk8wcR+tEb9
 4rZHqtLGoyCYZix85XkxGMfGd5mhV8r0BWBeZFpq/QWVjaLTgWeYK8D7M5f0ivvQhV3kzx4uBz8
 fGguaeBFX6C96RbAVZX8hUe7bbQzYsNTzwhHcOaOQyUWgq0Mvaj/TtmYQoRuxYBu7BAeo0Rr+cu
 q4f1QFaUpq3IYgQ8N1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030103
X-Rspamd-Queue-Id: 55E681EFED6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95138-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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

Add DPU (v12.4) for Qualcomm Eliza SoC which has noticeable differences
against SM8750 (v12.0) of mostly removing blocks:

 - Removed CTL4-5 blocks,
 - Removed VIG2-3 and DMA4-5,
 - Removed LM4-7, DSPP3, PINGPONG4-7, MERGE4-5 and several DSC blocks,
 - Added HDMI interface.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index e29c4687c3a2..dccac525d202 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -15,6 +15,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,eliza-dpu
           - qcom,glymur-dpu
           - qcom,kaanapali-dpu
           - qcom,sa8775p-dpu

-- 
2.51.0


