Return-Path: <linux-arm-msm+bounces-109557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6rKsLYTqE2rnHQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 08:21:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C755C6558
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 08:21:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3C2EF301EB51
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 06:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE3D639A045;
	Mon, 25 May 2026 06:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TUCiu2l7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KrTqhXnY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAA239B952
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 06:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779690098; cv=none; b=uYaZiJCs/RrzracjmjaspDXJEfSuu42jG6/CLeJ+HZ5oMRVwyDJgdrlfc7p9Jikm70ZwKu3mrwe4WENSxHK7ZT47D8yHxGnEoVXC2ZqeaPEE0j/QVlWh2D5SWW7DTcgFPKPD1f6fPDX0KLT+awMyTt1/yMC2n/mYz8HkHRQA4W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779690098; c=relaxed/simple;
	bh=SN+gsXJCUTYS3QP/s7Ozjn5Ljc3dX0Asz2QRaKXR+Iw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sSEGX0B74PcAgsWHZoTWfATekisXqU4ZJSwcK8UQabNm8R1SVGUF8Xtvcja+68/vNidAOlgNn9fP2nKxkc+C53a3WAeVZ7moXTLIPz/B1Mq0npa6y6pTXNw/vaiOMmpGLFQsmjABrpxaDkD5scCZk1ElGgGWc9v69Z29lsym1KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TUCiu2l7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KrTqhXnY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64OErUqX3628088
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 06:21:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VH17n6noNfw3rfLs2gSqPu
	LuLSe8f67XaN2dj3fT22o=; b=TUCiu2l7F6S2kbpTb0WkJKug5J6GiuM57RyN5X
	IjgqIi4FHRp+MR/mmA9G1K/hGZyD4FfSaA/W9PH2CICB/FPzFxyFQ60SnCUNw+Gh
	b1edEWz5yg+paSzLAnSQy4CejZjE1CRYsNzhJ7Q1TElnIjh0EAPs3OQLyKBm31ho
	nV/MVZUybpvWF8iKtyQAIQX7Yyws1dMymTDqr/Jc9FQeD7snOuFporaBC0TnCs1o
	PkeoUeg5poVTHklap5zzhnEd/j/J82AJ22K6SLDD0JErYoveKW0oSWYTsf1hgVjH
	8KVRsgSUO7I2fr1I5J59n/1x/QloAOCvmXGGHTnn8p2zFtmw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb386ne5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 06:21:32 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c82c477290bso4978319a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 23:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779690091; x=1780294891; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VH17n6noNfw3rfLs2gSqPuLuLSe8f67XaN2dj3fT22o=;
        b=KrTqhXnYwds+7z9OBU+KlVLPZrPVzJi2lgbqwAatTfmvN7grUYVq3ikkr/b5r9Q3bm
         LSPi7bjIWXfuC5TbsB/p9rBJN7ZFdrv9YQDB+Bk/5OSKOzdMOlDtPK0RZ7Akfm5RbEv9
         tTQQHWgOtQ1Sg0IM13lSF7/Hv+sAh+PY6OaGwubExgRtWivhz8ElVb+WPhHfgeAVY5I2
         hfN1vsUMxel07YA7dywO9x0P/9ncsg9LU/xa9lUAP0iq3maRqKXRM5jFTlHW0PaHYVG2
         KZHieBp0xakBC60FAxnRLg+bo+qp3u8GTV3CYj8WidACUWGKU/64fzkIoQ8ibYF8bqUO
         SSRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779690091; x=1780294891;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VH17n6noNfw3rfLs2gSqPuLuLSe8f67XaN2dj3fT22o=;
        b=kXCvMY8YR/DeGLpc3GOYYw/Prsq1MKTyT5y5jgJe8ySd2vJv9HhFbevlwiYStpSZR7
         wmawlA0mvBzJ8k0t5jR/QSV1kZ/5XCt3osth13rw05/Y/FEfkD5X7CdxkHGAIf2+bNFF
         RyNSDzM0/5xBHJ/qWC/2F094D1VrgBM7outyWlZyvtCJ5DxRiURbc/O5hwh1JsBuRrOH
         7BDk3F+g3t7Vm1V6g8UBB4L9bTIOd/MqsvbBuaFKYkEQ/SyjcVT3OAUXBDIEU8228UT9
         fEoGhkUT23/79byA/8aRDMWDCcsXDPXeOAEyhcmZOOTiWvMT17KW9BSqmfe+FS+gxvH9
         XXAQ==
X-Gm-Message-State: AOJu0YzzQZ+b2/wflow+BY+jiaMrXaOd98S/YuorOnYCQn8D4wH9Pyft
	OwTKFrgyevNUVNxiKz/1rm4hk0nIsn2IQ02XTveCJvzzJjKa31fr+WolhZOq/AptpRH5KAUXAD1
	xCuFQI0OHHI3FVlhWLNKYWorZ74DqExHw3ioub1CLlmr0T1yYVxJr+9EZS3Lqo9MrCeJh
X-Gm-Gg: Acq92OFy2gZUYxgal+bOklDVBO16STGGJYGPn1ZaJ2IDCN8iLkfds+/Ong3l00qkCu6
	pD1+P7xtEZ2k/yof8l1+h6MZY7+uUbSmj9Tvztxf8/4dKqSSQzsfMeTWEUhWeXF8ymEvmhRIlkN
	hfsKuj+moWVUsLHIY25r6gXCsFfFmTYsToQXAKjd0uZ8L9inmnN9DZMMMIomYXUwqUtA5Ff8Bcv
	iJ9wm8X6//VCE/05E1/ZHsBLBYaZSxSxKnC93N07aLc0QOJZEPZPRQVCE+GdhW9h6V99b9um/9D
	vG6NBq9J944rhLehUV0d4iZRjYw1d4ZMvSb3IVPbmhOEWA0jfhXnmD+Zv5uqaVVWZ5VY8/wSAqL
	G3fqBfECVTgIwBjFapVUZ/E3KCBsnhcGhjI2nuO02AvZdJfTdb1tSM5zs7Tj273yNb7WZS9VhWx
	aw9cDlEnPjkRmud1rnMbBDTbCgsg==
X-Received: by 2002:a17:903:b0f:b0:2b0:41bf:ca83 with SMTP id d9443c01a7336-2beb05e2c2amr156259725ad.23.1779690091190;
        Sun, 24 May 2026 23:21:31 -0700 (PDT)
X-Received: by 2002:a17:903:b0f:b0:2b0:41bf:ca83 with SMTP id d9443c01a7336-2beb05e2c2amr156259465ad.23.1779690090719;
        Sun, 24 May 2026 23:21:30 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b3cb3sm85722765ad.40.2026.05.24.23.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 23:21:30 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Mon, 25 May 2026 14:21:17 +0800
Subject: [PATCH] dt-bindings: misc: qcom,fastrpc: Add Maili FastRPC
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-fastrpc-v1-1-ae9add881952@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFzqE2oC/y2Nyw6CMBBFf4XM2iZtgUr5FcOijxnpgodTNCaEf
 7eKy5Occ+8OGTlhhr7agfGVclrmAupSQRjdfEeRYmHQUhvZKi3I5Y3XICzV3lhFHeoIxV4ZKb1
 /S7ehsHcZhWc3h/HbTyVD/ouMj2d52k77VMMyTWnrq7aVRjbRBOstUuiiNJ0jsk0MtVTGNu7qK
 CLCcBwfZdYpar4AAAA=
X-Change-ID: 20260512-fastrpc-9f3b691f8e2d
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yijie Yang <yijie.yang@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779690087; l=1059;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=SN+gsXJCUTYS3QP/s7Ozjn5Ljc3dX0Asz2QRaKXR+Iw=;
 b=h6LoIVHGzlEZvBo37CVuAx4E3Lvu+iQLPiIfx74gWWVlY60hZc1jGL0nnHP8TnhJrgfrKftqS
 6bKeXwBfygDAejjya+rECANlDVsihwIcYbVv15VNjpYkQQptoxX+4hf
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-ORIG-GUID: 52H_Q2Dj7IhJl9zIgAmtTzcNY9u9igv7
X-Proofpoint-GUID: 52H_Q2Dj7IhJl9zIgAmtTzcNY9u9igv7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA2MSBTYWx0ZWRfX5Ij+uIJ2Y9Wc
 AXLehBJ9FTAh0c/arWa/ova3csVmv5JASpPffgEyo6vzslOjoLmX6Hp4VKXJuX1mWrdJfMWUWCd
 YXBe+UegYpybj+epB1nxc3X45bJB9JPUMIGOos+WqmspMj+iQkCCTppVd0lG0J57xDlvErM9jM4
 B9g1JGUUpNlvvfi8IXiFaqhKKqfHbHEpPh+YRB/7nhxr0W4tWA2FUtwkMSzJ6pQAzKZUo0iD8ol
 PVl+nP3MZtlI0lrvU/ijho2K3lBZzfxVUrf1fHEfVg1Pz/Tw5XZOT3Yk5+TLzrJ7GrMQ/k3J01W
 0Yu5h0MByAgSPgA7D+y2dH3RqJKyTSsqU7+EBCteuJgUUabVog0QXnCkCjD4kAPr63EY9TadU6i
 KH9IHTRFw0+uMmncVNSV4BwpP6aLa7frrRpCQ2j3gy8MZ/z2KAUk/jf4WrO/0Nszqw7dvO31OrQ
 p7Dojb00+corD/GZYvg==
X-Authority-Analysis: v=2.4 cv=PJY/P/qC c=1 sm=1 tr=0 ts=6a13ea6c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=PmvgEI0Rx0sAJRWD59EA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250061
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109557-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yijie.yang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 31C755C6558
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document compatible string for the FastRPC interface on the Qualcomm Maili
SoC, which is compatible with the Qualcomm Kaanapali FastRPC and can
fallback to Kaanapali.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index 2876fdd7c6e6..afe52296bf1d 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -26,6 +26,7 @@ properties:
           - enum:
               - qcom,glymur-fastrpc
               - qcom,hawi-fastrpc
+              - qcom,maili-fastrpc
           - const: qcom,kaanapali-fastrpc
 
   label:

---
base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
change-id: 20260512-fastrpc-9f3b691f8e2d

Best regards,
--  
Yijie Yang <yijie.yang@oss.qualcomm.com>


