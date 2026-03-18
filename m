Return-Path: <linux-arm-msm+bounces-98545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SK2JJm3numkpdAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 18:57:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B572C0C50
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 18:57:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90E913064E33
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 17:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08A342EAD1B;
	Wed, 18 Mar 2026 17:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pGpEEwyN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PZBEo0RE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39962F3614
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 17:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773854720; cv=none; b=sEH4o/Z3szJHbWEVn4fycw8yo2yvSHfQaw9JV2TE4blR4xD0ywlsvhyW6D+IMEC4OjiiiUKv7M0nB3ZRTQEMUsTunAaSdBA2CVAa460GGYvPQoDb/bT3odInXJmusJlOPZciFGPerFdN7diUiM28mtwIVwbhfEasduL4lger94A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773854720; c=relaxed/simple;
	bh=KAv6Q+TuL9G46M02q7N7q5Joc/Lm3J46P9USVQGUX9c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Z3ZOEV2rGv2vfGJEXhOqJxODrdEwJgLrSskAryLbG2M1bAaiF2CdWBsLeaQ+B9YJOSbhU4VuyFu+Wi/LCLoRaqAvEiGNdim4enRfFSjWjwfHqwY5iusy8kZgrrKNnxHlEVhrk6gOufpUoEcDi294/MSBngJHWX61nndVuGinsQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pGpEEwyN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PZBEo0RE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IFh4nm3770351
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 17:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jN/FxMj6I/osxAJ2YNnIqr
	vMPqtrzbMycapyb53uRX0=; b=pGpEEwyNoNA23eQKaMx2IKIsbXfBY4SJus472/
	RTHhNUFYrrPREDBQWX0oYTCFCrucM1QuGTAbl1eg9fAzfLTHqPBUxQIPprvp/Obe
	ak5LGz4v4SeOdz3Rs8T+eig+x/Q+Wmg4JXv/8XUEVSusruw8Tbm11odL3wdTf1Ql
	1/10je5BbAhO2Z/288vIc+/8UsAa5fYR/1+/4bNV+P8kJmWOH5XLYqYTYI6ldwsF
	SFyhiHTyqvKYefgf7Zi8GigZsG8PzQZwRDxtMounC0UXMf3spY72onCm06utSTLn
	soqaN0ZyPrMnR/43wzZxAarA6gLUSAVnPiCpbwDYBDeRCPfw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyqcdtfe8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 17:25:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5093a985e21so1533681cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773854718; x=1774459518; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jN/FxMj6I/osxAJ2YNnIqrvMPqtrzbMycapyb53uRX0=;
        b=PZBEo0RE78omvvENk9R/f+49TDaW4fdnXian7IRa8S6xmf6JTspe5y1BRhec4nyr8X
         5/FJ+39V3GNWYDPfvuOgjdTo5N8AnInlnj8EsmPJRH6UOJooNoB3hU+fkpDYGulNTb1U
         zsijdPRd90FH4MmLSoWYpjvy6MvmSuEhDhM5nTfR5pVbJFLOYmItUgbxo1g7Mo6PO1YB
         zyikrYC0BXjCNW0dzjM18P9QNbmUZ1EEVmdSAnOGWQIDSTScaV1WbOXSqbS6tJi5TkhQ
         PBRqgffY6S6Zif58rP3dY/UqBHwBdlSl3qcsiQRrG4RYIf4o3rjlir4Uxeks6//ZK7ai
         +TCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773854718; x=1774459518;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jN/FxMj6I/osxAJ2YNnIqrvMPqtrzbMycapyb53uRX0=;
        b=p7cQPbBCn6bmO8PIGU6H2TFV0Aw54rA23iFdXaYJbzMS5LhqlgRdhDA/a6L3T+jbv6
         pv2gGTvGZDEi7tgKhSuobS5oHF+8D3d85/tQ0oGADgSjRv1yWp1pZyCQvCubCcCWq7zJ
         Sjcd+TCRwvFGAES9hEkeJALsMbJirA0tfYuVSI6SVzozoD9Y3Qe70XOIofo/wBHrDl2R
         3k89S2w8pDUcNC82SAlthUxhmkmFNMzI34myx+c+dpQhMirYndLo9pyN56vCnfDIUGik
         Hm/2sggyuQI/uKgn6N0luCRB4qDcyl37FDy8X8V7OBu2qKqEd3xCt/nRjc2RtS36grdL
         Wptg==
X-Gm-Message-State: AOJu0Yw4Q48Ny9okV//csYcLhLuwSAKQrN6rYD0uIlXWERx0g27JFnNz
	UMH2tyPf6CJNdJyC805UG3EqhrAT8WthWzo6UUb2kc/ck8TH38/zFTlKAA2FBXe5ZbQpvRFAJL/
	QBafFxB3brzwM+DBajJIsnq+ObdTvWTwbJEa5M7CG2TMB9pQijj87c03txeNoscuNJrKu
X-Gm-Gg: ATEYQzxjXYJyzrri994DKnIaqSveOaAeMg+4Frg53mxYged0DkGZizNxHIpLyZal3cG
	nXtKSr8UaVeOwMoXqRFSim5N6rdv4Z8cZTG/2IEW63BJ2DqBv0agSQ9AxUh9Ta0ABcoTN60t4Ox
	7mPIW8gA/yvipdT4mRnxnBDQl9vQFjZRpBSTiwrWslDk6ccEo8PY+mNV6WC3GStl5LcNK6MWvPV
	e/ISMC8K93ySe5nWlcA7dVhgk9kC6sDj09z6Mbbq6l2jqNoNw+/pcG6jbn7Hh7JDR/jHbkQPLhj
	+eWRq8dktKS2IYroGtIFnP9mLI9zsRPWuFA1nz9FFeuYjDDDNzc38CTjRHgU64gL4gd4C8LrQn2
	pkz4BF+DoOK4Rt9ynp9GhnbvZZTk=
X-Received: by 2002:a05:622a:50a:b0:509:1cf9:ea16 with SMTP id d75a77b69052e-50b149045bemr54891991cf.70.1773854717909;
        Wed, 18 Mar 2026 10:25:17 -0700 (PDT)
X-Received: by 2002:a05:622a:50a:b0:509:1cf9:ea16 with SMTP id d75a77b69052e-50b149045bemr54891471cf.70.1773854717309;
        Wed, 18 Mar 2026 10:25:17 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8c350aesm4569535e9.4.2026.03.18.10.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 10:25:16 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 19:25:06 +0200
Subject: [PATCH v2] soc: qcom: socinfo: Add PM7550BA PMIC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-qcom-socinfo-add-pm8550ba-v2-1-2f9171af0465@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPHfumkC/42NQQ6CMBREr0K69hMKtCor72FYlP5WaoRCPxAN4
 e4WvICbSV4yb2ZlZIIzxKpkZcEsjpzvI+SnhOlW9Q8DDiOzPMtlVnAJo/YdkNeutx4UIgzdRYi
 sUVAKg1fOm1KiZNEfgrHufWzf6x/T3DyNnvbBvdE6mnz4HOcL33v//CwcOOBZWFSFEAXamydKx
 1m9otKlMVi9bdsXxUO+c9sAAAA=
X-Change-ID: 20260316-qcom-socinfo-add-pm8550ba-45ed911b46d6
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-7ae85
X-Developer-Signature: v=1; a=openpgp-sha256; l=1129;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=KAv6Q+TuL9G46M02q7N7q5Joc/Lm3J46P9USVQGUX9c=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBput/1JB85HVSS46p2/RJuiXKgHJcjNdM2tlJHa
 4TTkDwTOpCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCabrf9QAKCRAbX0TJAJUV
 Vv8OEADJWSPLShDhi9JWIWbNaoKWjN535qwQaRlBFjykNlcdbsVsi04fRdGSfsHHCxY9G52iyzA
 Pc/X5uOJ6zxrdpKMcCaoXXmRqVejsKHNElPG7VovJkzGrOzwIFRgxF88silksjEBnOCM/Dcvvas
 OZAUg0rWckN7gJFC0IfrZbZMuuqSQZWEUOzeuJa3BwLjdtWZHh/0dYUEx+U9nMoN2YVnqYnX93D
 4IuI0fOlqFuwmC9v+gyGhd75bNvcd0f8KYw+LQZD+5jgThgJ2yHi3hmbfJsRhPSoPjtAi0E47aL
 mlZ8JGiayeJM6QdGLHJEjJ5p/XHoE8wRtw7dDazNBQkmMj3qbbnQ88YAY329WHWOrG6BcnpjPqI
 CkCllEIeLAj5RHf0qz/QJ09ya6z9i1vEX6l+UaE8MgwA5wYu4QVGdH4x+HSEK/fGAjHDWRL5xrl
 S30qU+lWCz015EsAglFw1hZM6I20AveHVUzDFS+OkJ9cyhMy4bFf4twu2NXcYcAGIFTTGBOSXie
 FganqhGCOmXyxRNmkWLodiwuAjihx7qFCDzRj1UscQCL2qYEid/80Gv7QFK/aWlo3UBdxigjxYz
 7nrnVIxyPliUgVhh5ZYLcrxHRG92NeXLFki3OT4hGj+zfVsMBbwLim0mbCEeA0iVHW119StyL1X
 seHPXWZlzt08hig==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDE0OCBTYWx0ZWRfX8nW6k6ymbjsK
 EP9PBiq9BHd6JQktxzR0bTQqMvHxJksIWz7itYK1fFvRDbDn9D/HL0ANKqRenau+lI5xjCFXnJ9
 0ECuRaM1CJ4YzWDPGWEjVLXVJ5V8J58yKZCZ8eO2qoXSL9gLKE+/6OZHy44VFS+FAeRs8TD0gs+
 GjXyK7UKp5q7A7Xjgb2fk83ll8RJDlhDdqdrwOUzpsr8+EeCcUz4RBhfjVP2xnQ6dhLHHf1duG5
 3eRenadlWG6ee5nYLrG9B70Z+9PNQWFym+cg1FPuZeqOaAgGo5SWg3nk98dvNuQADMjniqVyIc1
 YTzPK+InmgKHx+hFDwGuE7czgNBd6TwGRp/quH7Wq5GlxqJpCot7zZl+UmHwjENRAMDFboXXAwR
 ii9rWRR2SyS/GedznD7gxnLm4ypeqwluOms51iX8q8sr5XHGjCbH5R0FRI+QaDmYH++Znr91F5X
 exF4cO+0nkRIBO2ah0w==
X-Proofpoint-ORIG-GUID: Wn3e912zYcxLGS6SdRxxJGMAL67LHh4-
X-Authority-Analysis: v=2.4 cv=H87WAuYi c=1 sm=1 tr=0 ts=69badffe cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=MQ5Bdr8bibr8oyMSx04A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: Wn3e912zYcxLGS6SdRxxJGMAL67LHh4-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180148
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-98545-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,msgid.link:url];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E9B572C0C50
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the PM7550BA to the pmic_models array.
It is one of the PMICs used by the Eliza MTP platform.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Rebased on next-20260317.
- Fixed typo in commit message. PM7750BA instead of PM7750.
- Picked up Konrad's R-b tag.
- Link to v1: https://patch.msgid.link/20260316-qcom-socinfo-add-pm8550ba-v1-1-d75fda3553df@oss.qualcomm.com
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index c7298e8f716e..802bf289626f 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -182,6 +182,7 @@ static const char *const pmic_models[] = {
 	[72] = "PMR735D",
 	[73] = "PM8550",
 	[74] = "PMK8550",
+	[76] = "PM7550BA",
 	[78] = "PMM8650AU",
 	[79] = "PMM8650AU_PSAIL",
 	[80] = "PM7550",

---
base-commit: 8e5a478b6d6a5bb0a3d52147862b15e4d826af19
change-id: 20260316-qcom-socinfo-add-pm8550ba-45ed911b46d6

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


