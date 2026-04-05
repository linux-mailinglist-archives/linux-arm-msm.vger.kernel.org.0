Return-Path: <linux-arm-msm+bounces-101862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPUIMilz0mkVYAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 16:35:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F04939EB20
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 16:35:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1EDFA301A70E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2026 14:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 708792FB084;
	Sun,  5 Apr 2026 14:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i5J+werD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="brBYhGt7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799D02FF657
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Apr 2026 14:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775399657; cv=none; b=ZI9YuSuFepkScYRvlG38IAOX377FlSX/iNZjw5SupixU7wpdZhpg0YMIi2TlqHT0JG2GC15U14At9ew82yLXdQDBhFLuDoxG+lrD5KL0Lp9l/NLEbJv7sG0+xlwKF+in33sW9pWhsu+t3lN/m0RJX8THgyJQePHdZQZp3dX2P9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775399657; c=relaxed/simple;
	bh=CvKONcYc3T9TBfcvhreqtjqGKG2psNVzlnhXVdP3IcQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TjMCD2q3A6zZgj4wNzyG6eXHjIz1wm6oAjZa4LJoeC3JrUP6egh8ktbpoQJ1bUXNFp2jwNpamcN1Ter+U4yIWmRS85jT9wHeZilgI/ZoUVzkci5oiauq8wlpH5mzoXf/FRGJVgoBQ3twJ6htIixHBE0Q3BH/iouotA9AXfALts4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i5J+werD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=brBYhGt7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6354TamX1092039
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Apr 2026 14:34:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GA1/QUGFfB74DpxbTaloTa6Wd+eev5cFwBe9u7pq0Sk=; b=i5J+werDIA01YplN
	4vJu036+W9qJCVEmhfFFabA4Dq2nL1LD1vkVCBHBJZG6IdLGd6p+opPhCQ0nDx7y
	qCTOlzqzuZ9X/KVIW2PZba9Exd6fAFwqQwFs1pDpLCAIJbPDgvIALKrMWSIhAA6Z
	oAu1J+y/ul9kR0Llgt7icJMAEIZcZFspsccyIPl5LIDRlMhjC7Z6sKegP5De2W4e
	QhckeYO9Odnh3VmIBTwoc3xYwwSK2nb0hmypiXeTePEnUqdZFhQoiNDJ1olfzJhy
	96sK4bQUe96IumqId5nMlWO2P9cqNaehQJjx/pchWNIjJocGxoN9m4kyVe3zE81R
	lIr4KQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dat7uany6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Apr 2026 14:34:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d63962d83so70525961cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Apr 2026 07:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775399654; x=1776004454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GA1/QUGFfB74DpxbTaloTa6Wd+eev5cFwBe9u7pq0Sk=;
        b=brBYhGt77RMk9CVITCoZSdEd8+sP0waiqcwkbL7Q5ob9RSsqjrbp9uzgN9huZVyFgJ
         l6U0aImkmZmHLvNyzaR0jWl52cwuXzakQqHOqIy7EPbFVclp0TKCs2YFuWvanFJe5nsA
         78+HmR65x451Me7BYH4ofx9SMdE6ZyT+79wb/zZYqjXl4tYla0no+oMF4W1rypXDCM17
         LiDOe9Wwdlzb5mZiaGPu+S9AcO1oYTcLE9Y/HglSAhBfMof6z6POVj5TFQOUcIHoKlUP
         G5/F8AgLGNTVLvryw6mjdn/hJbWMgLfne8EHJmGaopdfKAmirjdVk06bkY9qW9GlGMi1
         xKFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775399654; x=1776004454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GA1/QUGFfB74DpxbTaloTa6Wd+eev5cFwBe9u7pq0Sk=;
        b=erzmyXeWb8n4j00UPhLIhfp7VVSPrugP6lQ0ik6RFCVqT0XcNXDIgtt+YL0TBwisDO
         7oTf9L7Ym8Gga3njEkMJIFksueNtnfKq7X9UR6XaRCBt7QVv73bFgLk2iqT5Ui2EFG5T
         1dG5VE07K4wqtiDqLdRkgzRY/x42IwJrorwjCGbhJuzAmNO9DkV0JuD5C0Axe93ksxZ9
         telpoq6EHAiKVmYMaAu4VoBBXMvQT3b51Lg85vM+SR6+nY6Ev8Dli4sQhoatP/oxSClg
         I2VBlXXcSifqI8m7orEFJheIPkZdWTwHVr2/kM7v8eQxIPrwJA1CuNWBc8QjMRHT+DSi
         yViw==
X-Gm-Message-State: AOJu0YyATiG4Elgb8Wr/xBYug5GoMv+99BqvlheI8faf7UrLSbC92tPw
	SA8fUt+gi+8VUKD6D1+xL7BJo4VN2o6hOIGS2nvyPD7uwDfki3YmRQBcDwHGblRFp0vbr1LYhsY
	187qcvcqPPxJ966ujv8imxsfSCccjnnnEa39DCki1n578NtrASax95HOPKpW0vVOvuf3u
X-Gm-Gg: AeBDiesf4q6bK98ut/8oTXtgSokOZH0wfbfGh0MhGCbA1BUW4vAvHtlvtkzQUY77KMJ
	dgv6A4Y/C+bhToTg83BsvVgcRRP7C/QxJmMH0M7l9KwrYY8fUSf9U5sgxMYBUzYcVCFtYdnkF8S
	v3Z4hEnNNB0g8zIHuQftpwrpu9S3EiVu0ncTTVyAcjmguSLrjoQMQUUm0rFoy8ED9NS6G00hQX9
	26LF9x080aRi/4Oz64nGEuEo1kQ6iZFCAbKUavJKLnpWFTDo/oRLTMmuiGy+w/d2PDHmK0n3IYu
	7PQmiRUHhQMpTvTMtuzTgBklnMnbgpbxaqxB3AfDxnC3KxtAZ7vHGqp5xQ1+ATGJMJlsapJWT04
	1AJccZZCBH9kq1Y2I0fEwCJ0a6iZtxROg3Wsz1ihpmM0C
X-Received: by 2002:ad4:5c44:0:b0:89a:b0c:7268 with SMTP id 6a1803df08f44-8a705782443mr179550526d6.54.1775399653904;
        Sun, 05 Apr 2026 07:34:13 -0700 (PDT)
X-Received: by 2002:ad4:5c44:0:b0:89a:b0c:7268 with SMTP id 6a1803df08f44-8a705782443mr179550216d6.54.1775399653486;
        Sun, 05 Apr 2026 07:34:13 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a616sm713934755e9.2.2026.04.05.07.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 07:34:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 05 Apr 2026 16:33:58 +0200
Subject: [PATCH v2 2/8] dt-bindings: display/msm: dp-controller: Allow DAI
 on SM8650 and others
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-dts-qcom-display-regs-v2-2-34f4024c65dc@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1358;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=CvKONcYc3T9TBfcvhreqtjqGKG2psNVzlnhXVdP3IcQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp0nLY7kqLZOcOyLvz5MUeRl9v9KcYPi2karLV2
 1odhQ5SX5uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadJy2AAKCRDBN2bmhouD
 1zpkD/9cLZdzdR2wejfgCfDafYVz9UCCz7q6Ax5+8Z7MmiLsLVG1weEuq9lRNLBfbwKEBgVdgwO
 HCLqhpe9kODY4ulkshyPT0IHP5i+cCQ7LeXSvIMcGd1pAKMFbfgqUnUmtFX1mj6WfCmpj35JZu2
 6Bo3huIAzBB5G/P7jylmqjrSVFgk9894yj1HjjSz2uDOs873Z9st11AGMU5wDaxQZqkOuYO/YrL
 loOWKdI0V5dYkO+PUMHKfaPKzByEV3D9ypXuQ9l7GAvhUejbgBUysmIhNWmlvOIVLwurdxQfuWs
 jEFr/QElDvDRORlKda2HxrMUIlSPagZfc3Fic3ir3dGVNDZDqxYzUTTIqGZJfkabhjL1KgFqW+1
 uXrpSwQl4dJTbST/jpGMn+2b+j704aJ53tHyqTleOLtpBZZtWlNTk29pT5pZ6DxydB51o686Uq8
 7vHr7k18d5OyG7s8KDzW+YeyIVHUh3bi4gP1JUuHIriua2h5gOnMslOoJPJvil0fdBAehTzY6xR
 wQN0SIV4Gvubc0il4QkPEV/f3wswqmSX92DnWTkRo2t6oUwtWM6eXjAAv06EpW0MDh4grNdXbzS
 GFgFwjbB4u2Hi+vr8PBHebWXb6pnYjEpz9sFeVObpTR/qBu403x4rG48E3cUQQJJdvoL+zGsG7Q
 7NUThZZsXjGUsvQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA1MDE1MSBTYWx0ZWRfXxI9GCJbV/6jj
 KOAukKQo3k2fjQzBCGP/M2m3pNxtBI6gPW2PVmynffkAR7zGl8TTQbXOYuTtp94G9ysGeoEH2eP
 ThQfyVEp2gn3I6f8HL6n+TfS3GUDEOV6HJP0HYpIpC69Xax9n8Qqao+biUQsQGCSDN5QcR+15yo
 PK9vlwY750j96q3sJIDmN84m1JAWkcu4LqPEt/CYrXKsg+NMmuoy07S/iK8MzyjIUxT/AP/vZ1m
 x+Kveq7rsd+gquA0ABjVyl9TB7rdNaWsQuBMfUh5ebfPmH/BRKa/fYqosg2sPzhHqWTMk14kZRm
 Q5CUxJw4++ZxaxYk6IXetiGdXWxVhk/mJL86OSw9VF4VClfLFRTdT2sNTbCarbeIQgE1O3XcXKA
 l9XaQev7G4pxP5M0fQUOqflgmH2CTxzpisUbu6lLzRFFuobg1TfU9HAl6FFpCJ4XUW7IFMqFBpB
 cR6QsYylp+Mf5b6TdBg==
X-Proofpoint-GUID: xgkSmGvg0MyRG4peRIbyb2VSA2_02f_I
X-Authority-Analysis: v=2.4 cv=RJ2+3oi+ c=1 sm=1 tr=0 ts=69d272e6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=9q4-ovLXei0DaHkVYC4A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: xgkSmGvg0MyRG4peRIbyb2VSA2_02f_I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604050151
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101862-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,af54000:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 1F04939EB20
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DisplayPort on Qualcomm SoCs like SM8650 and compatible SM8750 supports
audio and there is already DTS having cells and sound-name-prefix.  The
"else:" clause for non-EDP and non-aux-bus cases already requires
'#sound-dai-cells', so it should actually reference the dai-common.yaml
for other properties, as pointed out by dtbs_check warnings like:

  sm8650-hdk-display-card-rear-camera-card.dtb:
    displayport-controller@af54000 (qcom,sm8650-dp): Unevaluated properties are not allowed ('sound-name-prefix' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Add dai-common.yaml reference (Dmitry)
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index e4f17d29343b..b96e1ea40d3f 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -219,6 +219,7 @@ allOf:
           - required:
               - "#sound-dai-cells"
       else:
+        $ref: /schemas/sound/dai-common.yaml#
         properties:
           aux-bus: false
         required:

-- 
2.51.0


