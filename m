Return-Path: <linux-arm-msm+bounces-100377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJcCKt2vxmmiNgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 17:27:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAC83476A3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 17:27:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DC6730A3DFF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 16:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF132344DBE;
	Fri, 27 Mar 2026 16:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N61XqqyI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SsWdARku"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1EEBA45
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 16:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774628335; cv=none; b=C0TAJxvPp/m6ojA5rBrGI3ORD+ErJJ1/mq3MUP6+0yNPhrl4f+xgY6JEkELbj/VLJMCya9XK/kVg5K3m2W9bvaJrENRfaWignpoY6GU0fyk0Uhg5zTjzAKKp5YhtbhAgHLrQWlndTgaTtOJ3p/+Z9+ghaw/fSMwFPthtPb9ITaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774628335; c=relaxed/simple;
	bh=mDOKiKjD0SsH0fUKrRzpofcnlxKOQKAEDUyFaKqfPq4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SCc+90SSkcrEZM5vlRRN7A+q2ZshvyFJoJshVPQ2MgpS7FvbgXgrR94OWV7s7sFpv621nsTYYbOLUgKVvQk23YvL+B5my03PspupkMhj0iz3nPdsT+tn5YQkWiG/BDF2lkzYwl6FLP9HK9pMuKBE10qCdz90OjmCF6qaBnr4voo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N61XqqyI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SsWdARku; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RFL0D4536957
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 16:18:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+54wPLDvzjcJ7ZhEYij8uY
	aNhbtItXghLTwIlPdmdtg=; b=N61XqqyIMvIZj7J7X8/2egD/wlNrgl2fvDMlHp
	rKpXFYGNweCEofZ6vWcxg5/EUCnDA/yK1sPeA5aB/TCH+tPpe/9ptANisAfCtVW9
	engLUJl1P4NH68QFJ8DSzVzaVDuqiADAA6/OsRXId2QEPqo6Bzh7r1meFsdP9KHs
	enEkyI/1dNt/Xct/i6jkyjtkJPj94mYLy0CoCqH+i0aCZDoifQ0YCLWrxbC37jrC
	/i/1/iZahRNBen3dR4AY2/t6z32xuljm1PQxMYEK2vAWZvAtAl0w8hxSpqdu0BMH
	R/MXts2+Mk7NYzyGyp1v83MNd1ZC0CTY4eoFzFnr321LMrHw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5vf6r65e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 16:18:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b274f94f8so49668951cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774628333; x=1775233133; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+54wPLDvzjcJ7ZhEYij8uYaNhbtItXghLTwIlPdmdtg=;
        b=SsWdARkuwf0CwmCVehTV0TlTS67lZn/8NOXTluFDljX69gFw0KQ/lA/NX+8a/Xmn0z
         39+rxHKwpilOFByWSOYB+fm1gDLLW19AfZ8wUgfFXVcVZ2drcvp4ouFiHX7wzGvkSidH
         cWR0J/Pd1h3X1qNEvXIwmDc1OUwddsPcIGOouArwpEO8c9kgBsWWwdzO2vPEEHTRxot4
         uo+dvQOM0MCU36RIlIqT0hru6cM+QdMjOkRzvjlC/rn+ENaJ7cV+94k0WlvRnxhzHfKZ
         OZFbqpaOWPHU7wtkAU0h5qv5uwM8KjHGZbRlMLyz+2VTRtlesLTuWIZ/VRezuuq2bOgJ
         OgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774628333; x=1775233133;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+54wPLDvzjcJ7ZhEYij8uYaNhbtItXghLTwIlPdmdtg=;
        b=BXPMpky9p1KlTU8iyIQ7ZAD0HZlOTh+sRx82my5QXhWoRKmVe8M+fggg+NqLgKhkFJ
         laVi2S3FDzrELa86V0OfqP6VHaL5010ch7jc64viNvZN+h+8rBUvW/KasM7CzvcyuLyo
         WJKFYQLqpM/hhvb4NY9TKXdS7mGMygVgWYhiX69oV7CQNmuG8SND3R/jEiqM7blZgPfY
         +m0EgDSndu37u4YjpwtznRwegUBzebd6XxxSsg9vRSwTG3cDjz7oQLs/f1bIrFKCSTtg
         3TaDH6zxGv4zqjwSJqUMiQGXg+/kriDVn3jztjWqv32rf58tp28mzMQratRPPfGyKyzo
         Ax+Q==
X-Gm-Message-State: AOJu0YzhkknMwntXUrgd7kyJ71qXIG/mZKtmHHdq1DlWCCCZ40MxjJ6h
	wlwihl17Ll1UbB7QeUXQSxz0ddY0ZjX6dyEyW1GG7cDQ+/l3PM0CgLvKlidHP30RqLnmv7t3ys7
	YfgKKKhD6rzsKckp/IDnnNZoTK8Vm4hsBML1lQHL0kU6+CKgzlVqT75C+suHRP+OInAsJ
X-Gm-Gg: ATEYQzyXNgqD694RuhvlKHN6mr8TOw/ac85limdq3ma0ksn8heG/FD7ZObF4yoMDjkJ
	5q193CXva51lgXcZaxureS7OWT0DN47zp73drCfWR12kLtDqNcFVrHSBusi+T6IPRxJGh2sLf0n
	Nx+0v6KZpiXWbnpeOTwN8tu8qfsKAiN6A2QU6JNMG4WXXCmROz2j4XkFKxPLToP7OKz2Wj+ztLW
	+RY+pZzwipd6ib982vo2/6Fi38PaqyS17yyC15VN/G9oqWdl+ivBWroJr6klWOeQVs3Oir4hjVs
	B2UN8RmULRjLk69Tsyahzu8n5j37tDZdgOfkqOhxJkqHLc2kvjxAXyjj/UEZB1xFRMR/NPNWYb6
	rsqmenahNmeT7YhS4vdqjs8U6zxU=
X-Received: by 2002:a05:622a:312:b0:50b:3ef9:7985 with SMTP id d75a77b69052e-50b994a4a8dmr69757501cf.26.1774628332951;
        Fri, 27 Mar 2026 09:18:52 -0700 (PDT)
X-Received: by 2002:a05:622a:312:b0:50b:3ef9:7985 with SMTP id d75a77b69052e-50b994a4a8dmr69756991cf.26.1774628332408;
        Fri, 27 Mar 2026 09:18:52 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c6b495sm205955525e9.2.2026.03.27.09.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:18:51 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/2] remoteproc: qcom: pas: Add supoport for Eliza ADSP
Date: Fri, 27 Mar 2026 18:18:37 +0200
Message-Id: <20260327-eliza-remoteproc-adsp-v1-0-1c46c5e5f809@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN2txmkC/yXMywrCMBBG4Vcps3agjWLAVxEXufzVEW3CTBWx9
 N2NuvwW5yxkUIHRoVtI8RSTMjUMm47SJUxnsORmcr3b91vnGTd5B1bcy4yqJXHIVnkMPseY/JD
 9jlpbFaO8ft/j6W97xCvS/J3Run4ATkLTFnkAAAA=
X-Change-ID: 20260327-eliza-remoteproc-adsp-fa7dbbc71d74
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=865;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=mDOKiKjD0SsH0fUKrRzpofcnlxKOQKAEDUyFaKqfPq4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpxq3fzc4O8uQ/HkjYu6bMYG5dRmE4is/O3JjAf
 68h2PL2ATiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacat3wAKCRAbX0TJAJUV
 VpD1D/4350o4dqP/nB4w32wZ1ElcbMBJvtCO0JOgEKEUzNXX3XtbXw6y3zOUlOKrDRMghdHR5/f
 +TICk+eU2cp/fkV0XPsbhIqKCZYIlxr7laYpkNWnQLuHY40gNA43EvdQd76qLwtzLgs5L+XKSvN
 /HLLsXaU9XG+eOvoBM+GY0wRmZ9ombMJgvKSnWRaEl3BDQH+5a9IDmausmtH4YWIB2BzjjyRZvo
 3ObN4MlrpvNr4XSB1jWlaWo+GBsPGyJK/zubb1EJmk0eU2NeDjvdkgtmY3pd0rQc5tuQCcm8oHY
 VIIlRRKEqEzXjletULVDlzhoNPsdBKozcyrPYsu7kO0kSI7ykvr0Dvig8ThwfxaCIZsxMVER7Mb
 7hRXm052MEpL+InBONqAEHBtcmrZpcFgH5o+n8u1Go1BH5lRj51OeZzRrh6KJupkWeKVqOvtbRz
 Kt5QjaffbcAGDbA6ChAWLnK0vSvXyKotEICR/4x1a/Tf01XxqnXba+/qecE4JYYciWnMQPg2Mob
 at1mVXEbwOvoU0JVRF4CyBz/vd26PqKNYjdEeKi8++l83BFRIZQwYwxuhPu4lz84STlsocHdOQP
 GJtp3HOiYI24P6GgwORIvLbHnmHXq88mMhFSlqBPzwCorWEVwqWDpVW1JDoXy3FyjIWBjSeBxjY
 xPa8J8TujZ1cOqQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=X/Zf6WTe c=1 sm=1 tr=0 ts=69c6aded cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=_2eu1SGtFr4sOAyhaxkA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: UkgNSwK11Xqatp0jSBC3l9S1z55emYMv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEwNiBTYWx0ZWRfXxsz6V4WAJJo6
 qRX0i9OOQdEO3om14L1mBFYPgM++mJvWljgnSZsJatCDixXjQAhS6Bqtd35ijAUEhTYiTmYiu7F
 uENdvvmSZiD2QYlRMjJRvOSP1aeSWyN2rccyPHjmM3ZH+/0CItDsB6mryd3yLzySgM9ol9umhSh
 DSmZ0XYxWBq7YvT2g6KizhosiCP0+V48/AnLE24aKmg046Yiq68b9gnzoFwN8B54pIeKye/OACZ
 Baxx/7RQ3+i/VJb5bqzFGVhJ7ANsogL9mHv/oy4z2cgodPTjlBmUqWt+WypE0X/QWkDv0qL0Yg8
 BU5+GIOC0e7HN/w3acaWUPe0uo8bIVWwRwib4ZvBnPRDINcRpA5ZQvJwlkqqMh3lpF5m0qjGntI
 G3XrQdSfKsg+BhiwvTXPHEjU3bIAYtzZZ9SlbOZ7xFxF1tlZ5Phc3D87fAn22D1DQJpCigU0VQ/
 jBwYjIurG1XzbgaR5vA==
X-Proofpoint-GUID: UkgNSwK11Xqatp0jSBC3l9S1z55emYMv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0
 spamscore=0 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270106
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100377-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1FAC83476A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for ADSP remoteproc found on Qualcomm Eliza SoC.
The rest of the remoteprocs will come later.

Instead of adding a dedicated bindings schema, just reuse the Milos one
as bindings are exactly the same.

Then, just add the compatible and reuse the SM8550 configuration in the
driver.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (2):
      dt-bindings: remoteproc: qcom,milos-pas: Document Eliza ADSP
      remoteproc: qcom: pas: Add Eliza ADSP support

 Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml | 3 +++
 drivers/remoteproc/qcom_q6v5_pas.c                               | 1 +
 2 files changed, 4 insertions(+)
---
base-commit: e77a5a5cfe43b4c25bd44a3818e487033287517f
change-id: 20260327-eliza-remoteproc-adsp-fa7dbbc71d74

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


