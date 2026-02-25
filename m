Return-Path: <linux-arm-msm+bounces-94045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SL+SJO6jnmlPWgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 08:25:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D71E1935DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 08:25:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C7E8E311A864
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 07:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF8653126B2;
	Wed, 25 Feb 2026 07:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VRMgnOWw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fo3Hf+P2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B563101D0
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772004041; cv=none; b=FDQl1stA6XtI9rL1ZPNdse6t+tsqL6PB1T0IzC+I7igt64z6qbJzleFf5EbRU3Vl2YpyezSpDvo2/8sGgxiyiKc/7+yN+g8QKOLkkkzewEH4Uwe52h96VFUW7cdt/FC6UuOkeIWd6VBQt480HJp9uFT9uQiTgME2Vd5R1y6flWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772004041; c=relaxed/simple;
	bh=RX2xvDlfbY2jB4gMuwAJiTjGu8FyoAFa5v+9xDn+jO4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d4ZxS7D89Vw3a5UeEKIyR5Fa3uMDcCiompgYyTbAApx+DqNAbSMrJZ81J/RN8q5YtmT/1eXbeMGkK82onAKphTfd+UhN9Me2B1cUWn18xMw/F7jktEBK+PSm+Jv5COZtetGnz4N7OkAS1JaN0IarHGY3Sz1q/sHPPzWURk7e/Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VRMgnOWw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fo3Hf+P2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P2sCde583306
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:20:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	38b2Y5v7C2CleGqNysqY7ea7ksqS4CP4xrO1wOPod/U=; b=VRMgnOWwo1j6ulH4
	Ip+oqJrDuIyLNAmX6j8Opjr1dZSob0ROtIaM7S0n1CFoK7ejsurNLQH0/eDOOmCd
	AO45FfXRVlUdXvWz2YTuZlO61Ihu/NruMBHhiH/I56rUnRN2mAESgVTyje515/tU
	98xkCRCOroCX96z6vYb76r2gV1S0fzEeSoWgI+QX6I7akmbOrr5X60R1brvSZw3t
	3Nhsh1raYlmfX6eJGZeLT0ILDGyOtXZlYy0ZhoytT3GJ7RPf6kN6eJZZ1lq/hyT3
	5fkhgcUuH5RRm/eDT7tqUeXZQIh4ubpnezJu3hDP/Op0QMz5hGuAajM1k6w1KO/r
	zkJY4w==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chg2gt9q9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:20:37 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7d4cb5810a0so40591800a34.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 23:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772004037; x=1772608837; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=38b2Y5v7C2CleGqNysqY7ea7ksqS4CP4xrO1wOPod/U=;
        b=fo3Hf+P2l6PzGVY8Yek6Trf4CsJfW3F7nwHAYBxy70QNQh/dRf6X75paS+C2glgiFC
         I2ep59szLWgv6Uq8XtIu2QPZRlOn+k7ugxOy4PsyThoQyOlgg8U7l/PoV9hw/0b0Sq07
         hQ5aOty/6MzJ4jP28VEfbevB6XTC9qfvEs0s2cdvJbn0RnwKhZcLtmDf26nIDNT01b+h
         a1xNKb7WL2zKMy6ooa+k0SSmNQQ5t47k5We6vVqN1vMc4bg0h9KeJlGK3FB8+hWl4ICn
         vVy5p6GYCkcfMyEBoH6sxzFbQ8SlDyLAS8N3jXL3kw5X1Nfx4+6du8vmdDfVF6Sqtq8r
         NlqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772004037; x=1772608837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=38b2Y5v7C2CleGqNysqY7ea7ksqS4CP4xrO1wOPod/U=;
        b=oty8W1Jamg6zOB7eLyeYg7FgBLn/XBDo9gSn1KUQaJLW4UCRQCCEoXlXDxwZvgVop2
         btGPSRvHVuuM+ZMFKR4P7n1+azzJiKrqUzpEAYT15uHGFaswRzt1sOlaFZu4v3oVsgEK
         eGIhS5jxoUP86pxExziNNDoWrl8EQc28SdWBg8HQyf0SBk9/a+ja/PxBapKjopyL6/o4
         9qkDR+/4o2Gm6ZU94yaR93qwefkuM7th4sQKvPRZQeL+In3eQZkJ/KYY50pvlwZUzvDM
         qogMEuqnZ0AQiDKb4eYOOxBLFgosdwGa/lWFlfRmiFieFixKuk/3RL0/XrBKb2riI41x
         tcIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyd7Hu5eBz1GZPiX8ojRo3PTeLdPFc3GQJfcx9ofk5t2JdXLbxruRSpMn/zfWKI6dqrmmUV/LM5UPJ/yjQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwFrIpdWpGtzM1c24GEI0wYMapzzfii6ChL8jfch5NQRLMIr9z4
	8m6Zn0tXuCGpPzFP3tmF8bbiJ9bHhkGO1d3JTLNkRnLKRpluWDWFaHCXiCzw6kwa3TkTJ44jm6g
	xp5RsC5VxVRDw2wisjNS1PN6+XvOQtdk0UuYPlbaGKjQSpW3LqswgNI63GfVN/bXHjx9D
X-Gm-Gg: ATEYQzydzfeKodHaVaK2xVBGpcblCGtuAGYnWNHxz7T21NTdvmoOfvnHwpaZQ6lEz93
	C2NCdntUs9cOze+VQcbXn8iBe7X/9t9pqnGqI65NYwcdcQFsCFHTAc3b5xqSADEvVVINhO9iWHv
	n6hLXCIwQzwjPMBjJGR3Eepv6PKerWfeInvQ5VSEN13YIXv0Qt4VonC6kvlvso5lSh/mnQlBa0i
	SZn0oa/RF/b99zY1263c8By+WiF1Oc/lfqE14sgnO58EPhDdPawI0NJsYvKFr/Jx35ZooW0va6e
	cXMaGTIcE4ZXcyWadNFU6wGEOjYtSRF7z/GAu71myL5WBYSDrW2Na8DaSy53Uu3yOfZSkwxYMzd
	nre2YpOs7Bjm92kQNa14r6+vIIX6o1XR1PWj/VdZYscanSjk+UFJ/FcsDMwYoMaXu3/OQjplP
X-Received: by 2002:a05:6830:67c9:b0:7cf:da36:4cbb with SMTP id 46e09a7af769-7d52c1d65c6mr10004167a34.2.1772004037240;
        Tue, 24 Feb 2026 23:20:37 -0800 (PST)
X-Received: by 2002:a05:6830:67c9:b0:7cf:da36:4cbb with SMTP id 46e09a7af769-7d52c1d65c6mr10004160a34.2.1772004036914;
        Tue, 24 Feb 2026 23:20:36 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d52d038dcdsm11711730a34.16.2026.02.24.23.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 23:20:36 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 23:19:25 -0800
Subject: [PATCH v6 10/10] arm64: defconfig: Enable Kaanapali clock
 controllers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-knp-dts-misc-v6-10-79d20dab8a60@oss.qualcomm.com>
References: <20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com>
In-Reply-To: <20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772004019; l=1019;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=GwGDJFrSlIi28G0xKBu8W7R7zrPpokkDfUnwVZFXfnA=;
 b=7eKX0+jHRK5Acdl8fa6DZJpohKK8trw3F44eaaU7iKTJIGl73Zt4uDfNxEqUj0wLsW6P/iVKS
 y2dS/P6aoJiAAMczKJVA6AC7YnlfuvKw5jgJs2KKTfqX3UI1FvcNdHK
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: iFUDc_r7ku61iR_hKhmoj9Aln7KLLl-J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA3MCBTYWx0ZWRfX1GDEjYZWsTnw
 PfubwgpXAkXDLu8kFM6lUqfgIEh7J+qTr3uWnSPEP26Mszz5VlYJMVO/5TLhbo4AMGIHAAuA7aE
 +3F8DAch1KDXH/i8Oe1bz5xV6dE6Ifw9GO83C78cZEoB4QQ3eM9eePftdHGTbQM8cgD6HD66qac
 OrIbqrSL8+LhStV+fm2gncPK72rma94Czv3NG+tSzMHi8J1wCHr3kAN41hBeP9iDwrB3J5j8FA3
 4NrJ5ZiB4MuYvqkN2uQBVeSX7jWhosmts1qigEWf6LTTH85E/F6bn7w51gX8cGv7ctDppnMt4Id
 uwb5lRhUvcH8b91prgPb7I4V3XYFbD350DyncCvD5E5QudLpY3sdWkUQc3/SYkOOIJz1vOyflbp
 a4Ey1FN/UzBnECA1LxJ3BTWyhU0HxXYuB6JadQR59h/RK1aa4T90eOKf2LXXPlR7D3GCCI8Knzd
 Xwwcoc9+GQQ81pkF8zw==
X-Authority-Analysis: v=2.4 cv=ftHRpV4f c=1 sm=1 tr=0 ts=699ea2c5 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=2LxjTKLKwRt7mIs9mlUA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-GUID: iFUDc_r7ku61iR_hKhmoj9Aln7KLLl-J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250070
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-94045-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0D71E1935DD
X-Rspamd-Action: no action

From: Taniya Das <taniya.das@oss.qualcomm.com>

Enable the Kaanapali display, video, camera and gpu clock controller
for their respective functionalities on the Qualcomm Kaanapali QRD and
MTP boards.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 4ed70ab7ee85..d1d51c2ef082 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1458,8 +1458,12 @@ CONFIG_COMMON_CLK_QCOM=y
 CONFIG_CLK_GLYMUR_DISPCC=m
 CONFIG_CLK_GLYMUR_GCC=y
 CONFIG_CLK_GLYMUR_TCSRCC=m
+CONFIG_CLK_KAANAPALI_CAMCC=m
+CONFIG_CLK_KAANAPALI_DISPCC=m
 CONFIG_CLK_KAANAPALI_GCC=y
+CONFIG_CLK_KAANAPALI_GPUCC=m
 CONFIG_CLK_KAANAPALI_TCSRCC=m
+CONFIG_CLK_KAANAPALI_VIDEOCC=m
 CONFIG_CLK_X1E80100_CAMCC=m
 CONFIG_CLK_X1E80100_DISPCC=m
 CONFIG_CLK_X1E80100_GCC=y

-- 
2.25.1


