Return-Path: <linux-arm-msm+bounces-104569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHzNMOix7mlRwwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 02:46:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2607E46BBB6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 02:46:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4AC1300A8E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 00:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 010091A23B1;
	Mon, 27 Apr 2026 00:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="El+Wbhbo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SFUP5mj+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16B240DFB3
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 00:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777250789; cv=none; b=YnrumOzw5a1D02e6uBOcVHEwOgGM7qjZdeQVfntd7E365g6WITGYAWbHcWbu2BEke7R5F8PBpwjI1hpIIs6WyFdTYicyqQCJL3BAwphISdXRbvZMVpI3vEBDGWI3UI64OdbRprtE2iaTK8uu2wruJ5hfeW4Y3RoJEfJyzoWmhGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777250789; c=relaxed/simple;
	bh=oIcfdpG7eG8XSvtpKL7cgaYhau7r1ydchvgQknzsf8U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WCDwDpyJymwgZBNFLD6BAQL20j3Pgj4bH+ldinbERhUMA2f9rRKwQje01a1J/AhyBwYEM98pVZztM5IBmcFolJPVSlZE/Mu6sWz0vmRHlLZgeLJP0wLqfDU5N6QcqaM1NbbNpL4TiXWfZiMBjdOvGkY6CD0zufq+12Y9I8EGJ3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=El+Wbhbo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SFUP5mj+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QMUnIH1502678
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 00:46:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/6cpSorma6nZT0eFjtVtWXMVb52gYF/LATD
	tueDjI8I=; b=El+WbhbolOnbBnx5Mkol1v71SvLDrLNTpJAqR99yWohH4XW9qGg
	xvgGl+He6Tge3uYxkyAJQV95bkPLCNV/07CngpLrO7j+koPyy9vHHKG3LgBo8z6z
	efU2SI2Sad7tR2bx1fBqAwPATeIc9Z9WwxkPS3puimIKOpOpDgIQ552K7x0tjpve
	xlUL7JPH5dtGIeiLcp+C2xiBWAEkS+ZPJSf+syjdBruZkGhNl86XtdkeJspaEN+K
	qfcmksbAvMqm1WsOu+wNdjQual1SFZ3UdUgGnTvrrWzIeDxF+idluBtOExR4DzXH
	T+bZRA7Fp5xr7vQfHBoNK/ErJm8OF1UP65g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dsa4usrrw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 00:46:27 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2e60238adb1so23859507eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 17:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777250787; x=1777855587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/6cpSorma6nZT0eFjtVtWXMVb52gYF/LATDtueDjI8I=;
        b=SFUP5mj+AOBD/khoQZhwEo8G1Pmoh2+tjor+YPy23VnsIvYcYpomz7IPr6CrVcm3u9
         iG4Gw11s9nMjebpT3OfmmnzMkjqaK2T7kZp1SEzKzWmSSsq7yABa9+QMMDpsXnp+j3CX
         IIbQXdqdIHwkz9fAkEuVLkOFdjJJneNSwBkNQow5q4kSomeLcCgxZqQdqlowsR3jtV43
         bVgJ/gcpaRTvz+xsePADI6dyHVduhAZW/xGV+MyeefBBmmNV0Kn2HwH+VDgrNh2VjCgs
         9WfyJIUyFjhT2C63Z8zLCBnOoR9kMIVzLKpZjJaGJ05bAru1p7rFd7rm4E/BRIvfUCVt
         ByAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777250787; x=1777855587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/6cpSorma6nZT0eFjtVtWXMVb52gYF/LATDtueDjI8I=;
        b=R+TUEyTVK2Z3WqpBENTzCkze+VI2hNeMllzy/w4Lk9bopBVFWhwnqp/Z2ZyWI5WG5n
         X1O5sw+ltLMugxblCunqUxKOe6j8q9gUGKWrdoUhiK5CkJvhdCohFVxVzUg+dRx+b+Us
         OtiKC7SRGhDvgQQ78wb5EYdh/MqByHS9P8erQQ07Bnh9NyjGeIUYjufOXhc+KxrKkXlv
         ixIstyhH9+bmj9K/qqeAB7xvKiBDmb7hdbsQyn2j9SwJRkclAuxGLamwPR51RaL5C/Nk
         svTZLx+Na3Ty3Ah7IUk1eudnJZ9bDXFphRIzCLMulE4m6XVI3ams/+ktBe5gOSCGwu7w
         yFZg==
X-Forwarded-Encrypted: i=1; AFNElJ+o7WQlxA8exFP+s4yHLYvgBYE+Qcf2uHQ3Z5pOsA1NA/mTAgLIf/Gh2Anso29aYGYEKorlQAhABT38Qk2z@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2D/+duIkv26ip8frGWF3ZMjgyn5qfkX3MrY6bD6A5Zc245Y7V
	GXOC1ZY0oBu7SBLCXGUqGIvBGMKj6aAf0iqouJC2+SW2mI72Czdte3WBBYW8gpfzOd1ulT6sI68
	U9ieJBvvhjUUKpUFZN2LZAYuPg2epMl80Pbi2KMDH+hY1nv51i4DkEAIY1G+XmlTo0gSc
X-Gm-Gg: AeBDievgw/5AAXk0Yq/grTBatISOTrNPKO7yq42pniwg6epKCq/bh1O5512c2FguF/R
	ciPC+NmkZIpgEYyaznTKjYUkKMR/ShzdkiUwNyre9vUwg73o8isIId6zvhmMlu0YF4Jfy9yQyCg
	nCdXutmGAVLNoXrLcxE1Z346X6+qW1mSA324S3PkZNLVboelbnLwe+B7HdunFf9JHWH9fgooPB4
	p4e5bGZKEdxeR/iZV/Ul2FhcmqlE+wH/0m7lWNEiGQAtkUjVdMSUnBXzUb/5R4EOORuo+MdkSDu
	ajsHXAeT4VdgU6t+mau20+sSK7zwt9/B9iX/kqzzqu/6IcpjDUik7QeEPBH3VWPgltT40vwWRN2
	0ybaw6HWoU9DFJOSS6SAdqz8yZsoA6p0da/N9Uja1ny6Uusg9Ppl2dXGMvvPQ9KXoNSsSF3bjQa
	t+KWHAISrnAfGT83aQ
X-Received: by 2002:a05:7301:f0e:b0:2e6:ff79:e34c with SMTP id 5a478bee46e88-2e6ff7a0431mr13152214eec.8.1777250787152;
        Sun, 26 Apr 2026 17:46:27 -0700 (PDT)
X-Received: by 2002:a05:7301:f0e:b0:2e6:ff79:e34c with SMTP id 5a478bee46e88-2e6ff7a0431mr13152201eec.8.1777250786625;
        Sun, 26 Apr 2026 17:46:26 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ac84c38sm42529350eec.13.2026.04.26.17.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 17:46:26 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH RESEND] dt-bindings: arm: cpus: Add compatible qcom,oryon-1-5
Date: Mon, 27 Apr 2026 08:46:19 +0800
Message-ID: <20260427004619.229843-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Sdm97dotFnPyArUz3JoLMGxsXruLrhEE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAwNSBTYWx0ZWRfX/CzAEvYpTT2w
 F95FIrlWMrwqC+1oMans3AeUuI4ZNgkZaMjohB3Ea6AWpkyKxyXzejrJtZANfKpz0c2psGEuI+G
 l3ieht57g8G+flgAKmPMN5tRKf7yfBxYHujjaOIvqqe5Eh6Yu8ai3w+9dvmROvUTv9UUgXRoKOV
 zbNgoP34ZtARPeNCMU8vXkeEQZgEozE8u2gIdOaPn+vGvnspBQAcKFITmbcazZ8Cp2lYUexbbhK
 jwNq0McFWENXwc1yPPVIvGSA/Y2Y/KMqqe/jpd2fRqjymOZZj6nYsSCjlOa/sPX7kA+WsmZp0gh
 zsZS2JGENBIbpVdD9nPp/6Vn7CR3Tdet34KdXPayadpsUC0VKrAkg+STBe5mAHLlnsohk1dPhx4
 lUGio+h751dz2DQqPhFSHEAj/sZXBLf9YTCMRPiL03oUuP6RXLF5PBUEg6dhAXz4T0V3+tT366X
 y1vlNyLlkrRv+1d8a+A==
X-Proofpoint-ORIG-GUID: Sdm97dotFnPyArUz3JoLMGxsXruLrhEE
X-Authority-Analysis: v=2.4 cv=J/GaKgnS c=1 sm=1 tr=0 ts=69eeb1e3 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=cSziVDP4AAAA:20
 a=EUspDBNiAAAA:8 a=uuEWxox96XwQUwFBWecA:9 a=bBxd6f-gb0O0v-kibOvt:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270005
X-Rspamd-Queue-Id: 2607E46BBB6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104569-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Qualcomm Oryon 1-5 is found on Nord SoC.  Add compatible for it.

  $ cat /proc/cpuinfo
  ...
  CPU implementer : 0x51
  CPU architecture: 8
  CPU variant     : 0x5
  CPU part        : 0x001
  CPU revision    : 4

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Notes for resend:
 - Rebase on v7.1-rc1
 - The user of this binding (Nord DTS) can be found here [1],
   and will be sent for public review shortly.

[1] https://github.com/qualcomm-linux/kernel-topics/blob/early/hwe/nord-next/arch/arm64/boot/dts/qcom/nord.dtsi

 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 5f5ff5e51e51..5be89c584026 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -223,6 +223,7 @@ properties:
           - qcom,oryon-1-2
           - qcom,oryon-1-3
           - qcom,oryon-1-4
+          - qcom,oryon-1-5
           - qcom,oryon-2-1
           - qcom,oryon-2-2
           - qcom,oryon-2-3
-- 
2.43.0


