Return-Path: <linux-arm-msm+bounces-108243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAliIW9EC2qsFAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 18:55:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C838357144C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 18:55:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E2010300BC54
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 16:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFE9648C8B2;
	Mon, 18 May 2026 16:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UxFBqabT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N4Ghzzlh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE8A494A0E
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 16:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779123255; cv=none; b=eL8PpDVNXKgDIBJZs/Z1dWRy5fMr0au09rpP08dNiQZjQQCwoP9BGtwB2RkRGVUrZzJBzQlsAHtdXSJtneNCURdZQLxi5qL/t9ytjoZ3UrlcdjAw8um2hvgB8dMuFFh9zRRYBWvt/vGUoMdZP5/lFx2F7UWha7x4wuoFSZO11vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779123255; c=relaxed/simple;
	bh=VNEhOKBhobQqQsoEuqNm9mT3JANz2GEoOzRTHnEsEfk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GrjuBkkLvvUP6T6dHLxUDRZ+Y8BMxgZ+AHdK0PRAhGRt54x5coRDWKwKvUBcm82Ed4QBBF7JJXPqIgq/qFLhbLuMqSYbxgZJb5w3mwAC1Fx0KoJZkt3ZEkFf6tHvVMFFC3Oh/c6yjzUeDvya9VOjv9dNvbxWZ1qHvnQ8KW8FtBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UxFBqabT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N4Ghzzlh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ICFwg32701076
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 16:54:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lqhBDm7fYqu
	6MvZpBtGOglNbnbUjw4oExZ0wnZT6Ids=; b=UxFBqabTecW5vlb0rcdi4JEnZdY
	S2KzrNM3MalVdZP+7TvZsnJ6P7DFYCPv1fpY1NLr1BPBXRANhXP7v10aadNWe8Ej
	xv9X78RGLQ+xtuIG4ay6gR5TqYsMQpruf5ax4UEF8XO9bgQy1ldytPcJdJoLrHXh
	3a46lG/I30HxLo4bQBr0Ta6nrFzZ7jRoqW0pNV5V1cXT1rleZB28dyy7s5VcD5bR
	qbdkiouMHpduyyAFmMV/or7DEopALCJY4DYUa2JOPWFdVkHv+gA7hNa6dMH2wuTD
	Fr0AzlCS9wwTex20pF1ViOLe7sPFC9gVsH4Ed9m9NPbtLpCsaCAjXQHLxiw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e82meh2cv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 16:54:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bd6aeb3637so66601085ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 09:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779123252; x=1779728052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lqhBDm7fYqu6MvZpBtGOglNbnbUjw4oExZ0wnZT6Ids=;
        b=N4GhzzlhAwB6y+o2Yb6SfVAZb7y0jsE+gHITUoiIIHbL+MjiE7tnX7+Mnqjx5XUlRh
         lyExfMYMJ4CYXuGKVXuUG6huf5jyIvW0so0UQu15SkE/OmEoQEPlVcPv09ECP2jSta7d
         vaCe7/Sr8WY2W+cwSmrKdQYpCnFZaR1FAZDnXcqBINuk1atg8Dit1kQQ9Zv3Q8nhdNVE
         1A6CjMvytW2Zv/RqtqGQh0PdJ/Iv3HFlmMFisjVVmN8wIcVKTBXiYPDnpUVyp5asD8tm
         fp5z6+dtLXi49YMzGO4yU1WiaNcUC5WvpYfE3H7/6JobaYgQoXijMQD+37iBEH88sRrw
         nbug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779123252; x=1779728052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lqhBDm7fYqu6MvZpBtGOglNbnbUjw4oExZ0wnZT6Ids=;
        b=ADafKiKvTTdR4UcCzwUScXHrYAjpYLDSw+K7GhkeLYiBHt5hyYBXc1yXl9/3mjuyh/
         qK/lj0VwTsFMCfo2WiQj8QxV57K5cGZgLMpj9koQZWCeFMG8rsKc58qRf8W1tvZwM9Ub
         K6TFIGE3FiuAAzpWcZGfpvA8ZMIeemzw9An+v1uDULDHHHUMbA+7AguNbyYImm6u9slm
         WupuwRF3fYiDZQo8v8HwBkMcufshma4jccDDEt1LgTapNRn5HMZEpQrQFglzRHIRZxnn
         BhStbcErDWYzCzdvD/8fCV8hsxRmythYtTg+JqSIXhUxtkVgiks8WFpCT0KGSYupZZSB
         fjfw==
X-Gm-Message-State: AOJu0YzfD4JXZxLLAym7EJz+P9ozDZ6lN0fPTLYgPBAaiSMxrODIy2TH
	MXImXpcv3mYSYbgtCYTsZof5FK5bzW5U9IhlD5FS75chu/xnVmFbutX9+ljZ/eOnX+7ZWMjlCd7
	qONDr5cVkmbbXoDQcjn7Tigd15GcrUWWRM3XXUUwxl1EeRxlhTuFmWWE5v3wm69QwB2xY
X-Gm-Gg: Acq92OEz5V7DEDDl/MSBa8BAlmOXEj20JYpWJLitZT8Of9BugEMzdpfbV3YBXAP/dy4
	WX58144aw9WWrKt+ZWz5pSP9mtHn8fWc/pFqXHGheRbtFCvAebTzcrRkTyDwzMXOnPRgaMpNFz8
	/CRxT8jB1DEhxu6OY9ZqGaaz/pPMNMUku6HmQgvWPzDJSaLwD/I/+wzNwQND7SPngdj85As2+sP
	wAuJ8RCq4iCTYb9kz/ch3vsGtRPfNXX8nSJHpI8AIYmxytv7wx37aVAj5FxIJkNzGkiPi8AvVPt
	Zr9e+3EzoEyyE7DhVGsdqMxXcEQ0D69i09wspoKpd579V8USVYVmGKT+XT9t25gn8bj+qK/irby
	R3GSPlUEZ0TGc77k6o/JzXvFh9YxX1RK1dTPS70eng+hp2DZR5c1IDg==
X-Received: by 2002:a17:903:8c4:b0:2bd:8fc0:1198 with SMTP id d9443c01a7336-2bd8fc01303mr150907325ad.5.1779123252203;
        Mon, 18 May 2026 09:54:12 -0700 (PDT)
X-Received: by 2002:a17:903:8c4:b0:2bd:8fc0:1198 with SMTP id d9443c01a7336-2bd8fc01303mr150906935ad.5.1779123251728;
        Mon, 18 May 2026 09:54:11 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5fc47sm149971045ad.10.2026.05.18.09.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 09:54:11 -0700 (PDT)
From: palash.kambar@oss.qualcomm.com
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org,
        andersson@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        abel.vesa@oss.qualcomm.com, luca.weiss@fairphone.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Palash Kambar <palash.kambar@oss.qualcomm.com>
Subject: [PATCH V1 2/3] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Document the Hawi UFS controller
Date: Mon, 18 May 2026 22:23:45 +0530
Message-Id: <20260518165346.1732548-3-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260518165346.1732548-1-palash.kambar@oss.qualcomm.com>
References: <20260518165346.1732548-1-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Tr7WQjXh c=1 sm=1 tr=0 ts=6a0b4435 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=dkR0I6OD3irOzcp_LXMA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: SNSiEEReLF0_DK9JG96hrpiaTq46ToFk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE2NiBTYWx0ZWRfX9pSNK/Qq1wF2
 Vn2GXqlW7QJxggPn5OlGoptXVQp4U+wVI0Pe+Qt3ZxQELdAANkiWR0tbq/lT+a12Q2aXw9ydUrE
 4ZBTkooo6ekHD7D+FnH36jPq/iUtZJK0B5ztk7SAlI5v/aRfuvF8OnDZSKhjvowdzfNqiWJwc6G
 TCwXuGxwtvNKDdgUFBQ/3vFsWCouLLYlopf9IhSSXqbU6Q5qkBb+wEmyK3D3rU6J60iT9dqzPwD
 gx1eb0UQAlcbP4KoyKcp98bD4p/9nOiqamE1updWJpSa+fOHabBzB4Gp64zJafhIC68M+/pYSJy
 eyE344WQbYrGsVV1mQeb8RuT9UuvwWoXh1lyIaCGs2sScF/ScxSubKUrrToZ5JRbETpg4XX4/n2
 /9SMSvToIdGN1LVYO1S0nQaVjeAXKnv1bFZeK8zbdOn3xzKSOdL67xBSzZsh07NA9vxRMHWbayl
 IzFw/VaLGJIFuXeqJew==
X-Proofpoint-ORIG-GUID: SNSiEEReLF0_DK9JG96hrpiaTq46ToFk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180166
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108243-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[palash.kambar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C838357144C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Palash Kambar <palash.kambar@oss.qualcomm.com>

Document the UFS Controller on the Hawi Platform.

Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
index f28641c6e68f..3de00affa4c6 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
@@ -16,6 +16,7 @@ select:
       contains:
         enum:
           - qcom,eliza-ufshc
+          - qcom,hawi-ufshc
           - qcom,kaanapali-ufshc
           - qcom,sm8650-ufshc
           - qcom,sm8750-ufshc
@@ -27,6 +28,7 @@ properties:
     items:
       - enum:
           - qcom,eliza-ufshc
+          - qcom,hawi-ufshc
           - qcom,kaanapali-ufshc
           - qcom,sm8650-ufshc
           - qcom,sm8750-ufshc
-- 
2.34.1


