Return-Path: <linux-arm-msm+bounces-109319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPUGLktWEGraWQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 15:12:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB9C5B4E21
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 15:12:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E57E930A6263
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F02739DBD3;
	Fri, 22 May 2026 13:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nb25CypZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JKglJFw4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7C939D3D4
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 13:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779455113; cv=none; b=d1nr5B2EGlTVvviYCVY3STtylipP+ZZ220ivQrZjhU0x49IbW3Pl9LTDZly+QG/W630vnAeBYLKg2ryf490f3Mf3ay6ZngiidpllBlV4MQVI0++aUI2sNGspWfmYCwjtW6r0r9TDJ9zPoh8E1R/PiHVQ7Bx8W82cpxR2G4twRcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779455113; c=relaxed/simple;
	bh=TZ5Gbdy8MpD0BkDYauXmi2P3QUkOwpzPVQi/b1SuMMU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KgSx0Drcq8hap2xaVxLlbxPiFNtqcdTMuR8gih3JPIFbX1MLYuEkveXiHLEWDuVVKwVFKUu0s3CuelbpfkIsfHxVX+xFYyVBod7yoV2CW9XQr3fDzAIPqgmNm2Zo09fwxljhZgYUtu4zqbN7i1xkJ0ZYRIb66UGTjwlQZodgAsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nb25CypZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JKglJFw4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MBKOi01298128
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 13:05:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LU+3o0EUymr
	NGBvYnnfmtFWJLYjR5wRDEMuCtrEycf4=; b=Nb25CypZwbUqsUc7tdjwjjwNkQ+
	bBsaMBdfol9M8d28egxJ8jv0POZtQU9FcD8sj2SvMFm+Mep/m0M5kU44K6pa2vVq
	JS6K3PyQHd8j8Xxmxns3JMF2+L+VgDpQVnAuRKPqwsjPbJrnjImFbTpCfdrA6u68
	sqqxmcsTcoheKnskeV8Ua50qlyMp8AdEdHjpuejMf7Kbiu3sN+jY1tnZZ+/j9JOP
	AvaTaFUjlbS4KHgqvRJGG0viAGlmDaELLReoKBlo0ZLOOz36dfdZPwMT5SKSM/XY
	iPjlmbns8f9LvBaPRq2Da+tf48zAO6GnjOykTG1yVcCy5VItzxIlF+mbs2Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eaah0b1d8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 13:05:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-368b15eeb3bso14701823a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 06:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779455111; x=1780059911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LU+3o0EUymrNGBvYnnfmtFWJLYjR5wRDEMuCtrEycf4=;
        b=JKglJFw4JJzaq/dM3OjAxPw9Lo5OqwaAC91XanMZ2ItjZKb+3irPF/nSaDTia5uz9Y
         xFi1/9z1VGv385Amw+cVUn1cNk3qxdqhik+NTZRCRDr0pwRAHKRv4x5Yq4Mw7RpcVB07
         hcaEg2ulJUcO/CE86QZ37sxd8PKXOrsgnBZZpgnKseBIJ5tOgxq4WVLBckdoF/Qc5e3O
         moNOe4UtiWZ5/kteHSkhX/G5jBTkpv75jTRH/UYNGD740vqFae6L6ucIZ+9IfVp5OsXd
         2fVeZu2EgukbYEU9dDTPfRjaWfryAFtNh+W7NvkuHRr2kVX2wkxmUpeU+048Vqmlpcv3
         ybVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779455111; x=1780059911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LU+3o0EUymrNGBvYnnfmtFWJLYjR5wRDEMuCtrEycf4=;
        b=Xt3r0ekYfJtJIMYvvjraKhvfi7wGhIVFZNHmwIWFyR3zeVH6IrarNxsLUomXz/1WBy
         X2d5yAdAB1NJcZ1tPFf1YaVd3m8ZaeCHqv8vnMbRgXuFuM98fdAVLabAmajB6zoec19v
         4ou9KwGrYPZorfJa52PNEnZUa8yUCTm0J3nkNDpPqJKHB9eJwqIVSVF3Dw2L9pCm7RIO
         DumpsCorsCi+71s/ESDWynEbzBQREeyIgAjbhYGYT3GMis6wn7P9RIJdyE6vCAEC8xX4
         RmIJwP3dMk6ANJsQv3UUlkHlr8nP6AX58woLdzx1xwzUYZmb1z/u3fa6tootrNodCcIH
         OLfw==
X-Forwarded-Encrypted: i=1; AFNElJ/pw/v+XI7EvuErgWaXMmraJT6rmYIfHwiGnpM1OOEE480eHRaIEn7Aus/6I+jBYMjUXsiBB0mU88Mg0SN0@vger.kernel.org
X-Gm-Message-State: AOJu0YzenLb0lJgzhrzV4Ed8yJBLricfhqfNu/jpXDKrpLIFaXOCHQFc
	YFO6Gwk7h3XQWRupTO22qv7bI7BPriwFvV7NeMRe/xKQmwt+naIl/WDsr6zgCWySlZ8mm17brJJ
	qX8siphCcbNfJX0SXRVZIVN6A+DKwKUAnBAcCmVhr/9wyd+R3G4EV4Anri+zrX7pttKQe
X-Gm-Gg: Acq92OEj624F76hL0VFNzBJJGhJnBikwJvPoPtKSnxORZ97Lo2J5N8riSdPv8h8pr4R
	jyrk7XjAfEtib3G2OLn7QjWzySygrXnVMvtlx56uNmMEg4BUccSCBG8cpWw9Y/0ImGVG7ASt+PG
	ycnw+vrU7cmHs5jTOGqAuC7SvyOJF9/6bI20xUOKDTJktQYcCGwpf1wmyDqIvXtaJ5OVG01O7yx
	Xrp2dJllxSH+GcMYn2V9Xf57HtDGF2zWKJWs3oXtuUrEALh1Thu/MMJG7Ax2gALoXzFSro9Khxq
	Ksms1Uluq5N9UrjP7Zlxhq8j1p8lVV/L4rwjpnKWzW+fuklT4Co78bPRQi4hWPFaxRCr6+H8X/b
	Rd8EKWL5HjYJU68L/WUecSCq8NCGToFkgLzcSZbGO6iQo3rtD0g==
X-Received: by 2002:a17:90b:578c:b0:368:b176:c5a8 with SMTP id 98e67ed59e1d1-36a675ff469mr3717468a91.15.1779455111364;
        Fri, 22 May 2026 06:05:11 -0700 (PDT)
X-Received: by 2002:a17:90b:578c:b0:368:b176:c5a8 with SMTP id 98e67ed59e1d1-36a675ff469mr3717425a91.15.1779455110919;
        Fri, 22 May 2026 06:05:10 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a72c98b95sm2069980a91.16.2026.05.22.06.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:05:10 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v5 3/3] ASoC: codecs: lpass-wsa-macro: Use devm_clk_hw_register() for MCLK output
Date: Fri, 22 May 2026 18:34:42 +0530
Message-Id: <20260522130459.3411038-3-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260522073324.e18bb240b6f6@oss.qualcomm.com>
References: <20260522073324.e18bb240b6f6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEzMCBTYWx0ZWRfX6LH72DLFck5a
 v6O8zFA/V5d3GZIvkqVR+BXTTHQq9M8cfibuKlvYKJauTgq67Yyvhh8vJw8REZfFvgbskJz/NVN
 xUEOtPp3a5x5o0X8KbZ4gWypDSbLCLHCB7femwf60L2cKKG1ch6Mp7BEwnCWaLo13NRRfpmqqYd
 8L79thn/FI5vrgHZNzpj4M2/8XN0qRqM5mUuVZUEc9KJJ6KluRRvC3signRDNAUcB+UdAEfQ7Gk
 QX/7JlcWz3I0CVwU8rYKzAvxlmIpyu1p+Uau5tp/ZCwOMfzFr+CJeYfpxgssW9Gz/NwCYcKYkhC
 AR7zaZF2vKz1TbryapbanpNcxV3TQe4gCZ2a7ss/yX06Qj4eN41tWhu0uYr7j9Q/EXaKe0Ht50Y
 O1x2G7gEaGponXZJ2C+9qrVgGBKm8uGcWbzmIKwmHoLYfH5x1zrrXh4tZ4a1QbkqWcNWaCxzqSX
 2RVteID6TYJZSsPJmqg==
X-Proofpoint-GUID: nVC4TAga_BNL3dEBsit7aJL5GowfBF-u
X-Authority-Analysis: v=2.4 cv=LNdWhpW9 c=1 sm=1 tr=0 ts=6a105488 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=E7064k5JgmqFsk_8azIA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: nVC4TAga_BNL3dEBsit7aJL5GowfBF-u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220130
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109319-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4AB9C5B4E21
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The WSA macro driver registers the MCLK output clock using
clk_hw_register(), but does not explicitly unregister it in the remove
path or on probe failure.

Switch to devm_clk_hw_register() to make the registration resource-managed
so the clk_hw is automatically unregistered when the device is unbound or
probe fails. This fixes the missing unregister cleanup in remove/probe-fail
paths and simplifies error handling.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-wsa-macro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 598292fe3219..3081c115d584 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2658,7 +2658,7 @@ static int wsa_macro_register_mclk_output(struct wsa_macro *wsa)
 	init.num_parents = 1;
 	wsa->hw.init = &init;
 	hw = &wsa->hw;
-	ret = clk_hw_register(wsa->dev, hw);
+	ret = devm_clk_hw_register(wsa->dev, hw);
 	if (ret)
 		return ret;
 
-- 
2.34.1

